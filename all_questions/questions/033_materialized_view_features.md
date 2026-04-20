# 033: Materialized View Features

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-02
**正答**: A, B, C（3つ・完全正解）
- A. A Snowflake service that is invisible to users automatically maintains materialized views in the background.（**選択済み・正解**）
- B. Materialized views are used to boost query performance. They pre-compute query results and physically store them.（**選択済み・正解**）
- C. A materialized view can provide pre-computed answers, enabling some queries to be answered faster.（**選択済み・正解**）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Materialized View（マテリアライズドビュー） | SELECTクエリの結果を事前計算して物理的に保存するビュー。ベーステーブルの更新時に自動リフレッシュされる |
| Pre-compute（事前計算） | クエリが実行される前に結果を計算・保存しておくこと。クエリ実行時にゼロから計算しなくて済む |
| Background Maintenance（バックグラウンドメンテナンス） | ユーザーの操作を妨げることなく、Snowflakeが自動でMVを更新する仕組み |
| Transparent to users（ユーザーへの透明性） | ユーザーが意識しなくても自動で行われる処理。Q007の暗号化キー管理と同じ概念 |

## 1-2. 重要コンセプトまとめ

- **MVの3つの特性**（今回の問題の3選択肢）:
  1. **バックグラウンド自動メンテナンス** — Snowflakeの内部サービスがユーザーに見えないところで更新
  2. **クエリ結果の事前計算・物理保存** — 実行時の計算コストをゼロに
  3. **クエリの高速化** — 事前計算済みの答えを返すので類似クエリが速い

- **Q008 との関連と補完**:
  | Q008 で学んだこと | Q033 で補完した内容 |
  |-----------------|------------------|
  | 自動リフレッシュ | 「ユーザーに不可視のサービス」が実施 |
  | パフォーマンス向上が目的 | 「事前計算結果を物理保存」の具体的なメカニズム |
  | JOINは含められない | （今回は問われず） |

- **「transparent to the user」と「without interfering」**（Q007・Q026でも登場）:
  - Snowflakeのバックグラウンド処理の説明で繰り返し使われる表現
  - MVの自動更新・暗号化キーローテーション・ストレージ管理、いずれも「ユーザーは何もしなくていい」

- **試験ポイント**: 「ユーザーが手動でメンテナンスする必要はない」「自動でバックグラウンド更新される」→ 正しい記述

## 1-3. 公式ドキュメントURL

