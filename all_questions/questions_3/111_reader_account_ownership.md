# 111: Reader Account — Ownership and Cost

**SnowPro Core Domain**: Domain 5 — Data Collaboration, Marketplace, and Sharing
**作成日**: 2026-04-17
**正答**: A（データプロバイダーが所有する）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Reader Account（リーダーアカウント） | Snowflakeアカウントを持たない外部ユーザーとデータを共有するためにデータプロバイダーが作成する専用アカウント |
| Data Provider（データプロバイダー） | データを共有する側のSnowflakeアカウント。リーダーアカウントを作成・管理し、コンピュートコストを負担する |
| Data Consumer（データコンシューマー） | データを受け取る側。Snowflakeアカウントを持つ場合は通常の共有、持たない場合はリーダーアカウント経由 |
| Secure Data Sharing | Snowflakeのデータ共有機能。データのコピーなしに別アカウントからデータにアクセスさせる仕組み |
| Compute Cost（コンピュートコスト） | クエリ実行のためのウェアハウス使用コスト。リーダーアカウントでは、消費したコンピュートコストはプロバイダーが負担する |

## 1-2. 重要コンセプトまとめ

- **リーダーアカウントはデータプロバイダーが作成し、プロバイダーが所有する**
  - コンシューマー（受け取り側）が所有するわけではない
  - プロバイダーとコンシューマーの両方が所有することもない
- **リーダーアカウントのコンピュートコストはプロバイダーが負担**
  - コンシューマーはクエリを実行するが、ウェアハウスコストはプロバイダー側に請求される
  - これはSnowflakeの通常アカウント間共有とは異なる（通常は各アカウントが自分のコストを負担）
- **リーダーアカウントの用途**
  - 相手がSnowflakeアカウントを持っていない場合に使用
  - プロバイダーはリーダーアカウントを作成してコンシューマーに認証情報を渡す
- **通常の共有（non-reader）はSnowflakeアカウント間のみ**
  - コンシューマーが既にSnowflakeアカウントを持っている場合はリーダーアカウント不要

## 1-3. 公式ドキュメントURL

- [Creating and Managing Reader Accounts](https://docs.snowflake.com/en/user-guide/data-sharing-reader-create)
- [Who Provides Support for a Reader Account](https://docs.snowflake.com/en/user-guide/data-sharing-reader-create#who-provides-support-for-a-reader-account)

---

## 2-1. 問題文（英語）

> When sharing with a non-Snowflake user, the reader account belongs to which account?
>
> A. The data provider
> B. Neither the data provider nor the data consumer
> C. The data consumer
> D. Both the data provider & the data consumer

## 2-2. 問題文の文法解析

### 文1: "When sharing with a non-Snowflake user, the reader account belongs to which account?"

- **時間節**: When sharing with a non-Snowflake user（分詞構文：主語省略）
- **主語 (S)**: the reader account
- **動詞 (V)**: belongs to
- **疑問詞目的語**: which account
- **文型**: 疑問文（SV + 疑問詞）
- **注目ポイント**: 
  - `non-Snowflake user` = Snowflakeアカウントを持たないユーザー（non- 接頭辞で否定）
  - `belong to` = 〜に属する、〜の所有である

### 選択肢 B の文法: "Neither the data provider nor the data consumer"

- **相関接続詞**: Neither A nor B（AもBも〜でない）
- **注目ポイント**: `Neither ~ nor ~` は2つの対象を同時に否定する慣用表現

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| belong to | 句動詞 | 〜に属する、〜の所有である | The reader account belongs to the data provider. |
| non-Snowflake | 形容詞 | Snowflakeを持たない | Share data with a non-Snowflake user via a reader account. |
| neither A nor B | 相関接続詞 | AもBも〜でない | Neither the provider nor the consumer owns the data copy. |
| provider | 名詞 | 提供者、プロバイダー | The data provider creates and manages the reader account. |
| consumer | 名詞 | 消費者、コンシューマー | The data consumer queries data through the reader account. |

## 2-3. 問題文（日本語）

> Snowflakeを持たないユーザーとデータを共有する場合、リーダーアカウントはどのアカウントに属しますか？
>
> A. データプロバイダー
> B. データプロバイダーでもデータコンシューマーでもない
> C. データコンシューマー
> D. データプロバイダーとデータコンシューマーの両方

---

## 3-1. 解説文（英語）

> A reader account is created by the data provider and owned by the data provider. The data provider bears the compute costs incurred in a reader account.
>
> https://docs.snowflake.com/en/user-guide/data-sharing-reader-create#who-provides-support-for-a-reader-account

## 3-2. 解説文の文法解析

### 文1: "A reader account is created by the data provider and owned by the data provider."

- **主語 (S)**: A reader account
- **動詞1 (V1)**: is created by（受動態）
- **動詞2 (V2)**: owned by（受動態 + and で並列）
- **行為者**: the data provider（両方）
- **文型**: SV（受動態並列）
- **注目ポイント**: 
  - `is created by A and owned by A` = Aに作られ、Aに所有される（2つの受動態を and で並列）
  - 同じ主体が「作成」と「所有」の両方を担うことを強調

### 文2: "The data provider bears the compute costs incurred in a reader account."

- **主語 (S)**: The data provider
- **動詞 (V)**: bears（負担する）
- **目的語 (O)**: the compute costs incurred in a reader account
- **過去分詞後置修飾**: incurred in a reader account（compute costs を修飾）
- **文型**: SVO
- **注目ポイント**: 
  - `bear the costs` = コストを負担する（bearは「背負う」→比喩的に「負担する」）
  - `costs incurred` = 発生したコスト（incurは「（コスト・損失を）生じさせる」）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| bear (costs) | 動詞 | （コストを）負担する | The provider bears the compute costs. |
| incur | 動詞 | （コスト・損失を）生じさせる、被る | Costs incurred by queries in a reader account. |
| owned by | 動詞句 | 〜に所有される | The account is owned by the data provider. |

## 3-3. 解説文（日本語）

> リーダーアカウントはデータプロバイダーによって作成され、データプロバイダーが所有します。データプロバイダーは、リーダーアカウントで発生するコンピュートコストを負担します。

---

## 復習メモ

- [ ] リーダーアカウントはプロバイダーが作成・所有し、コンピュートコストもプロバイダー負担であることを覚えた
- [ ] `neither A nor B`（AもBも〜でない）の相関接続詞を確認した
- [ ] `bear the costs`（コストを負担する）と `costs incurred`（発生したコスト）を確認した
