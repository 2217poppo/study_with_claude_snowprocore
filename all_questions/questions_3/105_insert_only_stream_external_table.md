# 105: Stream Types — External Tables (Insert-Only)

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-17
**正答**: D（Insert-only）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Stream | テーブルやビューへのDML変更（INSERT/UPDATE/DELETE）を追跡するSnowflakeのオブジェクト。CDC（変更データキャプチャ）を実現する |
| Standard Stream | 内部テーブルのINSERT・UPDATE・DELETEすべての変更を追跡するストリームタイプ。外部テーブルには使用不可 |
| Insert-only Stream | INSERTのみを追跡するストリームタイプ。外部テーブルに使用できる唯一のストリームタイプ |
| Append-only Stream | 行の追加（INSERT）のみを追跡する。Snowflake内部テーブルに使用できるが、外部テーブルには使用不可 |
| External Table | クラウドストレージ（S3、Azure Blob等）のデータを参照するテーブル。データはSnowflake内部に格納されない |
| CDC (Change Data Capture) | データの変更を検知・キャプチャする手法。ストリームはこれをSnowflakeで実現するための機能 |

## 1-2. 重要コンセプトまとめ

- **外部テーブルに使えるストリームは Insert-only のみ**
  - 外部テーブルはSnowflake管理ストレージを持たないため、Standard/Append-only は使用不可
- **3種類のストリームタイプの比較**

  | ストリームタイプ | INSERT追跡 | UPDATE追跡 | DELETE追跡 | 外部テーブル対応 |
  |---|---|---|---|---|
  | Standard | ○ | ○ | ○ | × |
  | Append-only | ○（追記のみ） | × | × | × |
  | Insert-only | ○（新行として） | ○（新行として） | × | ○ |

- **Insert-only はUPDATEを「削除 + 新規挿入」として表現する**
  - DELETEは無視される。外部テーブルに新しいファイルが追加されると新行として記録される
- **"External" というストリームタイプは存在しない**（誤り選択肢に注意）

## 1-3. 公式ドキュメントURL

