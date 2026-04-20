# 053: VARIANT JSON Storage

**SnowPro Core Domain**: Domain 3 — Data Loading, Unloading, and Connectivity
**作成日**: 2026-04-13
**正答**: VARIANT

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| VARIANT | JSONやXML等の半構造化データを格納できるSnowflakeの特殊データ型。任意のデータ構造を保存可能。最大16MB |
| Semi-structured Data（半構造化データ） | JSON・Avro・ORC・Parquet・XMLなど、固定スキーマを持たないデータ形式。SnowflakeはVARIANT型でネイティブサポート |
| JSON (JavaScript Object Notation) | キーと値のペアで構成される軽量データ交換フォーマット。API連携やログデータで広く使用される |
| VARCHAR | 可変長文字列型。JSON文字列を保存はできるが、フィールドへの直接アクセスやクエリには不向き |
| VARBINARY | 可変長バイナリデータ型。テキストではなくバイナリデータ用 |

## 1-2. 重要コンセプトまとめ

- JSONデータの格納には **VARIANT型** を使用する
- VARIANTの利点:
  - **任意のデータ構造**（オブジェクト・配列・スカラー値）を格納可能
  - **SQLで直接アクセス**可能（コロン記法: `column:key`）
  - スキーマ変更に柔軟に対応
- VARCHARにJSONを文字列として保存することも可能だが:
  - フィールドへの直接アクセスができない
  - PARSE_JSON関数で変換が必要
  - パフォーマンスが劣る
- VARBINARYはバイナリデータ用であり、JSONには不適切
- STRINGはVARCHARのエイリアスであり、同じ制約がある

## 1-3. 公式ドキュメントURL

- [Introduction to Semi-structured Data](https://docs.snowflake.com/en/user-guide/semistructured-intro)

---

## 2-1. 問題文（英語）

> You are required to store JSON data in a Snowflake table. Which data type will you use?
>
> A. VARBINARY
> B. VARCHAR
> C. STRING
> D. VARIANT

## 2-2. 問題文の文法解析

### 文1: "You are required to store JSON data in a Snowflake table."

- **主語 (S)**: You
- **動詞 (V)**: are required（受動態）
- **修飾語 (M)**: to store JSON data in a Snowflake table（目的の不定詞）
- **文型**: SV（受動態）
- **注目ポイント**: `are required to ~` は「～することが求められている」。シナリオ提示の定番パターン。

### 文2: "Which data type will you use?"

- **主語 (S)**: you
- **動詞 (V)**: will use
- **目的語 (O)**: Which data type
- **文型**: SVO（疑問文）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| store | verb | 格納する、保存する | Store JSON data in a VARIANT column. |
| data type | noun | データ型 | VARIANT is the appropriate data type. |
| semi-structured | adjective | 半構造化の | JSON is a semi-structured format. |

## 2-3. 問題文（日本語）

> SnowflakeテーブルにJSONデータを格納する必要があります。どのデータ型を使用しますか？
>
> A. VARBINARY
> B. VARCHAR
> C. STRING
> D. VARIANT

---

## 3-1. 解説文（英語）

> Snowflake supports loading and processing semi-structured data. Snowflake provides the VARIANT data type, which can store any data and is appropriate for semi-structured data input and querying. SQL may be used to read and navigate JSON data once it has been loaded into a VARIANT column.

## 3-2. 解説文の文法解析

### 文1: "Snowflake supports loading and processing semi-structured data."

- **主語 (S)**: Snowflake
- **動詞 (V)**: supports
- **目的語 (O)**: loading and processing semi-structured data（動名詞の並列）
- **文型**: SVO

### 文2: "Snowflake provides the VARIANT data type, which can store any data and is appropriate for semi-structured data input and querying."

- **主語 (S)**: Snowflake
- **動詞 (V)**: provides
- **目的語 (O)**: the VARIANT data type
- **修飾語 (M)**: which can store any data and is appropriate for ~（非制限的関係詞節）
- **文型**: SVO
- **注目ポイント**: `which` 以下でVARIANTの2つの特性（任意データ格納 + 半構造化データに適切）を説明。

### 文3: "SQL may be used to read and navigate JSON data once it has been loaded into a VARIANT column."

- **主語 (S)**: SQL
- **動詞 (V)**: may be used（受動態）
- **修飾語 (M)**: to read and navigate JSON data（目的）、once it has been loaded into a VARIANT column（条件）
- **文型**: SV（受動態）
- **注目ポイント**: `once ~ has been loaded` は「一旦ロードされると」。`navigate` はJSONの階層構造をたどる操作。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| appropriate for ~ | phrase | ～に適切な | VARIANT is appropriate for semi-structured data. |
| navigate | verb | ナビゲートする、探索する | Navigate JSON data using SQL. |
| once ~ has been loaded | phrase | 一旦ロードされると | Once loaded into a VARIANT column. |

## 3-3. 解説文（日本語）

> Snowflakeは半構造化データのロードと処理をサポートしています。SnowflakeはVARIANTデータ型を提供しており、あらゆるデータを格納でき、半構造化データの入力とクエリに適しています。VARIANT列にロードされた後は、SQLを使ってJSONデータの読み取りやナビゲーションが可能です。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
