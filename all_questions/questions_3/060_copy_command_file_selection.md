# 060: COPY Command File Selection

**SnowPro Core Domain**: Domain 3 — Data Loading, Unloading, and Connectivity
**作成日**: 2026-04-16
**正答**: A, B, C

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| COPY INTO（COPYコマンド） | ステージからSnowflakeテーブルへデータをロードするコマンド。ファイル選択・フォーマット指定・簡易変換が可能 |
| Stage（ステージ） | データファイルを一時的に保管する場所。Internal Stage（内部）とExternal Stage（外部：S3/Azure Blob/GCS）がある |
| FILES パラメータ | COPY INTOコマンドで特定のファイル名を直接指定してロードするパラメータ |
| PATTERN パラメータ | COPY INTOコマンドで正規表現パターンに一致するファイルをロードするパラメータ |
| Path（パス） | ステージ内のディレクトリパス。特定のパスを指定すると、そのパス配下の全ファイルがロード対象になる |

## 1-2. 重要コンセプトまとめ

- COPYコマンドのファイル選択には**3つのオプション**がある:
  1. **正確なファイル名を指定**（FILES パラメータ）
  2. **特定のパス配下の全ファイル**をロード
  3. **パターンに一致するファイル**をロード（PATTERN パラメータ）
- すべてのオプションが正解であることに注意（「選択は正解です」のトリック問題）
- FILES は個別のファイル名をリストで指定: `FILES = ('file1.csv', 'file2.csv')`
- PATTERN は正規表現: `PATTERN = '.*data.*[.]csv'`

## 1-3. 公式ドキュメントURL

- [Options for Selecting Staged Data Files](https://docs.snowflake.com/en/user-guide/data-load-considerations-load#options-for-selecting-staged-data-files)

---

## 2-1. 問題文（英語）

> The COPY command allows the following options for selecting files for loading data from a stage. Select all that apply.
>
> A. Load files that match a pattern.
> B. Load all files in a specific path.
> C. Load specific files by providing exact file names.

## 2-2. 問題文の文法解析

### 文1: "The COPY command allows the following options for selecting files for loading data from a stage."

- **主語 (S)**: The COPY command
- **動詞 (V)**: allows
- **目的語 (O)**: the following options
- **修飾語 (M)**: for selecting files（目的を示す前置詞句）/ for loading data from a stage（目的の連鎖）
- **文型**: SVO
- **注目ポイント**: 「for + 動名詞」が2回連鎖し、目的の階層を示す。「selecting files for loading data」で「データロードのためのファイル選択」。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| allow | 動詞 | 許可する、可能にする | The COPY command allows multiple options. |
| match a pattern | 動詞句 | パターンに一致する | Load files that match a pattern. |
| specific | 形容詞 | 特定の | Load all files in a specific path. |
| exact | 形容詞 | 正確な | Provide exact file names. |

## 2-3. 問題文（日本語）

> COPYコマンドは、ステージからデータをロードするためのファイル選択に以下のオプションを提供します。該当するものをすべて選んでください。
>
> A. パターンに一致するファイルをロードする。
> B. 特定のパス内のすべてのファイルをロードする。
> C. 正確なファイル名を指定して特定のファイルをロードする。

---

## 3-1. 解説文（英語）

> All of these options are correct. You can load by providing exact file names, load all files from a specific path, or load files that match a pattern. https://docs.snowflake.com/en/user-guide/data-load-considerations-load#options-for-selecting-staged-data-files

## 3-2. 解説文の文法解析

### 文1: "All of these options are correct."

- **主語 (S)**: All of these options
- **動詞 (V)**: are
- **補語 (C)**: correct
- **文型**: SVC

### 文2: "You can load by providing exact file names, load all files from a specific path, or load files that match a pattern."

- **主語 (S)**: You
- **動詞 (V)**: can load ... load ... or load（3つの動作を並列）
- **修飾語 (M)**: by providing exact file names / from a specific path / that match a pattern（関係詞節）
- **文型**: SVO（3並列）
- **注目ポイント**: 「A, B, or C」の3つの選択肢を等位接続詞で並列。「by providing」で手段を示す。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| by providing | 前置詞+動名詞 | ～を提供することによって | Load by providing exact file names. |

## 3-3. 解説文（日本語）

> これらのオプションはすべて正しいです。正確なファイル名を指定してロード、特定のパスからすべてのファイルをロード、またはパターンに一致するファイルをロードすることができます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