- [Working with Materialized Views](https://docs.snowflake.com/en/user-guide/views-materialized)

---

## 2-1. 問題文（英語）

> Which of the following statements about Materialized Views is correct? Choose all that apply.
>
> A. A Snowflake service that is invisible to users automatically maintains materialized views in the background.
> B. Materialized views are used to boost query performance. They pre-compute query results and physically store them.
> C. A materialized view can provide pre-computed answers, enabling some queries to be answered faster.

## 2-2. 問題文の文法解析

### 選択肢A: "A Snowflake service that is invisible to users automatically maintains materialized views in the background."

- **主語 (S)**: A Snowflake service that is invisible to users
- **副詞**: automatically
- **動詞 (V)**: maintains
- **目的語 (O)**: materialized views
- **修飾語 (M)**: in the background
- **関係代名詞節**: that is invisible to users（「ユーザーには見えない」）
- **注目ポイント**:
  - 「invisible to users」= 「ユーザーには見えない」。透明性を示す形容詞句
  - 「in the background」= 「バックグラウンドで」。フォアグラウンド（ユーザー操作）と対比

### 選択肢C: "A materialized view can provide pre-computed answers, enabling some queries to be answered faster."

- **主語 (S)**: A materialized view
- **動詞 (V)**: can provide
- **目的語 (O)**: pre-computed answers
- **分詞構文（結果）**: enabling some queries to be answered faster
- **注目ポイント**:
  - 「enabling ~ to be answered」は `enable O to do` の受動態形。「〜が答えられることを可能にする」
  - 「faster」は比較級の副詞。「より速く」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| invisible to ~ | adjective phrase | 〜には見えない | The service is invisible to users. |
| in the background | adverb phrase | バックグラウンドで | Snowflake maintains MVs in the background. |
| boost | verb | 向上させる、強化する | MVs are used to boost query performance. |
| pre-compute | verb | 事前に計算する | MVs pre-compute query results. |
| enabling ~ to do | 分詞構文 | 〜が〜できるようにして（結果） | Pre-computing answers, enabling queries to run faster. |

## 2-3. 問題文（日本語）

> マテリアライズドビューに関して正しい記述はどれですか？該当するものをすべて選びなさい。
>
> A. ユーザーには見えないSnowflakeのサービスが、バックグラウンドでマテリアライズドビューを自動的にメンテナンスする。
> B. マテリアライズドビューはクエリのパフォーマンスを向上させるために使われる。クエリの結果を事前計算して物理的に保存する。
> C. マテリアライズドビューは事前計算された答えを提供でき、一部のクエリをより速く処理できるようにする。

---

## 3-1. 解説文（英語）

> All these statements are correct. A materialized view is a view that pre-computes data based on a SELECT query. The query's results are pre-computed and physically stored to enhance performance for similar queries that are executed in the future. When the underlying table is updated, the materialized view refreshes automatically, requiring no additional maintenance. Snowflake-managed services perform the update in the background transparent to the user without interfering with the user's experience.

## 3-2. 解説文の文法解析

### 文1〜2: "A materialized view is a view that pre-computes data based on a SELECT query. The query's results are pre-computed and physically stored to enhance performance for similar queries that are executed in the future."

- **文1**: MV の定義（SVC + 関係詞節）
- **文2**:
  - 主語: The query's results
  - 動詞: are pre-computed and physically stored（受動態の並列）
  - 目的: to enhance performance for similar queries（不定詞）
  - クエリの修飾: that are executed in the future
- **注目ポイント**:
  - 「based on a SELECT query」= 「SELECTクエリに基づいて」
  - 「physically stored」の physically は「物理的に（ディスクに実体として）」。Query Result Cache（一時的）との区別
  - 「for similar queries that are executed in the future」= 「将来実行される類似クエリのために」

### 文3〜4: "When the underlying table is updated, the materialized view refreshes automatically, requiring no additional maintenance. Snowflake-managed services perform the update in the background transparent to the user without interfering with the user's experience."

- **文3**:
  - 条件節: When the underlying table is updated
  - 主節: the materialized view refreshes automatically
  - 付帯状況: requiring no additional maintenance
- **文4**:
  - 主語: Snowflake-managed services
  - 動詞: perform
  - 目的語: the update
  - 修飾: in the background transparent to the user without interfering with the user's experience
- **注目ポイント**:
  - 「requiring no additional maintenance」= 「追加のメンテナンスを必要とせず」。否定の付帯状況
  - 「transparent to the user」= 「ユーザーには透明（意識不要）」（Q007でも登場）
  - 「without interfering with the user's experience」= 「ユーザー体験を妨げることなく」（Q007でも登場）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| underlying table | noun phrase | ベーステーブル、元のテーブル | When the underlying table changes, the MV refreshes. |
| refreshes automatically | 動詞句 | 自動的に更新される | The materialized view refreshes automatically. |
| requiring no additional maintenance | 分詞構文 | 追加のメンテナンスを必要とせず | It updates automatically, requiring no additional maintenance. |
| Snowflake-managed services | noun phrase | Snowflakeが管理するサービス（内部サービス） | Snowflake-managed services perform the update. |

## 3-3. 解説文（日本語）

> これらの記述はすべて正しいです。マテリアライズドビューは、SELECTクエリに基づいてデータを事前計算するビューです。クエリの結果は事前計算され、物理的に保存されます。これにより、将来実行される類似クエリのパフォーマンスが向上します。ベーステーブルが更新されると、マテリアライズドビューは自動的にリフレッシュされ、追加のメンテナンスは不要です。Snowflakeが管理するサービスがバックグラウンドで更新を実行し、ユーザーには透明で、ユーザー体験を妨げることもありません。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
