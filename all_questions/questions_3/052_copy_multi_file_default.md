# 052: COPY Multi-File Default

**SnowPro Core Domain**: Domain 3 — Data Loading, Unloading, and Connectivity
**作成日**: 2026-04-15
**正答**: False

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| COPY Unload Default | デフォルトで**複数ファイル**にエクスポート（単一ファイルではない）。並列処理のため |
| SINGLE Parameter | TRUEに設定すると単一ファイルに出力。デフォルトはFALSE |
| MAX_FILE_SIZE | 出力ファイルサイズ。デフォルト**16MB**。最大5GB |

## 1-2. 重要コンセプトまとめ

- COPYアンロードのデフォルト = **複数ファイル出力**（False）
- デフォルト3点セット: **gzip圧縮 + 複数ファイル + 16MB/ファイル**
- 単一ファイルにしたい場合: `SINGLE = TRUE`
- 複数ファイルにする理由: Snowflakeの**並列処理を活用**するため

## 1-3. 公式ドキュメントURL

- [Unloading to a Single File](https://docs.snowflake.com/en/user-guide/data-unload-considerations#unloading-to-a-single-file)

---

## 2-1. 問題文（英語）

> True or False: The COPY command exports to a single file by default.
>
> A. True
> B. False

## 2-3. 問題文（日本語）

> 真/偽: COPYコマンドはデフォルトで単一ファイルにエクスポートする。

---

## 3-1. 解説文（英語）

> The unloading process automatically exports to multiple files so that it can take advantage of the parallelism offered by Snowflake. However, if needed, you can set the SINGLE parameter to true to ensure the export goes to a single file. The default size of each output file is 16 MB but can be changed using the MAX_FILE_SIZE parameter. The maximum allowed size per file is 5GB if you export data to cloud storage.

## 3-3. 解説文（日本語）

> アンロードプロセスはSnowflakeの並列処理を活用するため自動的に複数ファイルにエクスポートします。SINGLEパラメータをTRUEに設定すると単一ファイル出力になります。各出力ファイルのデフォルトサイズは16MBで、MAX_FILE_SIZEで変更可能（最大5GB）です。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
