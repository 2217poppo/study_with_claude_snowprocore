# 006: Performance Improvement Methods

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-15
**正答**: A, C, D, E

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Query Result Caching | 過去のクエリ結果をCloud Servicesレイヤーに保存し再利用。WH不要で即座に結果を返す |
| Dedicated Virtual Warehouse | 特定ワークロード専用のWH。ワークロードを分離してリソース競合を防ぐ |
| Clustering Keys | テーブルの物理的なデータ配置を最適化しパーティションプルーニング効果を向上 |
| Multi-cluster Virtual Warehouse | 複数クラスターで同時実行数の増加に対応。コンカレンシー問題を解消 |
| Secondary Indices | 従来型DBのインデックス。**Snowflakeには存在しない** |
| Materialized Views | クエリ結果を事前計算して物理保存。頻繁な複雑クエリの高速化 |
| Search Optimization Service | ポイントルックアップクエリを高速化するサーバーレスサービス |

## 1-2. 重要コンセプトまとめ

- Snowflakeのパフォーマンス改善手法（7つ）:
  1. **キャッシュ機構**（Query Result / Metadata / Warehouse Cache）
  2. **スケールアップ**（WHサイズ増加 → 複雑クエリ対応）
  3. **スケールアウト**（Multi-cluster WH → 同時実行数対応）
  4. **パーティションプルーニング**（自動的な静的・動的プルーニング）
  5. **クラスタリングキー**（プルーニング効果の向上）
  6. **マテリアライズドビュー**（複雑クエリの事前計算）
  7. **Search Optimization Service**（ルックアップクエリ高速化）
- **Secondary Indices（セカンダリインデックス）はSnowflakeに存在しない**
- 専用WH（Dedicated WH）でワークロード分離もパフォーマンス改善の有効手段

## 1-3. 公式ドキュメントURL

- [Warehouses Overview](https://docs.snowflake.com/en/user-guide/warehouses-overview)

---

## 2-1. 問題文（英語）

> What are some of the ways to improve performance in Snowflake? Select all that apply.
>
> A. Query Result Caching
> B. Secondary Indices
> C. Dedicated Virtual Warehouse
> D. Clustering Keys
> E. Multi-cluster Virtual Warehouse

## 2-2. 問題文の文法解析

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| it is not required to ~ | phrase | ～する必要がない | Not required to perform much query tuning. |
| horizontal scaling | noun | 水平スケーリング | Horizontal scaling by using multi-cluster WH. |
| transparently in the background | phrase | バックグラウンドで透過的に | Caching operates transparently in the background. |

## 2-3. 問題文（日本語）

> Snowflakeでパフォーマンスを改善する方法はどれですか？該当するものをすべて選んでください。

---

## 3-1. 解説文（英語）

> Snowflake's unique architecture and the underlying micro-partitions storage technology mean it is not required to perform much query tuning in most situations. There are, however, several performance improvement approaches that are available and are used to increase Snowflake's overall performance. These include: Internal caching mechanisms that operate transparently in the background to increase performance. Scaling up or increasing the capacity of a virtual warehouse to allow for more processing power to be available for complex queries. Horizontal scaling by increasing the capacity by using a multi-cluster virtual warehouse to handle a large number of concurrent users and concurrent queries. Automatic static and dynamic partition pruning can reduce unneeded partitions while processing a query. It is possible to accomplish better partition pruning by redistributing data in micro-partitions using clustering keys. Pre-computing results of complex, regularly executed queries by using materialized views. Using Search Optimization services to improve the performance of specific types of lookup queries.

## 3-3. 解説文（日本語）

> Snowflakeの独自アーキテクチャとマイクロパーティション技術により、ほとんどの場合クエリチューニングは不要です。ただし、パフォーマンス改善手法は複数あります。バックグラウンドで透過的に動作するキャッシュ機構、WHのスケールアップ、Multi-cluster WHによる水平スケーリング、自動パーティションプルーニング、クラスタリングキーによるプルーニング改善、マテリアライズドビューによる事前計算、Search Optimizationサービスによるルックアップクエリ高速化です。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
