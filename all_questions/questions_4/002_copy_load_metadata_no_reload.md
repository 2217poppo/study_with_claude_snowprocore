# 002: COPY Command — Load Metadata Prevents Reloading

**SnowPro Core Domain**: Domain 3 — Data Loading and Unloading
**作成日**: 2026-04-17
**正答**: You have already loaded the single file. Snowflake tracks in metadata if a file has been loaded and will not load it again.

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Load Metadata（ロードメタデータ） | COPY INTOコマンドがどのファイルをロード済みかを追跡する内部メタデータ。ファイル名・ロード時のタイムスタンプなどを記録し、**同じファイルの重複ロードを防ぐ** |
| COPY INTO（COPYコマンド） | ステージからSnowflakeテーブルへデータをロードするコマンド。コマンドが成功（SUCCESS）してもロード済みファイルは再ロードしない |
| Stage（ステージ） | データをロードするための中間的な場所。S3などの外部ストレージ（External Stage）や、Snowflake管理の内部ステージがある |
| Force Reload（強制再ロード） | ロードメタデータを無視して同じファイルを再ロードするオプション。`COPY INTO ... FORCE = TRUE` で指定する |
| Load History（ロード履歴） | COPY INTO / Snowpipeによるロード履歴を記録するメタデータ。`INFORMATION_SCHEMA.LOAD_HISTORY` や `ACCOUNT_USAGE.COPY_HISTORY` で確認できる |

## 1-2. 重要コンセプトまとめ

- **COPY INTOは既ロードファイルを再ロードしない**
  - 同じファイルを再度COPYしてもレコードが0行になる — エラーにはならない（SUCCESS扱い）
  - ロードメタデータがファイル名とタイムスタンプで追跡しているため
- **解決策（再ロードしたい場合）**
  1. 新しいファイル（別名または別内容）をステージに置く
  2. `COPY INTO ... FORCE = TRUE` で強制再ロードする
  3. テーブルをTRUNCATEしてロードメタデータをリセットする
- **混同しやすいシナリオ**:
  - 「コマンドがSUCCESSを返したのにデータが入らない」= ロード済みファイルの典型症状
  - ファイルが破損している場合はエラーになる（SUCCESSではない）
  - ファイルフォーマット不一致の場合もエラーになる
- **クローンとロードメタデータ**: クローン作成時にロードメタデータは引き継がれない（空になる）

## 1-3. 公式ドキュメントURL

