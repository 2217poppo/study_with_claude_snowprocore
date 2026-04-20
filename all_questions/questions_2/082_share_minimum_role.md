# 082: SHARE Minimum Role

**SnowPro Core Domain**: Domain 5 — Data Collaboration
**作成日**: 2026-04-13
**正答**: ACCOUNTADMIN

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| SHARE（共有） | Snowflakeのデータ共有オブジェクト。他のアカウントとデータを共有するための設定。アカウントレベルの活動 |
| ACCOUNTADMIN | 最上位システムロール。デフォルトでSHAREの作成・管理権限を持つ唯一のロール |
| Data Sharing | アカウント間でデータをコピーなしで共有する機能 |

## 1-2. 重要コンセプトまとめ

- SHAREの作成に必要な最小ロール = **ACCOUNTADMIN**
- SHAREの管理は**アカウントレベルの活動**であるため、ACCOUNTADMINが必要
- SYSADMIN・SECURITYADMINではSHAREを作成できない
- ただし: ACCOUNTADMINは**他のロールにSHARE管理権限を委任可能**
- 試験のパターン: 「minimum required role for SHARE」→ ACCOUNTADMIN

## 1-3. 公式ドキュメントURL

- [Getting Started with Data Sharing](https://docs.snowflake.com/en/user-guide/data-sharing-gs)

---

## 2-1. 問題文（英語）

> To create a SHARE, what is the minimum required role?
>
> A. ACCOUNTADMIN
> B. SECURITYADMIN
> C. SYSADMIN

## 2-2. 問題文の文法解析

### 文1: "To create a SHARE, what is the minimum required role?"

- **主語 (S)**: what
- **動詞 (V)**: is
- **補語 (C)**: the minimum required role
- **修飾語 (M)**: To create a SHARE（目的）
- **文型**: SVC（疑問文）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| minimum required role | noun | 最小必要ロール | ACCOUNTADMIN is the minimum required role. |
| account-level activity | noun | アカウントレベルの活動 | Managing shares is an account-level activity. |
| grant the privileges to ~ | phrase | ～に権限を付与する | Grant privileges to other roles. |

## 2-3. 問題文（日本語）

> SHAREを作成するために必要な最小のロールは何ですか？
>
> A. ACCOUNTADMIN
> B. SECURITYADMIN
> C. SYSADMIN

---

## 3-1. 解説文（英語）

> By default, ACCOUNTADMIN is the only role with the privileges required to create & manage a share because managing Share is an account-level activity. Alternatively, using the ACCOUNTADMIN role, you can grant the privileges to manage shares to other roles.

## 3-2. 解説文の文法解析

### 文1: "By default, ACCOUNTADMIN is the only role with the privileges required to create & manage a share because managing Share is an account-level activity."

- **主語 (S)**: ACCOUNTADMIN
- **動詞 (V)**: is
- **補語 (C)**: the only role with the privileges required to ~
- **修飾語 (M)**: By default（デフォルトでは）、because managing Share is an account-level activity（理由）
- **文型**: SVC
- **注目ポイント**: `the only role with ~` で「～を持つ唯一のロール」。`because` で理由を説明。

### 文2: "Alternatively, using the ACCOUNTADMIN role, you can grant the privileges to manage shares to other roles."

- **主語 (S)**: you
- **動詞 (V)**: can grant
- **目的語 (O)**: the privileges to manage shares
- **修飾語 (M)**: Alternatively（代替案）、using the ACCOUNTADMIN role（手段）、to other roles（対象）
- **文型**: SVO
- **注目ポイント**: `Alternatively` で「別の方法として」。権限委任が可能であることを補足。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| by default | phrase | デフォルトでは | By default, only ACCOUNTADMIN can create shares. |
| alternatively | adverb | 別の方法として | Alternatively, grant privileges to other roles. |
| account-level activity | noun | アカウントレベルの活動 | Managing shares is an account-level activity. |

## 3-3. 解説文（日本語）

> デフォルトでは、SHAREの作成と管理に必要な権限を持つ唯一のロールはACCOUNTADMINです。なぜなら、SHAREの管理はアカウントレベルの活動だからです。別の方法として、ACCOUNTADMINロールを使用して、SHAREを管理する権限を他のロールに付与することもできます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
