# 037: Scaling Down Warehouse

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-13
**正答**: A, B, C

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Scale Down（スケールダウン） | ウェアハウスサイズを小さくすること（例: Large → Medium）。ノードが削減される。クエリ複雑度が低下した際にコスト削減のために行う |
| Scale Up（スケールアップ） | ウェアハウスサイズを大きくすること。重いクエリの高速化に対応。スケールダウンの逆 |
| De-provision（デプロビジョニング） | ノード（コンピュートリソース）を削除・解放すること。スケールダウン時にノードが取り除かれる |
| Virtual Warehouse（仮想ウェアハウス） | Snowflakeのコンピュートリソースの単位。X-SmallからX-Largeまでのサイズがあり、サイズごとにノード数が異なる |
| Node（ノード） | 仮想ウェアハウスを構成するコンピュートリソースの単位。サイズが大きいほどノード数が多い |
| Query Complexity（クエリ複雑度） | クエリの処理負荷の大きさ。スキャンデータ量・JOIN数・集計処理の複雑さなどで決まる |

## 1-2. 重要コンセプトまとめ

- **スケールダウン = ウェアハウスサイズを小さくすること**（リサイズの一種）
- スケールダウンの動機: **クエリ複雑度の低下** → 大きなWHは無駄 → コスト削減
- スケールダウン時の動作: **ノードが取り除かれる（de-provisioned）**
- 重要: ノードは**実行中のクエリが完了してから**削除される（即座には削除されない）
- **スケールアップ vs スケールダウン vs スケールアウト** の違いを整理:
  - Scale Up: サイズを大きく → 複雑なクエリに対応
  - Scale Down: サイズを小さく → コスト削減
  - Scale Out: クラスター数を増やす → 同時実行数に対応（Multi-Cluster WH）
- 「increasing the size」はスケールアップであり、スケールダウンではない

## 1-3. 公式ドキュメントURL

