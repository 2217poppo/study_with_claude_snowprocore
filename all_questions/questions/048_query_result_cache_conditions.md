# 048: Query Result Cache — All Reuse Conditions

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-03
**正答**: A・B・C・D・E（すべて正解）

> 関連問題: 002（Query Result Cacheの基本動作）・010（USE_CACHED_RESULTのレベル）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Query Result Cache（クエリ結果キャッシュ） | Snowflakeがクエリ結果を保存する仕組み。条件を満たすと再実行なしにキャッシュから結果を返す。ウェアハウス不要・課金なし |
| Reclustering（再クラスタリング） | クラスタリングキーに基づいてデータをマイクロパーティションに再配置する操作。これによりマイクロパーティションが変更されるとキャッシュは無効化される |
| Consolidation（統合） | 小さなマイクロパーティションを大きなパーティションにまとめるSnowflakeの内部最適化処理。マイクロパーティションの変更を引き起こすためキャッシュに影響する |
| Runtime Function（ランタイム関数） | クエリが実行されるたびに異なる値を返す関数。例: `RANDOM()`, `UUID_STRING()`, `SYSDATE()`。キャッシュ再利用を無効化する |
| User-Defined Function (UDF) | ユーザーが作成した関数。外部関数（External Function）も含め、キャッシュ再利用を無効化する |
| CURRENT_DATE | 現在の日付を返す関数。**特別扱いで、キャッシュ再利用の対象になる**（ランタイム関数とは異なる）。試験で頻出の例外 |

## 1-2. 重要コンセプトまとめ

- **Query Result Cacheが再利用される5つの条件（すべて満たす必要あり）**:

  | # | 条件 | ポイント |
  |---|------|---------|
  | 1 | **新しいクエリが過去のクエリと一致する** | 完全一致（大文字小文字も含む） |
  | 2 | **クエリ結果に寄与するデータが変更されていない** | INSERT/UPDATE/DELETE等がない |
  | 3 | **マイクロパーティションが再クラスタリング/統合で変更されていない** | 内部的な最適化でも無効化される |
  | 4 | **ランタイム関数を使用していない** | RANDOM()・UUID_STRING()等はNG |
  | 5 | **UDF・外部関数を使用していない** | Secure UDFも含め全UDFがNG |

- **例外: CURRENT_DATEはキャッシュ対象**
  - `SELECT * FROM t WHERE date = CURRENT_DATE` → キャッシュ再利用可能
  - これは試験でよく出る「引っかけ例外」

- **002との違い**: 002は「データ変更なし・同一クエリ・24時間以内」の基本3条件を学習。この問題はマイクロパーティション変更・UDF・ランタイム関数の追加条件を網羅

- **試験頻出パターン**: 「どの条件でキャッシュが無効化されるか？」→ UDF使用・ランタイム関数・再クラスタリングが含まれていると無効

## 1-3. 公式ドキュメントURL

