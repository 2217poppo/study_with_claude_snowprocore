# 098: Multi-Cluster Warehouse — Standard Scaling Policy

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-17
**正答**: C（Largeサイズのウェアハウスがほぼ即時に追加される）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Multi-Cluster Virtual Warehouse | 複数のウェアハウスクラスタを束ねた仮想ウェアハウス。負荷に応じてクラスタ数を自動増減できる |
| Scaling Policy | Multi-Clusterウェアハウスのスケールアウト/インの挙動を制御するポリシー。Standard と Economy の2種類がある |
| Standard Policy | デフォルトのスケーリングポリシー。キューイングが検出されると即時にクラスタを追加する。遅延を最小化する |
| Economy Policy | キューイングが6分以上続くと判断された場合のみクラスタを追加する。コスト重視 |
| Queuing | ウェアハウスの処理能力を超えたクエリが待機列に入る状態 |
| Scale-up | ウェアハウス自体のサイズを大きくすること（X-Small → Large など）|
| Scale-out | ウェアハウスのクラスタ数を増やすこと（Multi-Clusterの場合）|

## 1-2. 重要コンセプトまとめ

- **Standard Policyはキューイングをできるだけすぐになくそうとする**
  - キューが検出されると最初のクラスタをすぐに（immediately）起動し、その後も20秒間隔で追加クラスタを起動
- **スケールダウンは慎重に行われる**
  - 負荷が下がったら1分間隔で2〜3回チェックし、再配分できると判断した場合のみスケールダウン
- **Economy Policyは「6分以上忙しい場合のみ追加」というルール**
  - 選択肢Bはこの Economy Policy の説明であり、Standard Policyとの混同に注意
- **Scale-upはMulti-Clusterでは行われない**
  - Multi-Clusterはクラスタ数を増やす（scale-out）が、サイズを上げる（scale-up）ことはしない

## 1-3. 公式ドキュメントURL

