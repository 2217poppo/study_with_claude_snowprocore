# 062: Partition Pruning — Micro-Partition Optimization

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-03
**正答**: C（Partition pruning）

> 関連問題: 035（Clustering Keys）・048（Query Result Cache Conditions）・053（ALTER Clustering Key）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Partition Pruning（パーティションプルーニング） | クエリ実行時に、WHERE条件に合致しないマイクロパーティションをスキャン対象から除外する最適化技術。スキャン量を減らしてパフォーマンスを向上させる |
| Micro-Partition（マイクロパーティション） | Snowflakeがテーブルデータを内部的に分割して保存する単位（50〜500MB非圧縮）。データが書き込まれた順序でパーティションが作られる |
| Columnar Storage（列指向ストレージ） | データを列単位で保存する方式。Snowflakeのマイクロパーティション内はこの形式で格納される |
| Metadata（メタデータ） | マイクロパーティションごとの最大値・最小値・行数などの統計情報。Cloud Services Layerが管理し、Pruningの判断に使われる |
| Keep track of（追跡する） | Snowflakeが各マイクロパーティションの値範囲のメタデータを管理すること |

## 1-2. 重要コンセプトまとめ

- **Partition Pruningの仕組み**:
  1. Snowflakeは各マイクロパーティションの**列ごとの最大値・最小値**をメタデータとして管理
  2. クエリのWHERE条件とメタデータを照合
  3. 条件に合致しないパーティションは**スキャンしない**（除外）
  4. → スキャン量が減り、クエリが高速化

- **例**:
  ```
  WHERE event_date = '2026-01-15'
  
  パーティション1: 2025-01-01 〜 2025-12-31 → 除外（範囲外）
  パーティション2: 2026-01-01 〜 2026-03-31 → スキャン（範囲内）
  パーティション3: 2026-04-01 〜 2026-06-30 → 除外（範囲外）
  ```

- **クラスタリングキーとの関係**（035・053と関連）:
  - クラスタリングキーを設定すると、関連データが同じパーティションにまとまる
  - → Pruningの効果が最大化される
  - クラスタリングなしでも自然なPruningは起きるが、効果は限定的

- **試験の引っかけ選択肢の解説**:
  - `Predicate optimization` → 実在する概念だが、Snowflakeの公式用語ではない
  - `WHERE clause optimization` → より広い概念。Pruningはその一部
  - `RNDO` → 存在しない造語

## 1-3. 公式ドキュメントURL

