# 070: Clustering Key Indicators

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-13
**正答**: A, B

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Clustering Key（クラスタリングキー） | テーブルのデータを物理的に整列させるために指定する列。パーティションプルーニングの効果を最大化 |
| Clustering Depth（クラスタリング深度） | テーブルのクラスタリング状態を示す指標。深度が大きいほどクラスタリングが不良。SYSTEM$CLUSTERING_DEPTH関数で確認 |
| Multi-Terabyte Table | 数テラバイト規模の大規模テーブル。クラスタリングキーが有効になるサイズの目安 |
| Query Performance Degradation | クエリパフォーマンスが時間とともに低下する現象。データ増加によるクラスタリング不良が原因の可能性 |

## 1-2. 重要コンセプトまとめ

- クラスタリングキーが必要な**指標（4つ）**:
  1. **テーブルが数テラバイト規模**（大量データ）
  2. **クエリが予想より遅い**
  3. **クエリパフォーマンスが時間とともに悪化**
  4. **クラスタリング深度が大きい**
- クラスタリングキーが**不要**な場合:
  - 列数が多い → 列数はクラスタリングとは無関係（行の物理配置が重要）
  - テーブルが小さい（数GB以下）
- クラスタリングは**行の物理的な配置**に関する最適化であり、**列の数**は関係ない
- 時間経過でパフォーマンスが悪化 = DMLによりデータが挿入・更新されてクラスタリングが崩れている可能性

## 1-3. 公式ドキュメントURL

- [Clustering Keys & Clustered Tables](https://docs.snowflake.com/en/user-guide/tables-clustering-keys)

---

## 2-1. 問題文（英語）

> What are some general indicators that a clustering key is required on a table? Select all that apply.
>
> A. The size of the table is multi-terabytes.
> B. The query performance has slowed down over time.
> C. The table has a large number of columns.

## 2-2. 問題文の文法解析

### 文1: "What are some general indicators that a clustering key is required on a table?"

- **主語 (S)**: What
- **動詞 (V)**: are
- **補語 (C)**: some general indicators that a clustering key is required on a table
- **文型**: SVC（疑問文）
- **注目ポイント**: `indicators that ~` の `that` は同格のthat節で「～という指標」。`is required` は受動態で「必要とされる」。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| indicator | noun | 指標、兆候 | Indicators that a clustering key is needed. |
| multi-terabytes | noun | 数テラバイト | The table size is multi-terabytes. |
| slowed down over time | phrase | 時間とともに遅くなった | Performance has slowed down over time. |
| clustering depth | noun | クラスタリング深度 | A large clustering depth. |

## 2-3. 問題文（日本語）

> テーブルにクラスタリングキーが必要であることを示す一般的な指標は何ですか？該当するものをすべて選んでください。
>
> A. テーブルのサイズが数テラバイトである。
> B. クエリパフォーマンスが時間とともに低下している。
> C. テーブルの列数が多い。

---

## 3-1. 解説文（英語）

> The following indicators can help determine if a clustering key may be needed.
> · The table has large volumes of data (e.g., multiple terabytes)
> · Queries on the table are running slower than expected.
> · Query performance has gotten worse over time.
> · The table has a large clustering depth

## 3-2. 解説文の文法解析

### 文1: "The following indicators can help determine if a clustering key may be needed."

- **主語 (S)**: The following indicators
- **動詞 (V)**: can help determine
- **目的語 (O)**: if a clustering key may be needed（名詞節）
- **文型**: SVO
- **注目ポイント**: `help determine` は `help (to) determine` の省略形。`if ~ may be needed` で「～が必要かもしれないかどうか」。

### 箇条書き項目の文法:

- "The table has large volumes of data" — `large volumes of ~` は「大量の～」
- "Queries on the table are running slower than expected" — `slower than expected` は「予想より遅い」
- "Query performance has gotten worse over time" — `has gotten worse` は現在完了で「悪くなってきた」。`over time` は「時間とともに」
- "The table has a large clustering depth" — クラスタリング深度が大きい = クラスタリング不良

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| large volumes of ~ | phrase | 大量の～ | Large volumes of data. |
| slower than expected | phrase | 予想より遅い | Running slower than expected. |
| has gotten worse over time | phrase | 時間とともに悪化した | Performance has gotten worse over time. |
| clustering depth | noun | クラスタリング深度 | A large clustering depth. |

## 3-3. 解説文（日本語）

> 以下の指標が、クラスタリングキーが必要かどうかを判断するのに役立ちます。
> - テーブルに大量のデータがある（例：数テラバイト）
> - テーブルのクエリが予想より遅く実行されている
> - クエリパフォーマンスが時間とともに悪化している
> - テーブルのクラスタリング深度が大きい

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
