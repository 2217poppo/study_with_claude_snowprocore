# 002: Query Result Cache

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-01
**正答**: C (Snowflake will use the query result cache to fulfill the query because the query has previously been executed.)

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Query Result Cache（クエリ結果キャッシュ） | Snowflakeがクエリの実行結果を保存しておく仕組み。同一クエリが再度実行された際に、テーブルを再スキャンせずキャッシュから結果を返す。ウェアハウスのコンピュートリソースを消費しない。 |
| Metadata Cache（メタデータキャッシュ） | テーブルの行数、最大/最小値などのメタ情報をCloud Servicesレイヤーが保持するキャッシュ。COUNT(*)のような集計クエリがウェアハウスなしで完結することがある。Query Result Cacheとは別物。 |
| Result Cache（結果キャッシュ） | Query Result Cache の別称として使われることがある。試験では同義として扱われる。 |
| Persisted Query Results（永続化クエリ結果） | Snowflakeの公式ドキュメントでQuery Result Cacheを指す用語。24時間有効で、再利用されるたびに延長される。 |
| Cache Expiry（キャッシュ有効期限） | キャッシュが無効化されるタイミング。Query Result Cacheは24時間が基本だが、再利用のたびに24時間延長され、最大31日間有効になる。 |

## 1-2. 重要コンセプトまとめ

- **Query Result Cache の有効条件**:
  1. 同一クエリ（または同等のクエリ）が以前に実行されていること
  2. クエリされているテーブルのデータに変更がないこと
  3. 前回実行から24時間以内であること（延長あり）
- **有効期間の仕組み**:
  - 初回キャッシュ生成から24時間有効
  - 24時間以内に再利用されると、その時点から24時間延長
  - 再利用され続ける限り最大**31日間**有効
  - 31日経過後は無条件にパージされる
- **Metadata Cache との違い**（誤答Bのひっかけポイント）:
  - Metadata Cache: 集計情報のみ（COUNT等）、Cloud Servicesで完結
  - Query Result Cache: 実際のクエリ結果全体を保存
  - この問題のような「complex query」は Query Result Cache が対象
- **試験ポイント**: 「同じクエリ」「データ変更なし」「24時間以内」→ Query Result Cache を想起する
- Query Result Cache利用時はウェアハウスが不要（課金なし）

## 1-3. 公式ドキュメントURL

