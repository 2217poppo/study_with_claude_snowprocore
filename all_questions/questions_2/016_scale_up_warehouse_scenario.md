# 016: Scale Up Warehouse Scenario

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-09
**正答**: The virtual warehouse is executing complex queries and processing large volumes of data.

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Scale Up（スケールアップ） | 仮想ウェアハウスのサイズを大きくすること（例: X-Small → Large）。**複雑なクエリ・CPU集約的なクエリ・大量データ処理**のパフォーマンス向上に有効。同時ユーザー/クエリ数の増加には無効 |
| Scale Out（スケールアウト） | Multi-Cluster Virtual Warehouseでクラスター数を増やすこと。**同時ユーザー数・同時クエリ数が多い場合（コンカレンシー問題）** に有効 |
| Multi-Cluster Virtual Warehouse（マルチクラスターWH） | 同時接続ユーザー数や処理需要に応じてクラスター数を自動追加・削除できるウェアハウス。Enterprise以上のエディションで利用可能 |
| CPU-Intensive Query（CPU集約的クエリ） | 大量データスキャン・複雑な集計・JOINなど、多くのCPUリソースを必要とするクエリ。スケールアップの恩恵を最も受けるクエリ種別 |
| Concurrent Queries（同時実行クエリ） | 同じウェアハウスで同時に実行されるクエリ。リソース不足時はキューイングが発生する |

## 1-2. 重要コンセプトまとめ

- **スケールアップ vs スケールアウトの使い分け**（最頻出の対比ポイント）:

| 問題の種類 | 解決策 | 方法 |
|---|---|---|
| **複雑なクエリ・大量データ** | Scale Up | WHサイズを大きくする |
| **同時ユーザー/クエリが多い** | Scale Out | Multi-Cluster WHでクラスター追加 |

- **スケールアップが有効な場面**: 複雑なクエリ、CPU集約的処理、大量データのスキャン・処理
- **スケールアップが無効な場面**: 同時実行クエリ数やユーザー数が多い場合 → これはスケールアウト（Multi-Cluster WH）で対応
- **ひっかけ選択肢**: 「外部テーブルへのアクセス」「5テーブル以上のアクセス」はスケールアップの適用判断基準ではない
- **キーワードで判断**: `complex queries`・`large volumes`・`CPU-intensive` → スケールアップ / `concurrent users`・`concurrent queries` → スケールアウト

## 1-3. 公式ドキュメントURL

