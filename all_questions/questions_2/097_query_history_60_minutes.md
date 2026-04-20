# 097: Query History 60 Minutes

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-14
**正答**: C, D

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| INFORMATION_SCHEMA.QUERY_HISTORY | クエリ履歴のテーブル関数。**ほぼリアルタイム**で遅延なし。直近のクエリ履歴に最適 |
| ACCOUNT_USAGE.QUERY_HISTORY | クエリ履歴ビュー。365日保持だが**最大3時間の遅延**あり。直近60分には不適 |
| Query History Page | Snowsightのクエリ履歴ページ。**過去14日間**のクエリを表示。リアルタイム |

## 1-2. 重要コンセプトまとめ

- 直近60分のクエリ履歴 → **リアルタイム性が必要**:
  - **INFORMATION_SCHEMA.QUERY_HISTORY** ✅（遅延なし）
  - **Query History Page（Snowsight）** ✅（リアルタイム、14日間）
  - ACCOUNT_USAGE.QUERY_HISTORY ❌（最大3時間遅延 → 60分前のデータは取得できない可能性）
- 「直近のデータ」→ INFORMATION_SCHEMA or Snowsight
- 「長期のデータ」→ ACCOUNT_USAGE（365日）

## 1-3. 公式ドキュメントURL

- [QUERY_HISTORY (INFORMATION_SCHEMA)](https://docs.snowflake.com/en/sql-reference/functions/query_history)

---

## 2-1. 問題文（英語）

> You need to see the history of all queries executed in the last 60 minutes. Which of the following method should you use?
>
> A. Request Snowflake support to provide query history
> B. Use the QUERY_HISTORY view in the ACCOUNT_USAGE schema
> C. View the historical queries using the query history page
> D. Use the QUERY_HISTORY table function in the INFORMATION schema

## 2-2. 問題文の文法解析

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| up-to-date | adjective | 最新の | Provides up-to-date information. |
| without latency | phrase | 遅延なしで | Information without latency. |
| suitable for ~ | phrase | ～に適した | Not suitable for the last 60 minutes. |

## 2-3. 問題文（日本語）

> 過去60分間に実行されたすべてのクエリの履歴を見る必要があります。どの方法を使用すべきですか？

---

## 3-1. 解説文（英語）

> The QUERY_HISTORY table function in the INFORMATION schema provides up-to-date information without latency. The QUERY_HISTORY view in ACCOUNT_USAGE schema can have 3 hours of latency, so it will not be suitable for viewing the last 60 minutes of query history. The query history page can also be used to view the history of executed queries with-in the last 14 days.

## 3-3. 解説文（日本語）

> INFORMATIONスキーマのQUERY_HISTORYテーブル関数は、遅延なしで最新の情報を提供します。ACCOUNT_USAGEスキーマのQUERY_HISTORYビューは最大3時間の遅延がある可能性があるため、直近60分のクエリ履歴の表示には適しません。クエリ履歴ページも過去14日間の実行済みクエリの履歴表示に使用できます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
