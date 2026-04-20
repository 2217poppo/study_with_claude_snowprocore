# 096: Time Travel Error Conditions

**SnowPro Core Domain**: Domain 5 — Data Collaboration
**作成日**: 2026-04-17
**正答**: B, C, E（TIMESTAMP / STATEMENT / OFFSET が保持期間外）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Time Travel | 過去の任意の時点のデータを参照・復元できるSnowflakeの機能。テーブルごとに保持期間（0〜90日）を設定する |
| AT \| BEFORE clause | Time Travelクエリで過去時点を指定する句。`AT (TIMESTAMP => ...)` または `BEFORE (STATEMENT => ...)` の形式で使う |
| TIMESTAMP | AT/BEFORE句で使う時刻指定オプション。指定した時刻時点のデータを参照する |
| OFFSET | AT/BEFORE句で使う秒数指定オプション。現在から指定した秒数前のデータを参照する（例: `-3600` = 1時間前）|
| STATEMENT | AT/BEFORE句で使うクエリID指定オプション。特定のDMLクエリが実行される直前のデータを参照する |
| Retention Period | Time Travelデータが保持される期間。Standard版は最大1日、Enterprise版以上は最大90日。期間外はアクセス不可 |
| Fail-safe | Time Travel期間後の7日間の追加保護期間。Snowflakeサポートのみがアクセス可能 |

## 1-2. 重要コンセプトまとめ

- **エラーの原因は保持期間外のアクセスまたはオブジェクト作成前の時点指定**
  - TIMESTAMP / OFFSET / STATEMENT のいずれかが保持期間（Retention Period）を超えると同一エラーが発生する
- **「ロール権限がない」「テーブルが読み込み中」はこのエラーとは無関係**
  - Time Travelはロールの権限チェックとは独立した仕組みであり、権限不足の場合は別エラーが出る
- **テーブル作成前の時点を指定してもエラーになる**
  - 「before the object creation time」という記述がこれを示す
- **複数回答形式：TIMESTAMP・STATEMENT・OFFSETの3つがすべて対象**
  - AT句/BEFORE句の3種類のオプションすべてが保持期間外になるとエラー

## 1-3. 公式ドキュメントURL

