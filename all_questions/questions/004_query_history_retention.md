# 004: Query History Retention

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-01
**正答**: D (14 days)

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Query History（クエリ履歴） | Snowflakeで実行されたクエリの実行記録。実行時刻、所要時間、ステータス、実行ユーザーなどを確認できる。Snowsight UIとACCOUNT_USAGE.QUERY_HISTORYビューの2種類でアクセス可能。 |
| Snowsight | Snowflakeの公式WebUIインターフェース。ブラウザからSnowflakeの操作・監視・クエリ実行が行える。旧UIの「Classic Console」に代わる現在の標準UI。 |
| Query History Page（クエリ履歴ページ） | Snowsight内のActivity > Query Historyから確認できるページ。過去14日間に実行・実行中のクエリを一覧表示する。 |
| ACCOUNT_USAGE.QUERY_HISTORY | Snowflakeのシステムビュー。クエリ履歴を最大365日間保持する。Snowsightの14日とは異なることに注意。 |

## 1-2. 重要コンセプトまとめ

- **Snowsightのクエリ履歴保持期間: 14日間**
- 試験で惑わされやすい数字の比較:
  | 機能 | 保持期間 |
  |------|---------|
  | Snowsight Query History（UI） | **14日** |
  | ACCOUNT_USAGE.QUERY_HISTORY（システムビュー） | 365日 |
  | Query Result Cache（クエリ結果キャッシュ） | 最大31日 |
  | Time Travel（デフォルト） | 1日（最大90日） |
- 「28 days」「3 months」は存在しない。「60 minutes」はセッションタイムアウト等と混同させる誤答
- **試験ポイント**: 「Snowsight」「query history page」→ **14 days** を想起する

## 1-3. 公式ドキュメントURL

- [Query History - Snowsight Activity](https://docs.snowflake.com/en/user-guide/ui-snowsight-activity#query-history)

---

## 2-1. 問題文（英語）

> For how long a query remains visible on the query history page in the Snowsight interface?
>
> A. 28 days
> B. 3 months
> C. 60 minutes
> D. 14 days

## 2-2. 問題文の文法解析

### 文1: "For how long a query remains visible on the query history page in the Snowsight interface?"

- **疑問詞句**: For how long（「どのくらいの期間」。for + how long で期間を尋ねる）
- **主語 (S)**: a query
- **動詞 (V)**: remains（状態動詞「～のままである」）
- **補語 (C)**: visible（形容詞「見える状態の」）
- **場所の修飾語 (M)**: on the query history page in the Snowsight interface
- **文型**: 疑問文 For how long + SVC + M
- **注目ポイント**:
  - 「For how long ~?」は「How long ~?」とほぼ同義だが、forを前置することで期間を問う意図がより明示的になる
  - 「remains visible」は「見える状態のままである」。remain + 形容詞（SVC）は状態の継続を示す
  - 「in the Snowsight interface」はどのUIを指すかを特定する重要な修飾語

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| for how long | 疑問詞句 | どのくらいの期間 | For how long does the cache remain valid? |
| remains visible | 動詞 + 形容詞 | 見える状態のままである | The query remains visible for 14 days. |
| interface | noun | インターフェース（操作画面・UI） | Snowsight is the web-based interface for Snowflake. |
| query history | noun phrase | クエリ履歴 | You can review past executions in the query history. |

## 2-3. 問題文（日本語）

> SnowsightインターフェースのQuery Historyページで、クエリはどのくらいの期間表示され続けますか？
>
> A. 28日
> B. 3ヶ月
> C. 60分
> D. 14日

---

## 3-1. 解説文（英語）

> The query history page lets users view the history of executed and currently executing queries. The query history page can show the history of queries executed in the last 14 days.

## 3-2. 解説文の文法解析

### 文1: "The query history page lets users view the history of executed and currently executing queries."

- **主語 (S)**: The query history page
- **動詞 (V)**: lets（使役動詞）
- **目的語 (O)**: users
- **原形不定詞**: view the history of executed and currently executing queries
- **文型**: S + let + O + 原形不定詞（使役構文）
- **注目ポイント**:
  - 「let + O + 動詞原形」は「Oが～するのを許可する、できるようにする」という使役表現。機能説明の定番パターン
  - 「executed and currently executing」: 過去分詞（完了した）+ 現在分詞（実行中）の対比。「実行済みおよび現在実行中の」

### 文2: "The query history page can show the history of queries executed in the last 14 days."

- **主語 (S)**: The query history page
- **動詞 (V)**: can show（助動詞 can + 動詞）
- **目的語 (O)**: the history of queries executed in the last 14 days
  - 過去分詞句: executed in the last 14 days（queries を後置修飾）
- **文型**: SVO
- **注目ポイント**:
  - 「in the last 14 days」は「過去14日間に」。「in the last + 期間」は範囲を示す頻出表現
  - 「queries executed in ~」は過去分詞による後置修飾。「～に実行されたクエリ」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| let + O + 原形 | 使役構文 | Oが～できるようにする | This feature lets users view historical data. |
| in the last N days | 前置詞句 | 過去N日間に | Queries executed in the last 14 days are visible. |
| currently executing | 分詞句 | 現在実行中の | Currently executing queries appear at the top. |

## 3-3. 解説文（日本語）

> クエリ履歴ページでは、実行済みおよび現在実行中のクエリの履歴を確認できます。クエリ履歴ページには、過去14日間に実行されたクエリの履歴が表示されます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
