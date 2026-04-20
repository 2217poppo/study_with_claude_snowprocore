# 021: Automatic Clustering Service

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-10
**正答**: B（Redistributing data in micro-partitions according to the clustering key.）
**ユーザー回答**: A（Starting and stopping virtual warehouse clusters.）— 不正解

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Automatic Clustering（自動クラスタリング） | クラスタリングキーが定義されたテーブルに対して、Snowflakeが自動的にデータの再クラスタリングを管理するサービス。ユーザーの介入なしにバックグラウンドで動作し、クラスタリング状態が崩れたマイクロパーティションのみを対象に再編成する |
| Clustering Key（クラスタリングキー） | テーブル内のデータの物理的な並び順を決定するために指定するカラム（群）。`CLUSTER BY (col1, col2)` で定義する。クエリのWHERE句で頻繁に使用されるカラムを指定することでパーティションプルーニングの効率が向上する |
| Re-clustering（再クラスタリング） | DML操作（INSERT/UPDATE/DELETE）によってクラスタリング状態が崩れたテーブルデータを、クラスタリングキーに従って再配置するプロセス。Automatic Clusteringが自動的に実行する |
| Micro-Partition（マイクロパーティション） | Snowflakeがデータを内部的に分割・格納する単位（50〜500MB非圧縮）。Automatic Clusteringは、再クラスタリングの恩恵を受けるマイクロパーティションのみを対象に再編成する |
| Virtual Warehouse Cluster（仮想ウェアハウスクラスター） | Multi-Cluster Warehouseを構成する個々のコンピュートクラスター。Automatic Clusteringとは無関係。ウェアハウスの起動/停止はAuto Suspend/Auto Resumeの機能 |

## 1-2. 重要コンセプトまとめ

- **Automatic Clusteringの役割**: クラスタリングキーが定義されたテーブルに対して、**マイクロパーティション内のデータをクラスタリングキーに従って再配置**する
- **完全に自動管理**: Snowflakeが内部的にクラスタリング状態を監視し、必要に応じて再クラスタリングを実行する。ユーザーが手動で実行する必要はない
- **対象は限定的**: すべてのマイクロパーティションを再編成するのではなく、**再クラスタリングの恩恵を受けるパーティションのみ**を対象とする（コスト効率の最適化）
- **リソースはSnowflakeが管理**: Automatic Clusteringに必要なコンピュートリソースはSnowflake内部で管理される（ユーザーのウェアハウスは消費しない）
- **誤答の整理**:
  - ❌ ウェアハウスクラスターの起動/停止 → Auto Suspend / Auto Resume の機能
  - ❌ Multi-Cluster WHの管理 → Multi-Cluster Warehouse のスケーリングポリシーの機能
  - ❌ 共有データの同期管理 → Data Sharing / Replication の機能
- **既出の関連問題**: Q035（Clustering Keys）、Q2-011（Clustering Depth）、Q064（Query Profile Clustering）

## 1-3. 公式ドキュメントURL

