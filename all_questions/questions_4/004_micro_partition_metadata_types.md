# 004: Micro-Partition Metadata — What Is Tracked

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-17
**正答**: Count of distinct values for each column / Range of column values（Mean・Median・Mode と Maximum & minimum は不正解）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Micro-Partition Metadata（マイクロパーティションメタデータ） | Cloud Services Layerが各マイクロパーティションについて保持する統計情報。クエリ最適化（プルーニング）に使用される |
| Range of Column Values（列値の範囲） | 各マイクロパーティションの各列に含まれる**最大値と最小値**の情報。パーティションプルーニングに最も重要なメタデータ |
| Count of Distinct Values（個別値の数） | 各マイクロパーティションの各列に含まれる重複なしの値の数（COUNT DISTINCT相当）。クエリ最適化に活用される |
| Partition Pruning（パーティションプルーニング） | WHERE条件に合致しないマイクロパーティションをスキャン対象から除外する最適化技術。メタデータのRange情報を使って実現される |
| Cloud Services Layer | Snowflakeアーキテクチャの最上層。マイクロパーティションのメタデータを一元管理し、クエリ最適化・プルーニングを担当する |

## 1-2. 重要コンセプトまとめ

- **マイクロパーティションに記録されるメタデータ（試験頻出）**:
  1. **Range of column values** = 各列の最大値・最小値の範囲（これがプルーニングの根拠）
  2. **Count of distinct values** = 各列の個別値の数
  - 他にも行数・データサイズ等の情報があるが上記が主要な試験ポイント
- **記録されない情報（引っかけ選択肢）**:
  - Mean（平均）、Median（中央値）、Mode（最頻値） — **記録されない**
  - "Maximum & minimum of each column" — Rangeに含まれる概念だが、これは "Range of column values" として表現される（重複した選択肢扱い）
- **なぜRangeが重要か**:
  - `WHERE date_col = '2024-01-15'` というクエリ時、各パーティションのDate列Range（min: 2024-01-10, max: 2024-01-20）と比較してスキャン対象を絞り込む
  - クラスタリングキーはこのRangeを各パーティションで重複なく整理することでプルーニング効果を最大化する
- **Distinct countの活用**:
  - クエリオプティマイザーがJOINやGROUP BY戦略を選択する際の参考情報

## 1-3. 公式ドキュメントURL

