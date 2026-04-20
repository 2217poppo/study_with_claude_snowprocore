# 063: Multi-Factor Authentication — Supported Clients

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-03
**正答**: B・C・D（JDBC / SnowSQL / Snowflake WebUI）

> 関連問題: 005（SnowSQL CLI）・040（Snowflake Drivers & Connectors）・045（Key Pair Authentication）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| MFA（Multi-Factor Authentication / 多要素認証） | パスワードに加えて、スマートフォンアプリ等の第2の認証要素を要求する認証方式。**全エディション・全アカウントでデフォルト有効**。すべてのSnowflakeクライアントツールが対応 |
| Snowflake Client Tool（クライアントツール） | SnowflakeへアクセスするためのツールやインターフェースMFA。WebUI（Snowsight）・SnowSQL・各種ドライバー・コネクター等が含まれる。**これらすべてがMFAに対応** |
| Serverless Service（サーバーレスサービス） | Snowflakeが管理・運用するサービスで、ユーザーがログインする概念がないもの。Snowpipeがこれに該当する。ユーザーがログインしないためMFAの対象外 |
| JDBC（Java Database Connectivity） | JavaアプリケーションからSnowflakeに接続するドライバー。クライアントツールとして**MFAに対応** |

## 1-2. 重要コンセプトまとめ

- **MFAの対象 = 「ユーザーがログインするもの」すべて**:
  - Snowflake WebUI（Snowsight）
  - SnowSQL（CLI）
  - JDBC・ODBC・各種コネクター・ドライバー
  - → すべてのSnowflakeクライアントツールが対応

- **MFAの対象外 = 「ユーザーがログインしないもの」**:
  - **Snowpipe** ← この問題のポイント
  - Snowpipeは**Snowflake管理のサーバーレスサービス**
  - ユーザーが直接ログインする概念がない → MFA不要・不可能

- **MFAの基本仕様**:
  - 全エディションで利用可能
  - デフォルトで有効（全アカウント）
  - Duoというサービスをバックエンドに使用

- **試験の引っかけ**: Snowpipeは「データロードの自動化」のイメージからクライアントツールと混同しやすい → Snowflake管理のサービスでありユーザーログインがないことを覚える

## 1-3. 公式ドキュメントURL

- [Multi-Factor Authentication (MFA)](https://docs.snowflake.com/en/user-guide/security-mfa)

---

## 2-1. 問題文（英語）

> Multi-factor authentication can be enabled for which of the following? Select all that apply.
>
> A. Snowpipe
> B. JDBC
> C. SnowSQL
> D. Snowflake WebUI

## 2-2. 問題文の文法解析

### 文1: "Multi-factor authentication can be enabled for which of the following?"

- **主語 (S)**: Multi-factor authentication（多要素認証は）
- **助動詞**: can（〜できる）
- **動詞 (V)**: be enabled（有効化される）← 受動態
- **修飾語**: for which of the following（以下のうちどれに対して）
- **注目ポイント**: `be enabled for ~` = 「〜に対して有効化できる」。`enable` の受動態。`for which of the following` = 疑問詞が文末の目的語位置に残る試験問題特有の語順

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| multi-factor authentication | 名詞句 | 多要素認証（MFA） | MFA adds a second verification step. |
| be enabled for ~ | 受動態熟語 | 〜に対して有効化される | MFA can be enabled for all client tools. |
| enable | 動詞 | 有効にする・可能にする | MFA is enabled by default for all accounts. |

## 2-3. 問題文（日本語）

> 多要素認証（MFA）は以下のうちどれに対して有効化できますか？当てはまるものをすべて選択してください。
>
> A. Snowpipe
> B. JDBC
> C. SnowSQL
> D. Snowflake WebUI

---

## 3-1. 解説文（英語）

> MFA is enabled by default for all Snowflake accounts and is available in all Snowflake editions. All Snowflake client tools, including the web interface, SnowSQL, and the various connectors and drivers, support MFA. Snowpipe is a snowflake-managed serverless service. A Snowflake user can not log into it; therefore, it doesn't require MFA.

## 3-2. 解説文の文法解析

### 文1: "MFA is enabled by default for all Snowflake accounts and is available in all Snowflake editions."

- **主語 (S)**: MFA
- **動詞1**: is enabled by default（デフォルトで有効化されている）← 受動態
- **動詞2**: is available（利用可能である）← 並列
- **注目ポイント**: `by default` と `in all ~` が同一文で使われ、「デフォルトかつ全エディション対応」を強調

### 文2: "All Snowflake client tools, including the web interface, SnowSQL, and the various connectors and drivers, support MFA."

- **主語 (S)**: All Snowflake client tools（すべてのSnowflakeクライアントツールが）
- **挿入句**: including the web interface, SnowSQL, and the various connectors and drivers（WebUI・SnowSQL・各種コネクター・ドライバーを含む）← `including ~` = 例を列挙する挿入句
- **動詞 (V)**: support（サポートする）
- **目的語 (O)**: MFA
- **注目ポイント**: `including ~` = 「〜を含む」。主語と動詞の間に挿入されて例を示す。コンマで前後を挟む

### 文3: "Snowpipe is a snowflake-managed serverless service."

- **主語 (S)**: Snowpipe
- **動詞 (V)**: is
- **補語 (C)**: a snowflake-managed serverless service（Snowflake管理のサーバーレスサービス）← `snowflake-managed` = 複合形容詞「Snowflakeが管理する」
- **注目ポイント**: `snowflake-managed` = ハイフンで結んだ複合形容詞。`managed by Snowflake` の形容詞化

### 文4: "A Snowflake user can not log into it; therefore, it doesn't require MFA."

- **主語 (S)**: A Snowflake user
- **動詞 (V)**: can not log into it（ログインできない）← `log into ~` = 「〜にログインする」
- **接続副詞**: therefore（したがって）← 論理的帰結
- **帰結**: it doesn't require MFA（MFAが不要）
- **注目ポイント**: `log into ~` = 「〜にログインする」（= `log in to ~`）。`therefore` = 前文の論理的帰結を導く

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| including ~ | 前置詞/挿入句 | 〜を含む | All tools, including SnowSQL, support MFA. |
| snowflake-managed | 複合形容詞 | Snowflakeが管理する | Snowpipe is a Snowflake-managed service. |
| serverless | 形容詞 | サーバーレスの（ユーザーがサーバー管理不要） | Snowpipe is a serverless service. |
| log into ~ | 動詞句 | 〜にログインする | Users cannot log into Snowpipe directly. |
| therefore | 接続副詞 | したがって（論理的帰結） | It has no login; therefore, MFA is not needed. |
| require | 動詞 | 必要とする・要求する | Snowpipe doesn't require MFA. |

## 3-3. 解説文（日本語）

> MFAはすべてのSnowflakeアカウントでデフォルトで有効化されており、すべてのSnowflakeエディションで利用できます。WebUI・SnowSQL・各種コネクター・ドライバーを含む、すべてのSnowflakeクライアントツールがMFAをサポートしています。SnowpipeはSnowflakeが管理するサーバーレスサービスです。SnowflakeユーザーはSnowpipeに直接ログインできないため、MFAは必要ありません。

---

## 復習メモ

- [ ] MFAはすべてのクライアントツール（WebUI・SnowSQL・JDBC等）で使えることを覚えた
- [ ] SnowpipeはSnowflake管理のサーバーレスサービスでユーザーログインがないためMFA対象外であることを覚えた
- [ ] `including ~`（挿入句）・`snowflake-managed`（複合形容詞）・`log into ~` の英語パターンを確認した
- [ ] この問題は理論問題のためサンドボックス検証は不要
