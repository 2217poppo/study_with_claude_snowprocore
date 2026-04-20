# 085: INFORMATION_SCHEMA Account Level Objects

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-14
**正答**: True

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| INFORMATION_SCHEMA | 各DB内に自動的に存在するシステムスキーマ。DB内オブジェクト情報に加え、アカウントレベルオブジェクト（ロール・WH・DB）の情報も提供 |
| Account-level Objects | アカウント全体に属するオブジェクト。ロール、ウェアハウス、データベースなど。特定のDB配下ではない |

## 1-2. 重要コンセプトまとめ

- INFORMATION_SCHEMAは**2種類の情報**を提供する:
  1. **親データベース内のオブジェクト**（テーブル、ビュー、スキーマ等）
  2. **アカウントレベルオブジェクト**（ロール、ウェアハウス、データベース）← これがTrue
- INFORMATION_SCHEMAはDB内だけでなくアカウントレベルも参照可能

## 1-3. 公式ドキュメントURL

- [INFORMATION_SCHEMA Views and Table Functions](https://docs.snowflake.com/en/sql-reference/info-schema#information-schema-views-and-table-functions)

---

## 2-1. 問題文（英語）

> True/False: Using the INFORMATION_SCHEMA you can view information on account-level objects such as roles, warehouses, and databases.
>
> A. True
> B. False

## 2-2. 問題文の文法解析

### 文1: "Using the INFORMATION_SCHEMA you can view information on account-level objects such as roles, warehouses, and databases."

- **主語 (S)**: you
- **動詞 (V)**: can view
- **目的語 (O)**: information on account-level objects
- **修飾語 (M)**: Using the INFORMATION_SCHEMA（手段）、such as roles, warehouses, and databases（例示）
- **文型**: SVO

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| account-level objects | noun | アカウントレベルオブジェクト | Roles, warehouses, and databases. |
| parent database | noun | 親データベース | The parent database of the INFORMATION_SCHEMA. |

## 2-3. 問題文（日本語）

> 真/偽: INFORMATION_SCHEMAを使用して、ロール・ウェアハウス・データベースなどのアカウントレベルオブジェクトの情報を表示できる。

---

## 3-1. 解説文（英語）

> The INFORMATION_SCHEMA provides data on the objects in the parent database of the INFORMATION_SCHEMA. It also provides data on account-level objects such as roles, warehouses, and databases.

## 3-2. 解説文の文法解析

### 文1-2: 2つの情報提供範囲を `It also ~` で追加提示。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| provides data on ~ | phrase | ～に関するデータを提供する | Provides data on account-level objects. |

## 3-3. 解説文（日本語）

> INFORMATION_SCHEMAは、そのINFORMATION_SCHEMAの親データベース内のオブジェクトに関するデータを提供します。また、ロール・ウェアハウス・データベースなどのアカウントレベルオブジェクトに関するデータも提供します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