- [Automatic Clustering](https://docs.snowflake.com/en/user-guide/tables-auto-reclustering)
- [Clustering Keys & Clustered Tables](https://docs.snowflake.com/en/user-guide/tables-clustering-keys)

---

## 2-1. 問題文（英語）

> Automatic Clustering Service is responsible for what activity in Snowflake?
>
> A. Starting and stopping virtual warehouse clusters.
> B. Redistributing data in micro-partitions according to the clustering key.
> C. Managing multi-cluster virtual warehouses.
> D. Managing synchronization of shared data.

## 2-2. 問題文の文法解析

### 文1: "Automatic Clustering Service is responsible for what activity in Snowflake?"

- **主語 (S)**: Automatic Clustering Service（自動クラスタリングサービスは）
- **動詞 (V)**: is（be動詞）
- **補語 (C)**: responsible for what activity（どのような活動を担当しているか）
- **修飾語 (M)**: in Snowflake（Snowflakeにおいて）
- **文型**: SVC（疑問文）
- **注目ポイント**:
  - `be responsible for ~` は「～を担当する」の定番表現（試験頻出）
  - `what activity` が疑問詞＋名詞で「どのような活動」を問う
  - 選択肢はすべて動名詞句（-ing）で始まり、具体的な活動を列挙

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| redistribute | verb | 再配置する、再分配する | Automatic Clustering redistributes data across micro-partitions. |
| according to ~ | prep phrase | ～に従って、～に基づいて | Data is organized according to the clustering key. |
| synchronization | noun | 同期化、同期処理 | Replication handles synchronization of shared data. |

## 2-3. 問題文（日本語）

> Automatic Clusteringサービスは、Snowflakeにおいてどのような活動を担当していますか？
>
> A. 仮想ウェアハウスクラスターの起動と停止
> B. クラスタリングキーに従ってマイクロパーティション内のデータを再配置すること
> C. マルチクラスター仮想ウェアハウスの管理
> D. 共有データの同期管理

---

## 3-1. 解説文（英語）

> For tables with a clustering key defined, Automatic Clustering, a Snowflake service, manages the re-clustering as needed, distributing data according to the clustering key. Snowflake internally maintains the clustered tables and any resource requirements with Automatic Clustering. Automatic Clustering only adjusts those micro-partitions which benefit from the re-clustering process.

## 3-2. 解説文の文法解析

### 文1: "For tables with a clustering key defined, Automatic Clustering, a Snowflake service, manages the re-clustering as needed, distributing data according to the clustering key."

- **前置詞句 (M)**: For tables with a clustering key defined（クラスタリングキーが定義されたテーブルに対して）
- **主語 (S)**: Automatic Clustering（自動クラスタリング）
- **同格 (M)**: a Snowflake service（Snowflakeのサービスである）— カンマで挟まれた同格表現
- **動詞 (V)**: manages（管理する）
- **目的語 (O)**: the re-clustering（再クラスタリングを）
- **修飾語 (M1)**: as needed（必要に応じて）
- **分詞構文 (M2)**: distributing data according to the clustering key（クラスタリングキーに従ってデータを配置しながら）
- **文型**: SVO + 分詞構文
- **注目ポイント**:
  - `with a clustering key defined` — with + O + 過去分詞の付帯状況構文
  - `as needed` — 「必要に応じて」の定型表現（as it is neededの省略形）
  - `distributing ~` — 結果・付帯状況を示す分詞構文

### 文2: "Snowflake internally maintains the clustered tables and any resource requirements with Automatic Clustering."

- **主語 (S)**: Snowflake
- **副詞 (M)**: internally（内部的に）
- **動詞 (V)**: maintains（維持する）
- **目的語 (O)**: the clustered tables and any resource requirements（クラスタリングされたテーブルとすべてのリソース要件を）
- **手段 (M)**: with Automatic Clustering（Automatic Clusteringを使って）
- **文型**: SVO
- **注目ポイント**: `internally` がSnowflake側の自動管理を強調している

### 文3: "Automatic Clustering only adjusts those micro-partitions which benefit from the re-clustering process."

- **主語 (S)**: Automatic Clustering
- **副詞 (M)**: only（～のみ）
- **動詞 (V)**: adjusts（調整する）
- **目的語 (O)**: those micro-partitions which benefit from the re-clustering process（再クラスタリングプロセスの恩恵を受けるマイクロパーティションのみ）
- **文型**: SVO
- **注目ポイント**:
  - `only` が限定的な対象範囲を強調 — 全パーティションではなく恩恵を受けるものだけ
  - `which benefit from ~` — 関係代名詞節で対象を限定

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| as needed | adv phrase | 必要に応じて | Automatic Clustering manages re-clustering as needed. |
| internally | adv | 内部的に | Snowflake internally maintains the clustered tables. |
| benefit from ~ | verb phrase | ～から恩恵を受ける | Only partitions that benefit from re-clustering are adjusted. |
| adjust | verb | 調整する、修正する | The service adjusts micro-partitions to improve clustering. |

## 3-3. 解説文（日本語）

> クラスタリングキーが定義されたテーブルに対して、SnowflakeのサービスであるAutomatic Clusteringは、必要に応じて再クラスタリングを管理し、クラスタリングキーに従ってデータを配置します。Snowflakeは内部的に、Automatic Clusteringを使ってクラスタリングされたテーブルと必要なリソースを維持します。Automatic Clusteringは、再クラスタリングプロセスの恩恵を受けるマイクロパーティションのみを調整します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
