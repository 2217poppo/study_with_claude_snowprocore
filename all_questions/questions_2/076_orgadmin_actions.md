# 076: ORGADMIN Actions

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-13
**正答**: B, C

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| ORGADMIN | 組織（Organization）レベルのタスクを実行するシステムロール。アカウントの作成・一覧表示・削除が可能。アカウント内のデータには**アクセス不可** |
| Organization（組織） | 複数のSnowflakeアカウントをまとめる上位概念。ORGADMINが管理 |
| Account（アカウント） | Snowflakeの基本的な利用単位。組織の配下に複数のアカウントを持てる |

## 1-2. 重要コンセプトまとめ

- ORGADMINが **できること**:
  - **アカウントの作成**
  - **アカウントの一覧表示**
  - **アカウントの削除**
  - **全アカウントの使用情報の閲覧**
- ORGADMINが **できないこと**:
  - アカウント内のデータの参照（SELECT）
  - アカウント内のデータの更新（UPDATE）
  - テーブル内のデータへのアクセス全般
- ORGADMINはあくまで **「組織レベル」の管理ロール** であり、個別アカウント内のデータには手を出せない
- 他のロールとの違い:
  - ORGADMIN: 組織レベル（アカウント管理）
  - ACCOUNTADMIN: アカウントレベル（最上位権限）
  - SYSADMIN: データオブジェクトレベル

## 1-3. 公式ドキュメントURL

- [ORGADMIN Role](https://docs.snowflake.com/en/user-guide/organizations#orgadmin-role)
- [Managing Accounts - Delete](https://docs.snowflake.com/en/user-guide/organizations-manage-accounts-delete)

---

## 2-1. 問題文（英語）

> Which of the following actions can be performed by an ORGADMIN? Select two.
>
> A. Update data in any table in any account.
> B. Create a new account for an organization.
> C. View usage information for all accounts under the organization.
> D. Select data in any tables in any account.

## 2-2. 問題文の文法解析

### 文1: "Which of the following actions can be performed by an ORGADMIN?"

- **主語 (S)**: Which of the following actions
- **動詞 (V)**: can be performed（受動態）
- **修飾語 (M)**: by an ORGADMIN（動作主）
- **文型**: SV（受動態疑問文）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| organization-specific | adjective | 組織固有の | Performs organization-specific tasks. |
| usage information | noun | 使用情報 | View usage information for all accounts. |

## 2-3. 問題文（日本語）

> ORGADMINが実行できるアクションは以下のどれですか？2つ選んでください。
>
> A. 任意のアカウントの任意のテーブルのデータを更新する。
> B. 組織の新しいアカウントを作成する。
> C. 組織配下のすべてのアカウントの使用情報を閲覧する。
> D. 任意のアカウントの任意のテーブルのデータを参照する。

---

## 3-1. 解説文（英語）

> The ORGADMIN role performs organization-specific tasks like listing all accounts and creating new ones. ORGADMIN can also delete accounts if required. However, they can not see the data inside an account; e.g., they can NOT select or change data from a table.

## 3-2. 解説文の文法解析

### 文1: "The ORGADMIN role performs organization-specific tasks like listing all accounts and creating new ones."

- **主語 (S)**: The ORGADMIN role
- **動詞 (V)**: performs
- **目的語 (O)**: organization-specific tasks
- **修飾語 (M)**: like listing all accounts and creating new ones（例示）
- **文型**: SVO

### 文2: "However, they can not see the data inside an account; e.g., they can NOT select or change data from a table."

- **主語 (S)**: they（= ORGADMIN）
- **動詞 (V)**: can not see / can NOT select or change
- **目的語 (O)**: the data inside an account / data from a table
- **修飾語 (M)**: However（逆接）、e.g.（例示）
- **文型**: SVO
- **注目ポイント**: `However` で権限の制限を明示。`e.g.` で具体的にSELECT/UPDATEが不可であることを示す。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| organization-specific | adjective | 組織固有の | Organization-specific tasks. |
| listing | noun | 一覧表示 | Listing all accounts. |
| if required | phrase | 必要に応じて | Can delete accounts if required. |

## 3-3. 解説文（日本語）

> ORGADMINロールは、すべてのアカウントの一覧表示や新しいアカウントの作成など、組織固有のタスクを実行します。ORGADMINは必要に応じてアカウントを削除することもできます。ただし、アカウント内のデータを見ることはできません。例えば、テーブルからデータをSELECTしたり変更したりすることはできません。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
