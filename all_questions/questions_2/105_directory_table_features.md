# 105: Directory Table Features

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-14
**正答**: A, D

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Directory Table | ステージ内のファイルのカタログ情報を提供。物理データは保存しない。内部/外部ステージ両対応 |
| File URL | Directory Tableクエリで取得できるファイルへのURL。長期有効で期限なし |
| Stage Object | データファイルを保管するSnowflakeオブジェクト（内部/外部ステージ） |

## 1-2. 重要コンセプトまとめ

- Directory Tableの特徴:
  - ステージ内ファイルの**カタログ（メタデータ一覧）** を提供 ✅
  - File URLを取得可能 ✅
  - **物理データを保存しない**（メタデータのみ）
  - **クラスタリングキーは定義不可**（通常テーブルとは異なる）
  - CSVデータをVARIANT列に保存するものではない

## 1-3. 公式ドキュメントURL

- [Directory Tables](https://docs.snowflake.com/en/user-guide/data-load-dirtables)

---

## 2-1. 問題文（英語）

> Which of the following is correct regarding a directory table? Select all that apply.
>
> A. A directory table provides a catalog of files staged in a Stage object.
> B. Directory tables store CSV data in a VARIANT column.
> C. Clustering keys can be defined on directory tables.
> D. You can query a directory table to obtain File URLs for each file in a Stage.

## 2-2. 問題文の文法解析

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| catalog | noun | カタログ、一覧 | Provides a catalog of staged files. |
| staged in ~ | phrase | ～にステージされた | Files staged in a Stage object. |
| do not physically store data | phrase | 物理的にデータを保存しない | Directory tables do not physically store data. |

## 2-3. 問題文（日本語）

> ディレクトリテーブルに関して正しいのはどれですか？

---

## 3-1. 解説文（英語）

> Directory tables store and present a catalog of files available in an internal or external stage. You can query the directory table associated with a stage to get a list of file URLs that can be used to access the files in the stage object. Directory tables do not physically store data; therefore, they do not act like ordinary tables, which can be clustered.

## 3-3. 解説文（日本語）

> ディレクトリテーブルは内部/外部ステージ内のファイルのカタログを保存・表示します。ステージに関連付けられたディレクトリテーブルをクエリすると、ファイルへのFile URLリストを取得できます。ディレクトリテーブルは物理的にデータを保存しないため、クラスタリングが可能な通常テーブルのようには動作しません。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
