# 044: COPY Unload Compression

**SnowPro Core Domain**: Domain 3 — Data Loading, Unloading, and Connectivity
**作成日**: 2026-04-13
**正答**: True

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| COPY INTO (Unload) | Snowflakeのテーブルデータを外部ファイルにエクスポートするコマンド。`COPY INTO @stage` の形式。ロード時の `COPY INTO table` とは逆方向 |
| gzip Compression | アンロード時のデフォルト圧縮方式。COMPRESSIONパラメータで変更可能。圧縮なし（NONE）も指定可能 |
| SINGLE Parameter | アンロード時に出力を単一ファイルにするパラメータ。デフォルトFALSE（複数ファイル出力）。TRUEで1ファイルに統合 |
| MAX_FILE_SIZE Parameter | アンロード時の出力ファイルサイズを指定するパラメータ。デフォルト16MB。クラウドストレージへの出力時は最大5GB |
| Parallelism（並列処理） | Snowflakeが複数ファイルに分割してエクスポートすることで並列処理を実現する仕組み |

## 1-2. 重要コンセプトまとめ

- データアンロード時のデフォルト動作（3つ覚える）:
  1. **gzip圧縮あり**（自動）
  2. **複数ファイル出力**（並列処理のため）
  3. **1ファイルあたり16MB**
- それぞれ変更可能:
  - 圧縮: `COMPRESSION` パラメータ（gzip/bz2/brotli/zstd/NONE等）
  - ファイル数: `SINGLE = TRUE` で1ファイル出力
  - サイズ: `MAX_FILE_SIZE` で変更（最大5GB）
- デフォルトで圧縮されるので、**True** が正解
- アンロードが自動で複数ファイルに分割されるのは、Snowflakeの並列処理を活用するため

## 1-3. 公式ドキュメントURL

- [Unloading Considerations](https://docs.snowflake.com/en/user-guide/data-unload-considerations#unloading-to-a-single-file)

---

## 2-1. 問題文（英語）

> True or False: When exporting data using the COPY command, the exported file(s) are automatically compressed.
>
> A. False
> B. True

## 2-2. 問題文の文法解析

### 文1: "When exporting data using the COPY command, the exported file(s) are automatically compressed."

- **主語 (S)**: the exported file(s)
- **動詞 (V)**: are compressed（受動態）
- **修飾語 (M)**: When exporting data using the COPY command（分詞構文・条件）、automatically（副詞）
- **文型**: SV（受動態）
- **注目ポイント**: `When exporting ~` は分詞構文。`file(s)` の表記で単数・複数両方を示す。`automatically compressed` がキーフレーズ。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| export | verb | エクスポートする、出力する | Export data using the COPY command. |
| compress | verb | 圧縮する | Files are automatically compressed. |
| automatically | adverb | 自動的に | Data is automatically compressed with gzip. |

## 2-3. 問題文（日本語）

> 真か偽か: COPYコマンドを使用してデータをエクスポートする際、エクスポートされたファイルは自動的に圧縮される。
>
> A. 偽
> B. 真

---

## 3-1. 解説文（英語）

> When data is unloaded from Snowflake, it is automatically compressed using gzip compression. This is the default behavior; however, you can specify alternate compression methods or turn off compression entirely. The unloading process automatically exports to multiple files so that it can take advantage of the parallelism offered by Snowflake. However, if needed, you can set the SINGLE parameter to true to ensure the export goes to a single file. The default size of each output file is 16 MB but can be changed using the MAX_FILE_SIZE parameter. The maximum allowed size per file is 5GB if you export data to cloud storage.

## 3-2. 解説文の文法解析

### 文1: "When data is unloaded from Snowflake, it is automatically compressed using gzip compression."

- **主語 (S)**: it（= data）
- **動詞 (V)**: is compressed（受動態）
- **修飾語 (M)**: When data is unloaded from Snowflake（条件節）、automatically（副詞）、using gzip compression（手段）
- **文型**: SV（受動態）
- **注目ポイント**: `When + 受動態, 主節（受動態）` の二重受動態構造。`using ~` は分詞構文で手段を示す。

### 文2: "This is the default behavior; however, you can specify alternate compression methods or turn off compression entirely."

- **主語 (S)**: you
- **動詞 (V)**: can specify ... or turn off（並列動詞）
- **目的語 (O)**: alternate compression methods / compression
- **修飾語 (M)**: however（逆接）、entirely（副詞「完全に」）
- **文型**: SVO
- **注目ポイント**: `; however, ~` でデフォルト動作の例外を提示。`turn off ~ entirely` で「完全にオフにする」。デフォルト → 変更可能の流れは試験解説の定番。

### 文3: "The unloading process automatically exports to multiple files so that it can take advantage of the parallelism offered by Snowflake."

- **主語 (S)**: The unloading process
- **動詞 (V)**: exports
- **修飾語 (M)**: automatically（副詞）、to multiple files（出力先）、so that it can take advantage of the parallelism offered by Snowflake（目的節）
- **文型**: SV
- **注目ポイント**: `so that ~ can ~` は「～できるように」。`offered by Snowflake` は過去分詞の後置修飾。並列処理を活用するための設計意図。

### 文4: "The default size of each output file is 16 MB but can be changed using the MAX_FILE_SIZE parameter."

- **主語 (S)**: The default size of each output file
- **動詞 (V)**: is / can be changed（並列）
- **補語/修飾語**: 16 MB / using the MAX_FILE_SIZE parameter
- **文型**: SVC + SV
- **注目ポイント**: デフォルト値 + 変更可能のパターン。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| unload | verb | アンロードする、出力する | Data is unloaded from Snowflake. |
| alternate | adjective | 代替の | Specify alternate compression methods. |
| turn off ~ entirely | phrase | 完全にオフにする | Turn off compression entirely. |
| parallelism | noun | 並列処理 | Take advantage of the parallelism. |
| per file | phrase | ファイルあたり | The maximum allowed size per file is 5GB. |

## 3-3. 解説文（日本語）

> Snowflakeからデータをアンロードする際、gzip圧縮を使って自動的に圧縮されます。これはデフォルトの動作ですが、代替の圧縮方式を指定したり、圧縮を完全にオフにしたりすることもできます。アンロードプロセスは自動的に複数ファイルにエクスポートし、Snowflakeが提供する並列処理を活用できるようにしています。ただし、必要に応じてSINGLEパラメータをtrueに設定し、単一ファイルへの出力を確保できます。各出力ファイルのデフォルトサイズは16MBですが、MAX_FILE_SIZEパラメータで変更できます。クラウドストレージへのエクスポート時のファイルあたりの最大許容サイズは5GBです。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
