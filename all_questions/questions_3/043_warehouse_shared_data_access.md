# 043: Warehouse Shared Data Access

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-15
**正答**: Each virtual warehouse accesses the same shared data.

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Query Processing Layer | 仮想ウェアハウスで構成される層。複数のWHが同時稼働可能 |
| Shared Data | すべてのWHが同じデータにアクセスする。データはコピーも分割もされない |

## 1-2. 重要コンセプトまとめ

- 各WHは**同じ共有データ**にアクセスする（Shared-Diskアーキテクチャの特性）
- データの「一部」を受け取るのではない（分割ではない）
- データの「完全コピー」を受け取るのでもない（コピーではない）
- WHは独立したCPU/メモリを持つが、アクセスするデータは共有

## 1-3. 公式ドキュメントURL

- [Snowflake Architecture](https://docs.snowflake.com/en/user-guide/intro-key-concepts#snowflake-architecture)

---

## 2-1. 問題文（英語）

> The Query Processing Layer can run multiple compute clusters (virtual warehouses) simultaneously. Which statement is true regarding how the compute clusters access data?
>
> A. Each virtual warehouse accesses the same shared data.
> B. Each virtual warehouse gets a portion of the data.
> C. Each virtual warehouse gets a complete copy of all data.

## 2-2. 問題文の文法解析

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| simultaneously | adverb | 同時に | Run multiple clusters simultaneously. |
| a portion of ~ | phrase | ～の一部 | Gets a portion of the data. |

## 2-3. 問題文（日本語）

> Query Processing Layerは複数のコンピュートクラスター（WH）を同時に実行できます。データへのアクセス方法として正しいのは？

---

## 3-1. 解説文（英語）

> Snowflake stores data similarly to a shared-disk architecture, i.e., the data is shared. But it also allows for using several compute engines on the same shared data, each with its own memory and processing capabilities.

## 3-3. 解説文（日本語）

> Snowflakeはshared-diskアーキテクチャのようにデータを共有方式で保存します。同じ共有データに対して複数のコンピュートエンジンを使用でき、各エンジンは独自のメモリと処理能力を持ちます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
