# 075: User Management Roles

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-16
**正答**: A, C, D

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| USERADMIN | ユーザーとロールの作成・管理に特化したシステムロール。`CREATE USER` と `CREATE ROLE` の権限を持つ |
| SECURITYADMIN | アクセス権（GRANT/REVOKE）を管理するロール。USERADMINの権限を継承するため、ユーザー管理も可能 |
| ACCOUNTADMIN | 最も強力なシステムロール。すべての権限を持ち、ユーザー管理も当然可能 |
| SYSADMIN | データベース・ウェアハウス・テーブル等のオブジェクト作成・管理ロール。ユーザーの作成・管理は**不可** |
| Privilege Inheritance（権限継承） | ロール階層で下位ロールの権限が上位ロールに自動継承される仕組み |

## 1-2. 重要コンセプトまとめ

- **ユーザーを作成・管理できるロール**（3つ暗記必須）:
  1. **USERADMIN** — ユーザー/ロール管理の専門ロール
  2. **SECURITYADMIN** — USERADMINの権限を継承
  3. **ACCOUNTADMIN** — すべての権限を持つ最上位ロール
- **SYSADMIN はユーザーを作成できない** — オブジェクト管理が専門
- ロール継承の階層: ACCOUNTADMIN > SECURITYADMIN > USERADMIN
- SECURITYADMINがユーザー管理できる理由は**権限継承**（USERADMINの権限を継承するから）
- PUBLICロールはすべてのユーザーに自動付与される最小権限ロール

## 1-3. 公式ドキュメントURL

- [System-Defined Roles](https://docs.snowflake.com/en/user-guide/security-access-control-overview#system-defined-roles)

---

## 2-1. 問題文（英語）

> Which of the following roles can create & manage users? Select all that apply.
>
> A. USERADMIN
> B. SYSADMIN
> C. SECURITYADMIN
> D. ACCOUNTADMIN

## 2-2. 問題文の文法解析

### 文1: "Which of the following roles can create & manage users?"

- **主語 (S)**: Which of the following roles
- **動詞 (V)**: can create & manage
- **目的語 (O)**: users
- **文型**: SVO
- **注目ポイント**: 「create & manage」で作成と管理の両方を問う。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| create & manage | 動詞句 | 作成・管理する | Which roles can create and manage users? |

## 2-3. 問題文（日本語）

> 以下のうちユーザーを作成・管理できるロールはどれですか？該当するものをすべて選んでください。
>
> A. USERADMIN
> B. SYSADMIN
> C. SECURITYADMIN
> D. ACCOUNTADMIN

---

## 3-1. 解説文（英語）

> The USERADMIN role is typically meant for creating and managing users. However, the privileges of the USERADMIN role are inherited by SECURITYADMIN and ACCOUNTADMIN; therefore, they also get the privileges to create users. ACCOUNTADMIN is the most powerful role anyway and can do anything in a Snowflake account.

## 3-2. 解説文の文法解析

### 文1: "The USERADMIN role is typically meant for creating and managing users."

- **主語 (S)**: The USERADMIN role
- **動詞 (V)**: is meant for（受動態）
- **修飾語 (M)**: typically / creating and managing users（目的）
- **文型**: SV（受動態）
- **注目ポイント**: 「is meant for ~」で「～を意図して設計されている」。

### 文2: "However, the privileges of the USERADMIN role are inherited by SECURITYADMIN and ACCOUNTADMIN; therefore, they also get the privileges to create users."

- **主語 (S)**: the privileges of the USERADMIN role / they
- **動詞 (V)**: are inherited / get
- **修飾語 (M)**: by SECURITYADMIN and ACCOUNTADMIN（動作主）/ therefore / also
- **文型**: SV（受動態）; SVO
- **注目ポイント**: 「are inherited by ~」で権限継承を示す。「therefore」で因果関係。セミコロンで2文を連結。

### 文3: "ACCOUNTADMIN is the most powerful role anyway and can do anything in a Snowflake account."

- **主語 (S)**: ACCOUNTADMIN
- **動詞 (V)**: is / can do
- **補語/目的語**: the most powerful role / anything
- **修飾語 (M)**: anyway / in a Snowflake account
- **文型**: SVC + SVO
- **注目ポイント**: 「anyway」で「いずれにしても」。ACCOUNTADMINの絶対的な権限を強調。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| is meant for | 受動態 | ～を意図して設計されている | USERADMIN is meant for managing users. |
| are inherited by | 受動態 | ～に継承される | Privileges are inherited by SECURITYADMIN. |
| therefore | 副詞 | したがって | Therefore, they also get the privileges. |
| anyway | 副詞 | いずれにしても | ACCOUNTADMIN is the most powerful role anyway. |

## 3-3. 解説文（日本語）

> USERADMINロールは通常、ユーザーの作成と管理を目的として設計されています。しかし、USERADMINロールの権限はSECURITYADMINとACCOUNTADMINに継承されます。そのため、これらのロールもユーザーを作成する権限を持ちます。ACCOUNTADMINはいずれにしても最も強力なロールであり、Snowflakeアカウント内であらゆることが可能です。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
