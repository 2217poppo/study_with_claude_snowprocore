# 071: USERADMIN Role — Characteristics and Responsibilities

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance (Security)
**作成日**: 2026-04-03
**正答**: A・D（USERADMINはユーザー・ロール管理に特化し、グラント管理は行わない）

> 関連問題: 003（Custom Role Hierarchy）・018（ACCOUNTADMIN Role）・066（SYSADMIN Privileges）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| USERADMIN（ユーザーアドミン） | ユーザーとロールの作成・管理に**特化**した事前定義済みシステムロール。`CREATE USER` と `CREATE ROLE` の権限を持つ。**グラントの管理は不可**（それはSECURITYADMINの仕事） |
| SECURITYADMIN（セキュリティアドミン） | オブジェクトへのアクセス権（GRANT/REVOKE）を管理するシステムロール。**グラント管理の専門ロール**。USERADMINとは役割分担がある |
| Built-in Role（ビルトインロール） | Snowflakeがあらかじめ定義しているシステムロール。ACCOUNTADMIN・SYSADMIN・USERADMIN・SECURITYADMIN・PUBLIC の5種類 |
| Grant（グラント） | 権限の付与・委譲。`GRANT privilege ON object TO role` の形式。グラントの管理はSECURITYADMINの担当 |

## 1-2. 重要コンセプトまとめ

- **USERADMINの役割**:
  - `CREATE USER` 権限 → ユーザーの作成が可能
  - `CREATE ROLE` 権限 → ロールの作成が可能
  - **グラントの管理は不可** → それはSECURITYADMINの仕事

- **不正解の選択肢の解説**:
  - 「USERADMINはSYSADMINの全権限を継承する」→ 誤り。USERADMINはSYSADMINの権限を持たない（ユーザー・ロール管理のみ）
  - 「USERADMINは新規ユーザーに自動付与される」→ 誤り。新規ユーザーにはPUBLICロールのみが自動付与される

- **システムロールの役割分担**（試験頻出）:

  | ロール | 主な担当 |
  |--------|---------|
  | ACCOUNTADMIN | アカウント全体の管理（最上位）|
  | SYSADMIN | オブジェクト（DB・WH等）の作成・管理 |
  | USERADMIN | ユーザー・ロールの作成・管理のみ |
  | SECURITYADMIN | グラント（権限付与）の管理 |
  | PUBLIC | すべてのユーザーに自動付与される基本ロール |

- **関心の分離（Separation of Concerns）**: USERADMINがユーザー・ロール管理を担い、SECURITYADMINがグラント管理を担うことで、権限管理の責務を分離している

## 1-3. 公式ドキュメントURL

