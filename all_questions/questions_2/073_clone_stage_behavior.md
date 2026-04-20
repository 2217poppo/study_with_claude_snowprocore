# 073: Clone Stage Behavior

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-13
**正答**: A, C, D

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Named Internal Stage（名前付き内部ステージ） | ユーザーが明示的に作成する内部ステージ。`CREATE STAGE` で作成。**クローン不可** |
| Named External Stage（名前付き外部ステージ） | 外部クラウドストレージ（S3等）を参照するステージ。**クローン可能** |
| Table Stage（テーブルステージ） | 各テーブルに自動的に関連付けられるステージ（`@%table_name`）。テーブルクローン時に**自動的にクローンされる** |
| User Stage（ユーザーステージ） | 各ユーザーに自動的に関連付けられるステージ（`@~`）。クローンの対象外 |
| Zero-Copy Cloning | データの物理コピーなしでオブジェクトを複製する機能 |

## 1-2. 重要コンセプトまとめ

- DB/スキーマクローン時のステージのクローン動作:

| ステージ種別 | クローン可否 | 理由 |
|-------------|------------|------|
| Named External Stage | **可** | 外部ストレージへの参照のみのため |
| Table Stage | **可** | テーブルに紐付いているため、テーブルと一緒にクローン |
| Named Internal Stage | **不可** | 内部データは物理コピーが必要なため |
| User Stage | 対象外 | ユーザーに紐付くため |

- **Named Internal Stage がクローンできない** のが最も重要なポイント
- Named Internal Stageを参照するSnowpipeもクローンされない
- External Stageは外部参照（URL）のコピーのみなのでクローン可能

## 1-3. 公式ドキュメントURL

- [Cloning Considerations](https://docs.snowflake.com/en/user-guide/object-clone)

---

## 2-1. 問題文（英語）

> When a database or a schema is cloned, which of the following statements are valid for stages in that database?
>
> A. External stages are cloned.
> B. Named internal stages are cloned.
> C. Table stages are cloned.
> D. Named internal stages are NOT cloned.
> E. External stages are NOT cloned.

## 2-2. 問題文の文法解析

### 文1: "When a database or a schema is cloned, which of the following statements are valid for stages in that database?"

- **主語 (S)**: which of the following statements
- **動詞 (V)**: are
- **補語 (C)**: valid
- **修飾語 (M)**: When a database or a schema is cloned（条件）、for stages in that database（対象）
- **文型**: SVC（疑問文）
- **注目ポイント**: `valid for ~` は「～に対して有効な」。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| valid | adjective | 有効な、正しい | Which statements are valid? |
| named internal stage | noun | 名前付き内部ステージ | Named internal stages cannot be cloned. |
| associated with ~ | phrase | ～に関連付けられた | Table stages are associated with tables. |

## 2-3. 問題文（日本語）

> データベースまたはスキーマがクローンされたとき、そのデータベースのステージに関して有効な記述は以下のどれですか？
>
> A. 外部ステージはクローンされる。
> B. 名前付き内部ステージはクローンされる。
> C. テーブルステージはクローンされる。
> D. 名前付き内部ステージはクローンされない。
> E. 外部ステージはクローンされない。

---

## 3-1. 解説文（英語）

> Named Internal Stages cannot be cloned. When a database or schema is cloned, any Snowpipe that points to a Named Internal Stage is not cloned. Named External Stages can be cloned. Since a table stage is associated with a table, it is automatically cloned when the table is cloned.

## 3-2. 解説文の文法解析

### 文1: "Named Internal Stages cannot be cloned."

- **主語 (S)**: Named Internal Stages
- **動詞 (V)**: cannot be cloned（受動態否定）
- **文型**: SV

### 文2: "When a database or schema is cloned, any Snowpipe that points to a Named Internal Stage is not cloned."

- **主語 (S)**: any Snowpipe that points to a Named Internal Stage
- **動詞 (V)**: is not cloned（受動態否定）
- **修飾語 (M)**: When a database or schema is cloned（条件）
- **文型**: SV
- **注目ポイント**: Internal Stageに紐付くSnowpipeも連動してクローン不可。

### 文3: "Since a table stage is associated with a table, it is automatically cloned when the table is cloned."

- **主語 (S)**: it（= table stage）
- **動詞 (V)**: is cloned（受動態）
- **修飾語 (M)**: Since a table stage is associated with a table（理由）、automatically（副詞）、when the table is cloned（条件）
- **文型**: SV
- **注目ポイント**: `Since ~` で理由を提示。テーブルとの関連付けがクローン可能の根拠。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| points to ~ | phrase | ～を参照する | Snowpipe that points to a stage. |
| associated with ~ | phrase | ～に関連付けられた | A table stage is associated with a table. |
| automatically | adverb | 自動的に | Automatically cloned with the table. |

## 3-3. 解説文（日本語）

> 名前付き内部ステージはクローンできません。データベースまたはスキーマがクローンされるとき、名前付き内部ステージを参照するSnowpipeもクローンされません。名前付き外部ステージはクローンできます。テーブルステージはテーブルに関連付けられているため、テーブルがクローンされるときに自動的にクローンされます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
