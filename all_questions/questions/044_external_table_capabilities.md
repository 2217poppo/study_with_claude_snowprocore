# 044: External Table Capabilities — Querying and Joining

**SnowPro Core Domain**: Domain 3 — Data Loading, Unloading, and Connectivity
**作成日**: 2026-04-03
**正答**: C・D（通常テーブルと同様にクエリ可能 / 他テーブルとJOIN可能）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| External Table（外部テーブル） | クラウドストレージ（S3・Azure Blob・GCS）上のファイルをSnowflakeのテーブルとして参照するオブジェクト。データ自体はSnowflake外に保存され、テーブル定義（構造・ファイル場所等）のみSnowflakeのメタデータに保存される |
| External Cloud Storage（外部クラウドストレージ） | SnowflakeのストレージレイヤーではなくユーザーのS3/Azure Blob/GCS等のストレージ。外部テーブルのデータはここに保存される |
| Table Definition（テーブル定義） | テーブルの構造情報（列名・型・ファイル場所・ファイル名等）。外部テーブルではこの定義だけがSnowflakeのメタデータに格納される |
| View（ビュー） | SELECTクエリを保存したオブジェクト。外部テーブルを元にビューを作成することも可能 |

## 1-2. 重要コンセプトまとめ

- **外部テーブルでできること（正答C・D）**:
  - 通常のテーブルと同様に **SELECT クエリを実行できる**
  - 他のテーブル（内部・外部）と **JOIN できる**
  - ビューを作成できる

- **外部テーブルの特徴（028との復習）**:
  - データはSnowflake外（クラウドストレージ）に保存
  - テーブル定義（構造・ファイル場所等）のみSnowflakeのメタデータに保存
  - データをSnowflakeにロードする必要がない
  - 読み取り専用（INSERT/UPDATE/DELETE 不可）
  - 外部ステージのみ使用可能（内部ステージは不可）

- **「クエリできない」「JOINできない」は誤り（引っかけ）**:
  - 外部テーブルは「通常テーブルと同じようにクエリできる」のが重要な機能
  - JOINも完全にサポートされる

- **028との違い**: 028はステージの種類（外部ステージのみ）に焦点。この問題はクエリ・JOIN能力に焦点

## 1-3. 公式ドキュメントURL

