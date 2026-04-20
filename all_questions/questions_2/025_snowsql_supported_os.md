# 025: SnowSQL — Supported Operating Systems

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-10
**正答**: A（macOS）, B（Linux）, D（Windows）の3つ
**ユーザー回答**: A, B, D — 正解

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| SnowSQL | Snowflakeの公式**コマンドラインクライアント（CLI）**。ターミナルからSQLクエリの実行、データのロード/アンロードが可能。**Linux / Windows / macOS** の3つのOSで利用可能 |
| CLI（Command Line Interface） | コマンドライン（ターミナル）からコマンドを入力して操作するインターフェース。GUIではなくテキストベースでの操作 |
| Snowflake Instance（Snowflakeインスタンス） | ユーザーのSnowflakeアカウント環境。SnowSQLはこのインスタンスに接続してSQLを実行する |

## 1-2. 重要コンセプトまとめ

- **SnowSQLが対応するOS（3つ）**:
  1. **Linux**
  2. **Windows**
  3. **macOS**
- **Androidは非対応**: モバイルOSはサポート対象外。SnowSQLはデスクトップ/サーバーOS向けのCLIツール
- **SnowSQLの基本機能**:
  - コマンドラインからSnowflakeに接続
  - SQLクエリの実行
  - データのロード/アンロード
- **Q005との関連**: Q005でSnowSQL = Snowflake唯一の公式CLIツールと学習済み。本問は対応OSを具体的に問う
- **試験ポイント**: 「Linux, Windows, macOS」の3つ。モバイルOS（Android/iOS）は非対応

## 1-3. 公式ドキュメントURL

- [SnowSQL (CLI Client)](https://docs.snowflake.com/en/user-guide/snowsql)

---

## 2-1. 問題文（英語）

> SnowSQL is available for which of the following operating systems?
>
> A. macOS
> B. Linux
> C. Android
> D. Windows

## 2-2. 問題文の文法解析

### 文1: "SnowSQL is available for which of the following operating systems?"

- **主語 (S)**: SnowSQL
- **動詞 (V)**: is（be動詞）
- **補語 (C)**: available（利用可能である）
- **修飾語 (M)**: for which of the following operating systems（次のオペレーティングシステムのうちどれに対して）
- **文型**: SVC（疑問文）
- **注目ポイント**:
  - `be available for ~` — 「〜に対して利用可能である」。対応範囲を述べる定番表現
  - `which of the following` — 「次のうちどれ」。複数選択の問題で頻出

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| available for ~ | adj phrase | 〜に対して利用可能な | SnowSQL is available for Linux, Windows, and macOS. |
| operating system | noun | オペレーティングシステム（OS） | Which operating systems does SnowSQL support? |
| through the command line | prep phrase | コマンドラインを通じて | SnowSQL connects through the command line. |

## 2-3. 問題文（日本語）

> SnowSQLは次のオペレーティングシステムのうちどれで利用可能ですか？
>
> A. macOS
> B. Linux
> C. Android
> D. Windows

---

## 3-1. 解説文（英語）

> SnowSQL connects to Snowflake through the command line and executes SQL queries on your Snowflake instance. SnowSQL is available for Linux, Windows, and Mac OS.

## 3-2. 解説文の文法解析

### 文1: "SnowSQL connects to Snowflake through the command line and executes SQL queries on your Snowflake instance."

- **主語 (S)**: SnowSQL
- **動詞1 (V1)**: connects to（〜に接続する）
- **目的語1 (O1)**: Snowflake
- **手段 (M1)**: through the command line（コマンドラインを通じて）
- **動詞2 (V2)**: executes（実行する）
- **目的語2 (O2)**: SQL queries（SQLクエリを）
- **場所 (M2)**: on your Snowflake instance（あなたのSnowflakeインスタンス上で）
- **文型**: SVO and SVO（等位接続詞andで2つの動詞句を並列）

### 文2: "SnowSQL is available for Linux, Windows, and Mac OS."

- **主語 (S)**: SnowSQL
- **動詞 (V)**: is（be動詞）
- **補語 (C)**: available（利用可能である）
- **修飾語 (M)**: for Linux, Windows, and Mac OS（Linux、Windows、Mac OSに対して）
- **文型**: SVC

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| connect to ~ | verb phrase | 〜に接続する | SnowSQL connects to Snowflake. |
| execute | verb | 実行する | SnowSQL executes SQL queries. |
| instance | noun | インスタンス、環境 | Connect to your Snowflake instance. |

## 3-3. 解説文（日本語）

> SnowSQLはコマンドラインを通じてSnowflakeに接続し、あなたのSnowflakeインスタンス上でSQLクエリを実行します。SnowSQLはLinux、Windows、Mac OSで利用可能です。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
