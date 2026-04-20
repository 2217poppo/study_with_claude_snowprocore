# 019: Multi-Cluster Month-End Scenario

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-15
**正答**: C

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Multi-Cluster Virtual Warehouse | 需要に応じてクラスター数を動的に増減するWH。同時実行数の増加（キューイング）を解消 |
| Query Queuing | WHのリソース不足でクエリが待ち行列に入る状態。Multi-Cluster WHで解消 |
| Scaling Out（スケールアウト） | クラスター数を増やして同時実行数を増加。Auto-Scalingとも呼ばれる |

## 1-2. 重要コンセプトまとめ

- 月末に同時クエリ数が急増 → キューイング発生 → **Multi-Cluster WH** が最適解
- WHサイズ増加（Scale Up）はクエリの複雑度対策であり、キューイングには不十分
- Multi-Cluster WHは需要に応じて**自動的に追加クラスターを起動・停止** → コスト最小化
- 恒久的なサイズ増加は月末以外に無駄なコストが発生

## 1-3. 公式ドキュメントURL

- [Multi-cluster Warehouses](https://docs.snowflake.com/en/user-guide/warehouses-multicluster)

---

## 2-1. 問題文（英語）

> You are the Data warehouse administrator at a large bank... the number of queries increases many times at month-end... user queries must wait (queue)... What is the best course of action?
>
> A. Disable finance users during month-end.
> B. Increase WH size from L to XL during month-end, reduce after.
> C. Configure the finance WH to be a multi-clustered virtual warehouse.
> D. Permanently increase WH size to XL.

## 2-3. 問題文（日本語）

> 月末にクエリ数が急増しキューイングが発生。コストを最小化しつつユーザー体験を改善する最善策は？

---

## 3-1. 解説文（英語）

> Multi-cluster virtual warehouses are frequently used in scenarios where the number of concurrent queries exceeds the capacity of a single virtual warehouse. Multi-cluster virtual warehouses dynamically add additional clusters based on demand to solve the queueing issue. When demand decreases, the additional clusters are decommissioned. This process is also known as scaling out or auto-scaling.

## 3-3. 解説文（日本語）

> Multi-cluster WHは同時クエリ数が単一WHの容量を超えるシナリオで頻繁に使用されます。需要に基づいて動的に追加クラスターを起動しキューイング問題を解決します。需要が減少すると追加クラスターは廃止されます。このプロセスはスケールアウトまたはオートスケーリングとも呼ばれます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
