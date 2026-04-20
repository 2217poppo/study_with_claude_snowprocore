# 025: Snowflake Cost Contributors

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-15
**正答**: A, C

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Storage Cost | 実際に使用したストレージ量に対する費用。テーブル・内部ステージ・Time Travel・Fail-Safeが対象 |
| Compute Cost | 仮想WHの稼働（resumed）時間に対する費用。クエリ実行中かどうかは無関係。Suspended中は無料 |

## 1-2. 重要コンセプトまとめ

- Snowflakeのコストに寄与するもの:
  - **ストレージ使用量** ✅
  - **アクティブな仮想WH** ✅（resumed状態なら課金、クエリ未実行でも）
- コストに寄与**しない**もの:
  - テーブル数 ❌
  - ユーザー数 ❌
- WHがresumedならクエリを実行していなくてもコスト発生

## 1-3. 公式ドキュメントURL

- [Understanding Compute Cost](https://docs.snowflake.com/en/user-guide/cost-understanding-compute)
- [Understanding Data Storage](https://docs.snowflake.com/en/user-guide/cost-understanding-data-storage)

---

## 2-1. 問題文（英語）

> Which of the following contributes toward the costs of a Snowflake system?
>
> A. The amount of storage used.
> B. Number of tables.
> C. Active virtual warehouses.
> D. Number of Users.

## 2-3. 問題文（日本語）

> Snowflakeシステムのコストに寄与するのはどれですか？

---

## 3-1. 解説文（英語）

> Virtual warehouses in a resumed (active) state contribute to the costs. However, it does not matter if the virtual warehouse is not running a query; if it is resumed, it contributes to the costs. Snowflake charges for data storage in database tables, files staged in internal stages, time travel history, and fail-safe storage.

## 3-3. 解説文（日本語）

> 稼働中（resumed）の仮想WHがコストに寄与します。WHがクエリを実行していなくても、resumedであれば課金対象です。Snowflakeはデータベーステーブル、内部ステージのファイル、Time Travel履歴、Fail-Safeストレージのデータストレージに課金します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
