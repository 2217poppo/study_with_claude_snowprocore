# 017: External Table Use Cases

**SnowPro Core Domain**: Domain 3 — Data Loading, Unloading, and Connectivity
**作成日**: 2026-04-15
**正答**: A, B, C

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| External Table | 外部クラウドストレージ上のデータを参照する読み取り専用テーブル。データをSnowflake内にコピーしない |
| Data Lake | 大量の生データをクラウドストレージ（S3等）に保存する仕組み。External Tableで効率的に参照可能 |

## 1-2. 重要コンセプトまとめ

- External Tableが有効なシナリオ（3つ）:
  1. **データが既にクラウドのデータレイクにある**（S3/Azure Blob等）
  2. **データへのアクセス頻度が低い**
  3. **通常はデータのサブセットのみアクセスする**
- External Tableが**不適切**な場合:
  - 全データに頻繁にアクセスする → **通常のSnowflakeテーブル**の方が経済的
  - バイナリデータがロードできないから使う → これは理由にならない
- コスト効率の判断: **アクセス頻度が低い or サブセットのみ → External Table**

## 1-3. 公式ドキュメントURL

- [Introduction to External Tables](https://docs.snowflake.com/en/user-guide/tables-external-intro)

---

## 2-1. 問題文（英語）

> External tables are a good solution for which of the following is true? Select all that apply.
>
> A. Data is already in a data lake on a cloud platform (e.g., S3, Azure Blob Storage)
> B. The data is not accessed frequently.
> C. Typically only a subset of data is accessed.
> D. Data is in binary format and can not be loaded into Snowflake.

## 2-2. 問題文の文法解析

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| cost-effective manner | noun | 費用対効果の高い方法 | Expose data in a cost-effective manner. |
| infrequently | adverb | 頻繁でなく | When data is accessed infrequently. |
| a portion of ~ | phrase | ～の一部 | Only a portion of data has to be queried. |

## 2-3. 問題文（日本語）

> External Tableが良い解決策となるのはどの場合ですか？

---

## 3-1. 解説文（英語）

> Organizations with established data lakes and significant amounts of data in cloud object storage will find external tables helpful. When data is accessed infrequently, or only a portion of the data has to be queried, external tables can expose data from data lakes in a cost-effective manner. However, storing the data in a typical Snowflake table may be more economical if all of the data is viewed or if access is made often.

## 3-3. 解説文（日本語）

> 既存のデータレイクとクラウドストレージに大量のデータを持つ組織にとって、External Tableは有用です。データへのアクセスが頻繁でない場合、またはデータの一部のみをクエリする必要がある場合、External Tableは費用対効果の高い方法でデータレイクのデータを公開できます。ただし、全データを閲覧する場合や頻繁にアクセスする場合は、通常のSnowflakeテーブルに保存する方が経済的かもしれません。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
