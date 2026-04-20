# 093: COPY Load History Views

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-14
**正答**: B, D

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| ACCOUNT_USAGE.COPY_HISTORY | COPYコマンドによるデータロード履歴を365日間保持するビュー |
| ACCOUNT_USAGE.LOAD_HISTORY | COPYコマンドによるデータロード履歴を365日間保持するビュー。COPY_HISTORYと類似だが提供情報が異なる |
| ACCOUNT_USAGE.PIPE_USAGE_HISTORY | **Snowpipe**の使用状況ビュー。COPYコマンドのロード履歴ではない |
| INFORMATION_SCHEMA.QUERY_HISTORY | クエリ履歴のテーブル関数。COPYロード専用ではない |

## 1-2. 重要コンセプトまとめ

- COPYコマンドのロード履歴365日間 = **COPY_HISTORY** と **LOAD_HISTORY** の2つ
- PIPE_USAGE_HISTORYはSnowpipe用であり、COPYコマンドのロード履歴ではない
- INFORMATION_SCHEMA.QUERY_HISTORYはクエリ全般の履歴であり、COPYロード専用ではない

## 1-3. 公式ドキュメントURL

- [LOAD_HISTORY](https://docs.snowflake.com/en/sql-reference/account-usage/load_history)
- [COPY_HISTORY](https://docs.snowflake.com/en/sql-reference/account-usage/copy_history)

---

## 2-1. 問題文（英語）

> Which of the following views can be used to view the last 365 days of loading history for data loaded through the COPY command? Select two answers.
>
> A. ACCOUNT_USAGE.PIPE_USAGE_HISTORY
> B. ACCOUNT_USAGE.LOAD_HISTORY
> C. INFORMATION_SCHEMA.QUERY_HISTORY
> D. ACCOUNT_USAGE.COPY_HISTORY

## 2-2. 問題文の文法解析

### 文1: "Which of the following views can be used to view the last 365 days of loading history for data loaded through the COPY command?"

- **注目ポイント**: `for data loaded through the COPY command` がCOPYコマンド限定の条件。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| loading history | noun | ロード履歴 | View the last 365 days of loading history. |

## 2-3. 問題文（日本語）

> COPYコマンドでロードされたデータの過去365日間のロード履歴を表示するビューはどれですか？2つ選んでください。

---

## 3-1. 解説文（英語）

> The COPY_HISTORY view and the LOAD_HISTORY view in the ACCOUNT_USAGE schema provide the history of data loading performed through the COPY command.

## 3-2. 解説文の文法解析

### 文1: シンプルに2つのビューがCOPYコマンドのロード履歴を提供することを明示。

## 3-3. 解説文（日本語）

> ACCOUNT_USAGEスキーマのCOPY_HISTORYビューとLOAD_HISTORYビューが、COPYコマンドで実行されたデータロードの履歴を提供します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
