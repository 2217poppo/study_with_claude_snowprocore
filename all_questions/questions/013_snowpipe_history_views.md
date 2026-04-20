# 013: Snowpipe Data Loading History Views

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-02
**正答**: C と D（2つ）
- A. INFORMATION_SCHEMA.QUERY_HISTORY（**選択したが不正解**）
- B. ACCOUNT_USAGE.LOAD_HISTORY（誤り・未選択）
- C. ACCOUNT_USAGE.COPY_HISTORY（**正しい選択・未選択**）
- D. ACCOUNT_USAGE.PIPE_USAGE_HISTORY（**正しい選択・未選択**）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| ACCOUNT_USAGE スキーマ | Snowflakeが提供するシステムスキーマ。アカウント全体の使用状況・履歴を365日間保持するビューを含む。`snowflake.account_usage.xxx` でアクセス。 |
| INFORMATION_SCHEMA | 各データベースに存在するシステムスキーマ。直近7〜14日のデータのみ保持（ACCOUNT_USAGEより保持期間が短い）。リアルタイム性が高い。 |
| ACCOUNT_USAGE.COPY_HISTORY | COPY INTOコマンドおよびSnowpipeによるデータロードの履歴を**365日間**保持するビュー。ファイル名・ロード状況・行数・エラー情報を確認できる。 |
| ACCOUNT_USAGE.PIPE_USAGE_HISTORY | Snowpipeのパイプ使用状況の履歴を**365日間**保持するビュー。パイプごとの処理クレジット消費量やロードされたバイト数を確認できる。 |
| ACCOUNT_USAGE.LOAD_HISTORY | 存在しない誤答の選択肢。実際にはINFORMATION_SCHEMA.LOAD_HISTORYは存在するが、ACCOUNT_USAGE.LOAD_HISTORYは正式なビューではない。 |
| INFORMATION_SCHEMA.QUERY_HISTORY | クエリ実行履歴を保持するビュー（誤答）。データロード履歴ではなくクエリの実行結果を参照するもの。 |

## 1-2. 重要コンセプトまとめ

- **Snowpipeのデータロード履歴を確認できるビュー（2つ）**:
  1. `ACCOUNT_USAGE.COPY_HISTORY` — ファイルレベルのロード詳細
  2. `ACCOUNT_USAGE.PIPE_USAGE_HISTORY` — パイプのクレジット使用量・バイト数

- **ACCOUNT_USAGE vs INFORMATION_SCHEMA の比較**（試験頻出）:
  | 項目 | ACCOUNT_USAGE | INFORMATION_SCHEMA |
  |------|--------------|-------------------|
  | 保持期間 | **365日** | 7〜14日（ビューにより異なる） |
  | 対象範囲 | アカウント全体 | 各データベース |
  | 遅延 | 最大45分の遅延あり | ほぼリアルタイム |
  | Snowpipeロード履歴 | ✅ あり | 限定的 |

- **今回の間違いの分析**:
  - `INFORMATION_SCHEMA.QUERY_HISTORY` を選択 → これはクエリ実行履歴（データロード履歴ではない）
  - C・Dを両方見逃した → `ACCOUNT_USAGE` スキーマのビュー名を覚えていなかった

- **試験ポイント**:
  - 「last 365 days」→ ACCOUNT_USAGE スキーマを想起
  - 「Snowpipe」のロード履歴 → `COPY_HISTORY` + `PIPE_USAGE_HISTORY` の2つ

## 1-3. 公式ドキュメントURL

- [ACCOUNT_USAGE.PIPE_USAGE_HISTORY](https://docs.snowflake.com/en/sql-reference/account-usage/pipe_usage_history)
- [ACCOUNT_USAGE.COPY_HISTORY](https://docs.snowflake.com/en/sql-reference/account-usage/copy_history)

---

## 2-1. 問題文（英語）

> Which of the following views can be used to view the last 365 days of data loading history for data loaded through Snowpipe?
>
> Select two answers.
>
> A. INFORMATION_SCHEMA.QUERY_HISTORY
> B. ACCOUNT_USAGE.LOAD_HISTORY
> C. ACCOUNT_USAGE.COPY_HISTORY
> D. ACCOUNT_USAGE.PIPE_USAGE_HISTORY

## 2-2. 問題文の文法解析

### 文1: "Which of the following views can be used to view the last 365 days of data loading history for data loaded through Snowpipe?"

- **主語 (S)**: Which of the following views
- **動詞 (V)**: can be used（受動態 + 助動詞）
- **目的**: to view the last 365 days of data loading history（不定詞句）
- **修飾語**: for data loaded through Snowpipe（「Snowpipeを通じてロードされたデータの」）
- **文型**: S + can be used + to不定詞 + 前置詞句
- **注目ポイント**:
  - 「can be used to view ~」は「～を参照するために使用できる」。機能・用途を説明する定番受動態
  - 「the last 365 days」は「直近365日間」。ACCOUNT_USAGEの保持期間を示すキーフレーズ
  - 「loaded through Snowpipe」は過去分詞句で data を後置修飾。「Snowpipeを経由してロードされた」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| data loading history | noun phrase | データロード履歴 | View the data loading history in COPY_HISTORY. |
| loaded through | 過去分詞 + 前置詞 | ～を経由してロードされた | Data loaded through Snowpipe is tracked automatically. |
| the last N days | 名詞句 | 直近N日間 | This view retains the last 365 days of history. |

## 2-3. 問題文（日本語）

> 次のうち、Snowpipeを通じてロードされたデータの直近365日間のデータロード履歴を参照できるビューはどれですか？
>
> 2つ選びなさい。
>
> A. INFORMATION_SCHEMA.QUERY_HISTORY
> B. ACCOUNT_USAGE.LOAD_HISTORY
> C. ACCOUNT_USAGE.COPY_HISTORY
> D. ACCOUNT_USAGE.PIPE_USAGE_HISTORY

---

## 3-1. 解説文（英語）

> The COPY_HISTORY view and the PIPE_USAGE_HISTORY view in the ACCOUNT_USAGE schema provide the history of data loading performed through Snowpipe.

## 3-2. 解説文の文法解析

### 文1: "The COPY_HISTORY view and the PIPE_USAGE_HISTORY view in the ACCOUNT_USAGE schema provide the history of data loading performed through Snowpipe."

- **主語 (S)**: The COPY_HISTORY view and the PIPE_USAGE_HISTORY view in the ACCOUNT_USAGE schema（2つのビューが主語）
- **動詞 (V)**: provide
- **目的語 (O)**: the history of data loading performed through Snowpipe
  - 過去分詞句: performed through Snowpipe（data loading を後置修飾）
- **文型**: SVO
- **注目ポイント**:
  - 「in the ACCOUNT_USAGE schema」は修飾語。どのスキーマに属するかを明示
  - 「performed through Snowpipe」は「Snowpipeを通じて実行された」。過去分詞の後置修飾

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| provide | verb | 提供する、与える | These views provide the history of data loading. |
| performed through | 過去分詞句 | ～を通じて実行された | Loading performed through Snowpipe is logged here. |
| schema | noun | スキーマ（データベースオブジェクトの名前空間） | ACCOUNT_USAGE is a Snowflake-provided schema. |

## 3-3. 解説文（日本語）

> ACCOUNT_USAGEスキーマの `COPY_HISTORY` ビューと `PIPE_USAGE_HISTORY` ビューは、Snowpipeを通じて実行されたデータロードの履歴を提供します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
