# 028: External Tables

**SnowPro Core Domain**: Domain 3 — Data Loading, Unloading, and Connectivity
**作成日**: 2026-04-02
**正答**: A, C（2つ・部分正解）
- A. The data for an external table is stored in cloud storage managed by the customer.（**選択済み・正解**）
- B. An external table supports internal stages.（**選択済み・不正解** — 外部テーブルは内部ステージを使えない）
- C. An external table supports only external stages.（**選択済み・正解**）
- D. An external table is another name for transient tables.（**選択済み・不正解** — 全く別のオブジェクト）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| External Table（外部テーブル） | クラウドストレージ上のファイルをテーブルとして参照できるメタデータ定義。実データはSnowflake内に持たず、外部ステージ経由でアクセスする |
| External Stage（外部ステージ） | ユーザーが管理するクラウドストレージ（S3・Azure Blob・GCS等）への参照。外部テーブルはこれのみ使用可能 |
| Internal Stage（内部ステージ） | Snowflakeが管理するクラウドストレージ上のステージ（Table Stage・User Stage・Named Stage）。外部テーブルでは使用不可 |
| Table Metadata（テーブルメタデータ） | 外部テーブルが保持する情報。実データではなく、列定義・外部ステージ名・ファイルフォーマットを定義する |
| Object Storage（オブジェクトストレージ） | AWSのS3バケット・Azure Blob Storage・GCSなど、クラウド上の大容量ファイル保存サービス |

## 1-2. 重要コンセプトまとめ

- **外部テーブルの本質: メタデータ定義**
  - 外部テーブル自体はデータを持たない
  - テーブルが保持するのは: **列定義** + **外部ステージ名** + **ファイルフォーマット** のみ
  - 実データは外部ステージ → クラウドオブジェクトストレージ（顧客管理）に存在する

- **ステージの制限（重要）**:
  - ✅ 外部ステージ（External Stage）: **使用可能**
  - ❌ 内部ステージ（Internal Stage）: **使用不可**
  - 「外部テーブルは外部ステージのみ」= 名前通りの対応

- **誤答の整理**:
  - ❌ B「内部ステージをサポート」→ 正反対。外部ステージのみ対応
  - ❌ D「トランジェントテーブルの別名」→ 全く別のオブジェクト。Transient Tableはセッション存続型のデータ保有テーブル（Q015参照）

- **外部テーブル vs 通常テーブルの比較**:

  | 項目 | 通常テーブル | 外部テーブル |
  |------|-----------|-----------|
  | データの場所 | Snowflake内部 | 顧客管理のクラウドストレージ |
  | データのコピー | あり | なし（参照のみ） |
  | DML操作 | INSERT/UPDATE/DELETE可 | 読み取り専用 |
  | ストレージコスト | Snowflakeに発生 | 顧客のクラウドに発生 |
  | Time Travel | あり | なし |

- **ユースケース**: すでにS3等にデータが存在し、Snowflakeに取り込まずに直接クエリしたい場合に使う。データ移動コストの削減が目的

- **試験ポイント**: 「外部テーブル = メタデータ定義のみ」「外部ステージのみ使用可能」の2点がコア

## 1-3. 公式ドキュメントURL

