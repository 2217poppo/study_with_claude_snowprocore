# 117: Time Travel SQL Access

**SnowPro Core Domain**: Domain 5 — Data Collaboration
**作成日**: 2026-04-14
**正答**: Use SQL to retrieve data in Time Travel.

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Time Travel SQL Extensions | AT/BEFORE句を使って過去のデータ状態にアクセスするSQL拡張。`SELECT ... AT(TIMESTAMP => '...')` |
| Fail-Safe | Time Travel後のデータ保護。**Snowflakeサポートのみ**がアクセス可能。ユーザーはアクセス不可 |
| Micro-Partition | Snowflakeの内部データ構造。ユーザーは**直接アクセス・変更不可** |

## 1-2. 重要コンセプトまとめ

- ユーザーが**できること**:
  - **SQLでTime Travelデータを取得** ✅（AT/BEFORE句）
- ユーザーが**できないこと**:
  - マイクロパーティションに直接アクセス ❌
  - マイクロパーティションを直接変更 ❌
  - Fail-SafeストレージのデータをSQL で取得 ❌（Snowflakeサポートのみ）

## 1-3. 公式ドキュメントURL

- [Time Travel SQL Extensions](https://docs.snowflake.com/en/user-guide/data-time-travel#time-travel-sql-extensions)

---

## 2-1. 問題文（英語）

> Which of the following actions can be performed by a Snowflake user?
>
> A. Directly access micro-partitions.
> B. Use SQL to retrieve data in Time Travel.
> C. Directly modify micro-partitions.
> D. Use SQL to retrieve historical data from fail-safe storage.

## 2-3. 問題文（日本語）

> Snowflakeユーザーが実行できるアクションはどれですか？

---

## 3-1. 解説文（英語）

> A Snowflake user may access Time Travel data using the SQL Time Travel extensions. Data stored in fail-safe storage can only be accessed by Snowflake support; a user can not access data in fail-safe storage. A user cannot access or alter micro-partitions directly.

## 3-3. 解説文（日本語）

> SnowflakeユーザーはSQL Time Travel拡張を使用してTime Travelデータにアクセスできます。Fail-Safeストレージのデータはnowflakeサポートのみがアクセス可能で、ユーザーはアクセスできません。ユーザーはマイクロパーティションに直接アクセスしたり変更したりすることはできません。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
