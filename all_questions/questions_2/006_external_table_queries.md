# 006: External Tables — Query Capabilities

**SnowPro Core Domain**: Domain 3 — Data Loading, Unloading, and Connectivity
**作成日**: 2026-04-08
**正答**: B（allows querying without loading）, C（views can be created）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| External Table（外部テーブル） | クラウドストレージ上のデータをSnowflakeにロードせずにテーブルとして参照できる機能。テーブルの定義（構造・ファイルロケーション・ファイル名など）はSnowflakeのメタデータに保存されるが、実データは外部のクラウドストレージに保存される。 |
| Cloud Storage（クラウドストレージ） | データを保存する外部のクラウドサービス（AWS S3、Azure Blob Storage、Google Cloud Storageなど）。外部テーブルはこれらに保存されたデータを直接参照する。 |
| External Table Metadata（外部テーブルメタデータ） | Snowflakeが管理する外部テーブルの定義情報。テーブル構造・ファイルの場所・ファイル名・その他の属性で構成される。実データはSnowflakeの外に保存される。 |

## 1-2. 重要コンセプトまとめ

- **正解の2つ（外部テーブルでできること）**:
  1. **データをロードせずにクエリ可能** — クラウドストレージのデータをそのまま照会
  2. **ビューの作成が可能** — 外部テーブルの上にVIEWを作成できる
- **不正解の2つ（外部テーブルへの誤解）**:
  - ❌「ビューをサポートしない」→ 誤り。ビューは作成可能
  - ❌「他のSnowflakeテーブルとJOINできない」→ 誤り。JOINは可能
- **外部テーブルの特徴まとめ**:
  | 項目 | 外部テーブルの動作 |
  |------|------------------|
  | データの保存場所 | Snowflake外（クラウドストレージ） |
  | メタデータの保存 | Snowflake内 |
  | 読み取り | ✅ SELECT可 |
  | 書き込み | ❌ INSERT/UPDATE/DELETE不可（読み取り専用） |
  | JOIN | ✅ 他テーブルとJOIN可 |
  | VIEW | ✅ 外部テーブルを基にVIEW作成可 |
  | データのロード | 不要（ロードなしにクエリ可能） |
- **試験ポイント**: 「読み取り専用」かつ「JOIN・VIEWは可能」の組み合わせをセットで覚える

## 1-3. 公式ドキュメントURL

