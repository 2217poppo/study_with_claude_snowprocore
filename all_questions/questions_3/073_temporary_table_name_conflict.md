# 073: Temporary Table Name Conflict

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-16
**正答**: D

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Temporary Table（一時テーブル） | セッション終了時に自動削除されるテーブル。セッションスコープのため、命名の一意性制約が適用されない |
| Permanent Table（永続テーブル） | 通常のテーブル。明示的にDROPするまで存在し続ける |
| Transient Table（一時的テーブル） | Fail-Safeがないテーブル。Permanentと異なりFail-Safe期間のストレージコストがかからない |
| Session Scope（セッションスコープ） | テーブルの有効範囲がセッション内に限定されること。他のセッションからは見えない |

## 1-2. 重要コンセプトまとめ

- 一時テーブルは同名の永続/一時的テーブルが存在しても**同じスキーマに作成可能**
- 同名の場合、一時テーブルが**永続テーブルを「隠す」**（hide）
- そのセッション内ではクエリや操作は**一時テーブルに対してのみ**実行される
- 永続テーブルのデータ（10,000行）ではなく、一時テーブルのデータ（0行）が返る
- エラーにはならない（duplicate error でも unknown object error でもない）
- セッション終了後、永続テーブルが再び見えるようになる
- この動作は予期しない結果を招く可能性があるため注意が必要

## 1-3. 公式ドキュメントURL

