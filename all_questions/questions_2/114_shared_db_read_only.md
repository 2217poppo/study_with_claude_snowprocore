# 114: Shared Database Read-Only

**SnowPro Core Domain**: Domain 5 — Data Collaboration
**作成日**: 2026-04-14
**正答**: False

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Shared Database（共有データベース） | Data Sharingでコンシューマーが作成するDB。プロバイダーのデータを参照。**読み取り専用** |
| Data Consumer | 共有データを利用する側のアカウント。共有オブジェクトの変更は不可 |
| Data Provider | データを提供する側のアカウント。SHAREにオブジェクトを追加 |

## 1-2. 重要コンセプトまとめ

- 共有データベースはコンシューマーにとって**読み取り専用（read-only）**
- コンシューマーは共有DBに**テーブルやビューを追加できない**（False）
- プロバイダーが追加したオブジェクトのみ含まれる
- コンシューマーができること: クエリ（SELECT）のみ
- コンシューマーができないこと: テーブル/ビューの追加・変更・削除

## 1-3. 公式ドキュメントURL

- [Introduction to Secure Data Sharing](https://docs.snowflake.com/en/user-guide/data-sharing-intro)

---

## 2-1. 問題文（英語）

> True or False: A consumer of a shared database can add new tables or views to the shared database.
>
> A. False
> B. True

## 2-3. 問題文（日本語）

> 真/偽: 共有データベースのコンシューマーは、共有データベースに新しいテーブルやビューを追加できる。

---

## 3-1. 解説文（英語）

> Shared objects are read-only for the consumer and cannot be modified by the consumer. A database created on Share contains the tables and other objects that the data provider added, but the consumer cannot add additional objects.

## 3-3. 解説文（日本語）

> 共有オブジェクトはコンシューマーにとって読み取り専用であり、変更できません。SHAREから作成されたDBにはプロバイダーが追加したテーブル等のオブジェクトが含まれますが、コンシューマーは追加オブジェクトを加えることはできません。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
