# 030: Clone Independence

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-02
**正答**: A, C（2つ・完全正解）
- A. The new data does not show up in the Prospects table.（**選択済み・正解**）
- B. The data loading fails as it is impossible to load data into a table that was a source for a cloning operation.（誤り・未選択）
- C. The new data is loaded successfully into the Customer table only.（**選択済み・正解**）
- D. The new data is loaded into the Customer table and its clone, the Prospects table.（誤り・未選択）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Clone Independence（クローン独立性） | クローン作成後、ソーステーブルとクローンテーブルはお互いに独立して存在する。一方の変更が他方に影響しない |
| Source Table（ソーステーブル） | クローン元のテーブル。クローン後も通常通りDML操作が可能 |
| Zero-Copy Cloning（ゼロコピークローン） | Snowflakeのクローン機能の別名。データをコピーせずメタデータのみでクローンを作成するため即時・コストゼロ |

## 1-2. 重要コンセプトまとめ

- **クローン後の独立性（最重要）**:
  - クローン作成時点のデータはソース・クローン両方で共有（ポインタ参照）
  - 作成後の変更は完全に独立 → **一方の変更が他方に影響しない**

- **クローン後にできること**:
  - ✅ ソーステーブルへのINSERT/UPDATE/DELETE → クローンに影響なし
  - ✅ クローンテーブルへのINSERT/UPDATE/DELETE → ソースに影響なし
  - ✅ **ソーステーブルをDROPしてもクローンは残る**（試験頻出）
  - ✅ クローンをDROPしてもソースは残る

- **誤答の整理**:
  - ❌ B「クローン元へのロードが失敗する」→ 全く根拠のないひっかけ。クローン後もソースへの操作は自由
  - ❌ D「CustomerとProspectsの両方にロードされる」→ 誤り。クローンはビューではないので連動しない

- **Q029 との関連**（クローンの2大ポイント）:
  | Q029 | Q030 |
  |------|------|
  | ロードメタデータはコピーされない | ソースとクローンは独立して存在する |
  | → 同じファイルをクローンに再ロードできる | → 一方への変更は他方に影響しない |

- **試験ポイント**: クローンは「コピー」ではなく「独立したスナップショット」。作成後は完全に別々のオブジェクト

## 1-3. 公式ドキュメントURL

- [Cloning Tables — Storage Considerations](https://docs.snowflake.com/en/user-guide/tables-storage-considerations#label-cloning-tables)

---

## 2-1. 問題文（英語）

> An administrator cloned a table called Customer to a new table called Prospects. The administrator then proceeds to load new data into the Customer table. What can you expect to happen to the Prospects table?
>
> Select all that apply.
>
> A. The new data does not show up in the Prospects table.
> B. The data loading fails as it is impossible to load data into a table that was a source for a cloning operation.
> C. The new data is loaded successfully into the Customer table only.
> D. The new data is loaded into the Customer table and its clone, the Prospects table.

## 2-2. 問題文の文法解析

### 文1: "An administrator cloned a table called Customer to a new table called Prospects."

- **主語 (S)**: An administrator
- **動詞 (V)**: cloned
- **目的語 (O)**: a table called Customer
- **修飾語 (M)**: to a new table called Prospects
- **文型**: SVO + M
- **注目ポイント**:
  - 「called Customer / called Prospects」は過去分詞の後置修飾。「〜という名前の」
  - 「cloned A to B」= 「AをBにクローンした」。clone の他動詞用法

### 文2: "The administrator then proceeds to load new data into the Customer table."

- **主語 (S)**: The administrator
- **副詞**: then（「その後」）
- **動詞 (V)**: proceeds to load（句動詞「〜することに進む」= 次のアクションを示す）
- **目的語 (O)**: new data
- **修飾語 (M)**: into the Customer table
- **文型**: SVO + M
- **注目ポイント**:
  - 「proceeds to do」は「（前の行為に続いて）次に〜する」。手順を示す表現
  - 「then」が時系列（クローン後 → データロード）を示す

### 文3: "What can you expect to happen to the Prospects table?"

- **疑問詞**: What（目的語として文頭）
- **主語 (S)**: you
- **動詞 (V)**: can expect
- **不定詞**: to happen to the Prospects table
- **文型**: What + SV + 不定詞
- **注目ポイント**:
  - 「expect to happen」は「起こると予想する」。結果を問う質問パターン
  - 「What can you expect ~?」= 「〜に何が起きると予想できるか」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| proceeds to do | phrasal verb | 次に〜することに進む、〜し始める | The admin proceeds to load data into the Customer table. |
| show up | phrasal verb | 現れる、表示される | The new data does not show up in the Prospects table. |
| as it is impossible to ~ | 節 | 〜することは不可能なので（理由） | False — it is NOT impossible to load data into a cloned source. |
| altogether | adverb | 完全に、まったく | The source table can be dropped altogether. |

## 2-3. 問題文（日本語）

> 管理者がCustomerというテーブルをProspectsという新しいテーブルにクローンしました。その後、管理者はCustomerテーブルに新しいデータをロードしようとしました。Prospectsテーブルはどうなると予想されますか？
>
> 該当するものをすべて選びなさい。
>
> A. 新しいデータはProspectsテーブルには表示されない。
> B. クローン操作のソースとなったテーブルにデータをロードすることはできないため、データのロードが失敗する。
> C. 新しいデータはCustomerテーブルのみに正常にロードされる。
> D. 新しいデータはCustomerテーブルと、そのクローンであるProspectsテーブルの両方にロードされる。

---

## 3-1. 解説文（英語）

> The source and cloned items are independent; thus, modifying data in one will not affect the other. For example, the source table can be dropped altogether, which doesn't affect the cloned table.

## 3-2. 解説文の文法解析

### 文1: "The source and cloned items are independent; thus, modifying data in one will not affect the other."

- **主語 (S)**: The source and cloned items
- **動詞 (V)**: are
- **補語 (C)**: independent
- **セミコロン + thus**: 因果の接続
- **帰結節**: modifying data in one will not affect the other
- **文型**: SVC; thus + SVO（否定）
- **注目ポイント**:
  - 「source and cloned items」で両方を指す（tables でなく items で一般化）
  - 「independent」が核心ワード。「独立している」= 一方の変更が他方に影響しない
  - 「one ~ the other」は「一方と他方」。2つの対象を指す定型表現

### 文2: "For example, the source table can be dropped altogether, which doesn't affect the cloned table."

- **例示**: For example
- **主節**: the source table can be dropped altogether（受動態）
- **非制限関係詞節**: which doesn't affect the cloned table（前節全体を先行詞に）
- **文型**: M + SV（受動態）+ 関係詞節
- **注目ポイント**:
  - 「can be dropped altogether」の altogether は「完全に」を強調。「完全に削除しても」
  - 「which doesn't affect ~」のカンマ + which は非制限用法。「そしてそれはクローンに影響しない」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| independent | adjective | 独立した、互いに影響しない | The source and cloned tables are independent. |
| one ~ the other | 代名詞句 | 一方と他方（2つを指す） | Modifying one will not affect the other. |
| altogether | adverb | 完全に、まったく | The source table can be dropped altogether. |
| affect | verb | 影響する、影響を与える | Changes to the source do not affect the clone. |

## 3-3. 解説文（日本語）

> ソースとクローンのアイテムは独立しているため、一方のデータを変更してももう一方には影響しません。例えば、ソーステーブルを完全に削除しても、クローンテーブルには影響しません。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
