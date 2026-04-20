# 099: System-Defined Roles in Snowflake

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-17
**正答**: A, B, D（USERADMIN, SECURITYADMIN, ACCOUNTADMIN）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| System-Defined Role | Snowflakeがデフォルトで用意しているビルトインロール。ユーザーが作成するカスタムロールとは異なる |
| ORGADMIN | 組織レベルの操作（アカウント作成、使用状況確認など）を行うロール |
| ACCOUNTADMIN | アカウント全体の最高権限ロール。すべてのオブジェクトとすべての権限を持つ |
| SECURITYADMIN | ユーザー、ロール、ネットワークポリシーなどセキュリティ関連の管理を担うロール |
| USERADMIN | ユーザーとロールの作成・管理に特化したロール |
| SYSADMIN | データベース、スキーマ、ウェアハウスなどのオブジェクトを作成・管理するロール |
| PUBLIC | すべてのユーザーに自動付与されるデフォルトロール。最小権限 |

## 1-2. 重要コンセプトまとめ

- **ビルトインロールは6種類: ORGADMIN, ACCOUNTADMIN, SECURITYADMIN, USERADMIN, SYSADMIN, PUBLIC**
  - ROOT というロールは存在しない（誤り選択肢）
- **ロール階層**: ACCOUNTADMIN > SECURITYADMIN > USERADMIN（上位ロールは下位ロールの権限を継承）
- **ACCOUNTADMIN は最強ロール**（ORGADMIN はアカウント横断の組織管理に特化した別物）
- **試験でよく問われる: 「ROOTは存在しない」「SYSADMINは含まれる」**

## 1-3. 公式ドキュメントURL

- [System-Defined Roles](https://docs.snowflake.com/en/user-guide/security-access-control-overview#system-defined-roles)

---

## 2-1. 問題文（英語）

> Which of the following roles are available out of the box in Snowflake?
>
> A. USERADMIN
> B. SECURITYADMIN
> C. ROOT
> D. ACCOUNTADMIN

## 2-2. 問題文の文法解析

### 文1: "Which of the following roles are available out of the box in Snowflake?"

- **主語 (S)**: Which of the following roles
- **動詞 (V)**: are available
- **修飾語 (M)**: out of the box（成句）/ in Snowflake
- **文型**: SVC（available が形容詞補語）
- **注目ポイント**: 
  - `out of the box` = すぐに使える状態で、最初から。「箱から出してすぐ使える」という成句
  - `Which of the following` = 次のうちどれが（複数選択問題の定番フレーズ）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| out of the box | 成句（副詞句） | すぐに使える状態で、デフォルトで | These roles are available out of the box without configuration. |
| available | 形容詞 | 利用可能な | The ACCOUNTADMIN role is available in all editions. |
| built-in | 形容詞 | ビルトインの、組み込みの | Snowflake provides several built-in system roles. |

## 2-3. 問題文（日本語）

> 次のうち、Snowflakeにデフォルトで用意されているロールはどれですか？
>
> A. USERADMIN
> B. SECURITYADMIN
> C. ROOT
> D. ACCOUNTADMIN

---

## 3-1. 解説文（英語）

> Built-in Snowflake roles include ORGADMIN, ACCOUNTADMIN, USERADMIN, SECURITYADMIN, SYSADMIN, and PUBLIC. https://docs.snowflake.com/en/user-guide/security-access-control-overview#system-defined-roles

## 3-2. 解説文の文法解析

### 文1: "Built-in Snowflake roles include ORGADMIN, ACCOUNTADMIN, USERADMIN, SECURITYADMIN, SYSADMIN, and PUBLIC."

- **主語 (S)**: Built-in Snowflake roles
- **動詞 (V)**: include
- **目的語 (O)**: ORGADMIN, ACCOUNTADMIN, USERADMIN, SECURITYADMIN, SYSADMIN, and PUBLIC（列挙）
- **文型**: SVO
- **注目ポイント**: 
  - `Built-in` は形容詞として roles を前置修飾
  - `include` = 含む（網羅的な列挙に使う動詞）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| built-in | 形容詞 | 組み込みの、ビルトインの | Built-in roles cannot be deleted. |
| include | 動詞 | 含む | The list includes all system-defined roles. |

## 3-3. 解説文（日本語）

> Snowflakeのビルトインロールには、ORGADMIN、ACCOUNTADMIN、USERADMIN、SECURITYADMIN、SYSADMIN、PUBLICが含まれます。

---

## 復習メモ

- [ ] 6種類のビルトインロールをすべて暗記した
- [ ] ROOTは存在しないことを確認した
- [ ] "out of the box" という成句表現を理解した
