# 082: GET_PRESIGNED_URL

**SnowPro Core Domain**: Domain 3 — Data Transformation
**作成日**: 2026-04-06
**正答**: D

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| GET_PRESIGNED_URL | SnowflakeのSQL関数。Snowflakeステージ上の非構造化データファイルに、認証不要でアクセスできる一時的なHTTPS URL（プリサインドURL）を生成する。有効期限（expiry）は設定可能 |
| Pre-signed URL（プリサインドURL） | プリサインドアクセストークンを使って生成される、一時的なHTTPS URL。SnowflakeにログインしていないユーザーやアプリケーションでもWebブラウザ経由でファイルをダウンロードできる。有効期限が設定でき、期限切れ後はアクセス不可 |
| BUILD_SCOPED_FILE_URL | Snowflakeの別のURL生成関数。スコープ付きのファイルURLを生成する。アクセスには**Snowflakeの認証が必要**で、特定のユーザーやロールにスコープを限定するため、GET_PRESIGNED_URLとは異なる |
| BUILD_STAGE_FILE_URL | Snowflakeのステージ上のファイルを参照するURLを生成する関数。アクセスには**Snowflakeの認証が必要**。外部ユーザーへの共有には向かない |
| GET_DATA_FROM_STAGE | 存在しない関数名。試験でのディストラクター（惑わし）として使われている。正式な関数ではない |
| Unstructured Data（非構造化データ） | PDF・画像・動画・音声ファイルなど、テーブルの行・列形式ではないデータ。SnowflakeはV6.0以降ステージを通じて非構造化データを管理・処理できる |
| Stage（ステージ） | Snowflakeにデータをロードする前、またはアンロードする際に使う一時的なストレージ領域。内部ステージ（Snowflake管理）と外部ステージ（S3/Azure/GCS）がある |
| Pre-signed Access Token（プリサインドアクセストークン） | プリサインドURLの生成に使われるトークン。このトークンが埋め込まれたURLは、認証情報なしにファイルへのアクセスを一時的に可能にする |

## 1-2. 重要コンセプトまとめ

- **GET_PRESIGNED_URL = 認証不要のファイル共有**: 3つの類似関数の中で「誰でも（any user or application）アクセスできる」のは GET_PRESIGNED_URL だけ。Snowflakeアカウントを持たない外部ユーザーへのファイル共有に使う
- **URL種類の比較**:
  - `GET_PRESIGNED_URL` → 認証不要、有効期限あり、誰でもアクセス可能
  - `BUILD_SCOPED_FILE_URL` → 認証必要、特定ユーザー/ロールにスコープ限定
  - `BUILD_STAGE_FILE_URL` → 認証必要、ステージへの参照URLを生成
- **有効期限（expiry）が設定可能**: プリサインドURLは永続的ではなく、有効期限を設定できる。期限後は無効になる
- **"without authorization"**: 認証不要でアクセスできる点が試験での核心。`without authorization` というフレーズは他の関数との最大の違い
- **用途**: 非構造化データ（画像・PDF等）をSnowflake外部のユーザー・アプリケーションと共有するシナリオで使用

## 1-3. 公式ドキュメントURL

