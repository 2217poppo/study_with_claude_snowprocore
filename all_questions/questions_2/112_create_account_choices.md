# 112: Create Account Choices

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-14
**正答**: A, E

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Region | Snowflakeアカウントがホストされるクラウドリージョン。クラウドプラットフォーム情報も含む |
| Snowflake Edition | アカウントのエディション（Standard/Enterprise/Business Critical/VPS） |
| Account Locator | アカウント作成後に自動付与される識別子。作成時に選択するものではない |
| CREATE ACCOUNT | 新しいSnowflakeアカウントを作成するSQL文。ORGADMINが実行 |

## 1-2. 重要コンセプトまとめ

- アカウント作成時に選択可能: **Region** と **Snowflake Edition**
- CREATE ACCOUNTで指定可能な項目:
  - アカウント名
  - **Snowflake Edition**
  - **Region**（クラウドプラットフォーム含む）
  - Region Group
  - 管理者情報（名前・パスワード・メール）
- 選択**不可**:
  - Organization Name（既存組織に紐付く）
  - Payment Information（別途設定）
  - Account Locator（自動生成）
  - Account Locator URL（自動生成）

## 1-3. 公式ドキュメントURL

- [CREATE ACCOUNT](https://docs.snowflake.com/en/sql-reference/sql/create-account)

---

## 2-1. 問題文（英語）

> Which of the following can be chosen when creating a new Snowflake account? Select two.
>
> A. Region
> B. Organization Name
> C. Payment Information
> D. Account Locator
> E. Snowflake Edition
> F. Account Locator URL

## 2-3. 問題文（日本語）

> 新しいSnowflakeアカウントを作成する際に選択できるのは以下のどれですか？2つ選んでください。

---

## 3-1. 解説文（英語）

> Using the CREATE ACCOUNT statement, you can specify the account name, the Snowflake edition, the region (which contains the cloud platform information), the region group, and details about the administrative account, including name, password, email, etc.

## 3-3. 解説文（日本語）

> CREATE ACCOUNT文を使用して、アカウント名、Snowflakeエディション、リージョン（クラウドプラットフォーム情報を含む）、リージョングループ、管理者アカウントの詳細（名前・パスワード・メール等）を指定できます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
