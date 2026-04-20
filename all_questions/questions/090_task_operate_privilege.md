# 090: Task — OPERATE Privilege

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-06
**正答**: B（A Snowflake role with OPERATE privilege can resume or suspend the tasks.）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| OPERATE 権限（タスク） | タスクを**サスペンド（停止）またはレジューム（再開）する**権限。タスクの実行状態を制御できる。閲覧・定義変更・優先度設定はできない |
| MONITOR 権限（タスク） | タスクの**ステータスと実行履歴を閲覧・管理する**権限。OPERATE とは異なり実行状態の変更は不可 |
| MODIFY 権限 / CREATE TASK 権限 | タスクの**定義を変更・更新する**権限。OPERATE ではなくこちらが必要。タスクの実行ロジックやスケジュールの変更に使用 |
| Task（タスク） | SQL文またはストアドプロシージャを定期的・自動的に実行するSnowflakeオブジェクト。`RESUME`（有効化）と`SUSPEND`（停止）で実行状態を制御する |
| Task Priority（タスク優先度） | Snowflakeには**タスクの優先度を設定・変更する機能は存在しない**。複数タスクの実行順制御はDAG（有向非巡回グラフ）の親子関係で行う |

## 1-2. 重要コンセプトまとめ

- **OPERATE = Resume/Suspend のみ**: タスクの実行状態（有効/停止）を切り替えるだけ
- **タスク権限の比較表**:

  | 権限 | できること |
  |------|-----------|
  | OPERATE | タスクのサスペンド・レジューム（実行状態の制御） |
  | MONITOR | タスクステータス・実行履歴の閲覧 |
  | MODIFY | タスク定義の変更・更新 |
  | OWNERSHIP | すべての操作 |

- **誤りの選択肢の根拠**:
  1. 「ステータス・実行履歴の閲覧」→ **MONITOR** 権限が必要（OPERATE では不可）
  2. 「定義の変更・更新」→ **MODIFY または CREATE TASK** 権限が必要
  3. 「実行の優先度設定」→ **Snowflakeには存在しない機能**
- **試験での頻出パターン**: 「OPERATE vs MONITOR」の区別が問われる。OPERATE = 状態制御（Resume/Suspend）、MONITOR = 閲覧のみ

## 1-3. 公式ドキュメントURL

