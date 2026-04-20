# 005: SnowSQL CLI

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-02
**正答**: A (SnowSQL)

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| SnowSQL | SnowflakeのコマンドラインインターフェースCLIツール。ターミナルからSQLクエリの実行、ファイルのロード/アンロードなどが可能。正式名称は「Command Line Client (CLI)」。インストールが必要。 |
| CLI (Command Line Interface) | コマンドライン（ターミナル）からコマンドを入力して操作するインターフェース。SnowSQLはSnowflakeのCLIツール。 |
| Snowsight | SnowflakeのWebブラウザUI（誤答）。CLIではなくGUI（グラフィカルインターフェース）。クエリの実行やダッシュボード作成に使う。 |
| Snowmobile | AWSが提供する大容量物理データ転送サービス（誤答）。Snowflakeとは別会社の製品。 |
| Snowpipe | Snowflakeのデータ自動取り込みサービス（誤答）。ステージにファイルが置かれると自動でロードを開始する機能。CLIツールではない。 |

## 1-2. 重要コンセプトまとめ

- **SnowSQL = Snowflake唯一の公式CLIツール**
- Snowflakeへの接続方法の整理（試験頻出）:

  | ツール | 種類 | 用途 |
  |--------|------|------|
  | **SnowSQL** | CLI | コマンドラインからSQL実行・データロード |
  | Snowsight | Web UI (GUI) | ブラウザからのクエリ・監視・ダッシュボード |
  | Snowflake Connector | ライブラリ | Python/Java等のプログラムから接続 |
  | ODBC/JDBC Driver | ドライバ | BIツールなど外部アプリから接続 |

- **紛らわしい誤答の整理**:
  - Snowsight → Web UI（CLIではない）
  - Snowpipe → 自動データ取り込み機能（CLIではない）
  - Snowmobile → AWSの物理データ転送（Snowflake製品ですらない）
- 「command line」「CLI」というキーワードを見たら **SnowSQL** を想起する

## 1-3. 公式ドキュメントURL

- [SnowSQL (CLI Client)](https://docs.snowflake.com/en/user-guide/snowsql)

---

## 2-1. 問題文（英語）

> Which of the following is a command line tool used to connect to Snowflake?
>
> A. SnowSQL
> B. Snowsight
> C. Snowmobile
> D. Snowpipe

## 2-2. 問題文の文法解析

### 文1: "Which of the following is a command line tool used to connect to Snowflake?"

- **主語 (S)**: Which of the following
- **動詞 (V)**: is
- **補語 (C)**: a command line tool used to connect to Snowflake
  - 過去分詞句: used to connect to Snowflake（tool を後置修飾）
- **文型**: SVC
- **注目ポイント**:
  - 「Which of the following」はSnowPro試験で最も頻出の問題文パターン。「次のうちどれが」
  - 「used to connect to ~」の used は過去分詞（形容詞的用法）。「～に接続するために使われる」
  - 「command line tool」はハイフンなしで使われることも多い。「コマンドラインツール」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| command line tool | noun phrase | コマンドラインツール | SnowSQL is a command line tool for Snowflake. |
| used to + 動詞原形 | 過去分詞句（形容詞的） | ～するために使われる | A tool used to execute SQL queries. |
| connect to | verb phrase | ～に接続する | SnowSQL is used to connect to Snowflake. |

## 2-3. 問題文（日本語）

> 次のうち、Snowflakeへの接続に使用するコマンドラインツールはどれですか？
>
> A. SnowSQL
> B. Snowsight
> C. Snowmobile
> D. Snowpipe

---

## 3-1. 解説文（英語）

> Command Line Client (CLI), also known as SnowSQL – is the method to connect to your Snowflake instance via a command-line interface.

## 3-2. 解説文の文法解析

### 文1: "Command Line Client (CLI), also known as SnowSQL – is the method to connect to your Snowflake instance via a command-line interface."

- **主語 (S)**: Command Line Client (CLI)
- **挿入句**: also known as SnowSQL（「SnowSQLとも呼ばれる」。過去分詞句が主語を補足説明）
- **動詞 (V)**: is
- **補語 (C)**: the method to connect to your Snowflake instance via a command-line interface
  - 不定詞句: to connect to your Snowflake instance（method を修飾）
  - 前置詞句: via a command-line interface（手段を示す）
- **文型**: SVC（主語を挿入句が補足）
- **注目ポイント**:
  - 「also known as ~」は「～とも呼ばれる」。別名・通称を紹介するパターン
  - 「via ~」は「～を経由して、～を通じて」。手段を示す前置詞
  - 「the method to + 動詞原形」は「～するための方法」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| also known as | 分詞句 | ～とも呼ばれる（別名） | SnowSQL, also known as CLI, is a command-line tool. |
| via | preposition | ～を経由して、～を通じて | Connect to Snowflake via a command-line interface. |
| instance | noun | インスタンス（稼働中のシステム環境） | Connect to your Snowflake instance using SnowSQL. |

## 3-3. 解説文（日本語）

> コマンドラインクライアント（CLI）は、SnowSQLとも呼ばれており、コマンドラインインターフェースを通じてSnowflakeインスタンスに接続するための方法です。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
