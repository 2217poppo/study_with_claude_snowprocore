# 102: Query Performance — Bytes Spilled to Local Storage

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-17
**正答**: C, D（クエリの最適化 / ウェアハウスサイズの拡大）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Bytes Spilled to Local Storage | Query Profileで確認できる指標。処理データがウェアハウスのメモリに収まらず、ローカルSSDに書き出された量 |
| Bytes Spilled to Remote Storage | ローカルSSDにも収まらず、リモートストレージ（S3など）に書き出された量。より深刻な問題を示す |
| Query Profile | Snowsightで確認できるクエリの実行詳細。各ステップのコスト、スピル量、パーティションスキャン数などを確認できる |
| Partition Pruning | クエリの条件に基づき、読む必要のないマイクロパーティションをスキップする最適化 |
| Spilling | クエリがメモリ不足になり、データをディスク（ローカルまたはリモート）に一時書き出しすること。パフォーマンス低下の原因 |
| Clustering | テーブルのデータをクラスタリングキーで物理的に並べ替え、パーティションプルーニングの効率を上げる手法 |

## 1-2. 重要コンセプトまとめ

- **スピルの対策は2種類：メモリを増やすか、処理するデータを減らすか**
  - ウェアハウスサイズを上げる → RAM・ローカルストレージ・並列度が増加しメモリ収容量が上がる
  - クエリを最適化してパーティションプルーニングを促進する → 処理するデータ量が減り、メモリ負荷が下がる
- **Multi-Clusterウェアハウスはスピルの対策にならない**
  - Multi-Clusterは並列クエリの数を増やすが、個々のクエリが使えるメモリは変わらない
- **ウェアハウスの再起動はウェアハウスキャッシュをクリアするが、スピルの改善にはならない**
  - むしろキャッシュクリアはパフォーマンス低下の原因になる
- **テーブルのクラスタリングもスピル対策に有効**
  - 読み込む必要のないデータを削減できるため、メモリ要件が下がる

## 1-3. 公式ドキュメントURL

