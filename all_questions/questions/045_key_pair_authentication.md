# 045: Key Pair Authentication — Structure and Characteristics

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-03
**正答**: B・D（パスワード認証の代替 / 秘密鍵1つ + 公開鍵1〜2つで構成）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Key Pair Authentication（キーペア認証） | 公開鍵・秘密鍵のペアを使った認証方式。ユーザー名/パスワードの代替として使用できる。すべてのSnowflakeエディションでサポート |
| Private Key（秘密鍵） | キーペアの秘密側。クライアント（ユーザー側）が保持し、認証時に使用する。絶対に外部に漏らしてはいけない |
| Public Key（公開鍵） | キーペアの公開側。Snowflakeのユーザーアカウントに登録する。1ユーザーにつき最大2つ持てる（ローテーション用） |
| Key Rotation（キーローテーション） | 古いキーを新しいキーに切り替えること。公開鍵を2つ持てるのは、ローテーション中でも認証を止めないためのダウンタイムゼロ設計 |
| SSO（Single Sign-On） | 1つの認証情報で複数のサービスにアクセスする仕組み（Okta・Azure AD等）。キーペア認証とは別の概念 |
| Username/Password Authentication | Snowflakeのデフォルト認証方式。キーペア認証はこれの「代替」として機能する |

## 1-2. 重要コンセプトまとめ

- **キーペア認証の構成（正答D）**:
  - **秘密鍵 × 1**: クライアント側で保持・認証時に使用
  - **公開鍵 × 最大2つ**: Snowflakeのユーザーアカウントに登録

- **パスワード不要（正答B）**: キーペア認証はパスワード認証の「代替」。パスワードは必要ない

- **SSOとは別物（誤答C）**: SSOはIDプロバイダーによる認証（SAML等）。キーペア認証とは異なる

- **なぜ公開鍵が2つ持てるのか**: キーローテーション時にダウンタイムなしで切り替えられるよう、古いキーと新しいキーを一時的に共存させるため

- **すべてのエディションでサポート**: Standard / Enterprise / Business Critical / VPS すべて対応

- **SnowSQL・全ドライバー/コネクタ対応**: プログラム的な接続（CI/CD・自動化）に特に有用

## 1-3. 公式ドキュメントURL

