# 064: Query Profile — Detecting Poor Clustering

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-03
**正答**: A・B（Partitions Scannedが大きい / Partitions Total = Partitions Scanned）

> 関連問題: 035（Clustering Keys）・049（Query Profile Result Cache）・062（Partition Pruning）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Partitions Scanned（スキャンされたパーティション数） | Query Profileに表示される実際にスキャンされたマイクロパーティションの数。**この値が大きいほど多くのデータを読んでいる** |
| Partitions Total（パーティション総数） | テーブルに存在するマイクロパーティションの総数。Partitions Scannedと比較することでPruningの効果を判定できる |
| Partition Pruning（パーティションプルーニング） | WHERE条件に合致しないパーティションを除外する最適化。`Scanned << Total` のとき効果的に機能している |
| Well Clustered（適切にクラスタリングされた） | クラスタリングキーの効果が高い状態。同じ値域のデータが同じパーティションに集まり、Pruningが最大限に機能する |
| Poorly Clustered（クラスタリングが不十分な） | 関連データが多くのパーティションに散らばっており、Pruningがほとんど機能していない状態 |
| JoinFilter Node | Query ProfileのJOIN処理最適化ノード。クラスタリングの問題とは無関係 |
| Result Node | Query Profileの最終結果を返すノード。返す行数が多いことはクラスタリング問題の指標にはならない |

## 1-2. 重要コンセプトまとめ

- **クラスタリング不良のサイン（Query Profile上）**:

  | 指標 | クラスタリング不良の判断 |
  |------|----------------------|
  | **Partitions Scanned が大きい** | テーブルの大部分をスキャンしている（Pruning効果小） |
  | **Partitions Scanned ≈ Partitions Total** | ほぼ全パーティションをスキャン = テーブルフルスキャン = Pruningが全く効いていない |

- **理想の状態 vs 問題のある状態**:

  ```
  テーブルに1000パーティションある場合

  ✅ 良好: Partitions Scanned = 50  (5%のみスキャン)
  ❌ 問題: Partitions Scanned = 950 (95%スキャン)
  ❌ 最悪: Partitions Scanned = 1000 (= Partitions Total, 完全スキャン)
  ```

- **不正解の選択肢の解説**:
  - `JoinFilter nodes が多い` → JOIN処理の最適化ノード。クラスタリングとは無関係
  - `Result node が多くの行を返す` → 結果行数は多ければ多いほど悪いわけではない。大量データを正しく返すクエリもある

- **対策**: `Partitions Scanned ≈ Partitions Total` のとき → クラスタリングキーの見直し・`ALTER TABLE ... CLUSTER BY` で改善

## 1-3. 公式ドキュメントURL

