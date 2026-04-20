# 003: SCIM Compatibility — Okta and Azure AD

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-08
**正答**: True

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| SCIM 2.0（System for Cross-domain Identity Management） | 異なるシステム間でユーザーIDを自動管理するためのオープン標準プロトコル。バージョン2.0に対応。ユーザーのプロビジョニングとロールの同期を自動化する。 |
| Identity Provider（IdP / アイデンティティプロバイダー） | ユーザーの認証情報を一元管理するサービス。SnowflakeはOkta・Azure Active Directoryと互換性がある。ユーザー/グループの定義をSnowflakeに自動同期できる。 |
| Auto-Provisioning（自動プロビジョニング） | IdPでユーザーが作成されると、SCIMが自動的にSnowflakeにそのユーザーを作成する仕組み。手動作業なしでアカウント管理が可能。 |
| Role Synchronization（ロール同期） | IdPで定義されたグループをSnowflakeのロールと同期させる機能。SCIM経由でグループのメンバーシップ変更が自動的にSnowflakeのロールに反映される。 |
| Open Standard（オープン標準） | 特定ベンダーに依存しない、公開された仕様に基づくプロトコルや規格。SCIMはオープン標準であり、複数のIdPで利用可能。 |

## 1-2. 重要コンセプトまとめ

- **答えが True の理由**: SnowflakeはSCIM 2.0をサポートし、Okta・Azure Active Directoryの両方と互換性がある
- **SCIMの2大機能**:
  1. **自動ユーザープロビジョニング** — IdPで新規ユーザー作成 → Snowflakeに自動作成
  2. **グループ/ロール同期** — IdPのグループ = Snowflakeのロールとして同期
- **試験ポイント**: 対応IdPをそのまま問われることが多い。「Okta と Azure Active Directory（Azure AD）」の2つを覚える
- **SCIMとSSOの違い**: SSO（Single Sign-On）は認証（ログイン）の統合。SCIMはユーザー/グループの**プロビジョニング（作成・削除・同期）**の自動化
- **「based on identity provider information」**: SCIMはIdP側の情報を起点にSnowflake側を更新する一方向の流れ

## 1-3. 公式ドキュメントURL

- [SCIM — Overview](https://docs.snowflake.com/en/user-guide/scim)

---

## 2-1. 問題文（英語）

> True or False: Snowflake supports SCIM 2.0 and is compatible with Okta and Azure Active Directory.
>
> A. True
>
> B. False

## 2-2. 問題文の文法解析

### 文1: "Snowflake supports SCIM 2.0 and is compatible with Okta and Azure Active Directory."

- **主語 (S)**: Snowflake
- **動詞1 (V1)**: supports
- **目的語1 (O1)**: SCIM 2.0
- **動詞2 (V2)**: is（be動詞）
- **補語 (C)**: compatible with Okta and Azure Active Directory
- **文型**: SVO and SVC（並列構造）
- **注目ポイント**:
  - `be compatible with ~` — 「〜と互換性がある」。`support` と異なり「共存・連携できる」ニュアンス
  - 並列構造: `supports SCIM 2.0` と `is compatible with ...` が `and` で接続される。主語 Snowflake が両方の節の主語

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| compatible with | 形容詞句 | 〜と互換性がある、〜と連携できる | Snowflake is compatible with Okta and Azure AD. |
| support | 動詞 | サポートする、対応している | Snowflake supports SCIM 2.0. |
| Azure Active Directory | 固有名詞 | MicrosoftのクラウドベースのIdPサービス | Azure AD can be used as an identity provider. |

## 2-3. 問題文（日本語）

> 正誤問題: SnowflakeはSCIM 2.0をサポートしており、OktaおよびAzure Active Directoryと互換性がある。
>
> A. 正しい（True）
>
> B. 誤り（False）

---

## 3-1. 解説文（英語）

> Snowflake supports SCIM 2.0 and is compatible with Okta and Azure Active Directory. SCIM is an open standard that provides automatic user provisioning and role synchronization based on identity provider information. When a new user is created in the identity provider, the SCIM automatically provisions the user in Snowflake. Additionally, SCIM can sync groups defined in an identity provider with Snowflake roles.

## 3-2. 解説文の文法解析

### 文1: "SCIM is an open standard that provides automatic user provisioning and role synchronization based on identity provider information."

- **主語 (S)**: SCIM
- **動詞 (V)**: is
- **補語 (C)**: an open standard（+ 関係詞節）
- **関係詞節**: that provides automatic user provisioning and role synchronization（SCIMを修飾）
- **修飾語 (M)**: based on identity provider information（分詞句 — provides を修飾）
- **文型**: SVC
- **注目ポイント**:
  - `that provides ~` — 主格の関係代名詞。先行詞 `an open standard` を修飾
  - `based on ~` — 過去分詞の分詞句「〜に基づいて」。主節全体の手段・根拠を示す

### 文2: "When a new user is created in the identity provider, the SCIM automatically provisions the user in Snowflake."

- **時間節**: When a new user is created in the identity provider（受動態）
- **主語 (S)**: the SCIM
- **動詞 (V)**: automatically provisions（副詞 + 動詞）
- **目的語 (O)**: the user
- **修飾語 (M)**: in Snowflake（場所）
- **文型**: SVO
- **注目ポイント**:
  - `is created`（受動態） — IdP側でユーザーが作成される（誰かが作る）
  - `provisions` — 「プロビジョニングする / 自動作成する」。技術文書でアカウント自動生成を指す動詞

### 文3: "Additionally, SCIM can sync groups defined in an identity provider with Snowflake roles."

- **主語 (S)**: SCIM
- **動詞 (V)**: can sync（助動詞 + 動詞）
- **目的語 (O)**: groups defined in an identity provider（過去分詞句が groups を後置修飾）
- **修飾語 (M)**: with Snowflake roles（sync の相手を示す前置詞句）
- **文型**: SVO
- **注目ポイント**:
  - `defined in an identity provider` — 過去分詞の後置修飾「IdPで定義されたグループ」
  - `sync A with B` — 「AをBと同期させる」。AがIdPのグループ、BがSnowflakeのロール
  - `Additionally` — 「さらに、加えて」。前述の機能に追加の機能を紹介する接続副詞

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| open standard | 名詞句 | オープン標準（公開仕様） | SCIM is an open standard for identity management. |
| provision | 動詞 | プロビジョニングする、自動作成する | SCIM provisions the user automatically in Snowflake. |
| synchronization | 名詞 | 同期 | SCIM handles role synchronization. |
| sync A with B | 動詞句 | AをBと同期させる | SCIM can sync IdP groups with Snowflake roles. |
| additionally | 副詞 | さらに、加えて | Additionally, SCIM can sync groups with roles. |
| defined in ~ | 分詞形容詞 | 〜で定義された | Groups defined in the IdP are mapped to Snowflake roles. |

## 3-3. 解説文（日本語）

> SnowflakeはSCIM 2.0をサポートしており、OktaおよびAzure Active Directoryと互換性があります。SCIMはオープン標準であり、アイデンティティプロバイダーの情報に基づいて、ユーザーの自動プロビジョニングとロールの同期を提供します。IdPで新しいユーザーが作成されると、SCIMは自動的にSnowflakeにそのユーザーをプロビジョニングします。さらに、SCIMはIdPで定義されたグループをSnowflakeのロールと同期させることができます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