- [Queries Too Large to Fit in Memory](https://docs.snowflake.com/en/user-guide/ui-query-profile#queries-too-large-to-fit-in-memory)
- [Query Profile Overview](https://docs.snowflake.com/en/user-guide/ui-query-profile)

---

## 2-1. 問題文（英語）

> A query executed in Snowflake took a long duration to complete. The Query Profile shows that the "Bytes spilled to local storage" was a large number. How can the query performance be improved? Select all that apply.
>
> A. Run the query on a multi-cluster virtual warehouse.
> B. Restart the virtual warehouse to clear the local disk cache.
> C. Rewrite the query more optimally so that the partition pruning occurs and the query needs to process less data.
> D. Increase the size of the virtual warehouse so that more data can fit in the memory.

## 2-2. 問題文の文法解析

### 文1: "A query executed in Snowflake took a long duration to complete."

- **主語 (S)**: A query executed in Snowflake（過去分詞句で修飾）
- **動詞 (V)**: took
- **目的語 (O)**: a long duration
- **不定詞**: to complete（目的・結果）
- **文型**: SVO
- **注目ポイント**: `took a long duration to complete` = 完了するのに長時間かかった

### 文2: "The Query Profile shows that the "Bytes spilled to local storage" was a large number."

- **主語 (S)**: The Query Profile
- **動詞 (V)**: shows
- **that節**: that the "Bytes spilled to local storage" was a large number
- **文型**: SVO（that節が目的語）

### 文3: "How can the query performance be improved?"

- **疑問詞**: How
- **主語 (S)**: the query performance
- **動詞 (V)**: can be improved（受動態 + 助動詞）
- **文型**: SV（受動態）

### 選択肢Cの文法: "Rewrite the query more optimally so that the partition pruning occurs and the query needs to process less data."

- **命令文動詞 (V)**: Rewrite
- **目的語 (O)**: the query
- **修飾語 (M)**: more optimally
- **目的の副詞節**: so that the partition pruning occurs and the query needs to process less data
- **注目ポイント**: `so that + S + V` = 〜するように（目的を示す接続詞）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| spill | 動詞 | あふれ出す、こぼれる（技術的: ディスクに書き出す） | Data spills to local storage when memory is full. |
| duration | 名詞 | 所要時間、期間 | The query took a long duration to complete. |
| optimally | 副詞 | 最適に | Rewrite the query more optimally to improve performance. |
| partition pruning | 名詞句 | パーティションプルーニング | Partition pruning reduces the data scanned. |
| fit in | 動詞句 | 〜に収まる | More data can fit in the memory with a larger warehouse. |

## 2-3. 問題文（日本語）

> Snowflakeで実行したクエリの完了に時間がかかりました。Query Profileには "Bytes spilled to local storage"（ローカルストレージへのスピル量）が大きな数値であることが示されています。クエリのパフォーマンスを改善するにはどうすればよいですか？すべて選んでください。
>
> A. マルチクラスター仮想ウェアハウスでクエリを実行する。
> B. 仮想ウェアハウスを再起動してローカルディスクキャッシュをクリアする。
> C. パーティションプルーニングが発生し、クエリが処理するデータ量が減るよう、クエリをより最適に書き直す。
> D. より多くのデータがメモリに収まるよう、仮想ウェアハウスのサイズを大きくする。

---

## 3-1. 解説文（英語）

> One of the ways to avoid spilling is to use a larger warehouse, which will increase the overall available RAM, local storage, and parallelism and might be able to fit the query in memory. Another way to optimize a query that spills a lot of data is to limit the number of rows that must be processed. Sometimes this may be achievable by rewriting the query more optimally. Clustering a large table can also help since it allows Snowflake to read only the necessary subset of the data, thus reducing the memory requirement. https://docs.snowflake.com/en/user-guide/ui-query-profile#queries-too-large-to-fit-in-memory

## 3-2. 解説文の文法解析

### 文1: "One of the ways to avoid spilling is to use a larger warehouse, which will increase the overall available RAM, local storage, and parallelism and might be able to fit the query in memory."

- **主語 (S)**: One of the ways to avoid spilling
- **動詞 (V)**: is
- **補語 (C)**: to use a larger warehouse（不定詞句）
- **関係詞節**: which will increase the overall available RAM, local storage, and parallelism and might be able to fit the query in memory
- **注目ポイント**: 
  - `One of the ways to ~` = 〜するための方法の一つ
  - `which` による非制限用法の関係詞節（a larger warehouse を補足説明）
  - `fit the query in memory` = クエリをメモリに収める

### 文2: "Clustering a large table can also help since it allows Snowflake to read only the necessary subset of the data, thus reducing the memory requirement."

- **主語 (S)**: Clustering a large table（動名詞句）
- **動詞 (V)**: can help
- **理由節**: since it allows Snowflake to read only the necessary subset of the data
- **付帯状況**: thus reducing the memory requirement（分詞構文）
- **注目ポイント**: 
  - `thus + 現在分詞` = その結果〜することになる（分詞構文による結果）
  - `allow A to B` = AがBするのを可能にする

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| parallelism | 名詞 | 並列度 | A larger warehouse increases parallelism. |
| achievable | 形容詞 | 達成可能な | This goal is achievable by rewriting the query. |
| subset | 名詞 | 部分集合、サブセット | Clustering allows reading only the necessary subset. |
| thus | 副詞 | その結果、それゆえ | Data is reduced, thus lowering memory requirements. |
| requirement | 名詞 | 要件、必要条件 | The memory requirement is reduced with clustering. |

## 3-3. 解説文（日本語）

> スピルを回避する方法の一つは、より大きなウェアハウスを使用することです。これにより利用可能なRAM・ローカルストレージ・並列度が全体的に増加し、クエリをメモリに収められる可能性があります。大量のデータをスピルするクエリを最適化するもう一つの方法は、処理しなければならない行数を減らすことです。クエリをより最適に書き直すことで達成できる場合があります。大きなテーブルをクラスタリングすることも有効です。Snowflakeが必要なデータのサブセットのみを読み込めるようになり、メモリ要件が削減されます。

---

## 復習メモ

- [ ] スピル対策（ウェアハウス拡大・クエリ最適化・クラスタリング）を理解した
- [ ] Multi-Cluster / 再起動がスピル対策にならない理由を把握した
- [ ] `thus + 分詞構文`、`allow A to B` の文法パターンを確認した
