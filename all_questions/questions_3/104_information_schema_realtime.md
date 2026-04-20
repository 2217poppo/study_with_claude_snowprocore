# 104: INFORMATION_SCHEMA — Real-time Login Monitoring

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-17
**正答**: D（Use the table functions provided in the INFORMATION_SCHEMA schema）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| INFORMATION_SCHEMA | データベースおよびアカウントレベルのメタデータをほぼリアルタイムで提供するSnowflakeのスキーマ。遅延がほぼない |
| ACCOUNT_USAGE | アカウント全体の履歴データを提供するスキーマ。最大1〜2時間の遅延がある。最大365日間の履歴を保持 |
| Table Function | テーブルを返す関数。INFORMATION_SCHEMAでは `LOGIN_HISTORY()` などのテーブル関数でリアルタイムデータを取得できる |
| LOGIN_HISTORY() | ユーザーのログイン履歴を返すINFORMATION_SCHEMAのテーブル関数。直近8時間〜7日間のデータを取得できる |
| Latency | データが実際の状態を反映するまでの遅延時間。ACCOUNT_USAGEは1〜2時間、INFORMATION_SCHEMAはほぼゼロ |

## 1-2. 重要コンセプトまとめ

- **直近15分のデータが必要 → INFORMATION_SCHEMA（遅延なし）**
  - ACCOUNT_USAGEには1〜2時間の遅延があるため、直近15分のログインは確認できない
- **INFORMATION_SCHEMAはテーブル関数を使用**
  - `TABLE(INFORMATION_SCHEMA.LOGIN_HISTORY(...))` の形式で取得
  - VIEW（ビュー）ではなく TABLE FUNCTION（テーブル関数）であることに注意
- **ACCOUNT_USAGEは長期履歴・分析向け**
  - 最大365日の履歴、1〜2時間の遅延。長期的なトレンド分析に適している
- **クラウドプロバイダーログやシステムログは使わない**
  - Snowflakeのネイティブ機能でログイン履歴を管理できる

## 1-3. 公式ドキュメントURL

- [Differences between Account Usage and Information Schema](https://docs.snowflake.com/en/sql-reference/account-usage#differences-between-account-usage-and-information-schema)
- [LOGIN_HISTORY Table Function](https://docs.snowflake.com/en/sql-reference/functions/login_history)

---

## 2-1. 問題文（英語）

> As an administrator, you are required to find all users that logged in to the system during the past 15 minutes. Which of the following options should you use?
>
> A. Use the views in the ACCOUNT_USAGE schema
> B. Analyze the system logs to find out who logged in
> C. Use cloud provider logs to ascertain the users that recently logged in
> D. Use the table functions provided in the INFORMATION_SCHEMA schema

## 2-2. 問題文の文法解析

### 文1: "As an administrator, you are required to find all users that logged in to the system during the past 15 minutes."

- **修飾語 (M)**: As an administrator（役割を示す副詞句）
- **主語 (S)**: you
- **動詞 (V)**: are required to find（受動態 + 不定詞）
- **目的語 (O)**: all users that logged in to the system during the past 15 minutes
- **関係詞節**: that logged in to the system during the past 15 minutes
- **注目ポイント**: 
  - `be required to ~` = 〜することが求められている（義務の受動態）
  - `during the past 15 minutes` = 過去15分間で

### 選択肢Cの文法: "Use cloud provider logs to ascertain the users that recently logged in"

- **動詞 (V)**: Use（命令文）
- **不定詞**: to ascertain the users（目的）
- **注目ポイント**: `ascertain` = 確かめる、確認する（やや formal な語彙）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| administrator | 名詞 | 管理者 | As an administrator, you have access to login history. |
| require | 動詞 | 要求する、必要とする | You are required to monitor user access. |
| ascertain | 動詞 | 確かめる、確認する | Use the logs to ascertain who logged in recently. |
| near real-time | 形容詞句 | ほぼリアルタイム | INFORMATION_SCHEMA provides near real-time information. |
| log in | 動詞句 | ログインする | Find all users that logged in during the past 15 minutes. |

## 2-3. 問題文（日本語）

> あなたは管理者として、過去15分間にシステムにログインしたすべてのユーザーを特定することを求められています。次のどのオプションを使用すべきですか？
>
> A. ACCOUNT_USAGEスキーマのビューを使用する
> B. システムログを分析してログインしたユーザーを確認する
> C. クラウドプロバイダーのログを使用して最近ログインしたユーザーを確認する
> D. INFORMATION_SCHEMAスキーマが提供するテーブル関数を使用する

---

## 3-1. 解説文（英語）

> Because there is a requirement to see the logins from the last 15 minutes, you must use the INFORMATION_SCHEMA, since it contains near real-time information. https://docs.snowflake.com/en/sql-reference/account-usage#differences-between-account-usage-and-information-schema

## 3-2. 解説文の文法解析

### 文1: "Because there is a requirement to see the logins from the last 15 minutes, you must use the INFORMATION_SCHEMA, since it contains near real-time information."

- **理由節1**: Because there is a requirement to see the logins from the last 15 minutes
- **主節**: you must use the INFORMATION_SCHEMA
- **理由節2**: since it contains near real-time information
- **注目ポイント**: 
  - `there is a requirement to ~` = 〜するという要件がある（形式主語 there）
  - 理由を示す接続詞が2つ: `Because`（文頭）と `since`（後半）
  - `near real-time` = ほぼリアルタイム（「ほぼ」という nuance が重要）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| requirement | 名詞 | 要件、必要条件 | There is a requirement to monitor logins in real-time. |
| near real-time | 形容詞句 | ほぼリアルタイム | INFORMATION_SCHEMA provides near real-time information. |
| since | 接続詞 | 〜なので（理由） | Use INFORMATION_SCHEMA since it has no latency. |
| contain | 動詞 | 含む | The schema contains up-to-date login information. |

## 3-3. 解説文（日本語）

> 過去15分間のログインを確認するという要件があるため、ほぼリアルタイムの情報を含むINFORMATION_SCHEMAを使用する必要があります。

---

## 復習メモ

- [ ] INFORMATION_SCHEMA（遅延なし）とACCOUNT_USAGE（1〜2時間遅延）の違いを理解した
- [ ] INFORMATION_SCHEMAはビューではなくテーブル関数を提供することを把握した
- [ ] `be required to`（義務の受動態）と `since`（理由の接続詞）を確認した
