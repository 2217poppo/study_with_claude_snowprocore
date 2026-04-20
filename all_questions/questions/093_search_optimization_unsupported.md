# 093: Search Optimization — Unsupported Features

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-06
**正答**: A・C・E（3つ選択）
- A: Materialized Views（ユーザーが選択漏れ）
- C: External Tables ✓
- E: Cast on table columns ✓

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Search Optimization Service（検索最適化サービス） | ポイントルックアップ・部分文字列検索・VARIANT列クエリを高速化するSnowflakeのサービス。追加のサーチアクセスパスを構築し、スキャンするデータ量を削減する |
| COLLATE clause（照合句） | 文字列の照合順序（大文字/小文字の区別等）を指定するSQL句。`COLLATE` が定義されたカラムはSearch Optimizationの対象外 |
| Column concatenation（カラム連結） | `||` 演算子などで複数のカラムを結合する操作。Search Optimizationでサポートされない |
| Analytical expressions（分析式） | ウィンドウ関数（`OVER`句）などの分析的SQL式。Search Optimizationでサポートされない |
| Casts on table columns（テーブルカラムへのキャスト） | カラムの型を変換する操作（例: `CAST(col AS VARCHAR)`）。**原則としてサポートされない**が例外あり：固定小数点数（fixed-point numbers）を文字列にキャストする場合は対応 |
| Fixed-point numbers（固定小数点数） | 小数点の位置が固定された数値（例: NUMBER, DECIMAL型）。Castのサポート例外対象。浮動小数点数（FLOAT, DOUBLE）とは異なる |

## 1-2. 重要コンセプトまとめ

- **Search Optimizationがサポートしない機能（公式リスト）**:
  1. **External tables** ✓（外部テーブル）
  2. **Materialized views** ✓（マテリアライズドビュー）
  3. **Columns defined with a COLLATE clause**（COLLATE句で定義されたカラム）
  4. **Column concatenation**（カラム連結）
  5. **Analytical expressions**（分析式）
  6. **Casts on table columns** ✓（テーブルカラムへのキャスト）— 例外: 固定小数点数→文字列変換は対応

- **混乱しやすいポイント**:
  - Integer Columns（整数型カラム）→ **サポートされる**（非サポートではない）
  - Date Columns（日付型カラム）→ **サポートされる**（非サポートではない）
  - Materialized Views → **サポートされない**（ビューではなく直接テーブルに適用）

- **「Select three answers」の注意**: 5択から3つ選ぶ問題。全部の非サポート項目のリストを暗記するより、「External Tables」「Materialized Views」「Casts（固定小数点除く）」を確実に覚える

- **試験での復習重点**: Search Optimizationの用途（何に使えるか）とあわせて「何に使えないか」の両方を押さえる

## 1-3. 公式ドキュメントURL

- [Queries Not Supported by the Search Optimization Service](https://docs.snowflake.com/en/user-guide/search-optimization-service#queries-not-supported-by-the-search-optimization-service)

---

## 2-1. 問題文（英語）

> Which of the following are not supported by Search Optimization? Select three answers.
>
> A. Materialized Views
> B. Integer Columns
> C. External Tables
> D. Date Columns
> E. Cast on table columns

## 2-2. 問題文の文法解析

### 文1: "Which of the following are not supported by Search Optimization?"

- **主語 (S)**: Which of the following（疑問詞節、複数）
- **動詞 (V)**: are not supported（受動態、否定）
- **修飾語 (M)**: by Search Optimization（行為者）
- **文型**: SV（受動態・否定）
- **注目ポイント**:
  - **"are not supported by ~"**: 「〜によってサポートされない」。受動態の否定形。`does not support ~`（能動態）と同義だが、主語が機能（Search Optimization）ではなく特徴（選択肢）になる視点の転換
  - **"Select three answers"**: 「3つ回答を選べ」。`Select all that apply` の数量限定版。回答数の指定に注意

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| supported by ~ | 受動態 | 〜によってサポートされる | External tables are not supported by Search Optimization. |
| cast | 名詞/動詞 | 型変換（キャスト）する | Casts on table columns are not supported (with exceptions). |

## 2-3. 問題文（日本語）

> 次のうち、Search Optimizationによってサポートされないものはどれですか？3つ選んでください。
>
> A. マテリアライズドビュー
> B. 整数型カラム（Integer Columns）
> C. 外部テーブル（External Tables）
> D. 日付型カラム（Date Columns）
> E. テーブルカラムへのキャスト（Cast on table columns）

---

## 3-1. 解説文（英語）

> Search optimization does not support
>
> - External tables.
> - Materialized views.
> - Columns defined with a COLLATE clause.
> - Column concatenation.
> - Analytical expressions.
> - Casts on table columns (except for fixed-point numbers cast to strings).

## 3-2. 解説文の文法解析

### 文1: "Search optimization does not support [list]"

- **主語 (S)**: Search optimization
- **動詞 (V)**: does not support（否定）
- **目的語 (O)**: 箇条書きリスト（6項目）
- **文型**: SVO（否定）
- **注目ポイント**:
  - **箇条書き形式の目的語**: 「does not support + リスト」の形で非サポート項目を簡潔に列挙する技術文書の定番スタイル

### 項目: "Columns defined with a COLLATE clause."

- **注目ポイント**:
  - **"defined with a COLLATE clause"**: 過去分詞句 `defined with ~` が `Columns` を後置修飾。「COLLATE句で定義されたカラム」

### 項目: "Casts on table columns (except for fixed-point numbers cast to strings)."

- **注目ポイント**:
  - **"except for fixed-point numbers cast to strings"**: 「文字列にキャストされた固定小数点数を除いて」。`except for ~`（〜を除いて）でルールの例外を明示するパターン。試験で「except for」の後の内容が引っかけになる

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| COLLATE clause | 名詞句 | 照合句（文字の比較順序を定義） | Columns defined with a COLLATE clause are not supported. |
| concatenation | 名詞 | 連結、結合 | Column concatenation is not supported by Search Optimization. |
| analytical expressions | 名詞句 | 分析式（ウィンドウ関数等） | Analytical expressions are excluded from Search Optimization. |
| fixed-point numbers | 名詞句 | 固定小数点数（NUMBER, DECIMAL型） | Fixed-point numbers cast to strings are an exception. |
| except for ~ | 前置詞句 | 〜を除いて | Casts are not supported, except for fixed-point to string conversions. |

## 3-3. 解説文（日本語）

> Search Optimizationは以下をサポートしません：
>
> - 外部テーブル（External tables）
> - マテリアライズドビュー（Materialized views）
> - COLLATE句で定義されたカラム
> - カラムの連結（Column concatenation）
> - 分析式（Analytical expressions）
> - テーブルカラムへのキャスト（ただし、固定小数点数を文字列にキャストする場合を除く）

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
