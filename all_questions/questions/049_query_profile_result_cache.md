# 049: Query Profile — Identifying Query Result Cache Usage

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-03
**正答**: A・D（前回クエリ結果の再利用 / ウェアハウス不要）

> 関連問題: 002（Query Result Cache基本）・010（USE_CACHED_RESULTレベル）・048（キャッシュ再利用の全条件）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Query Profile（クエリプロファイル） | Snowsightで確認できるクエリの実行詳細ビュー。どのキャッシュが使われたか・CPU/IO・スピル量などを視覚化する。Query Result Cacheが使われた場合は特別な表示（"Results reused"）が出る |
| Query Result Cache（クエリ結果キャッシュ） | 過去に実行したクエリの結果を再利用する仕組み。使用時はウェアハウスが不要（課金なし） |
| Virtual Warehouse Cache（ウェアハウスキャッシュ） | 仮想ウェアハウスのローカルSSDに保存されるデータキャッシュ。ウェアハウスが稼働中の間、スキャンしたデータを保持する。Query Result Cacheとは**別物** |
| Metadata Cache（メタデータキャッシュ） | Cloud Services Layerが保持するテーブルのメタ情報（行数・最大/最小値等）のキャッシュ。`SELECT COUNT(*)` などの集計クエリがウェアハウスなしで完結する場合に使われる。Query Result Cacheとは**別物** |
| Predetermined amount of time（所定の時間） | Query Result Cacheの有効期間を表す表現。具体的には24時間（再利用のたびに延長・最大31日） |

## 1-2. 重要コンセプトまとめ

- **Query Result Cacheが使われた場合のQuery Profileの特徴**:
  1. **「前回クエリの結果が再利用された」と表示される**（正答A）
  2. **アクティブなウェアハウスが不要**（正答D）← 課金なし

- **3種類のキャッシュの区別（試験最頻出の引っかけ）**:

  | キャッシュ | 場所 | 用途 | WHが必要か |
  |-----------|------|------|-----------|
  | **Query Result Cache** | Cloud Services Layer | 同一クエリ結果の再利用 | **不要** |
  | **Virtual Warehouse Cache** | WH内のローカルSSD | スキャンデータの再利用 | **必要**（WH稼働中） |
  | **Metadata Cache** | Cloud Services Layer | COUNT等の集計 | **不要** |

- **選択肢B・Cが誤りの理由**:
  - B「ウェアハウスキャッシュ」→ Query Result CacheとWHキャッシュは別。WH不要なのでWHキャッシュは使われない
  - C「メタデータキャッシュ」→ メタデータキャッシュは集計系（COUNT等）に使われる。Query Result CacheとはQuery Profileの表示が異なる

- **試験ポイント**: Query Result CacheはWHが「不要」= 課金ゼロ。この特徴でWHキャッシュと区別できる

## 1-3. 公式ドキュメントURL

