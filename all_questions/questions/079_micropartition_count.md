# 079: Micro-Partition Count for Large Tables

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-03
**正答**: C（Millions or hundreds of millions）

> 関連問題: 035（Clustering Keys）・062（Partition Pruning）・077（Clustering Depth）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Micro-Partition（マイクロパーティション） | Snowflakeがデータを内部的に分割する単位。各パーティションは**50〜500MBの非圧縮データ**を含む。データは自動的にマイクロパーティションに分割・圧縮して格納される |
| Micro-Partition Count（マイクロパーティション数） | テーブルが持つマイクロパーティションの総数。テーブルのデータ量に主に依存する。大規模テーブルでは**数百万〜数億個**になることがある |

## 1-2. 重要コンセプトまとめ

- **マイクロパーティション数はデータ量に依存**:
  - 小さいテーブル → 数個〜数百個
  - 大きいテーブル → **数百万（millions）〜数億（hundreds of millions）個**

- **マイクロパーティションの基本仕様**（復習）:
  - サイズ: 50〜500MB（非圧縮）
  - 自動で作成・管理される（ユーザーが定義しない）
  - 列の最大/最小値などのメタデータを保持 → パーティションプルーニングに使用

- **試験のポイント**: `millions or hundreds of millions` という大きな数値を覚える。「数百（Hundreds）」「数十（Tens）」では規模が小さすぎる

## 1-3. 公式ドキュメントURL

- [Micro-partitions & Data Clustering](https://docs.snowflake.com/en/user-guide/tables-clustering-micropartitions)

---

## 2-1. 問題文（英語）

> Large tables can have ___________ micro-partitions.
>
> A. Hundreds
> B. Tens
> C. Millions or hundreds of millions

## 2-2. 問題文の文法解析

### 文1: "Large tables can have ___________ micro-partitions."

- **主語 (S)**: Large tables（大きいテーブルは）
- **動詞 (V)**: can have（持つことができる）
- **目的語 (O)**: ___________ micro-partitions（〜個のマイクロパーティションを）← 空欄補充問題
- **注目ポイント**: 空欄補充（fill-in-the-blank）形式の問題。`can have` = 「〜を持つことができる・〜になりうる」で上限や規模を示す

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| hundreds of millions | 数量表現 | 数億 | Tables can have hundreds of millions of micro-partitions. |
| millions | 数量表現 | 数百万 | A large table can have millions of micro-partitions. |
| fill-in-the-blank | 問題形式 | 空欄補充問題 | Complete the sentence: Large tables can have ___ micro-partitions. |

## 2-3. 問題文（日本語）

> 大きいテーブルは ________ 個のマイクロパーティションを持つことができる。
>
> A. 数百個
> B. 数十個
> C. 数百万〜数億個

---

## 3-1. 解説文（英語）

> The number of micro-partitions for a given table depends mainly on the amount of data in that table. For a very large table, the number of micro-partitions can run into millions or hundreds of millions of micro-partitions.

## 3-2. 解説文の文法解析

### 文1: "The number of micro-partitions for a given table depends mainly on the amount of data in that table."

- **主語 (S)**: The number of micro-partitions for a given table（特定のテーブルのマイクロパーティション数は）
- **動詞 (V)**: depends mainly on（主に〜に依存する）← `depend on ~` = 「〜に依存する・〜によって決まる」
- **目的語**: the amount of data in that table（そのテーブル内のデータ量）
- **注目ポイント**: `depends mainly on ~` = 「主に〜に依存する」。`mainly` で「主要因」を強調しながら他の要因も排除しない表現

### 文2: "For a very large table, the number of micro-partitions can run into millions or hundreds of millions of micro-partitions."

- **修飾語**: For a very large table（非常に大きいテーブルでは）
- **主語 (S)**: the number of micro-partitions（マイクロパーティション数は）
- **動詞 (V)**: can run into（〜に達することがある）← `run into ~` = 「〜の数に達する・〜に至る」
- **目的語**: millions or hundreds of millions（数百万または数億）
- **注目ポイント**: `run into ~` = 「〜に達する」。数量が大きな数に達することを示す句動詞。`reach ~` と同義だが技術文書でよく使われる

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| depend mainly on ~ | 動詞句 | 主に〜に依存する | The count depends mainly on the amount of data. |
| a given table | 名詞句 | 特定のテーブル | The micro-partition count for a given table varies. |
| run into ~ | 句動詞 | 〜の数に達する | The count can run into millions of micro-partitions. |
| hundreds of millions | 数量表現 | 数億 | Large tables can have hundreds of millions of partitions. |

## 3-3. 解説文（日本語）

> 特定のテーブルのマイクロパーティション数は、主にそのテーブル内のデータ量に依存します。非常に大きいテーブルでは、マイクロパーティション数が数百万または数億個に達することがあります。

---

## 復習メモ

- [ ] 大きいテーブルのマイクロパーティション数は「数百万〜数億個（millions or hundreds of millions）」であることを覚えた
- [ ] マイクロパーティション数はデータ量に主に依存することを確認した
- [ ] `run into ~`（〜の数に達する）・`depends mainly on ~`（主に〜に依存する）の英語パターンを確認した
- [ ] この問題は理論問題のためサンドボックス検証は不要
