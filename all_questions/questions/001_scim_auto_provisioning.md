# 001: SCIM Auto-Provisioning

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-01
**正答**: A (SCIM)

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| SCIM (System for Cross-domain Identity Management) | 異なるシステム間でユーザーIDを自動的にプロビジョニング（作成・更新・削除）するためのオープン標準プロトコル。Snowflakeではバージョン2.0をサポートしている。 |
| Auto-provisioning（自動プロビジョニング） | IDプロバイダ（IdP）でユーザーが作成されると、連携先サービス（Snowflake）にも自動的にアカウントが作成される仕組み。手動作業を不要にし、運用負荷を減らす。 |
| Identity Provider (IdP) | ユーザーの認証情報を管理するサービス。例: Okta、Azure Active Directory。SCIMではIdPがユーザー情報のソースとなる。 |
| DAC (Discretionary Access Control) | 所有者がオブジェクトへのアクセス権を任意に付与できるアクセス制御モデル。Snowflakeのオブジェクト所有権の仕組みはDACに基づいている。 |
| RBAC (Role-Based Access Control) | ロール（役割）に基づいてアクセス権を管理するモデル。Snowflakeの主要なアクセス制御モデル。ユーザーにロールを割り当て、ロールに権限を付与する。 |
| ABAC (Attribute-Based Access Control) | ユーザーの属性（部署、役職など）に基づいてアクセスを制御するモデル。Snowflakeでは直接的な仕組みとしてはサポートされていない。 |

## 1-2. 重要コンセプトまとめ

- **SCIM 2.0**はSnowflakeがサポートする自動プロビジョニング標準であり、ユーザーの作成・更新・削除とグループメンバーシップの同期を自動化する
- Snowflakeが対応しているIdPは **Okta** と **Azure Active Directory (Microsoft Entra ID)** の2つ
- SCIMによりIdPで定義されたグループをSnowflakeのロールと同期できる
- DAC/RBAC/ABACはアクセス**制御**モデルであり、ユーザーの**プロビジョニング**とは異なる概念
- Snowflakeのアクセス制御はDACとRBACの組み合わせで実現されている（プロビジョニングではない）
- 試験ポイント: 「auto-provisioning」「group membership」というキーワードを見たらSCIMを想起する

## 1-3. 公式ドキュメントURL

- [SCIM Overview](https://docs.snowflake.com/en/user-guide/scim)
- [Access Control in Snowflake](https://docs.snowflake.com/en/user-guide/security-access-control-overview)

---

## 2-1. 問題文（英語）

> Which one of the following is supported by Snowflake for the purpose of auto-provisioning users and group membership?
>
> A. SCIM
> B. DAC
> C. ABAC
> D. RBAC

## 2-2. 問題文の文法解析

### 文1: "Which one of the following is supported by Snowflake for the purpose of auto-provisioning users and group membership?"

- **主語 (S)**: Which one of the following
- **動詞 (V)**: is supported（受動態: be + 過去分詞）
- **動作主 (M)**: by Snowflake（受動態の動作主を示す前置詞句）
- **目的修飾語 (M)**: for the purpose of auto-provisioning users and group membership（目的を示す前置詞句）
- **文型**: SV（受動態）+ 修飾語
- **注目ポイント**:
  - 「is supported by ~」は技術文書で頻出の受動態パターン。「~によってサポートされている」
  - 「for the purpose of + 動名詞」は目的を表す表現。「~する目的で」
  - 「auto-provisioning」はハイフン付き動名詞で、前置詞 of の目的語

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| auto-provisioning | noun (動名詞) | 自動プロビジョニング、自動的なアカウント作成 | SCIM enables auto-provisioning of user accounts. |
| group membership | noun | グループメンバーシップ、グループ所属情報 | SCIM can sync group membership with Snowflake roles. |
| for the purpose of | phrase | ～の目的で | This API is used for the purpose of data integration. |

## 2-3. 問題文（日本語）

> ユーザーの自動プロビジョニングとグループメンバーシップの管理を目的として、Snowflakeがサポートしているのは次のうちどれですか？
>
> A. SCIM
> B. DAC
> C. ABAC
> D. RBAC

---

## 3-1. 解説文（英語）

> Snowflake supports SCIM 2.0 and is compatible with Okta and Azure Active Directory. SCIM is an open standard that provides automatic user provisioning and role synchronization based on identity provider information. When a new user is created in the identity provider, the SCIM automatically provisions the user in Snowflake. Additionally, SCIM can sync groups defined in an identity provider with Snowflake roles.

## 3-2. 解説文の文法解析

### 文1: "Snowflake supports SCIM 2.0 and is compatible with Okta and Azure Active Directory."

- **主語 (S)**: Snowflake
- **動詞 (V1)**: supports / **(V2)**: is compatible with
- **目的語 (O1)**: SCIM 2.0
- **補語 (M)**: with Okta and Azure Active Directory
- **文型**: S + V1 + O（and）V2 + M（等位接続詞 and で2つの述語を並列）
- **注目ポイント**: 主語を共有して動詞句を and で繋ぐパターン

### 文2: "SCIM is an open standard that provides automatic user provisioning and role synchronization based on identity provider information."

- **主語 (S)**: SCIM
- **動詞 (V)**: is
- **補語 (C)**: an open standard that provides ...
- **文型**: SVC
- **注目ポイント**:
  - 「that provides ...」は関係代名詞節で「an open standard」を修飾
  - 「based on ~」は過去分詞の分詞構文で「～に基づいて」

### 文3: "When a new user is created in the identity provider, the SCIM automatically provisions the user in Snowflake."

- **従属節**: When a new user is created in the identity provider（時を表す副詞節）
- **主語 (S)**: the SCIM
- **動詞 (V)**: provisions（三人称単数現在）
- **副詞 (M)**: automatically
- **目的語 (O)**: the user
- **場所 (M)**: in Snowflake
- **文型**: When節 + SVO
- **注目ポイント**: 「When + 受動態, 主節」は条件的な時間関係を示す典型パターン

### 文4: "Additionally, SCIM can sync groups defined in an identity provider with Snowflake roles."

- **接続副詞**: Additionally（さらに）
- **主語 (S)**: SCIM
- **動詞 (V)**: can sync
- **目的語 (O)**: groups defined in an identity provider（過去分詞 defined が groups を後置修飾）
- **前置詞句 (M)**: with Snowflake roles（同期先を示す）
- **文型**: SVO + M
- **注目ポイント**: 「groups defined in ~」は過去分詞による後置修飾。「～で定義されたグループ」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| provision | verb | プロビジョニングする、準備・提供する | The system provisions new accounts automatically. |
| compatible with | adj + prep | ～と互換性がある | This feature is compatible with all browsers. |
| open standard | noun | オープン標準（誰でも利用可能な技術規格） | OAuth 2.0 is an open standard for authorization. |
| role synchronization | noun | ロール同期 | SCIM enables role synchronization across platforms. |
| identity provider | noun | IDプロバイダ（認証情報の管理元） | Okta is a popular identity provider. |

## 3-3. 解説文（日本語）

> SnowflakeはSCIM 2.0をサポートしており、OktaおよびAzure Active Directoryと互換性があります。SCIMは、IDプロバイダの情報に基づいてユーザーの自動プロビジョニングとロールの同期を提供するオープン標準です。IDプロバイダで新しいユーザーが作成されると、SCIMが自動的にSnowflakeにそのユーザーをプロビジョニングします。さらに、SCIMはIDプロバイダで定義されたグループをSnowflakeのロールと同期することができます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
