# 101: Directory Table — Implicit Object, No Direct Privileges

**SnowPro Core Domain**: Domain 3 — Data Loading and Transformation
**作成日**: 2026-04-06
**正答**: "Privileges can NOT be assigned directly to a directory table." および "A directory table is NOT a separate object."

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Directory Table（ディレクトリテーブル） | ステージ上のファイルのメタデータを保持する仮想的なテーブル。**独立したデータベースオブジェクトではなく**、ステージに付随する暗黙的オブジェクト（implicit object）。`SELECT * FROM DIRECTORY(@stage)` でクエリ可能 |
| Implicit Object（暗黙的オブジェクト） | 明示的に作成するのではなく、別のオブジェクト（ステージ）に付随して自動的に利用可能になるオブジェクト。Directory Tableはステージのimplicit objectであるため、権限を直接付与できない |
| Stage（ステージ） | Snowflakeにデータをロードする前の一時保管場所。内部ステージ・外部ステージの2種類がある。Directory Tableはステージに対して有効化（enable）する |
| Privilege（権限） | Snowflakeのオブジェクトに対するアクセス権。独立したオブジェクトにのみ付与可能。Directory Tableは独立オブジェクトでないため、**直接権限を付与できない**（ステージへの権限を通じて間接的に制御される） |

## 1-2. 重要コンセプトまとめ

- **正解は2つ**:
  1. **"Privileges can NOT be assigned directly to a directory table."**（直接権限付与不可）
  2. **"A directory table is NOT a separate object."**（独立オブジェクトではない）
- **Directory Tableの本質**:
  - 独立したデータベースオブジェクト（separate database object）**ではない**
  - ステージに付随する**暗黙的オブジェクト（implicit object）**として存在する
  - ステージ作成時または後から有効化（enable）できる
- **権限付与不可の理由**: Snowflakeでは独立したオブジェクトにのみ権限を付与できる。Directory Tableは独立オブジェクトでないため直接の権限付与ができない
- **Q091との関連**: Q091で「StreamはSTAGEオブジェクト上に作成する」を学習。Directory TableもSTAGEオブジェクトに付随する概念であり、関連して理解しておく
- **間違えやすいポイント**: `SELECT * FROM DIRECTORY(@stage)` でクエリできるため「テーブル」と誤解しがちだが、実体はimplicit objectであり、CREATE TABLEで作成したテーブルとは異なる

## 1-3. 公式ドキュメントURL

