# 104: External Tokenization Security

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-14
**正答**: Column-level security

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| External Tokenization（外部トークン化） | 機密データをトークン（代替値）に置き換えて保護する手法。**列レベルセキュリティ**を実現。Dynamic Data Maskingと同カテゴリ |
| Column-level Security（列レベルセキュリティ） | テーブルの特定列へのアクセスを制御するセキュリティ。Dynamic Data MaskingまたはExternal Tokenizationで実現 |
| Dynamic Data Masking | ロールに応じて列データをマスク（隠蔽）する機能。列レベルセキュリティの実現手段の1つ |
| Row Access Policy | **行**レベルのセキュリティ。External Tokenizationとは異なる |

## 1-2. 重要コンセプトまとめ

- External Tokenization = **Column-level security**（列レベルセキュリティ）
- 列レベルセキュリティの2つの実現手段:
  1. **Dynamic Data Masking**（マスキング）
  2. **External Tokenization**（トークン化）
- 混同しやすい概念の整理:
  - **Column-level**: Dynamic Data Masking, External Tokenization
  - **Row-level**: Row Access Policy
  - **Object-level**: GRANT/REVOKE（SECURITYADMINが管理）

## 1-3. 公式ドキュメントURL

- [Column-level Security](https://docs.snowflake.com/en/user-guide/security-column)

---

## 2-1. 問題文（英語）

> External Tokenization provides what sort of security in Snowflake?
>
> A. Object Security
> B. Database-level security
> C. Row-level security
> D. Column-level security

## 2-2. 問題文の文法解析

### 文1: "External Tokenization provides what sort of security in Snowflake?"

- **注目ポイント**: `what sort of ~` は「どのような種類の～」。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| tokenization | noun | トークン化 | External Tokenization for column security. |
| enforced at the column level | phrase | 列レベルで強制される | Masking policies enforced at the column level. |

## 2-3. 問題文（日本語）

> External TokenizationはSnowflakeでどのようなセキュリティを提供しますか？

---

## 3-1. 解説文（英語）

> Snowflake supports masking policies that may be applied to columns and enforced at the column level to provide column-level security. Column-level security is achieved by dynamic data masking or external Tokenization.

## 3-3. 解説文（日本語）

> Snowflakeは列に適用され列レベルで強制されるマスキングポリシーをサポートし、列レベルセキュリティを提供します。列レベルセキュリティはDynamic Data MaskingまたはExternal Tokenizationによって実現されます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
