# 127: Automatic Clustering — Controlling Micro-partition Data Organization

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-17
**正答**: A（Automatic Clustering）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Automatic Clustering（自動クラスタリング） | クラスタリングキーが定義されたテーブルのマイクロパーティションを自動的に再整列するSnowflakeのサーバーレスサービス。データの追加・変更によって乱れたクラスタリング状態を自動的に維持する |
| Re-clustering（再クラスタリング） | 既存のマイクロパーティションをクラスタリングキーに従って再配置するプロセス。Automatic Clusteringがこれを自動実行する |
| Clustering Key（クラスタリングキー） | マイクロパーティションへのデータ分散に使用する列または式の定義。`CLUSTER BY (col1, col2)` で指定 |
| Partition Pruning（パーティションプルーニング） | クエリ実行時に不要なマイクロパーティションをスキャンしないようにする最適化。クラスタリングが効いていると pruning の効果が高まる |
| Materialized View（マテリアライズドビュー） | クエリ結果を事前計算して保存するビュー。データ組織化ではなくクエリ結果のキャッシュが目的 |
| Search Optimization（サーチオプティマイゼーション） | 特定の点検索（`WHERE col = value`）を高速化するサービス。マイクロパーティションの組織化ではなく検索インデックスの追加 |

## 1-2. 重要コンセプトまとめ

- **マイクロパーティションのデータ組織化 = Automatic Clustering**
  - クラスタリングキーが定義されたテーブルに対して機能する
  - 「どのデータがどのマイクロパーティションに入るか」を制御する
  - Snowflakeが内部的にリソースを管理（サーバーレス）
- **誤答の排除**
  - `Partition Pruning`: プルーニングはクエリ時の最適化であり、データ組織化ではない（結果であって手段ではない）
  - `Materialized Views`: クエリ結果の事前計算・保存。マイクロパーティション組織化とは無関係
  - `Search Optimization`: 特定の点検索の高速化（インデックス的な仕組み）。データ組織化ではない
- **Automatic Clusteringの特徴（Q106と合わせて復習）**
  - サーバーレス（ユーザーのウェアハウスは不要）
  - テーブル単位で有効化/無効化が可能
  - 再クラスタリングが有益なマイクロパーティションのみを調整（全パーティションではない）
  - コストはSnowflakeクレジットで別途発生（リソースモニターで追跡不可）

## 1-3. 公式ドキュメントURL

