# 026: Column Level Masking Edition

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-15
**正答**: Enterprise

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Column-level Masking | Dynamic Data Maskingにより特定列のデータをロールに応じてマスク（隠蔽）する機能。Enterprise以上で利用可能 |
| Enterprise Edition | Standardの全機能に加え、Multi-Cluster WH・Column-level Masking・Row Access Policy・MV・Search Optimizationが追加されるエディション |

## 1-2. 重要コンセプトまとめ

- Column-level Maskingの最小エディション = **Enterprise**
- Enterprise以上で追加される5機能（暗記必須）:
  1. **Multi-Cluster Virtual Warehouse**
  2. **Column-level Masking**（列レベルマスキング）← 本問
  3. **Row Access Policy**（行アクセスポリシー）
  4. **Materialized Views**
  5. **Search Optimization Service**
- 覚え方: **「マルチ・マスク・行ポリシー・MV・検索最適化」**

## 1-3. 公式ドキュメントURL

- [Snowflake Editions](https://docs.snowflake.com/en/user-guide/intro-editions)

---

## 2-1. 問題文（英語）

> What is the minimum Snowflake edition that supports Column Level Masking?
>
> A. Virtual Private Snowflake
> B. Enterprise
> C. Business Critical
> D. Standard

## 2-2. 問題文の文法解析

### 文1: "What is the minimum Snowflake edition that supports Column Level Masking?"

- **主語 (S)**: What
- **動詞 (V)**: is
- **補語 (C)**: the minimum Snowflake edition
- **修飾語 (M)**: that supports Column Level Masking（関係詞節）
- **文型**: SVC（疑問文）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| column-level masking | noun | 列レベルマスキング | Enterprise supports column-level masking. |
| additional capabilities | noun | 追加機能 | Several additional capabilities not in Standard. |

## 2-3. 問題文（日本語）

> Column Level Maskingをサポートする最小のSnowflakeエディションは？

---

## 3-1. 解説文（英語）

> The Enterprise edition has several additional capabilities not provided in the Standard edition. These include multi-cluster virtual warehouses, column-level masking, row access policies, materialized views, and search optimization.

## 3-2. 解説文の文法解析

### 文1: "The Enterprise edition has several additional capabilities not provided in the Standard edition."

- **注目ポイント**: `capabilities not provided in ~` は「～では提供されていない機能」。過去分詞の後置修飾。

### 文2: "These include multi-cluster virtual warehouses, column-level masking, row access policies, materialized views, and search optimization."

- **注目ポイント**: `These include ~` で5機能を列挙。

## 3-3. 解説文（日本語）

> Enterprise EditionにはStandard Editionでは提供されていない追加機能がいくつかあります。マルチクラスターWH、列レベルマスキング、行アクセスポリシー、マテリアライズドビュー、検索最適化が含まれます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
