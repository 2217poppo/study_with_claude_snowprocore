# 054: Micro-Partition Size Range

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-15
**正答**: 50MB to 500MB

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Micro-Partition | Snowflakeの内部データ分割単位。**50MB〜500MB**の非圧縮データを含む。実際の保存サイズは圧縮によりさらに小さい |

## 1-2. 重要コンセプトまとめ

- マイクロパーティションのサイズ = **50MB〜500MB**（非圧縮）
- この数字は「非圧縮（uncompressed）」のサイズ
- 実際の保存サイズは圧縮+列指向保存によりさらに小さい
- 5MB〜10MBや1GB〜10GBではない

## 1-3. 公式ドキュメントURL

- [Micro-partitions & Data Clustering](https://docs.snowflake.com/en/user-guide/tables-clustering-micropartitions)

---

## 2-1. 問題文（英語）

> Each micro-partition generally contains ________ of uncompressed data.
>
> A. 50MB to 500MB
> B. 1024KB to 2048KB
> C. 1GB to 10GB
> D. 5MB to 10MB

## 2-2. 問題文の文法解析

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| generally contains | phrase | 一般的に含む | Generally contains 50-500MB. |
| uncompressed data | noun | 非圧縮データ | 50-500MB of uncompressed data. |

## 2-3. 問題文（日本語）

> 各マイクロパーティションは一般的にどれだけの非圧縮データを含みますか？

---

## 3-1. 解説文（英語）

> Micro-partitions are small and typically store 50 MB to 500 MB of uncompressed data.

## 3-3. 解説文（日本語）

> マイクロパーティションは小さく、通常50MB〜500MBの非圧縮データを保存します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
