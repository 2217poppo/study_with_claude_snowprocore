# 014: COPY Simple Transformations

**SnowPro Core Domain**: Domain 3 — Data Loading, Unloading, and Connectivity
**作成日**: 2026-04-09
**正答**: Truncate, Omit Columns, Reorder Columns, Cast（複数選択）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| COPY Command（COPYコマンド） | ステージからSnowflakeテーブルへデータをロードするコマンド。ロード中にシンプルな変換が可能。`COPY INTO <table> FROM <stage>` の形式 |
| Simple Transformation（シンプルな変換） | COPYコマンドでのロード中に実行可能な4種類の変換: **列の順序変更（Reorder）・列の省略（Omit）・型キャスト（Cast）・値の切り詰め（Truncate）** |
| Cast（型キャスト） | データ型を別の型に変換すること。例: 文字列 → 数値、文字列 → 日付。COPYロード中に `::` 演算子や `CAST()` 関数で実行可能 |
| Truncate（切り詰め） | 文字列データを指定した長さに切り詰めること。元データがターゲット列の長さを超える場合に使用。`TRUNCATECOLUMNS = TRUE` オプションで制御 |
| Omit Columns（列の省略） | ソースファイルの一部の列をロード対象から除外すること。SELECT句で必要な列だけを指定することで実現 |
| Reorder Columns（列の順序変更） | ソースファイルの列順とターゲットテーブルの列順が異なる場合に、SELECT句で列の順序を変更してロードすること |
| FLATTEN | 半構造化データ（VARIANT/ARRAY/OBJECT）を行に展開する関数。COPYロード中には使用**不可**。ロード後にのみ使用可能 |

## 1-2. 重要コンセプトまとめ

- **COPYロード中に可能な4つのシンプル変換**を暗記する:
  1. **Reorder Columns** — 列の順序変更
  2. **Omit Columns** — 列の省略
  3. **Cast** — データ型の変換
  4. **Truncate** — 値の切り詰め
- **COPYロード中に不可能な複雑な変換**:
  - JOIN（結合）、FILTER（フィルタ）、AGGREGATION（集約）、FLATTEN — これらはロード後にのみ使用可能
- **Pivot・Transpose は対象外**：これらはデータ変換操作だが、COPYロード中のシンプル変換には含まれない
- **試験のひっかけ**: Pivot/Transpose/Joinなどが選択肢に混ざることが多い。「シンプル変換 = 4つだけ」と覚える

## 1-3. 公式ドキュメントURL

