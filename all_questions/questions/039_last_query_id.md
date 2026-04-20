# 039: LAST_QUERY_ID Function — Negative vs Positive Parameters

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-02
**正答**: D（`SELECT LAST_QUERY_ID(-2);`）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| LAST_QUERY_ID() | 現在のセッションで実行されたクエリのQuery IDを返す関数。引数で何番目のクエリかを指定する。デフォルト（引数なし）は `-1`（最新クエリ） |
| Query ID（クエリID） | Snowflakeが各クエリに割り当てる一意の識別子。クエリの追跡・デバッグ・キャンセルなどに使用される |
| Session（セッション） | Snowflakeへのひとつのログインからログアウトまでの間の接続。LAST_QUERY_IDはセッション内のクエリ履歴を参照する |

## 1-2. 重要コンセプトまとめ

- **負の数 = 新しいほうから数える（試験頻出）**:
  - `-1` = 最も新しいクエリ（= デフォルト）
  - `-2` = 2番目に新しいクエリ
  - `-N` = N番目に新しいクエリ

- **正の数 = 古いほうから数える**:
  - `1` = セッションの最初のクエリ
  - `2` = セッションの2番目のクエリ
  - `N` = N番目に古いクエリ

- **デフォルト値は `-1`**: `SELECT LAST_QUERY_ID()` は `SELECT LAST_QUERY_ID(-1)` と同じ

- **引っかけポイント**: 「2番目に最近（2nd most recent）」と聞かれたとき `2` と答えがちだが、正しくは `-2`。正の数は古い順なので逆

- **直感的な覚え方**: マイナス方向 = 時間を「遡る（最近 → 昔）」イメージ。プラス方向 = 時間を「進む（昔 → 最近）」イメージ

## 1-3. 公式ドキュメントURL

