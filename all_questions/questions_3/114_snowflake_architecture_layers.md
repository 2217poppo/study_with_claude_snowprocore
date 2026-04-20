# 114: Snowflake Architecture — Three Key Layers

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features and Architecture
**作成日**: 2026-04-17
**正答**: A, C, D（Database Storage / Query Processing / Cloud Services）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Database Storage Layer（ストレージ層） | Snowflakeの物理的なデータ格納層。AWS・Azure・Google Cloud上の低コストのクラウドストレージを使用 |
| Query Processing Layer（クエリ処理層） | 仮想ウェアハウスで構成されるコンピュート層。クエリの実行・処理を担う |
| Cloud Services Layer（クラウドサービス層） | Snowflakeの「頭脳」。認証・アクセス制御・メタデータ管理・クエリ最適化・インフラ管理などを担う |
| Authentication Services（認証サービス） | Snowflakeに対する認証機能。独立した層ではなく、Cloud Services Layerの一機能として含まれる |
| Global Services（グローバルサービス） | 存在しない用語。試験での誤答選択肢として使われる |

## 1-2. 重要コンセプトまとめ

- **Snowflakeの3層アーキテクチャ（必須暗記）**
  1. **Database Storage**: AWS / Azure / Google Cloud上の安価なクラウドストレージ
  2. **Query Processing**: 仮想ウェアハウスによるクエリ実行（コンピュート層）
  3. **Cloud Services**: 認証・最適化・メタデータ管理などの「Snowflakeの頭脳」
- **誤りの選択肢パターン**
  - `Authentication Services` → 独立した層ではない（Cloud Services Layerの一部）
  - `Global Services` → 存在しない用語
- **各層の特徴**
  - Storage層: コンピュートと分離された永続的ストレージ（クエリを処理しない）
  - Query Processing層: ウェアハウスごとに独立したコンピュートリソース（ストレージを共有）
  - Cloud Services層: すべてのウェアハウス・ユーザーで共有される管理機能
- **コンピュートとストレージの分離** がSnowflakeの大きな特徴

## 1-3. 公式ドキュメントURL

- [Snowflake Architecture](https://docs.snowflake.com/en/user-guide/intro-key-concepts#snowflake-architecture)
- [Cloud Services Layer](https://docs.snowflake.com/en/user-guide/intro-key-concepts#cloud-services)

---

## 2-1. 問題文（英語）

> Which of the following are the key layers in Snowflake architecture? Select all that apply.
>
> A. Database Storage
> B. Authentication Services
> C. Query Processing
> D. Cloud Services
> E. Global Services

## 2-2. 問題文の文法解析

### 文1: "Which of the following are the key layers in Snowflake architecture?"

- **主語 (S)**: Which of the following
- **動詞 (V)**: are
- **補語 (C)**: the key layers in Snowflake architecture
- **文型**: SVC（疑問文）
- **注目ポイント**: 
  - `key layers` = 主要な層（keyは「重要な」という形容詞）
  - `Select all that apply` = 該当するものをすべて選べ

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| key | 形容詞 | 主要な、重要な | The key layers are Database Storage, Query Processing, and Cloud Services. |
| layer | 名詞 | 層 | Each layer in Snowflake has a distinct responsibility. |
| distinct | 形容詞 | 明確な、別個の | Snowflake has three distinct layers. |

## 2-3. 問題文（日本語）

> 次のうち、Snowflakeアーキテクチャの主要な層はどれですか？該当するものをすべて選んでください。
>
> A. Database Storage（データベースストレージ）
> B. Authentication Services（認証サービス）
> C. Query Processing（クエリ処理）
> D. Cloud Services（クラウドサービス）
> E. Global Services（グローバルサービス）

---

## 3-1. 解説文（英語）

> Snowflake architecture has three distinct layers:
> Database Storage - Cheap cloud storage on AWS, Azure, or Google Cloud
> Query Processing - Primarily composed of virtual warehouses
> Cloud Services - The brain of the whole operation
>
> https://docs.snowflake.com/en/user-guide/intro-key-concepts#snowflake-architecture

## 3-2. 解説文の文法解析

### 文1: "Snowflake architecture has three distinct layers:"

- **主語 (S)**: Snowflake architecture
- **動詞 (V)**: has
- **目的語 (O)**: three distinct layers
- **文型**: SVO
- **注目ポイント**: コロン（:）の後に列挙が続く（英語の列挙構文）

### 箇条書きの文法分析

- **Database Storage - Cheap cloud storage on AWS, Azure, or Google Cloud**
  - ダッシュ（-）で定義を示す（辞書的な形式）
  - `Cheap cloud storage` = 安価なクラウドストレージ（cloud computing の文脈でcheapはコスト効率を示す）

- **Query Processing - Primarily composed of virtual warehouses**
  - `primarily composed of ~` = 主に〜で構成される（受動態の形容詞句）
  - `primarily` = 主に（副詞で程度を示す）

- **Cloud Services - The brain of the whole operation**
  - `the brain of ~` = 〜の頭脳（比喩表現）
  - `the whole operation` = 全体の運用（operationは「業務・動作」）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| distinct | 形容詞 | 明確に異なる、別個の | Three distinct layers form Snowflake's architecture. |
| primarily | 副詞 | 主に、第一に | Query processing is primarily done by virtual warehouses. |
| composed of | 形容詞句 | 〜で構成される | Virtual warehouses are composed of compute clusters. |
| operation | 名詞 | 動作、運用、業務 | Cloud Services is the brain of the whole operation. |

## 3-3. 解説文（日本語）

> Snowflakeのアーキテクチャには3つの明確な層があります：
> Database Storage - AWS、Azure、またはGoogle Cloud上の安価なクラウドストレージ
> Query Processing - 主に仮想ウェアハウスで構成される
> Cloud Services - 全体の運用における頭脳

---

## 復習メモ

- [ ] Snowflakeの3層アーキテクチャ（Database Storage / Query Processing / Cloud Services）を暗記した
- [ ] Authentication ServicesとGlobal Servicesは存在しない層であることを確認した
- [ ] `primarily composed of`（主に〜で構成される）と `the brain of the whole operation`（頭脳の比喩）を確認した
