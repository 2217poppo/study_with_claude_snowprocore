# 031: LOGIN_HISTORY Real-time

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-15
**正答**: INFORMATION_SCHEMA.LOGIN_HISTORY()

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| INFORMATION_SCHEMA.LOGIN_HISTORY() | **全ユーザー**のログイン履歴をリアルタイムで提供するテーブル関数。直近の情報が必要な場合に使用 |
| INFORMATION_SCHEMA.LOGIN_HISTORY_BY_USER() | **単一ユーザー**のログイン履歴のみ提供。全ユーザーの追跡には不適 |
| ACCOUNT_USAGE.LOGIN_HISTORY | ログイン履歴ビュー。365日保持だが**最大3時間の遅延**。直近60分には不適 |

## 1-2. 重要コンセプトまとめ

- 直近60分の全ユーザーログイン履歴 → **INFORMATION_SCHEMA.LOGIN_HISTORY()**
- LOGIN_HISTORY_BY_USER()は単一ユーザー限定 → 全ユーザー追跡には不適
- ACCOUNT_USAGEは3時間遅延 → リアルタイム要件に不適
- 判断基準: **リアルタイム性 + 全ユーザー**

## 1-3. 公式ドキュメントURL

- [Differences Between Account Usage and Information Schema](https://docs.snowflake.com/en/sql-reference/account-usage#differences-between-account-usage-and-information-schema)

---

## 2-1. 問題文（英語）

> As the security administrator, you are required to continuously track a list of all users who logged into the system in the last 60 minutes.
>
> A. Ask Snowflake support.
> B. Use INFORMATION_SCHEMA.LOGIN_HISTORY()
> C. Use INFORMATION_SCHEMA.LOGIN_HISTORY_BY_USER()
> D. Query ACCOUNT_USAGE.LOGIN_HISTORY

## 2-3. 問題文（日本語）

> 過去60分間にログインした全ユーザーを継続的に追跡する方法は？

---

## 3-1. 解説文（英語）

> The views in ACCOUNT_USAGE schema can have up to 3 hours of latency. Since the requirement is to continuously track the login history for the last 60 minutes, you will require near real-time information, which is available through the INFORMATION_SCHEMA table functions. INFORMATION_SCHEMA.LOGIN_HISTORY_BY_USER() is unsuitable because it only provides information for a single user.

## 3-3. 解説文（日本語）

> ACCOUNT_USAGEスキーマのビューは最大3時間の遅延があります。直近60分のログイン履歴を継続的に追跡するにはリアルタイム情報が必要で、INFORMATION_SCHEMAのテーブル関数で取得できます。LOGIN_HISTORY_BY_USER()は単一ユーザー情報のみ提供するため不適です。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
