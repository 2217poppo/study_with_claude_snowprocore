# 110: Clustering Key — Multi-Column Order (Cardinality)

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-17
**正答**: D（最低カーディナリティから最高カーディナリティの順）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Clustering Key（クラスタリングキー） | マイクロパーティションのデータ整列に使用する列（または式）。WHERE句での絞り込みを効率化する |
| CLUSTER BY句 | テーブルのクラスタリングキーを定義するDDL構文。`ALTER TABLE t CLUSTER BY (col1, col2)` のように使う |
| Cardinality（カーディナリティ） | 列内の個別値の数。性別（Low）・都市（Medium）・顧客ID（High）などで表現する |
| Partition Pruning（パーティションプルーニング） | クエリ実行時に不要なマイクロパーティションをスキャンしないようにする最適化 |
| Micro-partition（マイクロパーティション） | Snowflakeの物理ストレージ単位。1パーティションは50〜500MB程度の圧縮前データに相当 |
| Multi-column Clustering Key（複合クラスタリングキー） | 複数列で構成されるクラスタリングキー。列の指定順序がパーティションプルーニングの効果に影響する |

## 1-2. 重要コンセプトまとめ

- **複合クラスタリングキーの列順は「低カーディナリティ → 高カーディナリティ」**
  - 例: `CLUSTER BY (region, city, customer_id)` ← region(低) → city(中) → customer_id(高)
  - 逆順にするとクラスタリングの効果が減少する
- **カーディナリティの基準**
  - 低すぎる（例: gender の 2値）→ パーティションプルーニングの効果が薄い
  - 高すぎる（例: customer_id の数百万値）→ マイクロパーティションのメンテナンスオーバーヘッドが大きい
  - 適切な範囲（例: 日付・地域・カテゴリ）が最適
- **クラスタリングキー列の選び方**
  1. WHERE句やJOIN条件で頻繁に使われる列
  2. 高カーディナリティすぎず、低カーディナリティすぎない列
  3. 複合キーは低カーディナリティ列を先頭に置く
- **順序が重要な理由**
  - Snowflakeは先頭の列から順にデータを整列するため、先頭に高カーディナリティ列を置くと粒度が細かくなりすぎる

## 1-3. 公式ドキュメントURL