- [Types of Streams](https://docs.snowflake.com/en/user-guide/streams-intro#types-of-streams)
- [Streams on External Tables](https://docs.snowflake.com/en/user-guide/streams-intro#streams-on-external-tables)

---

## 2-1. 問題文（英語）

> Which one of the following stream types can you use to track data in an external table?
>
> A. External
> （External is not a valid stream type. The valid stream types are Standard, Insert-only, and append only.）
>
> B. Append-only
> （Append-only stream solely tracks row inserts made to tables within Snowflake's managed storage but cannot be used with external tables because external tables do not store data internally within Snowflake.）
>
> C. Standard
> （A standard stream type tracks changes in Snowflake's internal storage and can't be used with external tables because external tables don't store data directly in Snowflake; they reference data stored externally in cloud services like S3 or Azure Blob Storage.）
>
> D. Insert-only
> （Insert-only streams in Snowflake track changes to external tables by capturing both inserts and updates as new rows, but they ignore delete operations.）

## 2-2. 問題文の文法解析

### 文1: "Which one of the following stream types can you use to track data in an external table?"

- **疑問詞**: Which one of the following stream types
- **助動詞**: can
- **主語 (S)**: you
- **動詞 (V)**: use
- **不定詞**: to track data in an external table（目的）
- **注目ポイント**: `Which one of the following` = 次のうち1つだけ（単一選択を示す）

### 選択肢Bの解説文: "Append-only stream solely tracks row inserts made to tables within Snowflake's managed storage but cannot be used with external tables because external tables do not store data internally within Snowflake."

- **主語 (S)**: Append-only stream
- **動詞 (V)**: solely tracks ... but cannot be used（等位接続詞 but で対比）
- **because節**: because external tables do not store data internally within Snowflake
- **注目ポイント**: 
  - `solely` = もっぱら、〜だけを（限定の副詞）
  - `internally` = 内部的に（Snowflakeの内部ストレージに、という意味）

### 選択肢Dの解説文: "Insert-only streams in Snowflake track changes to external tables by capturing both inserts and updates as new rows, but they ignore delete operations."

- **主語 (S)**: Insert-only streams in Snowflake
- **動詞 (V)**: track
- **手段の修飾語**: by capturing both inserts and updates as new rows
- **逆接節**: but they ignore delete operations
- **注目ポイント**: 
  - `by + 動名詞` = 〜することによって（手段）
  - `as new rows` = 新しい行として（様態を示す前置詞句）
  - `ignore` = 無視する

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| solely | 副詞 | もっぱら、〜だけ | Append-only streams solely track insert operations. |
| internally | 副詞 | 内部的に | External tables do not store data internally. |
| capture | 動詞 | 取り込む、キャプチャする | The stream captures all insert events. |
| ignore | 動詞 | 無視する | Insert-only streams ignore delete operations. |
| reference | 動詞 | 参照する | External tables reference data in cloud storage. |

## 2-3. 問題文（日本語）

> 次のストリームタイプのうち、外部テーブルのデータを追跡するために使用できるものはどれですか？
>
> A. External
> （Externalは有効なストリームタイプではありません。有効なストリームタイプはStandard、Insert-only、Append-onlyです。）
>
> B. Append-only
> （Append-onlyストリームはSnowflakeのマネージドストレージ内のテーブルへの行の挿入のみを追跡しますが、外部テーブルはSnowflakeの内部にデータを格納しないため、外部テーブルには使用できません。）
>
> C. Standard
> （Standardストリームタイプは、Snowflakeの内部ストレージの変更を追跡しますが、外部テーブルはS3やAzure Blob Storageなどのクラウドサービスに外部格納されたデータを参照するため、外部テーブルには使用できません。）
>
> D. Insert-only
> （SnowflakeのInsert-onlyストリームは、InsertとUpdateを新しい行としてキャプチャすることで外部テーブルへの変更を追跡しますが、Delete操作は無視します。）

---

## 3-1. 解説文（英語）

> Insert-only streams in Snowflake track changes to external tables by capturing both inserts and updates as new rows, but they ignore delete operations. This means they only reflect additions and modifications to data, treating updates as new inserts.
>
> See the link for more details: https://docs.snowflake.com/en/user-guide/streams-intro#types-of-streams

## 3-2. 解説文の文法解析

### 文1: "Insert-only streams in Snowflake track changes to external tables by capturing both inserts and updates as new rows, but they ignore delete operations."

（2-2で解析済み）

### 文2: "This means they only reflect additions and modifications to data, treating updates as new inserts."

- **主語 (S)**: This
- **動詞 (V)**: means
- **that節（目的語）**: they only reflect additions and modifications to data
- **分詞構文**: treating updates as new inserts（付帯状況：同時に行われることを表す）
- **注目ポイント**: 
  - `reflect` = 反映する
  - `treating A as B` = AをBとして扱いながら（分詞構文）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| modification | 名詞 | 変更、修正 | The stream captures both additions and modifications. |
| reflect | 動詞 | 反映する | The stream reflects changes made to the external table. |
| treat A as B | 動詞句 | AをBとして扱う | Updates are treated as new inserts in insert-only streams. |

## 3-3. 解説文（日本語）

> SnowflakeのInsert-onlyストリームは、InsertとUpdateを新しい行としてキャプチャすることで外部テーブルへの変更を追跡しますが、Delete操作は無視します。つまり、データへの追加と変更のみを反映し、Updateは新しいInsertとして扱います。

---

## 復習メモ

- [ ] 外部テーブルに使えるのは Insert-only のみであることを理解した
- [ ] 3種類のストリームタイプの違い（Standard/Append-only/Insert-only）を把握した
- [ ] `by + 動名詞`（手段）と `treating A as B`（分詞構文）の文法パターンを確認した
