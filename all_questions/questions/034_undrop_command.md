# 034: UNDROP Command — Recoverable Object Types

**SnowPro Core Domain**: Domain 5 — Time Travel & Data Protection
**作成日**: 2026-04-02
**正答**: Database, Table, Schema

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| UNDROP | DROPされたオブジェクトを復元するSQL DDLコマンド。テーブル・スキーマ・データベースに使用可能。Time Travelの保持期間内であれば復元できる |
| Time Travel | Snowflakeが過去の特定時点のデータや削除されたオブジェクトへのアクセスを提供する機能。Permanent Tableは最大90日、Transient/Temporary Tableは最大1日 |
| DROP（対義語） | オブジェクトを削除するSQL DDLコマンド。Snowflakeでは即座に物理削除されず、Time Travel期間中はUNDROPで復元可能 |
| Child Object（子オブジェクト） | 親オブジェクト（スキーマやデータベース）に含まれるオブジェクト。データベースをUNDROPすると、その中のスキーマ・テーブルも復元される |
| Role（ロール） | Snowflakeのアクセス制御の単位。UNDROPの対象外。削除したロールは手動で再作成が必要 |
| User（ユーザー） | Snowflakeにログインするアカウント。UNDROPの対象外。削除したユーザーは手動で再作成が必要 |

## 1-2. 重要コンセプトまとめ

- **UNDROPできるオブジェクト**: TABLE・SCHEMA・DATABASE の3つのみ
- **UNDROPできないオブジェクト**: USER・ROLE・WAREHOUSE・STAGE など
- **階層的な復元**: `UNDROP DATABASE` を実行すると、その配下のスキーマ・テーブルもすべて復元される（子オブジェクトの自動復元）
- **Time Travel期間内が条件**: UNDROP はTime Travel保持期間内のオブジェクトにのみ使用可能
- **試験の引っかけポイント**: ROLEはDROPして再作成できるがUNDROPはできない。DROPしたROLEを復元する方法はUNDROPではなく `CREATE ROLE` で再作成

## 1-3. 公式ドキュメントURL

- [Restoring Objects (Time Travel)](https://docs.snowflake.com/en/user-guide/data-time-travel#restoring-objects)
- [UNDROP TABLE](https://docs.snowflake.com/en/sql-reference/sql/undrop-table)
- [UNDROP SCHEMA](https://docs.snowflake.com/en/sql-reference/sql/undrop-schema)
- [UNDROP DATABASE](https://docs.snowflake.com/en/sql-reference/sql/undrop-database)

---

## 2-1. 問題文（英語）

> Which object types can be recovered using the UNDROP command after they have been dropped? Select all that apply.
>
> A. User
> B. Role
> C. Database
> D. Table
> E. Schema

## 2-2. 問題文の文法解析

### 文1: "Which object types can be recovered using the UNDROP command after they have been dropped?"

- **主語 (S)**: Which object types（どのオブジェクト種別が）
- **動詞 (V)**: can be recovered（復元できる）← 助動詞 can + 受動態 be recovered
- **修飾語 (M1)**: using the UNDROP command（UNDROPコマンドを使用して）← 分詞句
- **修飾語 (M2)**: after they have been dropped（それらがDROPされた後に）← 従属節（完了受動態）
- **文型**: SV（受動態）
- **注目ポイント**:
  - `can be recovered` = 助動詞 + 受動態（二重の文法要素）
  - `using the UNDROP command` = 手段を示す現在分詞句（付帯状況）
  - `after they have been dropped` = `after + 主語 + 現在完了受動態`。「ドロップ完了後」という時制を正確に表現

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| recover | 動詞 | 回復する、復元する | You can recover deleted tables using UNDROP. |
| object type | 名詞句 | オブジェクト種別 | TABLE and SCHEMA are different object types. |
| drop | 動詞 | 削除する（DDL） | If you drop a table, it can be recovered within the Time Travel period. |
| apply | 動詞 | 当てはまる、適用される | Select all that apply. = 当てはまるものをすべて選べ |

## 2-3. 問題文（日本語）

> オブジェクトがDROPされた後、UNDROPコマンドを使用して復元できるオブジェクト種別はどれですか？当てはまるものをすべて選択してください。
>
> A. User（ユーザー）
> B. Role（ロール）
> C. Database（データベース）
> D. Table（テーブル）
> E. Schema（スキーマ）

---

## 3-1. 解説文（英語）

> The UNDROP functionality applies to tables, schemas, and databases. That means you can restore complete databases or schemas and their child objects.

## 3-2. 解説文の文法解析

### 文1: "The UNDROP functionality applies to tables, schemas, and databases."

- **主語 (S)**: The UNDROP functionality（UNDROP機能は）
- **動詞 (V)**: applies to（〜に適用される）← apply to で1つの句動詞
- **目的語/補語**: tables, schemas, and databases（テーブル・スキーマ・データベース）← A, B, and C の並列
- **文型**: SV（句動詞 + 前置詞句）
- **注目ポイント**: `apply to ~` は「〜に当てはまる・適用される」という重要句動詞。後に対象のリストが続く

### 文2: "That means you can restore complete databases or schemas and their child objects."

- **主語 (S)**: That（それは）← 前文全体を指す指示代名詞
- **動詞 (V)**: means（意味する）
- **目的語 (O)**: you can restore complete databases or schemas and their child objects（あなたはデータベースやスキーマとその子オブジェクトを丸ごと復元できる）← that節
- **文型**: SVO（O = that節）
- **注目ポイント**:
  - `That means (that) ~` = 「それはつまり〜を意味する」。前文の論理的帰結を導く定型表現
  - `complete databases or schemas` = `complete` が「完全な・丸ごとの」を意味し、部分的ではなくすべて復元されることを強調
  - `their child objects` = 親オブジェクト（DB/Schema）配下の子オブジェクトも一緒に復元されることを示す

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| functionality | 名詞 | 機能、機能性 | The UNDROP functionality is part of Time Travel. |
| apply to ~ | 句動詞 | 〜に適用される、当てはまる | This rule applies to permanent tables only. |
| restore | 動詞 | 復元する | You can restore a dropped schema using UNDROP. |
| complete | 形容詞 | 完全な、丸ごとの | A complete database means all schemas and tables within it. |
| child object | 名詞句 | 子オブジェクト | Schemas are child objects of a database. |

## 3-3. 解説文（日本語）

> UNDROP機能はテーブル・スキーマ・データベースに適用されます。つまり、データベースやスキーマを、その子オブジェクトごと丸ごと復元することができます。

---

## 復習メモ

- [ ] UNDROPできる3種類（TABLE・SCHEMA・DATABASE）を覚えた
- [ ] UNDROPできないオブジェクト（USER・ROLE等）を確認した
- [ ] 英語の文法ポイント（apply to / That means）を確認した
- [ ] サンドボックスで検証した（任意）
