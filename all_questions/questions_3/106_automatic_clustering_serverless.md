# 106: Automatic Clustering — Serverless Service

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-17
**正答**: B, C（マイクロパーティションの再配置 / サーバーレスサービス）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Automatic Clustering | クラスタリングキーが定義されたテーブルに対して、Snowflakeが自動的に再クラスタリングを行うサービス |
| Clustering Key | テーブルの1つ以上の列で定義する、マイクロパーティションの並び順のキー。範囲クエリの効率を向上させる |
| Serverless Service | ユーザーが仮想ウェアハウスを管理・起動しなくても、Snowflakeが内部でコンピュートリソースを自動管理するサービス |
| Re-clustering | クラスタリングキーに基づいて、最適でないマイクロパーティションを再編成するプロセス |
| Micro-partition | テーブルデータの基本的な格納単位。クラスタリングによってキーの値の範囲が最適化される |
| Clustering Depth | テーブルのクラスタリング品質を示す指標。値が小さいほどクラスタリングが良好 |

## 1-2. 重要コンセプトまとめ

- **Automatic ClusteringはSnowflakeが管理するサーバーレスサービス**
  - ユーザーが仮想ウェアハウスを起動する必要はなく、Snowflakeが内部でコンピュートリソースを管理
  - クレジットはサーバーレスクレジットとして課金される
- **Automatic Clusteringはデータをクラスタリングキーに基づいてマイクロパーティションに再配置する**
  - クラスタリングが必要なマイクロパーティションのみが対象（すべてを再クラスタリングするわけではない）
- **「アカウントレベルで無効化できる」は誤り**
  - テーブルレベルで有効化・無効化できる（`ALTER TABLE ... SUSPEND RECLUSTER` / `RESUME RECLUSTER`）
  - アカウント全体でOFF/ONとはならない
- **仮想ウェアハウスが必要という選択肢は誤り**
  - サーバーレスなので、ユーザーのウェアハウスは不要

## 1-3. 公式ドキュメントURL

