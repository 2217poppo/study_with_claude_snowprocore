# 089: Stored Procedure — Appropriate Use Case

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-06
**正答**: A（Execute one or more SQL statements that are assembled dynamically.）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Stored Procedure（ストアドプロシージャ） | 複数のSQL文・制御フロー（ループ、条件分岐）・エラーハンドリングを含む手続き的処理をカプセル化したオブジェクト。管理タスクの繰り返し実行・動的SQLの組み立てに適している。`CALL` で呼び出す |
| Dynamic SQL（動的SQL） | 実行時に文字列として組み立てられるSQL文。テーブル名・列名・条件などをプログラム的に変化させる。Stored Procedureの主要なユースケースの1つ |
| Recurring Administrative Activities（定期的な管理業務） | 繰り返し実行される管理タスク（ユーザー作成・ロール付与・DB作成等）。Stored Procedureに格納することで標準化・再利用が可能 |
| UDF（User-Defined Function / ユーザー定義関数） | スカラー計算・データ変換など、**単一の値を返す**処理に適したオブジェクト。SQLクエリ内で直接呼び出せる。「文字型→数値型への変換」「2値のMAX計算」などはUDFに適した用途 |

## 1-2. 重要コンセプトまとめ

- **Stored Procedure vs UDF の使い分け**:

  | 用途 | 適切な選択 | 理由 |
  |------|-----------|------|
  | 複数のSQL文を動的に組み立て実行 | **Stored Procedure** ✓ | 手続き的処理・動的SQL向け |
  | 文字カラムを数値カラムに変換 | UDF | スカラー変換の典型的UDF用途 |
  | 2つの入力値のMAXを計算 | UDF | 単一値を返すスカラー計算 |

- **Stored Procedureの典型的ユースケース**:
  1. 動的SQLの組み立て・実行（`EXECUTE IMMEDIATE`）
  2. 複数のDDL/DMLをシーケンシャルに実行する管理タスク
  3. ユーザー作成→ロール付与→DB作成などのワークフロー自動化
  4. ループ・条件分岐を含む複雑な処理ロジック

- **誤りの選択肢がUDF向けである理由**:
  - 「文字→数値変換」= 1つの値を変換 = スカラー変換 = UDF
  - 「2つの入力のMAX」= 計算して1つの値を返す = スカラー関数 = UDF

- **"assembled dynamically"が正解のキーワード**: 「動的に組み立てられる」SQL文の実行はStored Procedureの強みで、UDFではできない

## 1-3. 公式ドキュメントURL

