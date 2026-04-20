# 022: Stream for DML Change Tracking

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-02
**正答**: A (Stream)
- A. Stream（**選択済み・正解**）
- B. Snowpipe（誤り・未選択）
- C. Stored Procedure（誤り・未選択）
- D. Task（誤り・未選択）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Stream（ストリーム） | テーブルへのDML変更（INSERT・UPDATE・DELETE）を追跡するSnowflakeのデータベースオブジェクト。最後のオフセット以降の変更差分のみをクエリできる |
| DML (Data Manipulation Language) | データ操作言語。INSERT・UPDATE・DELETE・MERGEなどテーブルのデータを変更するSQL命令 |
| Offset（オフセット） | Streamが「どこまで変更を読み取ったか」を示す時点のマーカー。Streamを消費（クエリ）するたびに進む |
| CDC (Change Data Capture) | データの変更差分を追跡・取得する手法。StreamはSnowflakeにおけるCDCの実装 |
| Snowpipe | ステージにファイルが置かれると自動でデータをロードするSnowflakeのサービス。変更追跡ではなくデータ取り込みが目的 |
| Stored Procedure（ストアドプロシージャ） | 複雑な手続き的ロジック（制御フロー・エラーハンドリング等）をデータベース側で実行できるオブジェクト |
| Task（タスク） | SQL文（ストアドプロシージャ呼び出しを含む）を自動・定期実行するSnowflakeのオブジェクト。スケジュール実行やTask間の依存関係が設定可能 |

## 1-2. 重要コンセプトまとめ

- **Streamが追跡する変更の種類**:
  - ✅ INSERT（新規追加）
  - ✅ UPDATE（既存データの変更）
  - ✅ DELETE（削除）

- **Streamの仕組み**:
  ```
  テーブルに DML → Streamに変更差分が蓄積
  ↓
  Stream を SELECT → オフセット以降の変更のみ取得
  ↓
  Stream + Task を組み合わせ → 定期的な差分処理パイプラインを構築
  ```

- **各オブジェクトの役割比較**（試験頻出の混同ポイント）:

  | オブジェクト | 主な用途 |
  |------------|---------|
  | **Stream** | DML変更の追跡（CDC） |
  | **Snowpipe** | ファイルからのリアルタイムデータ取り込み |
  | **Stored Procedure** | 複雑な手続き的処理の実行 |
  | **Task** | SQL/ストアドプロシージャの定期自動実行 |

- **Stream + Task の典型パターン**:
  - Stream で変更を検知 → Task で定期的に Stream を読み取って別テーブルに反映
  - これが Snowflake における ELT（Extract → Load → Transform）パイプラインの基本形

- **試験ポイント**: DML変更の監視・追跡 → **Stream**。定期実行 → Task。リアルタイム取り込み → Snowpipe

## 1-3. 公式ドキュメントURL

