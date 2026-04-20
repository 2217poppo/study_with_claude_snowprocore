# 015: Warehouse Resources

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-15
**正答**: A, C, D

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| CPU | WHの各ノードが持つ処理リソース。クエリ実行に使用 |
| Memory（メモリ） | WHの各ノードが持つメモリリソース。データ処理に使用 |
| Temporary Local Storage | WHのローカルSSD。WHキャッシュやスピリングデータの保存に使用 |
| Shared Storage | クラウドオブジェクトストレージ（S3等）。WHのリソースではなくStorage Layerが管理 |

## 1-2. 重要コンセプトまとめ

- WHが提供するリソース（3つ）: **CPU、Memory、Temporary Local Storage**
- **Shared Storageは WHのリソースではない**（Storage Layerが管理）
- 各ノードは独自のメモリ・CPU・ローカルキャッシュ（SSD）を持つ
- ローカルキャッシュ = Warehouse Cache（他WHと共有不可）

## 1-3. 公式ドキュメントURL

- [Warehouses Overview](https://docs.snowflake.com/en/user-guide/warehouses-overview)

---

## 2-1. 問題文（英語）

> A virtual warehouse provides which of the following resources? Select all that apply.
>
> A. Temporary Local Storage
> B. Shared Storage
> C. Memory
> D. CPU

## 2-3. 問題文（日本語）

> 仮想ウェアハウスが提供するリソースはどれですか？該当するものをすべて選んでください。

---

## 3-1. 解説文（英語）

> A virtual warehouse provides CPU, memory, and temporary storage resources to process queries and run data load jobs. Each node in a virtual warehouse computes cluster has its own memory, computing resources, and local cache stored on a solid-state disk.

## 3-3. 解説文（日本語）

> 仮想ウェアハウスはクエリ処理やデータロードジョブの実行のためにCPU・メモリ・一時ストレージリソースを提供します。各ノードは独自のメモリ・コンピュートリソース・SSD上のローカルキャッシュを持ちます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
