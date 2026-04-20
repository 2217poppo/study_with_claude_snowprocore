# 007: Query Result Cache — Purge Duration When Not Used

**SnowPro Core Domain**: Domain 4 — Performance Concepts
**作成日**: 2026-04-17
**正答**: 24 hours（一度も使われなければ24時間後に削除）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Query Result Cache（クエリ結果キャッシュ） | Snowflakeがクエリ結果を保存しておく仕組み。同一クエリ・データ未変更の条件下で再利用できる。Cloud Services Layerで管理される |
| Cache Expiry（キャッシュ有効期限） | キャッシュが無効化・削除されるまでの期間。Query Result Cacheの基本有効期限は24時間 |
| Cache Extension（キャッシュ延長） | キャッシュが再利用されるたびに有効期限が24時間延長される仕組み。最大31日まで延長される |
| 31-Day Maximum（31日上限） | Query Result Cacheが無条件に削除されるタイミング。何度再利用されても31日後には必ず削除される |
| USE_CACHED_RESULT | Query Result Cacheの有効/無効を制御するパラメータ。Session・User・Accountレベルで設定可能。デフォルトTRUE |

## 1-2. 重要コンセプトまとめ

- **Query Result Cacheのライフサイクル（試験頻出）**:
  - 生成時: 有効期限24時間で開始
  - 再利用時（24時間以内に同一クエリが実行されると）: **その時点から24時間延長**
  - 上限: **31日後は無条件で削除**（どれだけ再利用されていても）
- **問題のポイント**: 「一度も使われなかった場合」= 24時間後に削除（基本有効期限）
- **24時間 vs 31日の混同に注意**:
  - 24時間 = 基本有効期限（延長なしの場合）
  - 31日 = 最大有効期限（再利用し続けた場合の上限）
- **キャッシュ再利用の条件（全5条件）**:
  1. 同一クエリ
  2. ベーステーブルのデータが未変更
  3. マイクロパーティションが未変更（再クラスタリング・統合なし）
  4. RANDOM()・UUID_STRING()等のランタイム関数不使用（CURRENT_DATEは例外）
  5. UDF・外部関数不使用

## 1-3. 公式ドキュメントURL

