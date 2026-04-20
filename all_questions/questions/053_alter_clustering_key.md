# 053: ALTER TABLE — Adding a Clustering Key to Existing Table

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-03
**正答**: B（ALTER TABLE ... CLUSTER BY を実行する）

> 関連問題: 035（Clustering Keys基本）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| ALTER TABLE ... CLUSTER BY | 既存テーブルにクラスタリングキーを追加・変更するDDL文。テーブルを再作成せずに実行できる最もシンプルな方法 |
| CLUSTER BY 句 | `CREATE TABLE` または `ALTER TABLE` に付加して、クラスタリングキーとする列を指定する句。例: `CLUSTER BY (Event_Date)` |
| Clustering Key（クラスタリングキー） | マイクロパーティションの整理に使う列（または列式）。特定列でのフィルタリング性能を向上させる。大規模テーブル（数TB〜）に特に有効 |
| DDL（Data Definition Language） | データ構造を定義・変更するSQL文の総称。CREATE・ALTER・DROP・RENAMEなど |
| Re-clustering（再クラスタリング） | クラスタリングキー定義後、Snowflakeが自動的にマイクロパーティションを再配置する処理 |

## 1-2. 重要コンセプトまとめ

- **既存テーブルへのクラスタリングキー追加は `ALTER TABLE` で完結**:
  ```sql
  ALTER TABLE events CLUSTER BY (Event_Date);
  ```
  これだけで完了。テーブルの再作成・データ移行は不要

- **不正解の選択肢（新テーブル作成 + データ移行）が誤りな理由**:
  - `CREATE TABLE events2 ... CLUSTER BY (Event_Date)` → 新テーブル作成
  - `INSERT INTO events2 SELECT * FROM events` → 5TB超のデータ移動 → **時間・コストが大きい**
  - `DROP TABLE events` → 元テーブル削除（リスク）
  - `ALTER TABLE events2 RENAME TO events` → リネーム
  - これらすべてを `ALTER TABLE` 1行で置き換えられる

- **`ALTER TABLE` でのクラスタリングキー操作一覧**:

  | 操作 | SQL |
  |------|-----|
  | キーの追加 | `ALTER TABLE t CLUSTER BY (col);` |
  | キーの変更 | `ALTER TABLE t CLUSTER BY (new_col);` |
  | キーの削除 | `ALTER TABLE t DROP CLUSTERING KEY;` |
  | 自動Re-clusteringの停止 | `ALTER TABLE t SUSPEND RECLUSTER;` |
  | 自動Re-clusteringの再開 | `ALTER TABLE t RESUME RECLUSTER;` |

- **試験ポイント**: 「既存テーブルへのクラスタリングキー追加」= `ALTER TABLE ... CLUSTER BY`。新テーブル作成は不要・非効率

## 1-3. 公式ドキュメントURL

