# 059: Table Data Storage Format

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-16
**正答**: B, C, D

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Micro-Partition（マイクロパーティション） | Snowflakeがデータを内部的に分割する単位。各パーティションは50〜500MBの非圧縮データを含む。自動的に作成・管理される |
| Columnar Format（列指向フォーマット） | データを列単位で保存する形式。同じ列のデータが連続して格納されるため、圧縮効率が高く分析クエリに有利 |
| Automatic Compression（自動圧縮） | Snowflakeがデータをストレージに保存する際、自動的に圧縮する機能。ユーザーが手動で設定する必要はない |
| CSV (Comma-Separated Values) | テキストベースのデータ形式。Snowflakeのファイルフォーマットとしてロード/アンロードに使えるが、内部ストレージ形式ではない |
| Parquet | Apache Parquetはオープンソースの列指向ファイルフォーマット。Snowflakeはロード/アンロードに対応するが、内部ストレージ形式ではない |

## 1-2. 重要コンセプトまとめ

- Snowflakeの内部ストレージは**独自のプロプライエタリフォーマット**（CSV、Parquetではない）
- データは自動的に**マイクロパーティション**に分割される（50〜500MB/パーティション）
- 各マイクロパーティション内で**列指向（columnar）**形式で保存
- データは常に**自動圧縮**されて保存（非圧縮サイズより小さい）
- CSV・Parquetはロード/アンロード時のファイルフォーマットであり、内部保存形式ではない
- ユーザーがパーティション分割や圧縮を手動で行う必要はない（すべて自動）

## 1-3. 公式ドキュメントURL

- [Micro-partitions & Data Clustering](https://docs.snowflake.com/en/user-guide/tables-clustering-micropartitions)

---

## 2-1. 問題文（英語）

> Which of the following statements are true regarding how Snowflake stores table data? Select all that apply.
>
> A. Data is stored as CSV
> B. Data is stored in columnar format
> C. Data is stored in micro-partitions
> D. Data is automatically compressed
> E. Data is stored as Parquet

## 2-2. 問題文の文法解析

### 文1: "Which of the following statements are true regarding how Snowflake stores table data?"

- **主語 (S)**: Which of the following statements
- **動詞 (V)**: are
- **補語 (C)**: true
- **修飾語 (M)**: regarding how Snowflake stores table data（前置詞句 + 間接疑問節）
- **文型**: SVC
- **注目ポイント**: 「regarding ~」で問いの対象範囲を限定。「how Snowflake stores table data」は間接疑問節で「Snowflakeがどのようにテーブルデータを保存するか」。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| regarding | 前置詞 | ～に関して | Statements regarding data storage. |
| store | 動詞 | 保存する | Snowflake stores data in micro-partitions. |
| columnar format | 名詞句 | 列指向フォーマット | Data is stored in columnar format for efficiency. |
| automatically | 副詞 | 自動的に | Data is automatically compressed. |

## 2-3. 問題文（日本語）

> Snowflakeがテーブルデータをどのように保存するかについて、正しい記述をすべて選んでください。
>
> A. データはCSVとして保存される
> B. データは列指向フォーマットで保存される
> C. データはマイクロパーティションに保存される
> D. データは自動的に圧縮される
> E. データはParquetとして保存される

---

## 3-1. 解説文（英語）

> Data in Snowflake tables is automatically organized into partitions, known as micro-partition. Each micro-partition generally contains 50MB to 500 MB of uncompressed data. However, the stored size is smaller as Snowflake data is always stored with compression. Within each micro-partition, the data is stored in a columnar format. https://docs.snowflake.com/en/user-guide/tables-clustering-micropartitions

## 3-2. 解説文の文法解析

### 文1: "Data in Snowflake tables is automatically organized into partitions, known as micro-partition."

- **主語 (S)**: Data in Snowflake tables
- **動詞 (V)**: is organized（受動態）
- **修飾語 (M)**: automatically / into partitions / known as micro-partition（過去分詞の後置修飾）
- **文型**: SV（受動態）
- **注目ポイント**: 「known as ~」は過去分詞の後置修飾で「～として知られる」。「is automatically organized」で自動的な処理を強調。

### 文2: "Each micro-partition generally contains 50MB to 500 MB of uncompressed data."

- **主語 (S)**: Each micro-partition
- **動詞 (V)**: contains
- **目的語 (O)**: 50MB to 500 MB of uncompressed data
- **修飾語 (M)**: generally（通常は）
- **文型**: SVO

### 文3: "However, the stored size is smaller as Snowflake data is always stored with compression."

- **主語 (S)**: the stored size
- **動詞 (V)**: is
- **補語 (C)**: smaller
- **修飾語 (M)**: as Snowflake data is always stored with compression（理由の副詞節）
- **文型**: SVC
- **注目ポイント**: 「as」が理由を示す接続詞として使われている。「is always stored with compression」で常に圧縮されることを強調。

### 文4: "Within each micro-partition, the data is stored in a columnar format."

- **主語 (S)**: the data
- **動詞 (V)**: is stored（受動態）
- **修飾語 (M)**: Within each micro-partition / in a columnar format
- **文型**: SV（受動態）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| organized into | 動詞句 | ～に組織される | Data is organized into micro-partitions. |
| known as | 過去分詞句 | ～として知られる | Partitions, known as micro-partitions. |
| generally | 副詞 | 一般的に、通常は | Each partition generally contains 50-500MB. |
| uncompressed | 形容詞 | 非圧縮の | 50MB to 500MB of uncompressed data. |
| stored size | 名詞句 | 保存サイズ | The stored size is smaller due to compression. |

## 3-3. 解説文（日本語）

> Snowflakeのテーブル内のデータは、マイクロパーティションと呼ばれるパーティションに自動的に組織化されます。各マイクロパーティションには一般的に50MB〜500MBの非圧縮データが含まれます。ただし、Snowflakeのデータは常に圧縮されて保存されるため、実際の保存サイズはこれより小さくなります。各マイクロパーティション内では、データは列指向フォーマットで保存されます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
