# 032: Stored Procedure Owner's Rights Default

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-15
**正答**: C, D

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Owner's Rights（所有者権限） | ストアドプロシージャのデフォルト実行モード。作成・所有ロールの権限で実行 |
| Caller's Rights（呼び出し者権限） | 呼び出しユーザーの権限で実行するモード。明示的に指定が必要 |

## 1-2. 重要コンセプトまとめ

- デフォルトは **Owner's Rights**（所有者権限）
- **ALTERで後から変更可能**（Owner's ↔ Caller's）
- 「一度作成したら変更不可」は誤り
- 「デフォルトがCaller's Rights」は誤り

## 1-3. 公式ドキュメントURL

- [Stored Procedures Rights](https://docs.snowflake.com/en/sql-reference/stored-procedures-rights)

---

## 2-1. 問題文（英語）

> Which of the following is true regarding stored procedures?
>
> A. Once created, a stored procedure can not be altered to configure if it runs under owner's rights or caller's rights.
> B. A newly created stored procedure defaults to run under the caller's privileges.
> C. A stored procedure can be altered to configure if it runs under owner's rights or caller's rights.
> D. A newly created stored procedure defaults to run under the owner's privileges.

## 2-3. 問題文（日本語）

> ストアドプロシージャに関して正しいのはどれですか？

---

## 3-1. 解説文（英語）

> You can specify if a stored procedure runs under the caller's or owner's rights when creating the stored procedure. It defaults to the owner's right if nothing is specified. It is possible to change this configuration later by altering the stored procedure.

## 3-3. 解説文（日本語）

> ストアドプロシージャ作成時にCaller's/Owner's Rightsを指定できます。未指定の場合はOwner's Rightsがデフォルトです。ALTER文で後から変更も可能です。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
