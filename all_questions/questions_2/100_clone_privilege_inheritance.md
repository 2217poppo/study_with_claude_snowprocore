# 100: Clone Privilege Inheritance

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-14
**正答**: A, B, D

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Clone Privilege Inheritance | DB/スキーマクローン時、**子オブジェクト**（テーブル・スキーマ・ビュー）はソースの権限を継承する。ただしクローンされたDB/スキーマ自体は権限を継承しない |
| Child Objects（子オブジェクト） | DB/スキーマに含まれるテーブル・ビュー・スキーマなどのオブジェクト |

## 1-2. 重要コンセプトまとめ

- **クローンされたオブジェクト自体**: ソースの権限を**継承しない**
  - 例: クローンされたDBはソースDBの権限を継承しない
- **DB/スキーマクローン時の子オブジェクト**: ソースの権限を**継承する**
  - **テーブル** ✅ 権限を継承
  - **スキーマ** ✅ 権限を継承
  - **ビュー** ✅ 権限を継承
- つまり: クローンされた「箱」は権限なし、中身の「子オブジェクト」は権限を引き継ぐ
- 「The cloned database itself」はソースの権限を継承**しない**

## 1-3. 公式ドキュメントURL

- [Access Control Privileges for Cloned Objects](https://docs.snowflake.com/en/user-guide/object-clone#access-control-privileges-for-cloned-objects)

---

## 2-1. 問題文（英語）

> When a database is cloned, which objects inherit the corresponding source privileges? Select all that apply.
>
> A. Tables contained in the database.
> B. Schemas contained in the database.
> C. The cloned database itself.
> D. Views contained in the database.

## 2-2. 問題文の文法解析

### 文1: "When a database is cloned, which objects inherit the corresponding source privileges?"

- **注目ポイント**: `inherit` は「継承する」。`corresponding source privileges` は「対応するソースの権限」。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| inherit | verb | 継承する | Child objects inherit source privileges. |
| corresponding | adjective | 対応する | Corresponding source privileges. |
| contained in ~ | phrase | ～に含まれる | Tables contained in the database. |

## 2-3. 問題文（日本語）

> データベースがクローンされたとき、対応するソースの権限を継承するオブジェクトはどれですか？

---

## 3-1. 解説文（英語）

> A cloned object does not inherit any privileges from its source object; for instance, a cloned table does not inherit any privileges from its source table. However, if a database or schema is cloned, privileges are inherited by the child objects.

## 3-2. 解説文の文法解析

### 文1: "A cloned object does not inherit any privileges from its source object; for instance, a cloned table does not inherit any privileges from its source table."

- **注目ポイント**: 個別クローンの場合は権限を継承しない。`for instance` で具体例。

### 文2: "However, if a database or schema is cloned, privileges are inherited by the child objects."

- **注目ポイント**: `However` で例外を提示。DB/スキーマクローン時は子オブジェクトが権限を継承。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| does not inherit any ~ | phrase | いかなる～も継承しない | Does not inherit any privileges. |
| inherited by the child objects | phrase | 子オブジェクトに継承される | Privileges are inherited by child objects. |

## 3-3. 解説文（日本語）

> クローンされたオブジェクトはソースオブジェクトから権限を一切継承しません。例えば、クローンされたテーブルはソーステーブルからの権限を継承しません。ただし、データベースまたはスキーマがクローンされた場合、権限は子オブジェクトに継承されます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
