# 068: CURRENT_TASK_GRAPHS Function

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-16
**正答**: D

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| CURRENT_TASK_GRAPHS | 現在実行中または今後8日以内に実行予定のタスクグラフの情報を返すテーブル関数 |
| Task Graph（タスクグラフ） | 依存関係で結ばれた複数タスクの集合。ルートタスクから始まり子タスクが連鎖的に実行される。単一タスクもグラフとみなされる |
| TASK_HISTORY | タスク実行の履歴を返すテーブル関数。過去の実行記録を参照する |
| COMPLETE_TASK_GRAPHS | タスクグラフの完了した実行履歴を返すテーブル関数 |
| SHOW TASKS | システム内のすべてのタスクの包括的な詳細を表示するコマンド |
| WAREHOUSE_METERING_HISTORY | ウェアハウスのリソース使用量統計を提供するビュー |

## 1-2. 重要コンセプトまとめ

- **CURRENT_TASK_GRAPHS**: 現在実行中 + 今後8日以内に実行予定のタスク情報
- **TASK_HISTORY / COMPLETE_TASK_GRAPHS**: 過去の実行履歴
- **SHOW TASKS**: すべてのタスクの定義・設定情報
- タスク関連の関数・コマンドの使い分けが試験で問われる
- CURRENT_TASK_GRAPHSは「未来を見る」関数、TASK_HISTORYは「過去を見る」関数
- リソース使用統計はWAREHOUSE_METERING_HISTORYで確認（タスク関数ではない）

## 1-3. 公式ドキュメントURL

- [CURRENT_TASK_GRAPHS](https://docs.snowflake.com/en/sql-reference/functions/current_task_graphs)

---

## 2-1. 問題文（英語）

> What is the purpose of the CURRENT_TASK_GRAPHS table function in Snowflake?
>
> A. The CURRENT_TASK_GRAPH table function provides comprehensive details about all of the tasks within the system.
> B. CURRENT_TASK_GRAPH table function provides a historical record of task executions.
> C. The CURRENT_TASK_GRAPH table function shows the resource usage statistics for all tasks in the system.
> D. CURRENT_TASK_GRAPH table function provides details about the tasks that are scheduled or currently executing.

## 2-2. 問題文の文法解析

### 文1: "What is the purpose of the CURRENT_TASK_GRAPHS table function in Snowflake?"

- **主語 (S)**: the purpose of the CURRENT_TASK_GRAPHS table function
- **動詞 (V)**: is
- **補語 (C)**: What
- **修飾語 (M)**: in Snowflake
- **文型**: SVC（疑問文）
- **注目ポイント**: 「What is the purpose of ~」で機能の目的を問う定番パターン。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| purpose | 名詞 | 目的 | What is the purpose of this function? |
| comprehensive | 形容詞 | 包括的な | Comprehensive details about all tasks. |
| historical record | 名詞句 | 履歴記録 | A historical record of task executions. |
| scheduled | 形容詞 | 予定されている | Tasks that are scheduled to execute. |

## 2-3. 問題文（日本語）

> SnowflakeのCURRENT_TASK_GRAPHSテーブル関数の目的は何ですか？
>
> A. CURRENT_TASK_GRAPHテーブル関数はシステム内のすべてのタスクの包括的な詳細を提供する。
> B. CURRENT_TASK_GRAPHテーブル関数はタスク実行の履歴記録を提供する。
> C. CURRENT_TASK_GRAPHテーブル関数はシステム内のすべてのタスクのリソース使用統計を表示する。
> D. CURRENT_TASK_GRAPHテーブル関数は予定されているまたは現在実行中のタスクの詳細を提供する。

---

## 3-1. 解説文（英語）

> The CURRENT_TASK_GRAPH table function provides information on graphs that are currently running or scheduled to be executed within the next 8 days. A graph may be a single task or a task graph consisting of multiple tasks.
>
> For comprehensive details about all tasks within the system, the appropriate command is SHOW TASKS.
>
> The function that provides historical records of task executions in Snowflake is TASK_HISTORY or COMPLETE_TASK_GRAPHS.
>
> Resource usage statistics would typically be obtained from other functions or views, such as the WAREHOUSE_METERING_HISTORY view.

## 3-2. 解説文の文法解析

### 文1: "The CURRENT_TASK_GRAPH table function provides information on graphs that are currently running or scheduled to be executed within the next 8 days."

- **主語 (S)**: The CURRENT_TASK_GRAPH table function
- **動詞 (V)**: provides
- **目的語 (O)**: information on graphs
- **修飾語 (M)**: that are currently running or scheduled to be executed within the next 8 days（関係詞節）
- **文型**: SVO
- **注目ポイント**: 「currently running or scheduled to be executed」で実行中 + 予定の2状態を「or」で並列。「within the next 8 days」で時間範囲を限定。

### 文2: "A graph may be a single task or a task graph consisting of multiple tasks."

- **主語 (S)**: A graph
- **動詞 (V)**: may be
- **補語 (C)**: a single task or a task graph
- **修飾語 (M)**: consisting of multiple tasks（現在分詞の後置修飾）
- **文型**: SVC
- **注目ポイント**: 「consisting of ~」で構成要素を示す現在分詞の後置修飾。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| scheduled to be executed | 受動態 | 実行が予定されている | Tasks scheduled to be executed within 8 days. |
| consisting of | 現在分詞句 | ～で構成される | A graph consisting of multiple tasks. |
| within the next N days | 前置詞句 | 今後N日以内に | Scheduled within the next 8 days. |
| appropriate | 形容詞 | 適切な | The appropriate command is SHOW TASKS. |
| typically | 副詞 | 通常は | Statistics would typically be obtained from views. |

## 3-3. 解説文（日本語）

> CURRENT_TASK_GRAPHテーブル関数は、現在実行中または今後8日以内に実行予定のグラフに関する情報を提供します。グラフは単一のタスク、または複数のタスクで構成されるタスクグラフのいずれかです。
>
> システム内のすべてのタスクの包括的な詳細については、適切なコマンドはSHOW TASKSです。
>
> Snowflakeでタスク実行の履歴記録を提供する関数は、TASK_HISTORYまたはCOMPLETE_TASK_GRAPHSです。
>
> リソース使用統計は通常、WAREHOUSE_METERING_HISTORYビューなど他の関数やビューから取得します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
