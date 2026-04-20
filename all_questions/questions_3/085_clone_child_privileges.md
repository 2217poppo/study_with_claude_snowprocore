# 085: Clone Child Privileges

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-16
**正答**: A (True)

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Clone Privilege Inheritance（クローン権限継承） | クローンオブジェクト自体はソースの権限を継承しないが、DB/スキーマクローン時の子オブジェクトはソースの権限を継承する |
| Child Object（子オブジェクト） | DB内のスキーマ、スキーマ内のテーブル・ビュー等。親オブジェクトのクローン時に自動的にクローンされる |
| Privilege（権限） | オブジェクトへのアクセス権（SELECT, INSERT, USAGE等） |

## 1-2. 重要コンセプトまとめ

- クローンの権限継承には**2つのルール**がある（混同に注意）:
  1. **クローンオブジェクト自体**: ソースの権限を**継承しない**
     - 例: テーブルAをクローンしてテーブルBを作成 → テーブルBにはテーブルAの権限は付かない
  2. **DB/スキーマクローン時の子オブジェクト**: ソースの権限を**継承する**
     - 例: DB_AをクローンしてDB_Bを作成 → DB_B内のテーブルはDB_A内の対応テーブルの権限を継承
- この区別は試験で頻出の重要ポイント
- 「If a database or schema is cloned」が条件 — 個別テーブルのクローンでは継承されない

## 1-3. 公式ドキュメントURL

- [Access Control Privileges for Cloned Objects](https://docs.snowflake.com/en/user-guide/object-clone#access-control-privileges-for-cloned-objects)

---

## 2-1. 問題文（英語）

> True or False: If a database or a schema is cloned, the child object privileges are automatically copied.
>
> A. True
> B. False

## 2-2. 問題文の文法解析

### 文1: "If a database or a schema is cloned, the child object privileges are automatically copied."

- **主語 (S)**: the child object privileges
- **動詞 (V)**: are copied（受動態）
- **修飾語 (M)**: If a database or a schema is cloned（条件節）/ automatically
- **文型**: SV（受動態）
- **注目ポイント**: 「If ~ is cloned」の条件がDB/スキーマに限定されている。テーブル単体クローンでは異なる動作。「automatically copied」で自動コピーを強調。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| child object | 名詞句 | 子オブジェクト | Child object privileges are copied. |
| privileges | 名詞 | 権限 | Privileges are automatically copied. |
| automatically | 副詞 | 自動的に | Copied automatically during cloning. |

## 2-3. 問題文（日本語）

> True/False: データベースまたはスキーマがクローンされた場合、子オブジェクトの権限は自動的にコピーされる。
>
> A. True（真）
> B. False（偽）

---

## 3-1. 解説文（英語）

> A cloned object does not inherit any privileges from its source object; for instance, a cloned table does not inherit any privileges from its source table. However, if a database or schema is cloned, privileges are inherited by the child objects.

## 3-2. 解説文の文法解析

### 文1: "A cloned object does not inherit any privileges from its source object; for instance, a cloned table does not inherit any privileges from its source table."

- **主語 (S)**: A cloned object / a cloned table
- **動詞 (V)**: does not inherit
- **目的語 (O)**: any privileges
- **修飾語 (M)**: from its source object / for instance（例示）
- **文型**: SVO; SVO
- **注目ポイント**: セミコロン + 「for instance」で具体例を提示。「does not inherit any」で完全否定。

### 文2: "However, if a database or schema is cloned, privileges are inherited by the child objects."

- **主語 (S)**: privileges
- **動詞 (V)**: are inherited（受動態）
- **修飾語 (M)**: However / if a database or schema is cloned（条件節）/ by the child objects
- **文型**: SV（受動態）
- **注目ポイント**: 「However」で前文との対比。クローンオブジェクト自体は権限を継承しない**が**、DB/スキーマクローン時の子オブジェクトは継承する。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| inherit | 動詞 | 継承する | A cloned object does not inherit privileges. |
| for instance | 副詞句 | 例えば | For instance, a cloned table does not inherit. |
| however | 副詞 | しかし | However, child objects do inherit privileges. |

## 3-3. 解説文（日本語）

> クローンされたオブジェクトはソースオブジェクトからいかなる権限も継承しません。例えば、クローンされたテーブルはソーステーブルから権限を継承しません。しかし、データベースまたはスキーマがクローンされた場合、子オブジェクトが権限を継承します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
