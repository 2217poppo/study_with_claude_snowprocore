# 014: Data Unload Default Behavior

**SnowPro Core Domain**: Domain 3 — Data Loading, Unloading, and Connectivity
**作成日**: 2026-04-02
**正答**: A・C・D の3つ（複数選択）
- A. The exported file(s) are compressed.（選択済み・正解）
- B. The data is exported to a single large file.（誤り・未選択）
- C. Each exported file is 16MB in size.（**正しい選択・未選択**）
- D. The data is exported to multiple files.（**正しい選択・未選択**）
- E. The exported file(s) are NOT compressed.（誤り・未選択）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Data Unload（データアンロード） | Snowflakeのテーブルデータをステージやクラウドストレージにエクスポートすること。`COPY INTO @stage` コマンドで実行。 |
| External Stage（外部ステージ） | AWS S3・Azure Blob・GCSなどのクラウドストレージを参照するステージ。データのロード/アンロード先として使用する。 |
| gzip圧縮 | Snowflakeのデータアンロード時のデフォルト圧縮形式。自動的に適用される。`COMPRESSION = NONE` で無効化可能。 |
| MAX_FILE_SIZE | アンロード時の出力ファイルサイズを制御するパラメータ。デフォルト値は**16MB**。最大5GB（クラウドストレージへの書き出し時）。 |
| SINGLE パラメータ | アンロード時に出力を単一ファイルにするかどうかを指定するパラメータ。デフォルトは `FALSE`（複数ファイル）。`SINGLE = TRUE` で単一ファイルに変更可。 |
| Parallelism（並列処理） | Snowflakeが複数ファイルへ並列でアンロードすることで、大規模データの高速エクスポートを実現する仕組み。 |

## 1-2. 重要コンセプトまとめ

- **データアンロードのデフォルト動作（3つ全て正答）**:
  1. **圧縮あり** — gzip で自動圧縮（`COMPRESSION = NONE` で無効化可）
  2. **複数ファイル** — 並列処理のため自動的に分割（`SINGLE = TRUE` で単一ファイルに変更可）
  3. **ファイルサイズ 16MB** — デフォルト（`MAX_FILE_SIZE` パラメータで変更可、最大5GB）

- **デフォルトと変更方法の整理**（試験頻出）:
  | デフォルト動作 | 変更するパラメータ |
  |--------------|-----------------|
  | gzip圧縮あり | `COMPRESSION = NONE` or 別の圧縮形式を指定 |
  | 複数ファイル出力 | `SINGLE = TRUE` |
  | 1ファイル 16MB | `MAX_FILE_SIZE = xxx` |

- **今回のミス**: Aは選べたが C（16MB）とD（複数ファイル）を見逃した
  - 16MBという具体的な数値を覚えていなかった
  - デフォルトが「複数ファイル」であることを覚えていなかった

- **試験ポイント**: 「unloading」「export」というキーワードが出たら以下3点を想起:
  - **gzip圧縮**（デフォルト）
  - **複数ファイル**（デフォルト）
  - **16MB/ファイル**（デフォルトサイズ）

## 1-3. 公式ドキュメントURL

