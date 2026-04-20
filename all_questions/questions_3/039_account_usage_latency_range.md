# 039: ACCOUNT_USAGE Latency Range

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-15
**正答**: 45 mins to 3 hours

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| ACCOUNT_USAGE Latency | ACCOUNT_USAGEビューのデータ遅延。**45分〜3時間**（ビューにより異なる）。365日保持 |

## 1-2. 重要コンセプトまとめ

- ACCOUNT_USAGEの遅延 = **45分〜3時間**
- リアルタイムではない
- 365日間データ保持
- INFORMATION_SCHEMA = リアルタイム（遅延なし）との対比が頻出

## 1-3. 公式ドキュメントURL

- [Differences Between Account Usage and Information Schema](https://docs.snowflake.com/en/sql-reference/account-usage#differences-between-account-usage-and-information-schema)

---

## 2-1. 問題文（英語）

> What is the range of latency of data in the ACCOUNT_USAGE schema?
>
> A. No latency
> B. 45 mins to 3 hours
> C. 5 - 10 days
> D. 5 - 10 mins

## 2-3. 問題文（日本語）

> ACCOUNT_USAGEスキーマのデータ遅延の範囲は？

---

## 3-1. 解説文（英語）

> Data provided by the ACCOUNT_USAGE views is NOT real-time and refreshes typically with a lag of 45 minutes to 3 hours, depending on the view. The data in these views are retained for up to 365 days.

## 3-3. 解説文（日本語）

> ACCOUNT_USAGEビューのデータはリアルタイムではなく、ビューにより通常45分〜3時間の遅延で更新されます。データは最大365日間保持されます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
