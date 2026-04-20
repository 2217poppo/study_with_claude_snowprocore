# 077: Secure UDF Data Protection

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-13
**正答**: B, C

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Secure UDF（セキュアUDF） | データ保護を目的としたUDF。SQL最適化を無効化してデータの間接アクセスを防ぎ、UDF定義を所有者以外から隠す |
| UDF (User-Defined Function) | ユーザー定義関数。通常のUDFはSQL簡略化が目的。セキュアUDFはデータ保護が目的 |
| Column Limiting（列制限） | 結果セットから特定の列を除外してデータを保護する手法 |
| Row Limiting（行制限） | 結果セットから特定の行をフィルタリングしてデータを保護する手法 |

## 1-2. 重要コンセプトまとめ

- **Secure UDFが必要**な場合:
  - 結果セットから**特定の列を制限**してデータを保護する（Column Limiting）
  - 結果セットから**行のサブセットを制限**してデータを保護する（Row Limiting）
- **Secure UDFが不要**な場合:
  - 複雑なSQLの簡略化（→ 通常のUDFで十分）
  - 同じロジックの再利用（→ 通常のUDFで十分）
- Secure UDF vs 通常のUDF:
  - **通常のUDF**: SQLの簡略化・再利用が目的
  - **Secure UDF**: データ保護が目的（列・行の制限）
- キーワード: `protect data` → Secure UDFが必要

## 1-3. 公式ドキュメントURL

- [Secure UDFs and Stored Procedures](https://docs.snowflake.com/en/developer-guide/secure-udf-procedure)

---

## 2-1. 問題文（英語）

> Which of the following requirements can be fulfilled by only a secure UDF? Select all that apply.
>
> A. There is a requirement to simplify complex SQL so that users don't have to re-code the same logic repeatedly.
> B. There is a requirement to protect data by limiting some table columns from the result set.
> C. There is a requirement to protect data by limiting a subset of rows from the result set.

## 2-2. 問題文の文法解析

### 文1: "Which of the following requirements can be fulfilled by only a secure UDF?"

- **主語 (S)**: Which of the following requirements
- **動詞 (V)**: can be fulfilled（受動態）
- **修飾語 (M)**: by only a secure UDF（手段+限定）
- **文型**: SV（受動態疑問文）
- **注目ポイント**: `fulfilled by only ~` は「～によってのみ満たされる」。`only` がSecure UDF限定であることを強調。

### 選択肢B: "There is a requirement to protect data by limiting some table columns from the result set."

- **注目ポイント**: `protect data by ~ing` は「～することでデータを保護する」。`limiting ~ from ~` は「～から～を制限する」。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| fulfilled | adjective | 満たされた | Requirements fulfilled by a secure UDF. |
| protect data | phrase | データを保護する | Protect data by limiting columns. |
| a subset of rows | noun | 行のサブセット | Limiting a subset of rows. |
| repeatedly | adverb | 繰り返し | Don't have to re-code repeatedly. |

## 2-3. 問題文（日本語）

> 以下の要件のうち、セキュアUDFによってのみ満たされるものはどれですか？該当するものをすべて選んでください。
>
> A. ユーザーが同じロジックを繰り返しコーディングしなくて済むよう、複雑なSQLを簡略化する要件がある。
> B. 結果セットから一部のテーブル列を制限することでデータを保護する要件がある。
> C. 結果セットから行のサブセットを制限することでデータを保護する要件がある。

---

## 3-1. 解説文（英語）

> SQL UDFs should be created as secure if their purpose is to protect data, such as views that limit the rows returned to the user or the columns.

## 3-2. 解説文の文法解析

### 文1: "SQL UDFs should be created as secure if their purpose is to protect data, such as views that limit the rows returned to the user or the columns."

- **主語 (S)**: SQL UDFs
- **動詞 (V)**: should be created（受動態）
- **修飾語 (M)**: as secure（資格）、if their purpose is to protect data（条件）、such as views that limit ~（例示）
- **文型**: SV（受動態）
- **注目ポイント**: `should be created as secure` で「セキュアとして作成すべき」。`if their purpose is to protect data` で条件を明示。`such as ~` で具体例を列挙。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| should be created as secure | phrase | セキュアとして作成すべき | UDFs should be created as secure. |
| purpose | noun | 目的 | If their purpose is to protect data. |
| limit the rows returned | phrase | 返される行を制限する | Views that limit the rows returned. |

## 3-3. 解説文（日本語）

> SQL UDFは、その目的がデータ保護である場合、セキュアとして作成すべきです。例えば、ユーザーに返される行や列を制限するビューなどです。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
