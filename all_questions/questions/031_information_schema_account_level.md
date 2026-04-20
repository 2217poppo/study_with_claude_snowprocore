# 031: INFORMATION_SCHEMA Account-Level Information

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-02
**正答**: B (True)
- A. False（**選択済み・不正解**）
- B. True（正解・未選択）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| INFORMATION_SCHEMA | 各データベース内に存在するシステムスキーマ。ほぼリアルタイムで7〜14日のデータを保持。データベースレベルのオブジェクト情報に加え、アカウントレベルオブジェクトも参照可能 |
| Account-Level Object（アカウントレベルオブジェクト） | ロール・ウェアハウス・データベースなど、特定のデータベースではなくアカウント全体に属するオブジェクト |
| Parent Database（親データベース） | INFORMATION_SCHEMAが属するデータベース。そのDB内のオブジェクト情報を主に提供する |
| Table Functions（テーブル関数） | INFORMATION_SCHEMAが提供する関数。`TABLE(INFORMATION_SCHEMA.QUERY_HISTORY())` のようにFROM句で使用できる |

## 1-2. 重要コンセプトまとめ

- **INFORMATION_SCHEMA が参照できるデータの範囲**:
  1. **親データベース内のオブジェクト**（テーブル・ビュー・スキーマ・UDF等）
  2. **アカウントレベルのオブジェクト** ← 今回の問題の核心
     - ロール（Roles）
     - ウェアハウス（Warehouses）
     - データベース（Databases）

- **不正解の原因**: INFORMATION_SCHEMA は「データベースの中にある」ため「データベース内の情報しか見られない」と思い込みやすい。しかしアカウントレベルオブジェクトも参照できる

- **INFORMATION_SCHEMA vs ACCOUNT_USAGE の比較**（Q013・Q024 の復習）:

  | 項目 | INFORMATION_SCHEMA | ACCOUNT_USAGE |
  |------|---------------------|---------------|
  | 保持期間 | 7〜14日 | 365日 |
  | 遅延 | ほぼリアルタイム | 最大45分〜数時間 |
  | 削除済みオブジェクト | 含まない | 含む |
  | アカウントレベル情報 | **あり**（今回判明） | あり |
  | 場所 | 各データベース内 | SNOWFLAKE データベース |

- **INFORMATION_SCHEMA の提供形式**:
  - **Views**（ビュー）: 静的な情報の参照
  - **Table Functions**（テーブル関数）: 動的・パラメータ指定可能な情報の参照

- **試験ポイント**: INFORMATION_SCHEMA = 「データベース専用」ではない。**アカウントレベルのロール・WH・DBも参照可能** = True

## 1-3. 公式ドキュメントURL

- [Information Schema — Views and Table Functions](https://docs.snowflake.com/en/sql-reference/info-schema#information-schema-views-and-table-functions)

---

## 2-1. 問題文（英語）

> True or False: The functions provided in INFORMATION_SCHEMA can be used to view account-level information.
>
> A. False
> B. True

## 2-2. 問題文の文法解析

### 文1: "The functions provided in INFORMATION_SCHEMA can be used to view account-level information."

- **主語 (S)**: The functions provided in INFORMATION_SCHEMA
- **動詞 (V)**: can be used（受動態）
- **不定詞句（目的）**: to view account-level information
- **文型**: SV（受動態）+ 不定詞
- **注目ポイント**:
  - 「provided in INFORMATION_SCHEMA」は過去分詞の後置修飾。「INFORMATION_SCHEMAで提供される関数」
  - 「can be used to view ~」= 「〜を参照するために使える」。能力の受動態 + 目的の不定詞
  - 「account-level information」が今回の核心。DBレベルではなくアカウントレベルの情報

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| functions provided in ~ | 名詞句 | 〜で提供される関数 | The functions provided in INFORMATION_SCHEMA are useful. |
| account-level | adjective | アカウントレベルの | Roles and warehouses are account-level objects. |
| can be used to ~ | 受動態句 | 〜するために使える | INFORMATION_SCHEMA can be used to view account-level data. |

## 2-3. 問題文（日本語）

> 正誤問題：INFORMATION_SCHEMAで提供される関数は、アカウントレベルの情報を参照するために使用できる。
>
> A. False（誤り）
> B. True（正しい）

---

## 3-1. 解説文（英語）

> The INFORMATION_SCHEMA provides data on the objects in the parent database of the INFORMATION_SCHEMA. It also provides data on account-level objects such as roles, warehouses, and databases.

## 3-2. 解説文の文法解析

### 文1: "The INFORMATION_SCHEMA provides data on the objects in the parent database of the INFORMATION_SCHEMA."

- **主語 (S)**: The INFORMATION_SCHEMA
- **動詞 (V)**: provides
- **目的語 (O)**: data on the objects in the parent database of the INFORMATION_SCHEMA
- **文型**: SVO
- **注目ポイント**:
  - 「provides data on ~」= 「〜に関するデータを提供する」。`data on ~` は「〜に関するデータ」
  - 「the parent database of the INFORMATION_SCHEMA」= 「INFORMATION_SCHEMAが属する（親）データベース」

### 文2: "It also provides data on account-level objects such as roles, warehouses, and databases."

- **主語 (S)**: It（= INFORMATION_SCHEMA）
- **副詞**: also（「さらに、また」。前文に追加する情報）
- **動詞 (V)**: provides
- **目的語 (O)**: data on account-level objects
- **例示**: such as roles, warehouses, and databases
- **文型**: SVO + such as 節
- **注目ポイント**:
  - 「also」が「データベースオブジェクトだけでなく、アカウントレベルも」という追加情報を示す
  - 「such as roles, warehouses, and databases」でアカウントレベルオブジェクトの具体例を列挙

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| parent database | noun phrase | 親データベース（INFORMATION_SCHEMAが属するDB） | The parent database of INFORMATION_SCHEMA contains the data. |
| provides data on ~ | 動詞句 | 〜に関するデータを提供する | INFORMATION_SCHEMA provides data on account-level objects. |
| also | adverb | また、さらに（前文に追加する情報を示す） | It also provides data on roles and warehouses. |

## 3-3. 解説文（日本語）

> INFORMATION_SCHEMAは、そのINFORMATION_SCHEMAが属する親データベース内のオブジェクトに関するデータを提供します。また、ロール・ウェアハウス・データベースなどのアカウントレベルオブジェクトに関するデータも提供します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