- [Unloading to a Single File](https://docs.snowflake.com/en/user-guide/data-unload-considerations#unloading-to-a-single-file)

---

## 2-1. 問題文（英語）

> You are unloading data from a multi-gigabyte table to an external stage; which of the following statements regarding the exported file(s) are correct? Select all that apply.
>
> A. The exported file(s) are compressed.
> B. The data is exported to a single large file.
> C. Each exported file is 16MB in size.
> D. The data is exported to multiple files.
> E. The exported file(s) are NOT compressed.

## 2-2. 問題文の文法解析

### 文1: "You are unloading data from a multi-gigabyte table to an external stage;"

- **主語 (S)**: You
- **動詞 (V)**: are unloading（現在進行形）
- **目的語 (O)**: data
- **修飾語**: from a multi-gigabyte table（出発点）/ to an external stage（目的地）
- **文型**: SVO + M + M
- **注目ポイント**:
  - 「multi-gigabyte」はハイフン付き複合形容詞。「数ギガバイト規模の」
  - セミコロン（;）で状況設定と質問を区切っている
  - 「unloading ... to an external stage」がこの問題のシナリオを定義する

### 文2: "which of the following statements regarding the exported file(s) are correct?"

- **主語 (S)**: which of the following statements regarding the exported file(s)
- **動詞 (V)**: are
- **補語 (C)**: correct
- **文型**: SVC
- **注目ポイント**:
  - 「file(s)」の括弧付き複数形は「1つまたは複数のファイル」。不確定な数を示す表記
  - 「regarding ~」は「～に関する」。前置詞句が statements を後置修飾

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| unload | verb | アンロードする、エクスポートする | You can unload data to an S3 external stage. |
| multi-gigabyte | adjective | 数ギガバイト規模の | A multi-gigabyte table requires multiple output files. |
| external stage | noun phrase | 外部ステージ（クラウドストレージ） | Data is exported to an external stage by default. |
| file(s) | notation | 1つまたは複数のファイル | The exported file(s) are compressed by default. |

## 2-3. 問題文（日本語）

> 外部ステージに数ギガバイト規模のテーブルからデータをアンロードしています。エクスポートされたファイルに関する以下の記述のうち正しいものはどれですか？該当するものをすべて選びなさい。
>
> A. エクスポートされたファイルは圧縮されている。
> B. データは単一の大きなファイルにエクスポートされる。
> C. 各エクスポートファイルのサイズは16MBである。
> D. データは複数のファイルにエクスポートされる。
> E. エクスポートされたファイルは圧縮されていない。

---

## 3-1. 解説文（英語）

> When data is unloaded from Snowflake, it is automatically compressed using gzip compression. This is the default behavior; however, you can specify alternate compression methods or turn off compression entirely. The unloading process automatically exports to multiple files so that it can take advantage of the parallelism offered by Snowflake. However, if needed, you can set the SINGLE parameter to true to ensure the export goes to a single file. The default size of each output file is 16 MB but can be changed using the MAX_FILE_SIZE parameter. The maximum allowed size per file is 5GB if you export data to cloud storage.

## 3-2. 解説文の文法解析

### 文1: "When data is unloaded from Snowflake, it is automatically compressed using gzip compression."

- **時の副詞節**: When data is unloaded from Snowflake（受動態）
- **主語 (S)**: it（= data）
- **動詞 (V)**: is automatically compressed（受動態）
- **手段**: using gzip compression（現在分詞句）
- **文型**: When節 + SV（受動態）+ 分詞構文
- **注目ポイント**: 「automatically compressed」の automatically がデフォルト動作であることを示す

### 文2: "This is the default behavior; however, you can specify alternate compression methods or turn off compression entirely."

- **文1**: This is the default behavior（SVC）
- **接続副詞**: however（逆接）
- **文2**: you can specify alternate compression methods or turn off compression entirely（SVO）
- **注目ポイント**:
  - 「This is the default behavior」: デフォルト動作を明示するパターン
  - 「turn off ~ entirely」は「～を完全に無効化する」。entirely が強調

### 文3: "The unloading process automatically exports to multiple files so that it can take advantage of the parallelism offered by Snowflake."

- **主語 (S)**: The unloading process
- **動詞 (V)**: automatically exports
- **目的語**: to multiple files
- **目的節**: so that it can take advantage of the parallelism offered by Snowflake
- **文型**: SVO + so that節（目的）
- **注目ポイント**:
  - 「so that ~ can」は「～できるように（目的）」。試験でよく使われる目的の接続詞句
  - 「take advantage of ~」は「～を活用する、利用する」
  - 「offered by Snowflake」は過去分詞句で parallelism を後置修飾

### 文4: "The default size of each output file is 16 MB but can be changed using the MAX_FILE_SIZE parameter."

- **主語 (S)**: The default size of each output file
- **動詞1 (V1)**: is / **動詞2 (V2)**: can be changed（受動態）
- **補語 (C)**: 16 MB
- **手段**: using the MAX_FILE_SIZE parameter
- **文型**: SVC（but）SV + 分詞構文
- **注目ポイント**: 「16MB」という具体的な数値が正答Cの直接の根拠

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| default behavior | noun phrase | デフォルトの動作・挙動 | gzip compression is the default behavior. |
| alternate | adjective | 代替の、別の | You can specify alternate compression methods. |
| take advantage of | phrase | ～を活用する | Multiple files take advantage of parallelism. |
| so that ~ can | 接続詞句 | ～できるように（目的） | Files are split so that Snowflake can parallelize. |
| entirely | adverb | 完全に | You can turn off compression entirely. |

## 3-3. 解説文（日本語）

> Snowflakeからデータがアンロードされると、gzip圧縮を使用して自動的に圧縮されます。これはデフォルトの動作ですが、代替の圧縮方式を指定したり、圧縮を完全に無効にしたりすることもできます。アンロード処理はSnowflakeが提供する並列処理を活用できるよう、自動的に複数のファイルにエクスポートします。ただし、必要に応じて `SINGLE` パラメータを true に設定することで、単一ファイルへのエクスポートにすることもできます。各出力ファイルのデフォルトサイズは16MBですが、`MAX_FILE_SIZE` パラメータで変更できます。クラウドストレージへエクスポートする場合、1ファイルあたりの最大許容サイズは5GBです。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