- [Stored Procedures Overview](https://docs.snowflake.com/en/sql-reference/stored-procedures-overview)

---

## 2-1. 問題文（英語）

> Which of the following is an appropriate scenario for creating a Stored Procedure?
>
> A. Execute one or more SQL statements that are assembled dynamically.
> B. Convert a character column into a numeric column
> C. Given two inputs, calculate the MAX of the two values.

## 2-2. 問題文の文法解析

### 文1: "Which of the following is an appropriate scenario for creating a Stored Procedure?"

- **主語 (S)**: Which of the following（疑問詞節）
- **動詞 (V)**: is
- **補語 (C)**: an appropriate scenario for creating a Stored Procedure
- **文型**: SVC（疑問文）
- **注目ポイント**:
  - **"an appropriate scenario for ~"**: 「〜のための適切なシナリオ」。`scenario`（シナリオ・場面）+ `for + 動名詞` で「〜する場合の適切な状況」を示す
  - **"for creating"**: `for + 動名詞` で目的・対象を示す。"for creating a Stored Procedure"（ストアドプロシージャを作成するための）

### 選択肢A: "Execute one or more SQL statements that are assembled dynamically."

- **動詞 (V)**: Execute（命令形・動名詞的用法）
- **目的語 (O)**: one or more SQL statements that are assembled dynamically
- **注目ポイント**:
  - **"one or more"**: 「1つ以上の」。最低1つだが複数も含む幅広い範囲を示す。Stored Procedureが単一〜複数のSQL文を実行できることを示す
  - **"assembled dynamically"**: 「動的に組み立てられた」。`assemble`（組み立てる）の受動態 + `dynamically`（動的に）。実行時にSQL文を文字列として構築するDynamic SQLの説明

### 選択肢C: "Given two inputs, calculate the MAX of the two values."

- **修飾語 (M)**: Given two inputs（分詞構文・条件）
- **動詞 (V)**: calculate（命令形）
- **目的語 (O)**: the MAX of the two values
- **注目ポイント**:
  - **"Given + 名詞"**: 「〜が与えられたとき・〜を前提として」。条件を示す分詞構文の慣用表現。`If two inputs are given` の省略形

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| appropriate | 形容詞 | 適切な、ふさわしい | What is the most appropriate use case for a stored procedure? |
| scenario | 名詞 | シナリオ、場面、ユースケース | This is a typical scenario for using a UDF. |
| assemble | 動詞 | 組み立てる | SQL statements are assembled dynamically in a stored procedure. |
| dynamically | 副詞 | 動的に、実行時に | The query is built dynamically based on user input. |

## 2-3. 問題文（日本語）

> 次のうち、Stored Procedureを作成するのに適切なシナリオはどれですか？
>
> A. 動的に組み立てられた1つ以上のSQL文を実行する。
> B. 文字型のカラムを数値型のカラムに変換する。
> C. 2つの入力値が与えられたとき、2つの値のMAXを計算する。

---

## 3-1. 解説文（英語）

> Stored procedures are often used to perform recurring administrative activities, e.g., in a particular organization setting up a new user on the system may require creating the user, granting them several roles, creating a private database from them, etc. These steps can easily be placed in a stored procedure, and then the stored procedure can be called whenever there is a requirement to create a new user.

## 3-2. 解説文の文法解析

### 文1: "Stored procedures are often used to perform recurring administrative activities, e.g., in a particular organization setting up a new user on the system may require creating the user, granting them several roles, creating a private database from them, etc."

- **主語 (S)**: Stored procedures
- **動詞 (V)**: are often used（受動態）
- **修飾語 (M1)**: to perform recurring administrative activities（to不定詞の副詞的用法・目的）
- **e.g.節**: 具体例の挿入（"in a particular organization, setting up a new user may require ..."）
- **文型**: SV（受動態）
- **注目ポイント**:
  - **"are often used to perform ~"**: 「〜を実行するためによく使われる」。`be used to do`（〜するために使われる）の定番受動態。`be used to doing`（〜することに慣れている）とは別の意味なので注意
  - **"recurring"**: 「繰り返し発生する・定期的な」。`recurring administrative activities` = 「定期的な管理業務」。`recur`（繰り返す）の現在分詞形容詞
  - **"e.g.,"**: ラテン語 "exempli gratia" の略。「例えば」。`for example` と同義。技術文書で具体例を列挙する際に使われる（`i.e.`「すなわち」と混同しないこと）
  - **"etc."**: ラテン語 "et cetera" の略。「など、その他」。列挙が続くことを示す省略表現

### 文2: "These steps can easily be placed in a stored procedure, and then the stored procedure can be called whenever there is a requirement to create a new user."

- **前半の主語 (S)**: These steps
- **前半の動詞 (V)**: can easily be placed（受動態、助動詞 + 副詞 + 受動態）
- **前半の修飾語 (M)**: in a stored procedure（場所）
- **後半の主語 (S)**: the stored procedure
- **後半の動詞 (V)**: can be called（受動態）
- **後半の従属節**: whenever there is a requirement to create a new user
- **文型**: SV（受動態）and SV（受動態）
- **注目ポイント**:
  - **"can easily be placed"**: 助動詞 `can` + 副詞 `easily` + 受動態 `be placed`。副詞が助動詞と `be` の間に入る語順。「簡単に格納できる」
  - **"whenever there is a requirement to ~"**: 「〜する必要があるときはいつでも」。`whenever`（〜するときはいつでも）+ `there is a requirement`（必要性がある）+ `to do`（〜するための）。繰り返し呼び出しの文脈で頻出

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| recurring | 形容詞 | 繰り返し発生する、定期的な | Stored procedures handle recurring admin tasks. |
| administrative | 形容詞 | 管理の、行政の | Administrative activities include user creation and role assignment. |
| e.g., | 略語 | 例えば（for example） | Stored procedures handle tasks, e.g., user creation. |
| whenever | 接続詞 | 〜するときはいつでも | The procedure can be called whenever a new user is needed. |
| requirement | 名詞 | 要件、必要性 | There is a requirement to create a new user. |

## 3-3. 解説文（日本語）

> Stored Procedureは、繰り返し行われる管理業務の実行によく使われます。例えば、特定の組織でシステムに新しいユーザーをセットアップする場合、ユーザーの作成・複数のロールの付与・プライベートデータベースの作成などが必要になることがあります。これらの手順をStored Procedureに格納しておけば、新しいユーザーを作成する必要があるときはいつでも、そのストアドプロシージャを呼び出すことができます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
