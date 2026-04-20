# 043: Search Optimization Service — Point Lookup Queries

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-02
**正答**: D（Selective point lookup queries）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Search Optimization Service（検索最適化サービス） | 特定パターンのクエリ（ポイントルックアップ・LIKE/正規表現・VARIANT列・地理空間）を高速化するSnowflakeのサービス。テーブルに追加のサーチアクセスパスを構築することで実現する |
| Point Lookup Query（ポイントルックアップクエリ） | 高選択性のフィルター（WHERE id = 12345 など）を使って、テーブルから1行〜数行のみを返すクエリ。Search Optimizationの主な対象 |
| Selective Filter（高選択性フィルター） | WHERE条件がテーブルの極めて少数の行にしか一致しない絞り込み。大テーブルから1件を取り出すようなクエリ |
| VARIANT列 | Snowflakeが半構造化データ（JSON・Avro等）を格納するデータ型。Search Optimizationは等値条件・IN・ARRAY_CONTAINS等でこの列の検索も最適化できる |
| GEOGRAPHY型 | 地理空間データを格納するSnowflakeのデータ型。Search Optimizationは特定の地理空間関数クエリも高速化する |
| Search Access Path（サーチアクセスパス） | Search Optimizationが構築する内部的なインデックス構造。テーブルとは独立して管理され、追加ストレージコストが発生する |

## 1-2. 重要コンセプトまとめ

- **Search Optimization Serviceが有効なクエリの4パターン（暗記推奨）**:
  1. **Point lookup queries** — 高選択性フィルターで1〜数行を返すクエリ（最重要）
  2. **Substring & RegEx検索** — `LIKE`, `ILIKE`, `RLIKE` を使うクエリ
  3. **VARIANT/OBJECT/ARRAY列のクエリ** — 等値条件・IN・ARRAY_CONTAINS・NULL チェック等
  4. **GEOGRAPHY値を使う地理空間クエリ** — 特定の地理空間関数

- **有効でないパターン（引っかけ）**:
  - 「1TB以上のテーブルへの任意のクエリ」→ 対象ではない（サイズ基準ではない）
  - 「全列・全行を取得するクエリ」→ 対象ではない（絞り込みがない）
  - 「列の一部にアクセスするクエリ」→ これはクラスタリングや列指向ストレージの特性であり、Search Optimizationとは別

- **クラスタリングとの違い**:
  - **クラスタリング**: 日付・IDなど範囲クエリのパーティションプルーニングに有効
  - **Search Optimization**: 特定値のピンポイント検索（ポイントルックアップ）に有効

- **コスト**: Search Optimizationを有効にすると追加のストレージコストが発生する（サーチアクセスパスのため）

## 1-3. 公式ドキュメントURL

