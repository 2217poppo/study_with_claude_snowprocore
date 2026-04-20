# 067: Data Sharing No Copy

**SnowPro Core Domain**: Domain 5 — Data Collaboration
**作成日**: 2026-04-16
**正答**: B, C

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Secure Data Sharing | Snowflakeアカウント間でデータを共有する仕組み。データのコピーは発生せず、メタデータを通じてプロバイダーのストレージを直接参照する |
| Metadata Services Layer | Snowflakeの3層アーキテクチャの最上位。データ共有を含む各種メタデータ管理を担当する |
| Provider（プロバイダー） | データを共有する側。ストレージコストを負担する |
| Consumer（コンシューマー） | 共有データを利用する側。ストレージコストは不要。クエリ実行のコンピュートコストのみ負担 |

## 1-2. 重要コンセプトまとめ

- Snowflakeのデータ共有では**データのコピーや転送は一切発生しない**
- 共有は**メタデータサービスレイヤー**を通じて管理される
- コンシューマーはプロバイダーのストレージ上のデータを直接参照する
- コンシューマーには**ストレージコストが発生しない**（プロバイダーが負担）
- コンシューマーが負担するのは**クエリ実行のコンピュートコスト**のみ
- この仕組みにより、リアルタイムで最新のデータにアクセスできる

## 1-3. 公式ドキュメントURL

- [Introduction to Secure Data Sharing](https://docs.snowflake.com/en/user-guide/data-sharing-intro#how-does-secure-data-sharing-work)

---

## 2-1. 問題文（英語）

> Which of the following occurs when a Snowflake account shares a table with another Snowflake account? Select all that apply.
>
> A. Data is copied to the target Snowflake account.
> B. Sharing is managed through the Snowflake metadata services layer.
> C. No actual data is copied or transferred between accounts.
> D. The target Snowflake account is charged for shared data storage.

## 2-2. 問題文の文法解析

### 文1: "Which of the following occurs when a Snowflake account shares a table with another Snowflake account?"

- **主語 (S)**: Which of the following
- **動詞 (V)**: occurs
- **修飾語 (M)**: when a Snowflake account shares a table with another Snowflake account（時間の副詞節）
- **文型**: SV
- **注目ポイント**: 「occurs when ~」で「～の時に何が起こるか」。データ共有時の動作を問う。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| occur | 動詞 | 起こる、発生する | What occurs when data is shared? |
| transfer | 動詞 | 転送する | No data is transferred between accounts. |
| be charged for | 動詞句 | ～に対して課金される | The consumer is not charged for storage. |
| metadata services layer | 名詞句 | メタデータサービスレイヤー | Sharing is managed through the metadata layer. |

## 2-3. 問題文（日本語）

> SnowflakeアカウントがテーブルをSnowflakeアカウントと共有するとき、以下のうち何が起こりますか？該当するものをすべて選んでください。
>
> A. データがターゲットのSnowflakeアカウントにコピーされる。
> B. 共有はSnowflakeのメタデータサービスレイヤーを通じて管理される。
> C. アカウント間で実際のデータのコピーや転送は行われない。
> D. ターゲットのSnowflakeアカウントに共有データのストレージ費用が課金される。

---

## 3-1. 解説文（英語）

> In Snowflake sharing, no data is copied. Instead, it is just the metadata that enables the sharing of data. Since no data is copied, the target Snowflake account (the consumer) is NOT charged for any storage.

## 3-2. 解説文の文法解析

### 文1: "In Snowflake sharing, no data is copied."

- **主語 (S)**: no data
- **動詞 (V)**: is copied（受動態）
- **修飾語 (M)**: In Snowflake sharing
- **文型**: SV（受動態）
- **注目ポイント**: 「no data」で完全否定。シンプルだが試験の核心を突く文。

### 文2: "Instead, it is just the metadata that enables the sharing of data."

- **主語 (S)**: it
- **動詞 (V)**: is
- **補語 (C)**: just the metadata
- **修飾語 (M)**: that enables the sharing of data（関係詞節）
- **文型**: SVC（強調構文: It is ~ that ...）
- **注目ポイント**: 「It is ~ that ...」の強調構文で、メタデータだけが共有を可能にすることを強調。

### 文3: "Since no data is copied, the target Snowflake account (the consumer) is NOT charged for any storage."

- **主語 (S)**: the target Snowflake account (the consumer)
- **動詞 (V)**: is NOT charged
- **修飾語 (M)**: Since no data is copied（理由の副詞節）/ for any storage
- **文型**: SV（受動態）
- **注目ポイント**: 「Since ~」で因果関係。「is NOT charged for ~」で課金されないことを強調。NOTが大文字。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| instead | 副詞 | 代わりに | Instead, only metadata is shared. |
| enable | 動詞 | 可能にする | Metadata enables the sharing of data. |
| It is ~ that ... | 強調構文 | ～なのは...である | It is the metadata that enables sharing. |

## 3-3. 解説文（日本語）

> Snowflakeの共有では、データはコピーされません。代わりに、データの共有を可能にするのはメタデータのみです。データがコピーされないため、ターゲットのSnowflakeアカウント（コンシューマー）にはストレージの課金は一切発生しません。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
