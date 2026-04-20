# 044: View No Storage Cost

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-15
**正答**: C, E

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| View（ビュー） | SQL文の定義のみ保持。実行時にクエリが実行される。**ストレージコストなし** |
| Secure View（セキュアビュー） | ビューと同じくSQL文の定義のみ。**ストレージコストなし**。定義が隠蔽される |
| Materialized View（MV） | クエリ結果を**物理的に保存**。**ストレージコストあり** |
| Temporary Table / Transient Table | データを保存するテーブル。**ストレージコストあり** |

## 1-2. 重要コンセプトまとめ

- ストレージコストが**かからない**オブジェクト:
  - **View** ✅（SQL文の定義のみ）
  - **Secure View** ✅（SQL文の定義のみ）
- ストレージコストが**かかる**オブジェクト:
  - **Materialized View** ❌（結果を物理保存）
  - **Temporary Table** ❌（データを保存）
  - **Transient Table** ❌（データを保存）
- View/Secure View = **実行時にSQLが実行される**（データを保持しない）

## 1-3. 公式ドキュメントURL

- [Introduction to Views](https://docs.snowflake.com/en/user-guide/views-introduction)

---

## 2-1. 問題文（英語）

> Which of the following Snowflake objects do not contribute towards storage costs? Select two.
>
> A. Materialized View
> B. Temporary Table
> C. Secure View
> D. Transient Tables
> E. View

## 2-2. 問題文の文法解析

### 文1: "Which of the following Snowflake objects do not contribute towards storage costs?"

- **主語 (S)**: Which of the following Snowflake objects
- **動詞 (V)**: do not contribute towards
- **目的語 (O)**: storage costs
- **文型**: SVO
- **注目ポイント**: `contribute towards ~` は「～に寄与する」。「寄与しない」= ストレージコストが発生しない。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| contribute towards ~ | phrase | ～に寄与する | Do not contribute towards storage costs. |
| consists of ~ | phrase | ～で構成される | Consists of an SQL statement. |
| persists the results | phrase | 結果を永続化する | MV persists the results of the SQL. |

## 2-3. 問題文（日本語）

> ストレージコストに寄与しないSnowflakeオブジェクトはどれですか？2つ選んでください。

---

## 3-1. 解説文（英語）

> Views & Secure view do not use any storage. Both of these objects consist of an SQL statement, which is executed at runtime. Materialized view persists the results of the SQL in its definition and, therefore, uses storage. Both temporary and transient tables use storage.

## 3-2. 解説文の文法解析

### 文1: "Views & Secure view do not use any storage."

- **注目ポイント**: `do not use any ~` で「いかなる～も使用しない」。完全にストレージ消費ゼロ。

### 文2: "Materialized view persists the results of the SQL in its definition and, therefore, uses storage."

- **注目ポイント**: `persists the results` で「結果を永続化する」。MVはデータを物理保存するためストレージ消費。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| at runtime | phrase | 実行時に | Executed at runtime. |
| persists | verb | 永続化する | MV persists the results. |

## 3-3. 解説文（日本語）

> ViewとSecure Viewはストレージを一切使用しません。これらのオブジェクトはSQL文の定義で構成され、実行時にクエリが実行されます。Materialized Viewは定義内のSQLの結果を永続化するため、ストレージを使用します。TemporaryテーブルとTransientテーブルはいずれもストレージを使用します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
