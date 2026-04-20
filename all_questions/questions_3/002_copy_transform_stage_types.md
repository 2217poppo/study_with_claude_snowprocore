# 002: COPY Transform Stage Types

**SnowPro Core Domain**: Domain 3 — Data Loading, Unloading, and Connectivity
**作成日**: 2026-04-14
**正答**: A, B

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Basic Transformations | COPYロード時にSELECT文で行える簡易変換。列順序変更・列省略・データ型キャスト・データ切り詰めなど |
| Named Internal Stage | ユーザーが明示的に作成する内部ステージ。`CREATE STAGE` で作成。基本変換**可能** |
| External Stage | 外部クラウドストレージを参照するステージ。基本変換**可能** |
| User Stage | 各ユーザーに自動付与される個人ステージ（`@~`）。基本変換**可能** |
| Table Stage | 各テーブルに自動付与されるステージ（`@%table_name`）。基本変換**不可** |

## 1-2. 重要コンセプトまとめ

- COPYロード時の基本変換が**可能**なステージ:
  - **Named Internal Stage** ✅
  - **External Stage** ✅
  - **User Stage** ✅
- 基本変換が**不可能**なステージ:
  - **Table Stage** ❌
- Table Stageだけが例外 — 他の3種類はすべて基本変換可能
- 基本変換の内容: 列順序変更・列省略・型キャスト・切り詰め

## 1-3. 公式ドキュメントURL

- [Table Stages](https://docs.snowflake.com/en/user-guide/data-load-local-file-system-create-stage#table-stages)

---

## 2-1. 問題文（英語）

> Basic Transformations during the COPY process are supported by which of the following stage types?
>
> A. Named Internal Stage
> B. External Stage
> C. Table Stage

## 2-2. 問題文の文法解析

### 文1: "Basic Transformations during the COPY process are supported by which of the following stage types?"

- **主語 (S)**: Basic Transformations during the COPY process
- **動詞 (V)**: are supported（受動態）
- **修飾語 (M)**: by which of the following stage types（動作主+疑問）
- **文型**: SV（受動態疑問文）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| basic transformations | noun | 基本変換 | Transformations during the COPY process. |
| do not allow | phrase | 許可しない | Table stages do not allow basic transformations. |

## 2-3. 問題文（日本語）

> COPYプロセス中の基本変換をサポートするステージタイプはどれですか？

---

## 3-1. 解説文（英語）

> The table stages do not allow basic transformations during the COPY process; thus, basic transformations may only be performed while loading data from external stages, named internal stages or user stages.

## 3-2. 解説文の文法解析

### 文1: "The table stages do not allow basic transformations during the COPY process; thus, basic transformations may only be performed while loading data from external stages, named internal stages or user stages."

- **主語 (S)**: The table stages / basic transformations
- **動詞 (V)**: do not allow / may only be performed
- **修飾語 (M)**: thus（結論）、while loading data from ~（条件）
- **文型**: SVO + SV
- **注目ポイント**: `may only be performed while ~` で「～の場合にのみ実行可能」。Table Stageの制限を否定文で述べてから、可能なステージを列挙。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| may only be performed | phrase | ～の場合にのみ実行可能 | May only be performed from named stages. |

## 3-3. 解説文（日本語）

> テーブルステージはCOPYプロセス中の基本変換を許可しません。したがって、基本変換は外部ステージ、名前付き内部ステージ、またはユーザーステージからデータをロードする場合にのみ実行可能です。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
