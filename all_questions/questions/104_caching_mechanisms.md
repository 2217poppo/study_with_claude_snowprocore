# 104: Caching Mechanisms in Snowflake

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-06
**正答**: Metadata Caching / Warehouse Caching / Query Result Caching

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Metadata Caching（メタデータキャッシュ） | Cloud Services Layerがテーブルの行数・最大/最小値などのメタ情報をキャッシュする仕組み。**ウェアハウス不要**でクエリを処理できる。`SELECT COUNT(*)` などのメタデータのみで完結するクエリが対象 |
| Query Result Caching（クエリ結果キャッシュ） | 過去に実行済みのクエリの結果をCloud Services Layerにキャッシュする仕組み。同一クエリかつデータ未変更の条件下で再利用される。**ウェアハウス不要**。24時間有効（最大31日延長） |
| Warehouse Caching（ウェアハウスキャッシュ） | 仮想ウェアハウス内のローカルSSDにスキャン済みデータブロックをキャッシュする仕組み。**ウェアハウスが稼働中である必要あり**。過去に実行したクエリの結果ではなくデータブロック自体をキャッシュする |
| Index Caching（インデックスキャッシュ） | **Snowflakeには存在しない**キャッシュ機構。従来のRDBMSにはインデックスがあるが、Snowflakeはマイクロパーティションとメタデータで代替するためインデックスを持たない |
| Memory Caching（メモリキャッシュ） | **Snowflakeの公式キャッシュ機構ではない**。（ウェアハウスキャッシュはSSDベース） |

## 1-2. 重要コンセプトまとめ

- **正解3つ**: Metadata Caching / Warehouse Caching / Query Result Caching
- **不正解2つ**: Index Caching（存在しない）/ Memory Caching（公式機構でない）
- **ユーザーの誤選択**: Index Caching を選択してしまった（Snowflakeにインデックスはない）

### 3つのキャッシュの比較

| キャッシュ | 保存場所 | WH必要 | 対象 | 有効期限 |
|-----------|---------|--------|------|---------|
| Metadata Cache | Cloud Services Layer | 不要 | 行数・最大/最小値など | 常時 |
| Query Result Cache | Cloud Services Layer | 不要 | 過去クエリの結果 | 24時間（最大31日） |
| Warehouse Cache | ウェアハウス（ローカルSSD） | 必要 | スキャン済みデータブロック | WH稼働中 |

- **Snowflakeにはインデックスがない**: マイクロパーティションのメタデータ（最大/最小値）がインデックスに相当する役割を担う
- **試験頻出**: 「Snowflakeのキャッシュ機構を選べ」→ Index Caching / Memory Caching は存在しない

## 1-3. 公式ドキュメントURL

