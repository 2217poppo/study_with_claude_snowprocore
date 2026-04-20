# 009: Clustering Depth Illustration

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-15
**正答**: 4

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Clustering Depth（クラスタリング深度） | テーブルのクラスタリング状態を示す数値指標。特定列に対するマイクロパーティションの重なり（overlap）の平均深度。1から始まり、大きいほどクラスタリングが不良 |

## 1-2. 重要コンセプトまとめ

- クラスタリング深度: **1 = 最良**（重なりなし）、**大きい = 不良**（重なりが多い）
- **最もクラスタリングが悪い = 深度が最大 = 重なりが最大**
- 深度が大きい → パーティションプルーニングの効果低下 → クエリが遅い
- SYSTEM$CLUSTERING_DEPTH関数で確認可能

## 1-3. 公式ドキュメントURL

- [Clustering Depth](https://docs.snowflake.com/en/user-guide/tables-clustering-micropartitions#label-clustering-depth)

---

## 2-1. 問題文（英語）

> Which of the following illustration represents the least well-clustered table?
>
> A. 1
> B. 3
> C. 4
> D. 2

## 2-2. 問題文の文法解析

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| least well-clustered | phrase | 最もクラスタリングが良くない | The least well-clustered table has the largest depth. |

## 2-3. 問題文（日本語）

> 最もクラスタリングが良くないテーブルを表しているのはどのイラストですか？

---

## 3-1. 解説文（英語）

> For a populated table, the clustering depth is the average depth of overlapping micro-partitions for specific columns. The clustering depth starts at 1 (for a well-clustered table) and can be a larger number. If the average depth is smaller, the data for the specified columns are better clustered.

## 3-3. 解説文（日本語）

> データが投入されたテーブルの場合、クラスタリング深度は特定列に対するマイクロパーティションの重なりの平均深度です。クラスタリング深度は1（良好にクラスタリングされたテーブル）から始まり、より大きい数値になり得ます。平均深度が小さいほど、指定された列のデータはより良くクラスタリングされています。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