- [Using Persisted Query Results](https://docs.snowflake.com/en/user-guide/querying-persisted-results)

---

## 2-1. 問題文（英語）

> If the query result cache for a query is not used by any future query, what is the duration after which it will be purged?
>
> A. 3600 seconds
> B. 365 days
> C. 24 hours ✓
> D. 31 days

## 2-2. 問題文の文法解析

### 文1: "If the query result cache for a query is not used by any future query, what is the duration after which it will be purged?"

- **条件節**: If the query result cache for a query is not used by any future query（そのクエリのResult Cacheが今後のいかなるクエリにも使われない場合）
- **主節（疑問文）**: what is the duration after which it will be purged?
  - **主語 (S)**: the duration after which it will be purged（削除されるまでの期間）
  - **動詞 (V)**: is
  - **補語 (C)**: what（何か）
- **注目ポイント**:
  - `is not used by any future query` = 受動態 + 否定 + `any`（いかなる〜にも使われない）
  - `the duration after which it will be purged` = 「削除されるまでの期間」
  - `after which` = 関係詞（`after that duration`）
  - `purge` = 削除する、消去する（キャッシュや古いデータを完全に除去する）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| purge | 動詞 | 削除する、消去する | The cache is purged after 24 hours if not used. |
| duration | 名詞 | 期間、持続時間 | What is the duration of the query result cache? |
| any future query | 名詞句 | 今後のいかなるクエリ | Not used by any future query = never reused. |
| after which | 関係詞句 | その後（〜が削除される） | The duration after which it will be purged = 24 hours. |

## 2-3. 問題文（日本語）

> あるクエリのクエリ結果キャッシュが今後のいかなるクエリにも使用されない場合、キャッシュが削除されるまでの期間はどれくらいですか？
>
> A. 3600秒
> B. 365日
> C. 24時間 ✓
> D. 31日

---

## 3-1. 解説文（英語）

> Once a result cache is generated for a query stays valid for 24 hours. If another query that reuses the query result cache is executed within that 24-hour window, the result cache expiry is extended for another 24 hours from that point onwards. If the result cache for a query keeps getting used, it will stay valid for up to 31 days. After 31 days, the result cache for a query will be purged regardless of any other condition.
>
> https://docs.snowflake.com/en/user-guide/querying-persisted-results

## 3-2. 解説文の文法解析

### 文1: "Once a result cache is generated for a query stays valid for 24 hours."

- **時間節**: Once a result cache is generated（一旦Result Cacheが生成されると）
- **主語 (S)**: （it） stays valid for 24 hours
- **動詞 (V)**: stays valid（有効なままでいる / stay + 形容詞）
- **期間**: for 24 hours
- **注目ポイント**:
  - `once ~` = 「一旦〜すると」（時点の起点）
  - `stay valid` = 「有効なままでいる」（SVC構文、stay = 状態の継続）

### 文2: "If another query that reuses the query result cache is executed within that 24-hour window, the result cache expiry is extended for another 24 hours from that point onwards."

- **条件節**: If another query that reuses the query result cache is executed within that 24-hour window（Result Cacheを再利用する別のクエリが24時間の窓の中で実行されると）
- **主語 (S)**: the result cache expiry（Result Cacheの有効期限）
- **動詞 (V)**: is extended（延長される / 受動態）
- **期間**: for another 24 hours（さらに24時間）
- **起点**: from that point onwards（その時点から先は）
- **注目ポイント**:
  - `that 24-hour window` = 「その24時間の窓」（有効期限内を「窓」に例える）
  - `from that point onwards` = 「その時点から先は」（延長の起点を明示）
  - `another 24 hours` = 「さらに24時間」（追加の24時間）

### 文3: "If the result cache for a query keeps getting used, it will stay valid for up to 31 days."

- **条件節**: If the result cache for a query keeps getting used（Result Cacheが使われ続けると）
- **主語 (S)**: it（= the result cache）
- **動詞 (V)**: will stay valid（有効なままでいるだろう）
- **範囲**: for up to 31 days（最大31日間）
- **注目ポイント**:
  - `keep + 動名詞` = 「〜し続ける」（継続を示す）
  - `keeps getting used` = 使われ続ける（get + 過去分詞で受け身的な意味）
  - `up to 31 days` = 最大31日まで（上限）

### 文4: "After 31 days, the result cache for a query will be purged regardless of any other condition."

- **時間の前置詞句**: After 31 days（31日後に）
- **主語 (S)**: the result cache for a query
- **動詞 (V)**: will be purged（削除される / 受動態）
- **条件無視**: regardless of any other condition（いかなる他の条件にかかわらず）
- **注目ポイント**:
  - `regardless of ~` = 「〜にかかわらず」（無条件・絶対）
  - `any other condition` = 「いかなる他の条件も」（31日は絶対的な上限）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| keep + 動名詞 | 動詞句 | 〜し続ける | The cache keeps getting used = it's continuously reused. |
| 24-hour window | 名詞句 | 24時間の窓（有効期間） | Reuse within the 24-hour window extends the cache. |
| from that point onwards | 副詞句 | その時点から先は | The expiry is extended from that point onwards. |
| regardless of | 前置詞句 | 〜にかかわらず | Purged after 31 days regardless of any condition. |

## 3-3. 解説文（日本語）

> クエリのResult Cacheが生成されると、24時間有効なままです。その24時間の窓の中でResult Cacheを再利用するクエリが実行されると、その時点からさらに24時間、有効期限が延長されます。Result Cacheが使われ続ける限り、最大31日間有効なままです。31日後は、いかなる他の条件にかかわらず、クエリのResult Cacheは削除されます。

---

## 復習メモ

- [ ] 基本24時間・再利用で延長・最大31日（無条件削除）の3段階を覚えた
- [ ] `keep getting used`（使われ続ける）と `regardless of any other condition`（いかなる条件にかかわらず）の表現を確認した
- [ ] `from that point onwards`（その時点から先は）の使い方を理解した
