# 093: PUT Command Stage Types

**SnowPro Core Domain**: Domain 3 — Data Loading, Unloading, and Connectivity
**作成日**: 2026-04-16
**正答**: A, B, C

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| PUT Command | オンプレミスのローカルファイルを**内部ステージ**にアップロードするコマンド。外部ステージには使用不可 |
| User Stage（ユーザーステージ） | 各ユーザーに自動的に割り当てられる内部ステージ（`@~`）。PUTでアップロード可能 |
| Table Stage（テーブルステージ） | 各テーブルに自動的に割り当てられる内部ステージ（`@%table_name`）。PUTでアップロード可能 |
| Named Internal Stage（名前付き内部ステージ） | ユーザーが明示的に作成する内部ステージ。PUTでアップロード可能 |
| External Stage（外部ステージ） | S3/Azure Blob/GCSを参照するステージ。PUTは使用**不可**（クラウドプロバイダーのツールを使用） |
| GET Command | 内部ステージからローカルにファイルをダウンロードするコマンド。PUTの逆方向 |

## 1-2. 重要コンセプトまとめ

- PUTコマンドでアップロードできるのは**内部ステージのみ**（3種類すべて）:
  1. **User Stage** (`@~`)
  2. **Table Stage** (`@%table_name`)
  3. **Named Internal Stage** (`@stage_name`)
- **外部ステージにはPUT不可** — クラウドプロバイダーのCLI/ツールを使用
- GETコマンド（ダウンロード）も内部ステージのみ対応
- 外部ステージへのデータ操作はクラウドプロバイダーのユーティリティで行う

## 1-3. 公式ドキュメントURL

- [Bulk Unloading Process](https://docs.snowflake.com/en/user-guide/data-unload-overview#bulk-unloading-process)
- [PUT Command](https://docs.snowflake.com/en/sql-reference/sql/put)

---

## 2-1. 問題文（英語）

> You can upload data into which of the following stages using the PUT command? Select all that apply.
>
> A. User Stage
> B. Table Stage
> C. Named Internal Stage
> D. External Stage

## 2-2. 問題文の文法解析

### 文1: "You can upload data into which of the following stages using the PUT command?"

- **主語 (S)**: You
- **動詞 (V)**: can upload
- **目的語 (O)**: data
- **修飾語 (M)**: into which of the following stages / using the PUT command
- **文型**: SVO

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| upload | 動詞 | アップロードする | Upload data using the PUT command. |

## 2-3. 問題文（日本語）

> PUTコマンドを使用してデータをアップロードできるステージは以下のうちどれですか？該当するものをすべて選んでください。
>
> A. ユーザーステージ
> B. テーブルステージ
> C. 名前付き内部ステージ
> D. 外部ステージ

---

## 3-1. 解説文（英語）

> The PUT command uploads data from an on-premises system to an internal stage (including named internal stages, table stages & user stages). The GET command is used to download data from an internal stage to an on-premises system. To download or upload data to an external stage, cloud provider utilities or other tools are used to interact with data in the cloud storage pointed to by the external stage.

## 3-2. 解説文の文法解析

### 文1: "The PUT command uploads data from an on-premises system to an internal stage (including named internal stages, table stages & user stages)."

- **主語 (S)**: The PUT command
- **動詞 (V)**: uploads
- **目的語 (O)**: data
- **修飾語 (M)**: from an on-premises system / to an internal stage / (including ...)
- **文型**: SVO
- **注目ポイント**: 「including」の括弧内で3種類の内部ステージを列挙。

### 文2: "To download or upload data to an external stage, cloud provider utilities or other tools are used to interact with data in the cloud storage pointed to by the external stage."

- **主語 (S)**: cloud provider utilities or other tools
- **動詞 (V)**: are used（受動態）
- **修飾語 (M)**: To download or upload data to an external stage（目的）/ to interact with data ...（目的の不定詞）
- **文型**: SV（受動態）
- **注目ポイント**: 外部ステージへのデータ操作はSnowflakeコマンドではなくクラウドプロバイダーのツールを使用。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| on-premises | 形容詞 | オンプレミスの | Upload from an on-premises system. |
| cloud provider utilities | 名詞句 | クラウドプロバイダーのユーティリティ | Use cloud provider utilities for external stages. |
| pointed to by | 過去分詞句 | ～によって参照される | The cloud storage pointed to by the external stage. |

## 3-3. 解説文（日本語）

> PUTコマンドはオンプレミスシステムから内部ステージ（名前付き内部ステージ、テーブルステージ、ユーザーステージを含む）にデータをアップロードします。GETコマンドは内部ステージからオンプレミスシステムにデータをダウンロードするために使用されます。外部ステージへのデータのダウンロードやアップロードには、外部ステージが参照するクラウドストレージ内のデータとやり取りするために、クラウドプロバイダーのユーティリティやその他のツールを使用します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