- [Using Persisted Query Results](https://docs.snowflake.com/en/user-guide/querying-persisted-results)

---

## 2-1. 問題文（英語）

> Which of the following correctly describes the query profile shown? Select all that apply.
>
> A. The query profile indicates that results produced by a previous query were reused.
> B. The query profile indicates that the virtual warehouse cache was used.
> C. The query profile indicates that the metadata cache was used.
> D. The query profile indicates that an active virtual warehouse was NOT required for this query.

## 2-2. 問題文の文法解析

### 文1: "Which of the following correctly describes the query profile shown?"

- **主語 (S)**: Which of the following（以下のうちどれが）
- **動詞 (V)**: correctly describes（正確に説明する）
- **目的語 (O)**: the query profile shown（表示されているクエリプロファイルを）← `shown` = 過去分詞後置修飾
- **文型**: SVO（疑問文）

### 選択肢A: "The query profile indicates that results produced by a previous query were reused."

- **主語 (S)**: The query profile
- **動詞 (V)**: indicates（示す・指示する）
- **目的語 (O)**: that results produced by a previous query were reused（前回のクエリによって生成された結果が再利用されたこと）← that節
- **内部**: results produced by a previous query（前回クエリで生成された結果）← `produced by ~` 過去分詞後置修飾
- **注目ポイント**: `indicate that ~` = 「〜であることを示す」。Query Profileが何かを表示・示している状況を表す

### 選択肢D: "The query profile indicates that an active virtual warehouse was NOT required for this query."

- **主語 (S)**: The query profile
- **動詞 (V)**: indicates
- **目的語 (O)**: that an active virtual warehouse was NOT required（アクティブな仮想ウェアハウスが必要ではなかった）← 受動態否定
- **注目ポイント**: `NOT required` = 「必要ではない」。Query Result Cache使用時の最大の特徴

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| indicate that ~ | 熟語 | 〜であることを示す | The profile indicates that the cache was used. |
| reuse / be reused | 動詞 | 再利用する/される | Query results were reused from a previous execution. |
| active | 形容詞 | アクティブな・稼働中の | An active virtual warehouse was not required. |
| predetermined | 形容詞 | あらかじめ定められた | Results are cached for a predetermined amount of time. |

## 2-3. 問題文（日本語）

> 表示されているクエリプロファイルを正確に説明しているものはどれですか？当てはまるものをすべて選択してください。
>
> A. クエリプロファイルは、前回のクエリで生成された結果が再利用されたことを示している。
> B. クエリプロファイルは、仮想ウェアハウスのキャッシュが使用されたことを示している。
> C. クエリプロファイルは、メタデータキャッシュが使用されたことを示している。
> D. クエリプロファイルは、このクエリにアクティブな仮想ウェアハウスが必要ではなかったことを示している。

---

## 3-1. 解説文（英語）

> When Snowflake runs a query, it caches the results of that query for a predetermined amount of time. The stored query results are referred to as the Query Result Cache. The Query Result Cache can be used to fulfill future queries if they are like a previously executed query & there have been no changes to the data in the tables being queried.

## 3-2. 解説文の文法解析

### 文1: "When Snowflake runs a query, it caches the results of that query for a predetermined amount of time."

- **時間節**: When Snowflake runs a query（Snowflakeがクエリを実行すると）
- **主語 (S)**: it（Snowflakeは）
- **動詞 (V)**: caches（キャッシュする）
- **目的語 (O)**: the results of that query（そのクエリの結果を）
- **修飾語 (M)**: for a predetermined amount of time（あらかじめ定められた時間の間）
- **注目ポイント**: `predetermined` = 「あらかじめ定められた」。期間が自動的に管理されることを示す

### 文2: "The stored query results are referred to as the Query Result Cache."

- **主語 (S)**: The stored query results（保存されたクエリ結果は）← `stored` = 過去分詞形容詞
- **動詞 (V)**: are referred to as（〜と呼ばれる）← 受動態
- **補語**: the Query Result Cache
- **注目ポイント**: `be referred to as ~` = 「〜と呼ばれる・〜と称される」。`be known as ~` と同義

### 文3: "The Query Result Cache can be used to fulfill future queries if they are like a previously executed query & there have been no changes to the data in the tables being queried."

- **主語 (S)**: The Query Result Cache
- **動詞 (V)**: can be used to fulfill（〜を満たすために使用できる）← 受動態 + 不定詞
- **目的**: future queries（将来のクエリを）
- **条件1**: if they are like a previously executed query（以前に実行されたクエリと似ている場合）
- **条件2**: there have been no changes to the data（データに変更がない場合）← there have been = 現在完了の there 構文
- **注目ポイント**: `fulfill a query` = 「クエリの要求を満たす・クエリに応答する」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| be referred to as ~ | 熟語受動態 | 〜と呼ばれる（= be known as ~） | Stored results are referred to as the Query Result Cache. |
| fulfill | 動詞 | 満たす、応答する | The cache can fulfill future queries. |
| previously executed | 形容詞句 | 以前に実行された | Results from a previously executed query are reused. |
| there have been no ~ | there構文 | 〜がなかった（変化がない状態） | There have been no changes to the data. |

## 3-3. 解説文（日本語）

> Snowflakeはクエリを実行すると、そのクエリの結果をあらかじめ定められた時間の間キャッシュします。保存されたクエリ結果はQuery Result Cacheと呼ばれます。Query Result Cacheは、以前に実行されたクエリと同じ内容のクエリがあり、クエリ対象のテーブルのデータに変更がない場合に、将来のクエリに応答するために使用できます。

---

## 復習メモ

- [ ] Query Result Cache使用時のQuery Profileの特徴（結果再利用・WH不要）を説明できる
- [ ] 3種類のキャッシュ（Result / WH / Metadata）の違いを整理した
- [ ] 英語の文法ポイント（indicate that / be referred to as / fulfill / there have been no ~）を確認した
- [ ] この問題は理論問題のためサンドボックス検証は不要
