# 118: JSON Data Loading — VARIANT Data Type

**SnowPro Core Domain**: Domain 3 — Data Loading, Unloading, and Connectivity
**作成日**: 2026-04-17
**正答**: A（Snowflakeが提供する関数でJSONを処理しながらロードする）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Semi-structured Data（半構造化データ） | 固定スキーマを持たないが、タグやキーなどの構造要素を持つデータ。JSON・Avro・ORC・Parquet・XMLが代表例 |
| VARIANT | Snowflakeが提供する半構造化データ専用のデータ型。JSON/Avro/ORC/Parquet/XMLなど任意の形式のデータを格納できる。最大サイズは16MB |
| JSON (JavaScript Object Notation) | テキストベースのデータ交換フォーマット。`{"key": "value"}` 形式のキーと値のペアで構成される半構造化データ |
| PARSE_JSON() | JSON文字列をVARIANTに変換するSnowflake関数。文字列として受け取ったJSONデータをSnowflakeが内部的に処理できる形式に変換する |
| COPY INTO（ロード） | ステージからテーブルにデータをロードするSnowflakeのコマンド。JSONなど半構造化データもVARIANT列にロード可能 |
| Dot Notation（ドット記法） | VARIANTに格納されたJSONデータの要素にアクセスするSQL構文。`column:key.nested_key` の形式で階層的に参照 |

## 1-2. 重要コンセプトまとめ

- **SnowflakeはJSONをネイティブサポートしている（外部変換不要）**
  - JSONをCSVに変換する必要はない
  - Avro・ORC・Parquet・XMLも同様にサポート
- **正しいアプローチ: VARIANT列にロード → SQLでナビゲート**
  1. VARIANT型の列を持つテーブルを作成
  2. COPY INTOでJSONをVARIANT列に直接ロード
  3. ドット記法やSnowflake関数でデータを抽出
- **誤ったアプローチ（試験の罠）**
  - ❌ ソースシステムにCSVへの変換を求める → Snowflakeは直接JSON対応可能
  - ❌ Pythonなどで手動変換してCSVにする → 不要な作業
- **VARIANTの特徴**
  - 任意のデータ型を格納可能（数値・文字列・配列・オブジェクト）
  - SQLで直接クエリ可能
  - 最大16MB/行

## 1-3. 公式ドキュメントURL

