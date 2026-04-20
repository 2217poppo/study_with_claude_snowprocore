# 042: Shared Object SELECT Only

**SnowPro Core Domain**: Domain 5 — Data Collaboration
**作成日**: 2026-04-15
**正答**: SELECT

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Inbound Share（受信共有） | コンシューマーが受け取る共有データ。読み取り専用 |
| Read-Only | 共有オブジェクトのアクセスレベル。SELECTのみ可能。ALTER/DELETE/DROP/UPDATEは不可 |

## 1-2. 重要コンセプトまとめ

- 共有オブジェクトに対してコンシューマーが実行可能な操作 = **SELECTのみ**
- 実行**不可能**な操作: ALTER, DELETE, DROP, UPDATE, オブジェクト追加
- 共有DBは**読み取り専用**

## 1-3. 公式ドキュメントURL

- [Introduction to Secure Data Sharing](https://docs.snowflake.com/en/user-guide/data-sharing-intro)

---

## 2-1. 問題文（英語）

> Which of the following operations can be performed on an object provided by an inbound share?
>
> A. ALTER
> B. DELETE
> C. SELECT
> D. DROP
> E. UPDATE

## 2-2. 問題文の文法解析

### 文1: "Which of the following operations can be performed on an object provided by an inbound share?"

- **主語 (S)**: Which of the following operations
- **動詞 (V)**: can be performed（受動態）
- **修飾語 (M)**: on an object provided by an inbound share（対象）
- **文型**: SV
- **注目ポイント**: `provided by an inbound share` は過去分詞の後置修飾で「受信共有で提供されたオブジェクト」。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| inbound share | noun | 受信共有 | An object provided by an inbound share. |
| read-only | adjective | 読み取り専用 | Shared objects are read-only. |

## 2-3. 問題文（日本語）

> 受信共有で提供されたオブジェクトに実行できる操作はどれですか？

---

## 3-1. 解説文（英語）

> Shared objects are read-only for the consumer and cannot be modified by the consumer. A read-only database created on Share contains the tables and other objects that the data provider added, but the consumer cannot add additional objects. The consumer cannot UPDATE, DELETE data, ALTER, or DROP any objects.

## 3-2. 解説文の文法解析

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| cannot be modified | phrase | 変更できない | Shared objects cannot be modified. |

## 3-3. 解説文（日本語）

> 共有オブジェクトはコンシューマーにとって読み取り専用であり変更できません。コンシューマーはUPDATE、DELETE、ALTER、DROPのいずれの操作も実行できません。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
