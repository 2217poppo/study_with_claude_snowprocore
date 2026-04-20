# 072: Serverless Task Max Size

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-13
**正答**: 2X-Large

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Serverless Task（サーバーレスタスク） | Snowflakeが自動的にコンピュートリソースを管理するタスク実行モデル。ユーザーがウェアハウスを手動管理する必要がない |
| Task（タスク） | スケジュールされたSQL文やストアドプロシージャを自動実行するSnowflakeオブジェクト。サーバーレスまたはユーザー管理WHで実行 |
| Serverless Compute Model | Snowflakeがワークロードに応じてリソースサイズを動的に調整するモデル。過去の実行統計を分析して最適化 |
| XXLARGE / 2X-Large | サーバーレスタスクに割り当て可能な最大コンピュートサイズ。ユーザー管理WHの2X-Largeに相当 |

## 1-2. 重要コンセプトまとめ

- サーバーレスタスクの最大コンピュートサイズは **2X-Large (XXLARGE)** 相当
- サーバーレスタスクの特徴:
  - ユーザーがWHを手動管理する必要なし
  - Snowflakeが**動的にサイズを調整**
  - 過去の類似タスク実行の**統計を分析**してサイズを決定
- 4X-LargeやLargeではない — **2X-Largeが上限**
- サーバーレス vs ユーザー管理WH:
  - サーバーレス: 管理不要、最大2X-Large
  - ユーザー管理WH: 手動管理、最大6X-Large

## 1-3. 公式ドキュメントURL

- [Serverless Tasks](https://docs.snowflake.com/en/user-guide/tasks-intro#serverless-tasks)

---

## 2-1. 問題文（英語）

> What is the MAXIMUM compute size that Snowflake may allocate to a serverless task?
>
> A. Large
> B. 4X-Large
> C. 2X-Large
> D. Small
> E. Medium

## 2-2. 問題文の文法解析

### 文1: "What is the MAXIMUM compute size that Snowflake may allocate to a serverless task?"

- **主語 (S)**: What
- **動詞 (V)**: is
- **補語 (C)**: the MAXIMUM compute size
- **修飾語 (M)**: that Snowflake may allocate to a serverless task（関係詞節）
- **文型**: SVC（疑問文）
- **注目ポイント**: `may allocate` の `may` は「可能性がある」。`MAXIMUM` が大文字で強調。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| allocate | verb | 割り当てる | Allocate compute to a serverless task. |
| serverless | adjective | サーバーレスの | Serverless compute model. |
| equivalent to ~ | phrase | ～に相当する | Equivalent to a 2X-Large warehouse. |
| dynamically | adverb | 動的に | Sizing is determined dynamically. |

## 2-3. 問題文（日本語）

> Snowflakeがサーバーレスタスクに割り当てることができる最大のコンピュートサイズは何ですか？
>
> A. Large
> B. 4X-Large
> C. 2X-Large
> D. Small
> E. Medium

---

## 3-1. 解説文（英語）

> In Snowflake, the serverless compute model for tasks provides managed compute resources, eliminating users' need to manage virtual warehouses manually. Snowflake adjusts the size of serverless compute resources automatically depending on workload demands. This sizing is determined dynamically by analyzing recent statistics of similar task executions to optimize performance. The largest compute size available for serverless tasks is equivalent to the capacity of an XXLARGE or 2X-Large user-managed virtual warehouse.

## 3-2. 解説文の文法解析

### 文1: "In Snowflake, the serverless compute model for tasks provides managed compute resources, eliminating users' need to manage virtual warehouses manually."

- **主語 (S)**: the serverless compute model for tasks
- **動詞 (V)**: provides
- **目的語 (O)**: managed compute resources
- **修飾語 (M)**: eliminating users' need to ~（結果の分詞構文）
- **文型**: SVO
- **注目ポイント**: `eliminating ~` は結果を示す分詞構文。「管理リソースを提供し、その結果ユーザーの手動管理の必要性を排除する」。

### 文2: "This sizing is determined dynamically by analyzing recent statistics of similar task executions to optimize performance."

- **主語 (S)**: This sizing
- **動詞 (V)**: is determined（受動態）
- **修飾語 (M)**: dynamically（副詞）、by analyzing ~（手段）、to optimize performance（目的）
- **文型**: SV（受動態）

### 文3: "The largest compute size available for serverless tasks is equivalent to the capacity of an XXLARGE or 2X-Large user-managed virtual warehouse."

- **主語 (S)**: The largest compute size available for serverless tasks
- **動詞 (V)**: is
- **補語 (C)**: equivalent to the capacity of an XXLARGE or 2X-Large user-managed virtual warehouse
- **文型**: SVC
- **注目ポイント**: `equivalent to ~` は「～に相当する」。最大サイズを明確に定義。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| eliminating | verb | 排除する | Eliminating users' need to manage. |
| equivalent to ~ | phrase | ～に相当する | Equivalent to a 2X-Large warehouse. |
| dynamically | adverb | 動的に | Determined dynamically. |

## 3-3. 解説文（日本語）

> Snowflakeでは、タスクのサーバーレスコンピュートモデルは管理されたコンピュートリソースを提供し、ユーザーが仮想ウェアハウスを手動で管理する必要性を排除します。Snowflakeはワークロードの要求に応じてサーバーレスコンピュートリソースのサイズを自動的に調整します。このサイジングは、パフォーマンスを最適化するために類似タスク実行の最近の統計を分析することで動的に決定されます。サーバーレスタスクで利用可能な最大コンピュートサイズは、XXLARGEまたは2X-Largeのユーザー管理仮想ウェアハウスの容量に相当します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