- [Introduction to Streams](https://docs.snowflake.com/en/user-guide/streams-intro)

---

## 2-1. 問題文（英語）

> Which type of database object does Snowflake provide to monitor changes made by DML commands (such as insert, update, and delete) to tables?
>
> A. Stream
> B. Snowpipe
> C. Stored Procedure
> D. Task

## 2-2. 問題文の文法解析

### 文1: "Which type of database object does Snowflake provide to monitor changes made by DML commands (such as insert, update, and delete) to tables?"

- **主語 (S)**: Snowflake
- **動詞 (V)**: does provide（疑問文の語順）
- **目的語 (O)**: Which type of database object
- **目的語の修飾**: to monitor changes（不定詞の形容詞的用法）
- **changesの修飾**: made by DML commands（過去分詞の後置修飾）
- **挿入句**: (such as insert, update, and delete)（DML命令の例示）
- **修飾語 (M)**: to tables
- **文型**: (O=Which~) + SV + O + 不定詞句
- **注目ポイント**:
  - 疑問文で Which ~ が目的語として文頭に出る倒置形。「Snowflake はどんなオブジェクトを提供しているか」
  - 「changes made by DML commands」は過去分詞の後置修飾。「DMLコマンドによって行われた変更」
  - 「to monitor ~」は目的を示す不定詞句。「〜を監視するための（オブジェクト）」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| monitor | verb | 監視する、追跡する | Use Streams to monitor changes to a table. |
| DML command | noun phrase | DMLコマンド（データ操作言語） | DML commands include insert, update, and delete. |
| changes made by ~ | 名詞句（過去分詞修飾） | 〜によって行われた変更 | Changes made by DML commands are tracked in a Stream. |
| database object | noun phrase | データベースオブジェクト | A Stream is a type of database object. |

## 2-3. 問題文（日本語）

> Snowflakeが、DMLコマンド（INSERT・UPDATE・DELETEなど）によってテーブルに加えられた変更を監視するために提供しているデータベースオブジェクトはどれですか？
>
> A. Stream
> B. Snowpipe
> C. Stored Procedure（ストアドプロシージャ）
> D. Task

---

## 3-1. 解説文（英語）

**A. Stream（正解）:**
> Snowflake Streams help you keep track of any changes made to a table, such as new data being added (inserts), existing data being modified (updates), or data being removed (deletes). They allow you to query and process only the changed data since the last offset.

**B. Snowpipe（不正解）:**
> Snowpipe facilitates continuous and real-time data ingestion into Snowflake, enabling uninterrupted streaming data integration.

**C. Stored Procedure（不正解）:**
> Stored procedures allow complex operations and procedural logic to be executed. They can include control-flow statements and error handling and call SQL commands, enabling the automation and customization of database tasks.

**D. Task（不正解）:**
> Tasks in Snowflake are automated, time-based processes that run SQL statements, including calling stored procedures, to perform operations such as data loading, transformation, and scheduled reporting. They can be set to run at specific intervals or triggered by other tasks, enabling complex, dependent workflows.

## 3-2. 解説文の文法解析

### 文1 (Stream解説): "Snowflake Streams help you keep track of any changes made to a table, such as new data being added (inserts), existing data being modified (updates), or data being removed (deletes)."

- **主語 (S)**: Snowflake Streams
- **動詞 (V)**: help（使役的）
- **目的語 (O)**: you keep track of any changes（`help O 動詞原形`）
- **changesの修飾**: made to a table（過去分詞の後置修飾）
- **例示**: such as new data being added, existing data being modified, or data being removed
- **文型**: SVO（help O do）+ 過去分詞修飾 + such as 節
- **注目ポイント**:
  - 「keep track of ~」は「〜を追跡する、把握する」という慣用句
  - 「such as new data being added」は `such as + 名詞 + being + 過去分詞` の形。「追加されつつある新しいデータのような」
  - `help O (to) do` の構文。ここでは to が省略された原形不定詞

### 文2 (Stream解説): "They allow you to query and process only the changed data since the last offset."

- **主語 (S)**: They（= Snowflake Streams）
- **動詞 (V)**: allow
- **目的語 (O)**: you to query and process（allow O to do）
- **目的語の内容**: only the changed data since the last offset
- **文型**: SVOC（allow O to do）
- **注目ポイント**:
  - 「only the changed data」の only が変更差分のみを強調
  - 「since the last offset」= 「最後のオフセット以降」。Streamの差分読み取りの仕組みを端的に表現

### 文3 (Task解説): "They can be set to run at specific intervals or triggered by other tasks, enabling complex, dependent workflows."

- **主語 (S)**: They（= Tasks）
- **動詞 (V)**: can be set（受動態）
- **不定詞句**: to run at specific intervals or triggered by other tasks（run と triggered が or で並列）
- **分詞構文**: enabling complex, dependent workflows（結果を示す）
- **文型**: SV（受動態）+ 不定詞 + 分詞構文
- **注目ポイント**:
  - 「be set to run」= 「実行するよう設定される」
  - 「or triggered by other tasks」= 「または他のTaskによってトリガーされる」。Task間の依存関係を示す
  - 「enabling ~」は結果を示す分詞構文。「その結果〜を可能にする」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| keep track of ~ | idiom | 〜を追跡する、把握する | Streams help you keep track of table changes. |
| offset | noun | オフセット（読み取り済みの位置マーカー） | Query only the changed data since the last offset. |
| facilitate | verb | 促進する、容易にする | Snowpipe facilitates real-time data ingestion. |
| procedural logic | noun phrase | 手続き的ロジック（if/else等の制御フロー） | Stored procedures can include procedural logic. |
| dependent workflow | noun phrase | 依存関係のあるワークフロー | Tasks enable complex, dependent workflows. |

## 3-3. 解説文（日本語）

**A. Stream（正解）:**
> Snowflake Streamは、テーブルに加えられたあらゆる変更（新しいデータの追加（INSERT）、既存データの変更（UPDATE）、データの削除（DELETE）など）を追跡するのに役立ちます。最後のオフセット以降に変更されたデータのみをクエリして処理することができます。

**B. Snowpipe（不正解）:**
> Snowpipeは、Snowflakeへの継続的でリアルタイムなデータ取り込みを促進し、途切れのないストリーミングデータ統合を実現します。

**C. Stored Procedure（不正解）:**
> ストアドプロシージャは、複雑な操作や手続き的ロジックの実行を可能にします。制御フロー文やエラーハンドリングを含めることができ、SQLコマンドを呼び出すことで、データベースタスクの自動化とカスタマイズを実現します。

**D. Task（不正解）:**
> Snowflakeのタスクは、ストアドプロシージャの呼び出しを含むSQL文を実行する自動化された時間ベースのプロセスです。データのロード・変換・定期レポートなどを行います。特定の間隔での実行や他のTaskによるトリガーが設定でき、複雑な依存関係のあるワークフローを実現します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