- [Query Profile — Interpreting the Profile](https://docs.snowflake.com/en/user-guide/ui-query-profile)

---

## 2-1. 問題文（英語）

> Which query profile results indicate that a large table may not be well clustered? Select all that apply.
>
> A. A significant value for 'Partitions Scanned.'
> B. The value in the 'Partitions Total' equals 'Partitions Scanned.'
> C. There are many JoinFilter nodes.
> D. The Result node returns many rows.

## 2-2. 問題文の文法解析

### 文1: "Which query profile results indicate that a large table may not be well clustered?"

- **主語 (S)**: Which query profile results（どのクエリプロファイルの結果が）
- **動詞 (V)**: indicate（示す）
- **that節**: that a large table may not be well clustered（大きなテーブルが適切にクラスタリングされていない可能性があることを）
- **注目ポイント**: `may not be well clustered` = 「適切にクラスタリングされていないかもしれない」。`may not` = 可能性の否定（断定ではなく推測）。`well clustered` = 「適切にクラスタリングされた」

### 選択肢A: "A significant value for 'Partitions Scanned.'"

- **注目ポイント**: `significant value` = 「有意に大きな値・著しい値」。ただ「大きい」だけでなく、問題が生じるほど大きいことを示す

### 選択肢B: "The value in the 'Partitions Total' equals 'Partitions Scanned.'"

- **主語 (S)**: The value in the 'Partitions Total'
- **動詞 (V)**: equals（等しい）← 三単現 `equals`
- **目的語 (O)**: 'Partitions Scanned'
- **注目ポイント**: `equals` = 数学・比較表現の動詞。`A equals B` = 「AはBに等しい」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| indicate that ~ | 熟語 | 〜であることを示す | Profile results indicate that pruning is not working. |
| may not be well ~ | 可能性の否定 | 適切に〜されていないかもしれない | The table may not be well clustered. |
| significant | 形容詞 | 著しい・有意な・重大な | A significant number of partitions were scanned. |
| equals | 動詞 | 〜に等しい | Partitions Total equals Partitions Scanned. |

## 2-3. 問題文（日本語）

> 次のクエリプロファイルの結果のうち、大きなテーブルが適切にクラスタリングされていない可能性を示すものはどれですか？当てはまるものをすべて選択してください。
>
> A. 「Partitions Scanned」の値が著しく大きい。
> B. 「Partitions Total」の値が「Partitions Scanned」と等しい。
> C. JoinFilterノードが多数存在する。
> D. Resultノードが多くの行を返す。

---

## 3-1. 解説文（英語）

> Partition pruning occurs when the number of Partitions scanned is much smaller than Partitions total. If the partitions scanned equal the partition total, the query scanned the complete table. Therefore, no partition pruning happened, and the clustering key should be improved.

## 3-2. 解説文の文法解析

### 文1: "Partition pruning occurs when the number of Partitions scanned is much smaller than Partitions total."

- **主語 (S)**: Partition pruning
- **動詞 (V)**: occurs（起こる・発生する）
- **時間節**: when the number of Partitions scanned is much smaller than Partitions total（スキャンされたパーティション数がパーティション総数よりはるかに小さいとき）
- **注目ポイント**: `much smaller than ~` = 「〜よりはるかに小さい」。`much` は比較級を強調する副詞

### 文2: "If the partitions scanned equal the partition total, the query scanned the complete table."

- **条件節**: If the partitions scanned equal the partition total（スキャン数がパーティション総数と等しければ）
- **主語 (S)**: the query（そのクエリは）
- **動詞 (V)**: scanned（スキャンした）
- **目的語 (O)**: the complete table（テーブル全体を）← `complete` = 「完全な・すべての」
- **注目ポイント**: `equal` が動詞として使われている（`equals` ではなく条件節内で原形）。`the complete table` = テーブルフルスキャンを意味する

### 文3: "Therefore, no partition pruning happened, and the clustering key should be improved."

- **接続副詞**: Therefore（したがって）
- **主語 (S)**: no partition pruning（パーティションプルーニングが全く）
- **動詞 (V)**: happened（起きなかった）← `no + 名詞` で完全否定
- **帰結**: the clustering key should be improved（クラスタリングキーを改善すべき）← `should be improved` = 受動態の should
- **注目ポイント**: `should be improved` = 「改善すべき」。推奨・必要性を示す受動態の助動詞 `should`

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| occur | 動詞 | 発生する・起こる | Pruning occurs when Scanned << Total. |
| much smaller than ~ | 比較表現 | 〜よりはるかに小さい | Scanned is much smaller than Total. |
| the complete table | 名詞句 | テーブル全体 | The query scanned the complete table. |
| no + 名詞（完全否定） | 否定構文 | 全く〜ない | No partition pruning happened. |
| should be improved | 受動態助動詞 | 改善すべきである | The clustering key should be improved. |

## 3-3. 解説文（日本語）

> パーティションプルーニングは、スキャンされたパーティション数がパーティション総数よりはるかに小さいときに発生します。スキャン数がパーティション総数と等しい場合、クエリはテーブル全体をスキャンしたことになります。したがって、パーティションプルーニングは発生しておらず、クラスタリングキーを改善すべきです。

---

## 復習メモ

- [ ] `Partitions Scanned ≈ Partitions Total` のときクラスタリング不良の兆候であることを覚えた
- [ ] Query ProfileでのPruning効果の読み方（Scanned << Total = 良好）を理解した
- [ ] JoinFilterノードやResult行数はクラスタリング問題の指標でないことを確認した
- [ ] `much smaller than`・`no + 名詞`・`should be improved` の英語パターンを確認した
- [ ] この問題は理論問題のためサンドボックス検証は不要
