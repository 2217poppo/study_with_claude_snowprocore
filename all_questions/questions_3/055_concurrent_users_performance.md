# 055: Concurrent Users Performance Impact

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-15
**正答**: Decreased performance for large, complex queries

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Concurrent Users（同時ユーザー） | 同時にWHを使用するユーザー数。増加するとリソースが分散される |
| Resource Sharing | 同時クエリがWHのリソースを共有する仕組み。各クエリが得るリソースが減少 |
| Query Concurrency | 同時に実行されるクエリの数。WHの容量を超えるとキューイングが発生 |

## 1-2. 重要コンセプトまとめ

- 同時ユーザー増加 → クエリがリソースを**共有** → 各クエリのリソースが**減少** → パフォーマンス**低下**
- 特に大規模・複雑なクエリは多くのリソースを必要とするため影響が大きい
- 「パフォーマンス向上」は**いずれも誤り**
- 対策: **Multi-Cluster WH**でスケールアウト、またはワークロード分離

## 1-3. 公式ドキュメントURL

- [Warehouse Max Concurrency](https://docs.snowflake.com/en/user-guide/performance-query-warehouse-max-concurrency)

---

## 2-1. 問題文（英語）

> What are the implications if the number of concurrent users on a virtual warehouse is increased?
>
> A. Improved performance for all queries
> B. Improved performance for large, complex queries
> C. Decreased performance for large, complex queries
> D. Improved performance for small, point lookup queries

## 2-2. 問題文の文法解析

### 文1: "What are the implications if the number of concurrent users on a virtual warehouse is increased?"

- **主語 (S)**: What
- **動詞 (V)**: are
- **補語 (C)**: the implications
- **修飾語 (M)**: if the number of concurrent users is increased（条件節）
- **文型**: SVC
- **注目ポイント**: `implications` は「影響、結果」。`if ~ is increased` で条件を設定。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| implications | noun | 影響、結果 | What are the implications? |
| concurrent | adjective | 同時の | Concurrent queries share resources. |
| share resources | phrase | リソースを共有する | Queries share warehouse resources. |
| perform worse | phrase | パフォーマンスが悪化する | Each query will likely perform worse. |

## 2-3. 問題文（日本語）

> 仮想ウェアハウスの同時ユーザー数が増加した場合の影響は？

---

## 3-1. 解説文（英語）

> Concurrent queries share warehouse resources; thus, a high number of concurrent queries means each query gets fewer resources and will likely perform worse.

## 3-2. 解説文の文法解析

### 文1: "Concurrent queries share warehouse resources; thus, a high number of concurrent queries means each query gets fewer resources and will likely perform worse."

- **主語 (S)**: Concurrent queries / a high number of concurrent queries
- **動詞 (V)**: share / means
- **目的語 (O)**: warehouse resources / each query gets fewer resources
- **修飾語 (M)**: thus（結論）
- **文型**: SVO + SVO
- **注目ポイント**: `; thus,` で因果関係。リソース共有 → リソース減少 → パフォーマンス低下の連鎖。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| fewer resources | noun | より少ないリソース | Each query gets fewer resources. |
| will likely perform worse | phrase | パフォーマンスが悪化する可能性が高い | Will likely perform worse. |

## 3-3. 解説文（日本語）

> 同時クエリはウェアハウスのリソースを共有します。したがって、同時クエリ数が多いほど各クエリが得るリソースが少なくなり、パフォーマンスが悪化する可能性が高くなります。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
