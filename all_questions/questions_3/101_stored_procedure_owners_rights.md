# 101: Stored Procedure — Owner's Rights Execution

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-17
**正答**: D（The stored procedure has been configured to run under the owner's rights.）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Stored Procedure | 再利用可能なSQLロジックをカプセル化したプロシージャ。Snowflake Scripting、JavaScript、Pythonなどで記述できる |
| Owner's Rights | ストアドプロシージャがその作成者（所有者）のロールの権限で実行されるモード。呼び出し元の権限に関係なく動作する |
| Caller's Rights | ストアドプロシージャが呼び出しユーザーの権限で実行されるモード。呼び出し元のロールによって実行範囲が変わる |
| EXECUTE AS OWNER | ストアドプロシージャをOwner's Rightsで実行するためのDDLオプション（デフォルト）|
| EXECUTE AS CALLER | ストアドプロシージャをCaller's Rightsで実行するためのDDLオプション |

## 1-2. 重要コンセプトまとめ

- **デフォルトはOwner's Rights（作成者の権限で実行）**
  - `EXECUTE AS OWNER` または省略時はOwner's Rights
- **Caller's Rights は明示的に設定が必要**
  - `EXECUTE AS CALLER` と指定した場合のみCaller's Rightsになる
- **Owner's Rightsの用途: 呼び出し元に権限がなくても特定のオブジェクトにアクセスさせたいとき**
  - 例: 一般ユーザーにDBA権限のテーブルへのアクセスを限定的に許可
- **Caller's Rightsの用途: 呼び出し元の権限を尊重したいとき（セキュリティ上重要）**
  - 例: 各ユーザーが自分のデータにのみアクセスするプロシージャ

## 1-3. 公式ドキュメントURL

- [Stored Procedure Rights](https://docs.snowflake.com/en/sql-reference/stored-procedures-rights)
- [CREATE PROCEDURE](https://docs.snowflake.com/en/sql-reference/sql/create-procedure)

---

## 2-1. 問題文（英語）

> Under which condition a stored procedure will execute under the privileges of the role that created the stored procedure?
>
> A. The stored procedure changes the system security settings.
> B. The stored procedure has been configured to run under the caller's rights.
> C. The stored procedure performs account-level modifications.
> D. The stored procedure has been configured to run under the owner's rights.

## 2-2. 問題文の文法解析

### 文1: "Under which condition a stored procedure will execute under the privileges of the role that created the stored procedure?"

- **疑問句**: Under which condition（前置詞 + 疑問詞）
- **主語 (S)**: a stored procedure
- **動詞 (V)**: will execute
- **修飾語 (M)**: under the privileges of the role that created the stored procedure（実行の条件）
- **関係詞節**: that created the stored procedure（the role を修飾）
- **注目ポイント**: 
  - `under the privileges of ~` = 〜の権限のもとで
  - `Under which condition` = どの条件のもとで（前置詞を文頭に置いた間接疑問文）

### 選択肢B/Dの構文: "The stored procedure has been configured to run under the [caller's/owner's] rights."

- **主語 (S)**: The stored procedure
- **動詞 (V)**: has been configured（現在完了受動態）
- **不定詞**: to run under the [caller's/owner's] rights
- **注目ポイント**: 
  - `has been configured to ~` = 〜するように設定されている（完了形の受動態 + 不定詞）
  - `caller's rights` vs `owner's rights` の対比

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| privilege | 名詞 | 権限 | The procedure executes under the owner's privileges. |
| configure | 動詞 | 設定する | Configure the procedure to run under caller's rights. |
| caller | 名詞 | 呼び出し元 | The caller's rights determine access in that mode. |
| owner | 名詞 | 所有者、作成者 | The owner's role defines the execution context. |
| execute | 動詞 | 実行する | The stored procedure executes with elevated privileges. |

## 2-3. 問題文（日本語）

> ストアドプロシージャが、そのプロシージャを作成したロールの権限で実行されるのはどのような条件の場合ですか？
>
> A. ストアドプロシージャがシステムのセキュリティ設定を変更する場合。
> B. ストアドプロシージャがCaller's Rightsで実行するように設定されている場合。
> C. ストアドプロシージャがアカウントレベルの変更を実行する場合。
> D. ストアドプロシージャがOwner's Rightsで実行するように設定されている場合。

---

## 3-1. 解説文（英語）

> A stored procedure can be called with either the caller's rights or the owner's rights. A stored procedure configured to run with callers' rights executes under the permissions of the calling user. A stored procedure configured to run with the owner's rights executes under the privileges of the role that created and owns the stored procedure. https://docs.snowflake.com/en/sql-reference/stored-procedures-rights

## 3-2. 解説文の文法解析

### 文1: "A stored procedure can be called with either the caller's rights or the owner's rights."

- **主語 (S)**: A stored procedure
- **動詞 (V)**: can be called（受動態 + 助動詞）
- **修飾語 (M)**: with either the caller's rights or the owner's rights
- **注目ポイント**: `either A or B` = AかBのどちらかで（2択を示す）

### 文2: "A stored procedure configured to run with callers' rights executes under the permissions of the calling user."

- **主語 (S)**: A stored procedure configured to run with callers' rights（過去分詞句が主語を修飾）
- **動詞 (V)**: executes
- **修飾語 (M)**: under the permissions of the calling user
- **注目ポイント**: 
  - `configured to run with ~` = 〜で実行するように設定された（過去分詞の後置修飾）
  - `the calling user` = 呼び出しユーザー（現在分詞が形容詞として使用）

### 文3: "A stored procedure configured to run with the owner's rights executes under the privileges of the role that created and owns the stored procedure."

- **主語 (S)**: A stored procedure configured to run with the owner's rights
- **動詞 (V)**: executes
- **修飾語 (M)**: under the privileges of the role that created and owns the stored procedure
- **関係詞節**: that created and owns the stored procedure（the role を修飾、created と owns の2動詞）
- **注目ポイント**: `that created and owns` は関係詞節内で2つの動詞を等位接続

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| caller | 名詞 | 呼び出し元 | The caller's rights depend on the invoking user's role. |
| either A or B | 接続詞句 | AかBのどちらか | It can run under either caller's or owner's rights. |
| permission | 名詞 | 権限（privilegeと同義） | Callers' rights uses the calling user's permissions. |

## 3-3. 解説文（日本語）

> ストアドプロシージャは、Caller's RightsまたはOwner's Rightsのいずれかで呼び出すことができます。Caller's Rightsで実行するように設定されたストアドプロシージャは、呼び出しユーザーの権限で実行されます。Owner's Rightsで実行するように設定されたストアドプロシージャは、そのストアドプロシージャを作成・所有するロールの権限で実行されます。

---

## 復習メモ

- [ ] Owner's Rights（デフォルト：作成者権限）とCaller's Rights（呼び出し元権限）の違いを理解した
- [ ] `has been configured to run under` という現在完了受動態 + 不定詞の構文を確認した
- [ ] `either A or B` の使い方を習得した
