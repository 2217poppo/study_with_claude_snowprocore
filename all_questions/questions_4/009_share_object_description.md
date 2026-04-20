# 009: Share Object — Description and Availability

**SnowPro Core Domain**: Domain 5 — Data Protection and Data Sharing
**作成日**: 2026-04-17
**正答**: (1) Shareはオブジェクトのコンテナ、(2) Shareはコンシューマー情報を持つ（エンタープライズ専用ではない）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Share（シェア） | データプロバイダーが作成するデータ共有のコンテナオブジェクト。**共有するオブジェクト（DB・スキーマ・テーブル・セキュアビュー）とコンシューマーアカウントの情報を格納する** |
| Container（コンテナ） | 複数のオブジェクトをまとめて格納する入れ物。Shareはコンテナとして機能し、共有対象のオブジェクトを内包する |
| Consumer Account（コンシューマーアカウント） | Shareを受け取ってデータにアクセスするアカウント。1つのShareに複数追加可能。ShareオブジェクトがこのコンシューマーリストをRBACで管理する |
| Encapsulate（カプセル化） | 複数の要素を1つのオブジェクトに包み込むこと。ShareはDB・スキーマ・テーブル・ビュー・コンシューマーアカウントをカプセル化する |
| Snowflake Editions（エディション） | Standard / Enterprise / Business Critical / VPS の4種類。**Shareは全エディションで利用可能**（Enterprise専用ではない） |

## 1-2. 重要コンセプトまとめ

- **Shareオブジェクトの構成要素（試験頻出）**:
  1. 共有する**データベース**（1つのみ）
  2. 共有する**スキーマ**
  3. 共有する**テーブル・セキュアビュー・セキュアMV・セキュアUDF**
  4. **コンシューマーアカウント**のリスト
- **Shareオブジェクトの特性**:
  - **コンテナとして機能**: 共有対象オブジェクトを格納する
  - **コンシューマー情報を保持**: どのアカウントがアクセスできるかを管理
  - **全エディションで利用可能**: Enterprise限定ではない（引っかけ選択肢）
- **引っかけポイント**: "Share objects are available only to enterprise customers." = **False**
  - Snowflakeのデータ共有機能はすべてのエディションで利用可能
- **Shareの管理**:
  - 作成・管理はデフォルトでACCOUNTADMINのみ（他ロールへの権限付与は可能）
  - `CREATE SHARE`・`GRANT ... TO SHARE`・`ALTER SHARE ... ADD ACCOUNTS` で操作

## 1-3. 公式ドキュメントURL