- [Transforming Data During a Load](https://docs.snowflake.com/en/user-guide/data-load-transform)
- [Data Loading Overview](https://docs.snowflake.com/en/user-guide/data-load-overview)

---

## 2-1. 問題文（英語）

> Which simple transformations can be used while loading data through the COPY command?
>
> A. Truncate
> B. Pivot
> C. Omit Columns
> D. Reorder Columns
> E. Cast
> F. Transpose

## 2-2. 問題文の文法解析

### 文1: "Which simple transformations can be used while loading data through the COPY command?"

- **疑問詞+主語 (S)**: Which simple transformations（どのシンプルな変換が）
- **動詞 (V)**: can be used（使用できるか）— 助動詞 + 受動態
- **修飾語 (M1)**: while loading data（データをロードしている間に）
- **修飾語 (M2)**: through the COPY command（COPYコマンドを通じて）
- **文型**: SV（受動態疑問文）+ while節 + 前置詞句
- **注目ポイント**:
  - `while loading` — 分詞構文。`while [you are] loading` の省略形。「ロード中に」
  - `through the COPY command` — 「COPYコマンドを通じて・COPYコマンドで」。手段を示す `through`
  - `simple transformations` — 「シンプルな変換」。Snowflake公式用語として定着しており、試験で正確に区別する必要がある

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| transformation | 名詞 | 変換、変形 | Simple transformations are supported during COPY loading. |
| while loading | 分詞構文 | ロードしている間に | You can cast data types while loading data. |
| through | 前置詞 | 〜を通じて、〜を使って | Data is loaded through the COPY command. |
| truncate | 動詞 | 切り詰める | Truncate long strings to fit the target column. |
| omit | 動詞 | 省略する、除外する | Omit unnecessary columns during the load. |
| cast | 動詞 | 型変換する | Cast string values into numeric data types. |

## 2-3. 問題文（日本語）

> COPYコマンドによるデータロード中に使用できるシンプルな変換はどれですか？（複数選択）
>
> A. Truncate（値の切り詰め）
> B. Pivot（ピボット）
> C. Omit Columns（列の省略）
> D. Reorder Columns（列の順序変更）
> E. Cast（型キャスト）
> F. Transpose（転置）

---

## 3-1. 解説文（英語）

> When loading data into a table using the COPY command, Snowflake allows you to do simple transformations on the data as it is being loaded. During the load process, the COPY command allows for modifying the order of columns, omitting one or more columns, casting data into specified data types, and truncating values. While loading the data, complex transformations such as joins, filters, aggregations, and the use of FLATTEN are not supported as they are not essential data transformations. Therefore, joining, filtering, and aggregating the data are supported ONLY after the data has been loaded into a table.

## 3-2. 解説文の文法解析

### 文1: "When loading data into a table using the COPY command, Snowflake allows you to do simple transformations on the data as it is being loaded."

- **時間節 (M)**: When loading data into a table using the COPY command（COPYコマンドを使ってテーブルにデータをロードする際）
- **主語 (S)**: Snowflake
- **動詞 (V)**: allows（許可する）
- **目的語 (O)**: you to do simple transformations on the data（データに対してシンプルな変換を行うことを）
- **修飾語 (M)**: as it is being loaded（ロードされている最中に）
- **文型**: SVO（allow O to do）
- **注目ポイント**:
  - `allow you to do` — 「あなたが〜することを可能にする」。`allow O to do` 構文
  - `as it is being loaded` — 進行形の受動態。「ロードされている最中に」。同時進行を示す

### 文2: "During the load process, the COPY command allows for modifying the order of columns, omitting one or more columns, casting data into specified data types, and truncating values."

- **修飾語 (M)**: During the load process（ロードプロセスの間に）
- **主語 (S)**: the COPY command（COPYコマンドは）
- **動詞 (V)**: allows for（〜を可能にする）
- **目的語 (O)**: modifying ..., omitting ..., casting ..., and truncating ...（4つの動名詞の並列）
- **文型**: SVO
- **注目ポイント**:
  - `allows for + 動名詞` — 「〜することを可能にする」。`allow for ~` は `allow O to do` とは異なる句動詞
  - 4つの動名詞（modifying, omitting, casting, truncating）が `and` で並列接続
  - `one or more columns` — 「1つまたは複数の列」。可変個数を示す定型表現

### 文3: "While loading the data, complex transformations such as joins, filters, aggregations, and the use of FLATTEN are not supported as they are not essential data transformations."

- **時間節 (M)**: While loading the data（データのロード中は）
- **主語 (S)**: complex transformations such as joins, filters, aggregations, and the use of FLATTEN（結合・フィルタ・集約・FLATTENの使用などの複雑な変換は）
- **動詞 (V)**: are not supported（サポートされていない）— 受動態否定
- **理由節 (M)**: as they are not essential data transformations（それらが必須のデータ変換ではないため）
- **文型**: SV（受動態否定）+ as理由節
- **注目ポイント**:
  - `such as ~` — 「〜のような」。具体例を列挙する定型表現
  - `as they are not ~` — `as` が理由を示す接続詞（= because）。「〜ではないため」
  - `not essential` — 「必須ではない」。Snowflakeが考える変換の重要度分類を示す

### 文4: "Therefore, joining, filtering, and aggregating the data are supported ONLY after the data has been loaded into a table."

- **接続副詞**: Therefore（したがって）
- **主語 (S)**: joining, filtering, and aggregating the data（データの結合・フィルタ・集約は）
- **動詞 (V)**: are supported（サポートされる）
- **修飾語 (M)**: ONLY after the data has been loaded into a table（データがテーブルにロードされた後にのみ）
- **文型**: SV + ONLY after節
- **注目ポイント**:
  - `ONLY after ~` — 「〜した後にのみ」。大文字 `ONLY` で排他的条件を強調
  - `has been loaded` — 現在完了受動態。「ロードが完了した状態で」。完了を示す

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| allow for | 句動詞 | 〜を可能にする | The COPY command allows for column reordering. |
| modifying the order | 動名詞句 | 順序を変更すること | Modifying the order of columns is a simple transformation. |
| omitting | 動名詞 | 省略すること | Omitting columns is supported during COPY loading. |
| casting ... into | 動名詞句 | 〜へ型変換すること | Casting data into numeric types is allowed. |
| essential | 形容詞 | 必須の、不可欠な | Complex transformations are not essential during loading. |
| ONLY after | 副詞+前置詞 | 〜した後にのみ | Joins are supported ONLY after loading. |

## 3-3. 解説文（日本語）

> COPYコマンドを使用してテーブルにデータをロードする際、Snowflakeではデータのロード中にシンプルな変換を行うことができます。ロードプロセスの間、COPYコマンドでは列の順序変更、1つまたは複数の列の省略、指定されたデータ型へのキャスト、および値の切り詰めが可能です。データのロード中は、結合（JOIN）・フィルタ・集約・FLATTENの使用などの複雑な変換は、必須のデータ変換ではないためサポートされていません。したがって、データの結合・フィルタ・集約は、データがテーブルにロードされた**後にのみ**サポートされます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
