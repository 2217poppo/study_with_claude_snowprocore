# 034: Multi-Cluster Shared Data Architecture

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-15
**正答**: Multi-cluster Shared Data architecture

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Multi-cluster Shared Data | Snowflakeのアーキテクチャの正式な表現。複数のコンピュートクラスターが共有データにアクセスする |
| Shared Disk | 従来型DBのアーキテクチャ。Snowflakeはこれ**そのものではない** |
| Shared Nothing | 各ノードが独立リソースを持つアーキテクチャ。Snowflakeのコンピュート側の特性 |

## 1-2. 重要コンセプトまとめ

- Snowflakeのアーキテクチャ = **Multi-cluster Shared Data**
- 「Shared Disk」でも「Shared Nothing」でもない — 両方の長所を組み合わせたハイブリッド
- データは共有（Shared Data）、コンピュートは独立（Multiple Clusters）

## 1-3. 公式ドキュメントURL

- [Snowflake Architecture](https://docs.snowflake.com/en/user-guide/intro-key-concepts#snowflake-architecture)

---

## 2-1. 問題文（英語）

> Which of the following statement correctly describes Snowflake architecture?
>
> A. Shared disk architecture
> B. Multi-cluster Shared Data architecture
> C. Shared nothing architecture

## 2-3. 問題文（日本語）

> Snowflakeのアーキテクチャを正しく表しているのはどれですか？

---

## 3-1. 解説文（英語）

> Snowflake implements a new hybrid architecture that combines the best features of shared-disk and shared-nothing architectures. Snowflake stores data similarly to a shared-disk architecture, i.e., the data is shared. But it also allows for using several compute engines, each with its own memory and processing capabilities.

## 3-3. 解説文（日本語）

> Snowflakeはshared-diskとshared-nothingの長所を組み合わせた新しいハイブリッドアーキテクチャを実装しています。データはshared-disk的に共有され、各コンピュートエンジンは独自のメモリと処理能力を持ちます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
