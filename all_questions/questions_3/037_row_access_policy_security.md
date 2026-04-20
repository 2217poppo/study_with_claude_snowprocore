# 037: Row Access Policy Security

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-15
**正答**: Row Level Security

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Row Access Policy | テーブルの行へのアクセスをロールに基づいて制御するポリシー。**行レベルセキュリティ（Row Level Security）** を実現 |
| Row Level Security | 行単位でアクセス制御するセキュリティ手法。Row Access Policyで実装 |
| Column Level Security | 列単位でアクセス制御。Dynamic Data MaskingまたはExternal Tokenizationで実装。行レベルとは別 |
| Dynamic Data Masking | 列レベルセキュリティの実装手法。Row Access Policyとは異なる |

## 1-2. 重要コンセプトまとめ

- Row Access Policy = **Row Level Security**（行レベルセキュリティ）
- セキュリティ手法の対応:
  - **行レベル**: Row Access Policy
  - **列レベル**: Dynamic Data Masking / External Tokenization
- 「Row Elimination」はSnowflakeの用語ではない

## 1-3. 公式ドキュメントURL

- [Row-Level Security](https://docs.snowflake.com/en/user-guide/security-row-intro)

---

## 2-1. 問題文（英語）

> Your security administrator has created Row Access Policies on a table. What type of security has the administrator implemented?
>
> A. Dynamic Data Masking
> B. Row Level Security
> C. Column Level Security
> D. Row Elimination

## 2-3. 問題文（日本語）

> セキュリティ管理者がテーブルにRow Access Policyを作成しました。実装されたセキュリティの種類は？

---

## 3-1. 解説文（英語）

> Row-level security is implemented by creating row access policies, which include conditions and functions that govern which rows are returned during query execution.

## 3-3. 解説文（日本語）

> 行レベルセキュリティは行アクセスポリシーを作成することで実装されます。ポリシーにはクエリ実行時にどの行を返すかを制御する条件と関数が含まれます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
