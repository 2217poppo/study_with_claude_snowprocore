# 013: Transient Fail-Safe Zero Days

**SnowPro Core Domain**: Domain 5 — Data Collaboration
**作成日**: 2026-04-15
**正答**: 0 days

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Transient Table | Fail-Safe **0日**・Time Travel最大1日。セッションをまたいで存続 |
| Temporary Table | Fail-Safe **0日**・Time Travel最大1日。セッション終了で消滅 |
| Permanent Table | Fail-Safe **7日**・Time Travel最大90日（Enterprise以上） |

## 1-2. 重要コンセプトまとめ

- TransientテーブルのFail-Safeは **0日**（Fail-Safe機能なし）
- TemporaryテーブルもFail-Safe **0日**
- PermanentテーブルのみFail-Safe **7日**

## 1-3. 公式ドキュメントURL

- [Temporary and Transient Tables](https://docs.snowflake.com/en/user-guide/tables-temp-transient)

---

## 2-1. 問題文（英語）

> Snowflake stores data in fail-safe storage for Transient tables for how long?
>
> A. 0 days
> B. 1 day
> C. 7 days
> D. 14 days

## 2-3. 問題文（日本語）

> SnowflakeはTransientテーブルのFail-Safeストレージにデータをどのくらいの期間保存しますか？

---

## 3-1. 解説文（英語）

> Snowflake has transient and temporary tables that don't provide fail-safe capabilities; hence, data in such tables have 0 days of fail-safe storage.

## 3-3. 解説文（日本語）

> Snowflakeにはfail-safe機能を提供しないtransientテーブルとtemporaryテーブルがあり、それらのデータのfail-safeストレージは0日です。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
