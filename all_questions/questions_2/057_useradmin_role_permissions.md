# 057: USERADMIN Role Permissions

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-13
**正答**: B, C

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| USERADMIN | ユーザーとロールの作成・管理に特化した事前定義済みシステムロール。CREATE USERとCREATE ROLEの権限を持つ。グラント管理は不可 |
| SECURITYADMIN | オブジェクトへのGRANT/REVOKEを管理するロール。USERADMINの権限も継承する |
| SYSADMIN | データオブジェクト（DB・WH・テーブル等）の作成・管理ロール。ユーザー・ロールの作成は不可 |
| ACCOUNTADMIN | 最上位ロール。アカウント全体の管理が可能。SYSADMIN + SECURITYADMINの全権限を継承 |
| Object Grant（オブジェクトグラント） | オブジェクトへのアクセス権の付与。SECURITYADMINが管理する |

## 1-2. 重要コンセプトまとめ

- USERADMINの権限（**できること**）:
  - **CREATE USER** — ユーザーの作成
  - **CREATE ROLE** — ロールの作成
- USERADMINの制限（**できないこと**）:
  - Object Grants の管理（→ SECURITYADMINの担当）
  - アカウント全体の管理（→ ACCOUNTADMINの担当）
  - データオブジェクトの作成（→ SYSADMINの担当）
- ロールの責任分担:

| ロール | 担当 |
|--------|------|
| USERADMIN | ユーザー・ロールの作成 |
| SECURITYADMIN | グラント管理（+ USERADMIN権限を継承） |
| SYSADMIN | データオブジェクト管理 |
| ACCOUNTADMIN | アカウント全体管理（全権限継承） |

## 1-3. 公式ドキュメントURL

- [System-Defined Roles](https://docs.snowflake.com/en/user-guide/security-access-control-overview#system-defined-roles)

---

## 2-1. 問題文（英語）

> Which of the following statements is true regarding the USERADMIN role? Select all that apply.
>
> A. A user with the USERADMIN role can manage object grants.
> B. A user with the USERADMIN role can create new roles.
> C. A user with the USERADMIN role can create new users.
> D. A user with the USERADMIN role can manage the whole account.

## 2-2. 問題文の文法解析

### 文1: "Which of the following statements is true regarding the USERADMIN role?"

- **主語 (S)**: Which of the following statements
- **動詞 (V)**: is
- **補語 (C)**: true
- **修飾語 (M)**: regarding the USERADMIN role
- **文型**: SVC（疑問文）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| manage | verb | 管理する | USERADMIN cannot manage object grants. |
| object grant | noun | オブジェクトグラント | Grants are managed by SECURITYADMIN. |
| whole account | noun | アカウント全体 | Only ACCOUNTADMIN manages the whole account. |

## 2-3. 問題文（日本語）

> USERADMINロールに関して正しい記述はどれですか？該当するものをすべて選んでください。
>
> A. USERADMINロールのユーザーはオブジェクトグラントを管理できる。
> B. USERADMINロールのユーザーは新しいロールを作成できる。
> C. USERADMINロールのユーザーは新しいユーザーを作成できる。
> D. USERADMINロールのユーザーはアカウント全体を管理できる。

---

## 3-1. 解説文（英語）

> The USERADMIN role allows you to create USERS and ROLES for your organization. USERADMIN role doesn't allow managing object grants or managing the account.

## 3-2. 解説文の文法解析

### 文1: "The USERADMIN role allows you to create USERS and ROLES for your organization."

- **主語 (S)**: The USERADMIN role
- **動詞 (V)**: allows
- **目的語 (O)**: you
- **補語 (C)**: to create USERS and ROLES for your organization
- **文型**: SVOC（allow O to do）

### 文2: "USERADMIN role doesn't allow managing object grants or managing the account."

- **主語 (S)**: USERADMIN role
- **動詞 (V)**: doesn't allow
- **目的語 (O)**: managing object grants or managing the account
- **文型**: SVO
- **注目ポイント**: `doesn't allow ~ing or ~ing` で2つの不可能な操作を並列否定。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| allow O to do | phrase | Oが～することを許可する | USERADMIN allows you to create users. |
| doesn't allow ~ing | phrase | ～することを許可しない | Doesn't allow managing grants. |

## 3-3. 解説文（日本語）

> USERADMINロールは組織のユーザーとロールを作成することを許可します。USERADMINロールはオブジェクトグラントの管理やアカウントの管理は許可しません。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
