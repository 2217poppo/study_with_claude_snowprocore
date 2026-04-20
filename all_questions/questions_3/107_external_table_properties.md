# 107: External Tables — Properties and Capabilities

**SnowPro Core Domain**: Domain 3 — Data Loading, Unloading, and Connectivity
**作成日**: 2026-04-17
**正答**: A, D（通常テーブルと同じようにクエリ可能 / 通常テーブルと結合可能）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| External Table | クラウドストレージ（外部ステージ）上のデータを参照するSnowflakeのテーブルオブジェクト。データはSnowflake内部には格納されない |
| External Stage | S3、Azure Blob Storage、GCSなどの外部クラウドストレージを参照するSnowflakeのステージ |
| Internal Stage | SnowflakeがホストするステージBlob。PUT/GETコマンドで操作できる |
| Metadata | 外部テーブルの定義には、ファイルの場所・ファイル名・その他の属性情報が含まれる |
| JOIN | 2つ以上のテーブルを結合するSQL操作。外部テーブルと内部テーブルを結合することも可能 |
| View on External Table | 外部テーブルに対してビューを作成することも可能 |

## 1-2. 重要コンセプトまとめ

- **外部テーブルは内部テーブルと同じようにクエリ・結合・ビュー作成が可能**
  - SQLクエリ（SELECT）は通常のテーブルと同様に実行できる
  - 内部テーブルとのJOINも可能
  - 外部テーブルに対するビューの作成も可能
- **外部テーブルは外部ステージを参照する（内部ステージではない）**
  - 「An external table points to an internal stage」は誤り（内部ステージではなく外部ステージ）
- **外部テーブルのデータはSnowflakeが管理するストレージには格納されない**
  - データはS3などの外部クラウドストレージに存在し続ける
- **外部テーブルはパフォーマンスが内部テーブルより劣ることが多い**
  - データがSnowflakeの最適化されたフォーマットで格納されていないため

## 1-3. 公式ドキュメントURL

- [Introduction to External Tables](https://docs.snowflake.com/en/user-guide/tables-external-intro)
- [External Tables Overview](https://docs.snowflake.com/en/user-guide/tables-external-overview)

---

## 2-1. 問題文（英語）

> Which of the following are true regarding External tables?
>
> A. Queries can be run on an external table just like any other table
> B. An external table and a standard Snowflake table can NOT be joined
> C. An external table points to an internal stage
> D. An external table and a standard Snowflake table can be joined

## 2-2. 問題文の文法解析

### 文1: "Which of the following are true regarding External tables?"

- **主語 (S)**: Which of the following
- **動詞 (V)**: are
- **補語 (C)**: true
- **修飾語 (M)**: regarding External tables
- **文型**: SVC
- **注目ポイント**: `regarding ~` = 〜に関して（前置詞として使われる現在分詞）

### 選択肢Aの文法: "Queries can be run on an external table just like any other table"

- **主語 (S)**: Queries
- **動詞 (V)**: can be run（受動態 + 助動詞）
- **修飾語 (M)**: on an external table / just like any other table
- **注目ポイント**: `just like ~` = 〜と全く同じように（比較を示す成句）

### 選択肢B/Dの対比:

- B: "An external table and a standard Snowflake table **can NOT be** joined"（否定）
- D: "An external table and a standard Snowflake table **can be** joined"（肯定）
- **注目ポイント**: B は NOT を大文字で強調しているが、D が正解

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| regarding | 前置詞 | 〜に関して | Which statements are true regarding external tables? |
| just like | 成句 | 〜と全く同じように | External tables can be queried just like internal tables. |
| join | 動詞 | 結合する | External and internal tables can be joined. |
| standard | 形容詞 | 標準の、通常の | A standard Snowflake table stores data internally. |

## 2-3. 問題文（日本語）

> 次のうち、外部テーブルに関して正しいものはどれですか？
>
> A. 外部テーブルには、他のテーブルと同じようにクエリを実行できます。
> B. 外部テーブルと標準Snowflakeテーブルは結合できません。
> C. 外部テーブルは内部ステージを参照します。
> D. 外部テーブルと標準Snowflakeテーブルは結合できます。

---

## 3-1. 解説文（英語）

> Snowflake provides external tables that enable the creation of tables with data stored in external cloud storage. The definition and metadata of an external table contain information on file locations, filenames, and other attributes. The definition also includes the external stage from which the data for an external table will come. External tables allow you to query an external table in the same manner as a typical table. External tables may be joined to other tables, and views can be created on external tables. https://docs.snowflake.com/en/user-guide/tables-external-intro

## 3-2. 解説文の文法解析

### 文1: "Snowflake provides external tables that enable the creation of tables with data stored in external cloud storage."

- **主語 (S)**: Snowflake
- **動詞 (V)**: provides
- **目的語 (O)**: external tables that enable the creation of tables ...
- **関係詞節**: that enable the creation of tables with data stored in external cloud storage
- **注目ポイント**: 
  - `enable the creation of ~` = 〜の作成を可能にする（enable + 名詞句）
  - `with data stored in external cloud storage` = 外部クラウドストレージに格納されたデータを持つ（with + 名詞 + 過去分詞）

### 文2: "The definition and metadata of an external table contain information on file locations, filenames, and other attributes."

- **主語 (S)**: The definition and metadata of an external table
- **動詞 (V)**: contain
- **目的語 (O)**: information on file locations, filenames, and other attributes
- **注目ポイント**: `information on ~` = 〜に関する情報

### 文3: "External tables allow you to query an external table in the same manner as a typical table."

- **主語 (S)**: External tables
- **動詞 (V)**: allow
- **目的語 (O)**: you to query an external table（allow + 目的語 + 不定詞）
- **修飾語 (M)**: in the same manner as a typical table
- **注目ポイント**: 
  - `allow A to B` = AがBするのを許可する/可能にする
  - `in the same manner as ~` = 〜と同じ方法で（just like の言い換え）

### 文4: "External tables may be joined to other tables, and views can be created on external tables."

- **節1**: External tables may be joined to other tables（受動態 + may）
- **節2**: views can be created on external tables（受動態 + can）
- **注目ポイント**: `may be joined to ~` = 〜と結合されることができる（可能性・許可の may）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| enable | 動詞 | 可能にする | External tables enable querying of cloud data. |
| attribute | 名詞 | 属性、特性 | File locations and other attributes are in the metadata. |
| in the same manner as | 成句 | 〜と同じ方法で | Query external tables in the same manner as regular tables. |
| typical | 形容詞 | 典型的な、通常の | An external table works like a typical table in queries. |

## 3-3. 解説文（日本語）

> Snowflakeは、外部クラウドストレージに格納されたデータを持つテーブルの作成を可能にする外部テーブルを提供します。外部テーブルの定義とメタデータには、ファイルの場所・ファイル名・その他の属性に関する情報が含まれます。定義には、外部テーブルのデータが格納される外部ステージも含まれます。外部テーブルは通常のテーブルと同じ方法でクエリを実行できます。外部テーブルは他のテーブルと結合することができ、外部テーブルに対してビューを作成することもできます。

---

## 復習メモ

- [ ] 外部テーブルは外部ステージ（内部ステージではない）を参照することを理解した
- [ ] 外部テーブルは通常テーブルと同様にクエリ・JOIN・ビュー作成が可能であることを把握した
- [ ] `allow A to B`、`in the same manner as`、`enable the creation of` の表現を確認した
