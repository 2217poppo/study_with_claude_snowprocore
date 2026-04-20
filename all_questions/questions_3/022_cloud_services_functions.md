# 022: Cloud Services Layer Functions

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-15
**正答**: A, B, D

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Cloud Services Layer | Snowflakeの3層の最上位。クエリ最適化・クエリプランニング・結果キャッシュ・メタデータ管理・認証等を担当 |
| Query Processing | クエリの実際の実行処理。**Query Processing Layer（仮想WH）** が担当。Cloud Servicesの機能ではない |

## 1-2. 重要コンセプトまとめ

- Cloud Services Layerの機能:
  - **Query Optimization**（クエリ最適化）✅
  - **Query Planning**（クエリプランニング）✅
  - **Query Result Caching**（結果キャッシュ保存）✅
  - メタデータ管理、認証、アクセス制御等
- Cloud Servicesの機能**ではない**:
  - **Query Processing**（クエリ実行）❌ → Query Processing Layer（WH）が担当

## 1-3. 公式ドキュメントURL

- [Cloud Services](https://docs.snowflake.com/en/user-guide/intro-key-concepts#cloud-services)

---

## 2-1. 問題文（英語）

> Which of the following functions does the Cloud Services Layer perform? Select all that apply.
>
> A. Query Optimization
> B. Query Result Caching
> C. Query Processing
> D. Query Planning

## 2-3. 問題文（日本語）

> Cloud Servicesレイヤーが実行する機能はどれですか？

---

## 3-1. 解説文（英語）

> The cloud services layer is responsible for query planning and optimization. Virtual warehouses perform the query processing, but once a result set has been created, it is stored in the query result cache, which is part of the cloud services layer.

## 3-3. 解説文（日本語）

> Cloud Servicesレイヤーはクエリプランニングと最適化を担当します。クエリ処理は仮想ウェアハウスが実行しますが、結果セットが作成されるとCloud Servicesレイヤーの一部であるクエリ結果キャッシュに保存されます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
