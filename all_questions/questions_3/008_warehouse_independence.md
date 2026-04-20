# 008: Warehouse Independence

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-15
**正答**: False

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Virtual Warehouse Independence | 各WHは独立したコンピュートリソースを持つが、同じ共有ストレージにアクセスする。どのWHでもどのデータにもアクセス可能 |
| Shared-Disk Architecture | Snowflakeのストレージ側の設計。すべてのWHが同じデータにアクセスできる |
| Shared-Nothing Architecture | Snowflakeのコンピュート側の設計。各WHが独自のCPU/メモリを持つ |

## 1-2. 重要コンセプトまとめ

- データロードに使ったWHと**同じWHでクエリする必要はない**（False）
- どのWHでもどのデータにもアクセス可能 — Shared-Diskアーキテクチャの特性
- WHは互いに独立しているが、同じ共有データにアクセスして処理する

## 1-3. 公式ドキュメントURL

- [Snowflake Architecture](https://docs.snowflake.com/en/user-guide/intro-key-concepts#snowflake-architecture)

---

## 2-1. 問題文（英語）

> True/False: If you use a specific virtual warehouse to load data into a table, you must use the same virtual warehouse to query that data.
>
> A. True
> B. False

## 2-3. 問題文（日本語）

> 真/偽: 特定のWHでテーブルにデータをロードした場合、そのデータをクエリするには同じWHを使用しなければならない。

---

## 3-1. 解説文（英語）

> You can use any virtual warehouse to access the data. Snowflake stores data in a shared manner, like in shared-disk architecture. But it also allows for using several compute engines, each with its own memory and processing capabilities. The virtual warehouses are independent of each other but access and process the same shared data.

## 3-3. 解説文（日本語）

> どのWHでもデータにアクセスできます。Snowflakeはshared-diskアーキテクチャのようにデータを共有方式で保存します。同時に、各WHは独自のメモリと処理能力を持ちます。WHは互いに独立していますが、同じ共有データにアクセスして処理します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
