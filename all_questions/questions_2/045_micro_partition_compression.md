# 045: Micro-Partition Compression

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-13
**正答**: True

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Micro-Partition（マイクロパーティション） | Snowflakeがデータを内部的に分割する単位。50〜500MBの非圧縮データを含む。圧縮・列指向形式で保存される |
| Compression（圧縮） | データのサイズを小さくする技術。Snowflakeはマイクロパーティション内のデータを常に圧縮して保存する。ユーザーによる設定不要 |
| Columnar Format（列指向フォーマット） | データを列単位で保存する形式。分析クエリに有利で圧縮効率が高い。Snowflakeの各マイクロパーティション内で採用 |
| Uncompressed Data（非圧縮データ） | 圧縮前のデータサイズ。マイクロパーティションのサイズ（50〜500MB）はこの非圧縮サイズで表現される。実際の保存サイズは圧縮により小さい |

## 1-2. 重要コンセプトまとめ

- マイクロパーティション内のデータは **常に圧縮して保存** される（デフォルトで自動）
- サイズの表記に注意:
  - 「50〜500MB」は **非圧縮（uncompressed）** でのサイズ
  - 実際の保存サイズは圧縮により **さらに小さい**
- マイクロパーティション内のデータは **列指向（columnar）** で保存
- 圧縮 + 列指向の組み合わせにより:
  - ストレージコストの削減
  - I/O効率の向上
  - クエリパフォーマンスの向上
- マイクロパーティションは **不変（immutable）** — 作成後は変更されず、更新時は新しいパーティションが作成される

## 1-3. 公式ドキュメントURL

- [Micro-partitions & Data Clustering](https://docs.snowflake.com/en/user-guide/tables-clustering-micropartitions)

---

## 2-1. 問題文（英語）

> True/False: Data in micro-partitions is stored with compression.
>
> A. False
> B. True

## 2-2. 問題文の文法解析

### 文1: "Data in micro-partitions is stored with compression."

- **主語 (S)**: Data in micro-partitions
- **動詞 (V)**: is stored（受動態）
- **修飾語 (M)**: with compression（手段・方法）
- **文型**: SV（受動態）
- **注目ポイント**: `with compression` は「圧縮を伴って」。`Data` は不可算名詞なので単数動詞 `is`。シンプルな受動態の文。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| store | verb | 保存する | Data is stored with compression. |
| compression | noun | 圧縮 | Snowflake always uses compression. |
| micro-partition | noun | マイクロパーティション | Data in micro-partitions is columnar. |

## 2-3. 問題文（日本語）

> 真/偽: マイクロパーティション内のデータは圧縮されて保存される。
>
> A. 偽
> B. 真

---

## 3-1. 解説文（英語）

> Data in Snowflake tables is automatically organized into partitions, known as micro-partition. Each micro-partition generally contains 50MB to 500 MB of uncompressed data. However, the stored size is smaller as Snowflake data is always stored with compression. Within each micro-partition, the data is stored in a columnar format.

## 3-2. 解説文の文法解析

### 文1: "Data in Snowflake tables is automatically organized into partitions, known as micro-partition."

- **主語 (S)**: Data in Snowflake tables
- **動詞 (V)**: is organized（受動態）
- **修飾語 (M)**: automatically（副詞）、into partitions（変換先）、known as micro-partition（過去分詞の後置修飾）
- **文型**: SV（受動態）
- **注目ポイント**: `organized into ~` は「～に編成される」。`known as ~` は「～として知られる」（過去分詞の後置修飾で別名を紹介）。

### 文2: "Each micro-partition generally contains 50MB to 500 MB of uncompressed data."

- **主語 (S)**: Each micro-partition
- **動詞 (V)**: contains
- **目的語 (O)**: 50MB to 500 MB of uncompressed data
- **修飾語 (M)**: generally（副詞「一般的に」）
- **文型**: SVO
- **注目ポイント**: `generally` は「一般的に」で厳密な値ではないことを示す。`uncompressed` が重要 — サイズは非圧縮での値。

### 文3: "However, the stored size is smaller as Snowflake data is always stored with compression."

- **主語 (S)**: the stored size
- **動詞 (V)**: is
- **補語 (C)**: smaller
- **修飾語 (M)**: However（逆接）、as Snowflake data is always stored with compression（理由節）
- **文型**: SVC
- **注目ポイント**: `as ~` は「～なので」（理由）。`always stored with compression` で「常に圧縮して保存」。`However` で前文の「50〜500MB」と実際のサイズの違いを対比。

### 文4: "Within each micro-partition, the data is stored in a columnar format."

- **主語 (S)**: the data
- **動詞 (V)**: is stored（受動態）
- **修飾語 (M)**: Within each micro-partition（場所）、in a columnar format（形式）
- **文型**: SV（受動態）
- **注目ポイント**: `in a columnar format` で列指向の保存形式を示す。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| organize into ~ | phrase | ～に編成する | Data is organized into micro-partitions. |
| uncompressed | adjective | 非圧縮の | 50-500 MB of uncompressed data. |
| stored size | noun | 保存サイズ | The stored size is smaller due to compression. |
| columnar format | noun | 列指向フォーマット | Data is stored in a columnar format. |
| always | adverb | 常に | Data is always stored with compression. |

## 3-3. 解説文（日本語）

> Snowflakeテーブルのデータは自動的にパーティションに編成され、マイクロパーティションと呼ばれます。各マイクロパーティションには一般的に50MB〜500MBの非圧縮データが含まれます。ただし、Snowflakeのデータは常に圧縮して保存されるため、実際の保存サイズはこれより小さくなります。各マイクロパーティション内では、データは列指向フォーマットで保存されます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
