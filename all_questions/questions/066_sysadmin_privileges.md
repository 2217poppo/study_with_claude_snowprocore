# 066: SYSADMIN Role — Privileges and Limitations

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-03
**正答**: A・D（仮想ウェアハウス作成 / データベース作成）

> 関連問題: 003（Custom Role Hierarchy）・018（ACCOUNTADMIN Role）・055（Share Management Role）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| SYSADMIN | Snowflakeの事前定義済みシステムロール。データベース・テーブル・ビュー・仮想ウェアハウス等の**ほとんどのSnowflakeオブジェクトを作成・管理できる**。ただし、ユーザーやロールの作成はできない |
| USERADMIN | ユーザーとロールの作成・管理に特化したシステムロール。SYSADMINにはないユーザー・ロール作成権限を持つ |
| SECURITYADMIN | ユーザーとロールのグローバル管理が可能なシステムロール。USERADMINの権限に加えてグローバルなセキュリティ管理も担当 |
| System-Defined Role（システム定義ロール） | Snowflakeがあらかじめ定義した組み込みロール。ACCOUNTADMIN・SYSADMIN・SECURITYADMIN・USERADMIN・PUBLIC がある |

## 1-2. 重要コンセプトまとめ

- **SYSADMINができること（データオブジェクト中心）**:
  - データベース・スキーマ・テーブル・ビューの作成・管理
  - **仮想ウェアハウスの作成・管理** ← 正解A
  - カスタムロールへの権限付与（ただしロール自体の作成はUSERADMIN）

- **SYSADMINができないこと**:
  - **ユーザーの作成** ← 不正解B（USERADMINの担当）
  - **ロールの作成** ← 不正解C（USERADMINの担当）
  - Share の作成（ACCOUNTADMINの担当）
  - Resource Monitor の作成（ACCOUNTADMINの担当）

- **システムロールの役割分担**（試験頻出の区別）:

  | ロール | 主な担当 |
  |--------|---------|
  | ACCOUNTADMIN | アカウント全体管理・請求・Share・Resource Monitor |
  | SYSADMIN | **データオブジェクト**（DB・WH・テーブル等）の管理 |
  | SECURITYADMIN | ユーザー・ロールのグローバル管理 |
  | USERADMIN | ユーザー・ロールの作成 |
  | PUBLIC | すべてのユーザーに自動付与される基本ロール |

- **試験の引っかけ**: SYSADMINは「システム管理者」のイメージからユーザー・ロール作成もできると思い込む → ユーザー・ロール作成は **USERADMIN** の担当

## 1-3. 公式ドキュメントURL

- [Access Control — System-Defined Roles](https://docs.snowflake.com/en/user-guide/security-access-control-overview#system-defined-roles)

---

## 2-1. 問題文（英語）

> Which of the following statements is true regarding the SYSADMIN role? Select all that apply.
>
> A. A user with the SYSADMIN role can create a new virtual warehouse.
> B. A user with the SYSADMIN role can create new users.
> C. A user with the SYSADMIN role can create new roles.
> D. A user with the SYSADMIN role can create a new database.

## 2-2. 問題文の文法解析

### 文1: "Which of the following statements is true regarding the SYSADMIN role?"

- **主語 (S)**: Which of the following statements（以下の記述のうちどれが）
- **動詞 (V)**: is true（正しい）
- **修飾語 (M)**: regarding the SYSADMIN role（SYSADMINロールに関して）← `regarding ~` = 「〜に関して」
- **注目ポイント**: `regarding ~` = 「〜に関して・〜について」。技術文書でよく使われるフォーマルな前置詞。`about ~` より格式的

### 選択肢パターン: "A user with the SYSADMIN role can create ~"

- **主語 (S)**: A user with the SYSADMIN role（SYSADMINロールを持つユーザーが）← `with ~` = 「〜を持つ」という後置修飾
- **助動詞**: can（〜できる）
- **動詞 (V)**: create（作成する）
- **注目ポイント**: `A user with the ~ role` = 「〜ロールを持つユーザー」。`with + 名詞` が後置修飾で主語を限定するパターン

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| regarding ~ | 前置詞 | 〜に関して・〜について（= about ~、フォーマル） | Which is true regarding the SYSADMIN role? |
| A user with ~ role | 名詞句 | 〜ロールを持つユーザー | A user with the SYSADMIN role can create warehouses. |
| statement | 名詞 | 記述・陳述・主張 | Which of the following statements is true? |

## 2-3. 問題文（日本語）

> SYSADMINロールに関する以下の記述のうち、正しいものはどれですか？当てはまるものをすべて選択してください。
>
> A. SYSADMINロールを持つユーザーは新しい仮想ウェアハウスを作成できる。
> B. SYSADMINロールを持つユーザーは新しいユーザーを作成できる。
> C. SYSADMINロールを持つユーザーは新しいロールを作成できる。
> D. SYSADMINロールを持つユーザーは新しいデータベースを作成できる。

---

## 3-1. 解説文（英語）

> The SYSADMIN role can create and manage most Snowflake objects, including databases, tables, views, virtual warehouses, etc. However, the SYSADMIN role does not have the privileges to create new users or roles.

## 3-2. 解説文の文法解析

### 文1: "The SYSADMIN role can create and manage most Snowflake objects, including databases, tables, views, virtual warehouses, etc."

- **主語 (S)**: The SYSADMIN role
- **動詞 (V)**: can create and manage（作成・管理できる）← 助動詞 + 2動詞の並列
- **目的語 (O)**: most Snowflake objects（ほとんどのSnowflakeオブジェクトを）
- **挿入句**: including databases, tables, views, virtual warehouses, etc.（データベース・テーブル・ビュー・仮想ウェアハウス等を含む）
- **注目ポイント**: `most ~` = 「ほとんどの〜」。all ではなく most なのは、ユーザー・ロール等の例外があるため。`etc.` = et cetera「その他」

### 文2: "However, the SYSADMIN role does not have the privileges to create new users or roles."

- **接続副詞**: However（しかし）← 前文との対比・制限
- **主語 (S)**: the SYSADMIN role
- **動詞 (V)**: does not have（持っていない）← 否定
- **目的語 (O)**: the privileges to create new users or roles（新しいユーザーまたはロールを作成する権限を）← `privileges to do` = 〜する権限
- **注目ポイント**: `does not have the privileges to do` = 「〜する権限を持っていない」。`cannot do` より「権限の有無」を明示的に述べる表現

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| most ~ | 限定詞 | ほとんどの〜（allではなく例外あり） | SYSADMIN can manage most Snowflake objects. |
| etc. | 略語 | その他・以下同様（et cetera） | Databases, tables, views, etc. can be managed. |
| does not have the privileges to do | 否定熟語 | 〜する権限を持っていない | SYSADMIN does not have the privileges to create users. |

## 3-3. 解説文（日本語）

> SYSADMINロールはデータベース・テーブル・ビュー・仮想ウェアハウス等を含む、ほとんどのSnowflakeオブジェクトを作成・管理できます。ただし、SYSADMINロールは新しいユーザーやロールを作成する権限を持っていません。

---

## 復習メモ

- [ ] SYSADMINがDB・WH等を作成できるが、ユーザー・ロールの作成はできないことを覚えた
- [ ] ユーザー・ロール作成は USERADMIN の担当であることを確認した
- [ ] `regarding ~`・`most ~`（例外あり）・`does not have the privileges to do` の英語パターンを確認した
- [ ] この問題は理論問題のためサンドボックス検証は不要
