# 066: Query Profile Spilling

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-16
**正答**: A, C

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Query Profile（クエリプロファイル） | クエリの実行詳細を可視化するSnowsightの機能。各ステップの統計情報（スキャン行数、スピル量など）を確認できる |
| Bytes Spilled to Local Storage | クエリがWHのメモリに収まらず、ローカルディスク（SSD）に溢れたデータ量。IO操作が増えるため性能低下の原因 |
| Bytes Spilled to Remote Storage | ローカルディスクも不足し、リモートクラウドストレージに溢れたデータ量。ローカルよりさらに遅い |
| Partition Pruning（パーティションプルーニング） | クエリに不要なマイクロパーティションを読み飛ばす最適化。スキャン効率を向上させる |
| Metadata Cache（メタデータキャッシュ） | テーブル統計情報をCloud Servicesレイヤーが保持するキャッシュ。COUNT(*)などWH不要で結果を返せる |

## 1-2. 重要コンセプトまとめ

- **スピル（Spilling）** = メモリに収まらないデータがディスクやリモートストレージに溢れること
- スピルの影響: ローカルスピル → IO増加で遅延、リモートスピル → さらに遅延
- スピル解消の方法: **より大きなウェアハウスを使用**（RAM・ローカルストレージ・並列度が増加）
- Query Profileでスピルが表示される = そのステップがWHメモリに収まっていない証拠
- パーティションプルーニングやメタデータキャッシュとは**別の統計情報**であり混同注意

## 1-3. 公式ドキュメントURL

- [Queries Too Large to Fit in Memory](https://docs.snowflake.com/en/user-guide/ui-query-profile#queries-too-large-to-fit-in-memory)

---

## 2-1. 問題文（英語）

> Consider the query profile for a specific step in a query.
>
> Which of the following accurately describes the highlighted statistics? Select all that apply.
>
> A. A larger virtual warehouse size will likely reduce local and remote spilling.
> B. The query profile indicates effective partition pruning.
> C. The query profile indicates that the step is too significant to fit in the virtual warehouse memory.
> D. The query profile indicates that the metadata cache was used.

## 2-2. 問題文の文法解析

### 文1: "Consider the query profile for a specific step in a query."

- **主語 (S)**: （命令文のため省略 = You）
- **動詞 (V)**: Consider
- **目的語 (O)**: the query profile
- **修飾語 (M)**: for a specific step in a query
- **文型**: SVO（命令文）
- **注目ポイント**: 「Consider」で始まる命令文。「シナリオを考慮せよ」というシチュエーション提示パターン。

### 文2: "Which of the following accurately describes the highlighted statistics?"

- **主語 (S)**: Which of the following
- **動詞 (V)**: accurately describes
- **目的語 (O)**: the highlighted statistics
- **文型**: SVO
- **注目ポイント**: 「highlighted statistics」でスクリーンショット上のハイライト部分を指す。画像問題のパターン。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| spilling | 名詞/動名詞 | スピル（メモリから溢れること） | Reduce local and remote spilling. |
| significant | 形容詞 | 大きい、重要な | The step is too significant to fit in memory. |
| fit in | 動詞句 | ～に収まる | The operation doesn't fit in memory. |
| partition pruning | 名詞句 | パーティションプルーニング | Effective partition pruning reduces scanned data. |

## 2-3. 問題文（日本語）

> クエリの特定のステップのクエリプロファイルについて考えてください。
>
> ハイライトされた統計情報を正確に説明しているのは以下のうちどれですか？該当するものをすべて選んでください。
>
> A. より大きな仮想ウェアハウスサイズにすることで、ローカルおよびリモートスピルが減少する可能性が高い。
> B. クエリプロファイルは効果的なパーティションプルーニングを示している。
> C. クエリプロファイルは、そのステップが仮想ウェアハウスのメモリに収まるには大きすぎることを示している。
> D. クエリプロファイルはメタデータキャッシュが使用されたことを示している。

---

## 3-1. 解説文（英語）

> Snowflake saves data on the warehouse's local disk if it can't fit an operation into memory. Data spilling slows down queries because it requires more IO operations, and disk access is slower than memory access. "Bytes spilled to local storage" indicates local spillage. Snowflake will spill data to remote cloud storage if the local disk becomes full, which is even slower storage than the local disk, making this operation even slower. "Bytes spilled to remote storage" in the query profile indicates remote spillage. One of the ways to avoid spilling is to use a larger warehouse, which will increase the overall available RAM, local storage, and parallelism and might be able to fit the query in memory.

## 3-2. 解説文の文法解析

### 文1: "Snowflake saves data on the warehouse's local disk if it can't fit an operation into memory."

- **主語 (S)**: Snowflake
- **動詞 (V)**: saves
- **目的語 (O)**: data
- **修飾語 (M)**: on the warehouse's local disk / if it can't fit an operation into memory（条件節）
- **文型**: SVO
- **注目ポイント**: 「if it can't fit ~ into ~」で「～を～に収められない場合」。条件節でスピルの発生条件を示す。

### 文2: "Data spilling slows down queries because it requires more IO operations, and disk access is slower than memory access."

- **主語 (S)**: Data spilling
- **動詞 (V)**: slows down
- **目的語 (O)**: queries
- **修飾語 (M)**: because it requires more IO operations, and disk access is slower than memory access（理由の副詞節）
- **文型**: SVO
- **注目ポイント**: 「slows down」で性能低下を示す。理由を2つ（IO増加 + ディスクの遅さ）並列で提示。

### 文3: "One of the ways to avoid spilling is to use a larger warehouse, which will increase the overall available RAM, local storage, and parallelism and might be able to fit the query in memory."

- **主語 (S)**: One of the ways to avoid spilling
- **動詞 (V)**: is
- **補語 (C)**: to use a larger warehouse
- **修飾語 (M)**: which will increase ... and might be able to fit ...（非制限関係詞節）
- **文型**: SVC
- **注目ポイント**: 「One of the ways to ~」で解決策を1つ提示。「which」以降で大きいWHの3つのメリット（RAM・ストレージ・並列度）を列挙。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| spill | 動詞 | 溢れる、スピルする | Data spills to local disk when memory is full. |
| spillage | 名詞 | スピル（溢れ） | Local spillage is indicated in the profile. |
| slow down | 動詞句 | 遅くする | Spilling slows down queries. |
| parallelism | 名詞 | 並列度 | A larger warehouse increases parallelism. |
| fit ~ into ~ | 動詞句 | ～を～に収める | Fit the query into memory. |

## 3-3. 解説文（日本語）

> Snowflakeは、操作がメモリに収まらない場合、ウェアハウスのローカルディスクにデータを保存します。データスピルはクエリを遅くします。これはより多くのIO操作が必要になり、ディスクアクセスはメモリアクセスより遅いためです。「Bytes spilled to local storage」はローカルスピルを示します。ローカルディスクが満杯になると、Snowflakeはリモートクラウドストレージにデータをスピルします。これはローカルディスクよりもさらに遅いストレージであり、操作をさらに遅くします。クエリプロファイルの「Bytes spilled to remote storage」はリモートスピルを示します。スピルを回避する方法の1つは、より大きなウェアハウスを使用することで、これにより利用可能なRAM、ローカルストレージ、並列度が増加し、クエリをメモリに収められるようになる可能性があります。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
