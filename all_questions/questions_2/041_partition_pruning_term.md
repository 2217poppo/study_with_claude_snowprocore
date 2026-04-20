# 041: Partition Pruning Term

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-13
**正答**: Partition Pruning

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Partition Pruning（パーティションプルーニング） | クエリ実行時にWHERE条件に合致しないマイクロパーティションをスキャン対象から除外する最適化技術。Snowflakeの高速クエリの核心 |
| Micro-Partition（マイクロパーティション） | Snowflakeがデータを内部的に分割する単位。各パーティションのメタデータ（列の最小/最大値など）が管理される |
| Metadata（メタデータ） | マイクロパーティションごとに保持される統計情報。列の最小値・最大値・NULL数・行数など。Cloud Servicesレイヤーが管理 |
| Table Scan（テーブルスキャン） | テーブルの全パーティションを読み取る操作。プルーニングが効かない場合に発生し、パフォーマンスが低下する |
| Query Engine（クエリエンジン） | Snowflakeがクエリを処理するエンジン。メタデータを使ってプルーニングを実行し、必要なパーティションのみスキャンする |

## 1-2. 重要コンセプトまとめ

- **Partition Pruning** = パーティションをスキャン対象から除外する最適化技術
- 仕組み: Snowflakeは各マイクロパーティションの **メタデータ（最小/最大値）** を利用して、WHERE条件に合致しないパーティションをスキップ
- 例: `WHERE date = '2024-01-01'` の場合、date列の範囲にこの日付を含まないパーティションはスキャンされない
- 他の選択肢との違い:
  - **In Memory Operations**: メモリ内操作の総称であり、プルーニングとは異なる
  - **Table Scan**: プルーニングの逆、全パーティションを読む
  - **Partition Indexing**: Snowflakeの用語ではない（従来型DBのインデックスとは異なるアプローチ）
- クラスタリングキーはプルーニングの効果を最大化するために使う

## 1-3. 公式ドキュメントURL

- [Query Pruning](https://docs.snowflake.com/en/user-guide/tables-clustering-micropartitions#query-pruning)

---

## 2-1. 問題文（英語）

> What is the term used when Snowflake eliminates some partitions from the scanning process while executing a query?
>
> A. In Memory Operations
> B. Table Scan
> C. Partition Indexing
> D. Partition Pruning

## 2-2. 問題文の文法解析

### 文1: "What is the term used when Snowflake eliminates some partitions from the scanning process while executing a query?"

- **主語 (S)**: What
- **動詞 (V)**: is
- **補語 (C)**: the term
- **修飾語 (M)**: used when Snowflake eliminates some partitions from the scanning process while executing a query（過去分詞 `used` + when節 → termを修飾）
- **文型**: SVC（疑問文）
- **注目ポイント**: `the term used when ~` は「～するときに使われる用語」。`eliminate ~ from ~` は「～から～を除外する」。`while executing` は分詞構文で「実行しながら」。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| eliminate | verb | 除外する、排除する | Snowflake eliminates unnecessary partitions. |
| scanning process | noun | スキャン処理 | Partitions are removed from the scanning process. |
| partition | noun | パーティション（データ分割単位） | Snowflake stores data in micro-partitions. |
| pruning | noun | プルーニング（刈り込み） | Partition pruning optimizes queries. |

## 2-3. 問題文（日本語）

> クエリ実行中にSnowflakeがスキャン処理から一部のパーティションを除外することを表す用語は何ですか？
>
> A. In Memory Operations（インメモリオペレーション）
> B. Table Scan（テーブルスキャン）
> C. Partition Indexing（パーティションインデックス）
> D. Partition Pruning（パーティションプルーニング）

---

## 3-1. 解説文（英語）

> The metadata in Snowflake allows the Snowflake query engine to eliminate partitions to optimize query execution. For example, if the query specifies a WHERE condition, partitions NOT containing the value matching that condition will NOT be scanned.

## 3-2. 解説文の文法解析

### 文1: "The metadata in Snowflake allows the Snowflake query engine to eliminate partitions to optimize query execution."

- **主語 (S)**: The metadata in Snowflake
- **動詞 (V)**: allows
- **目的語 (O)**: the Snowflake query engine
- **補語 (C)**: to eliminate partitions to optimize query execution（不定詞句）
- **文型**: SVOC（allow O to do）
- **注目ポイント**: `allow O to do` は「Oが～することを可能にする」。`to eliminate` と `to optimize` の2つの不定詞が連鎖。メタデータがプルーニングの基盤であることを示す。

### 文2: "For example, if the query specifies a WHERE condition, partitions NOT containing the value matching that condition will NOT be scanned."

- **主語 (S)**: partitions NOT containing the value matching that condition
- **動詞 (V)**: will NOT be scanned（受動態 + 否定）
- **修飾語 (M)**: For example（例示）、if the query specifies a WHERE condition（条件節）
- **文型**: SV（受動態）
- **注目ポイント**: `NOT containing ~` の現在分詞否定形が partitions を後置修飾。`matching that condition` もさらに value を修飾。入れ子の修飾構造。`will NOT be scanned` で「スキャンされない」という結果を明示。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| metadata | noun | メタデータ（データに関するデータ） | Metadata allows the engine to prune partitions. |
| allow O to do | phrase | Oが～することを可能にする | Metadata allows the engine to eliminate partitions. |
| specify | verb | 指定する | The query specifies a WHERE condition. |
| contain | verb | 含む | Partitions not containing the value will be skipped. |

## 3-3. 解説文（日本語）

> Snowflakeのメタデータは、Snowflakeのクエリエンジンがクエリ実行を最適化するためにパーティションを除外することを可能にします。例えば、クエリがWHERE条件を指定した場合、その条件に一致する値を含まないパーティションはスキャンされません。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
