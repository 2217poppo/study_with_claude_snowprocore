# 090: Cloud Services Metadata Management

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-14
**正答**: Metadata Management

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Cloud Services Layer | Snowflakeの3層アーキテクチャの最上位層。メタデータ管理・認証・クエリ最適化・アクセス制御等を担当 |
| Metadata Management | Cloud Servicesレイヤーの主要機能。データ保存方法・マイクロパーティション情報・DB/テーブル情報・ユーザー/ロール/セキュリティ情報を管理 |
| Query Processing Layer | クエリ実行を担当する層。仮想ウェアハウスで構成。Cloud Servicesレイヤーとは別 |
| Storage Layer | データの永続保存を担当する層。Cloud Servicesレイヤーとは別 |

## 1-2. 重要コンセプトまとめ

- Cloud Servicesレイヤーが管理する**メタデータ**:
  - データの保存方法
  - マイクロパーティションの情報
  - データベースとテーブルの情報
  - ユーザー・ロール・セキュリティの情報
- Cloud Servicesが提供する主要機能:
  - **Metadata Management** ✅
  - 認証・アクセス制御
  - クエリ最適化・コンパイル
  - トランザクション管理
- Cloud Servicesが**提供しない**もの:
  - Data Storage（→ Storage Layer）
  - Query Execution（→ Query Processing Layer / 仮想WH）

## 1-3. 公式ドキュメントURL

- [Snowflake Architecture](https://docs.snowflake.com/en/user-guide/intro-key-concepts#snowflake-architecture)

---

## 2-1. 問題文（英語）

> The cloud services layer in Snowflake provides which one of the following?
>
> A. Data Storage
> B. Metadata Management
> C. Query execution

## 2-2. 問題文の文法解析

### 文1: "The cloud services layer in Snowflake provides which one of the following?"

- **主語 (S)**: The cloud services layer in Snowflake
- **動詞 (V)**: provides
- **目的語 (O)**: which one of the following
- **文型**: SVO（疑問文）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| metadata | noun | メタデータ | Contains and manages a variety of metadata. |
| query processing layer | noun | クエリ処理レイヤー | Query execution is by the query processing layer. |

## 2-3. 問題文（日本語）

> SnowflakeのCloud Servicesレイヤーは以下のどれを提供しますか？
>
> A. データストレージ
> B. メタデータ管理
> C. クエリ実行

---

## 3-1. 解説文（英語）

> The cloud services layer contains and manages a variety of metadata, including details regarding how the data is stored, information on the micro-partitions, metadata regarding the databases and tables in your system, the users, roles and security, and so forth. Query execution is performed by the query processing layer (not cloud services).

## 3-2. 解説文の文法解析

### 文1: "The cloud services layer contains and manages a variety of metadata, including details regarding how the data is stored, information on the micro-partitions, metadata regarding the databases and tables in your system, the users, roles and security, and so forth."

- **主語 (S)**: The cloud services layer
- **動詞 (V)**: contains and manages
- **目的語 (O)**: a variety of metadata
- **修飾語 (M)**: including ~（具体例列挙）、and so forth（等々）
- **文型**: SVO
- **注目ポイント**: `including ~` で広範なメタデータ種別を列挙。`and so forth` で「その他にも」と示唆。

### 文2: "Query execution is performed by the query processing layer (not cloud services)."

- **主語 (S)**: Query execution
- **動詞 (V)**: is performed（受動態）
- **修飾語 (M)**: by the query processing layer（動作主）、(not cloud services)（否定補足）
- **文型**: SV
- **注目ポイント**: 括弧内の `(not cloud services)` でCloud Servicesではないことを明確に否定。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| a variety of ~ | phrase | 様々な～ | Contains a variety of metadata. |
| and so forth | phrase | 等々 | Users, roles, security, and so forth. |
| performed by ~ | phrase | ～によって実行される | Query execution is performed by the query processing layer. |

## 3-3. 解説文（日本語）

> Cloud Servicesレイヤーは様々なメタデータを含み管理しています。データの保存方法の詳細、マイクロパーティションの情報、システム内のデータベースとテーブルに関するメタデータ、ユーザー・ロール・セキュリティの情報などが含まれます。クエリ実行はクエリ処理レイヤー（Cloud Servicesではない）によって実行されます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
