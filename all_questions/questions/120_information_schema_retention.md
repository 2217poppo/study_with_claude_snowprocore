# 120: INFORMATION_SCHEMA Data Retention Period

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-06
**正答**: 7 days - 6 months
**ユーザー回答**: Forever（不正解）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| INFORMATION_SCHEMA（情報スキーマ） | 各データベース内に自動的に存在するシステムスキーマ。直近のメタデータ・使用状況を保持する。**保持期間は7日〜6ヶ月（ビューによって異なる）**。ほぼリアルタイムで更新される |
| INFORMATION_SCHEMA 保持期間の内訳 | **標準**: 14日間（最も多いパターン）/ **特定ビュー（最短）**: 7日間 / **使用履歴ビュー（最長）**: 最大6ヶ月 |
| ACCOUNT_USAGE スキーマ（比較用） | アカウント全体の使用状況を**365日間**保持するシステムスキーマ。最大3時間のラグあり。削除済みオブジェクトも含む |
| Usage History Views（使用履歴ビュー） | INFORMATION_SCHEMA内の使用状況を記録するビュー群（例: QUERY_HISTORY, WAREHOUSE_METERING_HISTORY）。最大6ヶ月の保持期間を持つ |
| Data Retention（データ保持期間） | システムがデータを保持し続ける期間。INFORMATION_SCHEMAでは7日〜6ヶ月、ACCOUNT_USAGEでは365日 |

## 1-2. 重要コンセプトまとめ

- **正解: 7 days - 6 months**（ビューによって異なる範囲）
- **ユーザーの誤り**: "Forever"（無期限）→ INFORMATION_SCHEMAは有限の保持期間を持つ
- **INFORMATION_SCHEMA の保持期間の詳細**:

| ビューの種類 | 保持期間 |
|-------------|---------|
| 特定のビュー（最短） | **7日** |
| 一般的なビュー（標準） | **14日** |
| 使用履歴ビュー（最長） | **最大6ヶ月** |

- **INFORMATION_SCHEMA vs ACCOUNT_USAGE 比較**:

| 特性 | INFORMATION_SCHEMA | ACCOUNT_USAGE |
|------|-------------------|---------------|
| 保持期間 | **7日〜6ヶ月** | **365日** |
| 更新頻度 | ほぼリアルタイム | 最大3時間のラグ |
| 削除済みオブジェクト | **含まない** | **含む** |
| 用途 | 直近の情報を確認 | 長期の使用履歴分析 |

- **試験のポイント**:
  - INFORMATION_SCHEMAは「365日」でも「Forever」でもない — 最大6ヶ月
  - 「7日〜6ヶ月」という範囲で答える — ビューによって異なることを理解する
  - 「直近の情報確認 → INFORMATION_SCHEMA」「長期履歴分析 → ACCOUNT_USAGE」で使い分ける

## 1-3. 公式ドキュメントURL

