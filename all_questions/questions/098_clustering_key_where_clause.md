# 098: Clustering Key — WHERE Clause Columns

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-06
**正答**: True

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Clustering Key（クラスタリングキー） | テーブルのマイクロパーティションをどの列に基づいて整理するかを定義するキー。クエリパフォーマンスの向上を目的として大規模テーブルに設定する |
| WHERE Clause（WHERE節） | SELECTクエリでデータをフィルタリングする条件節。WHERE節で頻繁に使われる列はクラスタリングキーの有力な候補となる |
| Selective Filter（選択的フィルター） | 返される行数を絞り込むフィルター条件。パーティションプルーニングを効果的に機能させるための条件 |
| Initial Candidate Columns（初期候補列） | クラスタリングキーを定義する際にまず検討すべき列群。WHERE節や選択的フィルターで頻繁に使われる列、JOIN条件に使われる列が該当する |

## 1-2. 重要コンセプトまとめ

- **True = WHERE節の頻繁使用列は良い候補**: クラスタリングキーの第一の選定基準はWHERE節での使用頻度
- **クラスタリングキー選定の3条件**:
  1. **WHERE節や選択的フィルターで頻繁に使われる列**（本問のポイント）
  2. JOIN条件に使われる列
  3. 適切なカーディナリティを持つ列（Q097で学習）
- **大規模テーブルに有効**: 問題文に "for a large table" とある通り、クラスタリングは大規模テーブルで特に効果を発揮する
- **Q097との対比**:
  - Q097: 「非常に高いカーディナリティ」の列を選ぶべき？→ **False**（バランスが重要）
  - Q098: 「WHERE節で頻繁に使われる列」を考慮すべき？→ **True**（正しい選定基準）
- **パーティションプルーニングとの関係**: WHERE節の条件列がクラスタリングキーと一致することで、不要なマイクロパーティションをスキップできる

## 1-3. 公式ドキュメントURL

- [Clustering Keys & Clustered Tables](https://docs.snowflake.com/en/user-guide/tables-clustering-keys)

---

## 2-1. 問題文（英語）

> True or False: When defining a clustering key for a large table, consider using columns frequently used in WHERE clauses.
>
> A. False
> B. True

## 2-2. 問題文の文法解析

### 文1: "When defining a clustering key for a large table, consider using columns frequently used in WHERE clauses."

- **主節の動詞 (V)**: consider（命令形）
- **目的語 (O)**: using columns frequently used in WHERE clauses（動名詞句）
- **従属節**: When defining a clustering key for a large table（分詞構文・時間）
- **文型**: VO（命令文）
- **注目ポイント**:
  - **"consider using ~"**: 「〜を使うことを検討する・考慮する」。`consider + 動名詞`（`consider + to不定詞` は誤り。`consider` の目的語は動名詞のみ）。命令形で使われることで推奨事項を示す
  - **"for a large table"**: 「大規模テーブルに対して」。クラスタリングの適用対象を限定する修飾語。小さいテーブルではクラスタリングの恩恵が少ない
  - **"columns frequently used in WHERE clauses"**: 「WHERE節で頻繁に使われる列」。`frequently used` は過去分詞の形容詞的用法で `columns` を後置修飾。`frequently`（頻繁に）が重要な条件を示す副詞

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| consider | 動詞 | 考慮する、検討する | Consider using date columns for clustering keys. |
| frequently | 副詞 | 頻繁に | Columns frequently used in WHERE clauses are good candidates. |
| define | 動詞 | 定義する | When defining a clustering key, think about query patterns. |

## 2-3. 問題文（日本語）

> 正誤問題：大規模テーブルのクラスタリングキーを定義するとき、WHERE節で頻繁に使われる列を使うことを検討すべきである。
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
  - **"the initial candidate clustering columns"**: 「最初の候補となるクラスタリング列」。名詞を複数の形容詞（`initial`・`candidate`・`clustering`）が連鎖修飾する技術文書の定番パターン
  - **"those columns that are frequently used in ~"**: `those + 名詞 + that節`（〜なXである）で特定グループを明示。Q097でも登場したパターン
  - **"the WHERE clause or other selective filters"**: `or` で同等の2つを並列。「WHEREクレーズまたはその他の選択的フィルター」

### 文2: "Additionally, columns that are used for joining can also be considered."

- **主語 (S)**: columns that are used for joining
- **動詞 (V)**: can also be considered（受動態）
- **文型**: SV（受動態）
- **注目ポイント**:
  - **"Additionally"**: 「さらに・加えて」。前文（WHERE節の列）に追加情報（JOIN列）を導く接続副詞。`Furthermore` と同義
  - **"can also be considered"**: 「候補として考えることもできる」。`can + also + 受動態` で「追加的に可能な選択肢」を示す穏やかな推奨

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| initial candidate | 名詞句 | 最初の候補 | The initial candidate columns are those used in WHERE clauses. |
| Additionally | 接続副詞 | さらに、加えて | Additionally, JOIN columns can be considered. |
| selective filter | 名詞句 | 選択的フィルター | Columns in selective filters are good clustering candidates. |

## 3-3. 解説文（日本語）

> クラスタリングキーを定義するとき、最初の候補となるクラスタリング列は、WHERE節やその他の選択的フィルターで頻繁に使用される列です。さらに、JOINに使用される列も候補として考えることができます。また、列のカーディナリティ（一意な値の数）も重要です。効果的なパーティションプルーニングを可能にするのに十分に高いカーディナリティを持ちながら、Snowflakeがデータをマイクロパーティションに効率的にグループ化できるよう十分に低いカーディナリティを持つ列を選ぶことが極めて重要です。一意な値が少なすぎる列（例: gender）はパーティションプルーニングが最小限になります。一方、一意な値が多すぎる列（例: customer id）はパーティションの維持に過大なオーバーヘッドが発生します。複合クラスタリングキーを作成する際は、最低カーディナリティから高カーディナリティの順に列を並べてください。そうしないと、クラスタリングの効果が低下します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
