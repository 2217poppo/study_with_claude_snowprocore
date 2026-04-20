# 016: Directory Table vs LIST Command — Output Columns

**SnowPro Core Domain**: Domain 3 — Data Loading, Unloading, and Connectivity
**作成日**: 2026-04-02
**正答**: A と B（2つ）
- A. `SELECT * FROM DIRECTORY(@FLIGHTS_STAGE);`（選択済み・正解）
- B. `SELECT * FROM DIRECTORY(@FLIGHTS_STAGE) WHERE SIZE > 1000;`（**正しい選択・未選択**）
- C. `LIST @FLIGHTS_STAGE;`（誤り・未選択）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Directory Table（ディレクトリテーブル） | ステージに存在するファイルのメタデータ（ファイル名、サイズ、最終更新日、ETag等）を保持する仮想テーブル。`SELECT * FROM DIRECTORY(@stage_name)` でクエリ可能。 |
| DIRECTORY() 関数 | ステージのディレクトリテーブルをクエリするための関数。引数に `@ステージ名` を指定。WHERE句でフィルタリング可能。 |
| LIST コマンド | ステージ内のファイル一覧を表示するコマンド。`LIST @stage_name;` で実行。出力列がDIRECTORY()と**異なる**。 |
| External Stage（外部ステージ） | S3・Azure Blob・GCSなどのクラウドストレージを参照するステージ。`@` 記号でステージを参照する。 |
| Result Set Columns（結果セットの列） | クエリ結果に含まれる列の構成。同じ列構成であればWHERE句の有無は関係ない（列数・列名が同じ）。 |

## 1-2. 重要コンセプトまとめ

- **この問題のポイント**: 「同じ列を返すコマンドはどれか」

- **DIRECTORY() と LIST の出力列の違い**:
  | コマンド | 出力列の例 |
  |---------|-----------|
  | `SELECT * FROM DIRECTORY(@stage)` | RELATIVE_PATH, SIZE, LAST_MODIFIED, MD5, ETAG, FILE_URL |
  | `LIST @stage` | name, size, md5, last_modified |
  - 両者は**異なる列構成**を持つ → 同じ列を返さない

- **A と B が「同じ列」を返す理由**:
  - どちらも `SELECT * FROM DIRECTORY(@FLIGHTS_STAGE)` の形式
  - B は WHERE 句が追加されているが、**列構成（SELECT *）は同じ**
  - WHERE 句は返される**行**を絞り込むだけで、**列**には影響しない

- **今回のミス**: B を見逃した。WHERE 句があると別のものに見えてしまったが、`SELECT *` の列構成はWHERE句に関係なく同じ

- **試験ポイント**:
  - `DIRECTORY(@stage)` ← SQL（SELECT文で使用可）
  - `LIST @stage` ← コマンド（SQLではない）
  - 両者は**出力列が異なる**

## 1-3. 公式ドキュメントURL

- [Directory Table Output](https://docs.snowflake.com/en/user-guide/data-load-dirtables-manage#output)
- [LIST Command Output](https://docs.snowflake.com/en/sql-reference/sql/list#output)

---

## 2-1. 問題文（英語）

> Imagine an external stage named FLIGHTS_STAGE.
>
> Which of the following commands produce the same columns in the result set?
>
> Select all that apply.
>
> A. SELECT * FROM DIRECTORY(@FLIGHTS_STAGE);
> B. SELECT * FROM DIRECTORY(@FLIGHTS_STAGE) WHERE SIZE > 1000;
> C. LIST @FLIGHTS_STAGE;

## 2-2. 問題文の文法解析

### 文1: "Imagine an external stage named FLIGHTS_STAGE."

- **動詞 (V)**: Imagine（命令形）
- **目的語 (O)**: an external stage named FLIGHTS_STAGE（過去分詞 named が後置修飾）
- **文型**: V + O
- **注目ポイント**: 「Imagine ~」は試験問題でシナリオを設定する命令形。「～を想定してください」

### 文2: "Which of the following commands produce the same columns in the result set?"

- **主語 (S)**: Which of the following commands（複数 → produce）
- **動詞 (V)**: produce
- **目的語 (O)**: the same columns
- **修飾語 (M)**: in the result set
- **文型**: SVO + M
- **注目ポイント**:
  - 「the same columns」が問題の核心。行ではなく「列」が同じかどうかを問う
  - 「result set」は「クエリ結果のセット」。SQL用語

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| result set | noun phrase | 結果セット（クエリの出力） | Both queries produce the same columns in the result set. |
| column | noun | 列（テーブルの縦方向） | The WHERE clause filters rows, not columns. |
| directory table | noun phrase | ディレクトリテーブル | Query a directory table using DIRECTORY(@stage). |
| named | past participle | ～という名前の（後置修飾） | A stage named FLIGHTS_STAGE is used here. |

## 2-3. 問題文（日本語）

> FLIGHTS_STAGEという名前の外部ステージがあるとします。
>
> 次のコマンドのうち、結果セットで同じ列を返すものはどれですか？
>
> 該当するものをすべて選びなさい。
>
> A. SELECT * FROM DIRECTORY(@FLIGHTS_STAGE);
> B. SELECT * FROM DIRECTORY(@FLIGHTS_STAGE) WHERE SIZE > 1000;
> C. LIST @FLIGHTS_STAGE;

---

## 3-1. 解説文（英語）

> The columns in the output obtained from querying a directory table differ from those in the output when listing a stage.

## 3-2. 解説文の文法解析

### 文1: "The columns in the output obtained from querying a directory table differ from those in the output when listing a stage."

- **主語 (S)**: The columns in the output obtained from querying a directory table
  - 過去分詞句: obtained from querying a directory table（output を後置修飾）
  - 動名詞句: querying a directory table（from の目的語）
- **動詞 (V)**: differ from
- **比較対象 (O)**: those in the output when listing a stage
  - those = the columns（前出の名詞の代用）
  - 分詞構文: when listing a stage（「ステージをリストするとき」）
- **文型**: SV（句動詞 differ from）+ O
- **注目ポイント**:
  - 「differ from ~」は「～と異なる」（009でも登場）
  - 「those」は前出の名詞（the columns）を受ける代名詞。繰り返しを避ける
  - 「obtained from + 動名詞」は「～することで得られた」。受動の複合修飾

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| obtained from | 過去分詞句 | ～から得られた | Output obtained from querying a directory table. |
| those | pronoun | それら（前出の名詞の代用） | The columns differ from those in the LIST output. |
| when listing | 分詞構文 | リストするとき | Different columns appear when listing a stage. |

## 3-3. 解説文（日本語）

> ディレクトリテーブルをクエリして得られる出力の列は、ステージをリストしたときの出力の列とは異なります。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
