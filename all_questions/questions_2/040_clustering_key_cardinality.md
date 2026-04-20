# 040: Clustering Key Cardinality

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-13
**正答**: False

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Clustering Key（クラスタリングキー） | テーブルのデータを物理的に整列させるために指定する列。パーティションプルーニングの効果を最大化し、クエリパフォーマンスを向上させる |
| Cardinality（カーディナリティ） | 列の重複しない値（distinct values）の数。低すぎても高すぎてもクラスタリングキーとして不適切 |
| Partition Pruning（パーティションプルーニング） | クエリ実行時にWHERE条件に合致しないマイクロパーティションをスキャン対象から除外する最適化技術 |
| Micro-Partition（マイクロパーティション） | Snowflakeがデータを内部的に分割する単位。50〜500MBの非圧縮データを含む。列の最小/最大値などのメタデータで管理される |
| Multi-Column Cluster Key | 複数の列を組み合わせたクラスタリングキー。列の順序が重要で、**低カーディナリティから高カーディナリティの順**に並べる |
| WHERE Clause（WHERE句） | SQLのフィルタ条件。クラスタリングキーの候補列は、WHERE句で頻繁に使われる列が第一候補 |

## 1-2. 重要コンセプトまとめ

- クラスタリングキーのカーディナリティは **「very low」ではダメ**
- 適切なカーディナリティのバランスが重要:
  - **低すぎ**（例: gender、2〜3値）→ パーティションプルーニングの効果が最小限
  - **高すぎ**（例: customer_id、数百万値）→ パーティション管理のオーバーヘッドが増大
  - **適切**: プルーニングが効き、かつ効率的にグループ化できるバランス
- クラスタリングキーの候補列の選び方:
  1. **WHERE句で頻繁に使われる列**（最優先）
  2. **JOINに使われる列**
  3. カーディナリティが適切な列
- **Multi-Column Cluster Key の列順序**: 低カーディナリティ → 高カーディナリティの順
- 順序を間違えるとクラスタリングの効果が低下する

## 1-3. 公式ドキュメントURL