- [Key Pair Authentication](https://docs.snowflake.com/en/user-guide/key-pair-auth)

---

## 2-1. 問題文（英語）

> Which of the following statement is true regarding key pair authentication in Snowflake? Select all that apply.
>
> A. Key pair authentication requires the user to provide a password.
> B. Key pair authentication is an alternative to simple username/password authentication.
> C. Key pair authentication enables single sign-on (SSO).
> D. Key pair authentication consists of a private key and one or two public keys.

## 2-2. 問題文の文法解析

### 選択肢B: "Key pair authentication is an alternative to simple username/password authentication."

- **主語 (S)**: Key pair authentication（キーペア認証は）
- **動詞 (V)**: is（〜である）
- **補語 (C)**: an alternative to simple username/password authentication（シンプルなユーザー名/パスワード認証の代替）
- **注目ポイント**: `be an alternative to ~` = 「〜の代替である」。2つの選択肢が同等に機能できることを示す

### 選択肢D: "Key pair authentication consists of a private key and one or two public keys."

- **主語 (S)**: Key pair authentication（キーペア認証は）
- **動詞 (V)**: consists of（〜から構成される）
- **目的語**: a private key and one or two public keys（秘密鍵1つと1〜2つの公開鍵）
- **注目ポイント**: `consist of ~` = 「〜から構成される」。`one or two` = 「1つまたは2つ」。最大2つという上限を示す表現

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| key pair | 名詞句 | キーペア（公開鍵と秘密鍵のペア） | Key pair authentication uses a public and private key. |
| alternative to ~ | 名詞句 | 〜の代替 | Key pairs are an alternative to passwords. |
| consist of ~ | 熟語 | 〜から構成される | The key pair consists of one private and up to two public keys. |
| one or two | 数量表現 | 1つまたは2つ（最大2つ） | A user can have one or two public keys. |

## 2-3. 問題文（日本語）

> Snowflakeのキーペア認証に関して正しい記述はどれですか？当てはまるものをすべて選択してください。
>
> A. キーペア認証ではユーザーがパスワードを提供する必要がある。
> B. キーペア認証はシンプルなユーザー名/パスワード認証の代替である。
> C. キーペア認証はシングルサインオン（SSO）を実現する。
> D. キーペア認証は1つの秘密鍵と1〜2つの公開鍵から構成される。

---

## 3-1. 解説文（英語）

> Snowflake provides an additional layer of security by supporting key pair authentication in addition to the standard username/password login. This approach comprises private and public keys, with the public key allocated to a user and the private key used for authentication. The user provides a public key during authentication. A user can have up to two public keys, which can be rotated at any point in time. Key pair authentication is supported by all SnowSQL and Snowflake drivers and connectors. All Snowflake editions support Key-pair authentication.

## 3-2. 解説文の文法解析

### 文1: "Snowflake provides an additional layer of security by supporting key pair authentication in addition to the standard username/password login."

- **主語 (S)**: Snowflake
- **動詞 (V)**: provides（提供する）
- **目的語 (O)**: an additional layer of security（追加のセキュリティレイヤーを）
- **修飾語 (M1)**: by supporting key pair authentication（キーペア認証をサポートすることによって）← `by + 動名詞` = 手段
- **修飾語 (M2)**: in addition to the standard username/password login（標準のユーザー名/パスワードログインに加えて）← `in addition to ~` = 「〜に加えて」
- **注目ポイント**: `in addition to ~` は「〜に加えて・〜の他に」。`besides ~` と同義の前置詞句

### 文2: "This approach comprises private and public keys, with the public key allocated to a user and the private key used for authentication."

- **主語 (S)**: This approach（このアプローチは）
- **動詞 (V)**: comprises（〜から成る・含む）
- **目的語 (O)**: private and public keys（秘密鍵と公開鍵）
- **修飾語 (M)**: with the public key allocated to a user and the private key used for authentication（公開鍵がユーザーに割り当てられ、秘密鍵が認証に使用される状態で）← `with + O + 過去分詞` の付帯状況
- **注目ポイント**: `with O + 過去分詞` の並列。2つの役割を対比的に説明する表現

### 文3: "A user can have up to two public keys, which can be rotated at any point in time."

- **主語 (S)**: A user（ユーザーは）
- **動詞 (V)**: can have（持つことができる）
- **目的語 (O)**: up to two public keys（最大2つの公開鍵を）
- **修飾語 (M)**: which can be rotated at any point in time（いつでもローテーションできる）← 非制限関係詞節
- **注目ポイント**: `at any point in time` = 「任意の時点で・いつでも」。タイミングの柔軟性を示す表現

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| additional layer of security | 名詞句 | 追加のセキュリティレイヤー | Key pairs provide an additional layer of security. |
| in addition to ~ | 前置詞句 | 〜に加えて | Key pair auth is supported in addition to passwords. |
| comprise | 動詞 | 〜から成る、含む（= consist of） | This approach comprises private and public keys. |
| allocate to ~ | 動詞句 | 〜に割り当てる | The public key is allocated to the user account. |
| at any point in time | 副詞句 | 任意の時点で、いつでも | Keys can be rotated at any point in time. |
| up to ~ | 前置詞句 | 最大〜まで | A user can have up to two public keys. |

## 3-3. 解説文（日本語）

> Snowflakeは標準のユーザー名/パスワードログインに加えてキーペア認証をサポートすることで、追加のセキュリティレイヤーを提供しています。このアプローチは秘密鍵と公開鍵から成り、公開鍵はユーザーに割り当てられ、秘密鍵は認証に使用されます。ユーザーは認証時に公開鍵を提供します。1ユーザーは最大2つの公開鍵を持つことができ、いつでもローテーションできます。キーペア認証はすべてのSnowSQLおよびSnowflakeのドライバー・コネクタでサポートされています。すべてのSnowflakeエディションでキーペア認証がサポートされています。

---

## 復習メモ

- [ ] キーペア認証の構成（秘密鍵×1 + 公開鍵×最大2）を覚えた
- [ ] パスワード不要・SSOとは別物という2点を確認した
- [ ] 公開鍵が2つ持てる理由（キーローテーションのため）を説明できる
- [ ] 英語の文法ポイント（in addition to / with O + 過去分詞 / at any point in time）を確認した
- [ ] この問題はセキュリティの理論問題のためサンドボックス検証は不要
