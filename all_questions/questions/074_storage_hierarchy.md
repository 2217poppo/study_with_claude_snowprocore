# 074: Snowflake Storage Hierarchy

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-03
**正答**: B（Account → Database → Schema → Table）

> 関連問題: 017（Account per Region）・025（Hybrid Architecture）・031（INFORMATION_SCHEMA Account Level）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Storage Hierarchy（ストレージ階層） | Snowflakeのオブジェクトが入れ子になっている構造。**Account → Database → Schema → Table（その他オブジェクト）** の順 |
| Account（アカウント） | 階層の最上位。1つのSnowflake契約に対応する独立した環境。1顧客が複数アカウントを持つことも可能 |
| Database（データベース） | アカウント内に作成するデータの論理的なコンテナ。1アカウントに複数のDBを持てる |
| Schema（スキーマ） | データベース内のオブジェクト（テーブル・ビュー・UDF等）をグループ化する論理的なコンテナ。1DBに複数のスキーマを持てる |
| Object（オブジェクト） | スキーマに格納されるエンティティの総称。テーブル・ビュー・ファイルフォーマット・シーケンス・UDF・ストアドプロシージャ等。**1つのオブジェクトは1つのスキーマにのみ含まれる** |
| Catalogue（カタログ） | Snowflakeのオブジェクト定義・メタデータを管理する仕組みの総称。Cloud Servicesレイヤーが担当 |

## 1-2. 重要コンセプトまとめ

- **正しい階層順序**（暗記必須）:
  ```
  Account
  └── Database（複数可）
       └── Schema（複数可）
            └── Objects（Table / View / UDF / Stored Procedure / File Format / Sequence 等）
  ```

- **各レベルの多重度**:
  - 1アカウント → 複数データベース（無制限）
  - 1データベース → 複数スキーマ（無制限）
  - 1スキーマ → 複数オブジェクト
  - 1オブジェクト → **属するスキーマは必ず1つだけ**（複数スキーマに同時所属は不可）

- **スキーマに格納されるオブジェクトの例**（試験頻出）:
  - Tables（テーブル）
  - Views（ビュー）
  - File Formats（ファイルフォーマット）
  - Sequences（シーケンス）
  - UDFs（ユーザー定義関数）
  - Stored Procedures（ストアドプロシージャ）

- **試験のポイント**: 階層の順序（Account → Database → Schema → Table）を問題の選択肢でよく入れ替えてくる。Tableが最も下位であることを確認すること

## 1-3. 公式ドキュメントURL

