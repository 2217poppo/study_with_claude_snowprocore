# 027: Snowpark Library Description

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-15
**正答**: A, C

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Snowpark | Snowflakeが作成した**ライブラリ**。SQL以外の言語（Java/Scala/Python）でデータにアクセス・処理するためのAPIを提供 |
| Push Down | プログラミング構造をSQLに自動変換してSnowflakeで実行。Snowflake SQLエンジンに**依存する** |

## 1-2. 重要コンセプトまとめ

- Snowpark = **Snowflakeが作成したライブラリ**（SQL以外の言語向けAPI）
- 正しい記述:
  - プログラミング構造をSQLに自動変換してSnowflakeで実行（Push Down）✅
  - SQL以外の言語でデータにアクセス・処理するAPIを提供 ✅
- 誤りの記述:
  - Cloud Services Layerの内部にアクセスするAPI ❌（そんなAPIは提供しない）
  - Snowflake SQL実行エンジンに依存しない ❌（**依存する** — SQLに変換して実行するため）

## 1-3. 公式ドキュメントURL

- [Snowpark Developer Guide](https://docs.snowflake.com/en/developer-guide/snowpark/index)

---

## 2-1. 問題文（英語）

> Which of the following statements best describe Snowpark? Select all that apply.
>
> A. Snowpark automatically converts the data-processing programming constructs to SQL and pushes them down to Snowflake for execution.
> B. Snowflake provides APIs that allows programmers to access the internals of the Snowflake cloud services layer.
> C. Snowpark is a library created by Snowflake that provides APIs for accessing and processing data in applications written in a programming language other than SQL.
> D. Snowpark does not rely on the Snowflake SQL execution engine.

## 2-2. 問題文の文法解析

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| library | noun | ライブラリ | A library created by Snowflake. |
| programming constructs | noun | プログラミング構造 | Converts programming constructs to SQL. |
| rely on ~ | phrase | ～に依存する | Snowpark relies on the SQL execution engine. |

## 2-3. 問題文（日本語）

> Snowparkを最もよく説明しているのはどれですか？

---

## 3-1. 解説文（英語）

> Snowpark is a library created by Snowflake that provides APIs for accessing and processing data in applications written in a programming language other than SQL. Snowpark allows programmers to utilize common programming languages such as Java, Scala, and Python to construct apps that handle data using standard programming structures. Snowpark automatically converts the data-processing programming constructs to SQL and sends them to Snowflake for execution.

## 3-3. 解説文（日本語）

> SnowparkはSnowflakeが作成したライブラリで、SQL以外のプログラミング言語で書かれたアプリケーションでデータにアクセス・処理するためのAPIを提供します。Java、Scala、Pythonなどの言語でデータ処理アプリを構築できます。プログラミング構造を自動的にSQLに変換してSnowflakeで実行します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
