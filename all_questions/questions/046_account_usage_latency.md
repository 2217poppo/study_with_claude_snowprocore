# 046: ACCOUNT_USAGE Schema — Data Latency (45 min to 3 hours)

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-03
**正答**: True（最大3時間のレイテンシがある）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| ACCOUNT_USAGE スキーマ | アカウントレベルの使用状況・メタデータ情報を提供する複数のビューで構成されるシステムスキーマ。データは最大365日間保持されるが、リアルタイムではなく45分〜最大3時間のラグがある |
| Latency（レイテンシ／遅延） | データが実際に更新されてからACCOUNT_USAGEビューに反映されるまでの時間差。ビューによって異なり、45分〜3時間程度 |
| Usage Metrics（使用状況メトリクス） | クレジット消費量・クエリ実行回数・ストレージ使用量など、アカウントの使用状況に関する指標 |
| INFORMATION_SCHEMA | 各データベース内のメタデータ・履歴をほぼリアルタイムで参照できるシステムスキーマ。ACCOUNT_USAGEより新しいデータを返すが保持期間は7〜14日と短い |

## 1-2. 重要コンセプトまとめ

- **ACCOUNT_USAGEのレイテンシ: 45分〜最大3時間**（ビューによって異なる）
- **リアルタイムではない**: 最新の操作がすぐには反映されない
- **データ保持期間: 最大365日**

- **ACCOUNT_USAGE vs INFORMATION_SCHEMAの比較（試験頻出）**:

  | 項目 | ACCOUNT_USAGE | INFORMATION_SCHEMA |
  |------|--------------|-------------------|
  | **レイテンシ** | **45分〜3時間** | ほぼリアルタイム |
  | **保持期間** | **最大365日** | 7〜14日 |
  | **スコープ** | アカウント全体 | 各データベース内 |

- **「最大3時間」の引っかけ**: 「3時間もラグがある」= True。リアルタイムと思い込んでいるとFalseを選んでしまう
- **試験ポイント**: ACCOUNT_USAGEの数字（45分〜3時間 / 365日）を確実に覚える

## 1-3. 公式ドキュメントURL

- [ACCOUNT_USAGE vs INFORMATION_SCHEMA](https://docs.snowflake.com/en/sql-reference/account-usage#differences-between-account-usage-and-information-schema)

---

## 2-1. 問題文（英語）

> True or False: The data in the views in the ACCOUNT_USAGE schema can have a latency of up to 3 hours.
>
> A. True
> B. False

## 2-2. 問題文の文法解析

### 文1: "The data in the views in the ACCOUNT_USAGE schema can have a latency of up to 3 hours."

- **主語 (S)**: The data in the views in the ACCOUNT_USAGE schema（ACCOUNT_USAGEスキーマのビューにあるデータは）
- **動詞 (V)**: can have（持つ可能性がある）← 可能性の `can`
- **目的語 (O)**: a latency of up to 3 hours（最大3時間のレイテンシを）
- **注目ポイント**:
  - `can have ~` = 「〜を持つ可能性がある」。確定ではなく「最大で〜になりうる」という上限を示す
  - `up to 3 hours` = 「最大3時間まで」。下限（45分）は問題文には示されていないが解説に記載

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| latency | 名詞 | レイテンシ、遅延、ラグ | ACCOUNT_USAGE views have a latency of up to 3 hours. |
| up to ~ | 前置詞句 | 最大〜まで（上限） | Data can have a latency of up to 3 hours. |
| schema | 名詞 | スキーマ（データベース内のオブジェクトのコンテナ） | ACCOUNT_USAGE is a shared schema in the Snowflake database. |

## 2-3. 問題文（日本語）

> 正誤問題: ACCOUNT_USAGEスキーマのビューのデータには、最大3時間のレイテンシが生じる可能性がある。
>
> A. 正しい（True）
> B. 誤り（False）

---

## 3-1. 解説文（英語）

> The ACCOUNT USAGE schema consists of several views that provide usage metrics and metadata information at the account level. Data provided by the ACCOUNT_USAGE views is NOT real-time and refreshes typically with a lag of 45 minutes to 3 hours, depending on the view. The data in these views are retained for up to 365 days.

## 3-2. 解説文の文法解析

### 文1: "The ACCOUNT USAGE schema consists of several views that provide usage metrics and metadata information at the account level."

- **主語 (S)**: The ACCOUNT USAGE schema
- **動詞 (V)**: consists of（〜から構成される）
- **目的語**: several views（複数のビュー）
- **修飾語 (M)**: that provide usage metrics and metadata information at the account level（アカウントレベルの使用状況メトリクスとメタデータ情報を提供する）← 関係代名詞節
- **注目ポイント**: `consist of ~` の再確認。複数の構成要素を列挙する定番表現

### 文2: "Data provided by the ACCOUNT_USAGE views is NOT real-time and refreshes typically with a lag of 45 minutes to 3 hours, depending on the view."

- **主語 (S)**: Data provided by the ACCOUNT_USAGE views（ACCOUNT_USAGEビューが提供するデータは）← 過去分詞後置修飾
- **動詞 (V1)**: is NOT real-time（リアルタイムではない）← 否定の強調（大文字NOT）
- **動詞 (V2)**: refreshes（更新される）
- **修飾語 (M1)**: typically（通常）
- **修飾語 (M2)**: with a lag of 45 minutes to 3 hours（45分〜3時間のラグで）
- **修飾語 (M3)**: depending on the view（ビューによって異なる）← 分詞構文
- **注目ポイント**:
  - `NOT`（大文字）= 重要な否定の強調。「リアルタイムではない」は設計上の重要な制約
  - `with a lag of ~` = 「〜のラグ/遅延で」。遅延量を示す前置詞句
  - `depending on ~` = 「〜によって異なる」。条件によって値が変わることを示す分詞構文

### 文3: "The data in these views are retained for up to 365 days."

- **主語 (S)**: The data in these views（これらのビューのデータは）
- **動詞 (V)**: are retained（保持される）← 受動態
- **修飾語 (M)**: for up to 365 days（最大365日間）
- **注目ポイント**: `be retained for ~` = 「〜の間保持される」。データの保存期間を示す受動態の定番表現

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| real-time | 形容詞/副詞 | リアルタイム（即時反映） | ACCOUNT_USAGE data is NOT real-time. |
| refresh | 動詞 | 更新される、再読み込みされる | The view refreshes with a lag of up to 3 hours. |
| lag | 名詞 | 遅延、ラグ | There is a lag of 45 minutes to 3 hours. |
| depending on ~ | 分詞構文 | 〜によって異なる | The latency varies, depending on the view. |
| be retained for ~ | 熟語 | 〜の間保持される | Data is retained for up to 365 days. |

## 3-3. 解説文（日本語）

> ACCOUNT_USAGEスキーマはアカウントレベルの使用状況メトリクスとメタデータ情報を提供する複数のビューで構成されています。ACCOUNT_USAGEビューが提供するデータはリアルタイムではなく、ビューによって異なりますが、通常45分〜3時間のラグで更新されます。これらのビューのデータは最大365日間保持されます。

---

## 復習メモ

- [ ] ACCOUNT_USAGEのレイテンシ（45分〜最大3時間）を覚えた
- [ ] ACCOUNT_USAGE vs INFORMATION_SCHEMAの比較表を暗記した
- [ ] 「NOT real-time」という設計上の重要な制約を確認した
- [ ] 英語の文法ポイント（with a lag of / depending on / be retained for）を確認した
- [ ] この問題は理論問題のためサンドボックス検証は不要
