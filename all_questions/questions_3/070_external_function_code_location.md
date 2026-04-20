# 070: External Function Code Location

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-16
**正答**: A

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| External Function（外部関数） | Snowflake外部のコードを呼び出すUDF。関数のコード自体はSnowflakeに保存されず、外部のリモートサービスで実行される |
| Remote Service（リモートサービス） | External Functionが呼び出す外部サービス。AWS Lambda、Azure Functionsなどのクラウドサービスで実行される |
| UDF (User-Defined Function) | ユーザー定義関数。通常のUDFはSnowflake内にコードが保存される。External Functionはこの点で異なる |
| API Integration | External FunctionがリモートサービスにアクセスするためのSnowflakeオブジェクト。認証情報やエンドポイントを管理する |

## 1-2. 重要コンセプトまとめ

- External Functionのコードは**Snowflakeの外部**に保存・実行される
- Snowflake内に保持されるのは**呼び出し情報（invocation information）のみ**
- 通常のUDF（JavaScript, Python, SQL, Java）はSnowflake内にコードが保存される
- External Functionは他のUDFと異なり、コード自体を含まない
- メタデータやCloud Servicesレイヤーに保存されるわけではない
- テーブルにも保存されない

## 1-3. 公式ドキュメントURL

- [Introduction to External Functions](https://docs.snowflake.com/en/sql-reference/external-functions-introduction)

---

## 2-1. 問題文（英語）

> An external function's code is stored in which location?
>
> A. Outside of Snowflake
> B. In the Snowflake metadata
> C. In a code repository in the cloud services layer
> D. In a table

## 2-2. 問題文の文法解析

### 文1: "An external function's code is stored in which location?"

- **主語 (S)**: An external function's code
- **動詞 (V)**: is stored（受動態）
- **修飾語 (M)**: in which location（疑問の前置詞句）
- **文型**: SV（受動態）
- **注目ポイント**: 「is stored in which location」で保存場所を問う。所有格「external function's」で関数のコードを特定。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| external function | 名詞句 | 外部関数 | External functions invoke code outside Snowflake. |
| location | 名詞 | 場所 | The code is stored in which location? |
| code repository | 名詞句 | コードリポジトリ | Not stored in a code repository. |

## 2-3. 問題文（日本語）

> 外部関数のコードはどの場所に保存されますか？
>
> A. Snowflakeの外部
> B. Snowflakeのメタデータ内
> C. Cloud Servicesレイヤーのコードリポジトリ内
> D. テーブル内

---

## 3-1. 解説文（英語）

> An external function, unlike other UDFs, does not include its own code; instead, it invokes code that is stored and run outside of Snowflake. For an external function, the only thing that is kept inside Snowflake is information that Snowflake uses to invoke the remote service that contains the code.

## 3-2. 解説文の文法解析

### 文1: "An external function, unlike other UDFs, does not include its own code; instead, it invokes code that is stored and run outside of Snowflake."

- **主語 (S)**: An external function / it
- **動詞 (V)**: does not include / invokes
- **目的語 (O)**: its own code / code that is stored and run outside of Snowflake
- **修飾語 (M)**: unlike other UDFs（対比）/ that is stored and run outside of Snowflake（関係詞節）
- **文型**: SVO; SVO（セミコロンで対比）
- **注目ポイント**: 「unlike other UDFs」で通常のUDFとの対比を明示。「does not include ~ ; instead, ~」で否定 + 代替を示すパターン。

### 文2: "For an external function, the only thing that is kept inside Snowflake is information that Snowflake uses to invoke the remote service that contains the code."

- **主語 (S)**: the only thing that is kept inside Snowflake
- **動詞 (V)**: is
- **補語 (C)**: information that Snowflake uses to invoke the remote service
- **修飾語 (M)**: For an external function / that contains the code（関係詞節の入れ子）
- **文型**: SVC
- **注目ポイント**: 「the only thing that ~」で排他的な限定。関係詞節が3重に入れ子になった複雑な文。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| unlike | 前置詞 | ～とは異なり | Unlike other UDFs, it does not include code. |
| invoke | 動詞 | 呼び出す | It invokes code stored outside Snowflake. |
| the only thing that ~ | 限定表現 | ～する唯一のもの | The only thing kept inside is invocation info. |

## 3-3. 解説文（日本語）

> 外部関数は、他のUDFとは異なり、独自のコードを含みません。代わりに、Snowflakeの外部に保存・実行されるコードを呼び出します。外部関数について、Snowflake内に保持される唯一のものは、コードを含むリモートサービスを呼び出すためにSnowflakeが使用する情報です。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
