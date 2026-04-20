# 072: Semi-Structured Data — Accessing JSON Fields in VARIANT Column

**SnowPro Core Domain**: Domain 3 — Data Loading, Unloading, and Connectivity
**作成日**: 2026-04-03
**正答**: B（コロン記法 `json_data:date_extracted`）

> 関連問題: 028（External Tables）・050（Staged Data Sources）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| VARIANT（バリアント型） | JSONやXMLなどの半構造化データを格納できるSnowflakeの特殊なデータ型。1つのセルにオブジェクト・配列・スカラー値などを格納できる。最大サイズは16MB |
| Semi-structured Data（半構造化データ） | JSON・Avro・ORC・Parquet・XMLなど、固定スキーマを持たないデータ形式。Snowflakeは`VARIANT`型でネイティブサポート |
| Colon Notation（コロン記法） | VARIANTカラムのJSONフィールドにアクセスするSnowflake固有の構文。`column_name:field_name` の形式。SQLの標準構文ではなくSnowflake独自 |
| Dot Notation（ドット記法） | ネストされたオブジェクト・配列要素へのアクセスに使う。`json_data:organizations[0].Company` のように `:`（トップレベル）と `.`（ネスト）を組み合わせる |
| Relational Table（リレーショナルテーブル） | 行と列の形式で構造化されたデータを格納する通常のテーブル。半構造化データをフラット化してリレーショナルテーブルに変換するためにコロン記法などを使う |

## 1-2. 重要コンセプトまとめ

- **VARIANTカラムのJSONフィールドアクセス構文**:
  ```sql
  -- トップレベルフィールドへのアクセス
  SELECT json_data:date_extracted FROM my_json_table;

  -- ネストされたオブジェクトへのアクセス
  SELECT json_data:organizations[0]:Company FROM my_json_table;
  ```

- **コロン記法のポイント**:
  - `カラム名:フィールド名` の形式
  - フィールド名は**大文字・小文字を区別する**（`date_extracted` ≠ `DATE_EXTRACTED`）
  - 結果はVARIANT型で返るため、キャスト（`::DATE` など）が必要なことがある

- **不正解の選択肢の解説**:
  - 「VARIANTにロードされたデータにはアクセスできない」→ 誤り。VARIANTはアクセス可能
  - `extract(date_extracted from json_data)` → 誤り。`EXTRACT()` は日付/時刻の要素（年・月・日など）を取り出す関数。JSONフィールドへのアクセスには使わない

- **配列要素へのアクセス**（発展）:
  ```sql
  -- organizations配列の最初の要素のCompanyフィールド
  SELECT json_data:organizations[0]:Company FROM my_json_table;
  ```

- **試験のポイント**: VARIANT列のJSONアクセスは `column:field` のコロン記法。`EXTRACT(field FROM column)` と混同しないこと

## 1-3. 公式ドキュメントURL