- [Loading Semi-structured Data](https://docs.snowflake.com/en/user-guide/semistructured-intro#loading-semi-structured-data)
- [Semi-structured Data Overview](https://docs.snowflake.com/en/user-guide/semistructured-intro)
- [VARIANT Data Type](https://docs.snowflake.com/en/sql-reference/data-types-semistructured#variant)

---

## 2-1. 問題文（英語）

> You are a developer for a retail organization running a Snowflake data warehouse. You need to upload JSON-based data into a table. What approach should you take?
>
> A. Use Snowflake provided functions to process JSON data while loading it into the table.
> B. Ask the source system to send you a CSV rather than a JSON file, as Snowflake does not support JSON.
> C. Write a program using a programming language of your choice (Python, Java, etc.) to process the JSON file into a CSV structure. Then, load the CSV file into the table using the COPY command.

## 2-2. 問題文の文法解析

### 文1: "You are a developer for a retail organization running a Snowflake data warehouse."

- **主語 (S)**: You
- **動詞 (V)**: are
- **補語 (C)**: a developer for a retail organization running a Snowflake data warehouse
- **現在分詞後置修飾**: running a Snowflake data warehouse（a retail organizationを修飾）
- **文型**: SVC
- **注目ポイント**: `running a Snowflake data warehouse` = Snowflakeデータウェアハウスを運営している（現在分詞による後置修飾）

### 文2: "You need to upload JSON-based data into a table."

- **主語 (S)**: You
- **動詞 (V)**: need to upload
- **目的語 (O)**: JSON-based data
- **場所の修飾語**: into a table
- **文型**: SVO
- **注目ポイント**: 
  - `JSON-based data` = JSONベースのデータ（-basedは「〜を基とした」の意味の形容詞化接尾辞）
  - `need to + 動詞原形` = 〜する必要がある

### 選択肢Aの分析: "Use Snowflake provided functions to process JSON data while loading it into the table."

- **命令文（動詞原形で始まる）**: Use
- **目的語**: Snowflake provided functions
- **目的の不定詞**: to process JSON data
- **付帯状況**: while loading it into the table（分詞構文）
- **注目ポイント**: 
  - `Snowflake provided functions` = Snowflakeが提供する関数（過去分詞の前置修飾）
  - `while loading` = ロードしながら（while + 分詞構文で同時進行を示す）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| upload | 動詞 | アップロードする、ロードする | Upload JSON data into a VARIANT column. |
| JSON-based | 形容詞 | JSONベースの | JSON-based data can be loaded directly into Snowflake. |
| approach | 名詞 | アプローチ、方法 | What approach should you take for loading JSON? |
| rather than | 接続詞句 | 〜ではなく | Use JSON directly rather than converting to CSV. |

## 2-3. 問題文（日本語）

> あなたはSnowflakeデータウェアハウスを運営する小売組織の開発者です。JSONベースのデータをテーブルにアップロードする必要があります。どのようなアプローチを取るべきですか？
>
> A. Snowflakeが提供する関数を使用して、テーブルにロードしながらJSONデータを処理する。
> B. SnowflakeはJSONをサポートしていないため、ソースシステムにJSONではなくCSVファイルを送るよう依頼する。
> C. 好みのプログラミング言語（Python、Javaなど）でJSONファイルをCSV形式に処理するプログラムを書く。その後、COPYコマンドでCSVファイルをテーブルにロードする。

---

## 3-1. 解説文（英語）

> Snowflake supports several semi-structured data formats and JSON, Avro, ORC, Parquet, and XML. Snowflake provides the VARIANT data type, which can store any data and is appropriate for semi-structured data input and querying. SQL may be used to read and navigate JSON data once it has been loaded into a VARIANT column.
>
> https://docs.snowflake.com/en/user-guide/semistructured-intro#loading-semi-structured-data

## 3-2. 解説文の文法解析

### 文1: "Snowflake supports several semi-structured data formats and JSON, Avro, ORC, Parquet, and XML."

- **主語 (S)**: Snowflake
- **動詞 (V)**: supports
- **目的語 (O)**: several semi-structured data formats and JSON, Avro, ORC, Parquet, and XML
- **文型**: SVO
- **注目ポイント**: `several ~ and A, B, C` = いくつかの〜とA・B・Cを（列挙の前にカテゴリを提示する構造）

### 文2: "Snowflake provides the VARIANT data type, which can store any data and is appropriate for semi-structured data input and querying."

- **主語 (S)**: Snowflake
- **動詞 (V)**: provides
- **目的語 (O)**: the VARIANT data type
- **非制限関係詞節**: which can store any data and is appropriate for semi-structured data input and querying
- **文型**: SVO
- **注目ポイント**: 
  - `which can store any data` = 任意のデータを格納できる（非制限用法で補足説明）
  - `appropriate for ~ input and querying` = 〜の入力とクエリに適している（2つの用途を `and` で並列）

### 文3: "SQL may be used to read and navigate JSON data once it has been loaded into a VARIANT column."

- **主語 (S)**: SQL
- **動詞 (V)**: may be used（受動態 + may）
- **目的の不定詞**: to read and navigate JSON data（2動詞の並列）
- **時間節**: once it has been loaded into a VARIANT column（現在完了受動態）
- **文型**: SV（受動態）
- **注目ポイント**: 
  - `may be used to do` = 〜するために使用できる（可能性の受動態）
  - `read and navigate` = 読み取り・ナビゲートする（2つの動詞を and で並列）
  - `once it has been loaded` = 一度ロードされると（完了を起点とする時間節）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| semi-structured | 形容詞 | 半構造化の | JSON is a common semi-structured data format. |
| navigate | 動詞 | ナビゲートする、探索する | SQL can navigate nested JSON data in a VARIANT column. |
| appropriate for | 形容詞句 | 〜に適した | VARIANT is appropriate for semi-structured data querying. |
| once it has been loaded | 時間節 | 一度ロードされると | Once it has been loaded, SQL can query the JSON data. |

## 3-3. 解説文（日本語）

> Snowflakeはいくつかの半構造化データフォーマットをサポートしており、JSON・Avro・ORC・Parquet・XMLが対応しています。SnowflakeはVARIANTデータ型を提供しており、このデータ型は任意のデータを格納でき、半構造化データの入力とクエリに適しています。JSONデータをVARIANT列にロードすると、SQLを使用して読み取り・ナビゲートすることができます。

---

## 復習メモ

- [ ] SnowflakeはJSONをネイティブサポートしており、外部変換は不要であることを理解した
- [ ] VARIANTデータ型が半構造化データ（JSON/Avro/ORC/Parquet/XML）に使用することを把握した
- [ ] `once it has been loaded`（完了を起点とする時間節）と `appropriate for ~ input and querying`（〜の入力とクエリに適した）を確認した
