# 035: Clustering Key — Join Columns as Candidates

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-12
**正答**: A（True）
**ユーザー回答**: B（False）— 不正解

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Clustering Key（クラスタリングキー） | テーブル内のデータの物理的な並びを最適化するために指定するカラム（群）。大規模テーブル（数TB〜）に特に有効。`CLUSTER BY` で定義する |
| Cardinality（カーディナリティ） | 列の重複しない値（distinct values）の数。クラスタリングキー選択の重要指標。**低すぎ（例: gender）→ プルーニング最小限、高すぎ（例: customer_id）→ 管理オーバーヘッド増大**。適切なバランスが必要 |
| Multi-Column Cluster Key（複合クラスタリングキー） | 複数列を組み合わせたクラスタリングキー。**低カーディナリティ → 高カーディナリティの順**に列を配置する。逆順では効果が低下する |
| Partition Pruning（パーティションプルーニング） | WHERE条件に合致しないマイクロパーティションをスキャン対象から除外する最適化。クラスタリングキーの効果を最大化する |
| Selective Filter（選択的フィルター） | WHERE句やJOIN条件など、クエリのデータ絞り込みに使われる条件。クラスタリングキーの候補となるカラムの主な使用場所 |

## 1-2. 重要コンセプトまとめ

- **クラスタリングキーの候補カラム（3つの基準）**:
  1. **WHERE句で頻繁に使用されるカラム** — 最も重要な候補（initial candidate）
  2. **JOIN句で使用されるカラム** — **追加の候補として考慮可能**（本問のポイント）
  3. **適切なカーディナリティのカラム** — 高すぎず低すぎず

- **カーディナリティの選択基準**:

| カーディナリティ | 例 | 問題点 |
|----------------|---|--------|
| **低すぎ** | gender（2値） | プルーニング効果が最小限 |
| **適切** | country, state, date | 効果的なプルーニング＋効率的なパーティション管理 |
| **高すぎ** | customer_id（数百万値） | パーティション管理のオーバーヘッド増大 |

- **複合クラスタリングキーの列順序**: **低カーディナリティ → 高カーディナリティ**の順に配置。逆順では効果が低下
  - ✅ `CLUSTER BY (country, city, customer_id)` — 低→高
  - ❌ `CLUSTER BY (customer_id, city, country)` — 高→低

- **ユーザーの誤り**: JOIN句のカラムはクラスタリングキーの候補にならないと思い込んだ。実際にはWHERE句が主要候補だが、**JOIN句のカラムも候補として考慮可能**
- **関連問題**: Q035（Clustering Keys基本）、Q097（Clustering Key Cardinality）、Q053（ALTER Clustering Key）

## 1-3. 公式ドキュメントURL

