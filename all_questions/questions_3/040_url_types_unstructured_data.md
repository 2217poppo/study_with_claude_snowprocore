# 040: URL Types for Unstructured Data

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-15
**正答**: C, D, E

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Pre-signed URL | アクセストークン付きの一時URL。認証不要でアクセス可能。有効期限は設定可能 |
| File URL | ステージ内ファイルへの永続参照URL。有効期限なし。認証必要 |
| Scoped URL | 認証済みユーザー向けURL。24時間有効。ロール権限に基づくアクセス制御 |

## 1-2. 重要コンセプトまとめ

- 非構造化データにアクセスするURL（**3種類**）:
  1. **Pre-signed URL** — 認証不要、有効期限設定可能
  2. **File URL** — 永続、認証必要
  3. **Scoped URL** — 24時間有効、認証必要
- Samba URL / Network Share Path はSnowflakeの用語ではない
- 3種類すべて暗記必須

## 1-3. 公式ドキュメントURL

- [Types of URLs Available to Access Files](https://docs.snowflake.com/en/user-guide/unstructured-intro#types-of-urls-available-to-access-files)

---

## 2-1. 問題文（英語）

> In Snowflake, which of the following types of URLs can be used to access unstructured data? Select all that apply.
>
> A. Samba URL
> B. Network Share Path
> C. Pre-signed URL
> D. File URL
> E. Scoped URL

## 2-3. 問題文（日本語）

> Snowflakeで非構造化データにアクセスするために使用できるURLタイプはどれですか？

---

## 3-1. 解説文（英語）

> The three types of URLs that can be used to access unstructured data in cloud storage are Scoped URLs, File URLs, and Pre-signed URLs.

## 3-3. 解説文（日本語）

> クラウドストレージの非構造化データにアクセスするために使用できる3種類のURLは、Scoped URL、File URL、Pre-signed URLです。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
