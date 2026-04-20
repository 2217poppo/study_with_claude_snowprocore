# 082: URL Types Expiry

**SnowPro Core Domain**: Domain 3 — Data Loading, Unloading, and Connectivity
**作成日**: 2026-04-16
**正答**: C, D

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| File URL | ステージファイルへの永続的なSnowflakeホストURL。**有効期限なし**。アクセスにはSnowflakeへのログインとステージ権限が必要 |
| Scoped URL | ステージファイルへの一時的でエンコードされたURL。**24時間で有効期限切れ**。ステージ権限なしで一時的なアクセスを提供 |
| Pre-signed URL | ステージファイルへのシンプルなHTTPS URL。**有効期限は設定可能**。Webブラウザで直接アクセス可能 |
| Unstructured Data（非構造化データ） | 画像、PDF、動画などのファイル。Snowflakeのステージに保存し、URLでアクセスする |

## 1-2. 重要コンセプトまとめ

- Snowflakeの3種類のURL（暗記必須）:
  1. **File URL**: 永続的（expire しない）、Snowflake認証が必要
  2. **Scoped URL**: 24時間で失効、ステージ権限不要
  3. **Pre-signed URL**: 有効期限は設定可能（configurable）、ブラウザアクセス可能
- 試験のひっかけ:
  - 「File URLは24時間で失効」→ **誤り**（永続）
  - 「Scoped URLは失効しない」→ **誤り**（24時間で失効）
- File URL ≠ 永遠に存在するわけではない（ファイル削除すればアクセス不可）

## 1-3. 公式ドキュメントURL

- [Types of URLs Available to Access Files](https://docs.snowflake.com/en/user-guide/unstructured-intro#types-of-urls-available-to-access-files)

---

## 2-1. 問題文（英語）

> Which of the following statements are true regarding URL expiry?
>
> Select all that apply.
>
> A. Scoped URLs don't expire.
> B. File URLs expire after 24 hours.
> C. Scoped URLs expire after 24 hours.
> D. File URLs never expire.

## 2-2. 問題文の文法解析

### 文1: "Which of the following statements are true regarding URL expiry?"

- **主語 (S)**: Which of the following statements
- **動詞 (V)**: are
- **補語 (C)**: true
- **修飾語 (M)**: regarding URL expiry
- **文型**: SVC
- **注目ポイント**: 「regarding URL expiry」で話題を限定。expiry = 有効期限。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| expiry | 名詞 | 有効期限、失効 | URL expiry depends on the URL type. |
| expire | 動詞 | 有効期限が切れる | Scoped URLs expire after 24 hours. |
| permanent | 形容詞 | 永続的な | A file URL is a permanent URL. |
| configurable | 形容詞 | 設定可能な | The expiry duration is configurable. |

## 2-3. 問題文（日本語）

> URLの有効期限に関して正しい記述はどれですか？
>
> 該当するものをすべて選んでください。
>
> A. Scoped URLは失効しない。
> B. File URLは24時間後に失効する。
> C. Scoped URLは24時間後に失効する。
> D. File URLは失効しない。

---

## 3-1. 解説文（英語）

> A file URL is a permanent Snowflake-hosted URL to a staged file. File URLs don't expire.
>
> A scoped URL is a temporary and encoded URL that allows temporary access to a staged file without requiring any privileges on the stage. A scoped URL expires after 24 hours.
>
> A pre-signed URL is a simple HTTPS URL for accessing a file using a web browser. The expiry duration of a pre-signed URL is configurable and can be set to the required duration.

## 3-2. 解説文の文法解析

### 文1: "A file URL is a permanent Snowflake-hosted URL to a staged file."

- **主語 (S)**: A file URL
- **動詞 (V)**: is
- **補語 (C)**: a permanent Snowflake-hosted URL to a staged file
- **文型**: SVC
- **注目ポイント**: 「permanent」と「Snowflake-hosted」の2つの形容詞がURLを修飾。

### 文2: "A scoped URL is a temporary and encoded URL that allows temporary access to a staged file without requiring any privileges on the stage."

- **主語 (S)**: A scoped URL
- **動詞 (V)**: is
- **補語 (C)**: a temporary and encoded URL
- **修飾語 (M)**: that allows temporary access ... without requiring any privileges on the stage（関係詞節）
- **文型**: SVC
- **注目ポイント**: 「without requiring any privileges」で「権限不要で」。Scoped URLの特徴をthat節で詳述。

### 文3: "The expiry duration of a pre-signed URL is configurable and can be set to the required duration."

- **主語 (S)**: The expiry duration of a pre-signed URL
- **動詞 (V)**: is / can be set
- **補語 (C)**: configurable
- **修飾語 (M)**: to the required duration
- **文型**: SVC; SV（受動態）
- **注目ポイント**: 「configurable」で設定可能。Pre-signed URLだけが有効期限を自由に設定できる。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| permanent | 形容詞 | 永続的な | A permanent Snowflake-hosted URL. |
| temporary | 形容詞 | 一時的な | A temporary and encoded URL. |
| encoded | 形容詞 | エンコードされた | A scoped URL is encoded. |
| without requiring | 前置詞+動名詞 | ～を必要とせずに | Access without requiring privileges. |

## 3-3. 解説文（日本語）

> File URLはステージファイルへの永続的なSnowflakeホストURLです。File URLは失効しません。
>
> Scoped URLはステージ上の権限なしでステージファイルへの一時的なアクセスを可能にする一時的でエンコードされたURLです。Scoped URLは24時間後に失効します。
>
> Pre-signed URLはWebブラウザでファイルにアクセスするためのシンプルなHTTPS URLです。Pre-signed URLの有効期限は設定可能で、必要な期間に設定できます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