- [Introduction to External Tables](https://docs.snowflake.com/en/user-guide/tables-external-intro)

---

## 2-1. 問題文（英語）

> Which of the following statements are true regarding External Tables? Select all that apply.
>
> A. External tables don't support views.
>
> B. An external table allows querying of data in cloud storage without requiring it to be loaded into Snowflake first.
>
> C. Views can be created on top of an external table.
>
> D. External tables can not be joined with other Snowflake tables.

## 2-2. 問題文の文法解析

### 文1: "Which of the following statements are true regarding External Tables?"

- **主語 (S)**: Which of the following statements（疑問詞節）
- **動詞 (V)**: are
- **補語 (C)**: true
- **修飾語 (M)**: regarding External Tables（前置詞句）
- **文型**: SVC
- **注目ポイント**: `regarding ~` = 「〜に関して」。`about ~` より書き言葉的。複数の主語なので `are`（複数形）

### 選択肢Bの文法: "An external table allows querying of data in cloud storage without requiring it to be loaded into Snowflake first."

- **主語 (S)**: An external table
- **動詞 (V)**: allows（SVOC: allow O to do の変形）
- **目的語 (O)**: querying of data in cloud storage（動名詞句）
- **修飾語 (M)**: without requiring it to be loaded into Snowflake first（前置詞 + 動名詞句）
- **注目ポイント**:
  - `without requiring it to be loaded` — `without + 動名詞`（手段の否定）+ `require O to do`（OにdoさせることをWITHOUT要求せずに）。`it` = the data
  - `loaded into Snowflake first` — 「まずSnowflakeにロードされる」。`first` が「事前に」のニュアンスを持つ副詞

### 選択肢Cの文法: "Views can be created on top of an external table."

- **主語 (S)**: Views
- **動詞 (V)**: can be created（受動態）
- **修飾語 (M)**: on top of an external table（前置詞句）
- **注目ポイント**: `on top of ~` = 「〜の上に（基礎として）」。上位レイヤーへの作成を示す

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| allow querying of ~ | 動詞句 | 〜のクエリを可能にする | External tables allow querying of data without loading it. |
| without requiring ~ | 前置詞句 | 〜を必要とせずに | Data can be queried without requiring it to be loaded first. |
| on top of ~ | 前置詞句 | 〜の上に（基礎として） | Views can be created on top of an external table. |
| regarding ~ | 前置詞 | 〜に関して | Which statements are true regarding external tables? |

## 2-3. 問題文（日本語）

> 外部テーブルに関して正しい説明はどれですか？該当するものをすべて選択してください。
>
> A. 外部テーブルはビューをサポートしない。
>
> B. 外部テーブルは、クラウドストレージのデータをSnowflakeに最初にロードすることなくクエリすることを可能にする。
>
> C. ビューは外部テーブルを基に作成できる。
>
> D. 外部テーブルは他のSnowflakeテーブルとJOINできない。

---

## 3-1. 解説文（英語）

> Snowflake offers an alternative approach for tables called external tables, which permits the creation of tables with data stored in external cloud storage. External tables remove the need for the data to be loaded into Snowflake. In the case of an External table, the definition of the table is still stored in Snowflake metadata and consists of table structure, file locations, filenames, and other attributes. However, the table's data is saved outside of Snowflake. The external table functionality enables you to query external data like a standard table. For example, external tables may be joined to other tables, and views may be created using them.

## 3-2. 解説文の文法解析

### 文1: "Snowflake offers an alternative approach for tables called external tables, which permits the creation of tables with data stored in external cloud storage."

- **主語 (S)**: Snowflake
- **動詞 (V)**: offers
- **目的語 (O)**: an alternative approach for tables called external tables（過去分詞 `called` が後置修飾）
- **関係詞節**: which permits the creation of tables with data stored in external cloud storage（先行詞 = an alternative approach）
- **注目ポイント**:
  - `called external tables` — 過去分詞の後置修飾「外部テーブルと呼ばれる」
  - `with data stored in external cloud storage` — `with + 名詞 + 過去分詞`（付帯状況）「データが外部クラウドに保存された状態で」

### 文2: "External tables remove the need for the data to be loaded into Snowflake."

- **主語 (S)**: External tables
- **動詞 (V)**: remove
- **目的語 (O)**: the need for the data to be loaded into Snowflake
- **注目ポイント**:
  - `remove the need for ~ to be done` — 「〜が〜される必要性を取り除く」。`the need for O to do` の受動態バリエーション
  - `for the data to be loaded` — for + 意味上の主語 + to不定詞

### 文3: "The external table functionality enables you to query external data like a standard table."

- **主語 (S)**: The external table functionality
- **動詞 (V)**: enables（SVOC）
- **目的語 (O)**: you
- **補語 (C)**: to query external data like a standard table
- **注目ポイント**: `like a standard table` — 「通常のテーブルと同様に」。外部テーブルが通常テーブルと同じ操作感を持つことを示す比喩的な比較

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| permits the creation of ~ | 動詞句 | 〜の作成を許可する・可能にする | External tables permit the creation of views. |
| remove the need for ~ | 動詞句 | 〜の必要性を取り除く | External tables remove the need for data to be loaded. |
| consists of ~ | 動詞句 | 〜から構成される | The definition consists of structure, file locations, and filenames. |
| like a standard table | 比較句 | 通常のテーブルと同様に | You can query external data like a standard table. |
| functionality | 名詞 | 機能（性）、機能セット | The external table functionality enables various queries. |

## 3-3. 解説文（日本語）

> Snowflakeは「外部テーブル」と呼ばれるテーブルの代替アプローチを提供しており、外部クラウドストレージに保存されたデータを持つテーブルの作成を可能にします。外部テーブルにより、データをSnowflakeにロードする必要がなくなります。外部テーブルの場合、テーブルの定義（テーブル構造・ファイルの場所・ファイル名・その他の属性）は引き続きSnowflakeのメタデータに保存されます。ただし、テーブルのデータはSnowflakeの外部に保存されます。外部テーブル機能により、外部データを通常のテーブルと同様にクエリすることができます。例えば、外部テーブルは他のテーブルとJOINしたり、外部テーブルを使ってビューを作成したりすることができます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
