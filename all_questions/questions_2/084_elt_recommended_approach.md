# 084: ELT Recommended Approach

**SnowPro Core Domain**: Domain 3 — Data Loading, Unloading, and Connectivity
**作成日**: 2026-04-14
**正答**: ELT (Extract, Load, Transform)

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| ELT (Extract, Load, Transform) | データを抽出→Snowflakeにロード→Snowflake内で変換するアプローチ。Snowflakeの処理能力を活用。Snowflake推奨 |
| ETL (Extract, Transform, Load) | データを抽出→外部で変換→Snowflakeにロードするアプローチ。従来型。Snowflakeの処理能力を活用しない |

## 1-2. 重要コンセプトまとめ

- Snowflakeが推奨するのは **ELT**（Extract, Load, Transform）
- ELTの利点:
  - Snowflakeの強力な処理能力（コンピュート）を変換に活用
  - 変換前の生データもSnowflakeに保持される
  - 変換ロジックの変更が容易
- ETLとの違い:
  - ETL: 外部ツールで変換してからロード（Snowflakeの処理能力を活用しない）
  - ELT: 先にロードしてSnowflake内で変換（Snowflakeの処理能力を最大活用）

## 1-3. 公式ドキュメントURL

- [Data Loading Overview](https://docs.snowflake.com/en/user-guide/data-load-overview)

---

## 2-1. 問題文（英語）

> For data loading and transformation, the approach recommended by Snowflake is?
>
> A. ELT (Extract, Load, Transform)
> B. ETL (Extract, Transform, Load)

## 2-2. 問題文の文法解析

### 文1: "For data loading and transformation, the approach recommended by Snowflake is?"

- **主語 (S)**: the approach recommended by Snowflake
- **動詞 (V)**: is
- **文型**: SVC（疑問文）
- **注目ポイント**: `recommended by Snowflake` は過去分詞の後置修飾。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| utilize | verb | 活用する | ELT utilizes the processing power of Snowflake. |
| processing power | noun | 処理能力 | Snowflake's processing power. |

## 2-3. 問題文（日本語）

> データのロードと変換において、Snowflakeが推奨するアプローチは？
>
> A. ELT（抽出、ロード、変換）
> B. ETL（抽出、変換、ロード）

---

## 3-1. 解説文（英語）

> The ELT approach utilizes the processing power of Snowflake to transform the data after it has been loaded.

## 3-2. 解説文の文法解析

### 文1: "The ELT approach utilizes the processing power of Snowflake to transform the data after it has been loaded."

- **主語 (S)**: The ELT approach
- **動詞 (V)**: utilizes
- **目的語 (O)**: the processing power of Snowflake
- **修飾語 (M)**: to transform the data（目的）、after it has been loaded（条件）
- **文型**: SVO
- **注目ポイント**: `utilizes ~ to ~` で「～を活用して～する」。`after it has been loaded` で「ロード後に」。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| utilize | verb | 活用する | Utilizes the processing power. |
| after it has been loaded | phrase | ロードされた後に | Transform after it has been loaded. |

## 3-3. 解説文（日本語）

> ELTアプローチは、データがロードされた後にSnowflakeの処理能力を活用してデータを変換します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
