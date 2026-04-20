# 062: Stored Procedure Functionality

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-13
**正答**: C, D, E

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Stored Procedure（ストアドプロシージャ） | 手続き的ロジック（ループ・条件分岐・エラーハンドリング等）をデータベース側で実行するオブジェクト。CALLで呼び出す |
| Conditional Logic（条件ロジック） | if-else等の条件分岐処理。SQLだけでは通常提供されない機能をストアドプロシージャで実現 |
| Loop（ループ） | 繰り返し処理。FOR/WHILE等。ストアドプロシージャの主要機能 |
| Dynamic SQL（動的SQL） | 実行時に文字列として組み立てられるSQL文。EXECUTE IMMEDIATEで実行 |
| Execute SQL Statements（SQL文の実行） | ストアドプロシージャ内からSQL文を実行する機能。動的SQLの構築・実行が可能 |

## 1-2. 重要コンセプトまとめ

- Stored Procedureが提供する機能（**できること**）:
  - **Conditional Logic（条件分岐）**: if-else
  - **Loops（ループ）**: FOR/WHILE等の繰り返し
  - **Execute SQL statements（SQL実行）**: 動的SQL含む
  - その他: エラーハンドリング、変数管理
- Stored Procedureの制限（**できないこと**）:
  - ウェアハウスの内部メモリへの直接アクセス（Access internal memory）
  - Cloud Servicesレイヤーへの直接クエリ（Query cloud services layer）
- ストアドプロシージャ = 「**SQLだけでは通常提供されない機能**」を実現する
- `on the fly` = 「その場で、動的に」— Dynamic SQL構築の説明で使われる

## 1-3. 公式ドキュメントURL

- [Stored Procedures Overview](https://docs.snowflake.com/en/sql-reference/stored-procedures-overview)

---

## 2-1. 問題文（英語）

> Stored Procedures provide which of the following functionality?
>
> A. Access the internal memory of a virtual warehouse
> B. Query cloud services layer
> C. Loops
> D. Conditional Logic
> E. Execute SQL statements

## 2-2. 問題文の文法解析

### 文1: "Stored Procedures provide which of the following functionality?"

- **主語 (S)**: Stored Procedures
- **動詞 (V)**: provide
- **目的語 (O)**: which of the following functionality
- **文型**: SVO（疑問文）
- **注目ポイント**: `provide ~ functionality` で「～の機能を提供する」。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| functionality | noun | 機能 | Stored procedures provide this functionality. |
| conditional logic | noun | 条件ロジック | If-else conditional logic. |
| on the fly | phrase | その場で、動的に | Assemble SQL statements on the fly. |

## 2-3. 問題文（日本語）

> ストアドプロシージャは以下のどの機能を提供しますか？
>
> A. 仮想ウェアハウスの内部メモリへのアクセス
> B. Cloud Servicesレイヤーへのクエリ
> C. ループ
> D. 条件ロジック
> E. SQL文の実行

---

## 3-1. 解説文（英語）

> Stored procedures let you use if-else logic, looping, and other features that SQL does not typically provide. With stored procedures, you can assemble dynamic SQL statements on the fly and execute them as well.

## 3-2. 解説文の文法解析

### 文1: "Stored procedures let you use if-else logic, looping, and other features that SQL does not typically provide."

- **主語 (S)**: Stored procedures
- **動詞 (V)**: let
- **目的語 (O)**: you
- **補語 (C)**: use if-else logic, looping, and other features（原形不定詞）
- **修飾語 (M)**: that SQL does not typically provide（関係詞節）
- **文型**: SVOC（let O do）
- **注目ポイント**: `let O do` は使役構文「Oが～できるようにする」。`that SQL does not typically provide` で「SQLが通常は提供しない」機能であることを強調。

### 文2: "With stored procedures, you can assemble dynamic SQL statements on the fly and execute them as well."

- **主語 (S)**: you
- **動詞 (V)**: can assemble and execute（並列）
- **目的語 (O)**: dynamic SQL statements / them
- **修飾語 (M)**: With stored procedures（手段）、on the fly（方法）、as well（追加）
- **文型**: SVO
- **注目ポイント**: `on the fly` は「その場で、即座に」。`as well` は「同様に」で executeの追加動作を示す。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| let O do | phrase | Oが～できるようにする | Let you use if-else logic. |
| assemble | verb | 組み立てる | Assemble dynamic SQL on the fly. |
| on the fly | phrase | その場で、動的に | Build SQL statements on the fly. |
| as well | phrase | 同様に、～も | Execute them as well. |

## 3-3. 解説文（日本語）

> ストアドプロシージャにより、SQLが通常は提供しないif-elseロジック、ループ、その他の機能を使用できます。ストアドプロシージャを使えば、動的SQL文をその場で組み立て、実行することもできます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