- [Micro-partitions & Data Clustering — Query Pruning](https://docs.snowflake.com/en/user-guide/tables-clustering-micropartitions#query-pruning)

---

## 2-1. 問題文（英語）

> Snowflake can eliminate unneeded partitions while executing a query. What is the name given to this optimization technique?
>
> A. Retrieve needed data only (RNDO)
> B. Predicate optimization
> C. Partition pruning
> D. WHERE clause optimization

## 2-2. 問題文の文法解析

### 文1: "Snowflake can eliminate unneeded partitions while executing a query."

- **主語 (S)**: Snowflake
- **助動詞**: can（〜できる）
- **動詞 (V)**: eliminate（除外する・排除する）
- **目的語 (O)**: unneeded partitions（不要なパーティションを）← `unneeded` = 「不要な」（un- + needed）
- **時間節**: while executing a query（クエリを実行している間に）← `while + 動名詞` = 同時進行
- **注目ポイント**: `eliminate` = 「完全に取り除く・排除する」。`remove` より強い除去のニュアンス

### 文2: "What is the name given to this optimization technique?"

- **疑問文**: What is the name ~?（名前は何ですか）
- **修飾語**: given to this optimization technique（この最適化技術に付けられた）← 過去分詞後置修飾
- **注目ポイント**: `the name given to ~` = 「〜に付けられた名前」。`give a name to ~` = 「〜に名前をつける」の受動態的な後置修飾

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| eliminate | 動詞 | 排除する・除外する（完全に取り除く） | Pruning eliminates unneeded micro-partitions. |
| unneeded | 形容詞 | 不要な（= unnecessary） | Unneeded partitions are eliminated during the query. |
| while + 動名詞 | 接続詞句 | 〜している間に | Snowflake prunes partitions while executing a query. |
| the name given to ~ | 名詞句 | 〜に付けられた名前 | What is the name given to this technique? |
| optimization technique | 名詞句 | 最適化技術 | Partition pruning is an optimization technique. |

## 2-3. 問題文（日本語）

> Snowflakeはクエリを実行している間、不要なパーティションを除外できます。この最適化技術の名前は何ですか？
>
> A. Retrieve needed data only (RNDO)
> B. Predicate optimization（述語最適化）
> C. Partition pruning（パーティションプルーニング）
> D. WHERE clause optimization（WHERE句最適化）

---

## 3-1. 解説文（英語）

> Snowflake stores data in small partitions known as micro-partitions. Data in Snowflake tables is mapped to individual micro-partitions and structured in a columnar manner. Micro-partitions are added to a table in the order in which the data is received. Additional micro-partitions are produced when data is added to a table. Because the column values are scattered across numerous micro-partitions, Snowflake must keep track of what range of data is kept in which micro-partitions for each column. This metadata enables Snowflake to eliminate unnecessary micro-partitions when running queries, boosting performance. This process of eliminating micro-partitions is also known as partition pruning.

## 3-2. 解説文の文法解析

### 文1: "Snowflake stores data in small partitions known as micro-partitions."

- **主語 (S)**: Snowflake
- **動詞 (V)**: stores（保存する）
- **目的語 (O)**: data
- **修飾語**: in small partitions known as micro-partitions（マイクロパーティションと呼ばれる小さなパーティションに）← `known as ~` = 後置修飾「〜として知られる」
- **注目ポイント**: `known as ~` = 「〜として知られる」。定義・別名の紹介に使う後置修飾パターン（be known as の分詞構文）

### 文2: "Micro-partitions are added to a table in the order in which the data is received."

- **主語 (S)**: Micro-partitions
- **動詞 (V)**: are added（追加される）← 受動態
- **修飾語**: in the order in which the data is received（データが受け取られた順序で）← `in the order in which ~` = 「〜した順序で」
- **注目ポイント**: `in the order in which ~` = 「〜する順序で」。`in which` は前置詞 + 関係代名詞の形式。`in the order that ~` と同義

### 文3: "Because the column values are scattered across numerous micro-partitions, Snowflake must keep track of what range of data is kept in which micro-partitions for each column."

- **理由節**: Because the column values are scattered across numerous micro-partitions（列の値が多数のマイクロパーティションに分散しているため）← `be scattered across ~` = 「〜全体に散らばっている」
- **主語 (S)**: Snowflake
- **動詞 (V)**: must keep track of（〜を追跡しなければならない）
- **目的語 (O)**: what range of data is kept in which micro-partitions for each column（各列においてどのマイクロパーティションにどの範囲のデータが保存されているか）← 間接疑問文
- **注目ポイント**: `be scattered across ~` = 「〜全体に分散している」。`keep track of ~` = 「〜を追跡・管理する」

### 文4: "This metadata enables Snowflake to eliminate unnecessary micro-partitions when running queries, boosting performance."

- **主語 (S)**: This metadata（このメタデータが）
- **動詞 (V)**: enables（〜を可能にする）
- **目的語**: Snowflake to eliminate unnecessary micro-partitions（Snowflakeが不要なマイクロパーティションを除外することを）← `enable O to do`
- **時間節**: when running queries（クエリを実行するとき）
- **付帯状況**: boosting performance（パフォーマンスを向上させながら）← 分詞構文（結果）
- **注目ポイント**: `enable O to do` = 「OがするのをOKにする」。`boosting performance` は結果を示す分詞構文

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| known as ~ | 後置修飾 | 〜として知られる | Small partitions known as micro-partitions. |
| be scattered across ~ | 受動態熟語 | 〜全体に分散している | Column values are scattered across micro-partitions. |
| keep track of ~ | 熟語 | 〜を追跡する・管理する | Snowflake keeps track of data ranges per partition. |
| enable O to do | 熟語 | OがするのをOKにする | Metadata enables Snowflake to eliminate partitions. |
| boosting performance | 分詞構文 | パフォーマンスを向上させながら（結果） | Pruning eliminates partitions, boosting performance. |
| in the order in which ~ | 関係詞句 | 〜する順序で | Partitions are added in the order in which data arrives. |

## 3-3. 解説文（日本語）

> Snowflakeはマイクロパーティションと呼ばれる小さなパーティションにデータを保存します。Snowflakeテーブル内のデータは個別のマイクロパーティションにマッピングされ、列指向の形式で構造化されます。マイクロパーティションはデータが受け取られた順序でテーブルに追加されます。テーブルにデータが追加されると、追加のマイクロパーティションが生成されます。列の値が多数のマイクロパーティションに分散しているため、Snowflakeは各列においてどのマイクロパーティションにどの範囲のデータが保存されているかを追跡しなければなりません。このメタデータにより、Snowflakeはクエリ実行時に不要なマイクロパーティションを除外してパフォーマンスを向上させることができます。このマイクロパーティションを除外するプロセスはパーティションプルーニングとも呼ばれます。

---

## 復習メモ

- [ ] Partition Pruningの仕組み（メタデータで値範囲を管理→条件外パーティションを除外）を説明できる
- [ ] クラスタリングキーがPruningを最大化することを理解した
- [ ] `be scattered across ~`・`keep track of ~`・`enable O to do`・`known as ~` の英語パターンを確認した
- [ ] この問題は理論問題のためサンドボックス検証は不要
