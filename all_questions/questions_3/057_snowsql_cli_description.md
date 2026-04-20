# 057: SnowSQL CLI Description

**SnowPro Core Domain**: Domain 3 — Data Loading, Unloading, and Connectivity
**作成日**: 2026-04-16
**正答**: C

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| SnowSQL | SnowflakeのコマンドラインCLIツール。ターミナルからSQLクエリを実行し、データロード/アンロードが可能。Linux, Windows, Mac OSに対応 |
| Snowsight | SnowflakeのWebベースUI。ブラウザからSnowflakeにアクセスし、クエリ実行・管理操作が可能 |
| CLI (Command Line Interface) | コマンドラインインターフェース。テキストベースでシステムを操作する方式 |

## 1-2. 重要コンセプトまとめ

- SnowSQLは**コマンドラインインターフェース（CLI）**であり、Webインターフェースではない
- Snowsight = Web UI、SnowSQL = CLI という対比が重要
- SnowSQLは**Linux, Windows, Mac OS**の3プラットフォームに対応
- デスクトップアプリケーション（GUI）やモバイルアプリではない
- SnowSQL経由でSQL実行・データロード（PUT）・データアンロード（GET）が可能

## 1-3. 公式ドキュメントURL

- [SnowSQL (CLI Client)](https://docs.snowflake.com/en/user-guide/snowsql)

---

## 2-1. 問題文（英語）

> Which of the following statements best describes SnowSQL?
>
> A. A web-based interface to connect to your Snowflake instance.
> B. A lightweight desktop application with a user interface to administer your Snowflake instance.
> C. A command-line interface to connect to your Snowflake instance.
> D. A mobile app that can be used to connect to your Snowflake instance.

## 2-2. 問題文の文法解析

### 文1: "Which of the following statements best describes SnowSQL?"

- **主語 (S)**: Which of the following statements
- **動詞 (V)**: best describes
- **目的語 (O)**: SnowSQL
- **文型**: SVO
- **注目ポイント**: 「Which of the following」は試験頻出の疑問パターン。「best describes」で最も適切な説明を1つ選ばせる単一選択形式。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| best describes | 動詞句 | 最もよく説明する | Which option best describes the feature? |
| web-based | 形容詞 | Webベースの | Snowsight is a web-based interface. |
| lightweight | 形容詞 | 軽量な | A lightweight desktop application. |
| command-line interface | 名詞句 | コマンドラインインターフェース | SnowSQL is a command-line interface. |
| administer | 動詞 | 管理する | Administer your Snowflake instance. |

## 2-3. 問題文（日本語）

> 以下のうち、SnowSQLを最もよく説明している文はどれですか？
>
> A. Snowflakeインスタンスに接続するためのWebベースインターフェース。
> B. Snowflakeインスタンスを管理するためのユーザーインターフェースを備えた軽量デスクトップアプリケーション。
> C. Snowflakeインスタンスに接続するためのコマンドラインインターフェース。
> D. Snowflakeインスタンスに接続するために使用できるモバイルアプリ。

---

## 3-1. 解説文（英語）

> SnowSQL connects to Snowflake through the command line and executes SQL queries on your Snowflake instance. SnowSQL is available for Linux, Windows, and Mac OS. https://docs.snowflake.com/en/user-guide/snowsql

## 3-2. 解説文の文法解析

### 文1: "SnowSQL connects to Snowflake through the command line and executes SQL queries on your Snowflake instance."

- **主語 (S)**: SnowSQL
- **動詞 (V)**: connects ... and executes（等位接続詞で2つの動詞）
- **修飾語 (M)**: to Snowflake / through the command line / on your Snowflake instance
- **文型**: SV + SVO（並列構造）
- **注目ポイント**: 「connects to ~ through ~」で接続先と手段を示す。「and」で2つの動作を並列。

### 文2: "SnowSQL is available for Linux, Windows, and Mac OS."

- **主語 (S)**: SnowSQL
- **動詞 (V)**: is
- **補語 (C)**: available for Linux, Windows, and Mac OS
- **文型**: SVC
- **注目ポイント**: 「is available for ~」で対応プラットフォームを列挙。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| through | 前置詞 | ～を通じて | Connect through the command line. |
| execute | 動詞 | 実行する | Execute SQL queries on Snowflake. |
| available for | 形容詞句 | ～に対応している | The tool is available for all platforms. |

## 3-3. 解説文（日本語）

> SnowSQLはコマンドラインを通じてSnowflakeに接続し、SnowflakeインスタンスでSQLクエリを実行します。SnowSQLはLinux、Windows、Mac OSに対応しています。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
