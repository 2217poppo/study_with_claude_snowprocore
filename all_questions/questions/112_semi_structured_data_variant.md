# 112: Semi-Structured Data — VARIANT Type Support

**SnowPro Core Domain**: Domain 3 — Data Loading and Transformation
**作成日**: 2026-04-06
**正答**: False

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Semi-Structured Data（半構造化データ） | JSON・Avro・ORC・Parquet・XMLなど、固定スキーマを持たないデータ形式。Snowflakeは**完全サポート**。VARIANTデータ型でネイティブに格納・クエリできる |
| VARIANT（バリアント型） | Snowflakeの特殊なデータ型。JSONやXMLなどの半構造化データを格納できる。1つのセルにオブジェクト・配列・スカラー値などを格納でき、最大16MB。**半構造化データのロードに適した**データ型 |
| JSON（JavaScript Object Notation） | 半構造化データの代表的なフォーマット。SnowflakeのVARIANT列にロードし、SQLでナビゲート・クエリできる |

## 1-2. 重要コンセプトまとめ

- **False = Snowflakeは半構造化データをサポートする**（問題の否定文がFalse）
- **VARIANTデータ型の特徴**:
  - あらゆるデータを格納できる汎用型
  - JSON・XML・Avro・ORC・Parquetなどに対応
  - SQLで直接クエリ・ナビゲートできる
  - 最大16MB
- **SQLでのJSONアクセス**: VARIANTカラムにロード後、`:` 記法や `.` でネスト要素にアクセスできる
- **問題の構造**: 「SnowflakeはXをサポートしない」という否定文がFalse → 「実際はサポートする」。否定問題で正答を導く典型パターン

## 1-3. 公式ドキュメントURL

- [Semi-structured Data](https://docs.snowflake.com/en/user-guide/semistructured-intro)

---

## 2-1. 問題文（英語）

> True or False: Snowflake does not support the loading of semi-structured data.
>
> A. True
> B. False ✅

## 2-2. 問題文の文法解析

### 文1: "Snowflake does not support the loading of semi-structured data."

- **主語 (S)**: Snowflake
- **動詞 (V)**: does not support（否定）
- **目的語 (O)**: the loading of semi-structured data
- **文型**: SVO（否定文）
- **注目ポイント**:
  - **"does not support the loading of ~"**: 「〜のロードをサポートしない」。この否定文が **False（誤り）** = 「実際はサポートする」。否定文の True/False 問題は、「否定文が正しいか（True）、誤りか（False）」を問う
  - **"the loading of semi-structured data"**: 「半構造化データのロード」。`the loading of ~`（`load` を名詞化 + `of` で対象）= 「〜のロード（という行為）」。`support + 動名詞`（`support loading ~`）とは語順が異なる形式的な名詞句

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| semi-structured | 形容詞 | 半構造化の | Snowflake supports loading semi-structured data like JSON. |
| support the loading of ~ | 動詞句 | 〜のロードをサポートする | Snowflake supports the loading of semi-structured data. |

## 2-3. 問題文（日本語）

> 正誤問題：Snowflakeは半構造化データのロードをサポートしない。
>
> A. True（正しい）
> B. False（誤り）✅

---

## 3-1. 解説文（英語）

> Snowflake supports loading and processing semi-structured data. Snowflake provides the VARIANT data type, which can store any data and is appropriate for semi-structured data input and querying. SQL may be used to read and navigate JSON data once it has been loaded into a VARIANT column.

## 3-2. 解説文の文法解析

### 文1: "Snowflake supports loading and processing semi-structured data."

- **主語 (S)**: Snowflake
- **動詞 (V)**: supports
- **目的語 (O)**: loading and processing semi-structured data（動名詞句の並列）
- **文型**: SVO
- **注目ポイント**:
  - **"supports loading and processing ~"**: `support + 動名詞`（〜することをサポートする）。`load` と `process` の2動名詞を `and` で並列。問題文の否定（does not support）を直接否定する断言

### 文2: "Snowflake provides the VARIANT data type, which can store any data and is appropriate for semi-structured data input and querying."

- **主語 (S)**: Snowflake
- **動詞 (V)**: provides
- **目的語 (O)**: the VARIANT data type
- **非制限関係詞節**: which can store any data and is appropriate for semi-structured data input and querying
- **文型**: SVO（+ 非制限関係詞節）
- **注目ポイント**:
  - **"which can store any data"**: 「あらゆるデータを格納できる」。`any data`（いかなるデータも）でVARIANTの汎用性を強調
  - **"is appropriate for semi-structured data input and querying"**: 「半構造化データの入力とクエリに適している」。`appropriate for ~`（〜に適した）で用途適性を示す。`input`（入力・ロード）と `querying`（クエリ）の2用途を並列

### 文3: "SQL may be used to read and navigate JSON data once it has been loaded into a VARIANT column."

- **主語 (S)**: SQL
- **動詞 (V)**: may be used（受動態）
- **目的（to不定詞）**: to read and navigate JSON data
- **時間節**: once it has been loaded into a VARIANT column
- **文型**: SV（受動態）
- **注目ポイント**:
  - **"may be used to read and navigate ~"**: 「〜を読んでナビゲートするために使える」。`may be used to do`（〜するために使い得る）で可能性・用途を示す受動態
  - **"navigate"**: 「ナビゲートする・探索する」。JSONのような階層構造データを `:` や `.` で辿る操作を示す技術用語
  - **"once it has been loaded into a VARIANT column"**: 「一度VARIANTカラムにロードされると」。`Once + 現在完了受動態`（`has been loaded`）で「ロード完了後」の状態を起点とした条件を示す。Q105の `Once created` と同じ分詞構文の亜型

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| appropriate for ~ | 形容詞句 | 〜に適した | VARIANT is appropriate for semi-structured data. |
| navigate | 動詞 | ナビゲートする・探索する | SQL can navigate JSON data in a VARIANT column. |
| once it has been loaded | 時間節 | 一度ロードされると | Once data has been loaded, SQL can query it. |

## 3-3. 解説文（日本語）

> Snowflakeは半構造化データのロードと処理をサポートしています。SnowflakeはVARIANTデータ型を提供しており、あらゆるデータを格納でき、半構造化データの入力とクエリに適しています。データがVARIANTカラムにロードされると、SQLを使用してJSONデータを読み取ってナビゲートすることができます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
