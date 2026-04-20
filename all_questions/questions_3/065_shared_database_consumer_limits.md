# 065: Shared Database Consumer Limits

**SnowPro Core Domain**: Domain 5 — Data Collaboration
**作成日**: 2026-04-16
**正答**: C, D, E, F

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Shared Database（共有データベース） | Data Sharingでコンシューマーが作成するデータベース。プロバイダーのデータを参照するが、読み取り専用 |
| Consumer Account（コンシューマーアカウント） | 共有データを利用する側のSnowflakeアカウント。データの照会はできるが、変更・複製・再共有は不可 |
| Provider Account（プロバイダーアカウント） | データを共有する側のSnowflakeアカウント。共有するオブジェクトを管理する |
| Time Travel | 過去の時点のデータにアクセスできるSnowflakeの機能。共有データには使用不可 |
| Clone（クローン） | オブジェクトのゼロコピー複製機能。共有データベース・スキーマ・テーブルのクローンは不可 |

## 1-2. 重要コンセプトまとめ

- コンシューマーが共有データベースで**できること**:
  - データの照会（SELECT）
  - 共有テーブルと自分のテーブルのJOIN
- コンシューマーが共有データベースで**できないこと**（4つ暗記必須）:
  1. **データの変更**（INSERT/UPDATE/DELETE）
  2. **データベースのクローン**
  3. **テーブル/スキーマのクローン**
  4. **Time Travelの使用**
  5. **共有データベースの再共有**
- 共有データベースはオブジェクトの追加・変更・削除もすべて不可
- 「照会とJOINはOK、それ以外はNG」と覚える

## 1-3. 公式ドキュメントURL

- [General Limitations for Shared Databases](https://docs.snowflake.com/en/user-guide/data-share-consumers#general-limitations-for-shared-databases)

---

## 2-1. 問題文（英語）

> Which of the following actions can NOT be performed by a consumer account on a shared database?
>
> A. Query data in a shared table.
> B. Join data from a shared table with another table.
> C. Modify data in a shared table.
> D. Clone the shared database.
> E. Clone a table from the shared database.
> F. Use Time Travel on shared tables.

## 2-2. 問題文の文法解析

### 文1: "Which of the following actions can NOT be performed by a consumer account on a shared database?"

- **主語 (S)**: Which of the following actions
- **動詞 (V)**: can NOT be performed（受動態・否定）
- **修飾語 (M)**: by a consumer account（動作主）/ on a shared database（対象）
- **文型**: SV（受動態）
- **注目ポイント**: 「can NOT be performed」で「実行できない」。否定の受動態。「by a consumer account」で動作主を限定。NOT が大文字で強調されている。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| perform | 動詞 | 実行する | Actions that can be performed on shared data. |
| consumer account | 名詞句 | コンシューマーアカウント | A consumer account can only query shared data. |
| modify | 動詞 | 変更する | You cannot modify data in a shared table. |

## 2-3. 問題文（日本語）

> コンシューマーアカウントが共有データベースに対して実行できないアクションは以下のうちどれですか？
>
> A. 共有テーブルのデータを照会する。
> B. 共有テーブルのデータを別のテーブルとJOINする。
> C. 共有テーブルのデータを変更する。
> D. 共有データベースをクローンする。
> E. 共有データベースからテーブルをクローンする。
> F. 共有テーブルにTime Travelを使用する。

---

## 3-1. 解説文（英語）

> Consumer accounts can only access and query data but cannot add, modify, or create database objects to a shared database.
>
> Consumer accounts cannot clone a shared database, its schemas, or any of its tables.
>
> Consumer accounts cannot use Time Travel on the shared data.
>
> Consumer accounts cannot further share a shared database.

## 3-2. 解説文の文法解析

### 文1: "Consumer accounts can only access and query data but cannot add, modify, or create database objects to a shared database."

- **主語 (S)**: Consumer accounts
- **動詞 (V)**: can only access and query ... but cannot add, modify, or create
- **目的語 (O)**: data / database objects
- **修飾語 (M)**: to a shared database
- **文型**: SVO（対比構造: can only ~ but cannot ~）
- **注目ポイント**: 「can only ~ but cannot ~」で許可されている操作と禁止されている操作を対比。

### 文2: "Consumer accounts cannot clone a shared database, its schemas, or any of its tables."

- **主語 (S)**: Consumer accounts
- **動詞 (V)**: cannot clone
- **目的語 (O)**: a shared database, its schemas, or any of its tables（3つ並列）
- **文型**: SVO
- **注目ポイント**: 「A, B, or C」の並列で、DB・スキーマ・テーブルすべてがクローン不可であることを明示。

### 文3: "Consumer accounts cannot further share a shared database."

- **主語 (S)**: Consumer accounts
- **動詞 (V)**: cannot share
- **目的語 (O)**: a shared database
- **修飾語 (M)**: further（さらに）
- **文型**: SVO
- **注目ポイント**: 「further share」で「さらに共有する（再共有）」。共有の連鎖ができないことを示す。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| can only ~ but cannot ~ | 構文 | ～だけできるが～はできない | Consumers can only query but cannot modify. |
| further share | 動詞句 | 再共有する | Consumers cannot further share the database. |

## 3-3. 解説文（日本語）

> コンシューマーアカウントはデータへのアクセスと照会のみが可能で、共有データベースへのオブジェクトの追加・変更・作成はできません。
>
> コンシューマーアカウントは共有データベース、そのスキーマ、またはそのテーブルのいずれもクローンできません。
>
> コンシューマーアカウントは共有データに対してTime Travelを使用できません。
>
> コンシューマーアカウントは共有データベースをさらに共有（再共有）することはできません。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