- [Load Metadata](https://docs.snowflake.com/en/user-guide/data-load-considerations-load#load-metadata)
- [COPY INTO (Table)](https://docs.snowflake.com/en/sql-reference/sql/copy-into-table)

---

## 2-1. 問題文（英語）

> As a data engineer, you are developing jobs to load data into a snowflake table. You have an S3 stage defined, containing a single file containing 100 rows. You have loaded those 100 rows.
>
> You notice that your COPY command is executing successfully but is not loading any row into the target table.
>
> What could be the reason?
>
> A. The file in the Snowflake stage is corrupt and, therefore, can't be loaded.
> B. You have already loaded the single file that was in the Snowflake stage. Snowflake tracks in metadata if a file has already been loaded and will not load it again.
> C. The file format you have defined for your data is incorrect; therefore, no data is getting loaded.

## 2-2. 問題文の文法解析

### 文1: "As a data engineer, you are developing jobs to load data into a snowflake table."

- **立場の副詞句**: As a data engineer（データエンジニアとして）
- **主語 (S)**: you
- **動詞 (V)**: are developing（開発している / 現在進行形）
- **目的語 (O)**: jobs to load data into a snowflake table（Snowflakeテーブルへデータをロードするジョブ）
- **不定詞句**: to load data into a snowflake table（目的を示す形容詞的不定詞）

### 文2: "You notice that your COPY command is executing successfully but is not loading any row into the target table."

- **主語 (S)**: You
- **動詞 (V)**: notice that（〜に気づく）
- **that節内**:
  - **主語**: your COPY command
  - **動詞1**: is executing（実行されている / 現在進行形）
  - **様態の副詞**: successfully（正常に）
  - **動詞2**: is not loading（ロードしていない / 現在進行形・否定）
  - **目的語**: any row（1行も）
  - **前置詞句**: into the target table
- **注目ポイント**:
  - `but` で対比: 「成功しているが、ロードしていない」という逆接
  - `any` + 否定 = 「1行も〜ない」（強い否定）

### 文3: "What could be the reason?"

- **疑問文形式**: What + could + be（弱い可能性「〜あり得るか」）
- `could be` = 可能性を問う婉曲表現。`can be` より確実性が低い

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| execute successfully | 動詞句 | 正常に実行される | The COPY command executed successfully with 0 rows loaded. |
| load data into | 動詞句 | データを〜にロードする | Load data into a Snowflake table using COPY INTO. |
| target table | 名詞句 | ターゲットテーブル（ロード先） | No rows were inserted into the target table. |
| corrupt | 形容詞 | 破損した | A corrupt file cannot be loaded by Snowflake. |

## 2-3. 問題文（日本語）

> データエンジニアとして、Snowflakeテーブルにデータをロードするジョブを開発しています。100行を含む単一のファイルが格納されたS3ステージが定義されており、すでにその100行をロードしました。
>
> COPYコマンドが正常に実行されているにもかかわらず、ターゲットテーブルに1行もロードされていないことに気づきました。
>
> 原因として考えられるのは何ですか？
>
> A. Snowflakeステージ内のファイルが破損しているためロードできない
> B. すでにそのファイルをロード済みであり、Snowflakeはメタデータで追跡しているため再ロードしない
> C. 定義したファイルフォーマットが正しくないためデータがロードされない

---

## 3-1. 解説文（英語）

> The load metadata stores a variety of information, such as the name of every file that was loaded into that table and the time stamp corresponding to the time that a file was loaded. By utilizing this load metadata, Snowflake ensures that it will not reprocess a previously loaded file. Since you have already loaded this file, Snowflake will track through metadata which files have been loaded and will not process them again. If you want to retest your copy command, you must place a new file or force the reload by specifying specific parameters during the load process.
>
> https://docs.snowflake.com/en/user-guide/data-load-considerations-load#load-metadata

## 3-2. 解説文の文法解析

### 文1: "The load metadata stores a variety of information, such as the name of every file that was loaded into that table and the time stamp corresponding to the time that a file was loaded."

- **主語 (S)**: The load metadata
- **動詞 (V)**: stores（保存する）
- **目的語 (O)**: a variety of information（様々な情報）
- **例示句**: such as the name of every file... and the time stamp...（ファイル名とタイムスタンプなど）
- **注目ポイント**:
  - `a variety of` = 「様々な〜」（さまざまな種類があることを示す）
  - `such as` = 「たとえば〜」（例示の定番表現）
  - `corresponding to ~` = 「〜に対応する」（the time stamp corresponding to the time = ロード時刻に対応するタイムスタンプ）

### 文2: "By utilizing this load metadata, Snowflake ensures that it will not reprocess a previously loaded file."

- **手段の副詞句**: By utilizing this load metadata（このロードメタデータを利用することで）
- **主語 (S)**: Snowflake
- **動詞 (V)**: ensures that（〜を確実にする）
- **that節**: it will not reprocess a previously loaded file（以前にロードされたファイルを再処理しない）
- **注目ポイント**:
  - `by + 動名詞` = 手段を示す（〜することによって）
  - `utilize` = 活用する（use よりフォーマル）
  - `reprocess` = 再処理する（`re-` 接頭辞は「再び」を意味する）
  - `previously loaded` = 以前にロードされた（過去分詞の後置修飾）

### 文3: "If you want to retest your copy command, you must place a new file or force the reload by specifying specific parameters during the load process."

- **条件節**: If you want to retest your copy command
- **主語 (S)**: you
- **動詞 (V)**: must place ... or force（置かなければならない、または強制しなければならない）
- **方法**: by specifying specific parameters during the load process（ロードプロセス中に特定のパラメータを指定することで）
- **注目ポイント**:
  - `force the reload` = 強制再ロード（`FORCE = TRUE` パラメータに対応）
  - `by specifying` = 指定することによって（手段）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| a variety of | 限定詞句 | 様々な種類の | The metadata stores a variety of information. |
| by utilizing | 副詞句 | 〜を利用することで | By utilizing metadata, Snowflake prevents duplicates. |
| reprocess | 動詞 | 再処理する | Snowflake will not reprocess a previously loaded file. |
| previously loaded | 形容詞句 | 以前にロードされた | A previously loaded file will be skipped. |
| force the reload | 動詞句 | 強制的に再ロードする | Use FORCE = TRUE to force the reload. |

## 3-3. 解説文（日本語）

> ロードメタデータには、そのテーブルにロードされた全ファイルの名前やロード時刻に対応するタイムスタンプなど、様々な情報が格納されています。このロードメタデータを利用することで、Snowflakeは以前にロードされたファイルを再処理しないことを保証します。すでにこのファイルをロードしているため、Snowflakeはメタデータを通じてどのファイルがロード済みかを追跡し、再処理しません。COPYコマンドを再テストしたい場合は、新しいファイルを置くか、ロードプロセス中に特定のパラメータを指定して強制再ロードを行う必要があります。

---

## 復習メモ

- [ ] COPY INTOが成功（SUCCESS）しても0行の場合はロード済みファイルが原因と覚えた
- [ ] 解決策は「新しいファイル」または「FORCE = TRUE」を理解した
- [ ] `by utilizing ~`（〜を利用することで）の構文を確認した