- [Clustering Keys & Clustered Tables](https://docs.snowflake.com/en/user-guide/tables-clustering-keys)

---

## 2-1. 問題文（英語）

> True or False: When defining a clustering key for a large table, consider using columns that are used frequently in join statements.
>
> A. True
> B. False

## 2-2. 問題文の文法解析

### 文1: "When defining a clustering key for a large table, consider using columns that are used frequently in join statements."

- **時間節 (M)**: When defining a clustering key for a large table（大規模テーブルのクラスタリングキーを定義する際に）
- **動詞 (V)**: consider（検討せよ）— 命令形
- **目的語 (O)**: using columns that are used frequently in join statements（JOIN文で頻繁に使用されるカラムの使用を）
- **文型**: VO（命令文）+ When分詞構文
- **注目ポイント**:
  - `consider using ~` — 「〜の使用を検討する」。`consider + 動名詞` の構文
  - `that are used frequently in join statements` — 関係詞節でカラムの条件を限定
  - `When defining ~` — 分詞構文。`When you define ~` の省略形

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| consider using ~ | verb phrase | 〜の使用を検討する | Consider using date columns for clustering. |
| cardinality | noun | カーディナリティ（一意な値の数） | Choose columns with appropriate cardinality. |
| distinct values | noun phrase | 一意な値、重複しない値 | The number of distinct values affects clustering. |
| overhead | noun | オーバーヘッド、管理負担 | Too many distinct values cause too much overhead. |

## 2-3. 問題文（日本語）

> True/False: 大規模テーブルのクラスタリングキーを定義する際、JOIN文で頻繁に使用されるカラムの使用を検討すべきである。
>
> A. True（正しい）
> B. False（誤り）

---

## 3-1. 解説文（英語）

> When defining clustering keys, the initial candidate clustering columns are those columns that are frequently used in the WHERE clause or other selective filters. Additionally, columns that are used for joining can also be considered. Furthermore, the columns' cardinality (number of distinct values) is also important. It is crucial to choose a column with a high enough cardinality to allow effective partition pruning while having a low enough cardinality for Snowflake to group data into micro-partitions efficiently. A column with too few distinct values (e.g., gender) will result in minimal partition pruning. On the other hand, a column that has too many distinct values (e.g., customer id) will result in too much overhead when maintaining the partitions. When creating a multi-column cluster key, order the columns from the lowest cardinality to the higher cardinality; otherwise, the effectiveness of clustering will be reduced.

## 3-2. 解説文の文法解析

### 文1: "When defining clustering keys, the initial candidate clustering columns are those columns that are frequently used in the WHERE clause or other selective filters."

- **時間節 (M)**: When defining clustering keys（クラスタリングキーを定義する際）
- **主語 (S)**: the initial candidate clustering columns（最初の候補となるクラスタリングカラムは）
- **動詞 (V)**: are（〜である）
- **補語 (C)**: those columns that are frequently used in the WHERE clause or other selective filters（WHERE句やその他の選択的フィルターで頻繁に使用されるカラムである）
- **文型**: SVC
- **注目ポイント**: `the initial candidate` — 「最初の候補」。WHERE句が第一候補であることを示す

### 文2: "Additionally, columns that are used for joining can also be considered."

- **接続副詞**: Additionally（さらに）
- **主語 (S)**: columns that are used for joining（結合に使用されるカラムも）
- **動詞 (V)**: can also be considered（検討できる）— 受動態
- **文型**: SV（受動態）
- **注目ポイント**: `Additionally` + `can also` — WHERE句が主候補で、JOIN句カラムは「追加の候補」であることを示す

### 文3: "It is crucial to choose a column with a high enough cardinality to allow effective partition pruning while having a low enough cardinality for Snowflake to group data into micro-partitions efficiently."

- **形式主語 (S)**: It
- **動詞 (V)**: is
- **補語 (C)**: crucial（重要である）
- **真の主語**: to choose a column with a high enough cardinality ... while having a low enough cardinality ...
- **文型**: SVC（形式主語構文）
- **注目ポイント**: `high enough ... while ... low enough` — 2つの相反する要件のバランスを示す

### 文4: "When creating a multi-column cluster key, order the columns from the lowest cardinality to the higher cardinality; otherwise, the effectiveness of clustering will be reduced."

- **時間節 (M)**: When creating a multi-column cluster key（複合クラスタリングキーを作成する際）
- **動詞 (V)**: order（並べよ）— 命令形
- **目的語 (O)**: the columns（カラムを）
- **修飾語 (M)**: from the lowest cardinality to the higher cardinality（最低のカーディナリティから高いカーディナリティへ）
- **結果節**: otherwise, the effectiveness of clustering will be reduced（さもなければクラスタリングの効果が低下する）
- **文型**: VO（命令文）+ otherwise結果節
- **注目ポイント**: `otherwise` — 「さもなければ」。列順序を間違えた場合の結果を警告

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| initial candidate | noun phrase | 最初の候補 | WHERE clause columns are the initial candidates. |
| additionally | adv | さらに、加えて | Additionally, join columns can be considered. |
| high enough ... while ... low enough | adj phrase | 十分に高い一方で十分に低い | Choose cardinality high enough for pruning while low enough for efficiency. |
| otherwise | adv | さもなければ | Order columns correctly; otherwise, effectiveness is reduced. |

## 3-3. 解説文（日本語）

> クラスタリングキーを定義する際、最初の候補となるカラムはWHERE句やその他の選択的フィルターで頻繁に使用されるカラムです。さらに、結合（JOIN）に使用されるカラムも候補として検討できます。また、カラムのカーディナリティ（一意な値の数）も重要です。効果的なパーティションプルーニングを可能にするほど十分に高いカーディナリティを持ちながら、Snowflakeが効率的にマイクロパーティションにデータをグループ化できるほど十分に低いカーディナリティのカラムを選ぶことが重要です。一意な値が少なすぎるカラム（例: gender）はパーティションプルーニングが最小限になります。一方、一意な値が多すぎるカラム（例: customer id）はパーティション管理のオーバーヘッドが大きくなります。複合クラスタリングキーを作成する際は、カラムを最低のカーディナリティから高いカーディナリティの順に並べてください。さもなければ、クラスタリングの効果が低下します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
