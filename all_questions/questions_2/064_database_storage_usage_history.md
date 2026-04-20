# 064: DATABASE_STORAGE_USAGE_HISTORY

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-13
**正答**: ACCOUNT_USAGE.DATABASE_STORAGE_USAGE_HISTORY

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| DATABASE_STORAGE_USAGE_HISTORY | ACCOUNT_USAGEスキーマのビュー。データベースごとのストレージ使用バイト数を表示。365日間保持 |
| ACCOUNT_USAGE.DATABASES | データベースの情報（名前・作成日等）を提供するビュー。ストレージサイズは含まない |
| ACCOUNT_USAGE.TAGS | タグに関するメタデータを提供するビュー。ストレージ情報ではない |
| ACCOUNT_USAGE.SESSIONS | セッション情報を提供するビュー。ストレージ情報ではない |

## 1-2. 重要コンセプトまとめ

- ストレージ使用量を見るビュー = **DATABASE_STORAGE_USAGE_HISTORY**
- DATABASESビューはDB情報を提供するが **サイズは含まない**（よくあるひっかけ）
- ACCOUNT_USAGEの主要ビューの使い分け:
  - ストレージ: DATABASE_STORAGE_USAGE_HISTORY
  - クエリ履歴: QUERY_HISTORY
  - ロード履歴: COPY_HISTORY
  - DB情報: DATABASES（サイズなし）
- すべて365日間保持、45分〜3時間の遅延あり

## 1-3. 公式ドキュメントURL

- [DATABASE_STORAGE_USAGE_HISTORY](https://docs.snowflake.com/en/sql-reference/account-usage/database_storage_usage_history)
- [DATABASES View](https://docs.snowflake.com/en/sql-reference/account-usage/databases)

---

## 2-1. 問題文（英語）

> Which of the following ACCOUNT_USAGE view can be used to view the storage consumed by a database?
>
> A. ACCOUNT_USAGE.DATABASES
> B. ACCOUNT_USAGE.TAGS
> C. ACCOUNT_USAGE.DATABASE_STORAGE_USAGE_HISTORY
> D. ACCOUNT_USAGE.SESSIONS

## 2-2. 問題文の文法解析

### 文1: "Which of the following ACCOUNT_USAGE view can be used to view the storage consumed by a database?"

- **主語 (S)**: Which of the following ACCOUNT_USAGE view
- **動詞 (V)**: can be used（受動態）
- **修飾語 (M)**: to view the storage consumed by a database（目的）
- **文型**: SV（受動態疑問文）
- **注目ポイント**: `consumed by ~` は過去分詞の後置修飾で「～によって消費されたストレージ」。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| consumed | adjective | 消費された | Storage consumed by a database. |
| the number of bytes | noun | バイト数 | Shows the number of bytes used. |

## 2-3. 問題文（日本語）

> データベースによって消費されるストレージを表示するために使用できるACCOUNT_USAGEビューは以下のどれですか？
>
> A. ACCOUNT_USAGE.DATABASES
> B. ACCOUNT_USAGE.TAGS
> C. ACCOUNT_USAGE.DATABASE_STORAGE_USAGE_HISTORY
> D. ACCOUNT_USAGE.SESSIONS

---

## 3-1. 解説文（英語）

> The DATABASE_STORAGE_USAGE_HISTORY view in the ACCOUNT_USAGE schema shows the number of bytes of database storage used by each database.
>
> The DATABASES view provides information on each database but doesn't show the size consumed.

## 3-2. 解説文の文法解析

### 文1: "The DATABASE_STORAGE_USAGE_HISTORY view in the ACCOUNT_USAGE schema shows the number of bytes of database storage used by each database."

- **主語 (S)**: The DATABASE_STORAGE_USAGE_HISTORY view
- **動詞 (V)**: shows
- **目的語 (O)**: the number of bytes of database storage used by each database
- **文型**: SVO

### 文2: "The DATABASES view provides information on each database but doesn't show the size consumed."

- **主語 (S)**: The DATABASES view
- **動詞 (V)**: provides / doesn't show（並列）
- **目的語 (O)**: information on each database / the size consumed
- **文型**: SVO + SVO
- **注目ポイント**: `but doesn't show ~` でDATABASESビューの制限を明示。ひっかけ回避の根拠。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| the number of bytes | noun | バイト数 | Shows the number of bytes used. |
| provides information on ~ | phrase | ～に関する情報を提供する | Provides information on each database. |

## 3-3. 解説文（日本語）

> ACCOUNT_USAGEスキーマのDATABASE_STORAGE_USAGE_HISTORYビューは、各データベースが使用するデータベースストレージのバイト数を表示します。
>
> DATABASESビューは各データベースに関する情報を提供しますが、消費されたサイズは表示しません。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