- [Automatic Clustering](https://docs.snowflake.com/en/user-guide/tables-auto-reclustering)
- [Clustering Keys & Clustered Tables](https://docs.snowflake.com/en/user-guide/tables-clustering-keys)

---

## 2-1. 問題文（英語）

> Which of the following allows users to control how the data for a table is organized in micro-partitions?
>
> A. Automatic Clustering
> B. Partition Pruning
> C. Materialized Views
> D. Search Optimization

## 2-2. 問題文の文法解析

### 文1: "Which of the following allows users to control how the data for a table is organized in micro-partitions?"

- **主語 (S)**: Which of the following
- **動詞 (V)**: allows
- **目的語 (O)**: users to control how the data for a table is organized in micro-partitions（SVOC構文）
- **間接疑問文**: how the data for a table is organized in micro-partitions
- **文型**: SVO（疑問文）
- **注目ポイント**: 
  - `allows users to control` = ユーザーが制御することを可能にする（allow O to do）
  - `how the data is organized` = データがどのように整理されているか（間接疑問文）
  - `in micro-partitions` = マイクロパーティション内で（場所の前置詞句）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| organize | 動詞 | 整理する、組織化する | Data is organized in micro-partitions by clustering keys. |
| control | 動詞/名詞 | 制御する/制御 | Clustering keys control how data is organized. |
| allow O to do | 構文 | Oが〜することを可能にする | Automatic Clustering allows users to control data layout. |

## 2-3. 問題文（日本語）

> 次のうち、テーブルのデータがマイクロパーティション内でどのように整理されるかをユーザーが制御することを可能にするものはどれですか？
>
> A. Automatic Clustering（自動クラスタリング）
> B. Partition Pruning（パーティションプルーニング）
> C. Materialized Views（マテリアライズドビュー）
> D. Search Optimization（サーチオプティマイゼーション）

---

## 3-1. 解説文（英語）

> For tables with a clustering key defined, Automatic Clustering, a Snowflake service, manages the re-clustering as needed, distributing data according to the clustering key. Snowflake internally maintains the clustered tables and any resource requirements with Automatic Clustering. Automatic Clustering only adjusts those micro-partitions that benefit from the re-clustering process.
>
> https://docs.snowflake.com/en/user-guide/tables-auto-reclustering

## 3-2. 解説文の文法解析

### 文1: "For tables with a clustering key defined, Automatic Clustering, a Snowflake service, manages the re-clustering as needed, distributing data according to the clustering key."

- **条件の前置詞句**: For tables with a clustering key defined（クラスタリングキーが定義されたテーブルに対して）
- **主語 (S)**: Automatic Clustering, a Snowflake service（同格句）
- **動詞 (V)**: manages
- **目的語 (O)**: the re-clustering as needed
- **分詞構文**: distributing data according to the clustering key（結果・付帯状況）
- **文型**: SVO
- **注目ポイント**: 
  - `For tables with a clustering key defined` = クラスタリングキーが定義されたテーブルに対して（前置詞句による条件）
  - `a Snowflake service`（同格）でAutomatic Clusteringがサービスであることを確認
  - `as needed` = 必要に応じて（慣用句）
  - `distributing data according to ~` = クラスタリングキーに従ってデータを分散させながら

### 文2: "Snowflake internally maintains the clustered tables and any resource requirements with Automatic Clustering."

- **主語 (S)**: Snowflake
- **副詞**: internally（内部的に）
- **動詞 (V)**: maintains
- **目的語 (O)**: the clustered tables and any resource requirements
- **手段の修飾語**: with Automatic Clustering
- **文型**: SVO
- **注目ポイント**: `internally maintains` = 内部的に管理する（ユーザーが手動管理不要であることを示す）

### 文3: "Automatic Clustering only adjusts those micro-partitions that benefit from the re-clustering process."

- **主語 (S)**: Automatic Clustering
- **副詞**: only（のみ）
- **動詞 (V)**: adjusts
- **目的語 (O)**: those micro-partitions that benefit from the re-clustering process
- **関係詞節**: that benefit from the re-clustering process（those micro-partitionsを修飾）
- **文型**: SVO
- **注目ポイント**: 
  - `only adjusts those that benefit` = 恩恵を受けるものだけを調整（効率性を示す）
  - `benefit from ~` = 〜から恩恵を受ける

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| as needed | 副詞句 | 必要に応じて | Automatic Clustering re-clusters data as needed. |
| internally | 副詞 | 内部的に | Snowflake internally manages clustering resources. |
| benefit from | 句動詞 | 〜から恩恵を受ける | Only partitions that benefit from re-clustering are adjusted. |
| distribute | 動詞 | 分散させる | Data is distributed according to the clustering key. |

## 3-3. 解説文（日本語）

> クラスタリングキーが定義されたテーブルに対して、SnowflakeのサービスであるAutomatic Clusteringは必要に応じて再クラスタリングを管理し、クラスタリングキーに従ってデータを分散させます。Snowflakeは内部的にクラスタリングされたテーブルとAutomatic Clusteringのリソース要件を管理します。Automatic Clusteringは、再クラスタリングプロセスから恩恵を受けるマイクロパーティションのみを調整します。

---

## 復習メモ

- [ ] マイクロパーティションのデータ組織化を制御するのはAutomatic Clustering（クラスタリングキー定義が前提）を覚えた
- [ ] Partition PruningはAutomatic Clusteringの効果（結果）であり、手段ではないことを理解した
- [ ] `as needed`（必要に応じて）と `those micro-partitions that benefit from`（恩恵を受けるもの）を確認した