- [ALTER TABLE — CLUSTER BY](https://docs.snowflake.com/en/sql-reference/sql/alter-table#clustering-actions-clusteringaction)
- [Clustering Keys & Clustered Tables](https://docs.snowflake.com/en/user-guide/tables-clustering-keys)

---

## 2-1. 問題文（英語）

> You are the database administrator for a large retailer running Snowflake. There is an event table that contains more than 5TB of data. But it does not have a clustering key defined. You need to define a new cluster key on this table. What is the best method to add the cluster key?
>
> The table structure is below, and the clustering key will be created on event_date.
>
> ```sql
> CREATE TABLE events (
>   Event_Date DATE,
>   Event_Id integer,
>   Event_PayLoad string,
>   Event_Origin_Id integer
> );
> ```
>
> A. Create a new table called events_2 with the same structure as events while adding the clustering key.
>
> ```sql
> CREATE TABLE events2 (
>   Event_Date DATE,
>   Event_Id integer,
>   Event_PayLoad string,
>   Event_Origin_Id integer
> ) CLUSTER BY (Event_Date);
> ```
>
> Then insert data from the event table into events2, drop the event table, and rename the events2 to be event.
>
> B. Execute ALTER statement on the table to add the clustering key.
>
> ```sql
> ALTER TABLE events CLUSTER BY (Event_date);
> ```

## 2-2. 問題文の文法解析

### 文1: "You are the database administrator for a large retailer running Snowflake."

- **主語 (S)**: You（あなたは）
- **動詞 (V)**: are
- **補語 (C)**: the database administrator（データベース管理者）
- **修飾語 (M1)**: for a large retailer（大手小売業者のための）
- **修飾語 (M2)**: running Snowflake（Snowflakeを使っている）← `retailer` を後置修飾する現在分詞
- **注目ポイント**: `running Snowflake` は `retailer` にかかる現在分詞後置修飾。「Snowflakeを運用している大手小売業者」

### 文2: "There is an event table that contains more than 5TB of data."

- **構文**: There is + 名詞（「〜がある」）
- **主語**: an event table（イベントテーブルが）
- **関係詞節**: that contains more than 5TB of data（5TB超のデータを含む）
- **注目ポイント**: `more than ~` = 「〜超・〜より多い」。数値の下限を示す表現

### 文3: "What is the best method to add the cluster key?"

- **疑問文**: What is ~?（〜は何ですか）
- **主語 (S)**: the best method to add the cluster key（クラスタリングキーを追加する最善の方法）
- **注目ポイント**: `the best method to do` = 「〜するための最善の方法」。不定詞が名詞を後置修飾

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| define | 動詞 | 定義する・設定する | You need to define a new clustering key. |
| more than ~ | 前置詞句 | 〜超・〜より多い | The table contains more than 5TB of data. |
| the best method to do | 名詞句 | 〜するための最善の方法 | What is the best method to add the key? |
| insert A into B | 動詞句 | AをBに挿入する | Insert data from events into events2. |
| rename A to B | 動詞句 | AをBに名前変更する | Rename events2 to events. |

## 2-3. 問題文（日本語）

> あなたはSnowflakeを使っている大手小売業者のデータベース管理者です。5TBを超えるデータを含むイベントテーブルがあります。しかし、このテーブルにはクラスタリングキーが定義されていません。このテーブルに新しいクラスタリングキーを定義する必要があります。クラスタリングキーを追加する最善の方法はどれですか？
>
> テーブル構造は以下の通りで、クラスタリングキーはevent_dateに作成します。
>
> A. eventsと同じ構造でクラスタリングキーを追加したevents2という新しいテーブルを作成し、eventsからデータをevents2に挿入し、eventsをドロップして、events2をeventsにリネームする。
>
> B. ALTERステートメントを実行してクラスタリングキーを追加する。
>
> ```sql
> ALTER TABLE events CLUSTER BY (Event_date);
> ```

---

## 3-1. 解説文（英語）

> The easiest way to add a cluster key to an existing table is by running the ALTER statement and using the CLUSTER BY clause to change the clustering key.

## 3-2. 解説文の文法解析

### 文1: "The easiest way to add a cluster key to an existing table is by running the ALTER statement and using the CLUSTER BY clause to change the clustering key."

- **主語 (S)**: The easiest way to add a cluster key to an existing table（既存テーブルにクラスタリングキーを追加する最も簡単な方法は）
- **動詞 (V)**: is（〜である）
- **補語 (C)**: by running the ALTER statement and using the CLUSTER BY clause（ALTERステートメントを実行してCLUSTER BY句を使うことで）← `by + 動名詞`（手段）
- **修飾語**: to change the clustering key（クラスタリングキーを変更するための）← `clause` にかかる不定詞後置修飾
- **注目ポイント**: `the easiest way to do ~ is by doing ...` = 「〜するための最も簡単な方法は…することだ」。最善解を示すときの定番文型

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| the easiest way to ~ | 名詞句 | 〜する最も簡単な方法 | The easiest way to add a key is ALTER TABLE. |
| is by + 動名詞 | 補語構文 | 〜することによって（〜だ） | The answer is by running ALTER TABLE. |
| existing | 形容詞 | 既存の・現存する | You can add a key to an existing table. |
| clause | 名詞 | 句・節（SQLの構文要素） | Use the CLUSTER BY clause. |

## 3-3. 解説文（日本語）

> 既存テーブルにクラスタリングキーを追加する最も簡単な方法は、ALTERステートメントを実行してCLUSTER BY句を使ってクラスタリングキーを変更することです。

---

## 復習メモ

- [ ] 既存テーブルへのクラスタリングキー追加は `ALTER TABLE ... CLUSTER BY` 1行でできることを覚えた
- [ ] 新テーブル作成 + データ移行の方法がなぜ非効率か説明できる
- [ ] `the easiest way to ~ is by doing` の文型パターンを確認した
- [ ] サンドボックスで `ALTER TABLE events CLUSTER BY (Event_Date)` を試すことができる