- [Using Persisted Query Results](https://docs.snowflake.com/en/user-guide/querying-persisted-results)

---

## 2-1. 問題文（英語）

> Which of the following criteria must be met for Snowflake to reuse the query result cache for a query? Choose all that apply.
>
> A. The table micro-partitions have NOT altered as a result of reclustering or consolidation.
> B. A new query matches an old query.
> C. The underlying data that contributes to the query results has remained unchanged.
> D. The query does not make use of runtime functions.
> E. The query makes no use of user-defined or external functions.

## 2-2. 問題文の文法解析

### 文1: "Which of the following criteria must be met for Snowflake to reuse the query result cache for a query?"

- **主語 (S)**: Which of the following criteria（以下の条件のうちどれが）
- **動詞 (V)**: must be met（満たされなければならない）← 義務の must + 受動態
- **修飾語 (M1)**: for Snowflake to reuse the query result cache（SnowflakeがQuery Result Cacheを再利用するために）← `for O to do` 構文
- **修飾語 (M2)**: for a query（クエリに対して）
- **注目ポイント**: `must be met` = 「満たされなければならない」。`meet a criteria` = 「条件を満たす」の受動態

### 選択肢A: "The table micro-partitions have NOT altered as a result of reclustering or consolidation."

- **主語 (S)**: The table micro-partitions（テーブルのマイクロパーティションが）
- **動詞 (V)**: have NOT altered（変更されていない）← 現在完了否定
- **修飾語 (M)**: as a result of reclustering or consolidation（再クラスタリングまたは統合の結果として）
- **注目ポイント**: `as a result of ~` = 「〜の結果として」。原因・起因を示す前置詞句

### 選択肢C: "The underlying data that contributes to the query results has remained unchanged."

- **主語 (S)**: The underlying data（基礎となるデータが）
- **修飾語**: that contributes to the query results（クエリ結果に寄与する）← 関係代名詞節
- **動詞 (V)**: has remained unchanged（変更されていない状態のままである）← 現在完了 + 補語
- **注目ポイント**: `underlying` = 「基礎となる・根底にある」。`remain unchanged` = 「変更されていない状態を保つ」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| criteria | 名詞（複数形） | 条件、基準（単数形: criterion） | Several criteria must be met for cache reuse. |
| must be met | 義務受動態 | 満たされなければならない | Conditions must be met for the cache to work. |
| underlying | 形容詞 | 基礎となる、根底にある | The underlying data must not change. |
| remain unchanged | 熟語 | 変更されていない状態を保つ | Data has remained unchanged for 24 hours. |
| make use of ~ | 熟語 | 〜を使用する（= use ~） | The query must not make use of runtime functions. |
| as a result of ~ | 前置詞句 | 〜の結果として | Partitions altered as a result of reclustering. |

## 2-3. 問題文（日本語）

> Snowflakeがクエリに対してQuery Result Cacheを再利用するために満たされなければならない条件はどれですか？当てはまるものをすべて選択してください。
>
> A. テーブルのマイクロパーティションが再クラスタリングまたは統合の結果として変更されていない。
> B. 新しいクエリが過去のクエリと一致する。
> C. クエリ結果に寄与する基礎データが変更されていない。
> D. クエリがランタイム関数を使用していない。
> E. クエリがユーザー定義関数または外部関数を使用していない。

---

## 3-1. 解説文（英語）

> All of these are correct. Snowflake uses the query result cache if the following conditions are met. A new query matches an old query, and the underlying data contributing to the query results remains unchanged. The table micro-partitions have not changed as a result of clustering or consolidation. The query makes no use of user-defined, external, or runtime functions. Note that queries that use the CURRENT DATE function are eligible for query result caching.

## 3-2. 解説文の文法解析

### 文1: "Snowflake uses the query result cache if the following conditions are met."

- **主語 (S)**: Snowflake
- **動詞 (V)**: uses（使用する）
- **目的語 (O)**: the query result cache
- **条件節**: if the following conditions are met（以下の条件が満たされる場合）← `be met` = 受動態
- **注目ポイント**: `if conditions are met` = 「条件が満たされれば」。技術仕様の条件節定番表現

### 文2: "The query makes no use of user-defined, external, or runtime functions."

- **主語 (S)**: The query
- **動詞 (V)**: makes no use of（一切使用しない）← `make use of` の否定強調形
- **目的語**: user-defined, external, or runtime functions（UDF・外部関数・ランタイム関数）
- **注目ポイント**: `make no use of ~` = 「〜を一切使用しない」。`does not use ~` より強い否定表現

### 文3: "Note that queries that use the CURRENT DATE function are eligible for query result caching."

- **動詞 (V)**: Note that（〜に注意せよ）← 命令形で重要情報を導く
- **主語 (S)**: queries that use the CURRENT DATE function（CURRENT DATE関数を使うクエリが）
- **動詞 (V2)**: are eligible for（〜の資格がある・〜の対象になる）
- **目的語**: query result caching（クエリ結果キャッシュの）
- **注目ポイント**: `be eligible for ~` = 「〜の対象になる・〜の資格がある」。例外事項を説明する重要表現

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| make no use of ~ | 熟語 | 〜を一切使用しない | The query must make no use of runtime functions. |
| be eligible for ~ | 熟語 | 〜の対象になる、〜の資格がある | CURRENT_DATE queries are eligible for caching. |
| note that ~ | 命令句 | 〜に注意せよ（重要な例外・補足を導く） | Note that CURRENT_DATE is an exception. |

## 3-3. 解説文（日本語）

> これらはすべて正解です。Snowflakeは以下の条件が満たされた場合にQuery Result Cacheを使用します。新しいクエリが過去のクエリと一致し、かつクエリ結果に寄与する基礎データが変更されていない。テーブルのマイクロパーティションがクラスタリングまたは統合によって変更されていない。クエリがユーザー定義関数・外部関数・ランタイム関数を一切使用していない。なお、CURRENT_DATE関数を使用するクエリはQuery Result Cacheの対象になります。

---

## 復習メモ

- [ ] キャッシュ再利用の5条件をすべて列挙できる
- [ ] CURRENT_DATEはキャッシュ対象（例外）であることを覚えた
- [ ] ランタイム関数（RANDOM等）とCURRENT_DATEの違いを説明できる
- [ ] 英語の文法ポイント（must be met / make no use of / be eligible for / note that）を確認した
- [ ] この問題は理論問題のためサンドボックス検証は不要
