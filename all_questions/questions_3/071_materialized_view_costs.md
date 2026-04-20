# 071: Materialized View Costs

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-16
**正答**: A, B

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Materialized View（マテリアライズドビュー） | クエリ結果を物理的に保存するビュー。自動的にバックグラウンドでメンテナンスされ、ベーステーブルの変更が反映される |
| Storage Cost（ストレージコスト） | データの保存に対する課金。MVはクエリ結果を保存するため、ストレージコストが発生する |
| Serverless Cost（サーバーレスコスト） | Snowflakeが自動的にバックグラウンドで行う処理のコスト。MVのメンテナンスはサーバーレスコンピュートで実行される |
| Background Maintenance（バックグラウンドメンテナンス） | ベーステーブルの変更に伴い、MVを最新状態に保つ自動処理。ユーザーのVWではなくSnowflakeのサーバーレスコンピュートを使用 |

## 1-2. 重要コンセプトまとめ

- MVは**2種類のコスト**が発生する:
  1. **ストレージコスト**: クエリ結果を物理保存するため
  2. **サーバーレスコスト**: バックグラウンドメンテナンスのため
- MVのメンテナンスは**ユーザーのVWではなくSnowflakeのサーバーレスコンピュート**で実行
- したがって「Virtual Warehouse Costs」は不正解
- 「Replication costs」もMVとは直接関係ない
- サーバーレスコスト = Snowflakeが裏側で自動的に使用するコンピュートリソースの費用
- 通常のViewはストレージコストなし（SQL定義のみ保存）

## 1-3. 公式ドキュメントURL

- [Materialized Views Cost](https://docs.snowflake.com/en/user-guide/views-materialized#materialized-views-cost)

---

## 2-1. 問題文（英語）

> A materialized view contributes to which of the following costs?
>
> Select all that apply.
>
> A. Storage Costs
> B. Serverless Costs
> C. Replication costs
> D. Virtual Warehouse Costs

## 2-2. 問題文の文法解析

### 文1: "A materialized view contributes to which of the following costs?"

- **主語 (S)**: A materialized view
- **動詞 (V)**: contributes to
- **目的語 (O)**: which of the following costs
- **文型**: SVO
- **注目ポイント**: 「contributes to ~」で「～に寄与する、～を発生させる」。コスト計算に含まれるかを問う定番パターン。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| contribute to | 動詞句 | ～に寄与する | MVs contribute to storage and serverless costs. |
| serverless | 形容詞 | サーバーレスの | Background maintenance uses serverless compute. |
| replication | 名詞 | レプリケーション（複製） | Replication costs are separate from MV costs. |

## 2-3. 問題文（日本語）

> マテリアライズドビューは以下のどのコストに寄与しますか？
>
> 該当するものをすべて選んでください。
>
> A. ストレージコスト
> B. サーバーレスコスト
> C. レプリケーションコスト
> D. 仮想ウェアハウスコスト

---

## 3-1. 解説文（英語）

> Each materialized view stores query results, which contributes to the storage use.
>
> Snowflake also performs automatic background maintenance on materialized views to prevent them from getting out-of-date. When a base table is modified, all materialized views created on that table are updated by a background service utilizing Snowflake compute resource (serverless from the customer's point of view).

## 3-2. 解説文の文法解析

### 文1: "Each materialized view stores query results, which contributes to the storage use."

- **主語 (S)**: Each materialized view
- **動詞 (V)**: stores
- **目的語 (O)**: query results
- **修飾語 (M)**: which contributes to the storage use（非制限関係詞節 — 結果を補足）
- **文型**: SVO
- **注目ポイント**: 「which」の非制限関係詞節で、保存する → ストレージ使用に寄与するという因果を示す。

### 文2: "Snowflake also performs automatic background maintenance on materialized views to prevent them from getting out-of-date."

- **主語 (S)**: Snowflake
- **動詞 (V)**: performs
- **目的語 (O)**: automatic background maintenance
- **修飾語 (M)**: on materialized views / to prevent them from getting out-of-date（目的の不定詞句）
- **文型**: SVO
- **注目ポイント**: 「to prevent ~ from getting out-of-date」で「～が古くなるのを防ぐために」。

### 文3: "When a base table is modified, all materialized views created on that table are updated by a background service utilizing Snowflake compute resource (serverless from the customer's point of view)."

- **主語 (S)**: all materialized views created on that table
- **動詞 (V)**: are updated（受動態）
- **修飾語 (M)**: When a base table is modified（条件）/ by a background service utilizing Snowflake compute resource（動作主）/ serverless from the customer's point of view（括弧内の補足）
- **文型**: SV（受動態）
- **注目ポイント**: 「from the customer's point of view」で「顧客の視点からはサーバーレス」と補足。メンテナンスの主体がユーザーのVWではないことを示す。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| out-of-date | 形容詞 | 古くなった、最新でない | Prevent views from getting out-of-date. |
| prevent ~ from | 動詞句 | ～が...するのを防ぐ | Prevent them from getting out-of-date. |
| from the customer's point of view | 前置詞句 | 顧客の視点からは | Serverless from the customer's point of view. |
| utilize | 動詞 | 活用する | A service utilizing Snowflake compute. |

## 3-3. 解説文（日本語）

> 各マテリアライズドビューはクエリ結果を保存するため、ストレージの使用に寄与します。
>
> Snowflakeはまた、マテリアライズドビューが古くならないよう、自動的にバックグラウンドメンテナンスを実行します。ベーステーブルが変更されると、そのテーブル上に作成されたすべてのマテリアライズドビューが、Snowflakeのコンピュートリソースを活用するバックグラウンドサービスによって更新されます（顧客の視点からはサーバーレス）。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
