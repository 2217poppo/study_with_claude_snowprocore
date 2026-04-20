# 024: Key Pair Authentication Mechanism

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-10
**正答**: C（A private key and public key, with the public key allocated to a user and the private key used for authentication.）
**ユーザー回答**: C — 正解

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Key Pair Authentication（キーペア認証） | 公開鍵・秘密鍵のペアを使った認証方式。ユーザー名/パスワードの**代替（追加のセキュリティレイヤー）** として使用できる。すべてのSnowflakeエディションでサポート |
| Private Key（秘密鍵） | キーペアの秘密側。クライアント（ユーザー側）が保持し、**認証時に使用**する。絶対に外部に漏らしてはいけない |
| Public Key（公開鍵） | キーペアの公開側。**Snowflakeのユーザーアカウントに割り当て（allocate）** する。1ユーザーにつき**最大2つ**持てる（ローテーション用） |
| Key Rotation（キーローテーション） | 古い公開鍵を新しい公開鍵に切り替えること。公開鍵を2つ持てるためダウンタイムなしで切り替え可能。**いつでも（at any point in time）**ローテーション可能 |
| MFA（Multi-Factor Authentication） | 多要素認証。パスワード＋モバイルアプリ等の第2要素で認証する方式。キーペア認証とは別の仕組み（誤答の選択肢と混同しやすい） |
| SnowSQL | SnowflakeのCLIツール。キーペア認証をサポートするクライアントの一つ |

## 1-2. 重要コンセプトまとめ

- **キーペア認証の構成**:
  - **公開鍵（Public Key）**: Snowflakeのユーザーに割り当てる（最大2つ）
  - **秘密鍵（Private Key）**: クライアント側で保持し、認証に使用
- **MFAとの違い（試験頻出の混同ポイント）**:

| 項目 | Key Pair Authentication | MFA |
|------|------------------------|-----|
| 方式 | 公開鍵/秘密鍵 | パスワード＋第2要素 |
| 第2要素 | なし（パスワード代替） | モバイルアプリ（Duo等） |
| 用途 | プログラム的接続（CI/CD等） | ユーザーのログイン強化 |

- **キーペア認証の重要仕様**:
  - 公開鍵は最大**2つ**（ローテーション用）
  - **いつでも**ローテーション可能
  - **全エディション**でサポート
  - **SnowSQL・全ドライバー/コネクタ**でサポート
- **誤答の整理**:
  - ❌ モバイルアプリの第2要素 → MFAの説明
  - ❌ Bluetoothデバイス → Snowflakeにはこのような認証方式はない
  - ❌ 90秒ごとのコード生成する物理キー → OTP/ハードウェアトークンの説明（Snowflakeの機能ではない）
- **Q045との関連**: Q045でもキーペア認証を学習済み。本問はより詳細に「何で構成されるか」を問う

## 1-3. 公式ドキュメントURL

