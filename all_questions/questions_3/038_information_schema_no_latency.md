# 038: INFORMATION_SCHEMA No Latency

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-15
**正答**: False

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| INFORMATION_SCHEMA | ほぼ**リアルタイム**でデータを提供。遅延なし。3時間遅延はACCOUNT_USAGEの特性 |
| ACCOUNT_USAGE | 45分〜3時間の遅延。リアルタイムではない |

## 1-2. 重要コンセプトまとめ

- 「INFORMATION_SCHEMAが3時間遅延」= **False**（INFORMATION_SCHEMAはリアルタイム）
- 3時間遅延があるのは**ACCOUNT_USAGE**

| 特性 | INFORMATION_SCHEMA | ACCOUNT_USAGE |
|------|-------------------|---------------|
| 遅延 | **リアルタイム（なし）** | 45分〜3時間 |
| 保持期間 | 7日〜6ヶ月 | 365日 |

## 1-3. 公式ドキュメントURL

- [Differences Between Account Usage and Information Schema](https://docs.snowflake.com/en/sql-reference/account-usage#differences-between-account-usage-and-information-schema)

---

## 2-1. 問題文（英語）

> True or False: The data in the views in the INFORMATION_SCHEMA can have a latency of up to 3 hours.
>
> A. False
> B. True

## 2-3. 問題文（日本語）

> 真/偽: INFORMATION_SCHEMAのビューのデータは最大3時間の遅延がある可能性がある。

---

## 3-1. 解説文（英語）

> The data provided via the INFORMATION_SCHEMA views is real-time, and there is no latency in the information provided.

## 3-3. 解説文（日本語）

> INFORMATION_SCHEMAビューのデータはリアルタイムで提供され、遅延はありません。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
