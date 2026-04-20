# 083: Storage Hierarchy

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-16
**正答**: C, D, E

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Snowflake Account（アカウント） | Snowflakeの最上位の組織単位。データベース・ウェアハウスなど全オブジェクトを含む |
| Database（データベース） | アカウント内に存在し、1つ以上のスキーマを含む |
| Schema（スキーマ） | データベース内に存在し、テーブル・ビュー・UDF等のオブジェクトを含む |
| Virtual Warehouse | コンピュートリソース。ストレージ階層とは独立した存在（DBに含まれない）|

## 1-2. 重要コンセプトまとめ

- Snowflakeのオブジェクト階層: **Account > Database > Schema > Objects**
- Objects = テーブル、ビュー、ファイルフォーマット、シーケンス、UDF、ストアドプロシージャ等
- 各オブジェクトは**1つのスキーマにのみ**属する（複数スキーマに跨がらない）
- **Virtual Warehouseはこの階層に含まれない**（DB/スキーマに属さないアカウントレベルのオブジェクト）
- 「DBはVWに含まれる」「VWはDBに含まれる」はどちらも**誤り**

## 1-3. 公式ドキュメントURL

- [Snowflake Object Hierarchy](https://docs.snowflake.com/en/user-guide/snowflake-manager)

---

## 2-1. 問題文（英語）

> Which of the following statements are true regarding the storage hierarchy in Snowflake?
>
> Select all that apply.
>
> A. Databases are stored in Virtual Warehouses.
> B. Virtual Warehouses are stored in Databases.
> C. Tables are stored within Schemas.
> D. Databases are stored within Accounts.
> E. Schemas are stored within Databases.

## 2-2. 問題文の文法解析

### 文1: "Which of the following statements are true regarding the storage hierarchy in Snowflake?"

- **主語 (S)**: Which of the following statements
- **動詞 (V)**: are
- **補語 (C)**: true
- **修飾語 (M)**: regarding the storage hierarchy in Snowflake
- **文型**: SVC
- **注目ポイント**: 「storage hierarchy」でオブジェクトの階層構造を問う。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| hierarchy | 名詞 | 階層構造 | The storage hierarchy in Snowflake. |
| stored within | 動詞句 | ～の中に格納される | Tables are stored within schemas. |

## 2-3. 問題文（日本語）

> Snowflakeのストレージ階層に関して正しい記述はどれですか？
>
> 該当するものをすべて選んでください。
>
> A. データベースは仮想ウェアハウスに格納される。
> B. 仮想ウェアハウスはデータベースに格納される。
> C. テーブルはスキーマ内に格納される。
> D. データベースはアカウント内に格納される。
> E. スキーマはデータベース内に格納される。

---

## 3-1. 解説文（英語）

> In Snowflake, the highest level is a Snowflake Account. Customers can have as many accounts as they like. Within an account, you have databases. Each database contains one or more schemas. Schemas contain other Objects. Tables, views, file formats, sequences, UDFs, and stored procedures are all examples of objects available in a schema. An object can be contained in only one schema.

## 3-2. 解説文の文法解析

### 文1: "In Snowflake, the highest level is a Snowflake Account."

- **主語 (S)**: the highest level
- **動詞 (V)**: is
- **補語 (C)**: a Snowflake Account
- **文型**: SVC

### 文2: "Within an account, you have databases."

- **主語 (S)**: you
- **動詞 (V)**: have
- **目的語 (O)**: databases
- **修飾語 (M)**: Within an account
- **文型**: SVO

### 文3: "An object can be contained in only one schema."

- **主語 (S)**: An object
- **動詞 (V)**: can be contained（受動態）
- **修飾語 (M)**: in only one schema
- **文型**: SV（受動態）
- **注目ポイント**: 「only one schema」で1つのスキーマにのみ属するという排他性を示す。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| highest level | 名詞句 | 最上位レベル | The highest level is a Snowflake Account. |
| as many as they like | 慣用句 | 好きなだけ | Customers can have as many accounts as they like. |
| be contained in | 受動態 | ～に含まれる | An object can be contained in only one schema. |

## 3-3. 解説文（日本語）

> Snowflakeでは最上位はSnowflakeアカウントです。顧客は好きなだけアカウントを持てます。アカウント内にデータベースがあります。各データベースは1つ以上のスキーマを含みます。スキーマは他のオブジェクトを含みます。テーブル、ビュー、ファイルフォーマット、シーケンス、UDF、ストアドプロシージャはすべてスキーマ内で利用可能なオブジェクトの例です。1つのオブジェクトは1つのスキーマにのみ含まれます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
