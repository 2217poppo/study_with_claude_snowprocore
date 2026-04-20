# 051: INFORMATION_SCHEMA Retention

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-13
**正答**: 7 days - 6 months

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| INFORMATION_SCHEMA | 各データベース内に自動的に存在するシステムスキーマ。ビューやテーブル関数でメタデータを提供。ほぼリアルタイム更新 |
| ACCOUNT_USAGE | SNOWFLAKE共有データベース内のスキーマ。アカウント全体の使用状況を365日間保持。45分〜3時間の遅延あり |
| Data Retention（データ保持期間） | ビューがデータを保持する期間。INFORMATION_SCHEMAはビューにより7日〜6ヶ月で異なる |
| Usage History Views | INFORMATION_SCHEMA内の使用履歴ビュー。最大6ヶ月の保持期間を持つ |

## 1-2. 重要コンセプトまとめ

- INFORMATION_SCHEMAの保持期間は**ビューによって異なる**:
  - **最短7日**: 特定のビュー
  - **標準14日**: 典型的な保持期間
  - **最長6ヶ月**: Usage History系ビュー
- 正解は「7 days - 6 months」（範囲で答える）
- INFORMATION_SCHEMA vs ACCOUNT_USAGE の比較（超重要）:

| 特性 | INFORMATION_SCHEMA | ACCOUNT_USAGE |
|------|-------------------|---------------|
| 保持期間 | 7日〜6ヶ月 | 365日 |
| 遅延 | ほぼリアルタイム | 45分〜3時間 |
| 削除済みオブジェクト | 含まない | **含む** |
| スコープ | データベース単位 | アカウント全体 |

- 「365 days」はACCOUNT_USAGEの保持期間であり、INFORMATION_SCHEMAではない
- 「7 days」だけでは不十分（Usage Historyビューは6ヶ月まで保持する）

## 1-3. 公式ドキュメントURL

- [Differences Between Account Usage and Information Schema](https://docs.snowflake.com/en/sql-reference/account-usage#differences-between-account-usage-and-information-schema)

---

## 2-1. 問題文（英語）

> How many days of historical data can you access through the views in the INFORMATION_SCHEMA schema?
>
> A. 365 days
> B. 7 days - 6 months
> C. 1 day
> D. 7 days

## 2-2. 問題文の文法解析

### 文1: "How many days of historical data can you access through the views in the INFORMATION_SCHEMA schema?"

- **主語 (S)**: you
- **動詞 (V)**: can access
- **目的語 (O)**: How many days of historical data
- **修飾語 (M)**: through the views in the INFORMATION_SCHEMA schema（手段）
- **文型**: SVO（疑問文）
- **注目ポイント**: `How many days of ~` で期間を問う。`through the views` で「ビューを通じて」。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| historical data | noun | 履歴データ | Access historical data through views. |
| retention | noun | 保持（期間） | Data retention varies by view. |
| typical | adjective | 典型的な | Typical retention is 14 days. |

## 2-3. 問題文（日本語）

> INFORMATION_SCHEMAスキーマのビューを通じて、何日分の履歴データにアクセスできますか？
>
> A. 365日
> B. 7日〜6ヶ月
> C. 1日
> D. 7日

---

## 3-1. 解説文（英語）

> The data in the INFORMATION_SCHEMA views is retained for a shorter period. Typical data retention in INFORMATION SCHEMA is 14 days but can be seven days for specific views and up to 6 months for usage history views. Thus, these views have retention ranging from 7 days to a maximum of 6 months, depending on the view. So typically, the views in the INFORMATION SCHEMA can be used to find more recent information.

## 3-2. 解説文の文法解析

### 文1: "The data in the INFORMATION_SCHEMA views is retained for a shorter period."

- **主語 (S)**: The data in the INFORMATION_SCHEMA views
- **動詞 (V)**: is retained（受動態）
- **修飾語 (M)**: for a shorter period（期間）
- **文型**: SV（受動態）
- **注目ポイント**: `is retained for ~` で「～の間保持される」。`shorter` は ACCOUNT_USAGE(365日)との暗黙の比較。

### 文2: "Typical data retention in INFORMATION SCHEMA is 14 days but can be seven days for specific views and up to 6 months for usage history views."

- **主語 (S)**: Typical data retention
- **動詞 (V)**: is / can be（並列）
- **補語 (C)**: 14 days / seven days / up to 6 months
- **文型**: SVC
- **注目ポイント**: 3つの保持期間（14日・7日・6ヶ月）を1文で提示。`but can be ~` で例外を示す。

### 文3: "Thus, these views have retention ranging from 7 days to a maximum of 6 months, depending on the view."

- **主語 (S)**: these views
- **動詞 (V)**: have
- **目的語 (O)**: retention ranging from 7 days to a maximum of 6 months
- **修飾語 (M)**: Thus（結論）、depending on the view（条件）
- **文型**: SVO
- **注目ポイント**: `ranging from ~ to ~` で範囲を示す。`depending on ~` は「～に依存して」。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| retain | verb | 保持する | Data is retained for a shorter period. |
| ranging from ~ to ~ | phrase | ～から～の範囲 | Retention ranging from 7 days to 6 months. |
| depending on ~ | phrase | ～に依存して | Depending on the specific view. |
| recent | adjective | 最近の | Used to find more recent information. |

## 3-3. 解説文（日本語）

> INFORMATION_SCHEMAビューのデータは、より短い期間保持されます。INFORMATION SCHEMAの典型的なデータ保持期間は14日ですが、特定のビューでは7日、使用履歴ビューでは最大6ヶ月になることがあります。したがって、これらのビューの保持期間はビューによって7日から最大6ヶ月の範囲です。つまり、INFORMATION SCHEMAのビューは、より最近の情報を検索するために使用できます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
