# 111: Transient Short-Lived Table

**SnowPro Core Domain**: Domain 5 — Data Collaboration
**作成日**: 2026-04-14
**正答**: Transient

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Transient Table | セッションが閉じてもドロップされない短期テーブル。ETLワークテーブルに適する。Fail-Safe 0日・Time Travel最大1日 |
| Temporary Table | セッション終了時に即座にドロップされるテーブル。セッションローカル |
| Permanent Table | デフォルトテーブル。セッションと無関係に永続。Fail-Safe 7日 |

## 1-2. 重要コンセプトまとめ

- **「short-lived」かつ「セッション終了後も存続」** = **Transient**
- Temporaryはセッション終了で消える → short-livedだがセッション終了で消滅
- Permanentは永続 → short-livedではない
- Transientの用途: **ETLワークテーブル**（一時的だがセッションをまたぐ必要がある）

## 1-3. 公式ドキュメントURL

- [Temporary and Transient Tables](https://docs.snowflake.com/en/user-guide/tables-temp-transient)

---

## 2-1. 問題文（英語）

> Which type of short-lived Snowflake tables will continue to exist even if the session is closed?
>
> A. Transient
> B. Permanent
> C. Co-existent
> D. Temporary

## 2-3. 問題文（日本語）

> セッションが閉じられても存在し続ける、短期的なSnowflakeテーブルの種類はどれですか？

---

## 3-1. 解説文（英語）

> Transient tables can be used as short-lived tables for ETL work tables and are not dropped when the session is closed.

## 3-3. 解説文（日本語）

> トランジェントテーブルはETLワークテーブルとして短期的に使用でき、セッションが閉じてもドロップされません。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