- [Directory Tables](https://docs.snowflake.com/en/user-guide/data-load-dirtables)

---

## 2-1. 問題文（英語）

> Which of the following is correct regarding a directory table?
>
> Select all that apply.
>
> A. Privileges can NOT be assigned directly to a directory table. ✅
> B. Privileges can be assigned to a directory table.
> C. A directory table is NOT a separate object. ✅
> D. A directory table is a separate object.

## 2-2. 問題文の文法解析

### 文1: "Which of the following is correct regarding a directory table?"

- **主語 (S)**: Which of the following
- **動詞 (V)**: is
- **補語 (C)**: correct
- **修飾語 (M)**: regarding a directory table（前置詞句）
- **文型**: SVC（疑問文）
- **注目ポイント**:
  - **"Which of the following is correct"**: 「次のうちどれが正しいか」。`which of the following` は試験問題の定番導入表現。`is` が単数形なのは `which` が単数主語として機能するため（`are` も使われる場合あり）
  - **"regarding a directory table"**: 「ディレクトリテーブルに関して」。`regarding ~`（〜に関して）は `about ~` や `concerning ~` と同義のフォーマルな前置詞。問題範囲を限定する

### 選択肢: "Privileges can NOT be assigned directly to a directory table."

- **主語 (S)**: Privileges
- **動詞 (V)**: can NOT be assigned（否定の受動態）
- **修飾語 (M1)**: directly（副詞）
- **修飾語 (M2)**: to a directory table（到達点）
- **文型**: SV（受動態）
- **注目ポイント**:
  - **"can NOT be assigned directly"**: `can not be + 過去分詞`（〜することができない）の否定受動態。`directly`（直接）が重要なキーワード — 間接的には制御できるが**直接**は不可
  - **"be assigned to ~"**: 「〜に割り当てられる・〜に付与される」。`assign privileges to an object`（オブジェクトに権限を付与する）の受動態

### 選択肢: "A directory table is NOT a separate object."

- **主語 (S)**: A directory table
- **動詞 (V)**: is NOT
- **補語 (C)**: a separate object
- **文型**: SVC（否定）
- **注目ポイント**:
  - **"NOT a separate object"**: 「独立したオブジェクトではない」。`separate`（分離した・独立した）が核心語。`separate object` = データベースオブジェクトとして独立して存在するもの

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| regarding | 前置詞 | 〜に関して | What is correct regarding a directory table? |
| separate | 形容詞 | 独立した・分離した | A directory table is not a separate database object. |
| directly | 副詞 | 直接・直接的に | Privileges cannot be assigned directly to a directory table. |
| assign ~ to | 動詞句 | 〜を〜に付与する・割り当てる | You cannot assign privileges to an implicit object. |

## 2-3. 問題文（日本語）

> ディレクトリテーブルに関して、次のうち正しいものはどれか？
>
> 当てはまるものをすべて選べ。
>
> A. ディレクトリテーブルに直接権限を付与することはできない。✅
> B. ディレクトリテーブルに権限を付与できる。
> C. ディレクトリテーブルは独立したオブジェクトではない。✅
> D. ディレクトリテーブルは独立したオブジェクトである。

---

## 3-1. 解説文（英語）

> A directory table is not a separate database object but is an implicit object available with a stage. You can enable the directory table for a stage while creating the stage or enable it afterward.
>
> Since Directory Tables are not separate objects, you cannot provide privileges to them.

## 3-2. 解説文の文法解析

### 文1: "A directory table is not a separate database object but is an implicit object available with a stage."

- **主語 (S)**: A directory table
- **動詞1 (V1)**: is not（否定）
- **補語1 (C1)**: a separate database object
- **動詞2 (V2)**: is（but で接続）
- **補語2 (C2)**: an implicit object available with a stage
- **文型**: SVC but SVC（対比）
- **注目ポイント**:
  - **"not A but B"**: 「AではなくBである」。`not ~ but ~` で対比を示す定番の文構造。技術定義の訂正・明確化に使われる。`A` が誤解（separate object）、`B` が正解（implicit object）
  - **"an implicit object"**: 「暗黙的なオブジェクト」。`implicit`（暗黙の・明示されていない）は `explicit`（明示的な）の反意語。明示的に作成しなくても存在するオブジェクトを示す
  - **"available with a stage"**: 「ステージとともに利用可能な」。`available with ~`（〜とともに利用可能）で、何かに付随して使えることを示す。`available for ~`（〜のために利用可能）とは異なり「付随・セット」のニュアンス

### 文2: "You can enable the directory table for a stage while creating the stage or enable it afterward."

- **主語 (S)**: You
- **動詞1 (V1)**: can enable
- **目的語1 (O1)**: the directory table
- **修飾語 (M)**: for a stage
- **時間節**: while creating the stage
- **接続**: or
- **動詞2 (V2)**: enable
- **目的語2 (O2)**: it（= the directory table）
- **時間副詞**: afterward
- **文型**: SVO or SVO（選択肢の並列）
- **注目ポイント**:
  - **"while creating the stage or ~ afterward"**: 「ステージ作成時に〜するか、後から〜する」。`while + 動名詞`（同時進行）と `afterward`（その後）が2つの時点の選択肢を示す。どちらのタイミングでも有効化できることを示す
  - **"enable ~ for a stage"**: 「ステージに対して〜を有効化する」。`enable`（有効化する・使えるようにする）+ `for`（対象）の組み合わせ。Directory Tableはステージに「有効化」する概念

### 文3: "Since Directory Tables are not separate objects, you cannot provide privileges to them."

- **主語 (S)**: you
- **動詞 (V)**: cannot provide
- **目的語 (O)**: privileges
- **修飾語 (M)**: to them（= directory tables）
- **理由節**: Since Directory Tables are not separate objects
- **文型**: SVO（理由節付き）
- **注目ポイント**:
  - **"Since ~ , you cannot ~"**: 「〜なので、〜できない」。`Since`（〜なので・〜であるから）が理由を示す接続詞。`because` より書き言葉的・フォーマル
  - **"provide privileges to ~"**: 「〜に権限を付与する」。`assign privileges to ~` と同義。`provide`（提供する）はアクセス制御の文脈でも使われる

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| implicit | 形容詞 | 暗黙的な・明示されていない | A directory table is an implicit object of a stage. |
| available with ~ | 形容詞句 | 〜とともに利用可能 | Directory tables are available with a stage. |
| afterward | 副詞 | 後で・後から | You can enable the directory table afterward. |
| provide privileges to ~ | 動詞句 | 〜に権限を付与する | You cannot provide privileges to implicit objects. |

## 3-3. 解説文（日本語）

> ディレクトリテーブルは独立したデータベースオブジェクトではなく、ステージとともに利用可能な暗黙的なオブジェクトです。ディレクトリテーブルはステージ作成時に有効化することも、後から有効化することもできます。
>
> ディレクトリテーブルは独立したオブジェクトではないため、権限を付与することはできません。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
