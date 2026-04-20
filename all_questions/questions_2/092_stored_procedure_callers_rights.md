# 092: Stored Procedure Caller's Rights

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-14
**正答**: C

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Caller's Rights（呼び出し者権限） | ストアドプロシージャを呼び出したユーザーの権限で実行するモード。呼び出し者が持つ権限のみ使用可能 |
| Owner's Rights（所有者権限） | ストアドプロシージャを作成・所有するロールの権限で実行するモード。呼び出し者の権限に関係なく実行 |

## 1-2. 重要コンセプトまとめ

- Stored Procedureの実行権限モードは**2種類**:
  - **Caller's Rights**: 呼び出し者の権限で実行
  - **Owner's Rights**: 所有者ロールの権限で実行
- 呼び出し者の権限で実行される条件 = **Caller's Rights に設定されている場合**
- SQL文の数やDML操作の有無は実行権限に影響しない

## 1-3. 公式ドキュメントURL

- [Stored Procedures Overview](https://docs.snowflake.com/en/sql-reference/stored-procedures-overview)

---

## 2-1. 問題文（英語）

> Under which condition a stored procedure will execute under the privileges of the person calling the stored procedure?
>
> A. The stored procedure has been configured to run under the owner's rights.
> B. The stored procedure has a single SQL statement in its definition.
> C. The stored procedure has been configured to run under the caller's rights.
> D. The stored procedure doesn't perform any DML operations.

## 2-2. 問題文の文法解析

### 文1: "Under which condition a stored procedure will execute under the privileges of the person calling the stored procedure?"

- **注目ポイント**: `under the privileges of ~` は「～の権限のもとで」。`the person calling ~` は現在分詞の後置修飾で「～を呼び出す人」。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| caller's rights | noun | 呼び出し者権限 | Configured to run under caller's rights. |
| owner's rights | noun | 所有者権限 | Runs under the owner's privileges. |
| privileges | noun | 権限 | Executes under the calling user's privileges. |

## 2-3. 問題文（日本語）

> ストアドプロシージャが呼び出し者の権限で実行されるのは、どの条件の場合ですか？

---

## 3-1. 解説文（英語）

> A stored procedure can be called with either the caller's rights or the owner's rights. A stored procedure configured to run with callers' rights executes under the permissions of the calling user. A stored procedure configured to run with the owner's rights executes under the privileges of the role that created and owns the stored procedure.

## 3-2. 解説文の文法解析

### 文1: "A stored procedure configured to run with callers' rights executes under the permissions of the calling user."

- **注目ポイント**: `configured to run with ~` は過去分詞の後置修飾。`executes under the permissions of ~` で権限の所在を明示。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| configured to run with ~ | phrase | ～で実行するよう構成された | Configured to run with caller's rights. |
| the calling user | noun | 呼び出しユーザー | Permissions of the calling user. |

## 3-3. 解説文（日本語）

> ストアドプロシージャは呼び出し者権限または所有者権限のいずれかで呼び出すことができます。呼び出し者権限で実行するよう構成されたプロシージャは、呼び出しユーザーの権限で実行されます。所有者権限で実行するよう構成されたプロシージャは、そのプロシージャを作成・所有するロールの権限で実行されます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
