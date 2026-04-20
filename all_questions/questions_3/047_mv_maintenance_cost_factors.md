# 047: Materialized View Maintenance Cost Factors

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-15
**正答**: B, C

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Materialized View Maintenance | MVのデータをベーステーブルの変更に合わせて更新する処理。コスト（クレジット+ストレージ）が発生 |
| Base Table | MVの元となるテーブル。ベーステーブルの変更がMVメンテナンスコストに影響 |
| Clustering Key on MV | MVに定義されたクラスタリングキー。Automatic Clusteringコストが追加で発生 |

## 1-2. 重要コンセプトまとめ

- MVメンテナンスコストに影響する要素（3つ）:
  1. ベーステーブルに作成された**MVの数**
  2. ベーステーブルの**データ変更の頻度・量**（頻繁な変更 = 高コスト）
  3. MVに**クラスタリングキーが定義されているか**
- コストに**影響しない**もの:
  - MVがクエリされる頻度 ❌
  - ベーステーブルがクエリされる頻度 ❌
- 覚え方: **「何個MVがあるか、どれだけデータが変わるか、クラスタリングキーがあるか」**

## 1-3. 公式ドキュメントURL

- [Materialized Views Maintenance Billing](https://docs.snowflake.com/en/user-guide/views-materialized#label-materialized-views-maintenance-billing)

---

## 2-1. 問題文（英語）

> Which of the following factors drive the costs associated with materialized view maintenance? Select two.
>
> A. How frequently is the materialized view queried.
> B. Whether or not a clustering key is defined on the materialized view.
> C. How frequently does the data in the base table change.
> D. How frequently is the base table queried.

## 2-2. 問題文の文法解析

### 文(B): "Whether or not a clustering key is defined on the materialized view."

- **注目ポイント**: `Whether or not ~` は「～かどうか」。クラスタリングキーの有無がコストに影響。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| drive the costs | phrase | コストを左右する | Factors that drive the costs. |
| whether or not ~ | phrase | ～かどうか | Whether or not a clustering key is defined. |
| the extent of data changes | phrase | データ変更の程度 | The extent of data changes in the base table. |

## 2-3. 問題文（日本語）

> マテリアライズドビューのメンテナンスコストに影響する要因はどれですか？2つ選んでください。

---

## 3-1. 解説文（英語）

> The costs of keeping data in materialized views are impacted by 1) The number of materialized views created for each base table. 2) The extent of data changes occurring in these materialized views when changes are made to the base table. 3) The number of these materialized views with a clustering key is defined.

## 3-3. 解説文（日本語）

> MVのデータ維持コストに影響する要素: 1) ベーステーブルに作成されたMVの数。2) ベーステーブルが変更された際にMVに発生するデータ変更の程度。3) クラスタリングキーが定義されたMVの数。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
