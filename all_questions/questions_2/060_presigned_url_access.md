# 060: Pre-signed URL Access

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-13
**正答**: Pre-signed URL

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Pre-signed URL（プリサインドURL） | プリサインドアクセストークンを埋め込んだ一時的なHTTPS URL。**認証なしで** Webブラウザからファイルにアクセス可能。有効期限は設定可能 |
| Scoped URL（スコープドURL） | 認証済みユーザーのみがアクセスできるURL。ロール権限に基づくアクセス制御あり。有効期限は24時間 |
| File URL（ファイルURL） | ステージ内ファイルへの永続的な参照URL。ファイルの場所を指すが、アクセスには認証が必要 |
| GET_PRESIGNED_URL | Pre-signed URLを生成するSnowflake関数 |

## 1-2. 重要コンセプトまとめ

- 3種類のURLの比較:

| 特性 | Pre-signed URL | Scoped URL | File URL |
|------|---------------|------------|----------|
| 認証 | **不要** | 必要 | 必要 |
| 有効期限 | 設定可能 | 24時間 | 永続 |
| アクセス制御 | なし | ロールベース | ロールベース |
| 生成 | GET_PRESIGNED_URL | BUILD_SCOPED_FILE_URL | BUILD_STAGE_FILE_URL |

- **「without authorization」= Pre-signed URL**（認証なしアクセスの唯一の選択肢）
- Pre-signed URLはWebブラウザで直接アクセスできるHTTPS URL
- セキュリティリスク: URLを知っていれば誰でもアクセスできるため、有効期限の管理が重要

## 1-3. 公式ドキュメントURL

- [Types of URLs Available to Access Files](https://docs.snowflake.com/en/user-guide/unstructured-intro#types-of-urls-available-to-access-files)

---

## 2-1. 問題文（英語）

> Which of the following URL types enables access to a file without requiring authorization?
>
> A. File URL
> B. Pre-signed URL
> C. Scoped URL

## 2-2. 問題文の文法解析

### 文1: "Which of the following URL types enables access to a file without requiring authorization?"

- **主語 (S)**: Which of the following URL types
- **動詞 (V)**: enables
- **目的語 (O)**: access to a file
- **修飾語 (M)**: without requiring authorization（条件）
- **文型**: SVO
- **注目ポイント**: `without requiring ~` は「～を必要とせずに」。`enables access` で「アクセスを可能にする」。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| enable | verb | 可能にする | Enables access without authorization. |
| authorization | noun | 認証、承認 | Without requiring authorization. |
| pre-signed | adjective | 事前署名された | A pre-signed access token. |
| configurable | adjective | 設定可能な | The expiry duration is configurable. |

## 2-3. 問題文（日本語）

> 認証を必要とせずにファイルへのアクセスを可能にするURLタイプは以下のどれですか？
>
> A. File URL
> B. Pre-signed URL
> C. Scoped URL

---

## 3-1. 解説文（英語）

> A pre-signed URL is a simple HTTPS URL for accessing a file using a web browser. A pre-signed URL is generated using a pre-signed access token. Users can temporarily access a file via a pre-signed URL without authorization. The expiry duration of a pre-signed URL is configurable and can be set to the required duration.

## 3-2. 解説文の文法解析

### 文1: "A pre-signed URL is a simple HTTPS URL for accessing a file using a web browser."

- **主語 (S)**: A pre-signed URL
- **動詞 (V)**: is
- **補語 (C)**: a simple HTTPS URL
- **修飾語 (M)**: for accessing a file using a web browser（目的）
- **文型**: SVC

### 文2: "Users can temporarily access a file via a pre-signed URL without authorization."

- **主語 (S)**: Users
- **動詞 (V)**: can access
- **目的語 (O)**: a file
- **修飾語 (M)**: temporarily（副詞）、via a pre-signed URL（手段）、without authorization（条件）
- **文型**: SVO
- **注目ポイント**: `temporarily` が重要 — 永続アクセスではなく一時的。`without authorization` がこのURLの核心的特徴。

### 文3: "The expiry duration of a pre-signed URL is configurable and can be set to the required duration."

- **主語 (S)**: The expiry duration of a pre-signed URL
- **動詞 (V)**: is / can be set（並列）
- **補語/修飾語**: configurable / to the required duration
- **文型**: SVC + SV
- **注目ポイント**: `configurable` は「設定可能な」。有効期限をカスタマイズできることを示す。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| temporarily | adverb | 一時的に | Users can temporarily access the file. |
| via ~ | preposition | ～を通じて | Access via a pre-signed URL. |
| expiry duration | noun | 有効期間 | The expiry duration is configurable. |

## 3-3. 解説文（日本語）

> Pre-signed URLはWebブラウザを使用してファイルにアクセスするためのシンプルなHTTPS URLです。Pre-signed URLはプリサインドアクセストークンを使用して生成されます。ユーザーはPre-signed URLを通じて認証なしに一時的にファイルにアクセスできます。Pre-signed URLの有効期限は設定可能で、必要な期間に設定できます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
