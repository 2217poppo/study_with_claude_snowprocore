# 077: Clustering Depth — Identifying a Well-Clustered Table

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation (Performance Concepts)
**作成日**: 2026-04-03
**正答**: C（図1 — マイクロパーティションの重なりが最も少ない＝クラスタリング深度が最小）

> 関連問題: 035（Clustering Keys）・053（ALTER Clustering Key）・062（Partition Pruning）・064（Query Profile Clustering）・065（Clustering Editions）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Clustering Depth（クラスタリング深度） | テーブルのクラスタリング状態を示す指標。**1が最良**で、値が大きいほどマイクロパーティションの重なりが多く、クラスタリングが悪い状態を示す |
| Overlapping Micro-Partitions（重なりあうマイクロパーティション） | 同じ値の範囲を複数のパーティションが含んでいる状態。重なりが多いとパーティションプルーニングの効果が下がる |
| Well-Clustered Table（よくクラスタリングされたテーブル） | クラスタリング深度が1に近いテーブル。特定列でのWHERE絞り込み時に不要なパーティションをほぼ完全に除外できる |
| Populated Table（データが格納されたテーブル） | データが実際に挿入されているテーブル。クラスタリング深度はデータが存在するテーブルに対してのみ計算される |

## 1-2. 重要コンセプトまとめ

- **クラスタリング深度の定義**:
  - テーブルの特定列において、マイクロパーティションが**平均的に何枚重なっているか**を示す指標
  - 深度 = 1 → 理想的な状態（重なりゼロ、各パーティションが固有の値範囲を持つ）
  - 深度 > 1 → 重なりがある（値が複数パーティションに分散している）

- **視覚的なイメージ**（実際の問題は図で出題）:
  ```
  図1（最良・深度≈1）: 各パーティションの値範囲が明確に分かれている
  [1-10][11-20][21-30][31-40]  ← 重なりなし

  図2（悪い例）: 同じ値範囲が複数パーティションに散在
  [1-15][5-25][15-35][25-40]  ← 多数の重なり
  ```

- **クラスタリング深度と試験の判断基準**:
  - **最もよくクラスタリングされている** = 深度が**最小（1に近い）** = マイクロパーティションの重なりが**最も少ない**図を選ぶ
  - Query ProfileでPartitions Scannedが多い → 深度が高い（クラスタリングが悪い）→ Q064参照

- **パーティションプルーニングとの関係**:
  - クラスタリング深度が低い（≈1）→ WHERE条件で不要パーティションを効率的に除外
  - クラスタリング深度が高い → 重なりが多く、多くのパーティションをスキャンしてしまう

## 1-3. 公式ドキュメントURL

- [Clustering Depth](https://docs.snowflake.com/en/user-guide/tables-clustering-micropartitions#label-clustering-depth)

---

## 2-1. 問題文（英語）

> Which of the following illustration represents the most well-clustered table?
>
> A. 3
> B. 4
> C. 1
> D. 2
>
> ※問題にはマイクロパーティションの重なり具合を示す4つの図が含まれる。図1は重なりが最も少なく（深度≈1）、図2〜4は重なりが増えていく

## 2-2. 問題文の文法解析

### 文1: "Which of the following illustration represents the most well-clustered table?"

- **疑問詞**: Which of the following illustration（以下の図のうちどれが）
- **動詞 (V)**: represents（表している）
- **目的語 (O)**: the most well-clustered table（最もよくクラスタリングされたテーブルを）
- **注目ポイント**: `the most well-clustered` = 「最もよくクラスタリングされた」。`well-clustered` は複合形容詞（`well` + 過去分詞）で状態の良好さを示す。最上級 `the most` で比較の頂点を問う

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| well-clustered | 複合形容詞 | よくクラスタリングされた | A well-clustered table has a depth of 1. |
| the most well-clustered | 最上級 | 最もよくクラスタリングされた | Which illustration shows the most well-clustered table? |
| illustration | 名詞 | 図・イラスト・挿絵 | Choose the illustration that shows the best clustering. |
| represent ~ | 動詞 | 〜を表す・〜を示す | The diagram represents clustering depth. |

## 2-3. 問題文（日本語）

> 以下の図のうち、最もよくクラスタリングされたテーブルを表しているものはどれですか？
>
> A. 3
> B. 4
> C. 1
> D. 2

---

## 3-1. 解説文（英語）

> For a populated table, the clustering depth is the average depth of overlapping micro-partitions for specific columns. The clustering depth starts at 1 (for a well-clustered table) and can be a larger number. If the average depth is smaller, the data for the specified columns are better clustered.

## 3-2. 解説文の文法解析

### 文1: "For a populated table, the clustering depth is the average depth of overlapping micro-partitions for specific columns."

- **修飾語**: For a populated table（データが格納されたテーブルについて）
- **主語 (S)**: the clustering depth（クラスタリング深度は）
- **補語 (C)**: the average depth of overlapping micro-partitions for specific columns（特定列のマイクロパーティション重なりの平均深度）
- **注目ポイント**: `populated table` = 「データが投入済みのテーブル」。`populated` = 「人口が多い・データが充填された」

### 文2: "The clustering depth starts at 1 (for a well-clustered table) and can be a larger number."

- **主語 (S)**: The clustering depth
- **動詞1**: starts at 1（1から始まる）← `start at ~` = 「〜から始まる・〜が最小値」
- **動詞2**: can be a larger number（より大きい数になることもある）
- **挿入句**: for a well-clustered table（よくクラスタリングされたテーブルの場合）
- **注目ポイント**: `start at 1` = 「1が最小値・出発点」。クラスタリング深度の下限が1であることを示す

### 文3: "If the average depth is smaller, the data for the specified columns are better clustered."

- **条件節**: If the average depth is smaller（平均深度が小さければ）← `smaller` は比較級で「より小さい = 1に近い」を意味
- **主節**: the data for the specified columns are better clustered（指定された列のデータはよりよくクラスタリングされている）
- **注目ポイント**: `smaller depth = better clustered` という逆相関の関係がこの問題の核心。「深度が小さい＝良い」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| populated table | 名詞句 | データが格納されたテーブル | Clustering depth is calculated for a populated table. |
| start at ~ | 動詞句 | 〜から始まる・〜が最小値 | Clustering depth starts at 1 for a well-clustered table. |
| overlapping | 形容詞 | 重なりあう・オーバーラップする | The average depth of overlapping micro-partitions. |
| better clustered | 比較表現 | よりよくクラスタリングされた | Smaller depth means data is better clustered. |

## 3-3. 解説文（日本語）

> データが格納されたテーブルにおいて、クラスタリング深度は特定列のマイクロパーティションの重なりの平均深度です。クラスタリング深度は1（よくクラスタリングされたテーブルの場合）から始まり、より大きな数値になることもあります。平均深度が小さければ、指定された列のデータはよりよくクラスタリングされています。

---

## 復習メモ

- [ ] クラスタリング深度の最小値は1（よくクラスタリングされたテーブル）であることを覚えた
- [ ] 「深度が小さい＝重なりが少ない＝よくクラスタリングされている」の逆相関を理解した
- [ ] Q064（Query ProfileでPartitions Scanned多い = クラスタリング悪い）と合わせて確認した
- [ ] `well-clustered`・`start at 1`・`populated table` の英語表現を確認した
- [ ] この問題は理論問題のためサンドボックス検証は不要
