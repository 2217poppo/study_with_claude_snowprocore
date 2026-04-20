# 004: External UDF Edition

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-14
**正答**: Standard

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| External UDF / External Function | コードがSnowflake外部のリモートサービスで実行されるUDF。すべてのエディションで利用可能 |
| UDF (User-Defined Function) | ユーザー定義関数。通常のUDFもExternal Functionも全エディションで基本機能としてサポート |

## 1-2. 重要コンセプトまとめ

- UDFとExternal Functionは**全エディション対応**（最小Standard）
- 「foundational features（基本機能）」はすべてのエディションでサポート
- Standard（全エディション）で使える主な機能: External Table, UDF, External Function, Database Replication, Time Travel(1日)
- Enterprise以上が必要な機能との区別が重要

## 1-3. 公式ドキュメントURL

- [Snowflake Editions](https://docs.snowflake.com/en/user-guide/intro-editions)

---

## 2-1. 問題文（英語）

> To create an external UDF, what is the minimum Snowflake edition required?
>
> A. Business Critical
> B. Virtual Private Snowflake
> C. Standard
> D. Enterprise

## 2-2. 問題文の文法解析

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| foundational features | noun | 基本機能 | UDFs are foundational features. |

## 2-3. 問題文（日本語）

> External UDFを作成するために必要な最小のSnowflakeエディションは？

---

## 3-1. 解説文（英語）

> UDFs and external functions are foundational features supported by all Snowflake editions.

## 3-3. 解説文（日本語）

> UDFと外部関数はすべてのSnowflakeエディションでサポートされる基本機能です。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
