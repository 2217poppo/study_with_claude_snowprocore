# 100: Operations Using Metadata Cache (No Warehouse Required)

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-17
**正答**: A, B（MAX値の取得・行数カウント）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Metadata Cache | Cloud Services Layerが管理するキャッシュ。テーブルの行数、列の最大値・最小値、Null値数などのメタデータを保持する |
| Micro-partition Metadata | 各マイクロパーティションに関する統計情報。列ごとの値の範囲（max/min）、distinct値の数などが含まれる |
| Virtual Warehouse | クエリを実行するためのコンピュートリソース。メタデータキャッシュで解決できるクエリには不要 |
| COUNT(*) | テーブルの全行数を返す集計関数。メタデータから直接取得できるためウェアハウス不要 |
| MIN / MAX | 列の最小値・最大値を返す集計関数。数値列に対してはメタデータから直接取得できる |
| SUM / AVG | 合計・平均を返す集計関数。実際にデータを読み込む必要があるためウェアハウスが必要 |

## 1-2. 重要コンセプトまとめ

- **ウェアハウス不要のクエリ: COUNT、MIN、MAX（数値列に限る）**
  - これらはマイクロパーティションのメタデータに事前に格納されているため、データを読まなくて良い
- **ウェアハウスが必要なクエリ: SUM、AVG**
  - これらは全データを実際に読み込んで計算する必要がある
- **重要な例外: MIN/MAX は文字列列（characters only）の場合はメタデータキャッシュが使われない**
  - 文字列は範囲比較が数値より複雑なため、この例外を覚えておく
- **試験ポイント: COUNT(DISTINCT col) もウェアハウスが必要な場合がある**

## 1-3. 公式ドキュメントURL

- [Understanding Query Profile](https://docs.snowflake.com/en/user-guide/ui-query-profile)
- [Micro-partition Metadata](https://docs.snowflake.com/en/user-guide/tables-clustering-micropartitions#what-is-data-clustering)

---

## 2-1. 問題文（英語）

> Which of the following operations can be fulfilled without needing an active virtual warehouse? Select all that apply.
>
> A. Find the maximum value of a numeric column
> B. Count the number of rows in a table
> C. Find the total of a numeric column
> D. Find the average of a numeric column

## 2-2. 問題文の文法解析

### 文1: "Which of the following operations can be fulfilled without needing an active virtual warehouse?"

- **主語 (S)**: Which of the following operations
- **動詞 (V)**: can be fulfilled（受動態、助動詞 can + 受動態）
- **修飾語 (M)**: without needing an active virtual warehouse（前置詞句 + 動名詞）
- **文型**: SV（受動態）
- **注目ポイント**: 
  - `be fulfilled` = 満たされる、実行される（完了・充足の受動態）
  - `without needing ~` = 〜を必要とせずに（前置詞 + 動名詞）

### 各選択肢の構文

- A: `Find the maximum value of a numeric column`（最大値を見つける）
- B: `Count the number of rows in a table`（テーブルの行数を数える）
- C: `Find the total of a numeric column`（合計値を見つける）
- D: `Find the average of a numeric column`（平均値を見つける）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| fulfill | 動詞 | 満たす、実行する | This requirement can be fulfilled using metadata. |
| active | 形容詞 | 稼働中の | An active virtual warehouse is needed for complex queries. |
| numeric | 形容詞 | 数値の | The column contains numeric data. |
| maximum | 名詞/形容詞 | 最大値 | The maximum value is stored in micro-partition metadata. |

## 2-3. 問題文（日本語）

> 次のうち、稼働中の仮想ウェアハウスを必要とせずに実行できる操作はどれですか？すべて選んでください。
>
> A. 数値列の最大値を取得する
> B. テーブルの行数を数える
> C. 数値列の合計値を取得する
> D. 数値列の平均値を取得する

---

## 3-1. 解説文（英語）

> Snowflake stores information about micro-partitions in the metadata. It stores the range of column values in its metadata, which includes the maximum and minimum values for each column in each micro-partition. Snowflake also stores the count of distinct values for each column in the metadata and certain other information to optimize a query. Because this information is stored in the metadata cache, Snowflake does not have to read the data from the tables for specific queries; instead, it may retrieve the information it needs directly from the metadata. These queries include things like count queries and queries containing functions like MIN or MAX. The metadata cache will not be used if you execute MIN or MAX on a column containing only characters.

## 3-2. 解説文の文法解析

### 文1: "Snowflake stores information about micro-partitions in the metadata."

- **主語 (S)**: Snowflake
- **動詞 (V)**: stores
- **目的語 (O)**: information about micro-partitions
- **場所の修飾語 (M)**: in the metadata
- **文型**: SVO

### 文2: "It stores the range of column values in its metadata, which includes the maximum and minimum values for each column in each micro-partition."

- **主語 (S)**: It（= Snowflake）
- **動詞 (V)**: stores
- **目的語 (O)**: the range of column values
- **修飾語 (M)**: in its metadata
- **関係詞節**: which includes the maximum and minimum values ...（metadata を非制限用法で補足）
- **注目ポイント**: `which` による非制限関係詞節（コンマ + which）

### 文3: "Because this information is stored in the metadata cache, Snowflake does not have to read the data from the tables for specific queries; instead, it may retrieve the information it needs directly from the metadata."

- **理由節**: Because this information is stored in the metadata cache
- **主節**: Snowflake does not have to read the data from the tables for specific queries
- **対比の副節**: instead, it may retrieve the information it needs directly from the metadata
- **注目ポイント**: 
  - `does not have to ~` = 〜する必要がない（義務の否定）
  - `instead` = その代わりに（対比）
  - `it needs` は the information を修飾する関係詞節（that が省略）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| retrieve | 動詞 | 取得する、取り出す | Snowflake can retrieve count data from the metadata cache. |
| distinct | 形容詞 | 一意の、異なる | The metadata stores the count of distinct values. |
| optimize | 動詞 | 最適化する | This information helps Snowflake optimize queries. |
| range | 名詞 | 範囲 | The range of column values is stored as metadata. |

## 3-3. 解説文（日本語）

> Snowflakeはマイクロパーティションに関する情報をメタデータに格納します。各マイクロパーティションの各列の最大値・最小値など、列の値の範囲をメタデータに保持します。Snowflakeはクエリを最適化するために、各列のdistinct値のカウントやその他の情報もメタデータに格納します。この情報がメタデータキャッシュに格納されているため、特定のクエリではテーブルからデータを読み込む必要がなく、メタデータから直接必要な情報を取得できます。これには行数カウントクエリや、MINやMAXなどの関数を含むクエリが含まれます。ただし、文字のみの列でMINやMAXを実行した場合は、メタデータキャッシュは使用されません。

---

## 復習メモ

- [ ] ウェアハウス不要な操作（COUNT, MIN/MAX数値列）を理解した
- [ ] 文字列列ではMIN/MAXもキャッシュ不使用という例外を把握した
- [ ] "does not have to" と "cannot" の違いを確認した
