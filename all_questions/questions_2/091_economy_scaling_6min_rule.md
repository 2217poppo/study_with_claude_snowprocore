# 091: Economy Scaling 6-Minute Rule

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-14
**正答**: A

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Economy Scaling Policy | コスト優先のスケーリングポリシー。キュー発生後も即座にはクラスター追加せず、**6分間ビジー状態を維持できる十分な負荷**がある場合のみ追加 |
| Standard Scaling Policy | パフォーマンス優先。キュー検出後ほぼ即座にクラスター追加 |
| Scale Down Check | Economyポリシーのスケールダウン時に行う検証。**5〜6回の連続チェック**（1分間隔）でワークロードが再配置可能か確認 |

## 1-2. 重要コンセプトまとめ

- Economy policyのスケールアップ条件: **新WHが最低6分間ビジー状態を維持できるだけの十分なクエリ負荷があること**
- Economy policyのスケールダウン手順:
  - **5〜6回の連続チェック**（1分間隔）
  - ワークロードが他のWHに再配置可能かを検証
  - 基準を満たした場合のみスケールダウン
- Standard vs Economy の動作比較:

| 動作 | Standard | Economy |
|------|----------|---------|
| スケールアップ | ほぼ即座 | 6分ルール |
| スケールダウン | 即座 | 5-6回チェック（1分間隔） |
| 優先 | パフォーマンス | コスト |

## 1-3. 公式ドキュメントURL

- [Setting the Scaling Policy](https://docs.snowflake.com/en/user-guide/warehouses-multicluster#setting-the-scaling-policy-for-a-multi-cluster-warehouse)

---

## 2-1. 問題文（英語）

> Consider the following scenario. Queries are running on a multi-cluster virtual warehouse of size Large, and the scaling policy is set to Economy. The warehouse is currently executing the maximum number of queries that it can accommodate. What happens when an additional query is run?
>
> A. The multi-cluster virtual warehouse only adds a new virtual warehouse if the system determines there is enough work to keep it busy for at least 6 minutes.
> B. An additional virtual warehouse of size Large is added almost immediately to the cluster and runs the additional query.
> C. The size of the virtual warehouse is scaled up to X-Large.
> D. The size of the virtual warehouse is scaled up to X-Large.

## 2-2. 問題文の文法解析

### 文1: "The warehouse is currently executing the maximum number of queries that it can accommodate."

- **注目ポイント**: `accommodate` は「収容する、対応する」。WHが対応可能な最大クエリ数に達している状況を設定。

### 文2 (選択肢A): "The multi-cluster virtual warehouse only adds a new virtual warehouse if the system determines there is enough work to keep it busy for at least 6 minutes."

- **注目ポイント**: `keep it busy for at least 6 minutes` が Economy policyの核心基準。`determines` で「判断する」。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| accommodate | verb | 収容する、対応する | The maximum queries it can accommodate. |
| keep it busy for ~ | phrase | ～の間ビジー状態に保つ | Enough work to keep it busy for 6 minutes. |
| at the expense of ~ | phrase | ～を犠牲にして | Conserving costs at the expense of performance. |
| successive checks | noun | 連続チェック | 5 to 6 successive checks. |

## 2-3. 問題文（日本語）

> 以下のシナリオを考えてください。サイズLargeのマルチクラスターWHでクエリが実行中で、スケーリングポリシーはEconomyに設定されています。WHは対応可能な最大クエリ数を実行中です。追加のクエリが実行されるとどうなりますか？
>
> A. 新WHが最低6分間ビジー状態を維持できる十分な作業があるとシステムが判断した場合のみ、新WHが追加される。
> B. サイズLargeの追加WHがほぼ即座にクラスターに追加され、追加クエリを実行する。
> C. WHのサイズがX-Largeにスケールアップされる。

---

## 3-1. 解説文（英語）

> When the scaling policy is set to Economy, it permits queuing to continue for some time before scaling up, conserving costs at the expense of performance. New virtual warehouses are spun up only if the system determines that the new warehouse has sufficient query burden to keep it busy for at least 6 minutes. When scaling down, the system conducts 5 to 6 successive checks to determine whether the workload can be reallocated to other warehouses without the need to spin up another warehouse again. If the criteria are met, the virtual warehouse is scaled-down. These checks are carried out at one-minute intervals.

## 3-2. 解説文の文法解析

### 文1: "When the scaling policy is set to Economy, it permits queuing to continue for some time before scaling up, conserving costs at the expense of performance."

- **注目ポイント**: `permits ~ to continue` で「～が継続することを許容する」。`at the expense of ~` は「～を犠牲にして」。

### 文2: "New virtual warehouses are spun up only if the system determines that the new warehouse has sufficient query burden to keep it busy for at least 6 minutes."

- **注目ポイント**: `only if ~` で「～の場合のみ」。6分ルールの正確な定義。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| at the expense of ~ | phrase | ～を犠牲にして | Conserving costs at the expense of performance. |
| sufficient query burden | noun | 十分なクエリ負荷 | Sufficient burden to keep it busy. |
| reallocated | verb | 再配置された | Workload can be reallocated. |
| carried out at ~ intervals | phrase | ～間隔で実施される | Checks carried out at one-minute intervals. |

## 3-3. 解説文（日本語）

> スケーリングポリシーがEconomyに設定されている場合、パフォーマンスを犠牲にしてコストを節約するため、スケールアップ前にしばらくキューイングの継続を許容します。新しいWHは、システムが新WHに最低6分間ビジー状態を維持できる十分なクエリ負荷があると判断した場合にのみ起動されます。スケールダウン時には、システムが5〜6回の連続チェックを行い、別のWHを再起動することなくワークロードを他のWHに再配置できるかを判断します。基準が満たされた場合、WHがスケールダウンされます。これらのチェックは1分間隔で実施されます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
