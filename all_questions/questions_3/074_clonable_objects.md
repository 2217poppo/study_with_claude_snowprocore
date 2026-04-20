# 074: Clonable Objects

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-16
**正答**: A, B, E, F

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Clone（クローン） | `CREATE ... CLONE` でオブジェクトのゼロコピー複製を作成する機能 |
| Clonable Objects（クローン可能オブジェクト） | テーブル、スキーマ、データベース、ステージ、ファイルフォーマット、タスク、シーケンス、ストリーム |
| Virtual Warehouse | コンピュートリソース。クローン**不可**のオブジェクト |
| Share | データ共有オブジェクト。クローン**不可**のオブジェクト |

## 1-2. 重要コンセプトまとめ

- **クローン可能なオブジェクト**（暗記必須）:
  - テーブル（Table）
  - スキーマ（Schema）
  - データベース（Database）
  - ステージ（Stage）※外部ステージのみ
  - ファイルフォーマット（File Format）
  - タスク（Task）
  - シーケンス（Sequence）
  - ストリーム（Stream）
- **クローンできないオブジェクト**:
  - 仮想ウェアハウス（Virtual Warehouse）
  - Share
  - パイプ（Pipe）— 内部ステージを参照する場合
- DB/スキーマのクローンは子オブジェクトも含めて再帰的にクローンされる
- 「Table, Schema, Database + Stage, File Format, Task, Sequence, Stream」と覚える

## 1-3. 公式ドキュメントURL

- [Object Clone](https://docs.snowflake.com/en/user-guide/object-clone)

---

## 2-1. 問題文（英語）

> Which of the following objects can be cloned? Select all that apply.
>
> A. Schema
> B. Database
> C. Virtual Warehouse
> D. Share
> E. Table
> F. Task

## 2-2. 問題文の文法解析

### 文1: "Which of the following objects can be cloned?"

- **主語 (S)**: Which of the following objects
- **動詞 (V)**: can be cloned（受動態）
- **文型**: SV（受動態）
- **注目ポイント**: 「can be cloned」で「クローン可能か」を問う。シンプルな受動態の疑問文。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| clone | 動詞 | クローンする | Tables, schemas, and databases can be cloned. |

## 2-3. 問題文（日本語）

> 以下のうちクローンできるオブジェクトはどれですか？該当するものをすべて選んでください。
>
> A. スキーマ
> B. データベース
> C. 仮想ウェアハウス
> D. Share
> E. テーブル
> F. タスク

---

## 3-1. 解説文（英語）

> Virtual warehouses & Share objects cannot be cloned. Tables, Schemas & Databases can be cloned. Other objects that can be cloned include Stages, File Formats, Tasks, Sequences, and Streams.

## 3-2. 解説文の文法解析

### 文1: "Virtual warehouses & Share objects cannot be cloned."

- **主語 (S)**: Virtual warehouses & Share objects
- **動詞 (V)**: cannot be cloned（受動態・否定）
- **文型**: SV（受動態）

### 文2: "Tables, Schemas & Databases can be cloned."

- **主語 (S)**: Tables, Schemas & Databases
- **動詞 (V)**: can be cloned（受動態）
- **文型**: SV（受動態）

### 文3: "Other objects that can be cloned include Stages, File Formats, Tasks, Sequences, and Streams."

- **主語 (S)**: Other objects that can be cloned
- **動詞 (V)**: include
- **目的語 (O)**: Stages, File Formats, Tasks, Sequences, and Streams
- **文型**: SVO
- **注目ポイント**: 「Other objects that can be cloned include ~」でTable/Schema/DB以外のクローン可能オブジェクトを列挙。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| include | 動詞 | 含む | Other clonable objects include Stages. |

## 3-3. 解説文（日本語）

> 仮想ウェアハウスとShareオブジェクトはクローンできません。テーブル、スキーマ、データベースはクローンできます。クローン可能なその他のオブジェクトには、ステージ、ファイルフォーマット、タスク、シーケンス、ストリームが含まれます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
