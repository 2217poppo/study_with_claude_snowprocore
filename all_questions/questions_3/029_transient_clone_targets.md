# 029: Transient Clone Targets

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-15
**正答**: A, B

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Transient Table Clone | Transientテーブルのクローン先制限。**Transient→Transient** ✅、**Transient→Temporary** ✅、**Transient→Permanent** ❌ |

## 1-2. 重要コンセプトまとめ

- Transientテーブルのクローン可能先:
  - **Transient** ✅
  - **Temporary** ✅
  - **Permanent** ❌（エラー: "Transient object cannot be cloned to a permanent object"）
  - **External Table** ❌
- 同様に: Temporary→Permanentへのクローンも不可
- ルール: **Fail-Safeが少ないテーブルから多いテーブルへのクローンは不可**

## 1-3. 公式ドキュメントURL

- [Cloning Considerations](https://docs.snowflake.com/en/user-guide/object-clone)

---

## 2-1. 問題文（英語）

> Which of the following correctly describes the behaviour when a Transient table is attempted to be cloned? Select two.
>
> A. Transient tables can be cloned to temporary tables.
> B. Transient tables can be cloned to transient tables.
> C. Transient tables can be cloned to external tables.
> D. Transient tables can be cloned to permanent tables.

## 2-3. 問題文（日本語）

> Transientテーブルをクローンする際の正しい動作はどれですか？

---

## 3-1. 解説文（英語）

> Transient tables can NOT be cloned to a permanent table. Doing so will typically show the following error "Transient object cannot be cloned to a permanent object." However, a transient table may be cloned to a transient table or another temporary table.

## 3-3. 解説文（日本語）

> TransientテーブルはPermanentテーブルにクローンできません。実行すると「Transient object cannot be cloned to a permanent object」エラーが表示されます。ただし、TransientまたはTemporaryテーブルへのクローンは可能です。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
