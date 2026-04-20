# 035: Clustering Keys — Optimizing Large Table Query Performance

**SnowPro Core Domain**: Domain 4 — Performance Optimization
**作成日**: 2026-04-02
**正答**: C（Cluster the Transactions table on the transaction date column）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Clustering Key（クラスタリングキー） | テーブルのデータをマイクロパーティション内でどのように整理するかを定義するキー。特定の列でクエリを絞り込む際に不要なパーティションを除外できる |
| Micro-Partition（マイクロパーティション） | Snowflakeがデータを内部的に分割する単位。各マイクロパーティションは50〜500MBの非圧縮データを含み、メタデータ（最大/最小値など）によって管理される |
| Partition Pruning（パーティションプルーニング） | クエリのWHERE条件に合致しないマイクロパーティションをスキャン対象から除外する最適化。クラスタリングによって大幅に改善される |
| Re-clustering（再クラスタリング） | テーブルデータを新たに定義したクラスタリングキーに基づいて再配置するプロセス。大量データへの変更で自然クラスタリングが崩れた場合に有効 |
| Virtual Warehouse（仮想ウェアハウス） | Snowflakeのコンピュートリソース（クラスタ）。T-Shirt サイズ（X-Small〜6X-Large）で定義され、クエリ実行に使用される |
| Data Modeler | データベース設計・テーブル構造の最適化を担当するロール/職種 |
| Predicate（述語） | SQL WHERE句などでデータをフィルタリングする条件。例: `WHERE transaction_date = '2024-01-01'` |

## 1-2. 重要コンセプトまとめ

- **なぜウェアハウスサイズアップは非効率か**: ウェアハウスを大きくするとコストが増加するが、問題の根本原因（大量データのフルスキャン）は解決しない。根本原因を解決しない場合、データがさらに増えると再度性能劣化する
- **なぜ年ごとのテーブル分割は非効率か**: 手動でテーブルを分割・データコピー・クエリ変更が必要で運用コストが高い。Snowflakeが提供するクラスタリングを活用していない
- **クラスタリングが最善な理由**: 日次レポートは「今日1日分のデータ」のみを参照するため、`transaction_date` 列でクラスタリングすると不要なマイクロパーティションをスキャンしない → 劇的な性能向上・コスト削減
- **500GB → 5TBの問題**: データ量が10倍になったが、クラスタリングなしではテーブル全体をスキャン。クラスタリングがあれば1日分のパーティションだけをスキャン
- **試験頻出**: 「データが大きくなってクエリが遅くなった → 最も効率的な対策は?」= **クラスタリングキーの定義** が模範解答

## 1-3. 公式ドキュメントURL