- [External Tables Overview](https://docs.snowflake.com/en/user-guide/tables-external-intro)

---

## 2-1. 問題文（英語）

> Which of the following statements are true regarding External Tables? Select all that apply.
>
> A. An external table can not be joined with other tables.
> B. An external table can not be queried.
> C. You can query an external table just like a regular table.
> D. An external table can be joined with other tables.

## 2-2. 問題文の文法解析

### 文1: "Which of the following statements are true regarding External Tables?"

- **主語 (S)**: Which of the following statements（以下の記述のうちどれが）
- **動詞 (V)**: are（〜である）
- **補語 (C)**: true（正しい）
- **修飾語 (M)**: regarding External Tables（外部テーブルに関して）
- **文型**: SVC（倒置）

### 選択肢C: "You can query an external table just like a regular table."

- **主語 (S)**: You（あなたは）
- **動詞 (V)**: can query（クエリできる）
- **目的語 (O)**: an external table（外部テーブルを）
- **修飾語 (M)**: just like a regular table（通常のテーブルと全く同様に）← `just like ~` = 「〜と全く同じように」
- **注目ポイント**: `just like ~` は完全な同等性を強調。`like ~` より強い表現

### 選択肢A・B: "can not be joined / can not be queried"

- **注目ポイント**: `can not be + 過去分詞` = 「〜できない」の受動態否定。外部テーブルの能力を否定する誤答パターン

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| just like ~ | 前置詞句 | 〜と全く同様に | Query an external table just like a regular table. |
| be joined with ~ | 熟語 | 〜とJOINされる | External tables can be joined with internal tables. |
| regarding ~ | 前置詞 | 〜に関して | Which statements are true regarding external tables? |

## 2-3. 問題文（日本語）

> 外部テーブルに関して正しい記述はどれですか？当てはまるものをすべて選択してください。
>
> A. 外部テーブルは他のテーブルとJOINできない。
> B. 外部テーブルはクエリできない。
> C. 外部テーブルは通常のテーブルと同様にクエリできる。
> D. 外部テーブルは他のテーブルとJOINできる。

---

## 3-1. 解説文（英語）

> Snowflake offers an alternative approach for tables called external tables, which permits the creation of tables with data stored in external cloud storage. External tables remove the need for the data to be loaded into Snowflake. In the case of an External table, the definition of the table is still stored in Snowflake metadata and consists of table structure, file locations, filenames, and other attributes. However, the table's data is saved outside of Snowflake. The external table functionality enables you to query external data like a standard table. External tables may be joined to other tables, and views may be created using them.

## 3-2. 解説文の文法解析

### 文1: "Snowflake offers an alternative approach for tables called external tables, which permits the creation of tables with data stored in external cloud storage."

- **主語 (S)**: Snowflake
- **動詞 (V)**: offers（提供する）
- **目的語 (O)**: an alternative approach for tables（テーブルの代替アプローチを）
- **修飾語 (M1)**: called external tables（外部テーブルと呼ばれる）← 過去分詞後置修飾
- **修飾語 (M2)**: which permits the creation of tables with data stored in external cloud storage（外部クラウドストレージにデータを保存したテーブルの作成を可能にする）← 非制限関係詞節
- **注目ポイント**: `alternative approach` = 「代替手法」。標準のロードアプローチとは異なる方法であることを示す

### 文2: "External tables remove the need for the data to be loaded into Snowflake."

- **主語 (S)**: External tables（外部テーブルは）
- **動詞 (V)**: remove（取り除く）
- **目的語 (O)**: the need（必要性を）
- **修飾語 (M)**: for the data to be loaded into Snowflake（データをSnowflakeにロードするための）← `for + 意味上の主語 + to 不定詞`
- **注目ポイント**: `remove the need for ~` = 「〜の必要性をなくす」。外部テーブルの最大の価値を表す表現

### 文3: "The external table functionality enables you to query external data like a standard table."

- **主語 (S)**: The external table functionality（外部テーブル機能は）
- **動詞 (V)**: enables（可能にする）
- **目的語 (O)**: you（あなたが）
- **補語的修飾**: to query external data（外部データをクエリすること）← enable O to do
- **修飾語 (M)**: like a standard table（標準テーブルのように）
- **注目ポイント**: `enable O to do` = 「Oが〜できるようにする」。`allow O to do` と同義

### 文4: "External tables may be joined to other tables, and views may be created using them."

- **前半**: External tables may be joined to other tables（外部テーブルは他のテーブルにJOINできる）← 受動態 + 可能の may
- **後半**: views may be created using them（それらを使ってビューを作成できる）← 受動態 + using 分詞句
- **注目ポイント**: `may be + 過去分詞` = 「〜することができる（may = 可能性・許可）」。`can be` と同義の技術文書表現

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| alternative approach | 名詞句 | 代替手法 | External tables offer an alternative approach to loading. |
| remove the need for ~ | 熟語 | 〜の必要性をなくす | External tables remove the need for data loading. |
| enable O to do | 熟語 | Oが〜できるようにする | This feature enables you to query data without loading it. |
| may be + 過去分詞 | 受動態 | 〜することができる | External tables may be joined to other tables. |
| consist of ~ | 熟語 | 〜から構成される | The definition consists of structure, file locations, and filenames. |

## 3-3. 解説文（日本語）

> Snowflakeは外部テーブルと呼ばれるテーブルの代替アプローチを提供しています。これにより、外部クラウドストレージにデータを保存したテーブルを作成できます。外部テーブルはデータをSnowflakeにロードする必要性をなくします。外部テーブルの場合、テーブルの定義（テーブル構造・ファイル場所・ファイル名・その他の属性）は引き続きSnowflakeのメタデータに保存されます。しかし、テーブルのデータはSnowflake外に保存されます。外部テーブル機能により、外部データを標準テーブルと同様にクエリできます。外部テーブルは他のテーブルにJOINすることができ、それらを使ってビューを作成することもできます。

---

## 復習メモ

- [ ] 外部テーブルでクエリ・JOINが可能であることを確認した
- [ ] 外部テーブルの特徴（定義のみSnowflake保存・データはクラウドストレージ）を説明できる
- [ ] 028（外部ステージのみ使用可能）との違いを整理した
- [ ] 英語の文法ポイント（remove the need for / enable O to do / may be + 過去分詞）を確認した
- [ ] この問題は外部テーブルの動作理論のためサンドボックス検証は任意