- [Introduction to Secure Data Sharing](https://docs.snowflake.com/en/user-guide/data-sharing-intro)
- [Creating Shares](https://docs.snowflake.com/en/user-guide/data-sharing-provider)

---

## 2-1. 問題文（英語）

> Which of the following statements correctly describe a share?
>
> A. A share object is a container that contains objects to be shared ✓
> B. Share objects are available only to enterprise customers.
> C. A share object has information about the consumer(s) ✓

## 2-2. 問題文の文法解析

### 文1: "Which of the following statements correctly describe a share?"

- **主語 (S)**: Which of the following statements（以下の記述のうちどれが）
- **副詞 (M)**: correctly（正確に）
- **動詞 (V)**: describe（説明する）
- **目的語 (O)**: a share（シェア）
- **注目ポイント**:
  - `correctly describe` = 「正確に説明する」（describe の前に副詞を置く）
  - `which ... describe` = 三人称複数扱い（describe に -s がつかない）

### 文A: "A share object is a container that contains objects to be shared."

- **主語 (S)**: A share object
- **動詞 (V)**: is（〜である）
- **補語 (C)**: a container（コンテナ）
- **関係詞節**: that contains objects to be shared（共有されるべきオブジェクトを含む）
- **注目ポイント**:
  - `to be shared` = 「共有されるべき」（受動態の不定詞）

### 文C: "A share object has information about the consumer(s)."

- **主語 (S)**: A share object
- **動詞 (V)**: has（持っている）
- **目的語 (O)**: information about the consumer(s)（コンシューマーに関する情報）
- **注目ポイント**:
  - `(s)` = 単数または複数（1人または複数のコンシューマーに対応）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| container | 名詞 | コンテナ、格納場所 | A share is a container for shared objects. |
| to be shared | 不定詞句（受動） | 共有されるべき | A share contains objects to be shared. |
| information about | 名詞句 | 〜に関する情報 | A share has information about the consumers. |
| available only to | 形容詞句 | 〜にのみ利用可能 | Shares are NOT available only to enterprise customers. |

## 2-3. 問題文（日本語）

> 以下の記述のうち、シェアを正確に説明しているものはどれですか？
>
> A. シェアオブジェクトは、共有されるべきオブジェクトを格納するコンテナである ✓
> B. シェアオブジェクトはエンタープライズ顧客のみが利用できる
> C. シェアオブジェクトはコンシューマーに関する情報を持っている ✓

---

## 3-1. 解説文（英語）

> A share acts as a container for objects that need to be shared. A share object encapsulates the database & the schema to be shared, the tables and secure views which will be shared, and the consumer account(s) to which the Share will be available. Sharing and consequently share objects are available to all Snowflake editions.

## 3-2. 解説文の文法解析

### 文1: "A share acts as a container for objects that need to be shared."

- **主語 (S)**: A share
- **動詞 (V)**: acts as（〜として機能する）
- **補語 (C)**: a container for objects that need to be shared（共有される必要があるオブジェクトのコンテナ）
- **注目ポイント**:
  - `act as ~` = 「〜として機能する」（役割を示す表現）
  - `need to be shared` = 「共有される必要がある」（need + 受動態の不定詞）

### 文2: "A share object encapsulates the database & the schema to be shared, the tables and secure views which will be shared, and the consumer account(s) to which the Share will be available."

- **主語 (S)**: A share object
- **動詞 (V)**: encapsulates（カプセル化する）
- **目的語 (O)**: 3つの要素（database & schema / tables and secure views / consumer accounts）
- **関係詞節1**: to be shared（共有されるべき）
- **関係詞節2**: which will be shared（共有される予定の）
- **関係詞節3**: to which the Share will be available（そのShareが利用可能な）
- **注目ポイント**:
  - `encapsulate` = カプセル化する（複数の要素を1つのオブジェクトに包み込む）
  - `to which ~` = 「それに〜できる」（前置詞+関係代名詞）

### 文3: "Sharing and consequently share objects are available to all Snowflake editions."

- **主語 (S)**: Sharing and consequently share objects（データ共有とそれにより当然シェアオブジェクト）
- **動詞 (V)**: are available（利用可能である）
- **対象**: to all Snowflake editions（すべてのエディションで）
- **注目ポイント**:
  - `consequently` = 「その結果として、当然」（論理的な帰結を示す副詞）
  - `are available to ~` = 「〜で利用可能である」（エディション制限なしを強調）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| encapsulate | 動詞 | カプセル化する、包含する | A share encapsulates the database, tables, and consumers. |
| consequently | 副詞 | 結果として、当然 | Sharing and consequently share objects are available to all. |
| act as | 動詞句 | 〜として機能する | A share acts as a container for shared objects. |

## 3-3. 解説文（日本語）

> シェアは共有される必要があるオブジェクトのコンテナとして機能します。シェアオブジェクトは、共有されるデータベースとスキーマ、共有されるテーブルとセキュアビュー、そしてそのShareが利用可能なコンシューマーアカウントをカプセル化します。データ共有、そしてそれに伴いシェアオブジェクトも、すべてのSnowflakeエディションで利用可能です。

---

## 復習メモ

- [ ] Shareは「コンテナ」＋「コンシューマー情報を保持」と覚えた
- [ ] Share = 全エディションで利用可能（Enterprise専用ではない）を確認した
- [ ] `encapsulate`（カプセル化する）と `act as ~`（〜として機能する）の使い方を確認した
