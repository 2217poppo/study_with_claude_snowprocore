# 005: Reader Account — Compute Costs Paid by Provider

**SnowPro Core Domain**: Domain 5 — Data Protection and Data Sharing
**作成日**: 2026-04-17
**正答**: True（データプロバイダーがリーダーアカウントのコンピュートコストを負担する）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Reader Account（リーダーアカウント） | データプロバイダーが非Snowflakeユーザーと共有するために作成する特別なSnowflakeアカウント。**コンピュートコストはすべてプロバイダーに請求**される |
| Data Provider（データプロバイダー） | Shareを作成してデータを提供するSnowflakeアカウント。Reader Accountを作成・管理する責任者でもある |
| Virtual Warehouse Compute（仮想ウェアハウスコンピュート） | クエリ実行に使用する計算リソース。Reader Accountが消費するウェアハウスコストはプロバイダーアカウントの請求に追加される |
| Provider Account（プロバイダーアカウント） | Reader Accountを作成・管理するSnowflakeアカウント。Reader Accountのすべてのコンピュートコストが請求される |

## 1-2. 重要コンセプトまとめ

- **Reader AccountのコンピュートコストはプロバイダーがすべCe負担**
  - Reader Accountが仮想ウェアハウスを使用すると、そのコストはプロバイダーアカウントに請求される
  - コンシューマー（Reader Accountユーザー）には請求されない
- **Reader Accountの特徴まとめ**:
  - 目的: 非Snowflakeユーザー（Snowflakeアカウントを持たない組織）とのデータ共有
  - 作成者: データプロバイダー（ACCOUNTADMINロール）
  - ストレージコスト: プロバイダー負担
  - コンピュートコスト: プロバイダー負担
  - Reader Accountユーザーが実行できる操作: データのクエリのみ
- **通常のデータ共有との違い**:
  - 通常のSecure Data Sharing: コンシューマー自身がSnowflakeアカウントを持ち、コンシューマー側でコンピュートコストが発生
  - Reader Account: プロバイダーがすべてのコストを管理・負担

## 1-3. 公式ドキュメントURL

- [Reader Accounts](https://docs.snowflake.com/en/user-guide/data-sharing-reader-create)
- [Introduction to Secure Data Sharing](https://docs.snowflake.com/en/user-guide/data-sharing-intro)

---

## 2-1. 問題文（英語）

> True or False: The data provider is responsible for and pays for the compute costs of a reader account.
>
> A. True ✓
> B. False

## 2-2. 問題文の文法解析

### 文1: "True or False: The data provider is responsible for and pays for the compute costs of a reader account."

- **形式**: True or False問題（真偽問題）
- **主語 (S)**: The data provider
- **動詞1 (V1)**: is responsible for（〜に責任がある）
- **動詞2 (V2)**: pays for（〜の費用を支払う）
- **目的語 (O)**: the compute costs of a reader account（リーダーアカウントのコンピュートコスト）
- **文型**: S + V1 and V2 + O（並列動詞述語）
- **注目ポイント**:
  - `is responsible for AND pays for` — 2つの動詞が共通の目的語（the compute costs）を共有
  - `be responsible for ~` = 「〜に対して責任を負う」
  - `pay for ~` = 「〜の費用を支払う」
  - この2つを組み合わせ「責任を持ち、かつ費用を支払う」という意味

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| be responsible for | 動詞句 | 〜に責任がある | The provider is responsible for reader account costs. |
| pay for | 動詞句 | 〜の費用を支払う | The provider pays for the compute costs. |
| compute costs | 名詞句 | コンピュートコスト | Reader account compute costs go to the provider. |

## 2-3. 問題文（日本語）

> 真偽問題: データプロバイダーはリーダーアカウントのコンピュートコストに対して責任を負い、その費用を支払う。
>
> A. 正しい（True）✓
> B. 誤り（False）

---

## 3-1. 解説文（英語）

> Since the data provider creates and administers the reader account, all the reader account's compute expenses are invoiced to the provider account. Therefore, the reader account's use of the virtual warehouse compute is added to the provider account compute charges.

## 3-2. 解説文の文法解析

### 文1: "Since the data provider creates and administers the reader account, all the reader account's compute expenses are invoiced to the provider account."

- **理由節**: Since the data provider creates and administers the reader account（データプロバイダーがリーダーアカウントを作成・管理しているので）
- **主語 (S)**: all the reader account's compute expenses（リーダーアカウントのすべてのコンピュート費用）
- **動詞 (V)**: are invoiced to（〜に請求される / 受動態）
- **宛先**: the provider account
- **文型**: SV（受動態）
- **注目ポイント**:
  - `since` = 「〜なので」（理由を示す接続詞）
  - `administers` = 管理する（manage よりフォーマルで詳細な管理を含意）
  - `are invoiced to ~` = 「〜に請求書が発行される、〜に請求される」（`invoice` の受動態）

### 文2: "Therefore, the reader account's use of the virtual warehouse compute is added to the provider account compute charges."

- **結果の副詞**: Therefore（したがって）
- **主語 (S)**: the reader account's use of the virtual warehouse compute（リーダーアカウントによる仮想ウェアハウスコンピュートの使用）
- **動詞 (V)**: is added to（〜に追加される / 受動態）
- **追加先**: the provider account compute charges（プロバイダーアカウントのコンピュート請求額）
- **注目ポイント**:
  - `is added to ~` = 「〜に追加される」（コストが積み上げられる）
  - `compute charges` = コンピュートの請求額（= ウェアハウス使用料金）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| administer | 動詞 | 管理する、運営する | The provider creates and administers the reader account. |
| invoice | 動詞 | 請求書を発行する、請求する | Expenses are invoiced to the provider account. |
| be added to | 受動態句 | 〜に追加される | Compute costs are added to the provider's charges. |
| compute charges | 名詞句 | コンピュートの請求額 | Reader account compute is added to provider compute charges. |

## 3-3. 解説文（日本語）

> データプロバイダーがリーダーアカウントを作成・管理しているため、リーダーアカウントのすべてのコンピュート費用はプロバイダーアカウントに請求されます。したがって、リーダーアカウントによる仮想ウェアハウスコンピュートの使用はプロバイダーアカウントのコンピュート請求額に追加されます。

---

## 復習メモ

- [ ] Reader Accountのコンピュートコストはプロバイダー負担であることを覚えた（True）
- [ ] `is responsible for and pays for` — 2つの動詞が共通目的語を共有する並列構造を理解した
- [ ] `invoice`（請求する）と `administer`（管理する）の使い方を確認した
