# 097: Clustering Key — Cardinality Balance

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-06
**正答**: False

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Cardinality（カーディナリティ） | 列の重複しない値の数（distinct values）。クラスタリングキー選択の重要指標。**高すぎても低すぎても問題がある** |
| High Cardinality（高カーディナリティ） | 重複しない値が非常に多いカラム（例: customer_id）。クラスタリングキーとして使うと**パーティション管理のオーバーヘッドが増大** |
| Low Cardinality（低カーディナリティ） | 重複しない値が非常に少ないカラム（例: gender）。クラスタリングキーとして使うと**パーティションプルーニングが最小限**になる |
| Appropriate Cardinality（適切なカーディナリティ） | クラスタリングキーに最適な中間レベル。効果的なパーティションプルーニングを可能にし、かつマイクロパーティションへの効率的なグループ化もできる |
| Partition Pruning（パーティションプルーニング） | クエリ実行時に不要なマイクロパーティションをスキップする最適化。クラスタリングキーの適切なカーディナリティによって効果が左右される |
| Multi-Column Clustering Key（複合クラスタリングキー） | 複数列を組み合わせたクラスタリングキー。**カーディナリティの低い列から高い列の順**に並べることが推奨 |

## 1-2. 重要コンセプトまとめ

- **False = 「非常に高いカーディナリティ」は正解でない**: 適切なカーディナリティのバランスが重要
- **良いクラスタリングキーの条件**:
  1. WHEREクレーズや選択的フィルターで頻繁に使われる列
  2. JOIN条件に使われる列
  3. **カーディナリティが「適度に高く、適度に低い」バランス**
- **カーディナリティの問題**:
  - 低すぎる（例: gender = M/F のみ）→ パーティションプルーニングが最小限（ほとんどのパーティションを読む）
  - 高すぎる（例: customer_id = 数百万）→ パーティション管理のオーバーヘッドが過大
- **複合クラスタリングキーの列順**: **低カーディナリティ → 高カーディナリティ**の順（逆にすると効果が低下）
- **例**:
  - ❌ customer_id（高すぎる）
  - ❌ gender（低すぎる）
  - ✅ order_date（日付 = 適切）、region（地域 = 適切）

## 1-3. 公式ドキュメントURL

