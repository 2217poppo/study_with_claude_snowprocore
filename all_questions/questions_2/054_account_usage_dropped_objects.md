# 054: ACCOUNT_USAGE Dropped Objects

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-13
**正答**: Query the views in the ACCOUNT_USAGE schema

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| ACCOUNT_USAGE | SNOWFLAKE共有DBのスキーマ。365日間のアカウント全体の使用履歴を保持。**削除済みオブジェクトの情報を含む**（DELETEDカラム付き）。45分〜3時間の遅延 |
| INFORMATION_SCHEMA | 各DB内のシステムスキーマ。保持期間7日〜6ヶ月。ほぼリアルタイム。**削除済みオブジェクトは含まない** |
| Dropped Object（削除済みオブジェクト） | DROP文で削除されたテーブル・スキーマ・DB等。ACCOUNT_USAGEには残るがINFORMATION_SCHEMAからは消える |
| DELETED Column | ACCOUNT_USAGEビューに存在するカラム。オブジェクトが削除された日時を記録 |

## 1-2. 重要コンセプトまとめ

- **ACCOUNT_USAGE は削除済みオブジェクトを含む** — INFORMATION_SCHEMA との最大の差異
- 「deleted in the last month」という条件がある場合 → **ACCOUNT_USAGEが唯一の選択肢**
- INFORMATION_SCHEMAでは削除済みオブジェクトは即座に消えるため、削除後の情報は取得不可
- ACCOUNT_USAGE のDELETED カラムで削除日時を確認可能
- Snowsightにはテーブルサイズで一覧を表示する機能はない
- COPYコマンドのログでは「削除されたテーブル」を特定することはできない

## 1-3. 公式ドキュメントURL

- [Differences Between Account Usage and Information Schema](https://docs.snowflake.com/en/sql-reference/account-usage#differences-between-account-usage-and-information-schema)

---

## 2-1. 問題文（英語）

> As an administrator, you are required to find and list all tables with a size greater than 1 TB. You must also include tables created and deleted in the last month. Which one of the following options should you use?
>
> A. Use Snowsight to show this information
> B. Use the table functions provided in the INFORMATION_SCHEMA schema
> C. Query the views in the ACCOUNT_USAGE schema
> D. Go through the logs for COPY command to identify which tables were loaded with large volumes of data

## 2-2. 問題文の文法解析

### 文1: "As an administrator, you are required to find and list all tables with a size greater than 1 TB."

- **主語 (S)**: you
- **動詞 (V)**: are required（受動態）
- **修飾語 (M)**: As an administrator（資格）、to find and list all tables with a size greater than 1 TB（目的）
- **文型**: SV（受動態）
- **注目ポイント**: `As an administrator` でロールを設定。`with a size greater than ~` で条件を付加。

### 文2: "You must also include tables created and deleted in the last month."

- **主語 (S)**: You
- **動詞 (V)**: must include
- **目的語 (O)**: tables created and deleted in the last month
- **文型**: SVO
- **注目ポイント**: `tables created and deleted` は過去分詞の後置修飾。`in the last month` で期間限定。**「deleted」がキーワード** — これでACCOUNT_USAGEが必須。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| greater than ~ | phrase | ～より大きい | Tables with a size greater than 1 TB. |
| include | verb | 含める | Must also include deleted tables. |
| dropped object | noun | 削除済みオブジェクト | ACCOUNT_USAGE includes dropped objects. |

## 2-3. 問題文（日本語）

> 管理者として、サイズが1TBを超えるすべてのテーブルを検索してリストする必要があります。先月中に作成・削除されたテーブルも含める必要があります。以下のどのオプションを使用すべきですか？
>
> A. Snowsightを使用してこの情報を表示する
> B. INFORMATION_SCHEMAスキーマのテーブル関数を使用する
> C. ACCOUNT_USAGEスキーマのビューをクエリする
> D. COPYコマンドのログを調べて大量のデータがロードされたテーブルを特定する

---

## 3-1. 解説文（英語）

> ACCOUNT_USAGE views include information for all dropped objects. Many of these views include a DELETED column showing the dropped object's information. INFORMATION_SCHEMA does not include dropped objects.

## 3-2. 解説文の文法解析

### 文1: "ACCOUNT_USAGE views include information for all dropped objects."

- **主語 (S)**: ACCOUNT_USAGE views
- **動詞 (V)**: include
- **目的語 (O)**: information for all dropped objects
- **文型**: SVO
- **注目ポイント**: `for all dropped objects` で「すべての削除済みオブジェクトの」情報を含むことを明示。

### 文2: "Many of these views include a DELETED column showing the dropped object's information."

- **主語 (S)**: Many of these views
- **動詞 (V)**: include
- **目的語 (O)**: a DELETED column
- **修飾語 (M)**: showing the dropped object's information（現在分詞の後置修飾）
- **文型**: SVO

### 文3: "INFORMATION_SCHEMA does not include dropped objects."

- **主語 (S)**: INFORMATION_SCHEMA
- **動詞 (V)**: does not include
- **目的語 (O)**: dropped objects
- **文型**: SVO
- **注目ポイント**: 明確な否定でINFORMATION_SCHEMAの制限を示す。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| dropped object | noun | 削除済みオブジェクト | Views include all dropped objects. |
| DELETED column | noun | 削除日時を記録するカラム | The DELETED column shows when it was dropped. |

## 3-3. 解説文（日本語）

> ACCOUNT_USAGEビューはすべての削除済みオブジェクトの情報を含みます。これらのビューの多くにはDELETEDカラムがあり、削除されたオブジェクトの情報を表示します。INFORMATION_SCHEMAは削除済みオブジェクトを含みません。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
