# 064: Clone Storage Contribution

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-16
**正答**: B, D

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Zero-Copy Cloning（ゼロコピークローン） | Snowflakeのクローン機能。データを物理コピーせずメタデータ（マイクロパーティション参照）のみで即時作成。追加ストレージ不要 |
| Clone（クローン） | `CREATE ... CLONE` でオブジェクトのスキーマ＋マイクロパーティション参照をコピーする機能。テーブル・スキーマ・データベースに対して使用可能 |
| DML (Data Manipulation Language) | データを操作するSQL文。INSERT, UPDATE, DELETE, MERGE など。DMLの実行でクローンのストレージコストが発生する |
| Copy-on-Write | 書き込み時にコピーする方式。クローン後にデータが変更されるまでは物理コピーが発生しない |

## 1-2. 重要コンセプトまとめ

- クローン作成直後は**追加ストレージ不要**（ゼロコピー）
- ストレージコストが発生するのは、**ソースまたはクローンでDML操作が行われたとき**:
  1. **ソーステーブルのデータが変更された場合** — 変更されたマイクロパーティションはソース固有になる
  2. **クローンテーブルのデータが変更された場合** — 変更されたマイクロパーティションはクローン固有になる
- 「CREATE_COPY」パラメータは存在しない（ダミー選択肢）
- オブジェクトのサイズはストレージ貢献の条件に影響しない
- この仕組みはCopy-on-Writeと呼ばれる

## 1-3. 公式ドキュメントURL

- [Storage Considerations for Cloning](https://docs.snowflake.com/en/user-guide/tables-storage-considerations#label-cloning-tables)

---

## 2-1. 問題文（英語）

> Cloning does not contribute towards the overall storage unless which of the following conditions are met?
>
> A. The CREATE_COPY parameter is set to true while cloning data.
> B. Data is changed in the source table.
> C. The cloned object is too big.
> D. Data is changed in the cloned table.

## 2-2. 問題文の文法解析

### 文1: "Cloning does not contribute towards the overall storage unless which of the following conditions are met?"

- **主語 (S)**: Cloning
- **動詞 (V)**: does not contribute
- **修飾語 (M)**: towards the overall storage（方向・対象）/ unless which of the following conditions are met（条件の副詞節）
- **文型**: SV
- **注目ポイント**:
  - 「does not ~ unless ...」は「...でなければ～しない」= 「...の場合のみ～する」
  - 「contribute towards」で「～に貢献する、～に加算される」
  - 「conditions are met」は受動態で「条件が満たされる」
  - 二重否定に近い構造のため、論理を正確に読み取る必要がある

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| contribute towards | 動詞句 | ～に貢献する、加算される | Cloning does not contribute towards storage. |
| overall | 形容詞 | 全体的な | The overall storage cost. |
| unless | 接続詞 | ～でなければ、～しない限り | It costs nothing unless data is changed. |
| conditions are met | 受動態 | 条件が満たされる | Unless the following conditions are met. |

## 2-3. 問題文（日本語）

> クローンは、以下のどの条件が満たされない限り、全体のストレージに加算されませんか？
>
> A. クローン時にCREATE_COPYパラメータがtrueに設定されている。
> B. ソーステーブルのデータが変更された。
> C. クローンされたオブジェクトが大きすぎる。
> D. クローンテーブルのデータが変更された。

---

## 3-1. 解説文（英語）

> When tables, schemas, or databases are cloned, the cloning operation does not contribute to total storage until data manipulation language (DML) operations are performed on the source or target, which modify or delete existing data or add additional data. https://docs.snowflake.com/en/user-guide/tables-storage-considerations#label-cloning-tables

## 3-2. 解説文の文法解析

### 文1: "When tables, schemas, or databases are cloned, the cloning operation does not contribute to total storage until data manipulation language (DML) operations are performed on the source or target, which modify or delete existing data or add additional data."

- **主語 (S)**: the cloning operation
- **動詞 (V)**: does not contribute
- **修飾語 (M)**: When tables, schemas, or databases are cloned（時間の副詞節）/ to total storage / until DML operations are performed on the source or target（時間の限度）/ which modify or delete existing data or add additional data（非制限関係詞節）
- **文型**: SV
- **注目ポイント**:
  - 「does not ~ until ...」は「...するまで～しない」= 「...してはじめて～する」
  - 「on the source or target」でソース・ターゲットの両方に言及（どちらでもストレージコスト発生）
  - 「which modify or delete ... or add ...」は非制限関係詞節でDML操作の具体例を補足
  - 「tables, schemas, or databases」でクローン対象の3種類を列挙

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| cloning operation | 名詞句 | クローン操作 | The cloning operation is instantaneous. |
| contribute to | 動詞句 | ～に加算される | Does not contribute to total storage. |
| data manipulation language (DML) | 名詞句 | データ操作言語 | DML operations include INSERT, UPDATE, DELETE. |
| source or target | 名詞句 | ソースまたはターゲット | Operations performed on the source or target. |
| existing data | 名詞句 | 既存データ | Modify or delete existing data. |
| additional data | 名詞句 | 追加データ | Add additional data. |

## 3-3. 解説文（日本語）

> テーブル、スキーマ、またはデータベースがクローンされた場合、ソースまたはターゲットに対してデータ操作言語（DML）操作（既存データの変更・削除、または追加データの挿入）が実行されるまで、クローン操作は全体のストレージに加算されません。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
