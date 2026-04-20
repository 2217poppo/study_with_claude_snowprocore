# 113: Clone Snapshot Metadata

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-14
**正答**: True

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Zero-Copy Cloning | データの物理コピーなしでオブジェクトを複製するメタデータ操作。クローン時点のスナップショットを参照 |
| Snapshot（スナップショット） | クローン時点のデータ状態。クローンされたテーブルのメタデータが既存のマイクロパーティションを参照 |

## 1-2. 重要コンセプトまとめ

- クローンは**メタデータ操作**（実際のデータコピーは発生しない）
- クローン時点のデータの**スナップショット**がキャプチャされる
- クローンされたテーブルのメタデータは**スナップショット時点の既存マイクロパーティション**を参照
- クローン後にソース/クローンどちらかを変更しても、もう片方には影響しない（独立）

## 1-3. 公式ドキュメントURL

- [Cloning Tables](https://docs.snowflake.com/en/user-guide/tables-storage-considerations#label-cloning-tables)

---

## 2-1. 問題文（英語）

> True/False: When a table is cloned, a snapshot of the source table's data is taken and represents the state of the source data. The cloned table is based on the snapshot of the data at the time of cloning.
>
> A. True
> B. False

## 2-3. 問題文（日本語）

> 真/偽: テーブルがクローンされると、ソーステーブルのデータのスナップショットが取得され、ソースデータの状態を表す。クローンテーブルはクローン時点のデータスナップショットに基づく。

---

## 3-1. 解説文（英語）

> Cloning is a metadata operation in which no actual copying of the data occurs. A snapshot of the data in the object being cloned is captured and made available in the cloned object. The cloned table's metadata references the existing micro-partitions at the time of the snapshot.

## 3-3. 解説文（日本語）

> クローンは実際のデータコピーが発生しないメタデータ操作です。クローンされるオブジェクトのデータのスナップショットがキャプチャされ、クローンオブジェクトで利用可能になります。クローンテーブルのメタデータはスナップショット時点の既存マイクロパーティションを参照します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
