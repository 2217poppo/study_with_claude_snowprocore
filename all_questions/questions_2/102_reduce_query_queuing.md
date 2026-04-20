# 102: Reduce Query Queuing

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-14
**正答**: B, D

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Query Queuing | WHリソース不足でクエリが待ち行列に入る状態 |
| Multi-Cluster WH | 複数クラスターで構成されるWH。キューイング解消の主要手段 |
| Maximum Cluster Count | Multi-Cluster WHの最大クラスター数。増やすとキューイング耐性が上がる |

## 1-2. 重要コンセプトまとめ

- クエリキューイングを減らす方法（3つ）:
  1. 追加WHを作成してワークロードを分散
  2. **標準WHをMulti-Cluster WHに変更** ✅
  3. **既にMulti-Clusterの場合、最大クラスター数を増加** ✅
- 効果**なし**:
  - WHの頻繁なサスペンド（キャッシュクリアはむしろ逆効果）
  - WHサイズ増加（スケールアップはクエリの重さに対応、同時実行数には無効）
  - Auto Resume有効化（キューイングとは無関係）
- **スケールアウト（クラスター追加）がキューイング対策、スケールアップ（サイズ増加）はクエリ複雑度対策**

## 1-3. 公式ドキュメントURL

- [Options for Reducing Queues](https://docs.snowflake.com/en/user-guide/performance-query-warehouse-queue#options-for-reducing-queues)

---

## 2-1. 問題文（英語）

> Which of the following will help reduce query queuing on a virtual warehouse? Select two answers.
>
> A. Suspend the warehouse often so that its memory is cleared.
> B. If already using a multi-cluster virtual warehouse, increase the maximum number of clusters.
> C. Increase the size of the virtual warehouse.
> D. Change the virtual warehouse to a multi-cluster virtual warehouse.
> E. Enable Auto Resume.

## 2-2. 問題文の文法解析

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| reduce queuing | phrase | キューイングを減らす | Help reduce query queuing. |
| distribute the workload | phrase | ワークロードを分散する | Distribute the query workload. |

## 2-3. 問題文（日本語）

> 仮想ウェアハウスのクエリキューイングを減らすのに役立つのはどれですか？2つ選んでください。

---

## 3-1. 解説文（英語）

> Queuing can be reduced in a variety of ways. 1) Consider creating additional virtual warehouses and distributing the query workload if using a standard virtual warehouse. 2) Convert a standard virtual warehouse to a multi-cluster virtual warehouse. 3) If already using a multi-cluster virtual warehouse, increase the maximum cluster size.

## 3-3. 解説文（日本語）

> キューイングは様々な方法で削減できます。1) 標準WHを使用中なら、追加WHを作成してワークロードを分散。2) 標準WHをマルチクラスターWHに変換。3) 既にマルチクラスターWHなら、最大クラスター数を増加。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
