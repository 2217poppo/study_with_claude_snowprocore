# 012: ACCOUNTADMIN Role Hierarchy

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-09
**正答**: True

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| ACCOUNTADMIN | Snowflakeで**最も強力なシステム定義ロール**。ロール階層の最上位に位置し、SYSADMIN・SECURITYADMINのすべての権限を継承する。アカウント全体の管理・請求情報へのアクセスが可能。日常操作への使用は非推奨 |
| SYSADMIN | データベース・ウェアハウス・テーブル・ビュー等のデータオブジェクトを作成・管理するシステム定義ロール。カスタムロールの階層的な親として配置することが推奨される |
| SECURITYADMIN | オブジェクトへのアクセス権限（GRANT/REVOKE）を管理するシステム定義ロール。USERADMINロールの権限も継承する |
| USERADMIN | ユーザーとロールの作成・管理に特化したシステム定義ロール。`CREATE USER` と `CREATE ROLE` の権限を持つ |
| Role Hierarchy（ロール階層） | ロール間の親子関係。子ロールの権限は親ロールに自動的に**継承（inherit）** される。Snowflakeのシステム定義ロールの階層: ACCOUNTADMIN → SECURITYADMIN → USERADMIN、ACCOUNTADMIN → SYSADMIN |
| Privileges Inheritance（権限継承） | ロール階層において、下位ロールに付与された権限が上位ロールに自動的に引き継がれる仕組み。明示的なGRANTなしに上位ロールが下位ロールの権限を持つ |

## 1-2. 重要コンセプトまとめ

- **ACCOUNTADMINはロール階層の最上位**に位置し、SYSADMIN・SECURITYADMINの権限をすべて継承する
- **権限継承の方向は下から上**：子ロール → 親ロール。ACCOUNTADMINが最上位なので、すべてのシステム定義ロールの権限を持つ
- **システム定義ロール階層の構造**:
  - ACCOUNTADMIN → SECURITYADMIN → USERADMIN
  - ACCOUNTADMIN → SYSADMIN
- **SECURITYADMINはUSERADMINの権限も継承**している（SECURITYADMINの下にUSERADMINがある）
- 試験では「ACCOUNTADMINが特定のロールの権限を持つか」を問うTrue/False問題が頻出

## 1-3. 公式ドキュメントURL

- [System-Defined Roles](https://docs.snowflake.com/en/user-guide/security-access-control-overview#system-defined-roles)
- [Role Hierarchy and Privilege Inheritance](https://docs.snowflake.com/en/user-guide/security-access-control-overview#role-hierarchy-and-privilege-inheritance)

---

## 2-1. 問題文（英語）

> The privileges provided by the SYSADMIN & SECURITYADMIN role are automatically contained in the ACCOUNTADMIN role since the ACCOUNTADMIN role sits at the top of the role hierarchy.
>
> A. True
> B. False

## 2-2. 問題文の文法解析

### 文1: "The privileges provided by the SYSADMIN & SECURITYADMIN role are automatically contained in the ACCOUNTADMIN role since the ACCOUNTADMIN role sits at the top of the role hierarchy."

- **主語 (S)**: The privileges provided by the SYSADMIN & SECURITYADMIN role（SYSADMIN・SECURITYADMINロールによって提供される権限は）
- **動詞 (V)**: are contained（含まれている）— 受動態
- **修飾語 (M1)**: automatically（自動的に）
- **場所 (M2)**: in the ACCOUNTADMIN role（ACCOUNTADMINロールに）
- **理由節 (M3)**: since the ACCOUNTADMIN role sits at the top of the role hierarchy（ACCOUNTADMINロールがロール階層の最上位に位置するため）
- **文型**: SV（受動態） + since理由節
- **注目ポイント**:
  - `provided by ~` — 過去分詞の後置修飾。`privileges` を修飾して「〜によって提供される権限」
  - `are automatically contained in ~` — 受動態 + 副詞。「自動的に〜に含まれている」
  - `since ~` — 理由を示す接続詞（= because）。文末に配置された理由節
  - `sits at the top of ~` — 「〜の最上位に位置する」。階層構造の位置を示す定型表現

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| privilege | 名詞 | 権限、特権 | The SYSADMIN role has privileges to create databases. |
| provided by | 過去分詞句 | 〜によって提供される | Privileges provided by SYSADMIN are inherited by ACCOUNTADMIN. |
| automatically | 副詞 | 自動的に | Privileges are automatically inherited through the role hierarchy. |
| contained in | 過去分詞句 | 〜に含まれている | All lower-level privileges are contained in ACCOUNTADMIN. |
| sit at the top of | 動詞句 | 〜の最上位に位置する | ACCOUNTADMIN sits at the top of the role hierarchy. |
| role hierarchy | 名詞 | ロール階層 | The role hierarchy determines privilege inheritance. |

## 2-3. 問題文（日本語）

> SYSADMINおよびSECURITYADMINロールが提供する権限は、ACCOUNTADMINロールがロール階層の最上位に位置するため、ACCOUNTADMINロールに自動的に含まれている。
>
> A. 正しい
> B. 誤り

---

## 3-1. 解説文（英語）

> ACCOUNTADMIN is the most powerful role in a Snowflake account. Due to the role hierarchy and privileges inheritance, the ACCOUNTADMIN inherits all the privileges that SECURITYADMIN & USERADMIN has.

## 3-2. 解説文の文法解析

### 文1: "ACCOUNTADMIN is the most powerful role in a Snowflake account."

- **主語 (S)**: ACCOUNTADMIN
- **動詞 (V)**: is（〜である）
- **補語 (C)**: the most powerful role（最も強力なロール）
- **修飾語 (M)**: in a Snowflake account（Snowflakeアカウントにおいて）
- **文型**: SVC
- **注目ポイント**: `the most powerful` — 最上級表現。「最も強力な」

### 文2: "Due to the role hierarchy and privileges inheritance, the ACCOUNTADMIN inherits all the privileges that SECURITYADMIN & USERADMIN has."

- **理由句 (M)**: Due to the role hierarchy and privileges inheritance（ロール階層と権限継承のため）
- **主語 (S)**: the ACCOUNTADMIN
- **動詞 (V)**: inherits（継承する）
- **目的語 (O)**: all the privileges that SECURITYADMIN & USERADMIN has（SECURITYADMINとUSERADMINが持つすべての権限を）
- **文型**: SVO + 関係代名詞節
- **注目ポイント**:
  - `Due to ~` — 「〜のために」。理由を示す前置詞句。`because of ~` と同義
  - `all the privileges that ~ has` — 関係代名詞 `that` が目的語の権限を限定。「〜が持つすべての権限」
  - `inherits` — 「継承する」。ロール階層における権限の自動的な引き継ぎを表す重要動詞

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| powerful | 形容詞 | 強力な、権限の大きい | ACCOUNTADMIN is the most powerful system-defined role. |
| due to | 前置詞句 | 〜のために、〜が原因で | Due to the hierarchy, privileges are inherited automatically. |
| inherit | 動詞 | 継承する | Parent roles inherit the privileges of child roles. |
| privileges inheritance | 名詞 | 権限継承 | Privileges inheritance flows upward in the role hierarchy. |

## 3-3. 解説文（日本語）

> ACCOUNTADMINはSnowflakeアカウントにおいて最も強力なロールです。ロール階層と権限継承の仕組みにより、ACCOUNTADMINはSECURITYADMINとUSERADMINが持つすべての権限を継承します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