- [Search Optimization Service](https://docs.snowflake.com/en/user-guide/search-optimization-service#understanding-the-search-optimization-service)

---

## 2-1. 問題文（英語）

> The Search Optimization service can be used to improve the performance of which type of queries?
>
> A. Queries that access a subset of a column in a table
> B. Any query performed on tables that have greater than 1TB of data
> C. Queries that access all columns & all rows
> D. Selective point lookup queries

## 2-2. 問題文の文法解析

### 文1: "The Search Optimization service can be used to improve the performance of which type of queries?"

- **主語 (S)**: The Search Optimization service（検索最適化サービスは）
- **動詞 (V)**: can be used（使用できる）← 助動詞 + 受動態
- **修飾語 (M1)**: to improve the performance（パフォーマンスを改善するために）← 目的の to 不定詞
- **修飾語 (M2)**: of which type of queries（どのタイプのクエリの）← 疑問詞句
- **文型**: SV（受動態）
- **注目ポイント**: `can be used to ~` = 「〜するために使用できる」。受動態 + 不定詞の組み合わせ

### 選択肢D: "Selective point lookup queries"

- **selective** = 「選択的な・高選択性の」。ここでは「絞り込みが非常に効いている」という意味
- **point lookup** = 「ポイントルックアップ」。特定の1点（値）を指定して検索すること

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| selective | 形容詞 | 選択的な、高選択性の | Selective filters return very few rows from a large table. |
| point lookup | 名詞句 | ポイントルックアップ（特定値の検索） | A query for a single customer ID is a point lookup. |
| subset | 名詞 | 部分集合、一部 | A subset of columns means not all columns are accessed. |
| greater than ~ | 比較表現 | 〜より大きい（= more than ~） | Tables with greater than 1TB of data. |

## 2-3. 問題文（日本語）

> Search Optimizationサービスはどのタイプのクエリのパフォーマンス改善に使用できますか？
>
> A. テーブル内の列の一部にアクセスするクエリ
> B. 1TBを超えるデータを持つテーブルに対して実行される任意のクエリ
> C. 全列・全行にアクセスするクエリ
> D. 選択的なポイントルックアップクエリ

---

## 3-1. 解説文（英語）

> The search optimization service can be used to improve the performance of
>
> Point lookup queries - return only one or a few rows using highly selective filters.
>
> Substring & RegEx searches – queries that use LIKE, ILIKE, & RLIKE
>
> Queries on fields in VARIANT, OBJECT & ARRAY columns – using equality conditions, IN, ARRAY_CONTAINS, ARRAY_OVERLAP, Substring & RegEx and NULL check conditions
>
> Queries that use specific geospatial functions with GEOGRAPHY values.

## 3-2. 解説文の文法解析

### 文1 (箇条書き1): "Point lookup queries - return only one or a few rows using highly selective filters."

- **主語 (省略)**: (Point lookup queries)
- **動詞 (V)**: return（返す）← ダッシュ以降は定義・説明として機能
- **目的語 (O)**: only one or a few rows（1行〜数行のみ）
- **修飾語 (M)**: using highly selective filters（高選択性フィルターを使用して）← 現在分詞句
- **注目ポイント**:
  - `highly selective` = 「非常に選択性が高い」。`selective` に `highly` を加えた強調形
  - `only one or a few` = 「1つまたは少数のみ」。「全部」の対義として少数を強調

### 文2 (箇条書き3): "Queries on fields in VARIANT, OBJECT & ARRAY columns – using equality conditions, IN, ARRAY_CONTAINS, ARRAY_OVERLAP, Substring & RegEx and NULL check conditions"

- **主語 (省略)**: (Search Optimization can improve)
- **目的語 (O)**: Queries on fields in VARIANT, OBJECT & ARRAY columns（VARIANT・OBJECT・ARRAY列のフィールドに対するクエリ）
- **修飾語 (M)**: using equality conditions...（等値条件・IN・…を使用する）← 現在分詞句で対象の絞り込み
- **注目ポイント**: `equality conditions` = `=` 演算子による等値比較。`NULL check` = IS NULL / IS NOT NULL 条件

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| highly selective | 形容詞句 | 非常に高選択性の | Highly selective filters narrow results to a few rows. |
| equality condition | 名詞句 | 等値条件（= による比較） | WHERE id = 123 is an equality condition. |
| geospatial | 形容詞 | 地理空間の | GEOGRAPHY values represent geospatial data. |
| NULL check | 名詞句 | NULL チェック（IS NULL / IS NOT NULL） | Search optimization supports NULL check conditions on VARIANT. |

## 3-3. 解説文（日本語）

> 検索最適化サービスは以下のパフォーマンス改善に使用できます：
>
> ポイントルックアップクエリ — 高選択性フィルターを使用して1行〜数行のみを返すクエリ
>
> 部分文字列・正規表現検索 — LIKE・ILIKE・RLIKE を使用するクエリ
>
> VARIANT・OBJECT・ARRAY列のフィールドに対するクエリ — 等値条件・IN・ARRAY_CONTAINS・ARRAY_OVERLAP・部分文字列/正規表現・NULLチェック条件を使用するもの
>
> GEOGRAPHY値を使った特定の地理空間関数を使用するクエリ

---

## 復習メモ

- [ ] Search Optimizationの4つの対象クエリタイプを列挙できる
- [ ] クラスタリング（範囲クエリ）とSearch Optimization（ポイントルックアップ）の使い分けを説明できる
- [ ] 英語の文法ポイント（highly selective / equality conditions / can be used to）を確認した
- [ ] この問題は機能の理論問題のためサンドボックス検証は不要