- [Warehouse Considerations](https://docs.snowflake.com/en/user-guide/warehouses-considerations)
- [Multi-cluster Warehouses](https://docs.snowflake.com/en/user-guide/warehouses-multicluster)

---

## 2-1. 問題文（英語）

> For which of the following scenarios scaling up a virtual warehouse is a good option?
>
> A. The query is accessing an external table.
> B. A query is accessing more than 5 tables.
> C. There are more active concurrent queries than the current virtual warehouse can handle.
> D. The virtual warehouse is executing complex queries and processing large volumes of data.

## 2-2. 問題文の文法解析

### 文1: "For which of the following scenarios scaling up a virtual warehouse is a good option?"

- **前置詞句 (M)**: For which of the following scenarios（次のシナリオのうちどれにおいて）
- **主語 (S)**: scaling up a virtual warehouse（仮想ウェアハウスのスケールアップは）— 動名詞句
- **動詞 (V)**: is（〜である）
- **補語 (C)**: a good option（良い選択肢）
- **文型**: SVC（疑問文）
- **注目ポイント**:
  - `scaling up` — 動名詞が主語。「スケールアップすること」
  - `For which of ~` — 「〜のうちどれにおいて」。前置詞 `for` が文頭に出た疑問文
  - `a good option` — 「良い選択肢」。正解の判断基準が「可能か不可か」ではなく「良い選択か」

### 選択肢D: "The virtual warehouse is executing complex queries and processing large volumes of data."

- **主語 (S)**: The virtual warehouse（仮想ウェアハウスが）
- **動詞1 (V)**: is executing（実行している）— 現在進行形
- **目的語1 (O)**: complex queries（複雑なクエリを）
- **動詞2 (V)**: processing（処理している）
- **目的語2 (O)**: large volumes of data（大量のデータを）
- **文型**: SVO and VO（進行形の並列）
- **注目ポイント**: `complex queries` と `large volumes of data` — スケールアップが有効であることを示すキーワード

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| scaling up | 動名詞 | スケールアップすること（サイズ拡大） | Scaling up improves performance for complex queries. |
| scenario | 名詞 | シナリオ、場面、状況 | For which scenario is scaling up recommended? |
| concurrent queries | 名詞 | 同時実行クエリ | Concurrent queries require scaling out, not up. |
| complex queries | 名詞 | 複雑なクエリ | Complex queries benefit from a larger warehouse. |
| large volumes of data | 名詞句 | 大量のデータ | Processing large volumes of data requires more compute. |

## 2-3. 問題文（日本語）

> 次のシナリオのうち、仮想ウェアハウスのスケールアップが良い選択肢となるのはどれですか？
>
> A. クエリが外部テーブルにアクセスしている。
> B. クエリが5つ以上のテーブルにアクセスしている。
> C. 現在の仮想ウェアハウスが処理できる以上のアクティブな同時実行クエリがある。
> D. 仮想ウェアハウスが複雑なクエリを実行し、大量のデータを処理している。

---

## 3-1. 解説文（英語）

> Based on the complexity of the queries and the desired performance, a virtual warehouse can be scaled up or down. In general, increasing the virtual warehouse size improves query speed for CPU-intensive queries. On the other hand, scaling up is ineffective when dealing with a high number of concurrent users or queries. A multi-cluster virtual warehouse (scaling out) accommodates an increased number of concurrent users and queries.

## 3-2. 解説文の文法解析

### 文1: "Based on the complexity of the queries and the desired performance, a virtual warehouse can be scaled up or down."

- **分詞句 (M)**: Based on the complexity of the queries and the desired performance（クエリの複雑さと求められるパフォーマンスに基づいて）
- **主語 (S)**: a virtual warehouse（仮想ウェアハウスは）
- **動詞 (V)**: can be scaled up or down（スケールアップまたはスケールダウンできる）
- **文型**: SV（受動態）
- **注目ポイント**:
  - `Based on ~` — 「〜に基づいて」。判断基準を示す分詞句。文頭に配置
  - `scaled up or down` — 「アップまたはダウン」。対になる方向を `or` で接続

### 文2: "In general, increasing the virtual warehouse size improves query speed for CPU-intensive queries."

- **修飾語 (M)**: In general（一般的に）
- **主語 (S)**: increasing the virtual warehouse size（仮想ウェアハウスのサイズを増やすことは）— 動名詞句
- **動詞 (V)**: improves（改善する）
- **目的語 (O)**: query speed（クエリ速度を）
- **修飾語 (M)**: for CPU-intensive queries（CPU集約的なクエリに対して）
- **文型**: SVO
- **注目ポイント**:
  - `In general` — 「一般的に」。例外がありうることを含意しつつ一般則を述べる
  - `CPU-intensive` — ハイフンで結ばれた複合形容詞。「CPUを多用する」

### 文3: "On the other hand, scaling up is ineffective when dealing with a high number of concurrent users or queries."

- **接続表現 (M)**: On the other hand（一方で）— 前文との対比
- **主語 (S)**: scaling up（スケールアップは）
- **動詞 (V)**: is（〜である）
- **補語 (C)**: ineffective（効果がない）
- **修飾節 (M)**: when dealing with a high number of concurrent users or queries（多数の同時ユーザーやクエリを扱うとき）
- **文型**: SVC + when節
- **注目ポイント**:
  - `On the other hand` — 「一方で」。前文と対比する接続表現
  - `ineffective` — 「効果がない」。`in-`（否定接頭辞）+ `effective`
  - `a high number of ~` — 「多数の〜」。`many` よりフォーマルな数量表現

### 文4: "A multi-cluster virtual warehouse (scaling out) accommodates an increased number of concurrent users and queries."

- **主語 (S)**: A multi-cluster virtual warehouse（マルチクラスター仮想ウェアハウスは）
- **同格 (M)**: (scaling out)（スケールアウト）— 括弧で補足
- **動詞 (V)**: accommodates（対応する・受け入れる）
- **目的語 (O)**: an increased number of concurrent users and queries（増加した同時ユーザー数とクエリ数を）
- **文型**: SVO
- **注目ポイント**:
  - `accommodates` — 「対応する、受け入れる」。増加した需要に応えることを表す重要動詞
  - `an increased number of ~` — 「増加した数の〜」。過去分詞 `increased` が `number` を修飾

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| based on | 前置詞句 | 〜に基づいて | Based on query complexity, choose the warehouse size. |
| in general | 副詞句 | 一般的に | In general, larger warehouses process data faster. |
| CPU-intensive | 形容詞 | CPU集約的な | CPU-intensive queries benefit from scaling up. |
| ineffective | 形容詞 | 効果がない | Scaling up is ineffective for concurrency issues. |
| accommodate | 動詞 | 対応する、受け入れる | Multi-cluster warehouses accommodate more users. |
| an increased number of | 名詞句 | 増加した数の〜 | Scaling out handles an increased number of queries. |

## 3-3. 解説文（日本語）

> クエリの複雑さと求められるパフォーマンスに基づいて、仮想ウェアハウスはスケールアップまたはスケールダウンが可能です。一般的に、仮想ウェアハウスのサイズを大きくすることで、CPU集約的なクエリの速度が向上します。一方で、多数の同時ユーザーやクエリを扱う場合、スケールアップは効果がありません。マルチクラスター仮想ウェアハウス（スケールアウト）が、増加した同時ユーザー数やクエリ数に対応します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