- [Warehouse Considerations: Scaling Up vs. Scaling Out](https://docs.snowflake.com/en/user-guide/warehouses-considerations#scaling-up-vs-scaling-out)

---

## 2-1. 問題文（英語）

> What is meant by scaling down a virtual warehouse in Snowflake? Select all that apply.
>
> A. Nodes are de-provisioned when a virtual warehouse is scaled down.
> B. Typically a virtual warehouse is scaled down as a response to decreased query complexity.
> C. Scaling down means resizing the virtual warehouse to a smaller size.
> D. Scaling down means increasing the size of a virtual warehouse to accommodate more complex workloads.

## 2-2. 問題文の文法解析

### 文1: "What is meant by scaling down a virtual warehouse in Snowflake?"

- **主語 (S)**: What
- **動詞 (V)**: is meant（受動態）
- **修飾語 (M)**: by scaling down a virtual warehouse in Snowflake（動作主を示すby句）
- **文型**: SV（受動態疑問文）
- **注目ポイント**: `What is meant by ~?` は「～とはどういう意味か？」を問う定番パターン。`mean` の受動態。

### 文2 (選択肢A): "Nodes are de-provisioned when a virtual warehouse is scaled down."

- **主語 (S)**: Nodes
- **動詞 (V)**: are de-provisioned（受動態）
- **修飾語 (M)**: when a virtual warehouse is scaled down（時間条件節）
- **文型**: SV（受動態）
- **注目ポイント**: `when + 受動態` の条件節が主節（も受動態）を修飾。技術文書で動作タイミングを説明する典型パターン。

### 文3 (選択肢B): "Typically a virtual warehouse is scaled down as a response to decreased query complexity."

- **主語 (S)**: a virtual warehouse
- **動詞 (V)**: is scaled down（受動態）
- **修飾語 (M)**: Typically（副詞）、as a response to decreased query complexity（理由・動機）
- **文型**: SV（受動態）
- **注目ポイント**: `as a response to ~` は「～への対応として」。`decreased` は過去分詞が形容詞的に `query complexity` を修飾。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| scale down | phrasal verb | スケールダウンする、縮小する | Scale down the warehouse to save costs. |
| de-provision | verb | （リソースを）解放する、取り除く | Nodes are de-provisioned during scale down. |
| as a response to ~ | phrase | ～への対応として | Done as a response to decreased complexity. |
| accommodate | verb | 対応する、収容する | Scale up to accommodate complex workloads. |
| decreased | adjective | 減少した | Decreased query complexity triggers scale down. |

## 2-3. 問題文（日本語）

> Snowflakeで仮想ウェアハウスをスケールダウンするとはどういう意味ですか？該当するものをすべて選んでください。
>
> A. 仮想ウェアハウスをスケールダウンすると、ノードがデプロビジョニング（解放）される。
> B. 通常、仮想ウェアハウスのスケールダウンは、クエリの複雑度が低下したことへの対応として行われる。
> C. スケールダウンとは、仮想ウェアハウスをより小さいサイズにリサイズすることを意味する。
> D. スケールダウンとは、より複雑なワークロードに対応するためにウェアハウスのサイズを大きくすることを意味する。

---

## 3-1. 解説文（英語）

> Scaling down a virtual warehouse is typically done in reaction to reduced query complexity, where a smaller virtual warehouse can still perform queries efficiently and on time. Keeping a larger virtual warehouse when a smaller virtual warehouse can perform queries efficiently and fast wastes resources and costs money. In such cases, scaling down the virtual warehouse is an option. Nodes are removed from a virtual warehouse when scaling down. Nodes are removed only when they are no longer executing a query. https://docs.snowflake.com/en/user-guide/warehouses-considerations#scaling-up-vs-scaling-out

## 3-2. 解説文の文法解析

### 文1: "Scaling down a virtual warehouse is typically done in reaction to reduced query complexity, where a smaller virtual warehouse can still perform queries efficiently and on time."

- **主語 (S)**: Scaling down a virtual warehouse（動名詞句）
- **動詞 (V)**: is done（受動態）
- **修飾語 (M)**: typically（副詞）、in reaction to reduced query complexity（理由）、where以下（非制限的関係詞節）
- **文型**: SV（受動態）
- **注目ポイント**: 動名詞句が主語。`in reaction to ~` は「～に対する反応として」。`where` は非制限的関係詞で状況を補足説明。

### 文2: "Keeping a larger virtual warehouse when a smaller virtual warehouse can perform queries efficiently and fast wastes resources and costs money."

- **主語 (S)**: Keeping a larger virtual warehouse when a smaller virtual warehouse can perform queries efficiently and fast（動名詞句 + when節の長い主語）
- **動詞 (V)**: wastes ... and costs
- **目的語 (O)**: resources / money
- **文型**: SVO
- **注目ポイント**: 動名詞句 `Keeping ~` が非常に長い主語を形成。`wastes` と `costs` が並列動詞。「小さいWHで十分なのに大きいWHを維持すると無駄」という論理。

### 文3: "Nodes are removed from a virtual warehouse when scaling down."

- **主語 (S)**: Nodes
- **動詞 (V)**: are removed（受動態）
- **修飾語 (M)**: from a virtual warehouse（場所）、when scaling down（条件）
- **文型**: SV（受動態）

### 文4: "Nodes are removed only when they are no longer executing a query."

- **主語 (S)**: Nodes
- **動詞 (V)**: are removed（受動態）
- **修飾語 (M)**: only when they are no longer executing a query（条件を限定）
- **文型**: SV（受動態）
- **注目ポイント**: `only when ~` で「～のときのみ」。`no longer executing` は「もう実行していない」。実行中のクエリが完了するまでノードは削除されないという重要な仕様。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| in reaction to ~ | phrase | ～に対する反応として | Done in reaction to reduced complexity. |
| reduced | adjective | 減少した、低下した | Reduced query complexity triggers scale down. |
| efficiently | adverb | 効率的に | A smaller warehouse can still perform efficiently. |
| waste | verb | 浪費する | Keeping a large warehouse wastes resources. |
| no longer | adverb | もはや～ない | Nodes are removed when no longer executing. |

## 3-3. 解説文（日本語）

> 仮想ウェアハウスのスケールダウンは、通常、クエリの複雑度が低下したことへの対応として行われます。より小さな仮想ウェアハウスでもクエリを効率的かつ時間内に実行できる場合です。小さな仮想ウェアハウスで効率的に高速にクエリを実行できるのに、大きな仮想ウェアハウスを維持し続けるとリソースが無駄になり、コストがかかります。そのような場合、仮想ウェアハウスのスケールダウンが選択肢となります。スケールダウン時にはノードがウェアハウスから削除されます。ノードは、クエリの実行が完了してから（もう実行していない状態になってから）削除されます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