- [Key Pair Authentication](https://docs.snowflake.com/en/user-guide/key-pair-auth)

---

## 2-1. 問題文（英語）

> The key pair authentication mechanism consists of which of the following? Select one.
>
> A. A 2nd factor of authentication provided through a mobile app.
> B. A 2nd factor of authentication provided through a paired bluetooth device.
> C. A private key and public key, with the public key allocated to a user and the private key used for authentication.
> D. A physical key that provides a code every 90 seconds.

## 2-2. 問題文の文法解析

### 文1: "The key pair authentication mechanism consists of which of the following?"

- **主語 (S)**: The key pair authentication mechanism（キーペア認証の仕組みは）
- **動詞 (V)**: consists of（〜で構成される）
- **目的語 (O)**: which of the following（次のうちどれ）
- **文型**: SVO（疑問文）
- **注目ポイント**:
  - `consist of ~` — 「〜で構成される」。構成要素を問う定番表現
  - `mechanism` — 「仕組み、メカニズム」。技術的な動作原理を指す

### 選択肢Cの文法: "A private key and public key, with the public key allocated to a user and the private key used for authentication."

- **主要素**: A private key and public key（秘密鍵と公開鍵）
- **付帯状況1**: with the public key allocated to a user（公開鍵がユーザーに割り当てられた状態で）— with + O + 過去分詞
- **付帯状況2**: and the private key used for authentication（秘密鍵が認証に使用される状態で）— with + O + 過去分詞（andで並列）
- **注目ポイント**: `with + O + 過去分詞` が2つ並列され、各鍵の役割を付帯状況として記述

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| consist of ~ | verb phrase | 〜で構成される | Key pair auth consists of a private and public key. |
| allocate | verb | 割り当てる | The public key is allocated to a user. |
| mechanism | noun | 仕組み、メカニズム | The authentication mechanism uses key pairs. |

## 2-3. 問題文（日本語）

> キーペア認証の仕組みは、次のうちどれで構成されますか？1つ選択してください。
>
> A. モバイルアプリを通じて提供される第2要素認証
> B. ペアリングされたBluetoothデバイスを通じて提供される第2要素認証
> C. 秘密鍵と公開鍵。公開鍵がユーザーに割り当てられ、秘密鍵が認証に使用される
> D. 90秒ごとにコードを生成する物理キー

---

## 3-1. 解説文（英語）

> Snowflake provides an additional layer of security by supporting key pair authentication in addition to the standard username/password login. This approach comprises private and public keys, with the public key allocated to a user and the private key used for authentication. The user provides a public key during authentication. A user can have up to two public keys, which can be rotated at any point in time. Key pair authentication is supported by all SnowSQL and Snowflake drivers and connectors. All Snowflake editions support Key-pair authentication.

## 3-2. 解説文の文法解析

### 文1: "Snowflake provides an additional layer of security by supporting key pair authentication in addition to the standard username/password login."

- **主語 (S)**: Snowflake
- **動詞 (V)**: provides（提供する）
- **目的語 (O)**: an additional layer of security（追加のセキュリティレイヤーを）
- **手段 (M1)**: by supporting key pair authentication（キーペア認証をサポートすることによって）
- **修飾語 (M2)**: in addition to the standard username/password login（標準のユーザー名/パスワードログインに加えて）
- **文型**: SVO
- **注目ポイント**: `in addition to ~` — 「〜に加えて」。既存の機能にプラスして提供されることを示す

### 文2: "This approach comprises private and public keys, with the public key allocated to a user and the private key used for authentication."

- **主語 (S)**: This approach（この方式は）
- **動詞 (V)**: comprises（〜で構成される）
- **目的語 (O)**: private and public keys（秘密鍵と公開鍵を）
- **付帯状況 (M)**: with the public key allocated to a user and the private key used for authentication
- **文型**: SVO + with付帯状況
- **注目ポイント**: `comprise` — `consist of` と同義だが、主語が全体で目的語が部分

### 文3: "A user can have up to two public keys, which can be rotated at any point in time."

- **主語 (S)**: A user（ユーザーは）
- **動詞 (V)**: can have（持つことができる）
- **目的語 (O)**: up to two public keys（最大2つの公開鍵を）
- **関係詞節 (M)**: which can be rotated at any point in time（いつでもローテーション可能な）
- **文型**: SVO + 非制限関係詞節
- **注目ポイント**: `at any point in time` — `at any time` と同義。「いつでも」を強調する表現

### 文4: "Key pair authentication is supported by all SnowSQL and Snowflake drivers and connectors."

- **主語 (S)**: Key pair authentication
- **動詞 (V)**: is supported by（〜によってサポートされている）— 受動態
- **動作主 (M)**: all SnowSQL and Snowflake drivers and connectors（すべてのSnowSQL・ドライバー・コネクタ）
- **文型**: SV（受動態）

### 文5: "All Snowflake editions support Key-pair authentication."

- **主語 (S)**: All Snowflake editions（すべてのSnowflakeエディション）
- **動詞 (V)**: support（サポートする）
- **目的語 (O)**: Key-pair authentication（キーペア認証を）
- **文型**: SVO

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| in addition to ~ | prep phrase | 〜に加えて | Key pair auth is available in addition to password login. |
| comprise | verb | 〜で構成される | This approach comprises private and public keys. |
| up to ~ | prep phrase | 最大〜まで | A user can have up to two public keys. |
| at any point in time | adv phrase | いつでも | Public keys can be rotated at any point in time. |

## 3-3. 解説文（日本語）

> Snowflakeは、標準のユーザー名/パスワードログインに加えて、キーペア認証をサポートすることで追加のセキュリティレイヤーを提供します。この方式は秘密鍵と公開鍵で構成され、公開鍵がユーザーに割り当てられ、秘密鍵が認証に使用されます。ユーザーは認証時に公開鍵を提供します。ユーザーは最大2つの公開鍵を持つことができ、いつでもローテーション可能です。キーペア認証はすべてのSnowSQLおよびSnowflakeのドライバー・コネクタでサポートされています。すべてのSnowflakeエディションがキーペア認証をサポートしています。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
