# 090: Share Object Contents

**SnowPro Core Domain**: Domain 5 — Data Collaboration
**作成日**: 2026-04-16
**正答**: B, C, D

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Share Object（シェアオブジェクト） | プロバイダーが作成するデータ共有のコンテナ。共有するオブジェクトとコンシューマーアカウントを指定する |
| USAGE Privilege | DB/スキーマへのアクセスに必要な基本権限。Shareに含まれる |
| Consumer Account | 共有データを利用する側のアカウント。Shareにコンシューマーアカウントが指定される |
| Secure View | データ共有で安全にデータを公開するためのビュー。Shareに含めて共有可能 |

## 1-2. 重要コンセプトまとめ

- Shareオブジェクトに**含まれるもの**:
  1. DB・スキーマへのUSAGE権限
  2. 共有オブジェクト（テーブル、セキュアビュー等）への権限
  3. 共有先のコンシューマーアカウント
- Shareオブジェクトに**含まれないもの**:
  - **仮想ウェアハウス** — コンシューマーは自分のWHを使用
- Snowflakeコンシューマーは自分のWHでクエリ実行
- 非Snowflakeコンシューマーはプロバイダーが設定したWHを使用（Reader Account経由）

## 1-3. 公式ドキュメントURL

- [Data Sharing Introduction](https://docs.snowflake.com/en/user-guide/data-sharing-intro)

---

## 2-1. 問題文（英語）

> Which statements correctly describe the contents of a Snowflake share object? Select all that apply.
>
> A. A share object contains the virtual warehouse that will be used to execute queries on the shared objects.
> B. A share object contains privileges that grant access to a database & a schema from which objects are being shared.
> C. A share object contains privileges that grant access to the shared objects, i.e., tables, secure views, etc., that are being shared.
> D. A share object contains the consumer account(s) with which the database & the objects are to be shared.

## 2-2. 問題文の文法解析

### 文1: "Which statements correctly describe the contents of a Snowflake share object?"

- **主語 (S)**: Which statements
- **動詞 (V)**: correctly describe
- **目的語 (O)**: the contents of a Snowflake share object
- **文型**: SVO

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| contents | 名詞 | 内容、含まれるもの | The contents of a share object. |
| grant access to | 動詞句 | ～へのアクセスを許可する | Privileges that grant access to a database. |
| from which | 関係代名詞 | そこから | The schema from which objects are shared. |

## 2-3. 問題文（日本語）

> Snowflakeのシェアオブジェクトの内容を正しく説明しているのはどれですか？該当するものをすべて選んでください。
>
> A. シェアオブジェクトには共有オブジェクトへのクエリ実行に使用される仮想ウェアハウスが含まれる。
> B. シェアオブジェクトにはオブジェクトが共有されるデータベースとスキーマへのアクセスを許可する権限が含まれる。
> C. シェアオブジェクトには共有されるオブジェクト（テーブル、セキュアビュー等）へのアクセスを許可する権限が含まれる。
> D. シェアオブジェクトにはデータベースとオブジェクトが共有されるコンシューマーアカウントが含まれる。

---

## 3-1. 解説文（英語）

> A share acts as a container for objects that need to be shared and specifies the consumer accounts. A share contains USAGE privileges on the database & the schema to be shared, privileges on the tables, secure views which will be shared, and the consumer account(s) to which the Share will be available. A virtual warehouse is not part of a share. If a Snowflake customer consumes a share, they will use their own virtual warehouse. If a non-Snowflake customer is consuming the Share, they will use the data provider compute through a data provider-created virtual warehouse (which would have been separately configured).

## 3-2. 解説文の文法解析

### 文1: "A share acts as a container for objects that need to be shared and specifies the consumer accounts."

- **主語 (S)**: A share
- **動詞 (V)**: acts as ... and specifies
- **目的語/補語**: a container / the consumer accounts
- **文型**: SVC + SVO
- **注目ポイント**: 「acts as a container」で「コンテナとして機能する」。Shareの本質を定義。

### 文2: "A virtual warehouse is not part of a share."

- **主語 (S)**: A virtual warehouse
- **動詞 (V)**: is
- **補語 (C)**: not part of a share
- **文型**: SVC
- **注目ポイント**: 明確な否定でWHがShareに含まれないことを示す。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| acts as | 動詞句 | ～として機能する | A share acts as a container. |
| not part of | 前置詞句 | ～の一部ではない | A virtual warehouse is not part of a share. |
| separately configured | 過去分詞句 | 別途設定された | A provider-created warehouse, separately configured. |

## 3-3. 解説文（日本語）

> Shareは共有が必要なオブジェクトのコンテナとして機能し、コンシューマーアカウントを指定します。Shareには共有されるDB・スキーマへのUSAGE権限、共有されるテーブル・セキュアビューへの権限、およびShareが利用可能になるコンシューマーアカウントが含まれます。仮想ウェアハウスはShareの一部ではありません。SnowflakeコンシューマーがShareを利用する場合、自分のVWを使用します。非Snowflakeコンシューマーの場合、プロバイダーが別途設定したVWを通じてコンピュートリソースを使用します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
