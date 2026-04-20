# 122: Reader Account — Sharing with Non-Snowflake Organizations

**SnowPro Core Domain**: Domain 5 — Data Collaboration, Marketplace, and Sharing
**作成日**: 2026-04-17
**正答**: B（リーダーアカウントを作成する必要がある）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Reader Account（リーダーアカウント） | データプロバイダーが作成する、非Snowflakeユーザー向けのSnowflakeアカウント。共有データの閲覧専用。作成・所有・コストはすべてプロバイダー負担 |
| Account Inheritance Hierarchy（アカウント継承階層） | 存在しない概念。試験の誤答選択肢として登場する造語 |
| Child Account（子アカウント） | 存在しない公式用語。試験の誤答選択肢。Snowflakeには「リーダーアカウント」「組織内アカウント」等の正式概念がある |
| Data Provider（データプロバイダー） | データを共有する側のSnowflakeアカウント。リーダーアカウントの作成・管理を担う |
| Data Consumer（データコンシューマー） | 共有データを受け取る側。Snowflakeアカウントを持っていればダイレクト共有、持っていなければリーダーアカウント経由 |
| Secure Data Sharing | データのコピーなしに異なるSnowflakeアカウント間でデータを共有するSnowflakeの機能 |

## 1-2. 重要コンセプトまとめ

- **非Snowflakeユーザーとの共有 → リーダーアカウントが必要**
  - Snowflakeアカウント間の共有: ダイレクト共有（通常のSecure Data Sharing）
  - 非Snowflakeユーザーとの共有: **リーダーアカウント**を経由
- **リーダーアカウントの特徴**
  - データプロバイダーが作成・所有する
  - コンシューマーはリーダーアカウントの認証情報を受け取り、Snowsightやコネクターからアクセス
  - クエリコストはプロバイダーに請求される
  - 使用目的は共有データの閲覧のみ（limited purposes）
- **誤答の罠**
  - `Account inheritance hierarchy` → Snowflakeに存在しない概念
  - `Child account` → 正式な用語ではない（OrganizationsのサブアカウントはReader Accountとは異なる）
- **類似問題Q111との違い**
  - Q111: 「リーダーアカウントは誰に所属するか」→ データプロバイダーに属する
  - Q122: 「非Snowflakeユーザーと共有するには何が必要か」→ リーダーアカウントの作成

## 1-3. 公式ドキュメントURL

- [Creating and Managing Reader Accounts](https://docs.snowflake.com/en/user-guide/data-sharing-reader-create)
- [Secure Data Sharing Overview](https://docs.snowflake.com/en/user-guide/data-sharing-intro)

---

## 2-1. 問題文（英語）

> Which of the following statement is true when sharing data with an organization that does not have a Snowflake account?
>
> A. An account inheritance hierarchy must be created to share data with a non-Snowflake customer.
> B. A reader account must be created for sharing data with a non-Snowflake
> C. A child account must be created for sharing data with a non-Snowflake customer

## 2-2. 問題文の文法解析

### 文1: "Which of the following statement is true when sharing data with an organization that does not have a Snowflake account?"

- **主語 (S)**: Which of the following statement（statementは単数）
- **動詞 (V)**: is
- **補語 (C)**: true
- **時間節**: when sharing data with an organization（分詞構文）
- **関係詞節**: that does not have a Snowflake account（organizationを修飾）
- **文型**: SVC（疑問文）
- **注目ポイント**: 
  - `an organization that does not have a Snowflake account` = Snowflakeアカウントを持たない組織
  - `when sharing data` = データを共有する際（分詞構文：主語省略）

### 選択肢の文法分析:

- A: "An account inheritance hierarchy **must be created**" → 受動態 + 義務の助動詞
- B: "A reader account **must be created**" → 同形式（選択肢で正解を示す）
- C: "A child account **must be created**" → 同形式（誤答）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| inheritance hierarchy | 名詞句 | 継承階層 | Account inheritance hierarchy does not exist in Snowflake. |
| child account | 名詞句 | 子アカウント | There is no official "child account" concept in Snowflake. |
| must be created | 動詞句 | 作成されなければならない | A reader account must be created for non-Snowflake users. |

## 2-3. 問題文（日本語）

> Snowflakeアカウントを持たない組織とデータを共有する場合、次のうち正しい記述はどれですか？
>
> A. 非Snowflakeのお客様とデータを共有するには、アカウント継承階層を作成する必要がある。
> B. 非Snowflakeのユーザーとデータを共有するには、リーダーアカウントを作成する必要がある。
> C. 非Snowflakeのお客様とデータを共有するには、子アカウントを作成する必要がある。

---

## 3-1. 解説文（英語）

> Sharing with a non-Snowflake user requires the creation of a reader account. The reader account provides the non-Snowflake user with a Snowflake account through which they can consume the shared data. The data providers own the reader account, and all costs (including query costs) are charged to the data provider.
>
> https://docs.snowflake.com/en/user-guide/data-sharing-reader-create

## 3-2. 解説文の文法解析

### 文1: "Sharing with a non-Snowflake user requires the creation of a reader account."

- **主語 (S)**: Sharing with a non-Snowflake user（動名詞句）
- **動詞 (V)**: requires
- **目的語 (O)**: the creation of a reader account
- **文型**: SVO
- **注目ポイント**: 
  - 動名詞句が主語に立つパターン（`Sharing with A requires B`）
  - `requires the creation of ~` = 〜の作成を必要とする（`require` + 名詞句）

### 文2: "The reader account provides the non-Snowflake user with a Snowflake account through which they can consume the shared data."

- **主語 (S)**: The reader account
- **動詞 (V)**: provides
- **SVOO**: provides the non-Snowflake user with a Snowflake account（provide O1 with O2）
- **関係詞節**: through which they can consume the shared data
- **文型**: SVO（provide + with）
- **注目ポイント**: 
  - `provide O1 with O2` = O1にO2を提供する（重要構文）
  - `through which` = それを通じて（前置詞付き関係代名詞）
  - `consume the shared data` = 共有データを消費する

### 文3: "The data providers own the reader account, and all costs (including query costs) are charged to the data provider."

- **主節1**: The data providers own the reader account
- **主節2**: all costs (including query costs) are charged to the data provider（受動態）
- **挿入句**: (including query costs)
- **注目ポイント**: 
  - `are charged to ~` = 〜に請求される（受動態）
  - `including query costs` = クエリコストを含む（括弧内で具体例を追加）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| require the creation of | 動詞句 | 〜の作成を必要とする | Sharing requires the creation of a reader account. |
| provide O with | 動詞句 | OにXを提供する | The reader account provides users with Snowflake access. |
| through which | 関係詞句 | それを通じて | An account through which they can consume data. |
| charged to | 動詞句 | 〜に請求される | All costs are charged to the data provider. |

## 3-3. 解説文（日本語）

> 非Snowflakeユーザーとのデータ共有には、リーダーアカウントの作成が必要です。リーダーアカウントは、非Snowflakeユーザーに対して、共有データを消費できるSnowflakeアカウントを提供します。データプロバイダーがリーダーアカウントを所有し、クエリコストを含むすべてのコストがデータプロバイダーに請求されます。

---

## 復習メモ

- [ ] 非Snowflakeユーザーとの共有にはリーダーアカウントの作成が必要であることを覚えた
- [ ] `provide O with`（OにXを提供する）と `through which`（それを通じて）の使い方を確認した
- [ ] Account inheritance hierarchyとChild accountは存在しない概念であることを把握した
