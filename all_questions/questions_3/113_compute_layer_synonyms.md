# 113: Snowflake Architecture — Compute Layer Synonyms

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features and Architecture
**作成日**: 2026-04-17
**正答**: A, B, C（Virtual Warehouses / Query Processing Layer / Compute Layer）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Virtual Warehouses（仮想ウェアハウス） | Snowflakeのクエリ処理コンピュートリソース。独立したコンピュートクラスター。コンピュート層の別名の一つ |
| Query Processing Layer（クエリ処理層） | Snowflakeアーキテクチャの中間層。クエリ実行を担う。Virtual Warehousesの別名 |
| Compute Layer（コンピュート層） | Query Processing Layerのさらなる別名。CPU・メモリを提供する層 |
| Compute Nodes（コンピュートノード） | 仮想ウェアハウスを構成する個々のサーバーノード。コンピュート層の別名の一つ |
| Compute Clusters（コンピュートクラスター） | 複数のコンピュートノードの集合。コンピュート層の別名の一つ |
| Cloud Layer（クラウド層） | 存在しない誤った用語。Cloud Services Layer（クラウドサービス層）と混同注意 |
| Storage Layer（ストレージ層） | Database Storage Layer の別名。データを物理的に格納する層（コンピュート層ではない） |

## 1-2. 重要コンセプトまとめ

- **コンピュート層の別名（すべて同じ層を指す）**
  - Query Processing Layer
  - Virtual Warehouses
  - Compute Layer
  - Compute Nodes
  - Compute Clusters
- **誤りの選択肢パターン**
  - `Cloud Layer` → 存在しない。正しくは `Cloud Services Layer`
  - `Storage Layer` → 別の層（データ格納層）を指す
- **Snowflakeの3層アーキテクチャ**
  1. Database Storage Layer（ストレージ層）: データの物理的な格納
  2. Query Processing Layer（コンピュート層）: クエリの実行
  3. Cloud Services Layer（クラウドサービス層）: メタデータ管理・認証・最適化など
- **試験での出題パターン**: 「同じ層を指す用語を選べ」や「コンピュート層の別名はどれか」という形式が多い

## 1-3. 公式ドキュメントURL

- [Query Processing — Snowflake Key Concepts](https://docs.snowflake.com/en/user-guide/intro-key-concepts#query-processing)
- [Snowflake Architecture Overview](https://docs.snowflake.com/en/user-guide/intro-key-concepts#snowflake-architecture)

---

## 2-1. 問題文（英語）

> Which of the following terms refers to the same layer in Snowflake architecture? Select all that apply.
>
> A. Virtual Warehouses
> B. Query Processing Layer
> C. Compute Layer
> D. Cloud Layer
> E. Storage Layer

## 2-2. 問題文の文法解析

### 文1: "Which of the following terms refers to the same layer in Snowflake architecture?"

- **主語 (S)**: Which of the following terms
- **動詞 (V)**: refers to（〜を指す）
- **目的語 (O)**: the same layer in Snowflake architecture
- **文型**: SVO（疑問文）
- **注目ポイント**: 
  - `refer to` = 〜を指す、〜を参照する（技術文書でよく使われる）
  - `the same layer` = 同じ層（複数の用語が同一のものを指すという設定）
  - `Select all that apply` = 該当するものをすべて選べ（複数選択の指示）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| refer to | 句動詞 | 〜を指す、〜を参照する | This term refers to the query processing layer. |
| interchangeably | 副詞 | 互換的に、同等に | The terms can be used interchangeably. |
| layer | 名詞 | 層、レイヤー | Snowflake has three distinct layers. |
| architecture | 名詞 | アーキテクチャ、構造 | Snowflake's architecture separates compute from storage. |

## 2-3. 問題文（日本語）

> 次の用語のうち、Snowflakeアーキテクチャの同じ層を指しているものはどれですか？該当するものをすべて選んでください。
>
> A. Virtual Warehouses（仮想ウェアハウス）
> B. Query Processing Layer（クエリ処理層）
> C. Compute Layer（コンピュート層）
> D. Cloud Layer（クラウド層）
> E. Storage Layer（ストレージ層）

---

## 3-1. 解説文（英語）

> Query Processing Layer, Virtual Warehouses, Compute Layer, Compute Nodes, and Compute Clusters may be interchangeably used to refer to "a layer providing query processing capability."
>
> https://docs.snowflake.com/en/user-guide/intro-key-concepts#query-processing

## 3-2. 解説文の文法解析

### 文1: "Query Processing Layer, Virtual Warehouses, Compute Layer, Compute Nodes, and Compute Clusters may be interchangeably used to refer to 'a layer providing query processing capability.'"

- **主語 (S)**: Query Processing Layer, Virtual Warehouses, Compute Layer, Compute Nodes, and Compute Clusters（列挙）
- **動詞 (V)**: may be interchangeably used（受動態 + 助動詞 may + 副詞 interchangeably）
- **目的語**: to refer to "a layer providing query processing capability"（不定詞句）
- **現在分詞後置修飾**: providing query processing capability（a layer を修飾）
- **文型**: SV（受動態）
- **注目ポイント**: 
  - `may be interchangeably used` = 互換的に使われることがある（mayで可能性、interchangeablyで互換性を示す）
  - `a layer providing ~` = 〜を提供する層（現在分詞の後置修飾）
  - `query processing capability` = クエリ処理能力（名詞句）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| interchangeably | 副詞 | 互換的に | These terms are used interchangeably in Snowflake docs. |
| capability | 名詞 | 能力、機能 | The compute layer provides query processing capability. |
| refer to | 句動詞 | 〜を指す | All these terms refer to the same architectural layer. |

## 3-3. 解説文（日本語）

> Query Processing Layer、Virtual Warehouses、Compute Layer、Compute Nodes、Compute Clusterは、「クエリ処理機能を提供する層」を指す用語として互換的に使用されることがあります。

---

## 復習メモ

- [ ] コンピュート層の5つの別名（Query Processing Layer / Virtual Warehouses / Compute Layer / Compute Nodes / Compute Clusters）を覚えた
- [ ] Cloud LayerとStorage Layerは別の層であることを把握した
- [ ] `may be interchangeably used to refer to`（互換的に使われる）の表現を確認した