- [Resuming or Suspending Tasks](https://docs.snowflake.com/en/user-guide/tasks-intro#resuming-or-suspending-tasks)
- [Access Control Privileges — OPERATE](https://docs.snowflake.com/en/user-guide/security-access-control-privileges)

---

## 2-1. 問題文（英語）

> What permissions does the "OPERATE" task privilege provide to a role in Snowflake?
>
> A. A Snowflake role with OPERATE privilege can view task status and execution history.
> B. A Snowflake role with OPERATE privilege can resume or suspend the tasks.
> C. A Snowflake role with OPERATE privilege can modify and update task definitions.
> D. A Snowflake role with OPERATE privilege can prioritize or deprioritize task execution based on workload demands.

**各選択肢の解説（試験形式）:**

> **A（誤り）**: Viewing and managing task status and execution history requires the MONITOR privilege.
>
> **B（正解）**: With the "OPERATE" privilege for tasks, a role can suspend or resume them. This privilege allows the user to control the execution state of tasks, enabling them to suspend task execution or restart it as needed.
>
> **C（誤り）**: These actions require the MODIFY privilege or the CREATE TASK privilege, which allow altering task definitions.
>
> **D（誤り）**: Snowflake does not provide any option to increase or decrease the priority of a task execution.

## 2-2. 問題文の文法解析

### 文1: "What permissions does the 'OPERATE' task privilege provide to a role in Snowflake?"

- **主語 (S)**: the "OPERATE" task privilege
- **動詞 (V)**: does provide（疑問文の倒置）
- **目的語 (O)**: What permissions（疑問詞節）
- **修飾語 (M)**: to a role in Snowflake
- **文型**: SVO（疑問文）
- **注目ポイント**:
  - **"What permissions does ~ provide?"**: 「〜はどのような権限を提供するか」。`provide A to B`（BにAを提供する）の疑問文形式。A（permissions）を `what` で問う
  - **"task privilege"**: 「タスク権限」。オブジェクトタイプ（task）+ 権限（privilege）の複合名詞。どのオブジェクトに対する権限かを明示

### 選択肢B: "A Snowflake role with OPERATE privilege can resume or suspend the tasks."

- **主語 (S)**: A Snowflake role with OPERATE privilege
- **動詞 (V)**: can resume or suspend
- **目的語 (O)**: the tasks
- **注目ポイント**:
  - **"with OPERATE privilege"**: 前置詞句が主語 `A Snowflake role` を修飾。「OPERATE権限を持つロール」
  - **"resume or suspend"**: 2つの動詞を `or` で並列。「再開または停止する」

### 選択肢D: "A Snowflake role with OPERATE privilege can prioritize or deprioritize task execution based on workload demands."

- **注目ポイント**:
  - **"prioritize or deprioritize"**: `prioritize`（優先順位を上げる）の反意語 `deprioritize`（優先順位を下げる）を並列。`de-` 接頭辞が逆の動作を示す
  - **"based on workload demands"**: 「ワークロードの需要に基づいて」。意思決定の根拠を示す分詞句

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| privilege | 名詞 | 権限、特権 | The OPERATE privilege allows resume and suspend operations. |
| resume | 動詞 | 再開する | Use OPERATE to resume a suspended task. |
| suspend | 動詞 | 停止する、一時停止する | The task was suspended due to an error. |
| prioritize | 動詞 | 優先順位をつける | Snowflake does not allow users to prioritize task execution. |
| deprioritize | 動詞 | 優先順位を下げる | There is no way to deprioritize a task in Snowflake. |

## 2-3. 問題文（日本語）

> Snowflakeにおいて、「OPERATE」タスク権限がロールに提供する権限はどれですか？
>
> A. OPERATE権限を持つSnowflakeロールは、タスクのステータスと実行履歴を閲覧できる。
> B. OPERATE権限を持つSnowflakeロールは、タスクをレジュームまたはサスペンドできる。
> C. OPERATE権限を持つSnowflakeロールは、タスクの定義を変更・更新できる。
> D. OPERATE権限を持つSnowflakeロールは、ワークロードの需要に基づいてタスクの実行優先度を上げ下げできる。

---

## 3-1. 解説文（英語）

> With the "OPERATE" privilege for tasks, a role can suspend or resume them. This privilege allows the user to control the execution state of tasks, enabling them to suspend task execution or restart it as needed.

## 3-2. 解説文の文法解析

### 文1: "With the 'OPERATE' privilege for tasks, a role can suspend or resume them."

- **主語 (S)**: a role
- **動詞 (V)**: can suspend or resume
- **目的語 (O)**: them（= tasks）
- **修飾語 (M)**: With the "OPERATE" privilege for tasks（前置詞句、文頭に置いて条件・手段を示す）
- **文型**: SVO
- **注目ポイント**:
  - **"With the ~ privilege"**: 「〜権限を持てば・〜権限があれば」。前置詞 `with` が「条件・付帯状況」を示す前置詞句として文頭に置かれる

### 文2: "This privilege allows the user to control the execution state of tasks, enabling them to suspend task execution or restart it as needed."

- **主語 (S)**: This privilege
- **動詞 (V)**: allows
- **目的語 (O)**: the user
- **目的格補語**: to control the execution state of tasks（to不定詞）
- **分詞構文**: enabling them to suspend task execution or restart it as needed（結果・付帯状況）
- **文型**: SVOC
- **注目ポイント**:
  - **"allows the user to control"**: `allow O to do` の SVOC構文。「ユーザーがタスクの実行状態を制御することを可能にする」
  - **"execution state"**: 「実行状態」。タスクが RESUMED（有効）か SUSPENDED（停止）かを示す状態
  - **"enabling them to suspend task execution or restart it"**: `enabling` は現在分詞で付帯状況の結果を示す。「（その結果）それらをサスペンドまたは再起動することを可能にする」。`them` = users、`it` = task execution
  - **"as needed"**: 「必要に応じて」。操作の任意性・オンデマンド性を示す

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| execution state | 名詞句 | 実行状態 | OPERATE allows control of the execution state of tasks. |
| restart | 動詞 | 再起動する、再開する | Users can restart task execution as needed. |
| enabling | 現在分詞 | 〜を可能にする（結果の付帯状況） | The privilege allows control, enabling suspension or restart. |

## 3-3. 解説文（日本語）

> タスクに対する「OPERATE」権限があれば、ロールはタスクをサスペンドまたはレジュームできます。この権限により、ユーザーはタスクの実行状態を制御することができ、必要に応じてタスクの実行を停止したり再起動したりすることが可能になります。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
