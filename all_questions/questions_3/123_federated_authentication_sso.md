# 123: Federated Authentication — SSO and SAML 2.0

**SnowPro Core Domain**: Domain 2 — Account Management and Security
**作成日**: 2026-04-17
**正答**: A, B, C（IdP認証後はSnowflake個別ログイン不要 / SAML 2.0互換 / OktaとADFSをネイティブサポート）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Federated Authentication（フェデレーション認証） | 外部のIdP（IDプロバイダー）でのシングル認証によって、複数のサービス（Snowflakeを含む）にアクセスできるようにする仕組み |
| SSO (Single Sign-On) | 一度のログインで複数のサービスにアクセスできるユーザー体験。Federated Authenticationによって実現される |
| SAML 2.0 (Security Assertion Markup Language) | フェデレーション認証の業界標準プロトコル（バージョン2.0）。SnowflakeはSAML 2.0準拠のほぼすべてのIdPと互換性がある |
| Identity Provider / IdP（IDプロバイダー） | ユーザーの認証情報を管理し、認証結果をサービスに提供する外部サービス。Okta・ADFS・OneLogin・Ping Identityなどが代表例 |
| Okta | Snowflakeがネイティブサポートする主要IdPの一つ。SAML 2.0準拠のクラウドIDサービス |
| ADFS (Active Directory Federation Services) | MicrosoftのIDフェデレーションサービス。Snowflakeがネイティブサポートする主要IdPの一つ |
| Native Support（ネイティブサポート） | 追加の設定なしに直接統合できる、公式にサポートされた連携。OktaとADFSが該当 |

## 1-2. 重要コンセプトまとめ

- **Snowflakeのフェデレーション認証の特徴（3つ正解）**
  1. IdP認証後、Snowflakeの個別ログイン（ユーザー名・パスワード）は不要
  2. SAML 2.0準拠の大多数のIdPと互換性がある
  3. OktaとADFSをネイティブサポート
- **ネイティブサポートIdP一覧**
  - Okta
  - ADFS（Active Directory Federation Services）
  - OneLogin（試験によっては含む）
  - Ping Identity PingOne（試験によっては含む）
- **誤りの選択肢のパターン**
  - 「IdP認証後もSnowflakeのユーザー名・パスワードが必要」→ 誤り（SSOの意味がない）
- **SCIM（自動プロビジョニング）とフェデレーション認証の違い**
  - フェデレーション認証: 認証（ログイン）の仕組み
  - SCIM: ユーザー/グループの自動作成・同期の仕組み
  - 両方が組み合わさることでIdP中心の管理が完結する

## 1-3. 公式ドキュメントURL

