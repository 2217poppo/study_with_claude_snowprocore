# 087: COPY Column Mismatch

**SnowPro Core Domain**: Domain 3 — Data Loading, Unloading, and Connectivity
**作成日**: 2026-04-14
**正答**: False

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| COPY INTO（ロード） | ステージからテーブルにデータをロードするコマンド。SELECT文で簡易変換が可能 |
| Simple Transformations | COPYロード時にSELECT文で行える変換。列順序の変更・列の省略・データ型キャスト・データ切り詰め |
| Column Omission（列の省略） | ファイルの一部の列のみをテーブルにロードすること。テーブルとファイルの列数が異なっても可能 |

## 1-2. 重要コンセプトまとめ

- COPYコマンドでのロード時、テーブルとファイルの**列数は一致しなくてよい**（False）
- COPYロード時のSELECT文で可能な操作:
  - **列順序の変更**（reorder columns）
  - **列の省略**（omit columns）
  - **データ型のキャスト**（cast to specified types）
  - **データの切り詰め**（truncate if larger than column width）
- SELECT文でステージから必要な列のみ選択してロード可能

## 1-3. 公式ドキュメントURL

- [Simple Transformations During a Load](https://docs.snowflake.com/en/user-guide/data-load-overview#simple-transformations-during-a-load)

---

## 2-1. 問題文（英語）

> True/False: When loading data through COPY command, it is required that your table and the file from where the data is being loaded should have the same number of columns.
>
> A. False
> B. True

## 2-2. 問題文の文法解析

### 文1: "When loading data through COPY command, it is required that your table and the file from where the data is being loaded should have the same number of columns."

- **主語 (S)**: it（形式主語）
- **動詞 (V)**: is required
- **真主語**: that your table and the file ... should have the same number of columns
- **文型**: SVC（形式主語構文）
- **注目ポイント**: `it is required that ~ should ~` は仮定法現在で「～すべきことが要求される」。これがFalseのトリック。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| it is required that ~ | phrase | ～することが要求される | It is NOT required to match columns. |
| omit | verb | 省略する | Omitting one or more columns. |
| truncate | verb | 切り詰める | Truncate data if too large. |

## 2-3. 問題文（日本語）

> 真/偽: COPYコマンドでデータをロードする際、テーブルとデータロード元のファイルの列数が同じであることが必要である。

---

## 3-1. 解説文（英語）

> The order & the number of columns in the file and the table can differ. In this case, a SELECT statement can be used to select only the required columns from the stage. When loading data into a table using the COPY command, Snowflake allows you to do simple transformations on the data as it is being loaded by using a SELECT statement. During the load process, the COPY command allows for modifying the order of columns, omitting one or more columns, and casting data into specified data types. It is also possible to truncate data using the COPY command if it is larger than the desired column width.

## 3-2. 解説文の文法解析

### 文1: "The order & the number of columns in the file and the table can differ."

- **主語 (S)**: The order & the number of columns
- **動詞 (V)**: can differ
- **文型**: SV
- **注目ポイント**: `can differ` で「異なることができる」。列数も順序も不一致で構わないことを明示。

### 文2: "During the load process, the COPY command allows for modifying the order of columns, omitting one or more columns, and casting data into specified data types."

- **主語 (S)**: the COPY command
- **動詞 (V)**: allows for
- **目的語 (O)**: modifying ~, omitting ~, and casting ~（3つの動名詞を並列）
- **文型**: SVO
- **注目ポイント**: `allows for ~ing` で「～することを許容する」。3つの操作を並列列挙。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| can differ | phrase | 異なることができる | The number of columns can differ. |
| allows for ~ing | phrase | ～を許容する | Allows for omitting columns. |
| desired column width | noun | 望ましい列幅 | Truncate if larger than desired width. |

## 3-3. 解説文（日本語）

> ファイルとテーブルの列の順序と数は異なることができます。その場合、SELECT文を使用してステージから必要な列のみを選択できます。COPYコマンドでテーブルにデータをロードする際、SnowflakeはSELECT文を使用してロード中にデータの簡易変換を行うことを許可します。ロードプロセス中、COPYコマンドは列順序の変更、1つ以上の列の省略、指定データ型へのキャストを許容します。また、データが望ましい列幅より大きい場合、COPYコマンドを使ってデータを切り詰めることも可能です。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
