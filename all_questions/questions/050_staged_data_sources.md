# 050: Staged Data Sources — Supported Loading Locations

**SnowPro Core Domain**: Domain 3 — Data Loading, Unloading, and Connectivity
**作成日**: 2026-04-03
**正答**: A・C・D・E（Azure Blob Storage / Google Cloud Storage / Internal Stage / AWS S3）

> 関連問題: 014（Data Unload Defaults）・028（External Tables）・038（PUT Command Encryption）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Stage（ステージ） | Snowflakeがデータをロードする前の一時的な置き場所。Internal StageとExternal Stageの2種類がある |
| Internal Stage（内部ステージ） | Snowflakeが管理するクラウドストレージ上のステージ。Table Stage・User Stage・Named Stage の3種類がある。PUT コマンドでファイルをアップロード |
| External Stage（外部ステージ） | ユーザーが管理するクラウドストレージ（AWS S3・Azure Blob・GCS）への参照。`CREATE STAGE` で定義する |
| AWS S3（Amazon Simple Storage Service） | AmazonのオブジェクトストレージサービスSサービス。SnowflakeのExternal Stageとして最も広く使われる |
| Azure Blob Storage | MicrosoftのAzureプラットフォームのオブジェクトストレージサービス。SnowflakeのExternal Stageとして対応 |
| Google Cloud Storage (GCS) | GoogleのクラウドプラットフォームのオブジェクトストレージサービスS3。SnowflakeのExternal Stageとして対応 |
| VMware Storage | VMwareの仮想化ストレージ。Snowflakeのステージとして**非対応**（試験の引っかけ選択肢） |
| Oracle Cloud Storage | OracleのクラウドオブジェクトストレージS3。Snowflakeのステージとして**非対応**（試験の引っかけ選択肢） |
| COPY INTO（COPYコマンド） | ステージからSnowflakeテーブルへデータをロードするコマンド。ステージにデータが用意された後に実行する |

## 1-2. 重要コンセプトまとめ

- **Snowflakeがサポートするステージの種類**:

  | 種類 | 実体 | 管理者 |
  |------|------|--------|
  | **Internal Stage** | Snowflakeが管理するストレージ | Snowflake |
  | **External Stage (AWS S3)** | Amazon S3バケット | ユーザー |
  | **External Stage (Azure Blob)** | Azure Blob Storageコンテナ | ユーザー |
  | **External Stage (GCS)** | Google Cloud Storageバケット | ユーザー |

- **サポートされない（試験の引っかけ）**:
  - **VMware Storage** → Snowflakeはクラウド専業。VMwareは仮想化基盤であり、オブジェクトストレージとして対応していない
  - **Oracle Cloud Storage** → Snowflakeは AWS・Azure・GCS の3大クラウドのみ対応。OracleのOCI（Oracle Cloud Infrastructure）は非対応

- **データロードの流れ**:
  1. データをステージに配置（内部ステージ → PUT、外部ステージ → クラウドコンソール等）
  2. `COPY INTO <table>` でステージからテーブルへロード

- **試験ポイント**: クラウドベンダーの「ビッグ3（AWS・Azure・GCP）」のみ外部ステージとして対応していると覚える

## 1-3. 公式ドキュメントURL

