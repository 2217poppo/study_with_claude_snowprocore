# 018: Transient Time Travel Max

**SnowPro Core Domain**: Domain 5 — Data Collaboration
**作成日**: 2026-04-15
**正答**: 1 day

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Transient Table | Fail-Safe 0日・Time Travel**最大1日**のテーブル。エディションに関係なく1日が上限 |
| Temporary Table | Transientと同じくTime Travel**最大1日**。セッション終了で消滅 |
| Permanent Table | Time Travel最大90日（Enterprise以上）。Standard Editionでは最大1日 |

## 1-2. 重要コンセプトまとめ

- Transient/TemporaryのTime Travel = **最大1日**（エディション問わず）
- PermanentのTime Travel = Standard最大1日、Enterprise以上最大90日
- `irrespective of the Snowflake edition` — エディションに関係なく

## 1-3. 公式ドキュメントURL

- [Temporary and Transient Tables](https://docs.snowflake.com/en/user-guide/tables-temp-transient)

---

## 2-1. 問題文（英語）

> What is the maximum period for which Time Travel is permitted for Transient tables?
>
> A. 1 day
> B. 14 days
> C. 21 days
> D. 7 days

## 2-3. 問題文（日本語）

> Transientテーブルに許可されるTime Travelの最大期間は？

---

## 3-1. 解説文（英語）

> Transient and Temporary tables in Snowflake support Time Travel for up to 1 day, irrespective of the Snowflake edition used.

## 3-3. 解説文（日本語）

> SnowflakeのTransientテーブルとTemporaryテーブルは、使用するエディションに関係なく最大1日のTime Travelをサポートします。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
