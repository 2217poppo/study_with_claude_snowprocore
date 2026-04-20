# 030: Micro-Partition Value Range Overlap

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-12
**正答**: A（Yes）
**ユーザー回答**: A — 正解

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Micro-Partition（マイクロパーティション） | Snowflakeがデータを内部的に分割・格納する単位（50〜500MB非圧縮）。列指向形式で保存され、各パーティションには列ごとの最小値・最大値のメタデータが保持される |
| Immutable（不変） | マイクロパーティションの重要な特性。一度作成されたパーティションは**変更されない**。UPDATE/DELETE時は既存パーティションを書き換えるのではなく、新しいパーティションが作成される |
| Overlapping Values（値の重なり） | 異なるマイクロパーティション間で同じ値の範囲が重複すること。Snowflakeでは**重なりは仕様上あり得る**。重なりが多いとパーティションプルーニングの効率が低下する |
| Clustering Key（クラスタリングキー） | マイクロパーティション間の値の重なりを減らし、データの物理的な並びを最適化するために定義するキー |
| Partition Pruning（パーティションプルーニング） | クエリ実行時にWHERE条件に合致しないマイクロパーティションをスキャン対象から除外する最適化。重なりが少ないほど効率的 |

## 1-2. 重要コンセプトまとめ

- **マイクロパーティションの値範囲は重なり得る（Yes）**: これはSnowflakeの仕様上正常な状態
- **重なりが発生する理由**:
  1. マイクロパーティションは**不変（immutable）** — UPDATE/DELETEで書き換えず、新しいパーティションが作成される
  2. 新しいデータが既存パーティションの値範囲と重なる位置に挿入される
  3. 類似の値が同じ物理パーティションに存在する**保証がない**
- **重なりの影響**: 重なりが多い = パーティションプルーニングの効率が低下 = クエリが遅くなる
- **重なりの解消**: クラスタリングキーを定義し、Automatic Clusteringで再配置
- **クラスタリング深度との関係**: Clustering Depth（Q2-011）が1に近いほど重なりが少なく良好な状態
- **関連問題**: Q2-011（Clustering Depth）、Q110（Micro-Partition Characteristics）、Q035（Clustering Keys）

## 1-3. 公式ドキュメントURL

- [Micro-Partitions & Data Clustering](https://docs.snowflake.com/en/user-guide/tables-clustering-micropartitions)

---

## 2-1. 問題文（英語）

> Can micro-partitions overlap in their range of values?
>
> A. Yes
> B. No

## 2-2. 問題文の文法解析

### 文1: "Can micro-partitions overlap in their range of values?"

- **主語 (S)**: micro-partitions（マイクロパーティションは）
- **動詞 (V)**: Can overlap（重なり得るか）
- **修飾語 (M)**: in their range of values（値の範囲において）
- **文型**: SV（疑問文）
- **注目ポイント**:
  - `overlap in ~` — 「〜において重なる」。重複の対象を `in` で示す
  - `range of values` — 「値の範囲」。マイクロパーティションが保持する最小値〜最大値の範囲

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| overlap | verb | 重なる、重複する | Micro-partition values can overlap. |
| range of values | noun phrase | 値の範囲 | Each partition has a range of values for each column. |
| immutable | adj | 不変の、変更できない | Micro-partitions are immutable. |

## 2-3. 問題文（日本語）

> マイクロパーティションは値の範囲において重なり得ますか？
>
> A. はい
> B. いいえ

---

## 3-1. 解説文（英語）

> Because micro-partitions are immutable and any data modifications or new data must require a new micro-partition, similar values are not guaranteed to be in the same physical partition, and partition values can also overlap.

## 3-2. 解説文の文法解析

### 文1: "Because micro-partitions are immutable and any data modifications or new data must require a new micro-partition, similar values are not guaranteed to be in the same physical partition, and partition values can also overlap."

- **理由節 (M)**: Because micro-partitions are immutable and any data modifications or new data must require a new micro-partition（マイクロパーティションは不変であり、データの変更や新しいデータは新しいマイクロパーティションを必要とするため）
- **主語1 (S1)**: similar values（類似の値は）
- **動詞1 (V1)**: are not guaranteed to be（〜にあることが保証されない）— 否定の受動態
- **修飾語1 (M1)**: in the same physical partition（同じ物理パーティション内に）
- **主語2 (S2)**: partition values（パーティションの値は）
- **動詞2 (V2)**: can also overlap（重なることもあり得る）
- **文型**: Because SV and SV, SV and SV（理由節 + 2つの結果を並列）
- **注目ポイント**:
  - `are not guaranteed to be ~` — 「〜であることが保証されない」。保証のなさを示す受動態表現
  - `must require` — 「必ず必要とする」。`must` + `require` で強い必然性
  - `can also overlap` — 「重なることもあり得る」。可能性を示す

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| immutable | adj | 不変の | Micro-partitions are immutable once created. |
| are not guaranteed to be | verb phrase | 〜であることが保証されない | Similar values are not guaranteed to be in the same partition. |
| data modification | noun phrase | データの変更 | Data modifications create new micro-partitions. |
| physical partition | noun phrase | 物理パーティション | Values may span multiple physical partitions. |

## 3-3. 解説文（日本語）

> マイクロパーティションは不変であり、データの変更や新しいデータには新しいマイクロパーティションが必要となるため、類似の値が同じ物理パーティション内にあることは保証されず、パーティションの値は重なることもあり得ます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