- [Clustering Keys & Clustered Tables](https://docs.snowflake.com/en/user-guide/tables-clustering-keys)

---

## 2-1. 問題文（英語）

> True or False: When defining a clustering key, you should choose columns that have very low cardinality.
>
> A. True
> B. False

## 2-2. 問題文の文法解析

### 文1: "When defining a clustering key, you should choose columns that have very low cardinality."

- **主語 (S)**: you
- **動詞 (V)**: should choose
- **目的語 (O)**: columns
- **修飾語 (M)**: When defining a clustering key（分詞構文・条件）、that have very low cardinality（関係詞節 → columnsを修飾）
- **文型**: SVO
- **注目ポイント**: `When defining ~` は `When you are defining ~` の省略形（分詞構文）。`that have very low cardinality` は関係詞節で列の特性を限定。`very low` が「非常に低い」と強調しており、これがFalseのシグナル。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| define | verb | 定義する | When defining a clustering key. |
| cardinality | noun | カーディナリティ（一意値の数） | Columns with very low cardinality are poor choices. |
| clustering key | noun | クラスタリングキー | Choose appropriate columns for the clustering key. |

## 2-3. 問題文（日本語）

> 真か偽か: クラスタリングキーを定義する際、非常に低いカーディナリティを持つ列を選ぶべきである。
>
> A. 真
> B. 偽

---

## 3-1. 解説文（英語）

> When defining clustering keys, the initial candidate clustering columns are those columns that are frequently used in the WHERE clause or other selective filters.
>
> Additionally, columns that are used for joining can also be considered.
>
> Furthermore, the columns' cardinality (number of distinct values) is also important. It is crucial to choose a column with a high enough cardinality to allow effective partition pruning while having a low enough cardinality for Snowflake to group data into micro-partitions efficiently. A column with too few distinct values (e.g., gender) will result in minimal partition pruning. On the other hand, a column that has too many distinct values (e.g., customer id) will result in too much overhead when maintaining the partitions.
>
> Also, when creating a multi-column cluster key, order the columns from the lowest cardinality to the highest cardinality; otherwise, the effectiveness of clustering will be reduced.

## 3-2. 解説文の文法解析

### 文1: "When defining clustering keys, the initial candidate clustering columns are those columns that are frequently used in the WHERE clause or other selective filters."

- **主語 (S)**: the initial candidate clustering columns
- **動詞 (V)**: are
- **補語 (C)**: those columns that are frequently used in the WHERE clause or other selective filters
- **修飾語 (M)**: When defining clustering keys（分詞構文）
- **文型**: SVC
- **注目ポイント**: `those columns that ~` で「～であるような列」を指定。`are frequently used` の受動態で使用頻度を示す。

### 文2: "It is crucial to choose a column with a high enough cardinality to allow effective partition pruning while having a low enough cardinality for Snowflake to group data into micro-partitions efficiently."

- **主語 (S)**: It（形式主語）
- **動詞 (V)**: is
- **補語 (C)**: crucial
- **真主語**: to choose a column with a high enough cardinality to allow effective partition pruning while having a low enough cardinality for Snowflake to group data into micro-partitions efficiently
- **文型**: SVC（形式主語構文）
- **注目ポイント**: 非常に長い文。`high enough ~ to allow ~` と `while having a low enough ~ for ~ to ~` の2条件を同時に示す。「高すぎず低すぎず」というバランスが核心。

### 文3: "A column with too few distinct values (e.g., gender) will result in minimal partition pruning."

- **主語 (S)**: A column with too few distinct values
- **動詞 (V)**: will result in
- **目的語 (O)**: minimal partition pruning
- **文型**: SVO
- **注目ポイント**: `too few ~` は「少なすぎる～」。`result in ~` は「～という結果になる」。具体例 `(e.g., gender)` で補足。

### 文4: "On the other hand, a column that has too many distinct values (e.g., customer id) will result in too much overhead when maintaining the partitions."

- **主語 (S)**: a column that has too many distinct values
- **動詞 (V)**: will result in
- **目的語 (O)**: too much overhead
- **修飾語 (M)**: On the other hand（対比）、when maintaining the partitions（条件）
- **文型**: SVO
- **注目ポイント**: `On the other hand` で前文との対比。`too many` は `too few` の対。両極端がどちらも問題であることを示す。

### 文5: "Also, when creating a multi-column cluster key, order the columns from the lowest cardinality to the highest cardinality; otherwise, the effectiveness of clustering will be reduced."

- **主語 (S)**: （命令文のため省略 = you）
- **動詞 (V)**: order
- **目的語 (O)**: the columns
- **修飾語 (M)**: from the lowest cardinality to the highest cardinality（順序）、otherwise, the effectiveness of clustering will be reduced（否定帰結）
- **文型**: VO（命令文）
- **注目ポイント**: `from ~ to ~` で順序を指定。`; otherwise, ~` で「さもなければ」と警告。命令文 + otherwise は推奨事項を強く述べるパターン。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| candidate | adjective | 候補の | Initial candidate clustering columns. |
| selective filter | noun | 選択的フィルタ | Columns used in selective filters. |
| crucial | adjective | 極めて重要な | It is crucial to choose the right column. |
| result in ~ | phrase | ～という結果になる | Too few values result in minimal pruning. |
| overhead | noun | オーバーヘッド（余分な処理負荷） | Too many values cause too much overhead. |
| effectiveness | noun | 有効性、効果 | The effectiveness of clustering will be reduced. |

## 2-3. 問題文（日本語）

> 真か偽か: クラスタリングキーを定義する際、非常に低いカーディナリティを持つ列を選ぶべきである。
>
> A. 真
> B. 偽

---

## 3-3. 解説文（日本語）

> クラスタリングキーを定義する際、最初の候補列はWHERE句やその他の選択的フィルタで頻繁に使用される列です。
>
> さらに、JOINに使用される列も候補として考慮できます。
>
> また、列のカーディナリティ（一意値の数）も重要です。効果的なパーティションプルーニングを可能にするのに十分に高いカーディナリティを持ちながら、Snowflakeがデータを効率的にマイクロパーティションにグループ化できるほど十分に低いカーディナリティを持つ列を選ぶことが極めて重要です。一意値が少なすぎる列（例: gender）は、パーティションプルーニングの効果が最小限になります。一方で、一意値が多すぎる列（例: customer id）は、パーティションの管理時にオーバーヘッドが大きくなりすぎます。
>
> また、マルチカラムクラスターキーを作成する際は、列を最低カーディナリティから最高カーディナリティの順に並べてください。そうしないと、クラスタリングの効果が低下します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
