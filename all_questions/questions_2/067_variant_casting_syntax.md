# 067: VARIANT Casting Syntax

**SnowPro Core Domain**: Domain 3 — Data Loading, Unloading, and Connectivity
**作成日**: 2026-04-13
**正答**: SELECT col1:CustomerName::String

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| VARIANT Column | 半構造化データ（JSON等）を格納する列。コロン記法でフィールドにアクセスする |
| Colon Notation（コロン記法） | VARIANTカラムのJSONフィールドにアクセスする構文。`column:key` の形式 |
| Double Colon Cast（`::`キャスト） | Snowflakeのキャスト構文。`value::datatype` で型変換。CAST関数の代替 |
| CAST Function | SQL標準のキャスト関数。`CAST(value AS datatype)` の形式。VARIANTのフィールドアクセスとの組み合わせでは `::`キャストが推奨 |

## 1-2. 重要コンセプトまとめ

- VARIANT列のフィールドを型キャストする正しい構文:
  - **`col:field::datatype`** が正しい（コロン記法 + `::`キャスト）
  - 例: `col1:CustomerName::String`
- **CAST関数は不正解**: `CAST(col1:CustomerName AS String)` は構文的に正しくない場合がある
- 構文の分解:
  - `col1` — VARIANTカラム名
  - `:CustomerName` — JSONフィールドへのアクセス（コロン記法）
  - `::String` — String型へのキャスト（ダブルコロンキャスト）
- `WITH DATATYPE AS` はSnowflakeの構文ではない（ダミー選択肢）
- `::`キャストはSnowflakeで広く使われる簡潔な型変換構文

## 1-3. 公式ドキュメントURL

- [Casting Key Values](https://docs.snowflake.com/en/user-guide/semistructured-considerations#casting-key-values)

---

## 2-1. 問題文（英語）

> When processing semi-structured data into structured (i.e., a table), what is the correct way to cast a column into a data type?
>
> Assume the target column name is CustomerName, and the data type is String.
>
> A. SELECT CAST(col1:CustomerName AS String)
> B. SELECT col1:CustomerName::String
> C. SELECT col1 AS CustomerName WITH DATATYPE AS String

## 2-2. 問題文の文法解析

### 文1: "When processing semi-structured data into structured (i.e., a table), what is the correct way to cast a column into a data type?"

- **主語 (S)**: what
- **動詞 (V)**: is
- **補語 (C)**: the correct way to cast a column into a data type
- **修飾語 (M)**: When processing semi-structured data into structured（分詞構文）
- **文型**: SVC（疑問文）
- **注目ポイント**: `i.e.` は「すなわち」。`cast A into B` は「AをBに変換する」。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| cast | verb | キャストする（型変換） | Cast the column into String. |
| semi-structured | adjective | 半構造化の | Processing semi-structured data. |
| i.e. | abbreviation | すなわち | Structured (i.e., a table). |

## 2-3. 問題文（日本語）

> 半構造化データを構造化データ（つまりテーブル）に処理する際、列をデータ型にキャストする正しい方法は何ですか？
>
> 対象の列名はCustomerName、データ型はStringと仮定します。
>
> A. SELECT CAST(col1:CustomerName AS String)
> B. SELECT col1:CustomerName::String
> C. SELECT col1 AS CustomerName WITH DATATYPE AS String

---

## 3-1. 解説文（英語）

> \<json_column_name\>:\<intended_column_name\>::\<datatype\> is the correct way to cast when processing semi-structured data in a VARIANT column.
>
> Thus "SELECT col1:CustomerName::String" is the correct answer.

## 3-2. 解説文の文法解析

### 文1: "<json_column_name>:<intended_column_name>::<datatype> is the correct way to cast when processing semi-structured data in a VARIANT column."

- **主語 (S)**: \<json_column_name\>:\<intended_column_name\>::\<datatype\>
- **動詞 (V)**: is
- **補語 (C)**: the correct way to cast
- **修飾語 (M)**: when processing semi-structured data in a VARIANT column（条件）
- **文型**: SVC
- **注目ポイント**: 構文テンプレートを主語として使い、「正しい方法である」と定義。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| the correct way to ~ | phrase | ～する正しい方法 | The correct way to cast. |
| intended | adjective | 意図した | The intended column name. |

## 3-3. 解説文（日本語）

> `<JSONカラム名>:<対象カラム名>::<データ型>` がVARIANT列の半構造化データを処理する際のキャストの正しい方法です。
>
> したがって「SELECT col1:CustomerName::String」が正解です。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
