# 078: Cache Types Query Processing

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-13
**正答**: A, B, D

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Query Result Cache | Cloud Servicesレイヤーに保存される過去のクエリ結果。同一クエリ+データ未変更で再利用。WH不要 |
| Warehouse Cache | 各WHのローカルSSDに保存されるデータキャッシュ。クエリ実行時にクラウドストレージからコピーしたマイクロパーティションを保持。WH必要・プライベート |
| Metadata Cache | Cloud Servicesレイヤーが保持するテーブル・マイクロパーティション・列の統計情報。COUNT(*)やMIN/MAXをWH不要で返せる |
| Cloud Cache | Snowflakeの公式キャッシュ種別ではない（ダミー選択肢） |
| Memory Cache | Snowflakeの公式キャッシュ種別ではない（ダミー選択肢） |

## 1-2. 重要コンセプトまとめ

- Snowflakeの**3種類のキャッシュ**（何度出題されても正確に答える）:
  1. **Query Result Cache** — Cloud Services層、WH不要
  2. **Warehouse Cache** — ローカルSSD、WH必要、プライベート
  3. **Metadata Cache** — Cloud Services層、WH不要
- Cloud Cache・Memory Cache・High-Speed Cacheは**存在しない**
- クエリ処理の流れ:
  1. まずMetadata Cache確認（COUNT(*)等はここで返る）
  2. 次にQuery Result Cache確認（同一クエリの結果があれば返る）
  3. それでもなければWHで実行（Warehouse Cacheを活用）

## 1-3. 公式ドキュメントURL

- [Using Persisted Query Results](https://docs.snowflake.com/en/user-guide/querying-persisted-results)

---

## 2-1. 問題文（英語）

> When processing queries, what types of caches might be used by Snowflake? Select all that apply.
>
> A. Query Result Cache
> B. Warehouse Cache
> C. Cloud Cache
> D. Metadata Cache
> E. Memory Cache

## 2-2. 問題文の文法解析

### 文1: "When processing queries, what types of caches might be used by Snowflake?"

- **主語 (S)**: what types of caches
- **動詞 (V)**: might be used（受動態）
- **修飾語 (M)**: When processing queries（分詞構文）、by Snowflake（動作主）
- **文型**: SV（受動態疑問文）
- **注目ポイント**: `might be used` の `might` は可能性を示す。`When processing ~` は分詞構文。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| employ | verb | 採用する、利用する | Snowflake employs caching techniques. |
| construct over time | phrase | 時間をかけて構築する | The cache is constructed over time. |

## 2-3. 問題文（日本語）

> クエリ処理時にSnowflakeが使用する可能性のあるキャッシュの種類はどれですか？該当するものをすべて選んでください。
>
> A. Query Result Cache
> B. Warehouse Cache
> C. Cloud Cache
> D. Metadata Cache
> E. Memory Cache

---

## 3-1. 解説文（英語）

> To improve query performance, Snowflake employs a variety of caching techniques. When a new query is submitted for execution, Snowflake can immediately provide the query results using either the metadata cache or the query result cache. Each virtual warehouse has its own cache, which it constructs over time while executing queries, copying relevant micro-partitions from the cloud storage to the local SSD storage.

## 3-2. 解説文の文法解析

### 文1: "To improve query performance, Snowflake employs a variety of caching techniques."

- **主語 (S)**: Snowflake
- **動詞 (V)**: employs
- **目的語 (O)**: a variety of caching techniques
- **修飾語 (M)**: To improve query performance（目的）
- **文型**: SVO

### 文2: "When a new query is submitted for execution, Snowflake can immediately provide the query results using either the metadata cache or the query result cache."

- **主語 (S)**: Snowflake
- **動詞 (V)**: can provide
- **目的語 (O)**: the query results
- **修飾語 (M)**: When ~ is submitted（条件）、immediately（副詞）、using either ~ or ~（手段）
- **文型**: SVO
- **注目ポイント**: `either A or B` で2種類のキャッシュからの即時提供を示す。

### 文3: "Each virtual warehouse has its own cache, which it constructs over time while executing queries, copying relevant micro-partitions from the cloud storage to the local SSD storage."

- **主語 (S)**: Each virtual warehouse
- **動詞 (V)**: has
- **目的語 (O)**: its own cache
- **修飾語 (M)**: which it constructs over time（非制限関係詞節）、while executing queries（同時進行）、copying ~（分詞構文）
- **文型**: SVO

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| employ | verb | 採用する | Employs a variety of caching techniques. |
| submitted for execution | phrase | 実行に送信された | A query submitted for execution. |
| either A or B | phrase | AまたはBのいずれか | Using either metadata or result cache. |

## 3-3. 解説文（日本語）

> クエリパフォーマンスを向上させるために、Snowflakeは様々なキャッシュ技術を採用しています。新しいクエリが実行に送信されると、Snowflakeはメタデータキャッシュまたはクエリ結果キャッシュのいずれかを使用して即座にクエリ結果を提供できます。各仮想ウェアハウスは独自のキャッシュを持ち、クエリ実行中に関連するマイクロパーティションをクラウドストレージからローカルSSDストレージにコピーしながら、時間をかけて構築します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
