# 059: Snowflake Cache Types

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-13
**正答**: A, B, D

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Metadata Cache | Cloud Servicesレイヤーが保持するテーブル・マイクロパーティション・列ごとの統計情報。COUNT(*)やMIN/MAXをWH不要で返せる |
| Query Result Cache | 過去に実行されたクエリの結果をCloud Servicesレイヤーに保存する仕組み。同一クエリ・データ未変更で再利用。WH不要 |
| Virtual Warehouse Cache | ウェアハウスのローカルSSDにスキャンデータを保存するキャッシュ。WH稼働中のみ有効。各WHにプライベート |
| Memory Cache | Snowflakeの公式キャッシュ種別ではない（ダミー選択肢） |
| High-Speed Cache | Snowflakeの公式キャッシュ種別ではない（ダミー選択肢） |

## 1-2. 重要コンセプトまとめ

- Snowflakeの **3種類のキャッシュ** を正確に覚える:

| キャッシュ | レイヤー | WH必要 | 共有 | 特徴 |
|-----------|---------|--------|------|------|
| Metadata Cache | Cloud Services | 不要 | 可 | 統計情報（行数・MIN/MAX） |
| Query Result Cache | Cloud Services | 不要 | 可 | 過去のクエリ結果を再利用 |
| Virtual Warehouse Cache | Compute | 必要 | 不可 | ローカルSSDのデータブロック |

- 「Memory Cache」「High-Speed Cache」はSnowflakeの用語ではない（ダミー）
- Metadata Cacheは `COUNT(*)` や `MIN/MAX` をウェアハウスなしで返せる
- Query Result Cacheは同一クエリ+データ未変更で再利用（24時間有効、最大31日延長）
- Virtual Warehouse CacheはクラウドストレージからのデータをローカルSSDに保持

## 1-3. 公式ドキュメントURL

- [Using Persisted Query Results](https://docs.snowflake.com/en/user-guide/querying-persisted-results)

---

## 2-1. 問題文（英語）

> Which of the following are examples of caches in Snowflake?
>
> A. Metadata Cache
> B. Query Result Cache
> C. Memory Cache
> D. Virtual Warehouse Cache
> E. High-Speed Cache

## 2-2. 問題文の文法解析

### 文1: "Which of the following are examples of caches in Snowflake?"

- **主語 (S)**: Which of the following
- **動詞 (V)**: are
- **補語 (C)**: examples of caches in Snowflake
- **文型**: SVC（疑問文）
- **注目ポイント**: `examples of ~` は「～の例」。複数形 `are` で複数選択を示唆。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| cache | noun | キャッシュ | Snowflake has three types of caches. |
| merely | adverb | 単に、ただ〜するだけ | Merely counts rows. |
| constructed over time | phrase | 時間をかけて構築された | Cache is constructed over time. |

## 2-3. 問題文（日本語）

> 以下のうち、Snowflakeのキャッシュの例はどれですか？
>
> A. メタデータキャッシュ
> B. クエリ結果キャッシュ
> C. メモリキャッシュ
> D. 仮想ウェアハウスキャッシュ
> E. 高速キャッシュ

---

## 3-1. 解説文（英語）

> Statistics are kept in the metadata cache for each table, micro-partition, and column. The metadata cache can return results if the query merely counts rows or finds a column's minimum or maximum value. Snowflake can use the query result cache to return the results if the query has previously been executed and the data hasn't changed. Each virtual warehouse also has its own cache, constructed over time by moving micro-partitions from cloud storage to SSD storage. Similar queries run on a virtual warehouse may already have some data in the cache, which improves query performance.

## 3-2. 解説文の文法解析

### 文1: "Statistics are kept in the metadata cache for each table, micro-partition, and column."

- **主語 (S)**: Statistics
- **動詞 (V)**: are kept（受動態）
- **修飾語 (M)**: in the metadata cache（場所）、for each table, micro-partition, and column（対象）
- **文型**: SV（受動態）

### 文2: "The metadata cache can return results if the query merely counts rows or finds a column's minimum or maximum value."

- **主語 (S)**: The metadata cache
- **動詞 (V)**: can return
- **目的語 (O)**: results
- **修飾語 (M)**: if the query merely counts rows or finds ~（条件節）
- **文型**: SVO
- **注目ポイント**: `merely` は「単に」。メタデータだけで回答できる単純なクエリの例。

### 文3: "Each virtual warehouse also has its own cache, constructed over time by moving micro-partitions from cloud storage to SSD storage."

- **主語 (S)**: Each virtual warehouse
- **動詞 (V)**: has
- **目的語 (O)**: its own cache
- **修飾語 (M)**: constructed over time by moving ~（過去分詞の後置修飾）
- **文型**: SVO
- **注目ポイント**: `its own` で「各自の」プライベート性を強調。`constructed over time` で時間をかけて蓄積されることを示す。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| statistics | noun | 統計情報 | Statistics are kept in the metadata cache. |
| merely | adverb | 単に | If the query merely counts rows. |
| its own | phrase | 自身の | Each warehouse has its own cache. |
| constructed over time | phrase | 時間をかけて構築された | Cache constructed over time. |

## 3-3. 解説文（日本語）

> 統計情報はテーブル、マイクロパーティション、列ごとにメタデータキャッシュに保持されます。メタデータキャッシュはクエリが単に行数をカウントしたり列の最小/最大値を検索したりするだけの場合に結果を返すことができます。クエリが以前に実行されデータが変更されていない場合、Snowflakeはクエリ結果キャッシュを使用して結果を返すことができます。各仮想ウェアハウスもそれぞれ独自のキャッシュを持ち、クラウドストレージからSSDストレージにマイクロパーティションを移動することで時間をかけて構築されます。仮想ウェアハウスで実行される類似のクエリは、既にキャッシュにデータがある可能性があり、クエリパフォーマンスが向上します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
