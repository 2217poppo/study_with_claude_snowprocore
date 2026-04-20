# 021: Query Cache Max 31 Days

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-15
**正答**: 31 days

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Query Result Cache | クエリ結果をCloud Servicesレイヤーに保存。初期有効期間24時間、再利用で延長、最大31日 |

## 1-2. 重要コンセプトまとめ

- Query Result Cacheの最大保持期間 = **31日**
- 動作: 初期24時間 → 再利用で24時間延長 → 最大31日で無条件パージ
- 24時間は「初期有効期間」、31日は「最大保持期間」— 問われ方に注意

## 1-3. 公式ドキュメントURL

- [Using Persisted Query Results](https://docs.snowflake.com/en/user-guide/querying-persisted-results)

---

## 2-1. 問題文（英語）

> What is the maximum period for a query result cache to be retained?
>
> A. 31 days
> B. 24 hours

## 2-3. 問題文（日本語）

> クエリ結果キャッシュが保持される最大期間は？

---

## 3-1. 解説文（英語）

> The query result cache for a query has an initial validity period of twenty-four hours. This extension of the first query result cache can continue for up to a maximum of 31 days. After 31 days, the query result cache for a query is purged altogether.

## 3-3. 解説文（日本語）

> クエリ結果キャッシュの初期有効期間は24時間です。この延長は最大31日まで継続可能です。31日後にキャッシュは完全にパージされます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