- [System-Defined Roles](https://docs.snowflake.com/en/user-guide/security-access-control-overview#system-defined-roles)

---

## 2-1. 問題文（英語）

> Which of the following statements regarding Snowflake's built-in roles are correct?
>
> Select two answers.
>
> A. The USERADMIN role separates the management of users and roles from the management of all grants.
> B. USERADMIN inherits all permissions of SYSADMIN.
> C. USERADMIN is granted to each new user automatically.
> D. USERADMIN is dedicated to user and role management only.

## 2-2. 問題文の文法解析

### 文1: "Which of the following statements regarding Snowflake's built-in roles are correct?"

- **疑問詞**: Which of the following statements（以下の記述のうちどれが）
- **動詞 (V)**: are correct（正しいか）
- **修飾語**: regarding Snowflake's built-in roles（Snowflakeのビルトインロールに関する）← `regarding ~` = 「〜に関して」
- **注目ポイント**: `built-in` = 「組み込みの・事前定義の」。`built-in role` = システムに最初から組み込まれているロール

### 選択肢A: "The USERADMIN role separates the management of users and roles from the management of all grants."

- **主語 (S)**: The USERADMIN role
- **動詞 (V)**: separates（分離する）
- **目的語 (O)**: the management of users and roles（ユーザーとロールの管理を）
- **前置詞句**: from the management of all grants（すべてのグラントの管理から）
- **注目ポイント**: `separate A from B` = 「AをBから分離する」。責務の分離（separation of concerns）を示す重要表現

### 選択肢D: "USERADMIN is dedicated to user and role management only."

- **主語 (S)**: USERADMIN
- **動詞 (V)**: is dedicated to（〜に特化している・〜に専念している）← `be dedicated to ~` = 「〜に専念する」
- **注目ポイント**: `be dedicated to ~ only` = 「〜のみに特化している」。`solely` と同義で、限定された責務を強調する

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| built-in | 形容詞 | 組み込みの・事前定義の | Snowflake's built-in roles include ACCOUNTADMIN. |
| separate A from B | 動詞句 | AをBから分離する | USERADMIN separates user management from grant management. |
| be dedicated to ~ | 熟語 | 〜に特化している・〜専用の | USERADMIN is dedicated to user and role management. |
| grant | 名詞/動詞 | 権限付与・グラント | Grants are managed by SECURITYADMIN. |
| inherit | 動詞 | 継承する | USERADMIN does not inherit permissions of SYSADMIN. |
| automatically | 副詞 | 自動的に | PUBLIC is granted to each new user automatically. |

## 2-3. 問題文（日本語）

> Snowflakeのビルトインロールに関する以下の記述のうち、正しいものはどれですか？
>
> 2つ選択してください。
>
> A. USERADMINロールは、ユーザーとロールの管理を、すべてのグラントの管理から分離する。
> B. USERADMINはSYSADMINのすべての権限を継承する。
> C. USERADMINは新しいユーザーに自動的に付与される。
> D. USERADMINはユーザーとロールの管理のみに特化している。

---

## 3-1. 解説文（英語）

> USERADMIN is a role dedicated solely to user and role management. It has the privileges for CREATE USER and CREATE ROLE; therefore, users with this role can create users and roles in the account. USERADMIN can not manage grants, which is the job of SECURITYADMIN role.

## 3-2. 解説文の文法解析

### 文1: "USERADMIN is a role dedicated solely to user and role management."

- **主語 (S)**: USERADMIN
- **動詞 (V)**: is（〜である）
- **補語 (C)**: a role dedicated solely to user and role management（ユーザーとロールの管理のみに特化したロール）
- **後置修飾**: dedicated solely to user and role management（〜のみに特化した）← 過去分詞後置修飾
- **注目ポイント**: `solely` = 「〜のみ・専ら」。`only` より強い限定を示す副詞

### 文2: "It has the privileges for CREATE USER and CREATE ROLE; therefore, users with this role can create users and roles in the account."

- **前節**: It has the privileges for CREATE USER and CREATE ROLE（CREATE USERとCREATE ROLEの権限を持つ）
- **接続副詞**: therefore（したがって）← セミコロン後に論理的帰結を導く
- **後節**: users with this role can create users and roles（このロールを持つユーザーはユーザーとロールを作成できる）
- **注目ポイント**: `have the privilege for ~` = 「〜の権限を持つ」。`have the privilege to do` と同義

### 文3: "USERADMIN can not manage grants, which is the job of SECURITYADMIN role."

- **主節**: USERADMIN can not manage grants（USERADMINはグラントを管理できない）
- **非制限関係詞節**: which is the job of SECURITYADMIN role（それはSECURITYADMINロールの仕事である）← which が前文全体を受ける
- **注目ポイント**: `which is the job of ~` = 「それは〜の仕事である」。前文全体を先行詞にとる非制限関係詞節で、責任範囲を明確化する

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| solely | 副詞 | 〜のみ・専ら | USERADMIN is dedicated solely to user management. |
| therefore | 接続副詞 | したがって | It has the privilege; therefore, it can create roles. |
| which is the job of ~ | 関係詞節 | それは〜の仕事である | SECURITYADMIN manages grants, which is its job. |

## 3-3. 解説文（日本語）

> USERADMINはユーザーとロールの管理のみに特化したロールです。CREATE USERとCREATE ROLEの権限を持っており、したがって、このロールを持つユーザーはアカウント内でユーザーとロールを作成できます。USERADMINはグラントを管理できません。それはSECURITYADMINロールの仕事です。

---

## 復習メモ

- [ ] USERADMINはユーザー・ロール管理のみ（CREATE USER・CREATE ROLEのみ）であることを覚えた
- [ ] グラントの管理はSECURITYADMINの担当であることを区別できた
- [ ] 新規ユーザーに自動付与されるのはPUBLICロールのみ（USERADMINではない）を確認した
- [ ] `separate A from B`・`be dedicated to ~ only`・`solely` の英語パターンを確認した
- [ ] この問題は理論問題のためサンドボックス検証は不要