- [Setting the Scaling Policy for a Multi-Cluster Warehouse](https://docs.snowflake.com/en/user-guide/warehouses-multicluster#setting-the-scaling-policy-for-a-multi-cluster-warehouse)
- [Multi-Cluster Warehouse Overview](https://docs.snowflake.com/en/user-guide/warehouses-multicluster)

---

## 2-1. 問題文（英語）

> Consider the following scenario. Queries are running on a multi-cluster virtual warehouse of size Large, and the scaling policy is set to Standard. The warehouse is currently executing the maximum number of queries that it can accommodate. What happens when an additional query is run?
>
> A. The size of the virtual warehouse is scaled up to 4X-Large.
> B. The multi-cluster virtual warehouse only adds a new virtual warehouse if the system determines there is enough work to keep it busy for at least 6 minutes.
> C. An additional virtual warehouse of size Large is added almost immediately to the cluster and runs the additional query.

## 2-2. 問題文の文法解析

### 文1: "Queries are running on a multi-cluster virtual warehouse of size Large, and the scaling policy is set to Standard."

- **節1主語 (S)**: Queries
- **節1動詞 (V)**: are running（現在進行形）
- **節1修飾語 (M)**: on a multi-cluster virtual warehouse of size Large
- **節2主語 (S)**: the scaling policy
- **節2動詞 (V)**: is set to Standard（受動態）
- **注目ポイント**: `be set to ~` = 〜に設定されている（設定値を示す受動態）

### 文2: "The warehouse is currently executing the maximum number of queries that it can accommodate."

- **主語 (S)**: The warehouse
- **動詞 (V)**: is executing（現在進行形）
- **目的語 (O)**: the maximum number of queries that it can accommodate
- **修飾語 (M)**: currently
- **関係詞節**: that it can accommodate（queries を修飾）
- **注目ポイント**: `accommodate` = 収容する、処理できる

### 文3: "What happens when an additional query is run?"

- **主語**: What
- **動詞 (V)**: happens
- **時間節**: when an additional query is run（受動態）
- **注目ポイント**: `additional` = 追加の（extra の意味）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| accommodate | 動詞 | 収容する、処理する | The warehouse can accommodate 8 concurrent queries. |
| scaling policy | 名詞句 | スケーリングポリシー | Set the scaling policy to Economy to reduce costs. |
| determine | 動詞 | 判断する、決定する | The system determines whether to add a new cluster. |
| additional | 形容詞 | 追加の | An additional warehouse is spun up immediately. |
| almost immediately | 副詞句 | ほぼ即時に | The new cluster starts almost immediately. |

## 2-3. 問題文（日本語）

> 次のシナリオを考えてください。Largeサイズのマルチクラスター仮想ウェアハウスでクエリが実行されており、スケーリングポリシーはStandardに設定されています。現在、ウェアハウスは処理できる最大数のクエリを実行しています。追加のクエリを実行すると何が起きますか？
>
> A. 仮想ウェアハウスのサイズが4X-Largeにスケールアップされます。
> B. システムが少なくとも6分間忙しい状態が続くと判断した場合にのみ、新しい仮想ウェアハウスを追加します。
> C. Largeサイズの追加の仮想ウェアハウスがほぼ即時にクラスターに追加され、追加クエリを処理します。

---

## 3-1. 解説文（英語）

> When the scaling policy is set to Standard (also the default), Snowflake attempts to reduce queuing by launching additional warehouses soon after queuing is detected. As soon as queries start queuing or there are more queries than the present set of virtual warehouses can handle, the first additional warehouse is spun up immediately. Additional warehouses may be spun up if the volume of requests is causing queuing to continue. Additional warehouses are started 20 seconds after the preceding warehouse has started. Once the workload starts diminishing, the system does 2-3 consecutive checks to assess whether the workload can be reallocated to other warehouses without the need to spin up another warehouse again. If the criteria are met, the virtual warehouse is scaled-down. The scale-down checks are carried out at one-minute intervals. https://docs.snowflake.com/en/user-guide/warehouses-multicluster#setting-the-scaling-policy-for-a-multi-cluster-warehouse

## 3-2. 解説文の文法解析

### 文1: "When the scaling policy is set to Standard (also the default), Snowflake attempts to reduce queuing by launching additional warehouses soon after queuing is detected."

- **時間節**: When the scaling policy is set to Standard
- **主語 (S)**: Snowflake
- **動詞 (V)**: attempts to reduce
- **目的語 (O)**: queuing
- **手段の修飾語**: by launching additional warehouses（動名詞句）
- **時間の修飾語**: soon after queuing is detected
- **注目ポイント**: `by + 動名詞` = 〜することによって（手段を示す）

### 文2: "As soon as queries start queuing or there are more queries than the present set of virtual warehouses can handle, the first additional warehouse is spun up immediately."

- **時間節**: As soon as ... can handle（〜するとすぐに）
- **主語 (S)**: the first additional warehouse
- **動詞 (V)**: is spun up immediately（受動態）
- **注目ポイント**: 
  - `As soon as` = 〜するとすぐに（即時性を強調）
  - `spin up` = 起動する（ウェアハウスを立ち上げる）
  - `more queries than ... can handle` = 処理できる以上のクエリ

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| spin up | 動詞句 | 起動する | A new warehouse is spun up to handle the load. |
| diminish | 動詞 | 減少する、縮小する | Once the workload starts diminishing, scaling down begins. |
| consecutive | 形容詞 | 連続した | The system runs 2-3 consecutive checks. |
| assess | 動詞 | 評価する、判断する | The system assesses whether to scale down. |
| carry out | 動詞句 | 実施する、行う | Checks are carried out at one-minute intervals. |
| interval | 名詞 | 間隔 | Scale-down checks occur at one-minute intervals. |

## 3-3. 解説文（日本語）

> スケーリングポリシーがStandard（デフォルト）に設定されている場合、Snowflakeはキューイングが検出されると追加ウェアハウスを即座に起動してキューイングを解消しようとします。クエリがキューイングし始めるか、現在の仮想ウェアハウスが処理できる以上のクエリがある場合、最初の追加ウェアハウスがすぐに起動されます。リクエストの量によってキューイングが続く場合は、さらに追加ウェアハウスが起動されることがあります。追加ウェアハウスは前のウェアハウスが起動してから20秒後に起動されます。ワークロードが減少し始めると、システムは2〜3回連続してチェックを行い、別のウェアハウスを再起動しなくてもワークロードを再配分できるかどうかを評価します。基準を満たしていれば、仮想ウェアハウスはスケールダウンされます。スケールダウンのチェックは1分間隔で実施されます。

---

## 復習メモ

- [ ] Standard Policy（即時追加）と Economy Policy（6分ルール）の違いを理解した
- [ ] スケールダウンの2〜3回チェック・1分間隔を把握した
- [ ] spin up / consecutive / assess の語彙を確認した
