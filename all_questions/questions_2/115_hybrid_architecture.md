# 115: Hybrid Architecture

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-14
**正答**: No

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Hybrid Architecture | Snowflakeのアーキテクチャ。Shared-Disk（共有ストレージ）とShared-Nothing（独立コンピュート）を組み合わせ |
| Shared-Disk | 複数のコンピュートが単一の共有ストレージにアクセス。Snowflakeのストレージ部分 |
| Shared-Nothing | 各ノードが独自リソースを持つ。Snowflakeのコンピュート部分 |

## 1-2. 重要コンセプトまとめ

- Snowflakeは従来のShared-Diskアーキテクチャ**ではない**（No）
- Snowflakeは**ハイブリッドアーキテクチャ**: Shared-Disk + Shared-Nothingの長所を組み合わせ
- ストレージ: Shared-Disk的（すべてのWHが同じデータにアクセス）
- コンピュート: Shared-Nothing的（各WHが独立したCPU/メモリを持つ）

## 1-3. 公式ドキュメントURL

- [Snowflake Architecture](https://docs.snowflake.com/en/user-guide/intro-key-concepts#snowflake-architecture)

---

## 2-1. 問題文（英語）

> True/False: Snowflake database is based on the traditional shared disk architecture used by RDBMS like MySQL and Postgres.
>
> A. No
> B. Yes

## 2-3. 問題文（日本語）

> 真/偽: SnowflakeはMySQLやPostgresのような従来の共有ディスクアーキテクチャに基づいている。

---

## 3-1. 解説文（英語）

> Snowflake implements a new hybrid architecture that combines the best features of shared-disk and shared-nothing architectures. Snowflake stores data similarly to a shared-disk architecture, i.e., the data is shared. But it also allows for using several compute engines, each with its own memory and processing capabilities.

## 3-3. 解説文（日本語）

> Snowflakeはshared-diskとshared-nothingの両方の長所を組み合わせた新しいハイブリッドアーキテクチャを実装しています。データの保存はshared-disk的（データを共有）ですが、独自のメモリと処理能力を持つ複数のコンピュートエンジンの使用も可能にしています。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