- [Snowflake Object Model](https://docs.snowflake.com/en/user-guide/databases)

---

## 2-1. 問題文（英語）

> Which one of the following correctly represents the storage hierarchy in Snowflake?
>
> A. Account -> Table -> Database -> Schema
> B. Account -> Database -> Schema -> Table
> C. Database -> Account -> Schema -> Table
> D. Schema -> Account -> Database -> Table

## 2-2. 問題文の文法解析

### 文1: "Which one of the following correctly represents the storage hierarchy in Snowflake?"

- **疑問詞**: Which one of the following（以下のうちどれが）← `which one` = 複数の選択肢から1つを選ぶ問い
- **主語 (S)**: which one（どれが）
- **動詞 (V)**: correctly represents（正しく表している）
- **目的語 (O)**: the storage hierarchy in Snowflake（Snowflakeのストレージ階層を）
- **注目ポイント**: `represent ~` = 「〜を表す・〜を示す」。図・記号・表現が何かを「正しく表現しているか」を問う動詞。試験問題で頻出

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| storage hierarchy | 名詞句 | ストレージ階層 | Account is at the top of the storage hierarchy. |
| represent ~ | 動詞 | 〜を表す・〜を示す | Which diagram correctly represents the structure? |
| correctly | 副詞 | 正しく | Which option correctly represents the hierarchy? |

## 2-3. 問題文（日本語）

> 以下のうち、Snowflakeのストレージ階層を正しく表しているものはどれですか？
>
> A. Account → Table → Database → Schema
> B. Account → Database → Schema → Table
> C. Database → Account → Schema → Table
> D. Schema → Account → Database → Table

---

## 3-1. 解説文（英語）

> In Snowflake, the highest level is a Snowflake Account. Customers can have as many accounts as they like. Within an account, you have databases. Each database contains one or more schemas. Schemas contain other Objects. Tables, views, file formats, sequences, UDFs, and stored procedures are all examples of objects available in a schema. An object can be contained in only one schema.

## 3-2. 解説文の文法解析

### 文1: "In Snowflake, the highest level is a Snowflake Account."

- **修飾語**: In Snowflake（Snowflakeでは）
- **主語 (S)**: the highest level（最上位レベルは）
- **補語 (C)**: a Snowflake Account（Snowflakeアカウント）
- **注目ポイント**: `the highest level` = 「最上位レベル」。最上級 `highest` で階層の頂点を明示

### 文2: "Customers can have as many accounts as they like."

- **主語 (S)**: Customers
- **動詞 (V)**: can have（持つことができる）
- **注目ポイント**: `as many ~ as they like` = 「好きなだけ多くの〜」。無制限・上限なしを示す重要表現

### 文3: "Each database contains one or more schemas."

- **主語 (S)**: Each database（各データベースは）
- **動詞 (V)**: contains（含む）
- **注目ポイント**: `one or more ~` = 「1つ以上の〜」。最低数を1と明示する表現

### 文4: "Tables, views, file formats, sequences, UDFs, and stored procedures are all examples of objects available in a schema."

- **主語 (S)**: Tables, views, file formats, sequences, UDFs, and stored procedures（テーブル・ビュー・ファイルフォーマット・シーケンス・UDF・ストアドプロシージャは）
- **動詞 (V)**: are all examples of（すべて〜の例である）
- **後置修飾**: available in a schema（スキーマ内で利用可能な）← 過去分詞/形容詞後置修飾
- **注目ポイント**: `are all examples of ~` = 「すべて〜の例である」。複数の具体例を並列して一般化するパターン

### 文5: "An object can be contained in only one schema."

- **主語 (S)**: An object
- **動詞 (V)**: can be contained in（含まれることができる）← 受動態
- **制限**: only one schema（1つのスキーマにのみ）← `only one` で排他的な1対1関係を示す
- **注目ポイント**: `be contained in only one ~` = 「1つの〜にのみ含まれる」。多対多ではなく1対1の所属関係を示す重要表現

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| the highest level | 名詞句 | 最上位レベル | The highest level is the Account. |
| as many ~ as they like | 数量表現 | 好きなだけ多くの〜 | Customers can have as many accounts as they like. |
| one or more ~ | 数量表現 | 1つ以上の〜 | Each database contains one or more schemas. |
| be contained in ~ | 受動態熟語 | 〜に含まれる | An object can be contained in only one schema. |

## 3-3. 解説文（日本語）

> Snowflakeでは、最上位レベルはSnowflakeアカウントです。顧客は好きなだけ多くのアカウントを持つことができます。アカウントの中にデータベースがあります。各データベースには1つ以上のスキーマが含まれます。スキーマには他のオブジェクトが含まれます。テーブル・ビュー・ファイルフォーマット・シーケンス・UDF・ストアドプロシージャはすべて、スキーマ内で利用可能なオブジェクトの例です。1つのオブジェクトは1つのスキーマにのみ含まれます。

---

## 復習メモ

- [ ] Snowflakeの階層順序 Account → Database → Schema → Table を暗記した
- [ ] スキーマに格納されるオブジェクトの例（テーブル・ビュー・UDF・ストアドプロシージャ等）を列挙できる
- [ ] 1つのオブジェクトは1つのスキーマにのみ属することを確認した
- [ ] `as many ~ as they like`・`be contained in only one ~` の英語パターンを確認した
- [ ] この問題は理論問題のためサンドボックス検証は不要
