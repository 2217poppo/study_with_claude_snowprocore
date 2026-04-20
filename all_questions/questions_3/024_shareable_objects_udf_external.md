# 024: Shareable Objects UDF External Tables

**SnowPro Core Domain**: Domain 5 — Data Collaboration
**作成日**: 2026-04-15
**正答**: B, D, E

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Direct Data Sharing | アカウント間でデータをコピーなしで共有する機能 |
| Shareable Objects | 共有可能な5種類: Tables, External Tables, Secure Views, Secure MVs, Secure UDFs |

## 1-2. 重要コンセプトまとめ

- 共有可能オブジェクト（**5種類**、暗記必須）:
  1. **Tables** ✅
  2. **External Tables** ✅
  3. **Secure Views** ✅
  4. **Secure Materialized Views** ✅
  5. **Secure UDFs** ✅
- 共有**不可能**: Virtual Warehouses, Resource Monitors, Users, Accounts, Roles
- 繰り返し出題される重要トピック — 5種類を確実に覚える

## 1-3. 公式ドキュメントURL

- [Introduction to Secure Data Sharing](https://docs.snowflake.com/en/user-guide/data-sharing-intro)

---

## 2-1. 問題文（英語）

> Which of the following objects may be shared via direct data sharing?
>
> A. Virtual Warehouses
> B. Tables
> C. Resource Monitors
> D. Secure UDFs
> E. External Tables

## 2-3. 問題文（日本語）

> Direct Data Sharingで共有可能なオブジェクトはどれですか？

---

## 3-1. 解説文（英語）

> Direct data sharing enables sharing of the following types of objects: Tables, External tables, Secure views, Secure materialized views, Secure UDFs.

## 3-3. 解説文（日本語）

> Direct Data Sharingは以下の種類のオブジェクトの共有を可能にします: テーブル、外部テーブル、セキュアビュー、セキュアマテリアライズドビュー、セキュアUDF。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
