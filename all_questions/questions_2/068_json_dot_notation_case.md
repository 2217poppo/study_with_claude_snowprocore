# 068: JSON Dot Notation Case Sensitivity

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-13
**正答**: SELECT Inventory:Product.name FROM ProductDetails

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Dot Notation（ドット記法） | VARIANTカラムのJSON階層をたどる構文。`column:level1.level2.level3` の形式。1階層目はコロン、2階層目以降はドットで区切る |
| Colon Notation（コロン記法） | カラム名と1階層目の要素をコロン(`:`)で接続する構文。`column:key` |
| Case Sensitivity（大文字小文字の区別） | JSON要素名は**大文字小文字を区別する**。`Product` ≠ `product`、`name` ≠ `Name` |
| VARIANT Column | 半構造化データを格納する列 |

## 1-2. 重要コンセプトまとめ

- JSON要素のアクセス構文: `column:level1.level2`
  - **カラム名と1階層目**: コロン(`:`)で接続
  - **2階層目以降**: ドット(`.`)で接続
- **要素名は大文字小文字を区別する**（超重要）:
  - `Inventory:Product.name` ✅ (JSON内の "Product" と "name" に一致)
  - `Inventory:product.Name` ❌ (大文字小文字が不一致)
- 構文の注意点:
  - `column:key` が正しい（コロンで始める）
  - `column.key:subkey` は**間違い**（ドットとコロンの順序が逆）
  - `EXTRACT_FROM_JSON` はSnowflakeの関数ではない
- カラム名自体は大文字小文字を区別しない（Snowflakeの通常のSQL規則）が、**JSON要素名は区別する**

## 1-3. 公式ドキュメントURL

- [Dot Notation](https://docs.snowflake.com/en/user-guide/querying-semistructured#dot-notation)

---

## 2-1. 問題文（英語）

> The following JSON structure is stored in a VARIANT column called Inventory in a table called ProductDetails. The structure of the JSON is as follows:
>
> ```json
> {
>   "Product":
>   {
>     "code": "ABC123",
>     "name": "Radio",
>     "price": "19.99"
>   }
> }
> ```
>
> Which of the following expression correctly retrieves the product name?
>
> A. SELECT Inventory:product.Name FROM ProductDetails
> B. SELECT EXTRACT_FROM_JSON("name","Inventory\Product") FROM ProductDetails
> C. SELECT Inventory:Product.name FROM ProductDetails
> D. SELECT Inventory.Product:name FROM ProductDetails

## 2-2. 問題文の文法解析

### 文1: "The following JSON structure is stored in a VARIANT column called Inventory in a table called ProductDetails."

- **主語 (S)**: The following JSON structure
- **動詞 (V)**: is stored（受動態）
- **修飾語 (M)**: in a VARIANT column called Inventory（場所）、in a table called ProductDetails（場所）
- **文型**: SV（受動態）
- **注目ポイント**: `called ~` は過去分詞の後置修飾で「～と呼ばれる」。

### 文2: "Which of the following expression correctly retrieves the product name?"

- **主語 (S)**: Which of the following expression
- **動詞 (V)**: retrieves
- **目的語 (O)**: the product name
- **修飾語 (M)**: correctly（副詞）
- **文型**: SVO

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| retrieve | verb | 取得する | Retrieves the product name. |
| traverse | verb | たどる、横断する | Traverse a path in a JSON object. |
| case sensitive | adjective | 大文字小文字を区別する | Element names are case sensitive. |
| dot notation | noun | ドット記法 | Use dot notation to access nested elements. |

## 2-3. 問題文（日本語）

> 以下のJSON構造がProductDetailsテーブルのInventoryというVARIANTカラムに保存されています。
>
> 以下の式のうち、プロダクト名を正しく取得するのはどれですか？
>
> A. SELECT Inventory:product.Name FROM ProductDetails
> B. SELECT EXTRACT_FROM_JSON("name","Inventory\Product") FROM ProductDetails
> C. SELECT Inventory:Product.name FROM ProductDetails
> D. SELECT Inventory.Product:name FROM ProductDetails

---

## 3-1. 解説文（英語）

> The dot notation is used to traverse a path in a JSON object. The typical syntax is \<column_name\>:\<level1_element\>.\<level2_element\>.\<level3_element\>. Note that the first-level element is accessed using a semi-colon between the column name and the first-level element name. Dot is used for any further sub-elements.
>
> Note that element names are case sensitive. Therefore Inventory:Product.name is not the same as Inventory:product.Name.

## 3-2. 解説文の文法解析

### 文1: "The dot notation is used to traverse a path in a JSON object."

- **主語 (S)**: The dot notation
- **動詞 (V)**: is used（受動態）
- **修飾語 (M)**: to traverse a path in a JSON object（目的）
- **文型**: SV

### 文2: "Note that the first-level element is accessed using a semi-colon between the column name and the first-level element name."

- **主語 (S)**: the first-level element
- **動詞 (V)**: is accessed（受動態）
- **修飾語 (M)**: using a semi-colon between ~（手段）
- **文型**: SV
- **注目ポイント**: `Note that ~` は「～に注意」。技術文書で重要ポイントを強調するパターン。

### 文3: "Note that element names are case sensitive."

- **主語 (S)**: element names
- **動詞 (V)**: are
- **補語 (C)**: case sensitive
- **文型**: SVC
- **注目ポイント**: `case sensitive` が最重要ポイント。大文字小文字を間違えるとNULLが返る。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| traverse | verb | たどる | Traverse a path in a JSON object. |
| case sensitive | adjective | 大文字小文字を区別する | Element names are case sensitive. |
| Note that ~ | phrase | ～に注意 | Note that names are case sensitive. |
| sub-element | noun | サブ要素 | Dot is used for sub-elements. |

## 3-3. 解説文（日本語）

> ドット記法はJSONオブジェクト内のパスをたどるために使用されます。典型的な構文は `<カラム名>:<第1階層要素>.<第2階層要素>.<第3階層要素>` です。第1階層の要素はカラム名と要素名の間にコロン（セミコロン）を使用してアクセスします。それ以降のサブ要素にはドットを使用します。
>
> 要素名は大文字小文字を区別することに注意してください。したがって `Inventory:Product.name` は `Inventory:product.Name` とは同じではありません。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
