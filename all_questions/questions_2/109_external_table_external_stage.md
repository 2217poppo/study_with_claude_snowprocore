# 109: External Table External Stage Only

**SnowPro Core Domain**: Domain 3 — Data Loading, Unloading, and Connectivity
**作成日**: 2026-04-14
**正答**: True

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| External Table | 外部ストレージのデータを参照するメタデータ定義。データ自体は含まない。**外部ステージのみ**で作成可能 |
| External Stage | S3/Azure Blob/GCS等の外部クラウドストレージを参照するステージ |
| Internal Stage | Snowflake内部のストレージ。External Tableの作成には使用**不可** |

## 1-2. 重要コンセプトまとめ

- External Tableは**外部ステージのみ**で作成可能（True）
- Internal Stageからは作成**不可**
- External Tableはメタデータ定義のみ — データ自体を含まない
- メタデータには: 列定義、外部ステージ名、ファイルフォーマット

## 1-3. 公式ドキュメントURL

- [Introduction to External Tables](https://docs.snowflake.com/en/user-guide/tables-external-intro)

---

## 2-1. 問題文（英語）

> True/False: An external table can only be created using an external stage.
>
> A. False
> B. True

## 2-2. 問題文の文法解析

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| metadata definition | noun | メタデータ定義 | An external table is a metadata definition. |
| register the definition | phrase | 定義を登録する | You register the definition of an external table. |

## 2-3. 問題文（日本語）

> 真/偽: 外部テーブルは外部ステージを使用してのみ作成できる。

---

## 3-1. 解説文（英語）

> An external table is a metadata definition; that is, you register the definition of an external table, but the external table itself doesn't contain any data. Note that an external table can only point to an external stage. An internal stage cannot be used to create an external table.

## 3-3. 解説文（日本語）

> 外部テーブルはメタデータ定義です。つまり、定義を登録しますが、外部テーブル自体はデータを含みません。外部テーブルは外部ステージのみを参照できます。内部ステージでは外部テーブルを作成できません。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