- [Micro-partitions & Data Clustering](https://docs.snowflake.com/en/user-guide/tables-clustering-micropartitions)

---

## 2-1. 問題文（英語）

> What type of metadata is maintained for each micro-partition? Select all that apply.
>
> A. Mean, median & mode of each column
> B. Count of distinct values for each column ✓
> C. Range of column values ✓
> D. Maximum & minimum of each column

## 2-2. 問題文の文法解析

### 文1: "What type of metadata is maintained for each micro-partition?"

- **主語 (S)**: What type of metadata（どのような種類のメタデータが）
- **動詞 (V)**: is maintained（管理・保持されている / 受動態）
- **修飾語 (M)**: for each micro-partition（各マイクロパーティションに対して）
- **文型**: SV（受動態）
- **注目ポイント**:
  - `is maintained` = 受動態「維持・管理される」
  - `for each ~` = 「〜ごとに」（1つ1つに対して）

### 文2: "Select all that apply."

- **命令文**: Select（選択せよ）
- **関係詞節**: that apply（当てはまるもの）= that are applicable
- **注目ポイント**:
  - 複数正解を示す定番の試験用語
  - `apply` ここでは「当てはまる、適用される」の意味（申し込む、ではない）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| maintain | 動詞 | 維持する、管理する | Snowflake maintains metadata for each micro-partition. |
| distinct values | 名詞句 | 個別値（重複を除いた値） | Count of distinct values is tracked per partition. |
| range | 名詞 | 範囲（最大〜最小の幅） | The range of column values enables partition pruning. |
| apply | 動詞 | 当てはまる、適用される | Select all that apply = Select all correct answers. |

## 2-3. 問題文（日本語）

> 各マイクロパーティションに対して管理されているメタデータの種類はどれですか？すべて選択してください。
>
> A. 各列の平均・中央値・最頻値（Mean, Median & Mode）
> B. 各列の個別値の数（Count of distinct values）✓
> C. 列値の範囲（Range of column values）✓
> D. 各列の最大値・最小値（Maximum & minimum）

---

## 3-1. 解説文（英語）

> Snowflake stores the range of column values in its metadata: the maximum and the minimum value for each column in each micro-partition. Snowflake can intelligently decide which partitions to read when processing a query using this metadata. Additionally, Snowflake stores the count of distinct values for each column in each partition in the metadata and certain other information to assist in query optimization.
>
> https://docs.snowflake.com/en/user-guide/tables-clustering-micropartitions

## 3-2. 解説文の文法解析

### 文1: "Snowflake stores the range of column values in its metadata: the maximum and the minimum value for each column in each micro-partition."

- **主語 (S)**: Snowflake
- **動詞 (V)**: stores（保存する）
- **目的語 (O)**: the range of column values（列値の範囲）
- **場所の前置詞句**: in its metadata
- **コロン以降**: the maximum and the minimum value for each column in each micro-partition（各マイクロパーティション内の各列の最大値と最小値）
- **注目ポイント**:
  - コロン（:）= 前の内容を具体的に説明する記号
  - `range` の実体は「maximum + minimum」であることが明示されている

### 文2: "Snowflake can intelligently decide which partitions to read when processing a query using this metadata."

- **主語 (S)**: Snowflake
- **動詞 (V)**: can intelligently decide（インテリジェントに決定できる）
- **間接疑問**: which partitions to read（どのパーティションを読み取るか）
- **時間節**: when processing a query
- **手段**: using this metadata
- **注目ポイント**:
  - `intelligently` = インテリジェントに（単に「賢く」ではなくシステム的な最適化を意味）
  - `which + 名詞 + to 不定詞` = 「どの〜を〜すべきか」（間接疑問詞句の定番形式）

### 文3: "Additionally, Snowflake stores the count of distinct values for each column in each partition in the metadata and certain other information to assist in query optimization."

- **主語 (S)**: Snowflake
- **動詞 (V)**: stores（保存する）
- **目的語1 (O1)**: the count of distinct values for each column in each partition（各パーティションの各列の個別値の数）
- **目的語2 (O2)**: certain other information（その他の情報）
- **目的**: to assist in query optimization（クエリ最適化を支援するため）
- **注目ポイント**:
  - `Additionally` = 「さらに加えて」（追加情報の導入）
  - `certain other information` = 「ある種のその他の情報」（具体的に特定しない表現）
  - `assist in ~` = 「〜を支援する、〜に貢献する」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| intelligently | 副詞 | インテリジェントに、賢く | Snowflake intelligently decides which partitions to read. |
| which ~ to read | 間接疑問詞句 | どの〜を読み取るか | Snowflake determines which partitions to read. |
| certain other information | 名詞句 | ある種のその他の情報 | Snowflake also stores certain other information. |
| assist in | 動詞句 | 〜を支援する | Metadata assists in query optimization. |

## 3-3. 解説文（日本語）

> Snowflakeはメタデータに列値の範囲を保存しています。具体的には、各マイクロパーティション内の各列の最大値と最小値です。このメタデータを使用して、Snowflakeはクエリ処理時にどのパーティションを読み取るかをインテリジェントに判断できます。さらに、Snowflakeは各パーティション内の各列の個別値の数と、クエリ最適化を支援するための他の情報もメタデータに保存しています。

---

## 復習メモ

- [ ] Micro-partitionメタデータは「Range（=max/min）」と「Count of distinct values」が正解と覚えた
- [ ] Mean/Median/Modeは記録されない（引っかけ選択肢）と理解した
- [ ] `which partitions to read`（どのパーティションを読み取るか）という間接疑問詞句の構造を確認した