- [Federated Authentication and SSO](https://docs.snowflake.com/en/user-guide/admin-security-fed-auth)
- [SSO Overview](https://docs.snowflake.com/en/user-guide/admin-security-fed-auth-overview)

---

## 2-1. 問題文（英語）

> Which of the following statements best describe Snowflake's federated authentication? Select all that apply.
>
> A. Once authenticated with an external identity provider, a user is not required to submit their Snowflake username & password individually.
> B. Snowflake is compatible with the majority of SAML 2.0 identity providers.
> C. Snowflake has native support for Okta and ADFS.
> D. After being authorized by an external identity source, users must enter their Snowflake username and password.

## 2-2. 問題文の文法解析

### 文1: "Which of the following statements best describe Snowflake's federated authentication?"

- **主語 (S)**: Which of the following statements（複数形 → describe）
- **動詞 (V)**: best describe（副詞 best + 動詞）
- **目的語 (O)**: Snowflake's federated authentication
- **文型**: SVO（疑問文）
- **注目ポイント**: 
  - `best describe` = 最もよく説明する（`best` が程度を強調する副詞）
  - `federated authentication` = フェデレーション認証（federatedは「連合した・統合した」）

### 選択肢Aの分析: "Once authenticated with an external identity provider, a user is not required to submit their Snowflake username & password individually."

- **分詞構文（時間節の省略）**: Once authenticated with an external identity provider
- **主語 (S)**: a user
- **動詞 (V)**: is not required to submit（受動態 + 否定 + 不定詞）
- **目的語（to submit の目的）**: their Snowflake username & password
- **付加語**: individually（個別に・単独で）
- **注目ポイント**: 
  - `Once authenticated` = 一度認証されると（`Once they are authenticated` の省略形）
  - `is not required to submit` = 提出することを求められない（受動態による不要性の表現）
  - `individually` = 個別に（SSOの文脈では「Snowflakeだけのために」のニュアンス）

### 選択肢Dの分析（誤答）: "After being authorized by an external identity source, users must enter their Snowflake username and password."

- **時間節**: After being authorized（動名詞の受動態）
- **主節**: users must enter their Snowflake username and password
- **注目ポイント**: Aと対比。「must enter（入力しなければならない）」が誤り（SSOではそれが不要）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| federated | 形容詞 | 連合した、フェデレーションの | Federated authentication enables SSO. |
| authenticated | 形容詞/過去分詞 | 認証された | Once authenticated, users can access Snowflake directly. |
| compatible with | 形容詞句 | 〜と互換性がある | Snowflake is compatible with SAML 2.0 providers. |
| native support | 名詞句 | ネイティブサポート | Snowflake has native support for Okta and ADFS. |
| individually | 副詞 | 個別に | Users are not required to log in individually. |

## 2-3. 問題文（日本語）

> 次のうち、Snowflakeのフェデレーション認証を最もよく説明しているものはどれですか？該当するものをすべて選んでください。
>
> A. 外部IDプロバイダーで認証されると、ユーザーはSnowflakeのユーザー名とパスワードを個別に入力する必要がない。
> B. SnowflakeはSAML 2.0 IDプロバイダーの大多数と互換性がある。
> C. SnowflakeはOktaとADFSをネイティブサポートしている。
> D. 外部IDソースで認可された後、ユーザーはSnowflakeのユーザー名とパスワードを入力する必要がある。

---

## 3-1. 解説文（英語）

> Snowflake supports federated authentication, allowing for single sign-on (SSO). Users authenticate using a SAML 2.0-compliant external identity provider (IdP). After IdP authentication, users can access Snowflake without logging in. Snowflake natively supports the majority of SAML 2.0 compliant identity providers, including Okta, ADFS, OneLogin, and Ping Identity PingOne.
>
> https://docs.snowflake.com/en/user-guide/admin-security-fed-auth

## 3-2. 解説文の文法解析

### 文1: "Snowflake supports federated authentication, allowing for single sign-on (SSO)."

- **主語 (S)**: Snowflake
- **動詞 (V)**: supports
- **目的語 (O)**: federated authentication
- **分詞構文**: allowing for single sign-on（結果・付帯状況）
- **文型**: SVO
- **注目ポイント**: 
  - `allowing for ~` = 〜を可能にする（`allow for` = 〜に対応する・許容する）
  - `single sign-on` = シングルサインオン（SSOの正式名称）

### 文2: "Users authenticate using a SAML 2.0-compliant external identity provider (IdP)."

- **主語 (S)**: Users
- **動詞 (V)**: authenticate（自動詞）
- **手段の分詞構文**: using a SAML 2.0-compliant external identity provider
- **文型**: SV
- **注目ポイント**: 
  - `SAML 2.0-compliant` = SAML 2.0準拠の（compliantは「〜に準拠した」の形容詞）
  - `external identity provider (IdP)` = 外部IDプロバイダー（括弧内に略称）

### 文3: "After IdP authentication, users can access Snowflake without logging in."

- **時間の前置詞句**: After IdP authentication
- **主語 (S)**: users
- **動詞 (V)**: can access
- **目的語 (O)**: Snowflake
- **否定付帯状況**: without logging in
- **文型**: SVO
- **注目ポイント**: `without logging in` = ログインせずに（without + 動名詞で否定の付帯状況）

### 文4: "Snowflake natively supports the majority of SAML 2.0 compliant identity providers, including Okta, ADFS, OneLogin, and Ping Identity PingOne."

- **主語 (S)**: Snowflake
- **副詞**: natively（ネイティブに・組み込みで）
- **動詞 (V)**: supports
- **目的語 (O)**: the majority of SAML 2.0 compliant identity providers
- **具体例**: including Okta, ADFS, OneLogin, and Ping Identity PingOne
- **文型**: SVO
- **注目ポイント**: 
  - `natively supports` = ネイティブサポートする（追加設定なしに直接統合できる）
  - `the majority of ~` = 〜の大多数（`most of ~` より書き言葉的）
  - `including ~` = 〜を含む（具体例の列挙）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| allow for | 句動詞 | 〜を可能にする・〜に対応する | Federated auth allows for SSO. |
| compliant | 形容詞 | 準拠している | Snowflake uses SAML 2.0-compliant providers. |
| natively | 副詞 | ネイティブに、組み込みで | Snowflake natively supports Okta and ADFS. |
| the majority of | 名詞句 | 〜の大多数 | Snowflake supports the majority of SAML 2.0 providers. |
| without logging in | 副詞句 | ログインせずに | Users access Snowflake without logging in after SSO. |

## 3-3. 解説文（日本語）

> Snowflakeはフェデレーション認証をサポートしており、シングルサインオン（SSO）を実現します。ユーザーはSAML 2.0準拠の外部IDプロバイダー（IdP）を使用して認証します。IdP認証後、ユーザーはログインなしでSnowflakeにアクセスできます。Snowflakeは、Okta・ADFS・OneLogin・Ping Identity PingOneを含む、SAML 2.0準拠のIDプロバイダーの大多数をネイティブサポートしています。

---

## 復習メモ

- [ ] フェデレーション認証の3つの特徴（SSO・SAML 2.0互換・Okta/ADFSネイティブサポート）を覚えた
- [ ] IdP認証後はSnowflakeの個別ログイン不要であることを確認した
- [ ] `SAML 2.0-compliant`（SAML 2.0準拠の）と `allowing for ~`（〜を可能にする分詞構文）を確認した
