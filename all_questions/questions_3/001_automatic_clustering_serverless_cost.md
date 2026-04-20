# 001: Automatic Clustering Serverless Cost

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-14
**正答**: True

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Automatic Clustering（自動クラスタリング） | クラスタリングキーが定義されたテーブルのマイクロパーティションを自動的に再クラスタリングするSnowflakeのサーバーレスサービス。仮想ウェアハウスは不要 |
| Serverless Cost（サーバーレスコスト） | Snowflakeが管理するCPU・RAMなどのリソースに対して発生するコスト。ユーザーがWHを管理する必要がないが、クレジット消費は発生する |
| Re-clustering（再クラスタリング） | マイクロパーティションを再配置してクラスタリングを改善する処理。DML操作と同様にクレジットを消費し、追加ストレージも発生する |
| Clustering Key（クラスタリングキー） | テーブルデータの物理的な並びを最適化するために指定する列。変更するとAutomatic Clusteringが再クラスタリングを実行 |
| Micro-Partition（マイクロパーティション） | Snowflakeの内部データ分割単位。再クラスタリング時に新しいパーティションが作成され、元のパーティションはTime Travel・Fail-Safe用に保持される |

## 1-2. 重要コンセプトまとめ

- クラスタリングキーを変更すると **サーバーレスコストが発生する**（True）
- Automatic Clusteringの重要な特性:
  - **仮想ウェアハウスは不要**（Snowflake管理のCPU/RAMを使用）
  - コストは**サーバーレスコスト**として計上される
  - 再クラスタリングが必要なマイクロパーティション**のみ**を調整（全パーティションではない）
- 再クラスタリングで発生するコスト（2種類）:
  1. **コンピュートコスト**: DML操作と同様にクレジット消費（サーバーレス）
  2. **ストレージコスト**: 新パーティション作成 + 元パーティションがTime Travel/Fail-Safe用に保持 → ストレージ増加
- Automatic Clusteringは**Enterprise以上**のエディションで利用可能

## 1-3. 公式ドキュメントURL

