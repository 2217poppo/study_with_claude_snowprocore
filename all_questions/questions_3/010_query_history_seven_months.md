# 010: Query History Seven Months

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-15
**正答**: ACCOUNT_USAGE.QUERY_HISTORY

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| ACCOUNT_USAGE.QUERY_HISTORY | クエリ履歴を**365日間**保持するビュー。45分〜3時間の遅延。7ヶ月前のデータにアクセス可能 |
| INFORMATION_SCHEMA QUERY_HISTORY | クエリ履歴のテーブル関数。**7日間**のみ。リアルタイム |
| Query History Page | SnowsightのUI。**14日間**のみ |

## 1-2. 重要コンセプトまとめ

- 7ヶ月前のクエリ履歴 → **ACCOUNT_USAGE.QUERY_HISTORY**（365日保持）が唯一の選択肢
- 保持期間の比較:

| 方法 | 保持期間 | 遅延 |
|------|---------|------|
| ACCOUNT_USAGE | **365日** | 45分〜3時間 |
| INFORMATION_SCHEMA | 7日 | リアルタイム |
| Query History Page | 14日 | リアルタイム |

## 1-3. 公式ドキュメントURL

- [Differences Between Account Usage and Information Schema](https://docs.snowflake.com/en/sql-reference/account-usage#differences-between-account-usage-and-information-schema)

---

## 2-1. 問題文（英語）

> You are required to see the query history for a date seven months ago. Which of the following methods will provide you with the query history for seven months ago?
>
> A. Use the QUERY_HISTORY table function in the INFORMATION schema
> B. Request Snowflake support to provide query history
> C. Use the QUERY_HISTORY view in the ACCOUNT_USAGE schema
> D. View the historical queries using the query history page

## 2-3. 問題文（日本語）

> 7ヶ月前のクエリ履歴を見る必要があります。どの方法で取得できますか？

---

## 3-1. 解説文（英語）

> The views in the ACCOUNT_USAGE schema provide up to 365 days of history for various information. The history of queries from 7 months ago can only be retrieved using the QUERY_HISTORY view in the ACCOUNT_USAGE schema. The QUERY HISTORY table function in the INFORMATION schema can only provide seven days of history. The query history page can only show the history of executed queries within the last 14 days.

## 3-3. 解説文（日本語）

> ACCOUNT_USAGEスキーマのビューは最大365日間の履歴を提供します。7ヶ月前のクエリ履歴はACCOUNT_USAGEのQUERY_HISTORYビューでのみ取得可能です。INFORMATIONスキーマのQUERY_HISTORYテーブル関数は7日間のみ。クエリ履歴ページは過去14日間のみ表示可能です。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