- [Time Travel — Querying Historical Data](https://docs.snowflake.com/en/user-guide/data-time-travel#querying-historical-data)
- [Using Time Travel](https://docs.snowflake.com/en/user-guide/data-time-travel)

---

## 2-1. 問題文（英語）

> You execute a time travel query on a table but get the following error. "Time travel data is not available for the table. The requested time is either beyond the allowed time travel period or before the object creation time." What could this error indicate? Select all that apply.
>
> A. Your role is not authorized to use Time Travel.
> B. You have provided a value for TIMESTAMP in the BEFORE clause that is outside of that table's Time Travel retention period.
> C. You have provided a query id for STATEMENT in the BEFORE clause that is outside of that table's Time Travel retention period.
> D. The table is being loaded; therefore, Time Travel is unavailable.
> E. You have provided a value for OFFSET in the AT clause that is outside of the Time Travel retention period of that table.

## 2-2. 問題文の文法解析

### 文1: "You execute a time travel query on a table but get the following error."

- **主語 (S)**: You
- **動詞 (V)**: execute ... but get（等位接続詞 but で2つの動詞を並列）
- **目的語 (O)**: a time travel query / the following error
- **修飾語 (M)**: on a table（前置詞句）
- **文型**: SVO
- **注目ポイント**: `but` で逆接の対比（実行したがエラーを得た）

### 文2: "Time travel data is not available for the table."

- **主語 (S)**: Time travel data
- **動詞 (V)**: is not available
- **修飾語 (M)**: for the table（対象）
- **文型**: SVC（available が形容詞補語）
- **注目ポイント**: `be available for ~` = 〜に対して利用可能である

### 文3: "The requested time is either beyond the allowed time travel period or before the object creation time."

- **主語 (S)**: The requested time
- **動詞 (V)**: is
- **補語 (C)**: either beyond the allowed time travel period or before the object creation time
- **文型**: SVC
- **注目ポイント**: `either A or B` = AまたはBのどちらか。2つの原因を列挙している

### 選択肢の文法パターン

- **B/C/E**: `You have provided a value/query id for X in the Y clause that is outside of ~`
  - **主語**: You
  - **述語**: have provided（現在完了形）
  - **関係詞節**: `that is outside of that table's Time Travel retention period`（X を修飾）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| execute | 動詞 | 実行する | Execute this query to retrieve historical data. |
| retention period | 名詞句 | 保持期間 | The retention period for this table is set to 7 days. |
| authorized | 形容詞 | 権限を与えられた | Only authorized roles can access this data. |
| beyond | 前置詞 | 〜を超えて | The timestamp is beyond the retention period. |
| indicate | 動詞 | 示す、意味する | What does this error indicate? |

## 2-3. 問題文（日本語）

> あるテーブルにタイムトラベルクエリを実行しましたが、次のエラーが発生しました。「そのテーブルのタイムトラベルデータは利用できません。リクエストされた時刻は、許可されたタイムトラベル期間を超えているか、オブジェクトの作成時刻より前です。」このエラーが示す可能性があるものをすべて選んでください。
>
> A. あなたのロールはTime Travelを使用する権限がありません。
> B. BEFOREクローズのTIMESTAMPに、そのテーブルのTime Travel保持期間外の値を指定しました。
> C. BEFOREクローズのSTATEMENTに、そのテーブルのTime Travel保持期間外のクエリIDを指定しました。
> D. テーブルが読み込み中のため、Time Travelは利用できません。
> E. ATクローズのOFFSETに、そのテーブルのTime Travel保持期間外の値を指定しました。

---

## 3-1. 解説文（英語）

> A time travel query will fail, and an error will be returned if the TIMESTAMP, OFFSET, or STATEMENT supplied in the AT | BEFORE clause is outside of the Time Travel retention period for the table. The same error is thrown if the time travel query attempts to access the table data before it was created. https://docs.snowflake.com/en/user-guide/data-time-travel#querying-historical-data

## 3-2. 解説文の文法解析

### 文1: "A time travel query will fail, and an error will be returned if the TIMESTAMP, OFFSET, or STATEMENT supplied in the AT | BEFORE clause is outside of the Time Travel retention period for the table."

- **主語 (S)**: A time travel query / an error
- **動詞 (V)**: will fail / will be returned（will be returned は受動態）
- **条件節**: if the TIMESTAMP, OFFSET, or STATEMENT supplied in the AT | BEFORE clause is outside of the Time Travel retention period for the table
- **文型**: SV + SV（等位接続詞 and で並列）
- **注目ポイント**: 
  - `supplied in the AT | BEFORE clause` は過去分詞句で TIMESTAMP, OFFSET, or STATEMENT を後置修飾
  - `is outside of ~` = 〜の外側にある（期間を超えている）

### 文2: "The same error is thrown if the time travel query attempts to access the table data before it was created."

- **主語 (S)**: The same error
- **動詞 (V)**: is thrown（受動態）
- **条件節**: if the time travel query attempts to access the table data before it was created
- **修飾語**: before it was created（時間節）
- **文型**: SV（受動態）
- **注目ポイント**: `be thrown` = エラーが投げられる（発生する）。技術文書での一般的な受動態表現

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| supplied | 形容詞（過去分詞） | 提供された、指定された | The value supplied must be within the retention period. |
| retention period | 名詞句 | 保持期間 | The default retention period is 1 day. |
| be thrown | 動詞句（受動態） | （エラーが）発生する | An exception is thrown when the limit is exceeded. |
| attempt to | 動詞句 | 〜しようとする | The query attempts to access historical data. |

## 3-3. 解説文（日本語）

> AT \| BEFORE句に指定したTIMESTAMP、OFFSET、またはSTATEMENTがテーブルのTime Travel保持期間外である場合、タイムトラベルクエリは失敗し、エラーが返されます。タイムトラベルクエリがテーブルの作成前のデータにアクセスしようとした場合も、同じエラーが発生します。

---

## 復習メモ

- [ ] Time Travelの3つのオプション（TIMESTAMP / OFFSET / STATEMENT）を理解した
- [ ] エラー原因（保持期間外・作成前時点）を把握した
- [ ] 英語の文法ポイント（either A or B、過去分詞の後置修飾）を確認した
