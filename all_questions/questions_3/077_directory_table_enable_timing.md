# 077: Directory Table Enable Timing

**SnowPro Core Domain**: Domain 3 — Data Loading, Unloading, and Connectivity
**作成日**: 2026-04-16
**正答**: B (True)

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Directory Table（ディレクトリテーブル） | ステージ内のファイル一覧とメタデータを提供する暗黙的オブジェクト。独立したDBオブジェクトではなく、ステージに付随する |
| Stage（ステージ） | データファイルを一時保管する場所。内部ステージ・外部ステージがあり、ディレクトリテーブルを有効化できる |
| Implicit Object（暗黙的オブジェクト） | 明示的に CREATE する独立したオブジェクトではなく、親オブジェクト（ステージ）に付属する形で存在するオブジェクト |

## 1-2. 重要コンセプトまとめ

- ディレクトリテーブルは**独立したデータベースオブジェクトではない**
- ステージに付随する**暗黙的オブジェクト**（implicit object）
- ディレクトリテーブルの有効化タイミング:
  1. **ステージ作成時**に有効化（`CREATE STAGE ... DIRECTORY = (ENABLE = TRUE)`）
  2. **ステージ作成後**に有効化（`ALTER STAGE ... SET DIRECTORY = (ENABLE = TRUE)`）
- どちらのタイミングでも有効化可能
- ディレクトリテーブルはLIST コマンドの代替として使える（クエリ可能）

## 1-3. 公式ドキュメントURL

- [Directory Tables](https://docs.snowflake.com/en/user-guide/data-load-dirtables)

---

## 2-1. 問題文（英語）

> True or False: A directory table can be enabled while creating a Stage object or enabled afterward.
>
> A. False
> B. True

## 2-2. 問題文の文法解析

### 文1: "A directory table can be enabled while creating a Stage object or enabled afterward."

- **主語 (S)**: A directory table
- **動詞 (V)**: can be enabled ... or enabled（受動態・2つの並列）
- **修飾語 (M)**: while creating a Stage object（時間の副詞節）/ afterward（副詞）
- **文型**: SV（受動態）
- **注目ポイント**: 「can be enabled while ~ or enabled afterward」で2つのタイミングを「or」で提示。「while creating」は同時進行の副詞節。「afterward」は「その後で」。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| enable | 動詞 | 有効化する | Enable the directory table for a stage. |
| while creating | 接続詞+動名詞 | 作成中に | Enabled while creating the stage. |
| afterward | 副詞 | その後で | Or enabled afterward. |
| implicit | 形容詞 | 暗黙的な | An implicit object available with a stage. |

## 2-3. 問題文（日本語）

> True/False: ディレクトリテーブルはStageオブジェクトの作成時に有効化するか、作成後に有効化することができる。
>
> A. False（偽）
> B. True（真）

---

## 3-1. 解説文（英語）

> A directory table is not a separate database object but is an implicit object available with a stage. You can enable the directory table for a stage while creating the stage or enable it afterward.

## 3-2. 解説文の文法解析

### 文1: "A directory table is not a separate database object but is an implicit object available with a stage."

- **主語 (S)**: A directory table
- **動詞 (V)**: is not ... but is（否定 + 対比）
- **補語 (C)**: a separate database object / an implicit object available with a stage
- **文型**: SVC（対比構造: not A but B）
- **注目ポイント**: 「not A but B」で「AではなくB」。ディレクトリテーブルの本質を定義。

### 文2: "You can enable the directory table for a stage while creating the stage or enable it afterward."

- **主語 (S)**: You
- **動詞 (V)**: can enable ... or enable
- **目的語 (O)**: the directory table / it
- **修飾語 (M)**: for a stage / while creating the stage / afterward
- **文型**: SVO（2つの選択肢を並列）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| separate | 形容詞 | 独立した | Not a separate database object. |
| available with | 形容詞句 | ～に付随して利用可能な | An implicit object available with a stage. |
| not A but B | 構文 | AではなくB | Not a separate object but an implicit object. |

## 3-3. 解説文（日本語）

> ディレクトリテーブルは独立したデータベースオブジェクトではなく、ステージに付随して利用可能な暗黙的オブジェクトです。ステージの作成時にディレクトリテーブルを有効化することも、作成後に有効化することもできます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