- [Types of URLs Available to Access Files](https://docs.snowflake.com/en/user-guide/unstructured-intro#types-of-urls-available-to-access-files)
- [GET_PRESIGNED_URL Function](https://docs.snowflake.com/en/sql-reference/functions/get_presigned_url)

---

## 2-1. 問題文（英語）

> Which file function allows any user or application access to download unstructured data in a Snowflake stage?
>
> A. GET_DATA_FROM_STAGE
> B. BUILD_STAGE_FILE_URL
> C. BUILD_SCOPED_FILE_URL
> D. GET_PRESIGNED_URL

## 2-2. 問題文の文法解析

### 文1: "Which file function allows any user or application access to download unstructured data in a Snowflake stage?"

- **主語 (S)**: Which file function（疑問詞 which を含む名詞句が主語）
- **動詞 (V)**: allows
- **目的語 (O)**: any user or application（間接目的語的役割）
- **補語・目的格補語**: access to download unstructured data in a Snowflake stage
- **文型**: SV + O + 目的格補語
- **注目ポイント**:
  - **"allows O access to do"**: `allow O to do`（Oが〜することを許可する）の変形。`access` を名詞として使い、「Oに〜するためのアクセスを与える」という意味。`allow O access to ~` = `give O the ability to access ~`
  - **"any user or application"**: `any` は「誰でも・どのアプリケーションでも」。制限なしのアクセスを示すキーワード。正解の根拠となる表現
  - **"in a Snowflake stage"**: 場所を示す前置詞句。`unstructured data` を修飾

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| unstructured | 形容詞 | 非構造化の、形式化されていない | Unstructured data includes images, PDFs, and videos. |
| access | 名詞 | アクセス（権）、利用権 | Users are granted access to download the file. |
| download | 動詞 | ダウンロードする、取得する | The application can download files from the stage. |
| stage | 名詞 | ステージ（Snowflakeのファイル保管場所） | Files are uploaded to a Snowflake stage first. |

## 2-3. 問題文（日本語）

> Snowflakeステージ内の非構造化データを、任意のユーザーまたはアプリケーションがダウンロードできるようにするファイル関数はどれですか？
>
> A. GET_DATA_FROM_STAGE
> B. BUILD_STAGE_FILE_URL
> C. BUILD_SCOPED_FILE_URL
> D. GET_PRESIGNED_URL

---

## 3-1. 解説文（英語）

> A pre-signed URL is a simple HTTPS URL for accessing a file using a web browser. A pre-signed URL is generated using a pre-signed access token. Users can temporarily access a file via a pre-signed URL without authorization. The expiry duration of a pre-signed URL is configurable and can be set to the required duration.

## 3-2. 解説文の文法解析

### 文1: "A pre-signed URL is a simple HTTPS URL for accessing a file using a web browser."

- **主語 (S)**: A pre-signed URL
- **動詞 (V)**: is
- **補語 (C)**: a simple HTTPS URL for accessing a file using a web browser
- **文型**: SVC
- **注目ポイント**:
  - **"for + 動名詞"**: `for accessing a file` = 「ファイルにアクセスするための」。名詞 `URL` の目的・用途を示す前置詞 `for` + 動名詞
  - **"using a web browser"**: 現在分詞句。`accessing` の手段を示す付帯状況。「Webブラウザを使って」
  - **"simple"**: 技術的な複雑さがないことを示す。認証手続きが不要であることの言い換え

### 文2: "A pre-signed URL is generated using a pre-signed access token."

- **主語 (S)**: A pre-signed URL
- **動詞 (V)**: is generated（受動態）
- **修飾語 (M)**: using a pre-signed access token（現在分詞句、手段）
- **文型**: SV（受動態）
- **注目ポイント**:
  - **受動態 "is generated"**: 生成する主体（Snowflakeシステム）を省略し、URLそのものに焦点を当てる
  - **"using + 名詞"**: 手段を示す分詞構文。「プリサインドアクセストークンを使って」

### 文3: "Users can temporarily access a file via a pre-signed URL without authorization."

- **主語 (S)**: Users
- **動詞 (V)**: can access（助動詞 + 動詞原形）
- **目的語 (O)**: a file
- **修飾語 (M1)**: temporarily（副詞、アクセスの一時性を修飾）
- **修飾語 (M2)**: via a pre-signed URL（手段）
- **修飾語 (M3)**: without authorization（条件：認証不要）
- **文型**: SVO
- **注目ポイント**:
  - **"temporarily"**: 「一時的に」。有効期限があることを副詞1語で示す重要な語
  - **"via ~"**: 「〜を経由して」。手段・媒体を示す前置詞。`through ~` と同義
  - **"without authorization"**: 「認証なしに」。前置詞 `without` + 名詞。これが GET_PRESIGNED_URL の最大の特徴であり、正解の根拠

### 文4: "The expiry duration of a pre-signed URL is configurable and can be set to the required duration."

- **主語 (S)**: The expiry duration of a pre-signed URL
- **動詞 (V)**: is（形容詞 configurable の繋ぎ）/ can be set（受動態）
- **補語 (C)**: configurable（形容詞）
- **修飾語 (M)**: to the required duration（設定先）
- **文型**: SVC / SV（受動態）を `and` で並列
- **注目ポイント**:
  - **"is configurable and can be set to ~"**: 形容詞述語 `is configurable`（設定可能である）と受動態 `can be set to`（〜に設定できる）を並列。2つの述語で「設定可能＝具体的に値を指定できる」を表現
  - **"the required duration"**: 「必要とされる期間」。`required` は過去分詞の形容詞的用法で「要件として求められる」の意味

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| pre-signed | 形容詞 | プリサインドの、事前署名された | A pre-signed URL embeds an access token. |
| temporarily | 副詞 | 一時的に、仮に | Users can temporarily access the file before the URL expires. |
| authorization | 名詞 | 認証、許可 | The file can be accessed without authorization. |
| configurable | 形容詞 | 設定可能な、構成可能な | The expiry duration is configurable. |
| expiry | 名詞 | 有効期限、失効 | Set the expiry duration to 24 hours. |

## 3-3. 解説文（日本語）

> プリサインドURL（Pre-signed URL）は、Webブラウザを使ってファイルにアクセスするためのシンプルなHTTPS URLです。プリサインドURLは、プリサインドアクセストークンを使って生成されます。ユーザーは、認証なしにプリサインドURLを通じてファイルに一時的にアクセスできます。プリサインドURLの有効期限（expiry）は設定可能で、必要な期間に合わせて設定できます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