- [Automatic Clustering](https://docs.snowflake.com/en/user-guide/tables-auto-reclustering)
- [Clustering Keys Overview](https://docs.snowflake.com/en/user-guide/tables-clustering-keys)

---

## 2-1. 問題文（英語）

> Which of the following correctly describes Automatic Clustering? Select all that apply.
>
> A. Automatic Clustering requires an active virtual warehouse to be running.
> B. Automatic Clustering redistributes data in micro-partitions based on the clustering key.
> C. Automatic Clustering is a serverless service.
> D. Automatic Clustering can be turned off at the account level.

## 2-2. 問題文の文法解析

### 文1: "Which of the following correctly describes Automatic Clustering?"

- **主語 (S)**: Which of the following
- **動詞 (V)**: correctly describes
- **目的語 (O)**: Automatic Clustering
- **注目ポイント**: `correctly describes` = 正確に説明している（副詞 correctly が動詞を修飾）

### 選択肢Aの文法: "Automatic Clustering requires an active virtual warehouse to be running."

- **主語 (S)**: Automatic Clustering
- **動詞 (V)**: requires
- **目的語 (O)**: an active virtual warehouse to be running（不定詞句）
- **注目ポイント**: `require A to be doing` = AがBしている状態を必要とする

### 選択肢Bの文法: "Automatic Clustering redistributes data in micro-partitions based on the clustering key."

- **主語 (S)**: Automatic Clustering
- **動詞 (V)**: redistributes
- **目的語 (O)**: data in micro-partitions
- **修飾語 (M)**: based on the clustering key（過去分詞句、様態）
- **注目ポイント**: `redistribute` = 再配置する（re- = 再び）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| redistribute | 動詞 | 再配置する、再分配する | Automatic Clustering redistributes data across micro-partitions. |
| serverless | 形容詞 | サーバーレスの | Automatic Clustering is a serverless service managed by Snowflake. |
| turn off | 動詞句 | 無効にする、オフにする | You can turn off clustering at the table level. |
| account level | 名詞句 | アカウントレベル | This feature cannot be turned off at the account level. |

## 2-3. 問題文（日本語）

> 次のうち、Automatic Clusteringを正しく説明しているものはどれですか？すべて選んでください。
>
> A. Automatic Clusteringは、稼働中のアクティブな仮想ウェアハウスが必要です。
> B. Automatic Clusteringは、クラスタリングキーに基づいてマイクロパーティション内のデータを再配置します。
> C. Automatic Clusteringはサーバーレスサービスです。
> D. Automatic Clusteringはアカウントレベルで無効化できます。

---

## 3-1. 解説文（英語）

> For tables with a clustering key defined, Automatic Clustering, a Snowflake service, manages the re-clustering as needed, distributing data according to the clustering key. Snowflake internally maintains the clustered tables and any resource requirements with Automatic Clustering. Automatic Clustering only adjusts those micro-partitions which benefit from the re-clustering process. https://docs.snowflake.com/en/user-guide/tables-auto-reclustering

## 3-2. 解説文の文法解析

### 文1: "For tables with a clustering key defined, Automatic Clustering, a Snowflake service, manages the re-clustering as needed, distributing data according to the clustering key."

- **前置詞句**: For tables with a clustering key defined（対象を示す）
- **主語 (S)**: Automatic Clustering, a Snowflake service（同格：カンマで囲まれた補足説明）
- **動詞 (V)**: manages
- **目的語 (O)**: the re-clustering
- **副詞**: as needed（必要に応じて）
- **分詞構文**: distributing data according to the clustering key（付帯状況）
- **注目ポイント**: 
  - 同格の挿入（`a Snowflake service`）
  - `as needed` = 必要に応じて（技術文書の定番表現）
  - `according to ~` = 〜に従って

### 文2: "Snowflake internally maintains the clustered tables and any resource requirements with Automatic Clustering."

- **主語 (S)**: Snowflake
- **動詞 (V)**: internally maintains
- **目的語 (O)**: the clustered tables and any resource requirements
- **修飾語 (M)**: with Automatic Clustering
- **注目ポイント**: `internally` = 内部的に（ユーザーの操作なしで）

### 文3: "Automatic Clustering only adjusts those micro-partitions which benefit from the re-clustering process."

- **主語 (S)**: Automatic Clustering
- **動詞 (V)**: only adjusts
- **目的語 (O)**: those micro-partitions which benefit from the re-clustering process
- **関係詞節**: which benefit from the re-clustering process（限定用法）
- **注目ポイント**: 
  - `only adjusts` = 〜のみを調整する（限定を示す副詞 only）
  - `benefit from ~` = 〜から恩恵を受ける、〜で効果が得られる

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| as needed | 副詞句 | 必要に応じて | The system re-clusters as needed without user intervention. |
| maintain | 動詞 | 管理する、維持する | Snowflake internally maintains the clustered tables. |
| adjust | 動詞 | 調整する | Only the micro-partitions that need adjustment are processed. |
| benefit from | 動詞句 | 〜から恩恵を受ける | Only partitions that benefit from re-clustering are adjusted. |

## 3-3. 解説文（日本語）

> クラスタリングキーが定義されたテーブルに対して、SnowflakeのサービスであるAutomatic Clusteringは、クラスタリングキーに従ってデータを配分しながら、必要に応じて再クラスタリングを管理します。SnowflakeはクラスタリングされたテーブルとAutomatic Clusteringのリソース要件を内部で管理します。Automatic Clusteringは、再クラスタリングプロセスで効果が得られるマイクロパーティションのみを調整します。

---

## 復習メモ

- [ ] Automatic Clusteringがサーバーレス（仮想ウェアハウス不要）であることを理解した
- [ ] テーブルレベルで有効化/無効化できる（アカウントレベルではない）ことを把握した
- [ ] `as needed`（必要に応じて）と `benefit from`（恩恵を受ける）を確認した