- [Data Loading Overview](https://docs.snowflake.com/en/user-guide/data-load-overview)
- [Understanding Snowflake Stages](https://docs.snowflake.com/en/user-guide/data-load-local-file-system-stage)

---

## 2-1. 問題文（英語）

> Snowflake can load data staged in which of the following? Select all that apply.
>
> A. Azure Blob Storage
> B. VMWare Storage
> C. Google Cloud Storage
> D. Internal Stage
> E. Oracle Cloud Storage
> F. AWS S3

## 2-2. 問題文の文法解析

### 文1: "Snowflake can load data staged in which of the following?"

- **主語 (S)**: Snowflake
- **助動詞**: can（〜できる）
- **動詞 (V)**: load（ロードする）
- **目的語 (O)**: data staged in which of the following（以下のどれかにステージングされたデータを）
- **注目ポイント**: `data staged in ~` = 「〜にステージングされたデータ」。`staged` は過去分詞の後置修飾。「ステージに置かれた（準備された）データ」を意味する

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| staged | 過去分詞（後置修飾） | ステージングされた・ステージに配置された | Data staged in S3 can be loaded into Snowflake. |
| load | 動詞 | ロードする・読み込む | COPY INTO is used to load data from a stage. |
| blob | 名詞 | Binary Large OBject の略。大容量データの格納単位 | Azure Blob Storage stores unstructured data. |

## 2-3. 問題文（日本語）

> Snowflakeは以下のどこにステージングされたデータをロードできますか？当てはまるものをすべて選択してください。
>
> A. Azure Blob Storage
> B. VMWare Storage
> C. Google Cloud Storage
> D. Internal Stage
> E. Oracle Cloud Storage
> F. AWS S3

---

## 3-1. 解説文（英語）

> Snowflake supports loading from Internal Stages and External Stages. External Stages can use AWS S3, Azure Blob, and Google Cloud Storage. Before data can be processed into a Snowflake table, it is typically first made available in a Snowflake stage. This allows Snowflake access to the data to be loaded into a table. Once the data is available in a stage, the COPY command can be used to copy the data into a table.

## 3-2. 解説文の文法解析

### 文1: "Snowflake supports loading from Internal Stages and External Stages."

- **主語 (S)**: Snowflake
- **動詞 (V)**: supports（サポートする）
- **目的語 (O)**: loading from Internal Stages and External Stages（Internal StageとExternal Stageからのロードを）← `support + 動名詞`
- **注目ポイント**: `support + 動名詞` = 「〜することをサポートする」。`support to do` は誤りで、`support + 動名詞` が正しい形

### 文2: "Before data can be processed into a Snowflake table, it is typically first made available in a Snowflake stage."

- **時間節**: Before data can be processed into a Snowflake table（データがSnowflakeテーブルに処理される前に）← `can be processed` = 受動態
- **主語 (S)**: it（データは）
- **動詞 (V)**: is typically first made available（最初にステージで利用可能にされる）← `make + O + available` の受動態
- **注目ポイント**: `make ~ available` = 「〜を利用可能にする」。受動態 `be made available` は「利用可能な状態にされる」

### 文3: "This allows Snowflake access to the data to be loaded into a table."

- **主語 (S)**: This（このこと＝ステージに置かれること）
- **動詞 (V)**: allows（許可する・可能にする）
- **目的語 (O)**: Snowflake access to the data（SnowflakeがそのデータへアクセスすることをSV）← `allow O + 名詞` 構文
- **修飾語**: to be loaded into a table（テーブルにロードされるための）← 不定詞の目的
- **注目ポイント**: `allow O access to ~` = 「OがXにアクセスするのを可能にする」。`allow O to do` とは異なる語順

### 文4: "Once the data is available in a stage, the COPY command can be used to copy the data into a table."

- **時間節**: Once the data is available in a stage（一旦データがステージで利用可能になると）← `Once S + V` = 起点を示す接続詞
- **主語 (S)**: the COPY command（COPYコマンドは）
- **動詞 (V)**: can be used to copy（コピーするために使用できる）← 受動態 + 不定詞
- **注目ポイント**: `Once + S + V` = 「一旦〜すると」。状態変化の起点を示す。「Once the data is available」で「データが使える状態になったとたん」という意味

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| support + 動名詞 | 熟語 | 〜することをサポートする | Snowflake supports loading from S3. |
| be made available | 受動態熟語 | 利用可能な状態にされる | Data is first made available in a stage. |
| allow O access to ~ | 熟語 | OがXにアクセスするのを可能にする | The stage allows Snowflake access to the data. |
| Once S + V | 接続詞 | 一旦〜すると | Once data is in a stage, COPY can be used. |
| typically | 副詞 | 一般的に、通常 | Data is typically first staged before loading. |

## 3-3. 解説文（日本語）

> Snowflakeは Internal Stage と External Stage からのロードをサポートしています。External Stageとして使用できるのは AWS S3、Azure Blob、Google Cloud Storage です。データがSnowflakeテーブルに処理される前に、通常まずSnowflakeのステージで利用可能な状態にします。これにより、Snowflakeがテーブルにロードするためのデータにアクセスできるようになります。一旦データがステージで利用可能になると、COPYコマンドを使ってデータをテーブルにコピーできます。

---

## 復習メモ

- [ ] サポートされる4つのロード元（Internal Stage・S3・Azure Blob・GCS）を列挙できる
- [ ] VMware・Oracle Cloud がなぜ不正解かを説明できる（クラウドビッグ3のみ対応）
- [ ] `be made available`・`allow O access to ~`・`Once S + V` の英語パターンを確認した
- [ ] この問題はサンドボックスで `CREATE STAGE` を試すことができる
