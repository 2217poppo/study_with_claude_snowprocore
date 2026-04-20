# 051: VARIANT 16MB Limit

**SnowPro Core Domain**: Domain 3 — Data Loading, Unloading, and Connectivity
**作成日**: 2026-04-15
**正答**: True

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| VARIANT | 半構造化データ（JSON/XML等）を格納するデータ型。1行あたり最大**16MB** |

## 1-2. 重要コンセプトまとめ

- VARIANT列は1行あたり最大**16MB**のデータを保持可能（True）
- 16MBを超えるJSONは**複数行に分割**する必要がある
- 16MBという数字を正確に覚える

## 1-3. 公式ドキュメントURL

- [VARIANT Data Type](https://docs.snowflake.com/en/sql-reference/data-types-semistructured#variant)

---

## 2-1. 問題文（英語）

> True or False. The variant data type can hold up to 16MB of data per row.
>
> A. True
> B. False

## 2-2. 問題文の文法解析

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| hold up to ~ | phrase | 最大～を保持できる | Can hold up to 16MB per row. |
| alternate techniques | noun | 代替手法 | Think of alternate techniques such as splitting. |

## 2-3. 問題文（日本語）

> 真/偽: VARIANTデータ型は1行あたり最大16MBのデータを保持できる。

---

## 3-1. 解説文（英語）

> A single row of a VARIANT column can hold up to 16MB of data. If your JSON is larger then that, you will need to think of alternate techniques, such as splitting the JSON into multiple rows.

## 3-3. 解説文（日本語）

> VARIANT列の1行は最大16MBのデータを保持できます。JSONがそれより大きい場合、複数行への分割など代替手法を検討する必要があります。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
