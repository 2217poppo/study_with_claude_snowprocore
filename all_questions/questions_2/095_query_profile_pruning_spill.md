# 095: Query Profile Pruning and Spill

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-14
**正答**: A, C

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Ineffective Partition Pruning | Partitions Scanned ≈ Partitions Totalの状態。フルテーブルスキャンが発生しプルーニングが機能していない |
| Bytes Spilled to Local Storage | メモリに収まらずローカルSSDに書き出されたデータ量。WHサイズが小さいことの兆候 |
| Bytes Spilled to Remote Storage | ローカルSSDでも不足しリモートクラウドストレージに書き出されたデータ量。さらに深刻 |
| Data Spilling | 処理がメモリに収まらずディスクに書き出される現象。パフォーマンスが低下する |

## 1-2. 重要コンセプトまとめ

- Query Profileの統計から読み取る2つの問題:
  1. **Ineffective Partition Pruning**: Partitions Scanned = Partitions Total → フルスキャン
  2. **Query too large for memory**: Bytes Spilled > 0 → メモリ不足でスピリング発生
- Spilling の2段階:
  - Local Storage Spill → ローカルSSD（やや遅い）
  - Remote Storage Spill → リモートクラウド（非常に遅い）
- Query Result Cacheの使用はスピリングとは無関係（ひっかけ）
- Metadata Cacheの使用もスピリングとは無関係（ひっかけ）

## 1-3. 公式ドキュメントURL

- [Queries Too Large to Fit in Memory](https://docs.snowflake.com/en/user-guide/ui-query-profile#queries-too-large-to-fit-in-memory)

---

## 2-1. 問題文（英語）

> Consider the following snippet from the query profile of a finished query. Which of the following accurately describes the highlighted statistics? Select all that apply.
>
> A. The query profile indicates ineffective partition pruning.
> B. The query profile indicates that the query result cache was used.
> C. The query profile indicates that the query is too large to fit in the virtual warehouse memory.
> D. The query profile indicates that the metadata cache was used.

## 2-2. 問題文の文法解析

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| too large to fit in memory | phrase | メモリに収まらないほど大きい | The query is too large to fit in memory. |
| spillage | noun | スピリング（あふれ出し） | Local spillage indicates memory issues. |
| ineffective | adjective | 非効果的な | Ineffective partition pruning. |

## 2-3. 問題文（日本語）

> 完了したクエリのクエリプロファイルを考慮してください。ハイライトされた統計を正確に説明しているのはどれですか？

---

## 3-1. 解説文（英語）

> Snowflake saves data on the warehouse's local disk if it can't fit an operation into memory. Data spilling slows down queries because it requires more IO operations, and disk access is slower than memory access. "Bytes spilled to local storage." indicates local spillage. Snowflake will spill data to remote cloud storage if the local disk becomes full, which is even slower storage than the local disk, making this operation even slower. "Bytes spilled to remote storage" in the query profile indicates remote spillage. If the partitions scanned equal the partition total, the query scanned the complete table. Therefore, no partition pruning happened, and the clustering key should be improved.

## 3-2. 解説文の文法解析

### 文: "If the partitions scanned equal the partition total, the query scanned the complete table."

- **注目ポイント**: `equal` が動詞で「等しい」。Scanned = Total → フルスキャン → プルーニング非効果的。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| local spillage | noun | ローカルスピリング | Bytes spilled indicates local spillage. |
| remote spillage | noun | リモートスピリング | Even slower than local spillage. |
| scanned the complete table | phrase | テーブル全体をスキャンした | No pruning happened. |

## 3-3. 解説文（日本語）

> Snowflakeは操作がメモリに収まらない場合、WHのローカルディスクにデータを保存します。データスピリングはクエリを遅くします。「Bytes spilled to local storage」はローカルスピリングを示します。ローカルディスクがいっぱいになるとリモートクラウドストレージにスピルし、さらに遅くなります。スキャンされたパーティション数がパーティション総数と等しい場合、テーブル全体をスキャンしたことになり、パーティションプルーニングが行われなかったことを意味します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