- [Introduction to Semi-structured Data](https://docs.snowflake.com/en/user-guide/semistructured-intro)
- [Querying Semi-structured Data](https://docs.snowflake.com/en/user-guide/querying-semistructured)

---

## 2-1. 問題文（英語）

> Assume a table with the structure below, which you have already loaded with JSON data.
>
> ```sql
> CREATE TABLE my_json_table (
>   json_data VARIANT
> );
> ```
>
> The JSON data looks like following
>
> ```json
> {
>   "data_set": "organizations",
>   "date_extracted": "2019-12-10",
>   "organizations": [
>     {
>       "Company": "Netus Et Malesuada Industries",
>       "State": "VIC",
>       "OrganisationCode": "36783603099"
>     },
>     {
>       "Company": "Amet Luctus PC",
>       "State": "NSW",
>       "OrganisationCode": "37908951399"
>     }
>   ]
> }
> ```
>
> What is the correct way to access the "date_extracted" value to be loaded into a relational table?
>
> A. There is no way to access this data as the data has been loaded into a VARIANT column.
>
> B.
> ```sql
> SELECT
>   json_data:date_extracted
> FROM my_json_table;
> ```
>
> C.
> ```sql
> SELECT
>   extract(date_extracted from json_data)
> FROM my_json_table;
> ```

## 2-2. 問題文の文法解析

### 文1: "Assume a table with the structure below, which you have already loaded with JSON data."

- **命令形**: Assume（〜と仮定せよ）← 試験問題の前提設定パターン
- **目的語 (O)**: a table with the structure below（以下の構造を持つテーブルを）
- **非制限関係詞節**: which you have already loaded with JSON data（あなたがすでにJSONデータをロードした）← `which` が `a table` を先行詞にとる
- **注目ポイント**: `load ~ with JSON data` = 「〜にJSONデータをロードする」。`load` の目的語がテーブルで、`with` が内容を示す

### 文2: "What is the correct way to access the 'date_extracted' value to be loaded into a relational table?"

- **疑問詞**: What（何が）
- **補語 (C)**: the correct way（正しい方法）
- **不定詞1**: to access the "date_extracted" value（"date_extracted"の値にアクセスするための）← `way to do` = 「〜する方法」
- **不定詞2**: to be loaded into a relational table（リレーショナルテーブルにロードされるための）← `to be + 過去分詞` = 受動態の不定詞
- **注目ポイント**: `to be loaded into ~` = 「〜にロードされるための」。目的・意図を示す受動態の不定詞

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| load ~ with JSON data | 動詞句 | 〜にJSONデータをロードする | You have already loaded the table with JSON data. |
| the correct way to do | 名詞句 | 〜する正しい方法 | What is the correct way to access the value? |
| to be loaded into ~ | 受動態不定詞 | 〜にロードされるための | Values to be loaded into a relational table. |
| relational table | 名詞句 | リレーショナルテーブル・通常の表形式テーブル | Semi-structured data is flattened into a relational table. |

## 2-3. 問題文（日本語）

> 以下の構造を持つテーブルに、すでにJSONデータをロードしてあると仮定します。
>
> ```sql
> CREATE TABLE my_json_table (
>   json_data VARIANT
> );
> ```
>
> JSONデータの内容は以下のとおりです（省略）。
>
> リレーショナルテーブルにロードするために "date_extracted" の値にアクセスする正しい方法はどれですか？
>
> A. データがVARIANTカラムにロードされているため、このデータにアクセスする方法はない。
> B. `SELECT json_data:date_extracted FROM my_json_table;`
> C. `SELECT extract(date_extracted from json_data) FROM my_json_table;`

---

## 3-1. 解説文（英語）

> Please see the following link on performing queries on JSON data.
> https://docs.snowflake.com/en/user-guide/semistructured-intro

## 3-2. 解説文の文法解析

解説文はURLのみの参照案内のため、文法解析は問題文の補足として以下を記載する。

### コロン記法の説明（補足）

`json_data:date_extracted` の構造:

- `json_data` — VARIANTカラム名
- `:` — JSONフィールドへのアクセス演算子（Snowflake固有）
- `date_extracted` — JSONオブジェクト内のフィールド名

### `EXTRACT()` 関数との違い

- `EXTRACT(part FROM date_value)` = 日付・時刻値から要素（YEAR/MONTH/DAY等）を抽出するSQL標準関数
- `column:field` = VARIANTカラムのJSONフィールドにアクセスするSnowflake固有のコロン記法

この2つは全く別の目的で使われる。混同しないこと。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| perform queries on ~ | 動詞句 | 〜に対してクエリを実行する | Performing queries on JSON data in VARIANT columns. |
| colon notation | 名詞句 | コロン記法 | Use colon notation to access JSON fields: `col:field`. |

## 3-3. 解説文（日本語）

> JSONデータに対してクエリを実行する方法については、以下のリンクを参照してください。

**補足説明**: Snowflakeでは、VARIANTカラムに格納されたJSONのフィールドにアクセスするには、`カラム名:フィールド名` のコロン記法（Snowflake固有）を使います。SQLの `EXTRACT()` 関数は日付・時刻要素の抽出用であり、JSONアクセスには使えません。

---

## 復習メモ

- [ ] VARIANTカラムのJSONフィールドアクセスは `column:field` のコロン記法であることを覚えた
- [ ] `EXTRACT()` 関数は日付/時刻用であり、JSONアクセスには使わないことを区別できた
- [ ] ネストされた要素へのアクセス（`json_data:organizations[0]:Company`）も確認した
- [ ] `load ~ with JSON data`・`to be loaded into ~` の英語パターンを確認した
- [ ] サンドボックスで `SELECT json_data:date_extracted FROM my_json_table` を試すことができる
