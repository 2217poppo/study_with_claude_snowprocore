# 047: Warehouse Compute Cost

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-13
**正答**: A, C

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Compute Cost（コンピュートコスト） | ウェアハウスの稼働時間とサイズに基づいて発生する費用。Resumed（稼働中）の間のみ課金。Suspended中は無料 |
| Virtual Warehouse Size | ウェアハウスの処理能力を決めるサイズ。X-Small〜6X-Largeまで。サイズが大きいほどノード数が多くクレジット消費も多い |
| Resumed State（稼働状態） | ウェアハウスがアクティブで課金が発生する状態。クエリ実行の有無に関係なく課金される |
| Suspended State（停止状態） | ウェアハウスが休止中の状態。課金は発生しない |
| Directly Proportional（正比例） | コストがサイズに正比例する関係。サイズが2倍ならコストも2倍 |

## 1-2. 重要コンセプトまとめ

- コンピュートコストを決める要素は **2つだけ**:
  1. **ウェアハウスのサイズ**（大きいほど高い）
  2. **稼働時間（duration）**（長いほど高い）
- コストに **影響しないもの**:
  - クエリの実行数（number of queries）
  - ユーザー数（number of users）
- ただし例外: **Multi-Cluster WHの場合**、ユーザー/クエリの同時実行数が増えると追加クラスターが起動し、結果的にコスト増加
- コストは `サイズ × 稼働時間` で決まる（正比例）
- ウェアハウスが稼働中（resumed）であれば、クエリを実行していなくても課金される

## 1-3. 公式ドキュメントURL

- [Understanding Compute Cost](https://docs.snowflake.com/en/user-guide/cost-understanding-compute)

---

## 2-1. 問題文（英語）

> The compute cost for a virtual warehouse is determined based on which of the following. Select all that apply.
>
> A. The size of the virtual warehouse.
> B. The number of queries executed by the virtual warehouse.
> C. The duration for which the virtual warehouse was running.
> D. The number of users serviced by the virtual warehouse.

## 2-2. 問題文の文法解析

### 文1: "The compute cost for a virtual warehouse is determined based on which of the following."

- **主語 (S)**: The compute cost for a virtual warehouse
- **動詞 (V)**: is determined（受動態）
- **修飾語 (M)**: based on which of the following（根拠）
- **文型**: SV（受動態）
- **注目ポイント**: `is determined based on ~` は「～に基づいて決定される」。`which of the following` で選択肢から選ぶ形式。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| determine | verb | 決定する | Cost is determined by size and duration. |
| based on ~ | phrase | ～に基づいて | Determined based on the warehouse size. |
| duration | noun | 期間、持続時間 | The duration for which it was running. |
| service | verb | サービスを提供する | Users serviced by the warehouse. |

## 2-3. 問題文（日本語）

> 仮想ウェアハウスのコンピュートコストは以下のどれに基づいて決定されますか？該当するものをすべて選んでください。
>
> A. 仮想ウェアハウスのサイズ
> B. 仮想ウェアハウスが実行したクエリの数
> C. 仮想ウェアハウスが稼働していた期間
> D. 仮想ウェアハウスがサービスを提供したユーザーの数

---

## 3-1. 解説文（英語）

> Virtual warehouses in a resumed (active) state contribute to the costs. The cost incurred is directly proportional to the size of the virtual warehouse. For example, a larger virtual warehouse running for the same time as a smaller virtual warehouse will cost more. The number of queries and users does not impact the virtual warehouse cost. (However, in the case of a multicluster virtual warehouse, a higher user/query concurrency might spin up additional virtual warehouses that add to the costs).

## 3-2. 解説文の文法解析

### 文1: "Virtual warehouses in a resumed (active) state contribute to the costs."

- **主語 (S)**: Virtual warehouses in a resumed (active) state
- **動詞 (V)**: contribute to
- **目的語 (O)**: the costs
- **文型**: SVO
- **注目ポイント**: `contribute to ~` は「～に貢献する、～の原因となる」。`in a resumed state` が「稼働状態にある」という条件を限定。

### 文2: "The cost incurred is directly proportional to the size of the virtual warehouse."

- **主語 (S)**: The cost incurred（過去分詞の後置修飾）
- **動詞 (V)**: is
- **補語 (C)**: directly proportional to the size
- **文型**: SVC
- **注目ポイント**: `directly proportional to ~` は「～に正比例する」。数学的な関係を述べる定番表現。`incurred` は「発生した」で cost を修飾。

### 文3: "The number of queries and users does not impact the virtual warehouse cost."

- **主語 (S)**: The number of queries and users
- **動詞 (V)**: does not impact
- **目的語 (O)**: the virtual warehouse cost
- **文型**: SVO
- **注目ポイント**: 明確な否定文で「影響しない」と断言。ひっかけ選択肢を排除する根拠。

### 文4: "(However, in the case of a multicluster virtual warehouse, a higher user/query concurrency might spin up additional virtual warehouses that add to the costs)."

- **主語 (S)**: a higher user/query concurrency
- **動詞 (V)**: might spin up
- **目的語 (O)**: additional virtual warehouses
- **修飾語 (M)**: However（逆接）、in the case of a multicluster virtual warehouse（条件）、that add to the costs（関係詞節）
- **文型**: SVO
- **注目ポイント**: `might` で可能性を示唆。`spin up` は「起動する」の口語的表現。括弧内の補足で例外ケースを説明。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| incurred | adjective | 発生した | The cost incurred is proportional to size. |
| directly proportional to ~ | phrase | ～に正比例する | Cost is directly proportional to warehouse size. |
| impact | verb | 影響を与える | Query count does not impact cost. |
| spin up | phrasal verb | 起動する | Concurrency might spin up additional warehouses. |
| concurrency | noun | 同時実行数 | Higher concurrency adds to costs. |

## 3-3. 解説文（日本語）

> 稼働中（アクティブ）状態の仮想ウェアハウスがコストに寄与します。発生するコストは仮想ウェアハウスのサイズに正比例します。例えば、大きな仮想ウェアハウスが小さな仮想ウェアハウスと同じ時間稼働した場合、より多くのコストがかかります。クエリ数やユーザー数はウェアハウスのコストに影響しません。（ただし、マルチクラスターウェアハウスの場合、ユーザー/クエリの同時実行数が高まると追加のウェアハウスが起動し、コストが増加する可能性があります。）

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