- [Credit Usage and Warehouses for Automatic Clustering](https://docs.snowflake.com/en/user-guide/tables-auto-reclustering#credit-usage-and-warehouses-for-automatic-clustering)

---

## 2-1. 問題文（英語）

> True or False: When a clustering key is changed for a table, there may be a serverless cost associated with it.
>
> A. False
> B. True

## 2-2. 問題文の文法解析

### 文1: "When a clustering key is changed for a table, there may be a serverless cost associated with it."

- **主語 (S)**: there（形式主語）
- **動詞 (V)**: may be
- **真主語**: a serverless cost associated with it
- **修飾語 (M)**: When a clustering key is changed for a table（条件節）、associated with it（過去分詞の後置修飾）
- **文型**: SV（there構文）
- **注目ポイント**: `there may be ~` は「～が存在する可能性がある」。`associated with it` は「それに関連した」で cost を修飾。`may` が可能性を示唆しており、確定ではなく「コストが発生し得る」というニュアンス。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| associated with ~ | phrase | ～に関連した | A serverless cost associated with re-clustering. |
| serverless cost | noun | サーバーレスコスト | Automatic Clustering incurs serverless costs. |
| re-cluster | verb | 再クラスタリングする | Snowflake re-clusters micro-partitions as needed. |

## 2-3. 問題文（日本語）

> 真/偽: テーブルのクラスタリングキーを変更すると、サーバーレスコストが発生する可能性がある。
>
> A. 偽
> B. 真

---

## 3-1. 解説文（英語）

> For tables with a clustering key defined, Automatic Clustering, a Snowflake service, re-clusters the micro-partitions as needed, distributing data according to the clustering key to achieve appropriate partition pruning. Snowflake internally maintains the clustered tables and any resource requirements with Automatic Clustering. Automatic Clustering only adjusts those micro-partitions which benefit from the re-clustering process. Automatic Clustering does not need a virtual warehouse but uses Snowflake-managed CPU, RAM, etc. Therefore, it has a cost attached, which should appear under serverless costs. Clustering a table uses credits like any other data modification (DML) action in Snowflake. Re-clustering also adds extra storage when data is physically redistributed and new micro-partitions are created. The original micro-partitions are kept for Time Travel and Fail-safe purposes, resulting in increased storage.

## 3-2. 解説文の文法解析

### 文1: "For tables with a clustering key defined, Automatic Clustering, a Snowflake service, re-clusters the micro-partitions as needed, distributing data according to the clustering key to achieve appropriate partition pruning."

- **主語 (S)**: Automatic Clustering
- **動詞 (V)**: re-clusters
- **目的語 (O)**: the micro-partitions
- **修飾語 (M)**: For tables with a clustering key defined（対象）、a Snowflake service（同格）、as needed（必要に応じて）、distributing data ~（結果の分詞構文）
- **文型**: SVO
- **注目ポイント**: `as needed` は「必要に応じて」。`distributing ~` は結果を示す分詞構文。

### 文2: "Automatic Clustering does not need a virtual warehouse but uses Snowflake-managed CPU, RAM, etc."

- **主語 (S)**: Automatic Clustering
- **動詞 (V)**: does not need / uses（並列）
- **目的語 (O)**: a virtual warehouse / Snowflake-managed CPU, RAM, etc.
- **文型**: SVO + SVO
- **注目ポイント**: WH不要だがSnowflake管理リソースを使用するという核心を述べる。`Snowflake-managed` はハイフン結合の複合形容詞。

### 文3: "Re-clustering also adds extra storage when data is physically redistributed and new micro-partitions are created."

- **主語 (S)**: Re-clustering
- **動詞 (V)**: adds
- **目的語 (O)**: extra storage
- **修飾語 (M)**: also（追加）、when data is physically redistributed and new micro-partitions are created（条件）
- **文型**: SVO
- **注目ポイント**: コンピュートコストに加えて**ストレージコストも増加**する重要ポイント。

### 文4: "The original micro-partitions are kept for Time Travel and Fail-safe purposes, resulting in increased storage."

- **主語 (S)**: The original micro-partitions
- **動詞 (V)**: are kept（受動態）
- **修飾語 (M)**: for Time Travel and Fail-safe purposes（目的）、resulting in increased storage（結果の分詞構文）
- **文型**: SV
- **注目ポイント**: `resulting in ~` は「その結果～となる」。元パーティションがTime Travel/Fail-Safe用に保持されるためストレージが増加する。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| as needed | phrase | 必要に応じて | Re-clusters micro-partitions as needed. |
| Snowflake-managed | adjective | Snowflake管理の | Uses Snowflake-managed CPU and RAM. |
| has a cost attached | phrase | コストが付随する | It has a cost attached. |
| resulting in ~ | phrase | その結果～となる | Resulting in increased storage. |
| physically redistributed | phrase | 物理的に再配置された | Data is physically redistributed. |

## 3-3. 解説文（日本語）

> クラスタリングキーが定義されたテーブルに対して、Snowflakeのサービスである自動クラスタリングは、必要に応じてマイクロパーティションを再クラスタリングし、適切なパーティションプルーニングを実現するためにクラスタリングキーに従ってデータを再配置します。Snowflakeは内部的にクラスタリングされたテーブルとAutomatic Clusteringのリソース要件を管理します。Automatic Clusteringは再クラスタリングの恩恵を受けるマイクロパーティションのみを調整します。Automatic Clusteringは仮想ウェアハウスを必要としませんが、Snowflake管理のCPU・RAMなどを使用します。そのため、コストが付随し、サーバーレスコストとして表示されるべきです。テーブルのクラスタリングは、Snowflakeの他のDML操作と同様にクレジットを消費します。再クラスタリングでは、データが物理的に再配置され新しいマイクロパーティションが作成されるため、追加のストレージも発生します。元のマイクロパーティションはTime TravelとFail-Safeの目的で保持されるため、ストレージが増加します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