- [Query Profile](https://docs.snowflake.com/en/user-guide/ui-query-profile)
- [Caching in Snowflake](https://docs.snowflake.com/en/user-guide/querying-persisted-results)

---

## 2-1. 問題文（英語）

> Which of the following are caching mechanisms in Snowflake? Select all that apply.
>
> A. Index Caching
> B. Metadata Caching ✅
> C. Warehouse Caching ✅
> D. Memory Caching
> E. Query Result Caching ✅

## 2-2. 問題文の文法解析

### 文1: "Which of the following are caching mechanisms in Snowflake?"

- **主語 (S)**: Which of the following
- **動詞 (V)**: are
- **補語 (C)**: caching mechanisms in Snowflake
- **文型**: SVC（疑問文）
- **注目ポイント**:
  - **"Which of the following are ~"**: 「次のうちどれが〜であるか」。複数の正解を想定する場合は `is` ではなく `are` を使う。`Select all that apply` が続くことで複数選択問題だとわかる
  - **"caching mechanisms"**: 「キャッシュの仕組み・キャッシュ機構」。`mechanism`（仕組み・メカニズム）は技術文書で「内部的な動作の仕組み」を指す。`caching` が形容詞として `mechanisms` を修飾

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| caching mechanism | 名詞句 | キャッシュの仕組み・キャッシュ機構 | Metadata caching is one of the caching mechanisms in Snowflake. |
| mechanism | 名詞 | 仕組み・メカニズム | Snowflake uses several mechanisms to optimize query performance. |

## 2-3. 問題文（日本語）

> 次のうち、Snowflakeのキャッシュ機構はどれか？当てはまるものをすべて選べ。
>
> A. インデックスキャッシュ
> B. メタデータキャッシュ ✅
> C. ウェアハウスキャッシュ ✅
> D. メモリキャッシュ
> E. クエリ結果キャッシュ ✅

---

## 3-1. 解説文（英語）

> Metadata caching is used for queries that can be fulfilled directly from metadata, e.g., the row count of a table Query Result Caching is for queries that have been executed already. Warehouse caching is within the virtual warehouse instance and is usually based on queries that have already been executed.

## 3-2. 解説文の文法解析

### 文1: "Metadata caching is used for queries that can be fulfilled directly from metadata, e.g., the row count of a table"

- **主語 (S)**: Metadata caching
- **動詞 (V)**: is used for（受動態）
- **目的語 (O)**: queries that can be fulfilled directly from metadata
- **例示**: e.g., the row count of a table
- **文型**: SV（受動態）
- **注目ポイント**:
  - **"is used for queries that can be fulfilled"**: `be used for + 名詞`（〜に使われる）。`that can be fulfilled`（満たすことができる）は関係詞節 + 受動態で「実行可能なクエリ」を修飾
  - **"fulfilled directly from metadata"**: 「メタデータから直接充足される」。`fulfill`（要求を満たす・実行する）+ `from metadata` でデータスキャン不要を示す。Q002でも登場した `fulfill a query` パターン
  - **"e.g., the row count of a table"**: 「例えばテーブルの行数」。`e.g.,`（= for example）で具体例を追加

### 文2: "Query Result Caching is for queries that have been executed already."

- **主語 (S)**: Query Result Caching
- **動詞 (V)**: is for
- **目的語 (O)**: queries that have been executed already
- **文型**: SVO（`is for ~` = 〜のためのものである）
- **注目ポイント**:
  - **"is for queries that ~"**: 「〜なクエリのためのもの」。`be for ~`（〜のためにある・〜に使う）は用途・目的を示す
  - **"have been executed already"**: 現在完了受動態 `have been pp`（すでに実行された）。`already`（すでに）が「過去の実行」を強調。「既に実行済み」がQuery Result Cacheの利用条件

### 文3: "Warehouse caching is within the virtual warehouse instance and is usually based on queries that have already been executed."

- **主語 (S)**: Warehouse caching
- **動詞1 (V1)**: is（場所）
- **場所 (M1)**: within the virtual warehouse instance
- **動詞2 (V2)**: is based on（`and` で並列）
- **基準 (M2)**: queries that have already been executed
- **文型**: SVC and SVC（場所・根拠の並列）
- **注目ポイント**:
  - **"within the virtual warehouse instance"**: 「仮想ウェアハウスインスタンスの内部に」。`within`（〜の内部に）で保存場所を明示。`inside`より書き言葉的
  - **"is usually based on ~"**: 「通常〜を基にしている」。`be based on ~`（〜に基づく）+ `usually`（通常）で「一般的な傾向」を示す。`always` ではなく `usually` を使って柔軟性を持たせる

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| fulfilled | 過去分詞 | 充足された・実行された | Queries fulfilled from metadata don't require a warehouse. |
| instance | 名詞 | インスタンス・実体 | Warehouse caching is within the virtual warehouse instance. |
| based on ~ | 形容詞句 | 〜に基づく | Warehouse caching is based on previously executed queries. |

## 3-3. 解説文（日本語）

> メタデータキャッシュは、テーブルの行数のように、メタデータから直接処理できるクエリに使用されます。クエリ結果キャッシュは、すでに実行されたクエリのためのものです。ウェアハウスキャッシュは仮想ウェアハウスインスタンス内にあり、通常はすでに実行されたクエリを基にしています。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