- [Clustering Keys & Clustered Tables](https://docs.snowflake.com/en/user-guide/tables-clustering-keys)
- [Automatic Clustering](https://docs.snowflake.com/en/user-guide/tables-auto-reclustering)
- [Understanding Snowflake Table Structures (Micro-Partitions)](https://docs.snowflake.com/en/user-guide/tables-clustering-micropartitions)

---

## 2-1. 問題文（英語）

> You are the data modeler at a large retail organization that stores transactional data in a Snowflake table called "Transactions." The daily revenue reports are generated using the "Transactions" table, which calculates the revenue for the current day.
>
> The "Transactions" table originally had 500GB of data but has now grown to 5TB. You have noticed that over time the performance of the daily revenue reports has degraded.
>
> What is the most efficient & cost-effective way of optimizing performance?
>
> A. Increase the size of the virtual warehouse executing the daily reports.
> B. Create tables for each year of data, e.g., Transactions_2017, Transactions_2018, and Transactions_2019. Then, insert the relevant data from the Transactions table into these _year tables. Then, change your report to point to the Transactions_2019 table.
> C. Cluster the Transactions table on the transaction date column.

## 2-2. 問題文の文法解析

### 文1: "You are the data modeler at a large retail organization that stores transactional data in a Snowflake table called 'Transactions.'"

- **主語 (S)**: You（あなたは）
- **動詞 (V)**: are（〜である）
- **補語 (C)**: the data modeler at a large retail organization（大手小売組織のデータモデラー）
- **修飾語 (M1)**: that stores transactional data in a Snowflake table called "Transactions"（"Transactions"というSnowflakeテーブルにトランザクションデータを保存している）← `that` = organization を先行詞とする関係代名詞節
- **修飾語 (M2)**: called "Transactions"（"Transactions"と呼ばれる）← 過去分詞の後置修飾
- **文型**: SVC
- **注目ポイント**: `called ~` は過去分詞による後置修飾。「〜という名前の」

### 文2: "The daily revenue reports are generated using the 'Transactions' table, which calculates the revenue for the current day."

- **主語 (S)**: The daily revenue reports（日次売上レポートは）
- **動詞 (V)**: are generated（生成される）← 受動態
- **修飾語 (M1)**: using the "Transactions" table（"Transactions"テーブルを使用して）← 分詞句
- **修飾語 (M2)**: which calculates the revenue for the current day（当日の収益を計算する）← 非制限関係詞節（前の節全体への補足）
- **文型**: SV（受動態）
- **注目ポイント**: `which` の先行詞は直前の "the Transactions table" ではなく文全体の状況。非制限用法（カンマ + which）

### 文3: "The 'Transactions' table originally had 500GB of data but has now grown to 5TB."

- **主語 (S)**: The "Transactions" table（Transactionsテーブルは）
- **動詞 (V1)**: originally had（もともと〜を持っていた）← 過去形
- **動詞 (V2)**: has now grown to（今や〜に成長した）← 現在完了
- **目的語 (O)**: 500GB of data / 5TB
- **文型**: SVO but SV（対比構文）
- **注目ポイント**: `but` で過去と現在を対比。`grow to ~` = 「〜に成長する・達する」

### 文4: "What is the most efficient & cost-effective way of optimizing performance?"

- **主語 (S)**: What（何が）← 疑問詞
- **動詞 (V)**: is（〜である）
- **補語 (C)**: the most efficient & cost-effective way of optimizing performance（パフォーマンスを最適化する最も効率的でコスト効率の良い方法）
- **文型**: SVC（倒置）
- **注目ポイント**: `cost-effective` = ハイフンでつないだ複合形容詞「費用対効果の高い」。試験頻出の表現

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| transactional data | 名詞句 | トランザクションデータ（取引記録） | Transactional data includes every sale, return, and payment. |
| degrade | 動詞 | 低下する、劣化する | Query performance has degraded as the table grew. |
| cost-effective | 形容詞 | 費用対効果の高い | Clustering is a cost-effective solution for large tables. |
| optimize | 動詞 | 最適化する | Clustering helps optimize query performance. |
| over time | 副詞句 | 時間の経過とともに | Performance degraded over time as data grew. |

## 2-3. 問題文（日本語）

> あなたは大手小売組織のデータモデラーで、"Transactions"というSnowflakeテーブルにトランザクションデータを保存しています。日次売上レポートは"Transactions"テーブルを使用して生成されており、当日の売上を計算します。
>
> "Transactions"テーブルはもともと500GBのデータでしたが、現在は5TBに成長しました。時間の経過とともに日次売上レポートのパフォーマンスが低下していることに気づきました。
>
> パフォーマンスを最適化する最も効率的でコスト効率の良い方法はどれですか？
>
> A. 日次レポートを実行する仮想ウェアハウスのサイズを大きくする。
> B. 年ごとのテーブル（例: Transactions_2017, Transactions_2018, Transactions_2019）を作成し、Transactionsテーブルから関連データをそれぞれの年テーブルに挿入する。その後、レポートがTransactions_2019テーブルを参照するよう変更する。
> C. Transactionsテーブルをトランザクション日付列でクラスタリングする。

---

## 3-1. 解説文（英語）

> Clustering a table on a specific column can optimize queries by eliminating unnecessary partitions from the query processing. A table can be re-clustered by defining a clustering key, which effectively redistributes the data into micro-partitions according to the clustering key, ensuring optimal access to queries that predicate or join on the clustered column. Clustering the table on the transaction date is the most efficient option. The daily report accesses one day at a time and benefits from the partition on the date column.

## 3-2. 解説文の文法解析

### 文1: "Clustering a table on a specific column can optimize queries by eliminating unnecessary partitions from the query processing."

- **主語 (S)**: Clustering a table on a specific column（特定の列でテーブルをクラスタリングすることは）← 動名詞句が主語
- **動詞 (V)**: can optimize（最適化できる）
- **目的語 (O)**: queries（クエリを）
- **修飾語 (M)**: by eliminating unnecessary partitions from the query processing（クエリ処理から不要なパーティションを除去することによって）← `by + 動名詞` で手段を表す
- **文型**: SVO
- **注目ポイント**: `by + 動名詞` は手段・方法を示す頻出パターン。`eliminate` = 除去する（重要語彙）

### 文2: "A table can be re-clustered by defining a clustering key, which effectively redistributes the data into micro-partitions according to the clustering key, ensuring optimal access to queries that predicate or join on the clustered column."

- **主語 (S)**: A table（テーブルは）
- **動詞 (V)**: can be re-clustered（再クラスタリングされることができる）← 助動詞 + 受動態
- **修飾語 (M1)**: by defining a clustering key（クラスタリングキーを定義することによって）← `by + 動名詞`
- **修飾語 (M2)**: which effectively redistributes the data into micro-partitions according to the clustering key（クラスタリングキーに従ってデータをマイクロパーティションに効果的に再配置する）← 非制限関係詞節
- **修飾語 (M3)**: ensuring optimal access to queries that predicate or join on the clustered column（クラスタリングされた列を述語またはJOINするクエリへの最適なアクセスを確保して）← 結果を表す分詞構文
- **文型**: SV（受動態）
- **注目ポイント**:
  - `which` の先行詞は `a clustering key`
  - `ensuring ~` = 結果を示す付帯状況分詞構文（前文の帰結）
  - `predicate or join on ~` = 述語（WHERE条件）またはJOIN条件として使用する

### 文3: "Clustering the table on the transaction date is the most efficient option."

- **主語 (S)**: Clustering the table on the transaction date（トランザクション日付でテーブルをクラスタリングすることは）← 動名詞句
- **動詞 (V)**: is（〜である）
- **補語 (C)**: the most efficient option（最も効率的な選択肢）
- **文型**: SVC
- **注目ポイント**: 最上級 `the most efficient` を使ってCが最善であることを断言

### 文4: "The daily report accesses one day at a time and benefits from the partition on the date column."

- **主語 (S)**: The daily report（日次レポートは）
- **動詞 (V1)**: accesses（アクセスする）
- **目的語 (O1)**: one day at a time（1日分ずつ）
- **動詞 (V2)**: benefits from（〜の恩恵を受ける）
- **目的語 (O2)**: the partition on the date column（日付列上のパーティション分割）
- **文型**: SVO and SV（並列）
- **注目ポイント**: `one ~ at a time` = 「1つずつ」。クラスタリングの効果を具体的に説明

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| eliminate | 動詞 | 除去する、排除する | Clustering eliminates unnecessary partition scans. |
| partition | 名詞 | パーティション、区画 | Snowflake stores data in micro-partitions. |
| redistribute | 動詞 | 再配置する、再分配する | The clustering key redistributes data into new micro-partitions. |
| predicate | 動詞/名詞 | 述語として使用する / 述語 | Queries that predicate on the date column benefit most. |
| benefit from ~ | 句動詞 | 〜の恩恵を受ける | Reports benefit from clustering on the date column. |
| one ~ at a time | 副詞句 | 1つずつ、1度に1つ | The report accesses one day at a time. |

## 3-3. 解説文（日本語）

> 特定の列でテーブルをクラスタリングすると、クエリ処理から不要なパーティションを除去することでクエリを最適化できます。クラスタリングキーを定義することでテーブルを再クラスタリングできます。これにより、クラスタリングキーに従ってデータがマイクロパーティションに効果的に再配置され、クラスタリングされた列を述語またはJOINで使用するクエリへの最適なアクセスが確保されます。トランザクション日付でテーブルをクラスタリングすることが最も効率的な選択肢です。日次レポートは1日分ずつデータにアクセスするため、日付列でのパーティション分割の恩恵を最大限に受けられます。

---

## 復習メモ

- [ ] クラスタリングキーがどのようにパーティションプルーニングを改善するか理解した
- [ ] ウェアハウスサイズアップとクラスタリングの違いを説明できる
- [ ] 英語の文法ポイント（by + 動名詞 / one ~ at a time）を確認した
- [ ] サンドボックスでクラスタリングキーの設定を検証した（任意）
