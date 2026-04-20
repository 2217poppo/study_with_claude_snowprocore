# 068: Cloned Table — Supported Operations

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-03
**正答**: A・B・C・D（すべて正解 — クローンされたテーブルは通常テーブルと同じ操作が可能）

> 関連問題: 029（Clone and Load Metadata）・030（Clone Independence）・061（Clone Restrictions）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Cloned Table（クローンされたテーブル） | `CREATE TABLE ... CLONE` で作成したテーブルのコピー。データをコピーせずメタデータポインタのみ複製（ゼロコピー）。作成後は**通常のテーブルと全く同じように扱える** |
| Clone Independence（クローン独立性） | クローン作成後、元のテーブルとクローンテーブルは完全に独立している。どちらへの変更も他方に影響しない（030で学習） |

## 1-2. 重要コンセプトまとめ

- **クローンされたテーブルは「普通のテーブル」と同じ**:
  - SELECT（読み取り）→ 可能
  - DELETE（行削除）→ 可能
  - DROP（テーブル削除）→ 可能
  - CLONE（さらにクローンを作る）→ 可能
  - INSERT・UPDATE・TRUNCATE なども同様に可能

- **「クローン=読み取り専用」という誤解に注意**（試験の引っかけ）:
  - 読み取り専用なのは **External Table**（外部テーブル）
  - クローンテーブルは完全に書き込み可能

- **クローンをさらにクローンできる**（ネストクローン）:
  - `CREATE TABLE t3 CLONE t2` （t2がすでにクローン）→ 可能
  - ただし内部的にはすべてのレベルで元のマイクロパーティションを参照

- **030との関連**: クローン後に片方を DELETE/DROP しても他方には影響しない（独立性）

## 1-3. 公式ドキュメントURL

- [Table Storage Considerations — Cloning Tables](https://docs.snowflake.com/en/user-guide/tables-storage-considerations#label-cloning-tables)

---

## 2-1. 問題文（英語）

> Which of the following operations can be performed on a cloned table? Select all that apply.
>
> A. DELETE
> B. DROP
> C. CLONE
> D. SELECT

## 2-2. 問題文の文法解析

### 文1: "Which of the following operations can be performed on a cloned table?"

- **主語 (S)**: Which of the following operations（以下の操作のうちどれが）
- **動詞 (V)**: can be performed（実行できる）← 受動態
- **修飾語 (M)**: on a cloned table（クローンされたテーブルに対して）← `on ~` = 「〜に対して」（操作の対象）
- **注目ポイント**: `be performed on ~` = 「〜に対して実行される」。`perform an operation on ~` = 「〜に操作を行う」の受動態。`on` が操作対象を示す点に注目

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| be performed on ~ | 受動態熟語 | 〜に対して実行される | Operations can be performed on a cloned table. |
| cloned | 形容詞（過去分詞） | クローンされた | A cloned table behaves like a regular table. |
| operation | 名詞 | 操作・演算 | DELETE and DROP are supported operations. |

## 2-3. 問題文（日本語）

> クローンされたテーブルに対して実行できる操作はどれですか？当てはまるものをすべて選択してください。
>
> A. DELETE
> B. DROP
> C. CLONE
> D. SELECT

---

## 3-1. 解説文（英語）

> All these operations can be performed on a cloned table because a cloned table is just like any other table.

## 3-2. 解説文の文法解析

### 文1: "All these operations can be performed on a cloned table because a cloned table is just like any other table."

- **主語 (S)**: All these operations（これらの操作はすべて）
- **動詞 (V)**: can be performed（実行できる）← 受動態
- **修飾語**: on a cloned table（クローンされたテーブルに対して）
- **理由節**: because a cloned table is just like any other table（クローンされたテーブルは他のどのテーブルとも全く同じだから）
- **注目ポイント**: `just like any other ~` = 「他のどの〜とも全く同じ」。制限なし・完全な同等性を示す最重要表現

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| just like any other ~ | 比較表現 | 他のどの〜とも全く同じ | A cloned table is just like any other table. |
| all these ~ | 限定詞 | これらすべての〜 | All these operations are supported. |

## 3-3. 解説文（日本語）

> クローンされたテーブルは他のどのテーブルとも全く同じであるため、これらの操作はすべてクローンされたテーブルに対して実行できます。

---

## 復習メモ

- [ ] クローンテーブルは通常テーブルと全く同じ操作ができる（読み取り専用ではない）ことを覚えた
- [ ] External Table（読み取り専用）とクローンテーブルを区別できた
- [ ] `just like any other ~`・`be performed on ~` の英語パターンを確認した
- [ ] この問題は理論問題のためサンドボックス検証は不要
