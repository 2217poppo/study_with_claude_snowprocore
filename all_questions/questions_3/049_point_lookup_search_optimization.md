# 049: Point Lookup Search Optimization

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-15
**正答**: Search Optimization

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Point Lookup Query | 1〜数行のみを返す高選択性フィルターのクエリ。`WHERE id = 12345` のような等値検索 |
| Search Optimization Service | ポイントルックアップクエリを高速化するサーバーレスサービス。等値述語（=）やIN述語で効果的 |
| Equality Predicate | `=` 演算子を使ったWHERE条件。Search Optimizationが最も効果的に機能する |

## 1-2. 重要コンセプトまとめ

- ポイントルックアップの高速化 = **Search Optimization Service**
- Automatic Clusteringは大規模スキャンの最適化（ポイントルックアップ専用ではない）
- Materialized Viewsは頻繁な複雑クエリの事前計算（ポイントルックアップ専用ではない）
- Secure Views / External Tablesはパフォーマンス最適化機能ではない

## 1-3. 公式ドキュメントURL

- [Understanding the Search Optimization Service](https://docs.snowflake.com/en/user-guide/search-optimization-service#understanding-the-search-optimization-service)

---

## 2-1. 問題文（英語）

> Which of the following can improve the performance of point lookup queries?
>
> A. Automatic Clustering
> B. Search Optimization
> C. Secure Views
> D. External Tables
> E. Materialized Views

## 2-2. 問題文の文法解析

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| point lookup query | noun | ポイントルックアップクエリ | Improve the performance of point lookups. |
| highly selective filters | noun | 高選択性フィルター | Queries that use highly selective filters. |

## 2-3. 問題文（日本語）

> ポイントルックアップクエリのパフォーマンスを改善できるのはどれですか？

---

## 3-1. 解説文（英語）

> The search optimization service can be used to improve the performance of point lookup queries that return only one or a few rows and use highly selective filters using equality predicates or IN predicates.

## 3-3. 解説文（日本語）

> 検索最適化サービスは、等値述語やIN述語を使用した高選択性フィルターで1行または数行のみを返すポイントルックアップクエリのパフォーマンスを改善するために使用できます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
