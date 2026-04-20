# 103: Proprietary Columnar Format

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-14
**正答**: B

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Proprietary Format（独自フォーマット） | Snowflake独自のデータ保存形式。Parquet等の標準フォーマットではない。列指向で圧縮される |
| Columnar Format | 列指向の保存形式。参照された列のみ取得可能で分析クエリに有利 |
| Cloud Object Storage | データの永続保存先。AWS S3/Azure Blob/GCS |

## 1-2. 重要コンセプトまとめ

- Snowflakeは**独自の列指向フォーマット（proprietary columnar format）**でデータを保存
- Parquet/CSV/JSONではない — Snowflake独自のフォーマット
- クラウドオブジェクトストレージ（S3/Azure Blob/GCS）上に保存
- 列指向フォーマットの利点: 参照された列のみ取得でクエリ最適化

## 1-3. 公式ドキュメントURL

- [Micro-partitions & Data Clustering](https://docs.snowflake.com/en/user-guide/tables-clustering-micropartitions)

---

## 2-1. 問題文（英語）

> Which of the following statement is true regarding how Snowflake stores its data?
>
> A. Snowflake uses the Parquet file format to store the table data.
> B. Snowflake uses its own proprietary columnar format to store table data.
> C. Snowflake stores table data as simple comma-separated files in cloud-based storage.

## 2-2. 問題文の文法解析

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| proprietary | adjective | 独自の、専有の | Proprietary columnar format. |

## 2-3. 問題文（日本語）

> Snowflakeのデータ保存方法に関して正しいのはどれですか？

---

## 3-1. 解説文（英語）

> Snowflake stores data in a proprietary format on cloud object storage, such as AWS S3, Azure Blob Storage, or Google Cloud Storage. Snowflake stores columns in a columnar manner. The columnar format enables Snowflake to optimize queries by retrieving only the referenced columns.

## 3-3. 解説文（日本語）

> Snowflakeはクラウドオブジェクトストレージ上に独自フォーマットでデータを保存します。列指向で保存し、参照された列のみを取得してクエリを最適化できます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
