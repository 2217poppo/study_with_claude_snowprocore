# 012: Snowflake Description Terms

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-15
**正答**: A, B, E, F

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Hybrid Columnar Storage | Snowflakeのデータ保存形式。列指向（columnar）のハイブリッド形式 |
| Shared Data | Snowflakeの正確な表現。「データが共有される」（ディスクが共有されるのではない） |
| Native SQL Support | Snowflakeが標準SQLをネイティブにサポートしていること |
| Built from Scratch | Snowflakeがゼロから設計・構築されたクラウドネイティブ製品であること |

## 1-2. 重要コンセプトまとめ

- Snowflakeを表す正しい用語:
  - **Hybrid Columnar Storage** ✅
  - **Shared Data** ✅（データが共有、ディスクではない）
  - **Native SQL Support** ✅
  - **Built from scratch for the cloud** ✅
- **誤りの用語**:
  - **Shared Disk** ❌ — 「ディスク」は共有されていない。「データ」が共有される
  - **Shared Compute** ❌ — コンピュートは各WHが独立（Shared-Nothing的）
- 「Shared-Disk Architecture **のように**データを保存」とは言えるが、「Shared Disk」そのものではない

## 1-3. 公式ドキュメントURL

- [Snowflake Architecture](https://docs.snowflake.com/en/user-guide/intro-key-concepts#snowflake-architecture)

---

## 2-1. 問題文（英語）

> Which of the following terms may be used to describe Snowflake? Select all that apply.
>
> A. Hybrid Columnar Storage
> B. Shared Data
> C. Shared Disk
> D. Shared Compute
> E. Built from scratch, specifically designed for execution on cloud platforms.
> F. Native SQL support

## 2-3. 問題文（日本語）

> Snowflakeを表す用語はどれですか？該当するものをすべて選んでください。

---

## 3-1. 解説文（英語）

> Snowflake has been designed for the cloud and has been designed from scratch. Snowflake stores data similarly to a shared-disk architecture, i.e., the data is shared (disk isn't shared). It also allows for the use of several compute engines. It provides Native SQL support and stores data in a hybrid columnar format.

## 3-3. 解説文（日本語）

> Snowflakeはクラウド向けにゼロから設計されました。データの保存はshared-diskアーキテクチャに似ていますが、共有されるのは「データ」であり「ディスク」ではありません。複数のコンピュートエンジンの使用も可能です。ネイティブSQLをサポートし、ハイブリッド列指向フォーマットでデータを保存します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
