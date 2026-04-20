# 058: TLS Data in Transit

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-13
**正答**: True

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| TLS 1.2 (Transport Layer Security) | データ転送中の暗号化プロトコル。Snowflakeはすべての接続でTLS 1.2を使用してデータを暗号化する |
| Data in Transit（転送中のデータ） | ネットワーク上を移動中のデータ。Data at Rest（保存データ）と対比。Snowflakeは両方を暗号化 |
| Data at Rest（保存データ） | ストレージに保存されている静止状態のデータ。Snowflakeは AES-256で暗号化 |
| End-to-End Encryption（エンドツーエンド暗号化） | データの送信元から受信先まで全経路で暗号化が維持される仕組み |
| JDBC / ODBC / Python Connector | Snowflakeへの接続方式。すべてTLS 1.2で暗号化される |

## 1-2. 重要コンセプトまとめ

- Snowflakeは **すべての** 転送中データを **TLS 1.2** で暗号化する
- 対象となる接続: **すべて**（Web UI, JDBC, ODBC, Python Connector等）
- Snowflakeの暗号化は2層:
  - **Data in Transit**: TLS 1.2
  - **Data at Rest**: AES-256
- 両方とも **デフォルトで自動** 適用（ユーザーの設定不要）
- TLSのバージョン「1.2」が重要な数字（1.0や1.1ではない）

## 1-3. 公式ドキュメントURL

- [End-to-End Encryption](https://docs.snowflake.com/en/user-guide/security-encryption-end-to-end)

---

## 2-1. 問題文（英語）

> True or False: Snowflake encrypts all data in transit end to end using TLS 1.2.
>
> A. False
> B. True

## 2-2. 問題文の文法解析

### 文1: "Snowflake encrypts all data in transit end to end using TLS 1.2."

- **主語 (S)**: Snowflake
- **動詞 (V)**: encrypts
- **目的語 (O)**: all data in transit
- **修飾語 (M)**: end to end（範囲）、using TLS 1.2（手段）
- **文型**: SVO
- **注目ポイント**: `in transit` は「転送中の」。`end to end` は「エンドツーエンドで」。`using ~` は分詞構文で手段を示す。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| encrypt | verb | 暗号化する | Snowflake encrypts all data in transit. |
| in transit | phrase | 転送中の | Data in transit is encrypted with TLS. |
| end to end | phrase | エンドツーエンドで | Encrypted end to end. |

## 2-3. 問題文（日本語）

> 真か偽か: Snowflakeは転送中のすべてのデータをTLS 1.2を使用してエンドツーエンドで暗号化する。
>
> A. 偽
> B. 真

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
- **修飾語 (M)**: including those made through ~（具体例の列挙）
- **文型**: SVO
- **注目ポイント**: `This applies to all ~` で「これはすべての～に適用される」。`including ~` で具体例を列挙。`those made through ~` の `those` は `connections` を指す。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| apply to ~ | phrase | ～に適用される | This applies to all connections. |
| including ~ | preposition | ～を含めて | Including JDBC, ODBC, and Python. |
| connector | noun | コネクタ（接続ツール） | The Python connector uses TLS 1.2. |

## 3-3. 解説文（日本語）

> Snowflakeは転送中のすべてのデータをTransport Layer Security (TLS) 1.2を使用して暗号化します。これはSnowflake Web インターフェース、JDBC、ODBC、Pythonコネクタを通じた接続を含む、すべてのSnowflake接続に適用されます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
