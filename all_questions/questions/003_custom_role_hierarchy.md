# 003: Custom Role Hierarchy

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-01
**正答**: E (SYSADMIN)

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Custom Role（カスタムロール） | ユーザーが独自に作成したロール。デフォルトではPUBLICロールに属し、明示的に親ロールを設定しないと権限が機能しない。SYSADMINの配下に置くことがSnowflakeの推奨。 |
| SYSADMIN | Snowflakeの事前定義済みシステムロールの一つ。すべてのセキュアオブジェクト（データベース、ウェアハウス等）の所有者として機能し、これらを管理できる。カスタムロール階層のトップに配置する推奨ロール。 |
| ACCOUNTADMIN | Snowflakeで最も強力な事前定義済みロール。アカウント全体の管理（請求情報へのアクセスなど）が可能。通常の操作には使用しないことが推奨される。 |
| SECURITYADMIN | ユーザーとロールのグローバル管理が可能な事前定義済みロール。ロールの作成・付与を担うが、カスタムロール階層のトップとしては推奨されない。 |
| USERADMIN | ユーザーとロールの作成・管理に特化した事前定義済みロール。SECURITYADMINより権限が限定的。 |
| ORGADMIN | 組織（Organization）レベルの管理が可能なロール。アカウント作成など組織全体の操作に使用する。 |
| Role Hierarchy（ロール階層） | Snowflakeでロールに別のロールを付与することで形成される親子関係。子ロールの権限は親ロールに継承される。カスタムロール → SYSADMIN → ACCOUNTADMIN の階層が推奨。 |
| Securable Object（セキュアオブジェクト） | Snowflakeでアクセス制御の対象となるオブジェクト。データベース、スキーマ、テーブル、ウェアハウスなど。SYSADMINはこれらすべての所有者になれる。 |
| Pre-defined Role（事前定義済みロール） | Snowflakeがデフォルトで用意しているシステムロール。ACCOUNTADMIN、SYSADMIN、SECURITYADMIN、USERADMIN、PUBLIC の5つ。 |

## 1-2. 重要コンセプトまとめ

- **カスタムロール階層の推奨構造**:
  - カスタムロール → **SYSADMIN**（トップに配置）→ ACCOUNTADMIN
  - SYSADMINをトップにすることで、ACCOUNTADMINがすべてのオブジェクトを管理できる
- **なぜSYSADMINなのか**:
  - SYSADMINはすべてのセキュアオブジェクトの所有者として機能できる
  - カスタムロールがSYSADMINに属することで、オブジェクトの孤立（誰も管理できない状態）を防ぐ
- **各ロールの役割分担**（試験頻出の比較）:
  | ロール | 主な用途 |
  |--------|---------|
  | ACCOUNTADMIN | アカウント全体管理（最高権限） |
  | SYSADMIN | オブジェクト管理（推奨カスタムロール親） |
  | SECURITYADMIN | ユーザー・ロール管理 |
  | USERADMIN | ユーザー・ロール作成 |
  | ORGADMIN | 組織レベル管理 |
- **試験ポイント**: 「custom roles」「hierarchy」「pre-defined role」→ SYSADMINを想起する
- ACCOUNTADMINは最強権限だが、日常的な操作に使用することは推奨されない

## 1-3. 公式ドキュメントURL

