# 089: TLS Encryption in Transit

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-16
**正答**: A, B, C, D（全選択肢）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| TLS 1.2 (Transport Layer Security) | Snowflakeが転送中データの暗号化に使用するプロトコル。すべてのSnowflake接続に適用される |
| Encryption in Transit（転送中暗号化） | データがネットワークを通じて送受信される際の暗号化。TLS 1.2で実現 |
| Encryption at Rest（保存時暗号化） | ストレージに保存されているデータの暗号化。AES-256で実現 |

## 1-2. 重要コンセプトまとめ

- TLS 1.2による転送中暗号化は**すべてのSnowflake接続**に適用される:
  - Snowflake Web UI（Snowsight）
  - SnowSQL（CLI）
  - JDBC Driver
  - ODBC Driver
  - Python Connector
  - その他すべてのコネクタ/ドライバ
- 「一部のツールにのみ適用」ではなく**例外なし**
- Encryption in Transit (TLS 1.2) と Encryption at Rest (AES-256) の2層で保護

## 1-3. 公式ドキュメントURL

- [End-to-End Encryption](https://docs.snowflake.com/en/user-guide/security-encryption-end-to-end)

---

## 2-1. 問題文（英語）

> Snowflake performs encryption in transit using TLS 1.2. Snowflake can do encryption in transit for which of the following tools? Select all that apply.
>
> A. SnowSQL
> B. ODBC Connector
> C. JDBC Connector
> D. Snowflake Web UI

## 2-2. 問題文の文法解析

### 文1: "Snowflake performs encryption in transit using TLS 1.2."

- **主語 (S)**: Snowflake
- **動詞 (V)**: performs
- **目的語 (O)**: encryption in transit
- **修飾語 (M)**: using TLS 1.2（手段）
- **文型**: SVO

### 文2: "Snowflake can do encryption in transit for which of the following tools?"

- **主語 (S)**: Snowflake
- **動詞 (V)**: can do
- **目的語 (O)**: encryption in transit
- **修飾語 (M)**: for which of the following tools
- **文型**: SVO

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| encryption in transit | 名詞句 | 転送中の暗号化 | TLS 1.2 provides encryption in transit. |
| perform | 動詞 | 実行する | Snowflake performs encryption using TLS. |

## 2-3. 問題文（日本語）

> SnowflakeはTLS 1.2を使用して転送中暗号化を行います。Snowflakeは以下のどのツールに対して転送中暗号化を行えますか？該当するものをすべて選んでください。
>
> A. SnowSQL
> B. ODBCコネクタ
> C. JDBCコネクタ
> D. Snowflake Web UI

---

## 3-1. 解説文（英語）

> Snowflake encrypts all data in transit using Transport Layer Security (TLS) 1.2. This applies to all Snowflake connections, including those made through the Snowflake Web interface, JDBC, ODBC, and the Python connector.

## 3-2. 解説文の文法解析

### 文1: "Snowflake encrypts all data in transit using Transport Layer Security (TLS) 1.2."

- **主語 (S)**: Snowflake
- **動詞 (V)**: encrypts
- **目的語 (O)**: all data in transit
- **修飾語 (M)**: using Transport Layer Security (TLS) 1.2
- **文型**: SVO

### 文2: "This applies to all Snowflake connections, including those made through the Snowflake Web interface, JDBC, ODBC, and the Python connector."

- **主語 (S)**: This
- **動詞 (V)**: applies to
- **目的語 (O)**: all Snowflake connections
- **修飾語 (M)**: including those made through ...（具体例列挙）
- **文型**: SVO
- **注目ポイント**: 「applies to all ~ , including ...」で全接続に適用されることを示し、具体例を列挙。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| applies to all | 動詞句 | すべてに適用される | This applies to all Snowflake connections. |
| including | 前置詞 | ～を含む | Including JDBC, ODBC, and Python. |

## 3-3. 解説文（日本語）

> SnowflakeはTLS 1.2を使用して転送中のすべてのデータを暗号化します。これはSnowflake Webインターフェース、JDBC、ODBC、Python Connectorを通じた接続を含む、すべてのSnowflake接続に適用されます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
