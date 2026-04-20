# 075: External Function Location

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-13
**正答**: Outside of Snowflake

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| External Function（外部関数） | コード自体はSnowflake**外部**で保存・実行されるUDFの一種。Snowflakeはリモートサービスを呼び出すための情報のみ保持 |
| Remote Service（リモートサービス） | External Functionのコードが実行される外部サービス（AWS Lambda、Azure Functions等） |
| UDF (User-Defined Function) | ユーザー定義関数。通常のUDFはSnowflake内部にコードを含むが、External Functionは外部 |
| API Integration | External Functionがリモートサービスを呼び出すために使用するSnowflakeオブジェクト |

## 1-2. 重要コンセプトまとめ

- External Functionのコードは **Snowflakeの外部** で実行される
- Snowflake内部に保持されるのは「リモートサービスを呼び出すための情報」のみ
- 通常のUDFとの違い:
  - **通常のUDF**: コードがSnowflake内部に含まれる
  - **External Function**: コードは外部のリモートサービスに存在
- 外部関数は `invoke`（呼び出す）するだけで、実際の処理は外部で行われる
- 実行場所の選択肢の間違い:
  - サンドボックス、ウェアハウスメモリ、Cloud Servicesレイヤーはいずれも不正解

## 1-3. 公式ドキュメントURL

- [Introduction to External Functions](https://docs.snowflake.com/en/sql-reference/external-functions-introduction)

---

## 2-1. 問題文（英語）

> An external function's code executes in which location?
>
> A. Outside of Snowflake
> B. In a sandbox in Snowflake
> C. In virtual warehouse memory
> D. In the cloud services layer

## 2-2. 問題文の文法解析

### 文1: "An external function's code executes in which location?"

- **主語 (S)**: An external function's code
- **動詞 (V)**: executes
- **修飾語 (M)**: in which location（疑問副詞句）
- **文型**: SV（疑問文）
- **注目ポイント**: `'s code` は所有格で「外部関数のコード」。`in which location` で場所を問う。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| execute | verb | 実行する | Code executes outside of Snowflake. |
| invoke | verb | 呼び出す | It invokes code stored outside. |
| remote service | noun | リモートサービス | The remote service contains the code. |

## 2-3. 問題文（日本語）

> 外部関数のコードはどの場所で実行されますか？
>
> A. Snowflakeの外部
> B. Snowflake内のサンドボックス
> C. 仮想ウェアハウスのメモリ内
> D. Cloud Servicesレイヤー内

---

## 3-1. 解説文（英語）

> An external function, unlike other UDFs, does not include its own code; instead, it invokes code that is stored and run outside of Snowflake. For an external function, the only thing that is kept inside Snowflake is information that Snowflake uses to invoke the remote service that contains the code.

## 3-2. 解説文の文法解析

### 文1: "An external function, unlike other UDFs, does not include its own code; instead, it invokes code that is stored and run outside of Snowflake."

- **主語 (S)**: An external function / it
- **動詞 (V)**: does not include / invokes
- **目的語 (O)**: its own code / code that is stored and run outside of Snowflake
- **修飾語 (M)**: unlike other UDFs（対比）、instead（代わりに）
- **文型**: SVO + SVO
- **注目ポイント**: `unlike ~` で通常UDFとの対比。`; instead, ~` で代替動作を提示。

### 文2: "For an external function, the only thing that is kept inside Snowflake is information that Snowflake uses to invoke the remote service that contains the code."

- **主語 (S)**: the only thing that is kept inside Snowflake
- **動詞 (V)**: is
- **補語 (C)**: information that Snowflake uses to invoke the remote service
- **文型**: SVC
- **注目ポイント**: `the only thing that ~` で「～される唯一のもの」。Snowflake内部に保持される情報が限定的であることを強調。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| unlike ~ | preposition | ～とは異なり | Unlike other UDFs. |
| instead | adverb | 代わりに | Instead, it invokes external code. |
| the only thing that ~ | phrase | ～する唯一のもの | The only thing kept inside Snowflake. |

## 3-3. 解説文（日本語）

> 外部関数は、他のUDFとは異なり、自身のコードを含みません。代わりに、Snowflakeの外部に保存・実行されるコードを呼び出します。外部関数においてSnowflake内部に保持される唯一のものは、コードを含むリモートサービスを呼び出すためにSnowflakeが使用する情報です。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
