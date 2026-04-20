# 034: Default Encryption at Rest — AES-256

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-12
**正答**: B（False）
**ユーザー回答**: B — 正解

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Data at Rest（保存データ） | ストレージに保存されている静止状態のデータ。転送中のデータ（Data in Transit）と対比される。Snowflakeは**デフォルトで**すべての保存データを暗号化する |
| AES-256（Advanced Encryption Standard 256-bit） | Snowflakeが保存データの暗号化に使用する暗号化規格。**256ビット**鍵を使用する強力な暗号化方式。顧客の設定なしに自動で適用される |
| Unencrypted（非暗号化） | 暗号化されていない状態。Snowflakeでは**保存データが非暗号化になることはない** |
| Encryption Key Management（暗号化キー管理） | Snowflakeがデフォルトで自動管理する暗号化キーの仕組み。30日ごとにキーローテーション、1年ごとにリキーイング（再暗号化）を自動実行 |
| Tri-Secret Secure | Business Critical以上のエディションで利用可能なオプション機能。顧客がSnowflakeと暗号化キーを共同管理する。デフォルトの暗号化に加えた追加のセキュリティレイヤー |

## 1-2. 重要コンセプトまとめ

- **Snowflakeの保存データは常に暗号化されている（False）**: 「顧客が設定しない限り非暗号化」は完全に誤り。デフォルトでAES-256暗号化が適用される
- **顧客の操作は不要**: 暗号化はSnowflakeが自動的に管理。ユーザーに透明（transparent）
- **暗号化の4つのポイント**（Q007で学習済み）:
  1. **デフォルトでキーを自動管理**
  2. **AES-256-bit**暗号化（128ではなく256）
  3. **30日ごと**にキーローテーション
  4. **1年ごと**にリキーイング（再暗号化）
- **「unless configured by the customer」のひっかけ**: 暗号化は顧客の設定に関係なく常に有効。Tri-Secret Secureは追加の暗号化管理であり、デフォルトの暗号化を無効にするものではない
- **試験ポイント**: 「unencrypted」「unless configured」「by default」などのキーワードが出たら → Snowflakeは**常に暗号化**
- **関連問題**: Q007（Data at Rest Encryption）

## 1-3. 公式ドキュメントURL

- [Encryption Key Management](https://docs.snowflake.com/en/user-guide/security-encryption-manage)

---

## 2-1. 問題文（英語）

> True or False: Snowflake stores all data at rest unencrypted unless configured by the customer.
>
> A. True
> B. False

## 2-2. 問題文の文法解析

### 文1: "Snowflake stores all data at rest unencrypted unless configured by the customer."

- **主語 (S)**: Snowflake
- **動詞 (V)**: stores（保存する）
- **目的語 (O)**: all data at rest（すべての保存データを）
- **補語 (C)**: unencrypted（非暗号化の状態で）— 目的格補語
- **条件節 (M)**: unless configured by the customer（顧客が設定しない限り）
- **文型**: SVOC + unless条件節
- **注目ポイント**:
  - `unless ~` — 「〜しない限り」。例外条件を示す。この問題では「顧客が設定しない限り非暗号化」と主張しているがFalse
  - `unencrypted` — 目的格補語として「非暗号化の状態で」。`store O C`（OをCの状態で保存する）構文
  - `data at rest` — 「保存データ」。`at rest` が後置修飾

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| at rest | adj phrase | 保存中の、静止状態の | All data at rest is encrypted by default. |
| unencrypted | adj | 非暗号化の | Snowflake never stores data unencrypted. |
| unless | conj | 〜しない限り | Data is always encrypted unless explicitly stated otherwise. |
| configured by ~ | verb phrase | 〜によって設定された | Encryption is automatic, not configured by the customer. |

## 2-3. 問題文（日本語）

> True/False: Snowflakeは、顧客が設定しない限り、すべての保存データを非暗号化の状態で保存する。
>
> A. True（正しい）
> B. False（誤り）

---

## 3-1. 解説文（英語）

> In Snowflake, all data at rest is encrypted using AES 256-bit encryption.

## 3-2. 解説文の文法解析

### 文1: "In Snowflake, all data at rest is encrypted using AES 256-bit encryption."

- **修飾語 (M1)**: In Snowflake（Snowflakeにおいて）
- **主語 (S)**: all data at rest（すべての保存データは）
- **動詞 (V)**: is encrypted（暗号化されている）— 受動態
- **手段 (M2)**: using AES 256-bit encryption（AES 256ビット暗号化を使用して）
- **文型**: SV（受動態）
- **注目ポイント**: `using ~` — 分詞構文で手段を示す。「AES 256-bit」という具体的な暗号化規格名

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| is encrypted | verb phrase | 暗号化されている | All data at rest is encrypted. |
| AES 256-bit | noun phrase | AES 256ビット暗号化規格 | Snowflake uses AES 256-bit encryption. |

## 3-3. 解説文（日本語）

> Snowflakeでは、すべての保存データはAES 256ビット暗号化を使用して暗号化されています。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
