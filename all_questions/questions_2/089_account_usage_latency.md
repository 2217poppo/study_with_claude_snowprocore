# 089: ACCOUNT_USAGE Latency

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-14
**正答**: False

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| ACCOUNT_USAGE | アカウント全体の使用状況を365日間保持するスキーマ。**リアルタイムではなく45分〜3時間の遅延**あり |
| INFORMATION_SCHEMA | DB内オブジェクト情報を提供。**ほぼリアルタイム**更新。保持期間7日〜6ヶ月 |

## 1-2. 重要コンセプトまとめ

- ACCOUNT_USAGEは **リアルタイムではない** → 5分前の使用履歴にはアクセスできない（False）
- 遅延: **45分〜3時間**（ビューにより異なる）
- INFORMATION_SCHEMA vs ACCOUNT_USAGE の遅延比較:

| 特性 | INFORMATION_SCHEMA | ACCOUNT_USAGE |
|------|-------------------|---------------|
| 遅延 | ほぼリアルタイム | 45分〜3時間 |
| 保持期間 | 7日〜6ヶ月 | 365日 |

- 「5分前のデータにアクセスできるか」→ ACCOUNT_USAGEでは**不可能**

## 1-3. 公式ドキュメントURL

- [Differences Between Account Usage and Information Schema](https://docs.snowflake.com/en/sql-reference/account-usage#differences-between-account-usage-and-information-schema)

---

## 2-1. 問題文（英語）

> True or False: Using the views in the ACCOUNT_USAGE schema, you can access the history of usage that occurred 5 minutes ago.
>
> A. True
> B. False

## 2-2. 問題文の文法解析

### 文1: "Using the views in the ACCOUNT_USAGE schema, you can access the history of usage that occurred 5 minutes ago."

- **主語 (S)**: you
- **動詞 (V)**: can access
- **目的語 (O)**: the history of usage that occurred 5 minutes ago
- **修飾語 (M)**: Using the views in the ACCOUNT_USAGE schema（手段）
- **文型**: SVO
- **注目ポイント**: `that occurred 5 minutes ago` が関係詞節。5分前のデータはACCOUNT_USAGEの遅延（45分〜3時間）に該当するためアクセス不可。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| occurred ~ ago | phrase | ～前に発生した | Usage that occurred 5 minutes ago. |
| refreshes with a lag of ~ | phrase | ～の遅延で更新される | Refreshes with a lag of 45 minutes. |
| NOT real-time | phrase | リアルタイムではない | Data is NOT real-time. |

## 2-3. 問題文（日本語）

> 真/偽: ACCOUNT_USAGEスキーマのビューを使用して、5分前に発生した使用履歴にアクセスできる。

---

## 3-1. 解説文（英語）

> The ACCOUNT USAGE schema consists of several views that provide usage metrics and metadata information at the account level. Data provided by the ACCOUNT_USAGE views is NOT real-time and refreshes typically with a lag of 45 minutes to 3 hours, depending on the view. The data in these views are retained for up to 365 days.

## 3-2. 解説文の文法解析

### 文1: "Data provided by the ACCOUNT_USAGE views is NOT real-time and refreshes typically with a lag of 45 minutes to 3 hours, depending on the view."

- **主語 (S)**: Data provided by the ACCOUNT_USAGE views
- **動詞 (V)**: is / refreshes（並列）
- **補語/修飾語**: NOT real-time / with a lag of 45 minutes to 3 hours
- **文型**: SVC + SV
- **注目ポイント**: `NOT` が大文字で強調。`with a lag of ~` で遅延を明示。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| consists of ~ | phrase | ～で構成される | Consists of several views. |
| with a lag of ~ | phrase | ～の遅延で | With a lag of 45 minutes to 3 hours. |
| retained for up to ~ | phrase | 最大～保持される | Retained for up to 365 days. |

## 3-3. 解説文（日本語）

> ACCOUNT USAGEスキーマは、アカウントレベルの使用指標とメタデータ情報を提供する複数のビューで構成されます。ACCOUNT_USAGEビューが提供するデータはリアルタイムではなく、ビューによって通常45分〜3時間の遅延で更新されます。これらのビューのデータは最大365日間保持されます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
