# 033: Cloud Services Layer Caches

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-15
**正答**: A, B

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Metadata Cache | Cloud Servicesレイヤーに保存。テーブル・列の統計情報 |
| Query Result Cache | Cloud Servicesレイヤーに保存。過去のクエリ結果 |
| Virtual Warehouse Cache | WHのローカルSSDに保存。Cloud Servicesレイヤーではない |

## 1-2. 重要コンセプトまとめ

- Cloud Servicesレイヤーに保存されるキャッシュ:
  - **Metadata Cache** ✅
  - **Query Result Cache** ✅
- Cloud Servicesレイヤーに**保存されない**:
  - **Virtual Warehouse Cache** ❌（WHのローカルSSD）
  - Web Cache / JDBC Cache ❌（存在しない）

## 1-3. 公式ドキュメントURL

- [Using Persisted Query Results](https://docs.snowflake.com/en/user-guide/querying-persisted-results)

---

## 2-1. 問題文（英語）

> Which of the following caches are stored in the cloud services layer? Select all that apply.
>
> A. Metadata Cache
> B. Query Result Cache
> C. Virtual Warehouse Cache
> D. Web Cache
> E. JDBC Cache

## 2-3. 問題文（日本語）

> Cloud Servicesレイヤーに保存されるキャッシュはどれですか？

---

## 3-1. 解説文（英語）

> The cloud services layer stores the Query Result Cache and Metadata Cache. The virtual warehouse cache is stored locally in a virtual warehouse.

## 3-3. 解説文（日本語）

> Cloud Servicesレイヤーはクエリ結果キャッシュとメタデータキャッシュを保存します。ウェアハウスキャッシュは仮想ウェアハウスにローカルに保存されます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
