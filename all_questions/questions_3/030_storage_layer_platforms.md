# 030: Storage Layer Platforms

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-15
**正答**: B, D, E

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Database Storage Layer | Snowflake 3層の最下層。クラウドオブジェクトストレージにデータを保存 |
| AWS S3 | Amazon Web Servicesのオブジェクトストレージ |
| Azure Blob Storage | MicrosoftのAzureクラウドのオブジェクトストレージ |
| Google Cloud Storage (GCS) | Google Cloudのオブジェクトストレージ |

## 1-2. 重要コンセプトまとめ

- Storage Layerが利用可能なプラットフォーム（3つ）: **AWS S3 / Azure Blob / GCS**
- **オンプレミス（NAS等）は不可** — Snowflakeはクラウド専用
- **ハイブリッドクラウドは不可** — 純粋なクラウドオブジェクトストレージのみ

## 1-3. 公式ドキュメントURL

- [Snowflake Architecture](https://docs.snowflake.com/en/user-guide/intro-key-concepts#snowflake-architecture)

---

## 2-1. 問題文（英語）

> The Database Storage layer in Snowflake architecture can be on which of the following? Select all that apply.
>
> A. On-Premise NAS
> B. Azure Blob Storage
> C. Hybrid Cloud
> D. AWS S3
> E. Google Cloud Storage

## 2-3. 問題文（日本語）

> SnowflakeのDatabase Storage Layerはどのプラットフォーム上に存在できますか？

---

## 3-1. 解説文（英語）

> Snowflake's shared storage layer resides on low-cost object cloud storage. Snowflake currently supports AWS S3 storage, Azure Blob Storage, and Google Cloud Storage for data storage.

## 3-3. 解説文（日本語）

> Snowflakeの共有ストレージレイヤーは低コストのクラウドオブジェクトストレージ上に存在します。現在AWS S3、Azure Blob Storage、Google Cloud Storageをサポートしています。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