- [Using Persisted Query Results](https://docs.snowflake.com/en/user-guide/querying-persisted-results)
- [Snowflake Caching](https://docs.snowflake.com/en/user-guide/performance-query-caching)

---

## 2-1. 問題文（英語）

> A business user is executing a complex query. Another user executed the same query less than 24 hours ago. Assuming that the underlying data for the query hasn't changed, what is the likely way this query will be executed?
>
> A. Snowflake will re-run the query, scanning the underlying tables and re-calculating the query results.
> B. Snowflake will return the query results from the metadata cache.
> C. Snowflake will use the query result cache to fulfill the query because the query has previously been executed.

## 2-2. 問題文の文法解析

### 文1: "A business user is executing a complex query."

- **主語 (S)**: A business user
- **動詞 (V)**: is executing（現在進行形）
- **目的語 (O)**: a complex query
- **文型**: SVO
- **注目ポイント**: 現在進行形「is executing」で「今まさに実行しようとしている」という状況設定。試験問題でシナリオを導入するパターン。

### 文2: "Another user executed the same query less than 24 hours ago."

- **主語 (S)**: Another user
- **動詞 (V)**: executed（過去形）
- **目的語 (O)**: the same query
- **修飾語 (M)**: less than 24 hours ago（時間の修飾語句）
- **文型**: SVO + M
- **注目ポイント**: 「less than 24 hours ago」はQuery Result Cacheの有効期限（24時間）を意識させるキーフレーズ。

### 文3: "Assuming that the underlying data for the query hasn't changed, what is the likely way this query will be executed?"

- **分詞構文**: Assuming that ~（「～と仮定した場合」。条件を設定する）
- **従属節**: that the underlying data for the query hasn't changed（hasn't changed = 現在完了否定形）
- **主語 (S)**: what（疑問詞）
- **動詞 (V)**: is
- **補語 (C)**: the likely way this query will be executed
- **関係詞節**: this query will be executed（wayを修飾）
- **文型**: 疑問文 SVC
- **注目ポイント**: 「Assuming that ~」は試験で頻出の条件設定パターン。「hasn't changed」（変更されていない）がQuery Result Cache使用の鍵。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| assuming that | 接続詞句 | ～と仮定すると、～という前提で | Assuming that the data is correct, the result is valid. |
| underlying data | noun phrase | 基になるデータ、元データ | The underlying data hasn't changed since the last query. |
| fulfill | verb | （要求・クエリなどを）満たす、処理する | The cache can fulfill the query without computation. |
| previously | adverb | 以前に、前回 | The query was previously executed by another user. |
| re-calculate | verb | 再計算する | Without a cache, Snowflake must re-calculate the results. |

## 2-3. 問題文（日本語）

> あるビジネスユーザーが複雑なクエリを実行しようとしています。24時間以内に別のユーザーが同じクエリを実行していました。クエリの対象データに変更がなかったと仮定した場合、このクエリはどのように実行される可能性が高いですか？
>
> A. Snowflakeはクエリを再実行し、基になるテーブルをスキャンしてクエリ結果を再計算する。
> B. Snowflakeはメタデータキャッシュからクエリ結果を返す。
> C. クエリが以前に実行されているため、Snowflakeはクエリ結果キャッシュを使用してクエリを処理する。

---

## 3-1. 解説文（英語）

> When Snowflake runs a query, it caches the results of that query for a predetermined amount of time. The stored query results are referred to as the Query Result Cache. The Query Result Cache can be used to fulfill future queries if they are similar to a previously executed query & there have been no changes to the data in the tables being queried.
>
> Once a result cache is generated for a query stays valid for 24 hours. If another query that reuses the query result cache is executed within that 24-hour window, the result cache expiry is extended for another 24 hours from that point onwards. If the result cache for a query keeps getting used, it will stay valid for up to 31 days. After 31 days, the result cache for a query will be purged regardless of any other condition.

## 3-2. 解説文の文法解析

### 文1: "When Snowflake runs a query, it caches the results of that query for a predetermined amount of time."

- **従属節**: When Snowflake runs a query（時を表す副詞節）
- **主語 (S)**: it（= Snowflake）
- **動詞 (V)**: caches
- **目的語 (O)**: the results of that query
- **修飾語 (M)**: for a predetermined amount of time（期間を示す前置詞句）
- **文型**: When節 + SVO + M
- **注目ポイント**: 「a predetermined amount of time」は「あらかじめ定められた時間」。具体的な時間（24時間）は次文以降で説明される。

### 文2: "The stored query results are referred to as the Query Result Cache."

- **主語 (S)**: The stored query results（過去分詞 stored が名詞を前置修飾）
- **動詞 (V)**: are referred to as（受動態 + 句動詞 refer to A as B「AをBと呼ぶ」）
- **補語 (C)**: the Query Result Cache
- **文型**: SVC（受動態）
- **注目ポイント**: 「be referred to as ~」は「～と呼ばれる」という定義・名称付けに使う定番表現。技術文書で頻出。

### 文3: "The Query Result Cache can be used to fulfill future queries if they are similar to a previously executed query & there have been no changes to the data in the tables being queried."

- **主語 (S)**: The Query Result Cache
- **動詞 (V)**: can be used（受動態 + 助動詞）
- **目的語**: to fulfill future queries（不定詞句）
- **条件節1**: if they are similar to a previously executed query
- **条件節2**: there have been no changes to the data in the tables being queried（現在完了形）
- **文型**: SV + 不定詞 + if節（2条件が & で並列）
- **注目ポイント**:
  - 「can be used to + 動詞原形」：可能性・用途を示す定番表現
  - 「there have been no changes」：現在完了形の否定で「変化がなかった」ことを表す
  - 「tables being queried」：現在分詞 being queried が tables を後置修飾

### 文4: "Once a result cache is generated for a query stays valid for 24 hours."

- **接続詞**: Once（「一旦～したら」「～するやいなや」）
- **従属節**: a result cache is generated for a query（受動態）
- **主語 (S)**: （it = the result cache、省略）
- **動詞 (V)**: stays（状態動詞）
- **補語 (C)**: valid for 24 hours
- **文型**: Once節 + SVC
- **注目ポイント**: 「Once + 受動態」は「生成されると同時に」という時間的な起点を示す。

### 文5: "If another query that reuses the query result cache is executed within that 24-hour window, the result cache expiry is extended for another 24 hours from that point onwards."

- **条件節**: If another query ... is executed within that 24-hour window
  - 関係詞節: that reuses the query result cache（another query を修飾）
- **主語 (S)**: the result cache expiry
- **動詞 (V)**: is extended（受動態）
- **修飾語**: for another 24 hours / from that point onwards
- **文型**: If節 + SV（受動態）+ M
- **注目ポイント**:
  - 「from that point onwards」：「その時点から先は」。onwards は「以降」を意味する副詞
  - 「is extended for another 24 hours」：「さらに24時間延長される」。another = 追加の

### 文6: "After 31 days, the result cache for a query will be purged regardless of any other condition."

- **修飾語 (M)**: After 31 days（時の前置詞句）
- **主語 (S)**: the result cache for a query
- **動詞 (V)**: will be purged（受動態 + 未来形）
- **修飾語 (M)**: regardless of any other condition（「いかなる条件にかかわらず」）
- **文型**: M + SV（受動態）+ M
- **注目ポイント**: 「regardless of ~」は「～に関わらず」。試験で頻出の例外・絶対条件を示す表現。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| be referred to as | 受動態句 | ～と呼ばれる | This layer is referred to as the Cloud Services layer. |
| predetermined | adjective | あらかじめ定められた | The cache is valid for a predetermined amount of time. |
| expiry | noun | 有効期限、満了 | The expiry is extended every time the cache is used. |
| purge | verb | 削除する、消去する（完全除去のニュアンス） | The cache will be purged after 31 days. |
| regardless of | preposition | ～にかかわらず、～を問わず | The cache is purged regardless of usage frequency. |
| from that point onwards | phrase | その時点から先は | The 24-hour timer restarts from that point onwards. |

## 3-3. 解説文（日本語）

> Snowflakeはクエリを実行すると、そのクエリ結果をあらかじめ定められた期間キャッシュします。保存されたクエリ結果は「クエリ結果キャッシュ（Query Result Cache）」と呼ばれます。クエリ結果キャッシュは、以前に実行されたクエリと類似したクエリに対して使用でき、かつクエリ対象のテーブルのデータに変更がない場合に利用可能です。
>
> クエリのキャッシュが生成されると、24時間有効になります。その24時間以内にクエリ結果キャッシュを再利用する別のクエリが実行された場合、キャッシュの有効期限はその時点からさらに24時間延長されます。クエリ結果キャッシュが使われ続けると、最大31日間有効になります。31日が経過すると、その他のいかなる条件にかかわらず、クエリのキャッシュは削除されます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
