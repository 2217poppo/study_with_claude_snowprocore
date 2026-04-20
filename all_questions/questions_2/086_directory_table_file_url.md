# 086: Directory Table File URL

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-14
**正答**: False

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Directory Table（ディレクトリテーブル） | ステージ内のファイルのカタログ情報を提供するテーブル。ファイル名・サイズ・URL等を含む |
| File URL（ファイルURL） | Directory Tableが提供するファイルへの参照URL。**長期URL**で**有効期限なし** |
| Pre-signed URL | アクセストークン付きの一時URL。有効期限あり。File URLとは異なる |
| Scoped URL | 認証済みユーザー向けURL。24時間有効。File URLとは異なる |

## 1-2. 重要コンセプトまとめ

- Directory TableのFile URLは **有効期限なし（doesn't expire）** — 長期URL
- 「90日で有効期限切れ」は **False**
- 3種類のURLの有効期限比較:

| URL種別 | 有効期限 |
|---------|---------|
| File URL | **なし（長期）** |
| Pre-signed URL | 設定可能（短期） |
| Scoped URL | 24時間 |

- Directory Tableをクエリすると、対応ステージ内の各ファイルのFile URLが取得できる

## 1-3. 公式ドキュメントURL

- [What Are Directory Tables?](https://docs.snowflake.com/en/user-guide/data-load-dirtables-intro#what-are-directory-tables)

---

## 2-1. 問題文（英語）

> True or False: Querying a directory table provides a File URL for each file in the corresponding stage. The URL is valid for 90 days.
>
> A. False
> B. True

## 2-2. 問題文の文法解析

### 文1: "Querying a directory table provides a File URL for each file in the corresponding stage."

- **主語 (S)**: Querying a directory table（動名詞句）
- **動詞 (V)**: provides
- **目的語 (O)**: a File URL for each file
- **修飾語 (M)**: in the corresponding stage（場所）
- **文型**: SVO

### 文2: "The URL is valid for 90 days."

- **主語 (S)**: The URL
- **動詞 (V)**: is
- **補語 (C)**: valid for 90 days
- **文型**: SVC
- **注目ポイント**: `valid for ~ days` は「～日間有効」。これが誤り — File URLは有効期限なし。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| corresponding | adjective | 対応する | The corresponding stage. |
| long-term URL | noun | 長期URL | A long-term URL that doesn't expire. |
| valid for ~ | phrase | ～の間有効 | The URL is valid indefinitely. |

## 2-3. 問題文（日本語）

> 真/偽: ディレクトリテーブルをクエリすると、対応するステージ内の各ファイルのFile URLが提供される。URLは90日間有効である。

---

## 3-1. 解説文（英語）

> The File URL provided by a directory table is a long-term URL and doesn't expire.

## 3-2. 解説文の文法解析

### 文1: "The File URL provided by a directory table is a long-term URL and doesn't expire."

- **主語 (S)**: The File URL provided by a directory table
- **動詞 (V)**: is / doesn't expire（並列）
- **補語**: a long-term URL
- **文型**: SVC + SV
- **注目ポイント**: `doesn't expire` で「有効期限がない」ことを明確に否定。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| expire | verb | 有効期限が切れる | The File URL doesn't expire. |
| long-term | adjective | 長期の | A long-term URL. |

## 3-3. 解説文（日本語）

> ディレクトリテーブルが提供するFile URLは長期URLであり、有効期限は切れません。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