- [Custom Roles - Access Control Overview](https://docs.snowflake.com/en/user-guide/security-access-control-overview#custom-roles)
- [System-Defined Roles](https://docs.snowflake.com/en/user-guide/security-access-control-overview#system-defined-roles)

---

## 2-1. 問題文（英語）

> Snowflake recommends that any custom roles should be assigned to the pre-defined ____________ role.
>
> A. ACCOUNTADMIN
> B. SECURITYADMIN
> C. USERADMIN
> D. ORGADMIN
> E. SYSADMIN

## 2-2. 問題文の文法解析

### 文1: "Snowflake recommends that any custom roles should be assigned to the pre-defined ____________ role."

- **主語 (S)**: Snowflake
- **動詞 (V)**: recommends
- **目的語 (O)**: that節全体（名詞節）
- **that節の主語**: any custom roles
- **that節の動詞**: should be assigned（助動詞 should + 受動態）
- **that節の修飾語**: to the pre-defined ____________ role（前置詞句）
- **文型**: SVO（目的語 = that節）
- **注目ポイント**:
  - 「recommends that ~ should be ...」は「～すべきであると推奨する」。recommend の後の that節では should が使われる（仮定法現在の代替として）
  - 「be assigned to ~」は「～に割り当てられる」。受動態で役割の帰属を示す
  - 「pre-defined」はハイフン付き形容詞で「事前定義された」。Snowflakeの組み込みロールを指す

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| recommend that ~ should | 動詞 + 接続詞 | ～すべきと推奨する | Snowflake recommends that roles should be assigned to SYSADMIN. |
| be assigned to | 受動態句 | ～に割り当てられる、～に属させる | Custom roles should be assigned to a parent role. |
| pre-defined | adjective | 事前定義された、あらかじめ設定された | Snowflake provides several pre-defined system roles. |
| custom role | noun phrase | カスタムロール（ユーザー定義のロール） | Any custom role should sit under SYSADMIN. |
| hierarchy | noun | 階層（構造） | A role hierarchy controls privilege inheritance. |

## 2-3. 問題文（日本語）

> Snowflakeは、カスタムロールを事前定義された____________ロールに割り当てることを推奨しています。
>
> A. ACCOUNTADMIN
> B. SECURITYADMIN
> C. USERADMIN
> D. ORGADMIN
> E. SYSADMIN

---

## 3-1. 解説文（英語）

> Snowflake recommends establishing a hierarchy of custom roles, with the top custom role given to the pre-defined system role SYSADMIN. SYSADMIN can act as the owner of all securable objects in the system and can manage these objects.

## 3-2. 解説文の文法解析

### 文1: "Snowflake recommends establishing a hierarchy of custom roles, with the top custom role given to the pre-defined system role SYSADMIN."

- **主語 (S)**: Snowflake
- **動詞 (V)**: recommends
- **目的語 (O)**: establishing a hierarchy of custom roles（動名詞句）
- **付帯状況の with句**: with the top custom role given to ... SYSADMIN
  - with + 名詞 + 過去分詞（「トップのカスタムロールがSYSADMINに付与された状態で」）
- **文型**: SVO + with付帯状況
- **注目ポイント**:
  - 「recommend + 動名詞」（recommend doing）と「recommend that ~ should」の2パターン。この文は動名詞パターン
  - 「with + O + 過去分詞」は付帯状況を示す独立分詞構文。「～が～された状態で」

### 文2: "SYSADMIN can act as the owner of all securable objects in the system and can manage these objects."

- **主語 (S)**: SYSADMIN
- **動詞 (V1)**: can act as / **(V2)**: can manage
- **補語 (C)**: the owner of all securable objects in the system（V1の補語）
- **目的語 (O)**: these objects（V2の目的語）
- **文型**: S + V1 + C（and）V2 + O（等位接続詞で2つの述語を並列）
- **注目ポイント**:
  - 「act as ~」は「～として機能する、～の役割を果たす」。技術文書で役割・機能を説明する定番表現
  - 「securable objects」はSnowflakeの技術用語。アクセス制御対象のオブジェクト全般を指す

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| establish | verb | 確立する、設ける | Establish a role hierarchy before creating custom roles. |
| act as | verb phrase | ～として機能する、～の役割を担う | SYSADMIN can act as the owner of all objects. |
| securable object | noun phrase | セキュアオブジェクト（アクセス制御対象） | Tables and warehouses are securable objects. |
| with + O + 過去分詞 | 構文 | 〜が〜された状態で（付帯状況） | ...with the top role given to SYSADMIN. |

## 3-3. 解説文（日本語）

> Snowflakeは、カスタムロールの階層を確立し、最上位のカスタムロールを事前定義済みのシステムロール「SYSADMIN」に付与することを推奨しています。SYSADMINはシステム内のすべてのセキュアオブジェクトの所有者として機能し、これらのオブジェクトを管理することができます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