- [LAST_QUERY_ID Function](https://docs.snowflake.com/en/sql-reference/functions/last_query_id)

---

## 2-1. 問題文（英語）

> Which of the following can be used to find the query ID of the 2nd most recent query executed in the current session?
>
> A. `SELECT LAST_QUERY_ID(2);`
> B. `SELECT LAST_QUERY_ID(1);`
> C. `SELECT LAST_QUERY_ID(-1);`
> D. `SELECT LAST_QUERY_ID(-2);`

## 2-2. 問題文の文法解析

### 文1: "Which of the following can be used to find the query ID of the 2nd most recent query executed in the current session?"

- **主語 (S)**: Which of the following（以下のうちどれが）
- **動詞 (V)**: can be used（使用することができる）← 助動詞 + 受動態
- **修飾語 (M1)**: to find the query ID（クエリIDを見つけるために）← 目的の to 不定詞
- **修飾語 (M2)**: of the 2nd most recent query（2番目に最近のクエリの）← 所有格前置詞句
- **修飾語 (M3)**: executed in the current session（現在のセッションで実行された）← 過去分詞の後置修飾
- **文型**: SV（受動態、倒置）
- **注目ポイント**:
  - `the 2nd most recent ~` = 「2番目に最近の〜」。序数（2nd）+ 最上級（most recent）の組み合わせ
  - `executed in the current session` = 過去分詞後置修飾。`query` を修飾

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| the Nth most recent | 形容詞句 | N番目に最近の | Find the 2nd most recent query in the session. |
| execute | 動詞 | 実行する | Queries are executed against stored data. |
| session | 名詞 | セッション（接続単位） | LAST_QUERY_ID tracks queries within the current session. |
| query ID | 名詞句 | クエリID（一意の識別子） | Use the query ID to check execution status. |

## 2-3. 問題文（日本語）

> 現在のセッションで実行された2番目に最近のクエリのクエリIDを取得するために使用できるものはどれですか？
>
> A. `SELECT LAST_QUERY_ID(2);`
> B. `SELECT LAST_QUERY_ID(1);`
> C. `SELECT LAST_QUERY_ID(-1);`
> D. `SELECT LAST_QUERY_ID(-2);`

---

## 3-1. 解説文（英語）

> The LAST_QUERY_ID function returns the query ID of a specified query in the current session. The function takes a number as the parameter, which specifies the position of the query in the session.
>
> The parameter can take positive or negative values. A negative value means you are attempting to fetch the most recent query in the session, where
>
> -1 = most recent query
> -2 = 2nd most recent query
>
> , and so on. The function defaults to -1, so if no value is provided, it will return the query id of the most recent query.
>
> A positive number returns the earliest queries in the session. i.e.
>
> 1 = first query
> 2 = 2nd query

## 3-2. 解説文の文法解析

### 文1: "The LAST_QUERY_ID function returns the query ID of a specified query in the current session."

- **主語 (S)**: The LAST_QUERY_ID function（LAST_QUERY_ID関数は）
- **動詞 (V)**: returns（返す）
- **目的語 (O)**: the query ID（クエリIDを）
- **修飾語 (M1)**: of a specified query（指定されたクエリの）← `specified` = 過去分詞形容詞「指定された」
- **修飾語 (M2)**: in the current session（現在のセッションにおける）
- **文型**: SVO
- **注目ポイント**: `specified` = 「指定された」。`specific`（特定の）とは異なり、ユーザーが引数で明示的に指定したことを含意

### 文2: "The function takes a number as the parameter, which specifies the position of the query in the session."

- **主語 (S)**: The function（この関数は）
- **動詞 (V)**: takes（受け取る）
- **目的語 (O)**: a number（数値を）
- **補語的修飾**: as the parameter（パラメータとして）← `as ~` = 役割を示す前置詞
- **修飾語 (M)**: which specifies the position of the query in the session（セッション内のクエリの位置を指定する）← 非制限関係詞節
- **文型**: SVO
- **注目ポイント**: `take A as B` = 「AをBとして受け取る」。関数の引数説明の定番パターン

### 文3: "A negative value means you are attempting to fetch the most recent query in the session, where -1 = most recent query, -2 = 2nd most recent query, and so on."

- **主語 (S)**: A negative value（負の値は）
- **動詞 (V)**: means（意味する）
- **目的語 (O)**: you are attempting to fetch the most recent query（最も最近のクエリを取得しようとしていること）← that節（that省略）
- **修飾語**: where -1 = most recent query...（-1が最新クエリ…という意味で）← `where` は「〜という文脈で・そこでは」の意味
- **注目ポイント**: `and so on` = 「などなど、以下同様」。数列のパターンが続くことを示す

### 文4: "The function defaults to -1, so if no value is provided, it will return the query id of the most recent query."

- **主語 (S1)**: The function（この関数は）
- **動詞 (V1)**: defaults to（デフォルト値は〜）← `default to ~` = 「〜をデフォルトとする」
- **接続詞**: so（したがって）
- **条件節**: if no value is provided（値が指定されない場合）
- **主語 (S2)**: it（それは）
- **動詞 (V2)**: will return（返す）
- **目的語 (O)**: the query id of the most recent query
- **注目ポイント**: `default to ~` は設定・関数のデフォルト値を説明する定番表現

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| specified | 形容詞 | 指定された | The function returns the ID of the specified query. |
| attempt to ~ | 熟語 | 〜しようとする | A negative value means you are attempting to fetch recent queries. |
| fetch | 動詞 | 取得する（データを）| The function fetches the query ID from session history. |
| default to ~ | 句動詞 | 〜をデフォルトとする | LAST_QUERY_ID defaults to -1. |
| and so on | 副詞句 | などなど、以下同様 | -1, -2, -3, and so on. |
| i.e. | 略語 | すなわち（= that is） | A positive number returns earliest queries, i.e., 1 = first query. |

## 3-3. 解説文（日本語）

> LAST_QUERY_ID関数は、現在のセッションで指定されたクエリのクエリIDを返します。この関数はパラメータとして数値を受け取り、セッション内のクエリの位置を指定します。
>
> パラメータは正の値と負の値を取ることができます。負の値はセッション内の最新クエリを取得しようとしていることを意味し、以下のように対応します：
>
> -1 = 最も新しいクエリ
> -2 = 2番目に新しいクエリ
>
> 以下同様です。この関数のデフォルトは -1 なので、値が指定されない場合、最も新しいクエリのIDを返します。
>
> 正の数はセッションで最も古いクエリから順に返します：
>
> 1 = 最初のクエリ
> 2 = 2番目のクエリ

---

## 復習メモ

- [ ] 負の引数（最新から）と正の引数（古い順から）の違いを覚えた
- [ ] LAST_QUERY_ID(-2) = 2番目に新しいクエリを即答できる
- [ ] デフォルト値が -1 であることを確認した
- [ ] 英語の文法ポイント（default to / take A as B / and so on）を確認した
- [ ] サンドボックスで `SELECT LAST_QUERY_ID(-1);` などを実際に試したい場合は検証可能