- [Introduction to External Tables](https://docs.snowflake.com/en/user-guide/tables-external-intro)

---

## 2-1. 問題文（英語）

> Which of the following statements are true regarding External Tables? Select all that apply.
>
> A. The data for an external table is stored in cloud storage managed by the customer.
> B. An external table supports internal stages.
> C. An external table supports only external stages.
> D. An external table is another name for transient tables.

## 2-2. 問題文の文法解析

### 文1: "Which of the following statements are true regarding External Tables?"

- **主語 (S)**: Which of the following statements（複数 → are）
- **動詞 (V)**: are
- **補語 (C)**: true
- **修飾語 (M)**: regarding External Tables
- **文型**: SVC + M
- **注目ポイント**:
  - 「statements are true」= 「記述は正しい」。SVC 構文
  - 「regarding ~」は「〜に関して」(Q018 で登場済み)

### 選択肢の文法注目点

- **A**: 「The data for an external table is stored in cloud storage managed by the customer」
  - `for an external table` — 「外部テーブル用のデータ」。for が所属・目的を示す
  - `managed by the customer` — 過去分詞の後置修飾。「顧客によって管理される」
- **B・C**: 「supports internal/only external stages」
  - `supports only external stages` の only が「外部ステージのみ」を限定。Bとの対比が試験の核心
- **D**: 「is another name for transient tables」
  - `another name for ~` は「〜の別名」(Q009 で登場済みのパターン)。これが False のひっかけ

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| external table | noun phrase | 外部テーブル（メタデータ定義のみのテーブル） | An external table reads data from cloud storage. |
| managed by the customer | 過去分詞句 | 顧客によって管理される | Data is stored in cloud storage managed by the customer. |
| support | verb | サポートする、対応する | External tables support only external stages. |
| another name for ~ | 名詞句 | 〜の別名（Q009でも登場） | False — external table is NOT another name for transient table. |

## 2-3. 問題文（日本語）

> 外部テーブルに関して正しい記述はどれですか？該当するものをすべて選びなさい。
>
> A. 外部テーブルのデータは、顧客が管理するクラウドストレージに保存されている。
> B. 外部テーブルは内部ステージをサポートする。
> C. 外部テーブルは外部ステージのみをサポートする。
> D. 外部テーブルはトランジェントテーブルの別名である。

---

## 3-1. 解説文（英語）

> An external table is a metadata definition; that is, you register the definition of an external table, but the external table itself doesn't contain any data. Instead, the table metadata contains column definition, the name of the external stage from where the data for the external table is, and the file format which should be used to read that data. The external stage, in turn, points to object storage on the cloud, for example, an AWS bucket or Azure Blob storage, which contains the data for the external table. Note that an external table can only point to an external stage. An internal stage cannot be used to create an external table.

## 3-2. 解説文の文法解析

### 文1: "An external table is a metadata definition; that is, you register the definition of an external table, but the external table itself doesn't contain any data."

- **主節**: An external table is a metadata definition（SVC）
- **セミコロン + that is**: 言い換えの接続表現。「すなわち」
- **言い換え節1**: you register the definition of an external table
- **逆接**: but
- **言い換え節2**: the external table itself doesn't contain any data
- **注目ポイント**:
  - 「that is,」は `i.e.,` と同義の言い換え表現。前の文を平易に説明し直す
  - 「itself」は強調の再帰代名詞。「テーブル自体は」→ メタデータとデータの区別を強調

### 文2: "Instead, the table metadata contains column definition, the name of the external stage from where the data for the external table is, and the file format which should be used to read that data."

- **接続副詞**: Instead（「代わりに」。前文の否定を受けて代替を示す）
- **主語 (S)**: the table metadata
- **動詞 (V)**: contains
- **目的語 (O)**: column definition / the name of the external stage / the file format（3つの並列）
- **ステージ名の修飾**: from where the data for the external table is（関係副詞節）
- **ファイルフォーマットの修飾**: which should be used to read that data（関係代名詞節）
- **注目ポイント**:
  - 「Instead,」で前文（データを持たない）との対比を明示
  - `from where ~` は「そこからデータが来る場所」を示す関係副詞句

### 文3: "Note that an external table can only point to an external stage. An internal stage cannot be used to create an external table."

- **命令形**: Note that ~（「〜に注意せよ」）
- **that節**: an external table can only point to an external stage
- **続く文**: An internal stage cannot be used to create an external table（受動態の否定）
- **注目ポイント**:
  - 「Note that ~」は試験の重要事項を強調する定型表現
  - 「can only point to ~」の only が制限を示す。外部ステージのみ
  - 「cannot be used to ~」は受動態の否定 + 不定詞。「〜するために使うことはできない」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| metadata definition | noun phrase | メタデータ定義（実データのない定義情報） | An external table is a metadata definition only. |
| that is, | 接続表現 | すなわち（i.e. と同義の言い換え） | It's a metadata definition; that is, it contains no data. |
| instead | adverb | 代わりに（前文の否定後に代替を提示） | Instead, the metadata contains column definitions. |
| in turn | phrase | 次に、順番に（連鎖する関係を示す） | The stage, in turn, points to cloud object storage. |
| note that ~ | 命令句 | 〜に注意せよ（重要事項の強調） | Note that external tables can only use external stages. |
| point to ~ | phrasal verb | 〜を指す、参照する | The external table points to an external stage. |

## 3-3. 解説文（日本語）

> 外部テーブルはメタデータの定義です。すなわち、外部テーブルの定義を登録しますが、外部テーブル自体はデータを含みません。代わりに、テーブルのメタデータには列定義・外部ステージ名（データの取得元）・データ読み込みに使用するファイルフォーマットが含まれます。外部ステージはさらに、クラウド上のオブジェクトストレージ（例: AWSバケット、Azure Blob Storage）を指します。外部テーブルは外部ステージのみを参照できることに注意してください。内部ステージを使って外部テーブルを作成することはできません。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
