# 096: Columnar Storage in Micro-Partitions

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-14
**正答**: Independently (columnar storage)

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Columnar Storage（列指向ストレージ） | データを列単位で独立して保存する形式。Snowflakeのマイクロパーティション内で採用。分析クエリに有利で圧縮効率が高い |
| Row Storage（行指向ストレージ） | データを行単位でまとめて保存する形式。従来型RDBMS（MySQL等）が採用。トランザクション処理に有利 |
| Independent Compression | 各列が独立して圧縮される仕組み。列ごとに最適な圧縮アルゴリズムをSnowflakeが選択 |

## 1-2. 重要コンセプトまとめ

- マイクロパーティション内のデータは **列指向（columnar）** で保存
- 各列は**独立して（independently）** 保存・圧縮される
- 列指向の利点:
  - クエリで参照された列のみを取得（不要な列を読まない）
  - 列ごとに最適な圧縮アルゴリズムを適用
  - 分析クエリ（集計・フィルタ）に高いパフォーマンス
- 行指向（row storage）ではない — これはひっかけ

## 1-3. 公式ドキュメントURL

- [Micro-partitions & Data Clustering](https://docs.snowflake.com/en/user-guide/tables-clustering-micropartitions)

---

## 2-1. 問題文（英語）

> How are the columns stored in a Snowflake micro-partition?
>
> A. Combined - columns for a given row are stored together, also known as row storage.
> B. Independently - each column is stored on its own, also known as columnar storage.

## 2-2. 問題文の文法解析

### 選択肢B: "Independently - each column is stored on its own, also known as columnar storage."

- **注目ポイント**: `on its own` は「独立して」。`also known as ~` は「～とも呼ばれる」。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| independently | adverb | 独立して | Each column is stored independently. |
| on its own | phrase | 独立して | Each column is stored on its own. |
| columnar | adjective | 列指向の | Columnar storage format. |
| optimum compression algorithm | noun | 最適な圧縮アルゴリズム | Snowflake chooses the optimum algorithm. |

## 2-3. 問題文（日本語）

> Snowflakeのマイクロパーティション内で列はどのように保存されますか？
>
> A. 結合 - ある行の列がまとめて保存される（行指向ストレージ）
> B. 独立 - 各列が独立して保存される（列指向ストレージ）

---

## 3-1. 解説文（英語）

> Snowflake stores columns in a columnar manner within each micro-partition. A columnar format enables Snowflake to optimize queries by retrieving only the referenced columns. In addition to micro-partition compression, each column in a micro-partition is compressed independently. Snowflake chooses the optimum compression algorithm for each column.

## 3-2. 解説文の文法解析

### 文1: "A columnar format enables Snowflake to optimize queries by retrieving only the referenced columns."

- **注目ポイント**: `enables ~ to ~` で「～が～することを可能にする」。`only the referenced columns` で「参照された列のみ」— 列指向の核心的利点。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| in a columnar manner | phrase | 列指向の方法で | Stores columns in a columnar manner. |
| retrieving only the referenced columns | phrase | 参照された列のみを取得して | Optimize by retrieving only referenced columns. |
| compressed independently | phrase | 独立して圧縮される | Each column is compressed independently. |

## 3-3. 解説文（日本語）

> Snowflakeは各マイクロパーティション内でデータを列指向の方法で保存します。列指向フォーマットにより、参照された列のみを取得してクエリを最適化できます。マイクロパーティション圧縮に加えて、各列が独立して圧縮されます。Snowflakeは各列に対して最適な圧縮アルゴリズムを選択します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