- [Clustering Keys & Clustered Tables](https://docs.snowflake.com/en/user-guide/tables-clustering-keys)

---

## 2-1. 問題文（英語）

> True or False: When defining a clustering key, you should choose columns that have very high cardinality.
>
> A. False
> B. True

## 2-2. 問題文の文法解析

### 文1: "When defining a clustering key, you should choose columns that have very high cardinality."

- **主語 (S)**: you
- **動詞 (V)**: should choose
- **目的語 (O)**: columns that have very high cardinality
- **従属節**: When defining a clustering key（分詞構文・時間）
- **文型**: SVO
- **注目ポイント**:
  - **"When defining ~"**: 「〜を定義するときに」。省略された分詞構文（= When you are defining a clustering key）
  - **"should choose"**: 「選ぶべき」。推奨・義務を示す助動詞。この文がFalseである = 「非常に高いカーディナリティの列を選ぶべき」は誤り
  - **"that have very high cardinality"**: 関係詞節が `columns` を修飾。`very high`（非常に高い）が問題のキーワード。「非常に高い」は実際には問題がある

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| cardinality | 名詞 | カーディナリティ（一意値の数） | Choose a column with appropriate cardinality for clustering. |
| define | 動詞 | 定義する | When defining a clustering key, balance is important. |
| column | 名詞 | 列、カラム | Some columns are better candidates for clustering keys. |

## 2-3. 問題文（日本語）

> 正誤問題：クラスタリングキーを定義するとき、非常に高いカーディナリティを持つ列を選ぶべきである。
>
> A. False（誤り）
> B. True（正しい）

---

## 3-1. 解説文（英語）

> When defining clustering keys, the initial candidate clustering columns are those columns that are frequently used in the WHERE clause or other selective filters. Additionally, columns that are used for joining can also be considered. Furthermore, the columns' cardinality (number of distinct values) is also important. It is crucial to choose a column with a high enough cardinality to allow effective partition pruning while having a low enough cardinality for Snowflake to group data into micro-partitions efficiently. A column with too few distinct values (e.g., gender) will result in minimal partition pruning. On the other hand, a column that has too many distinct values (e.g., customer id) will result in too much overhead when maintaining the partitions. When creating a multi-column cluster key, order the columns from the lowest cardinality to the higher cardinality; otherwise, the effectiveness of clustering will be reduced.

## 3-2. 解説文の文法解析

### 文1: "When defining clustering keys, the initial candidate clustering columns are those columns that are frequently used in the WHERE clause or other selective filters."

- **主語 (S)**: the initial candidate clustering columns
- **動詞 (V)**: are
- **補語 (C)**: those columns that are frequently used in the WHERE clause or other selective filters
- **文型**: SVC
- **注目ポイント**:
  - **"those columns that ~"**: 「〜な列」。`those` + 関係詞節で特定グループを指示する定番パターン。`S are those X that ~`（Sは〜なXである）
  - **"frequently used in the WHERE clause"**: 「WHERE節で頻繁に使われる」。受動態の形容詞的用法

### 文2: "It is crucial to choose a column with a high enough cardinality to allow effective partition pruning while having a low enough cardinality for Snowflake to group data into micro-partitions efficiently."

- **主語 (S)**: It（形式主語）
- **動詞 (V)**: is
- **補語 (C)**: crucial
- **真の主語**: to choose a column with a high enough cardinality to allow effective partition pruning while having a low enough cardinality for Snowflake to group data into micro-partitions efficiently
- **文型**: SVC（形式主語構文）
- **注目ポイント**:
  - **"It is crucial to ~"**: 「〜することが極めて重要である」。形式主語 `It` + `is crucial` + 真の主語（to不定詞）。`crucial`（極めて重要な）は `important` の強調形
  - **"high enough cardinality to allow ~"**: 「〜を許可するのに十分に高いカーディナリティ」。`enough` が形容詞の後に置かれる特殊語順（`high enough` ≠ `enough high`）。`enough ~ to do`（〜するのに十分な〜）の構造
  - **"while having a low enough cardinality"**: 「（一方で）低すぎないカーディナリティを持ちながら」。`while + 動名詞`（同時性を示す分詞構文）で対比条件を追加

### 文3: "On the other hand, a column that has too many distinct values (e.g., customer id) will result in too much overhead when maintaining the partitions."

- **主語 (S)**: a column that has too many distinct values
- **動詞 (V)**: will result in
- **目的語 (O)**: too much overhead
- **修飾語 (M)**: when maintaining the partitions（時間節）
- **文型**: SVO
- **注目ポイント**:
  - **"On the other hand"**: 「一方で」。前文（低カーディナリティ問題）と対比して高カーディナリティ問題を提示。試験解説の2項対比の定番接続表現
  - **"result in too much overhead"**: 「過大なオーバーヘッドをもたらす」。`result in ~`（〜という結果をもたらす）は原因→結果の関係を示す。`overhead`（オーバーヘッド）= パーティション管理の余分な負荷
  - **"when maintaining the partitions"**: 「パーティションを維持する際」。`when + 動名詞` の時間節

### 文4: "When creating a multi-column cluster key, order the columns from the lowest cardinality to the higher cardinality; otherwise, the effectiveness of clustering will be reduced."

- **主節の動詞 (V)**: order（命令形）
- **目的語 (O)**: the columns
- **修飾語 (M)**: from the lowest cardinality to the higher cardinality
- **帰結節**: otherwise, the effectiveness of clustering will be reduced
- **注目ポイント**:
  - **"order ~ from A to B"**: 「AからBの順に〜を並べる」。昇順で並べることを示す
  - **"otherwise"**: 「さもなければ・そうしないと」。命令に従わなかった場合の否定的帰結を導く接続副詞
  - **"the effectiveness of clustering will be reduced"**: 「クラスタリングの効果が低下する」。受動態の未来形で悪影響を示す

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| crucial | 形容詞 | 極めて重要な | It is crucial to choose the right cardinality. |
| overhead | 名詞 | オーバーヘッド（余分な負荷） | High cardinality results in too much overhead. |
| On the other hand | 接続表現 | 一方で | Low cardinality is bad. On the other hand, high is also bad. |
| otherwise | 接続副詞 | さもなければ | Order from low to high; otherwise, clustering is less effective. |
| result in ~ | 句動詞 | 〜という結果をもたらす | Too few distinct values will result in minimal pruning. |

## 3-3. 解説文（日本語）

> クラスタリングキーを定義するとき、最初の候補となるのはWHEREクレーズやその他の選択的フィルターで頻繁に使用される列です。また、JOINに使用される列も候補として考えられます。さらに、列のカーディナリティ（一意な値の数）も重要です。効果的なパーティションプルーニングを可能にするために十分に高いカーディナリティを持ちながら、Snowflakeがデータをマイクロパーティションに効率的にグループ化できるよう十分に低いカーディナリティも持つ列を選ぶことが極めて重要です。一意な値が少なすぎる列（例: gender）はパーティションプルーニングが最小限になります。一方、一意な値が多すぎる列（例: customer id）はパーティションの維持に過大なオーバーヘッドが発生します。複合クラスタリングキーを作成する際は、最低カーディナリティから高カーディナリティの順に列を並べてください。そうしないと、クラスタリングの効果が低下します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
