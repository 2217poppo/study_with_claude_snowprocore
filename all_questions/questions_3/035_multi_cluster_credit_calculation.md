# 035: Multi-Cluster Credit Calculation

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-15
**正答**: 48

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Credit Consumption | WHのサイズと稼働時間に基づくクレジット消費。X-Large = 16 credits/hour |
| Multi-Cluster Scaling | クラスター追加時、追加クラスターもサイズ相当のクレジットを消費 |

## 1-2. 重要コンセプトまとめ

- WHサイズごとのクレジット消費（1時間あたり）:

| サイズ | Credits/Hour |
|--------|-------------|
| X-Small | 1 |
| Small | 2 |
| Medium | 4 |
| Large | 8 |
| X-Large | **16** |
| 2X-Large | 32 |

- 計算問題の解法:
  - 1クラスター × X-Large × 1時間 = **16 credits**
  - 2クラスター × X-Large × 1時間 = **32 credits**
  - 合計 = 16 + 32 = **48 credits**
- Multi-Cluster WHでは各クラスターが**独立してクレジットを消費**

## 1-3. 公式ドキュメントURL

- [Understanding Compute Cost](https://docs.snowflake.com/en/user-guide/cost-understanding-compute)

---

## 2-1. 問題文（英語）

> A multi-cluster virtual warehouse of size X-Large has 1 cluster running for 1 hour. Due to query demands, it scales out (adds another cluster) and then runs the two clusters for another hour. What is the total number of credits consumed?
>
> A. 32
> B. 16
> C. 64
> D. 48

## 2-2. 問題文の文法解析

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| scales out | phrasal verb | スケールアウトする | Scales out and adds another cluster. |
| credits consumed | noun | 消費されたクレジット | Total number of credits consumed. |

## 2-3. 問題文（日本語）

> X-LargeのMulti-cluster WHが1クラスターで1時間稼働後、スケールアウトして2クラスターでさらに1時間稼働。合計クレジット消費は？

---

## 3-1. 解説文（英語）

> 1 cluster of X-Large multi-cluster virtual warehouse running for 1 hour = 16 credits. 2 clusters of X-Large multi-cluster virtual warehouse running for 1 hour = 16 credits * 2 = 32. Total = 48.

## 3-3. 解説文（日本語）

> X-Large 1クラスター × 1時間 = 16クレジット。X-Large 2クラスター × 1時間 = 32クレジット。合計 = 48クレジット。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
