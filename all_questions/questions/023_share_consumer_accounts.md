# 023: Share Consumer Accounts

**SnowPro Core Domain**: Domain 5 — Data Collaboration
**作成日**: 2026-04-02
**正答**: B (False)
- A. True（**選択済み・不正解**）
- B. False（正解・未選択）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Share（シェア） | データプロバイダーがコンシューマーと共有するSnowflakeオブジェクト。データベース・スキーマ・テーブル・ビュー等を含められる |
| Data Provider（データプロバイダー） | Shareを作成してデータを提供するSnowflakeアカウント |
| Consumer Account（コンシューマーアカウント） | Shareを受け取ってデータにアクセスするSnowflakeアカウント。1つのShareに対して0・1・複数を追加できる |
| Secure Data Sharing（セキュアデータ共有） | Snowflakeのデータ共有機能。実データのコピーをせずに、コンシューマーがプロバイダーのデータにアクセスできる仕組み |

## 1-2. 重要コンセプトまとめ

- **1つのShareに追加できるコンシューマー数**: **0・1・複数** — 上限なし
  - 0: まだ誰にも共有していない状態（Shareは存在するがコンシューマーなし）
  - 1: 特定の1アカウントのみに共有
  - 複数: 多数のコンシューマーアカウントに同時共有

- **「1つしか追加できない」は誤り** ← 今回の不正解ポイント
  - "only one" という絶対的な制限は存在しない

- **逆方向の制限はある**:
  - 1つのコンシューマーアカウントが受け取れるShareは複数OK
  - 1つのShareを複数アカウントに配布することも、逆に複数のShareを1アカウントに提供することも可能

- **Secure Data Sharing の特徴**（試験頻出）:
  - データのコピーを作らない → ストレージコストがコンシューマーに発生しない
  - プロバイダーのデータが更新されると、コンシューマーにもリアルタイムで反映
  - 共有できるのは**同じクラウドプロバイダーの同じリージョン内**のアカウント（異なるリージョンはデータレプリケーションが必要）

- **試験ポイント**: 「can only ~」「must be exactly one」などの**限定表現**が問題文に出たら False の可能性を疑う

## 1-3. 公式ドキュメントURL

- [Introduction to Secure Data Sharing](https://docs.snowflake.com/en/user-guide/data-sharing-intro)

---

## 2-1. 問題文（英語）

> True or False: A Snowflake share can only have one consumer account added to it.
>
> A. True
> B. False

## 2-2. 問題文の文法解析

### 文1: "A Snowflake share can only have one consumer account added to it."

- **主語 (S)**: A Snowflake share
- **動詞 (V)**: can have（助動詞 can + 動詞）
- **目的語 (O)**: one consumer account added to it
- **副詞**: only（「ひとつだけ」を強調）
- **文型**: SVO（have O + 過去分詞）
- **注目ポイント**:
  - 「can only have ~」の only が制限を表す。「〜しか持てない」
  - 「one consumer account added to it」は `have + O + 過去分詞` 構文。「コンシューマーアカウントが（Shareに）追加された状態を持てる」
  - この文は False → **「can only」という制限は誤り**

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| share | noun | シェア（データ共有オブジェクト） | Create a share to provide data to consumers. |
| consumer account | noun phrase | コンシューマーアカウント（データ受取側） | Multiple consumer accounts can access one share. |
| can only ~ | modal phrase | 〜しかできない（制限を示す） | False — a share is not limited to only one consumer. |
| added to it | 過去分詞句 | それ（Share）に追加された | Consumer accounts can be added to a share. |

## 2-3. 問題文（日本語）

> 正誤問題：Snowflakeのシェアには、コンシューマーアカウントを1つしか追加できない。
>
> A. True（正しい）
> B. False（誤り）

---

## 3-1. 解説文（英語）

> A Snowflake share can have zero, one, or multiple consumers added to it.

## 3-2. 解説文の文法解析

### 文1: "A Snowflake share can have zero, one, or multiple consumers added to it."

- **主語 (S)**: A Snowflake share
- **動詞 (V)**: can have
- **目的語 (O)**: zero, one, or multiple consumers added to it
- **文型**: SVO（have O + 過去分詞）
- **注目ポイント**:
  - 「zero, one, or multiple」の3択列挙。0・1・複数のいずれも可能という明示
  - 問題文の「can only have one」を「can have zero, one, or multiple」で直接否定する構造
  - 「zero」を先頭に置くことで「コンシューマーゼロ（誰にも共有していない）も有効な状態」であることを強調

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| zero, one, or multiple | 列挙表現 | 0・1・複数（いずれも可能） | A share can have zero, one, or multiple consumers. |
| consumer | noun | コンシューマー（データ受取側） | Multiple consumers can be added to one share. |
| multiple | adjective | 複数の | Multiple consumer accounts can access the same share. |

## 3-3. 解説文（日本語）

> Snowflakeのシェアには、コンシューマーを0・1・複数のいずれの数でも追加することができます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
