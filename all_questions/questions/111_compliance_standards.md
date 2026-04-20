# 111: Snowflake Compliance Standards

**SnowPro Core Domain**: Domain 2 — Account Management & Security
**作成日**: 2026-04-06
**正答**: HIPAA / FedRAMP / PCI-DSS / IRAP – Protected（すべて正解）
**ユーザー回答**: HIPAAのみ選択（FedRAMP / PCI-DSS / IRAP – Protected を見落とし）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| HIPAA（Health Insurance Portability and Accountability Act） | 米国の医療情報保護法。患者の医療情報（PHI: Protected Health Information）の保護を定める。SnowflakeはHITRUST/HIPAAに準拠 |
| FedRAMP（Federal Risk and Authorization Management Program） | 米国連邦政府のクラウドサービス認証プログラム。**FedRAMP Moderate**レベルでSnowflakeは認定されている。政府機関向けクラウドサービスの標準 |
| PCI-DSS（Payment Card Industry Data Security Standard） | クレジットカード決済情報の保護を定める国際セキュリティ基準。カード保有者データの安全な取り扱いを要求する |
| IRAP – Protected（Information Security Registered Assessors Program） | オーストラリアの政府データセキュリティ評価プログラム。**Protected**レベルの分類データを扱えることを認定。Snowflakeが取得 |
| SOC 1 / SOC 2 Type II | 米国のサービス組織管理基準。SOC 1は財務報告に関連するコントロール、SOC 2はセキュリティ・可用性・機密性等を評価。Type IIは一定期間の運用有効性を評価 |
| ISO/IEC 27001 | 情報セキュリティ管理システム（ISMS）の国際標準規格。情報資産のセキュリティ管理体制を評価・認証する |
| ITAR（International Traffic in Arms Regulations） | 米国の防衛関連品・サービスの輸出管理規制。SnowflakeはITAR準拠 |
| GxP | 製薬・生命科学産業の品質管理ガイドライン群（Good Manufacturing Practice等）の総称。SnowflakeはGxP準拠 |

## 1-2. 重要コンセプトまとめ

- **正解4つ**: HIPAA / FedRAMP / PCI-DSS / IRAP – Protected
- **ユーザーの見落とし**: HIPAA以外の3つを未選択
- **Snowflakeの主要コンプライアンス一覧**（試験で要暗記）:

| 規格/認証 | 分野 | ポイント |
|-----------|------|---------|
| IRAP Protected | オーストラリア政府 | 政府機密データ対応 |
| ITAR | 米国防衛輸出規制 | 防衛関連データ |
| **FedRAMP Moderate** | 米国連邦政府クラウド | レベルは「Moderate」 |
| GxP | 製薬・生命科学 | 品質管理 |
| SOC 1 Type II | 財務コントロール監査 | Type II = 一定期間評価 |
| SOC 2 Type II | セキュリティ等監査 | Type II = 一定期間評価 |
| **PCI-DSS** | クレジットカードセキュリティ | 決済情報保護 |
| HITRUST / **HIPAA** | 医療情報保護 | HITRUST経由で取得 |
| ISO/IEC 27001 | 国際情報セキュリティ | ISMS認証 |

- **FedRAMPは「Moderate」レベル**: 問題では「FedRAMP」と略されているが正式には「FedRAMP Moderate」
- **HIPAAはHITRUST経由**: Snowflake自体はHIPAAの直接の認証機関ではなく、HITRUST CSFを通じてHIPAA準拠を実現

## 1-3. 公式ドキュメントURL

- [Snowflake Security Compliance Reports](https://www.snowflake.com/snowflakes-security-compliance-reports/)

---

## 2-1. 問題文（英語）

> Snowflake is compliant with which of the following standards? Select all that apply.
>
> A. HIPAA ✅
> B. FedRAMP ✅
> C. PCI-DSS ✅
> D. IRAP – Protected ✅

## 2-2. 問題文の文法解析

### 文1: "Snowflake is compliant with which of the following standards?"

- **主語 (S)**: Snowflake
- **動詞 (V)**: is
- **補語 (C)**: compliant with which of the following standards
- **文型**: SVC（疑問文）
- **注目ポイント**:
  - **"is compliant with ~"**: 「〜に準拠している」。`compliant`（準拠している・適合している）は形容詞で `be compliant with ~`（〜に準拠する）の形で使われる。`comply with ~`（動詞）の形容詞版。セキュリティ・規制準拠の文脈で頻出
  - **"which of the following standards"**: 疑問詞 `which of the following` が `standards` にかかる。`standard`（標準・規格）は規制・認証基準を指す

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| compliant | 形容詞 | 準拠している・適合している | Snowflake is compliant with HIPAA and PCI-DSS. |
| standard | 名詞 | 標準・規格・基準 | Snowflake meets various security and financial standards. |
| comply with ~ | 動詞句 | 〜に準拠する・〜を遵守する | All data must comply with HIPAA regulations. |

## 2-3. 問題文（日本語）

> Snowflakeは次のうちどの標準に準拠しているか？当てはまるものをすべて選べ。
>
> A. HIPAA ✅
> B. FedRAMP ✅
> C. PCI-DSS ✅
> D. IRAP – Protected ✅

---

## 3-1. 解説文（英語）

> Snowflake is compliant with the following security and financial standards.
>
> · IRAP Protected
> · ITAR
> · FedRAMP Moderate
> · GxP
> · SOC 1 Type II
> · SOC 2 Type II
> · PCI-DSS
> · HITRUST / HIPAA
> · ISO/IEC 27001

## 3-2. 解説文の文法解析

### 文1: "Snowflake is compliant with the following security and financial standards."

- **主語 (S)**: Snowflake
- **動詞 (V)**: is
- **補語 (C)**: compliant with the following security and financial standards
- **文型**: SVC
- **注目ポイント**:
  - **"the following security and financial standards"**: 「次のセキュリティおよび財務基準」。`the following`（以下の）で箇条書きリストを導入する定番表現。`security and financial`（セキュリティと財務）でSnowflakeの準拠分野を2つのカテゴリに分類

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| the following ~ | 限定詞 | 以下の〜・次の〜 | Snowflake complies with the following standards. |
| security and financial standards | 名詞句 | セキュリティおよび財務基準 | PCI-DSS is a financial security standard. |

## 3-3. 解説文（日本語）

> Snowflakeは以下のセキュリティおよび財務基準に準拠しています。
>
> · IRAP Protected（オーストラリア政府セキュリティ）
> · ITAR（米国防衛輸出規制）
> · FedRAMP Moderate（米国連邦政府クラウド認証）
> · GxP（製薬・生命科学品質管理）
> · SOC 1 Type II（財務コントロール監査）
> · SOC 2 Type II（セキュリティ・可用性等監査）
> · PCI-DSS（クレジットカードセキュリティ）
> · HITRUST / HIPAA（医療情報保護）
> · ISO/IEC 27001（情報セキュリティ国際標準）

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