- [Clustering Keys & Clustered Tables](https://docs.snowflake.com/en/user-guide/tables-clustering-keys)
- [Strategies for Selecting Clustering Keys](https://docs.snowflake.com/en/user-guide/tables-clustering-keys#strategies-for-selecting-clustering-keys)

---

## 2-1. 問題文（英語）

> When creating a clustering key with multiple columns, in what order should the columns be specified in the CLUSTER BY clause?
>
> A. Reverse alphabetical order.
> B. Alphabetical order.
> C. Highest cardinality to lowest cardinality.
> D. Lowest cardinality to highest cardinality.
> E. The order does not matter.

## 2-2. 問題文の文法解析

### 文1: "When creating a clustering key with multiple columns, in what order should the columns be specified in the CLUSTER BY clause?"

- **時間節**: When creating a clustering key with multiple columns（分詞構文・主語省略）
- **疑問副詞句**: in what order
- **助動詞**: should（推奨・義務）
- **主語 (S)**: the columns
- **動詞 (V)**: be specified（受動態）
- **場所の修飾語**: in the CLUSTER BY clause
- **文型**: 疑問文（助動詞倒置）
- **注目ポイント**: 
  - `When creating ~` = 〜を作成する際（分詞構文：主語はyouを省略）
  - `in what order` = どのような順序で（前置詞句が疑問詞を伴う）
  - `should ... be specified` = 指定されるべき（受動態の推奨表現）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| cardinality | 名詞 | カーディナリティ、個別値の数 | Columns with low cardinality should be listed first. |
| specify | 動詞 | 指定する | Specify columns in the CLUSTER BY clause. |
| reverse | 形容詞 | 逆の、反対の | Reverse alphabetical order would be Z to A. |
| clause | 名詞 | 句、節（SQL構文の一部） | Add the CLUSTER BY clause to the table definition. |

## 2-3. 問題文（日本語）

> 複数の列を使ってクラスタリングキーを作成する場合、CLUSTER BY句では列をどのような順序で指定すべきですか？
>
> A. 逆アルファベット順
> B. アルファベット順
> C. 高カーディナリティから低カーディナリティの順
> D. 低カーディナリティから高カーディナリティの順
> E. 順序は関係ない

---

## 3-1. 解説文（英語）

> When defining clustering keys, the initial candidate clustering columns are those columns that are frequently used in the WHERE clause or other selective filters. Additionally, columns that are used for joining can also be considered. Furthermore, the columns' cardinality (number of distinct values) is also important. It is crucial to choose a column with a high enough cardinality to allow effective partition pruning while having a low enough cardinality for Snowflake to group data into micro-partitions efficiently. A column with too few distinct values (e.g., gender) will result in minimal partition pruning. On the other hand, a column that has too many distinct values (e.g., customer id) will result in too much overhead when maintaining the partitions. When creating a multi-column cluster key, order the columns from the lowest cardinality to the higher cardinality; otherwise, the effectiveness of clustering will be reduced.
>
> https://docs.snowflake.com/en/user-guide/tables-clustering-keys

## 3-2. 解説文の文法解析

### 文1: "When defining clustering keys, the initial candidate clustering columns are those columns that are frequently used in the WHERE clause or other selective filters."

- **時間節**: When defining clustering keys（分詞構文）
- **主語 (S)**: the initial candidate clustering columns
- **動詞 (V)**: are
- **補語 (C)**: those columns that are frequently used in the WHERE clause or other selective filters
- **関係詞節**: that are frequently used in the WHERE clause or other selective filters
- **文型**: SVC
- **注目ポイント**: `those columns that ~` = 〜であるような列（those + 関係詞節で特定の集合を指示）

### 文2: "It is crucial to choose a column with a high enough cardinality to allow effective partition pruning while having a low enough cardinality for Snowflake to group data into micro-partitions efficiently."

- **形式主語**: It
- **動詞 (V)**: is crucial
- **真主語**: to choose a column ...（不定詞句）
- **修飾語1**: with a high enough cardinality to allow effective partition pruning
- **修飾語2**: while having a low enough cardinality for Snowflake to group data into micro-partitions efficiently
- **注目ポイント**: 
  - `high enough ... to allow` = 〜できるほど十分に高い（enough to 構文）
  - `for Snowflake to group` = Snowflakeがグループ化するために（for + 意味上の主語 + to不定詞）
  - `while having ~` = 一方で〜を持ちながら（対比の分詞構文）

### 文3: "When creating a multi-column cluster key, order the columns from the lowest cardinality to the higher cardinality; otherwise, the effectiveness of clustering will be reduced."

- **時間節**: When creating a multi-column cluster key
- **命令文主節**: order the columns from the lowest cardinality to the higher cardinality
- **接続副詞**: otherwise（さもなければ）
- **結果節**: the effectiveness of clustering will be reduced（受動態）
- **文型**: 命令文 + 独立節
- **注目ポイント**: 
  - `order the columns from A to B` = 列をAからBの順に並べる（orderが動詞）
  - `otherwise, ~ will be reduced` = さもなければ〜が低下する（警告表現）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| candidate | 名詞/形容詞 | 候補（の） | Candidate clustering columns are used in WHERE clauses. |
| selective filter | 名詞句 | 選択的フィルター | Use columns in selective filters as clustering keys. |
| partition pruning | 名詞句 | パーティションプルーニング | Effective partition pruning reduces scan cost. |
| overhead | 名詞 | オーバーヘッド、追加コスト | High cardinality causes too much overhead. |
| otherwise | 接続副詞 | さもなければ | Order columns correctly; otherwise, clustering is less effective. |
| effectiveness | 名詞 | 効果、有効性 | The effectiveness of clustering depends on column order. |

## 3-3. 解説文（日本語）

> クラスタリングキーを定義する際、最初に検討すべき候補列は、WHERE句や他の選択的フィルターで頻繁に使用される列です。さらに、JOINに使用される列も検討対象となります。加えて、列のカーディナリティ（個別値の数）も重要です。パーティションプルーニングを効果的に行えるほど高いカーディナリティを持ちながら、Snowflakeが効率的にデータをマイクロパーティションにグループ化できる程度の低さのカーディナリティを持つ列を選ぶことが重要です。個別値が少なすぎる列（例：性別）はパーティションプルーニングの効果が最小限になります。一方、個別値が多すぎる列（例：顧客ID）はパーティションのメンテナンスオーバーヘッドが大きくなります。複合クラスタリングキーを作成する場合は、低カーディナリティから高カーディナリティの順に列を並べてください。さもなければ、クラスタリングの効果が低下します。

---

## 復習メモ

- [ ] 複合クラスタリングキーの列順は「低カーディナリティ → 高カーディナリティ」を覚えた
- [ ] 適切なカーディナリティの基準（低すぎ・高すぎ両方が問題）を理解した
- [ ] `high enough ... to allow`（enough to 構文）と `otherwise, ~ will be reduced`（警告表現）を確認した