- [Potential Naming Conflicts with Other Table Types](https://docs.snowflake.com/en/user-guide/tables-temp-transient#potential-naming-conflicts-with-other-table-types)

---

## 2-1. 問題文（英語）

> Consider a database with the name MARKETING. The database has a table called CUSTOMER in the PUBLIC schema. The table has 10,000 rows.
>
> You create a temporary table with the same name, i.e., CUSTOMER, in the PUBLIC schema of the MARKETING database. This temporary table has no data.
>
> Which of the following statements correctly describes the behavior for SELECT queries (in the same session) accessing the CUSTOMER table?
>
> A. Executing "SELECT * FROM MARKETING.PUBLIC.CUSTOMER;" query fails with a duplicate error.
> B. Executing "SELECT * FROM MARKETING.PUBLIC.CUSTOMER;" query fails with an unknown object error.
> C. Executing "SELECT * FROM MARKETING.PUBLIC.CUSTOMER;" query returns 10,000 rows.
> D. Executing "SELECT * FROM MARKETING.PUBLIC.CUSTOMER;" query returns zero rows.

## 2-2. 問題文の文法解析

### 文1: "Consider a database with the name MARKETING."

- **主語 (S)**: （命令文 = You）
- **動詞 (V)**: Consider
- **目的語 (O)**: a database with the name MARKETING
- **文型**: SVO（命令文）

### 文2: "You create a temporary table with the same name, i.e., CUSTOMER, in the PUBLIC schema of the MARKETING database."

- **主語 (S)**: You
- **動詞 (V)**: create
- **目的語 (O)**: a temporary table with the same name
- **修飾語 (M)**: i.e., CUSTOMER（言い換え）/ in the PUBLIC schema of the MARKETING database（場所）
- **文型**: SVO
- **注目ポイント**: 「i.e.,」で具体名を補足。「with the same name」で同名であることを強調。

### 文3: "Which of the following statements correctly describes the behavior for SELECT queries (in the same session) accessing the CUSTOMER table?"

- **主語 (S)**: Which of the following statements
- **動詞 (V)**: correctly describes
- **目的語 (O)**: the behavior for SELECT queries
- **修飾語 (M)**: (in the same session) / accessing the CUSTOMER table（現在分詞の後置修飾）
- **文型**: SVO
- **注目ポイント**: 「in the same session」が括弧で強調 — セッション内での動作が問われている。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| i.e. | 略語 | すなわち（id est） | The same name, i.e., CUSTOMER. |
| duplicate error | 名詞句 | 重複エラー | The query does not fail with a duplicate error. |
| in the same session | 前置詞句 | 同じセッション内で | Behavior in the same session. |

## 2-3. 問題文（日本語）

> MARKETINGという名前のデータベースについて考えてください。このデータベースにはPUBLICスキーマにCUSTOMERというテーブルがあり、10,000行のデータがあります。
>
> あなたはMARKETINGデータベースのPUBLICスキーマに、同じ名前（CUSTOMER）の一時テーブルを作成します。この一時テーブルにはデータがありません。
>
> （同じセッション内で）CUSTOMERテーブルにアクセスするSELECTクエリの動作を正しく説明している文はどれですか？
>
> A. "SELECT * FROM MARKETING.PUBLIC.CUSTOMER;" は重複エラーで失敗する。
> B. "SELECT * FROM MARKETING.PUBLIC.CUSTOMER;" は不明なオブジェクトエラーで失敗する。
> C. "SELECT * FROM MARKETING.PUBLIC.CUSTOMER;" は10,000行を返す。
> D. "SELECT * FROM MARKETING.PUBLIC.CUSTOMER;" は0行を返す。

---

## 3-1. 解説文（英語）

> Like permanent and transient tables, temporary tables belong to a database & schema. However, because they are limited to a session, the naming uniqueness constraints do not apply to them. Therefore, creating a temporary table with the same name as an existing table is possible. This can result in some potential conflicts and unexpected behavior.
>
> If a temporary table is created in a schema with the same name as a permanent (or transient) table, the temporary table effectively hides the permanent table in that session. Queries and other operations during the session will affect only the temporary table.

## 3-2. 解説文の文法解析

### 文1: "Like permanent and transient tables, temporary tables belong to a database & schema."

- **主語 (S)**: temporary tables
- **動詞 (V)**: belong to
- **目的語 (O)**: a database & schema
- **修飾語 (M)**: Like permanent and transient tables（比較）
- **文型**: SVO

### 文2: "However, because they are limited to a session, the naming uniqueness constraints do not apply to them."

- **主語 (S)**: the naming uniqueness constraints
- **動詞 (V)**: do not apply to
- **目的語 (O)**: them（= temporary tables）
- **修飾語 (M)**: However / because they are limited to a session（理由の副詞節）
- **文型**: SVO
- **注目ポイント**: 「naming uniqueness constraints do not apply」で命名の一意性制約が適用されないことを示す。

### 文3: "If a temporary table is created in a schema with the same name as a permanent (or transient) table, the temporary table effectively hides the permanent table in that session."

- **主語 (S)**: the temporary table
- **動詞 (V)**: hides
- **目的語 (O)**: the permanent table
- **修飾語 (M)**: If ~ is created ...（条件節）/ effectively / in that session
- **文型**: SVO
- **注目ポイント**: 「effectively hides」で「事実上隠す」。核心の動作。永続テーブルが一時テーブルに隠される。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| belong to | 動詞句 | ～に属する | Temporary tables belong to a database & schema. |
| naming uniqueness constraints | 名詞句 | 命名の一意性制約 | Uniqueness constraints do not apply. |
| effectively | 副詞 | 事実上、効果的に | The temp table effectively hides the permanent one. |
| hide | 動詞 | 隠す | The temporary table hides the permanent table. |

## 3-3. 解説文（日本語）

> 永続テーブルや一時的テーブルと同様に、一時テーブルもデータベースとスキーマに属します。しかし、セッションに限定されるため、命名の一意性制約は一時テーブルには適用されません。そのため、既存のテーブルと同じ名前の一時テーブルを作成することが可能です。これは潜在的な競合や予期しない動作を引き起こす可能性があります。
>
> 永続（または一時的）テーブルと同じ名前の一時テーブルがスキーマ内に作成された場合、一時テーブルはそのセッション内で事実上永続テーブルを隠します。セッション中のクエリやその他の操作は一時テーブルにのみ影響します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