- [Differences Between Account Usage and Information Schema](https://docs.snowflake.com/en/sql-reference/account-usage#differences-between-account-usage-and-information-schema)

---

## 2-1. 問題文（英語）

> The usage data provided through the INFORMATION SCHEMA has a retention of how many days?
>
> A. 365 days
> B. 128 days
> C. Forever
> D. 7 days - 6 months ✅

## 2-2. 問題文の文法解析

### 文1: "The usage data provided through the INFORMATION SCHEMA has a retention of how many days?"

- **主語 (S)**: The usage data provided through the INFORMATION SCHEMA
- **動詞 (V)**: has
- **目的語 (O)**: a retention of how many days
- **文型**: SVO（埋め込み疑問文）
- **注目ポイント**:
  - **"provided through the INFORMATION SCHEMA"**: 「INFORMATION SCHEMAを通じて提供される」。`provided through ~`（〜を通じて提供される）は過去分詞の後置修飾で、`usage data`（使用状況データ）を限定する
  - **"has a retention of how many days"**: 「何日間の保持期間を持つか」。`retention`（保持期間）は「データが保持される日数」。`a retention of ~`（〜の保持期間）という名詞句。`how many days`（何日）が埋め込み疑問詞として `of` の後に置かれる
  - **"usage data"**: 「使用状況データ・使用データ」。`usage`（使用・利用）は名詞の形容詞的用法で `data`（データ）を修飾

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| retention | 名詞 | 保持（期間）・データ保存期間 | INFORMATION_SCHEMA has a retention of 7 days to 6 months. |
| usage data | 名詞句 | 使用状況データ・利用データ | Usage data is available through INFORMATION_SCHEMA views. |
| provided through ~ | 分詞句 | 〜を通じて提供される | Data provided through INFORMATION_SCHEMA has shorter retention. |

## 2-3. 問題文（日本語）

> INFORMATION SCHEMAを通じて提供される使用データの保持期間は何日か？
>
> A. 365日
> B. 128日
> C. 無期限（Forever）
> D. 7日〜6ヶ月 ✅

---

## 3-1. 解説文（英語）

> The data in the INFORMATION_SCHEMA views is retained for a shorter period. Typical data retention in INFORMATION SCHEMA is 14 days but can be seven days for specific views and up to 6 months for usage history views. Thus, these views have retention ranging from 7 days to a maximum of 6 months, depending on the view. So typically, the views in the INFORMATION SCHEMA can be used to find more recent information.

## 3-2. 解説文の文法解析

### 文1: "The data in the INFORMATION_SCHEMA views is retained for a shorter period."

- **主語 (S)**: The data in the INFORMATION_SCHEMA views
- **動詞 (V)**: is retained（受動態）
- **修飾語 (M)**: for a shorter period
- **文型**: SV（受動態）
- **注目ポイント**:
  - **"is retained for a shorter period"**: 「より短い期間保持される」。`retained`（保持される）はデータが削除されずに残ることを示す受動態。`a shorter period`（より短い期間）は「ACCOUNT_USAGE（365日）と比較して短い」を暗示する比較級

### 文2: "Typical data retention in INFORMATION SCHEMA is 14 days but can be seven days for specific views and up to 6 months for usage history views."

- **主語 (S)**: Typical data retention in INFORMATION SCHEMA
- **動詞 (V1)**: is
- **補語 (C1)**: 14 days
- **接続**: but
- **動詞 (V2)**: can be
- **補語 (C2)**: seven days for specific views / up to 6 months for usage history views
- **文型**: SVC（並列）
- **注目ポイント**:
  - **"Typical"**: 「典型的な・標準的な」。`typical`（一般的・代表的）は「多くの場合は14日だが、例外がある」を示す。試験では典型値と例外値の両方が問われる
  - **"but can be"**: 「しかし〜になりえる」。`but`（しかし）で例外を導き、`can be`（〜でありうる）で幅のある範囲を示す
  - **"up to 6 months"**: 「最大6ヶ月まで」。`up to ~`（〜まで・最大〜）で上限を示す。使用履歴ビューが最長6ヶ月保持される

### 文3: "Thus, these views have retention ranging from 7 days to a maximum of 6 months, depending on the view."

- **主語 (S)**: these views
- **動詞 (V)**: have
- **目的語 (O)**: retention ranging from 7 days to a maximum of 6 months
- **修飾語 (M)**: depending on the view
- **文型**: SVO
- **注目ポイント**:
  - **"ranging from ~ to ~"**: 「〜から〜にわたる・〜から〜の範囲の」。`range from A to B`（AからBの範囲にわたる）の現在分詞形で `retention`（保持期間）を後置修飾。範囲・幅を示す際の定番表現
  - **"depending on the view"**: 「ビューによって異なる」。`depending on ~`（〜によって）は分詞構文で「〜に依存して・〜に応じて」を示す。Q046でも登場した表現

### 文4: "So typically, the views in the INFORMATION SCHEMA can be used to find more recent information."

- **主語 (S)**: the views in the INFORMATION SCHEMA
- **動詞 (V)**: can be used（受動態）
- **目的（to不定詞）**: to find more recent information
- **文型**: SV（受動態）
- **注目ポイント**:
  - **"can be used to find ~"**: 「〜を見つけるために使用することができる」。受動態の可能 `can be used to do`（〜するために使うことができる）で「用途・活用方法」を述べる
  - **"more recent information"**: 「より直近の情報」。`more recent`（より最近の）は「ACCOUNT_USAGE（最大3時間遅延あり）と比較してリアルタイムに近い」を示す比較級

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| retained | 動詞（受動態） | 保持される・保存される | Data is retained for 14 days by default in INFORMATION_SCHEMA. |
| typical | 形容詞 | 典型的な・標準的な | Typical retention is 14 days, but specific views differ. |
| ranging from ~ to ~ | 分詞句 | 〜から〜の範囲にわたる | Retention ranging from 7 days to 6 months. |
| up to ~ | 前置詞句 | 最大〜まで・〜を上限に | Retention can be up to 6 months for usage history views. |

## 3-3. 解説文（日本語）

> INFORMATION_SCHEMAビュー内のデータは、より短い期間保持されます。INFORMATION SCHEMAの一般的なデータ保持期間は14日間ですが、特定のビューでは7日間、使用履歴ビューでは最大6ヶ月になることもあります。したがって、これらのビューはビューによって7日間から最大6ヶ月の保持期間を持ちます。そのため、INFORMATION SCHEMAのビューは一般的に、より直近の情報を見つけるために使用できます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
