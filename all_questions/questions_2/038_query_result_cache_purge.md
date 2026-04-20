# 038: Query Result Cache Purge

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-13
**正答**: A

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Query Result Cache（クエリ結果キャッシュ） | クエリの実行結果をCloud Servicesレイヤーに保存する仕組み。同一クエリ・データ未変更の場合に再利用される |
| Purge（パージ） | キャッシュを削除・無効化すること。Query Result Cacheは24時間使われないとパージされる |
| Validity Period（有効期間） | キャッシュが有効な期間。初期値は24時間。再利用のたびに24時間延長され、最大31日まで延長可能 |
| Cache Reuse（キャッシュ再利用） | 以前実行されたクエリの結果キャッシュを使って、ウェアハウスを使わずに結果を返すこと |

## 1-2. 重要コンセプトまとめ

- Query Result Cacheの有効期間は初期値 **24時間**
- 24時間以内に同じクエリが実行されると、有効期間が **さらに24時間延長** される（リセット）
- この延長は最大 **31日間** まで繰り返し可能
- 31日を過ぎると、どんなに再利用されても **無条件でパージ** される
- 「purge parameter」のような時間を変更するパラメータは **存在しない**（ひっかけ選択肢）
- USE_CACHED_RESULTパラメータはキャッシュのON/OFFを制御するが、パージまでの時間は変更できない

## 1-3. 公式ドキュメントURL

- [Using Persisted Query Results](https://docs.snowflake.com/en/user-guide/querying-persisted-results)

---

## 2-1. 問題文（英語）

> The query result cache is purged after 24 hours unless which of the following condition is true?
>
> A. Another query is executed within 24 hours that reuses the query result cache.
> B. The value for the query result cache purge parameter is set to a different number than 24.

## 2-2. 問題文の文法解析

### 文1: "The query result cache is purged after 24 hours unless which of the following condition is true?"

- **主語 (S)**: The query result cache
- **動詞 (V)**: is purged（受動態）
- **修飾語 (M)**: after 24 hours（時間）、unless which of the following condition is true（条件節 + 疑問）
- **文型**: SV（受動態疑問文）
- **注目ポイント**: `unless ~` は「～でない限り」。「24時間後にパージされる、ただし～が真でない限り」という構造。`unless` + 疑問詞で「どの条件なら例外か」を問う試験独特の形式。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| purge | verb | パージする、削除する | The cache is purged after 24 hours. |
| unless | conjunction | ～でない限り | The cache expires unless reused. |
| reuse | verb | 再利用する | Another query reuses the cache. |
| condition | noun | 条件 | Which condition must be true? |

## 2-3. 問題文（日本語）

> クエリ結果キャッシュは24時間後にパージされますが、以下のどの条件が真であればパージされませんか？
>
> A. 24時間以内にクエリ結果キャッシュを再利用する別のクエリが実行される。
> B. クエリ結果キャッシュのパージパラメータの値が24以外の数値に設定されている。

---

## 3-1. 解説文（英語）

> The query result cache for a query has an initial validity period of twenty-four hours. The cache is purged if a new query doesn't reuse the previously generated cache within 24 hours. If a new query uses the result cache, the validity period for the query result cache is reset to another 24 hours. It is now valid for another 24 hours from when it was reused. This extension of the first query result cache can continue for up to a maximum of 31 days from the point in time when a query result cache was initially produced. After 31 days, the query result cache for a query is purged altogether. https://docs.snowflake.com/en/user-guide/querying-persisted-results

## 3-2. 解説文の文法解析

### 文1: "The query result cache for a query has an initial validity period of twenty-four hours."

- **主語 (S)**: The query result cache for a query
- **動詞 (V)**: has
- **目的語 (O)**: an initial validity period of twenty-four hours
- **文型**: SVO
- **注目ポイント**: `has an initial ~ of N` で「初期値はNである」。`validity period` は「有効期間」。

### 文2: "The cache is purged if a new query doesn't reuse the previously generated cache within 24 hours."

- **主語 (S)**: The cache
- **動詞 (V)**: is purged（受動態）
- **修飾語 (M)**: if a new query doesn't reuse the previously generated cache within 24 hours（条件節）
- **文型**: SV（受動態）
- **注目ポイント**: `if ~ doesn't ... within N hours` で「N時間以内に～しなければ」。否定条件 + 期限の組み合わせ。

### 文3: "If a new query uses the result cache, the validity period for the query result cache is reset to another 24 hours."

- **主語 (S)**: the validity period
- **動詞 (V)**: is reset（受動態）
- **修飾語 (M)**: If a new query uses the result cache（条件節）、to another 24 hours（到達点）
- **文型**: SV（受動態）
- **注目ポイント**: `is reset to ~` で「～にリセットされる」。`another 24 hours` は「さらに別の24時間」。

### 文4: "This extension of the first query result cache can continue for up to a maximum of 31 days from the point in time when a query result cache was initially produced."

- **主語 (S)**: This extension of the first query result cache
- **動詞 (V)**: can continue
- **修飾語 (M)**: for up to a maximum of 31 days（期間上限）、from the point in time when ~ was initially produced（起点）
- **文型**: SV
- **注目ポイント**: `for up to a maximum of ~` で「最大～まで」。`from the point in time when ~` で「～した時点から」。時間の起点と上限を同時に示す技術文書の定番構造。

### 文5: "After 31 days, the query result cache for a query is purged altogether."

- **主語 (S)**: the query result cache for a query
- **動詞 (V)**: is purged（受動態）
- **修飾語 (M)**: After 31 days（時間）、altogether（副詞「完全に」）
- **文型**: SV（受動態）
- **注目ポイント**: `altogether` は「完全に、全面的に」。31日後は例外なく削除されるという絶対条件を示す。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| validity period | noun | 有効期間 | The initial validity period is 24 hours. |
| initial | adjective | 初期の | The initial period starts at creation. |
| reset | verb | リセットする | The period is reset to another 24 hours. |
| extension | noun | 延長 | This extension can continue for 31 days. |
| up to a maximum of ~ | phrase | 最大～まで | Can continue for up to a maximum of 31 days. |
| altogether | adverb | 完全に、全面的に | The cache is purged altogether. |
| from the point in time when ~ | phrase | ～した時点から | From the point in time when it was produced. |

## 3-3. 解説文（日本語）

> クエリのクエリ結果キャッシュには、24時間の初期有効期間があります。新しいクエリが24時間以内に以前生成されたキャッシュを再利用しなければ、キャッシュはパージされます。新しいクエリが結果キャッシュを使用すると、クエリ結果キャッシュの有効期間はさらに24時間にリセットされます。再利用された時点から新たに24時間有効になります。この最初のクエリ結果キャッシュの延長は、クエリ結果キャッシュが最初に生成された時点から最大31日間まで継続できます。31日を過ぎると、クエリのクエリ結果キャッシュは完全にパージされます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
