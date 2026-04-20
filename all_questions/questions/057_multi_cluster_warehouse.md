# 057: Multi-Cluster Virtual Warehouse — Auto-Scaling

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-03
**正答**: D（Multi-cluster virtual warehouse）

> 関連問題: 011（Warehouse Resize Behavior）・036（Query Processing Layer）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Multi-Cluster Virtual Warehouse（マルチクラスター仮想ウェアハウス） | 同時接続ユーザー数や処理需要に応じてクラスター数を自動的に追加・削除できるウェアハウス。**Enterprise Edition以上**で利用可能。スケールアウト（横方向の拡張）を実現する |
| Single-Cluster Virtual Warehouse（シングルクラスターウェアハウス） | 通常の仮想ウェアハウス（1クラスター）。処理能力を上げるにはウェアハウスサイズを大きくする（スケールアップ）しかない |
| Concurrency（コンカレンシー） | 同時に実行されているクエリ・接続数。マルチクラスターWHはコンカレンシー増加に対応するために設計されている |
| Cluster（クラスター） | マルチクラスターWHを構成する処理単位。1クラスター = 指定サイズのウェアハウス1台相当のリソース |
| Scale-Out（スケールアウト） | クラスター数を増やして処理能力を横に拡張する方法。マルチクラスターWHの仕組み |
| Scale-Up（スケールアップ） | ウェアハウスサイズ（X-Small → X-Large等）を大きくして処理能力を縦に拡張する方法 |
| Queued Query（キュー待ちクエリ） | ウェアハウスの処理能力が上限に達したとき、実行を待つ状態になるクエリ。マルチクラスターWHはクラスター追加でこれを解消する |
| X-Large Virtual Warehouse | ウェアハウスサイズの1つ（128ノード相当）。大きなクエリを高速化するが、同時実行数が増えるとキューが発生する可能性がある。自動クラスター追加の機能はない |

## 1-2. 重要コンセプトまとめ

- **Multi-Cluster WHが解決する問題**: 同時接続ユーザーの増加によるクエリキュー
  - 通常WH: 上限に達したらキュー → ユーザーが待たされる
  - マルチクラスターWH: クラスターを自動追加 → キューを解消

- **Auto-Scalingのしくみ**:
  1. 需要増加 → 同時クエリが上限に達する → 新クラスター自動追加
  2. 需要減少 → アイドルクラスターを自動削除

- **スケールアップ vs スケールアウトの違い**（試験頻出）:

  | | スケールアップ | スケールアウト |
  |---|---|---|
  | 方法 | ウェアハウスサイズを変更（リサイズ） | クラスター数を増減 |
  | 対応する課題 | **クエリが遅い**（重い処理） | **同時実行数が多い**（ユーザー増加） |
  | 仕組み | Warehouse Resize | Multi-Cluster WH |

- **試験ポイント**: 「同時接続が増えたとき」「コンカレンシーが問題」→ Multi-Cluster WH（スケールアウト）。「1つのクエリが遅い」→ サイズアップ（スケールアップ）

- **利用可能エディション**: Enterprise以上（Standard版では使用不可）

## 1-3. 公式ドキュメントURL

- [Warehouse Considerations — Multi-Cluster Warehouses](https://docs.snowflake.com/en/user-guide/warehouses-considerations#how-are-credits-charged-for-warehouses)
- [Multi-Cluster Warehouses](https://docs.snowflake.com/en/user-guide/warehouses-multicluster)

---

## 2-1. 問題文（英語）

> What type of virtual warehouse automatically lets you add or remove additional clusters as concurrency and demand change?
>
> A. X-Large virtual warehouse
> B. Non-virtual warehouse
> C. Suspended virtual warehouse
> D. Multi-cluster virtual warehouse

## 2-2. 問題文の文法解析

### 文1: "What type of virtual warehouse automatically lets you add or remove additional clusters as concurrency and demand change?"

- **疑問詞**: What type of virtual warehouse（どのタイプの仮想ウェアハウスが）
- **主語 (S)**: What type of virtual warehouse
- **副詞**: automatically（自動的に）
- **動詞 (V)**: lets（〜させる）← 使役動詞 `let`
- **目的語 (O)**: you（あなたが）
- **原形不定詞**: add or remove additional clusters（クラスターを追加または削除する）
- **時間節**: as concurrency and demand change（コンカレンシーと需要が変化するにつれて）← `as` = 「〜するにつれて」
- **注目ポイント**: `let O + 原形` = 「Oが〜できるようにする」。`as ~ change` = 「〜が変化するにつれて・〜が変わると」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| concurrency | 名詞 | 同時実行数・コンカレンシー | When concurrency increases, multi-cluster WH adds clusters. |
| demand | 名詞 | 需要・処理要求量 | Clusters are removed when demand drops. |
| as ~ change | 接続詞句 | 〜が変化するにつれて | Clusters are added as demand changes. |
| let O + 原形 | 使役構文 | Oが〜できるようにする | The WH lets you add clusters automatically. |

## 2-3. 問題文（日本語）

> コンカレンシーと需要の変化に応じて、クラスターを自動的に追加または削除できる仮想ウェアハウスのタイプはどれですか？
>
> A. X-Large仮想ウェアハウス
> B. 非仮想ウェアハウス
> C. 一時停止中の仮想ウェアハウス
> D. マルチクラスター仮想ウェアハウス

---

## 3-1. 解説文（英語）

> Multi-cluster virtual warehouses are utilized when the number of concurrent users exceeds a single virtual warehouse's capacity. When the concurrent workload for a virtual warehouse reaches the maximum, new queries are queued. Multi-cluster virtual warehouses address this by adding clusters as needed. When the demand drops, the extra clusters are removed.

## 3-2. 解説文の文法解析

### 文1: "Multi-cluster virtual warehouses are utilized when the number of concurrent users exceeds a single virtual warehouse's capacity."

- **主語 (S)**: Multi-cluster virtual warehouses
- **動詞 (V)**: are utilized（利用される）← 受動態
- **時間節**: when the number of concurrent users exceeds a single virtual warehouse's capacity（同時接続ユーザー数が単一ウェアハウスのキャパシティを超えるとき）
- **注目ポイント**: `be utilized` = `be used` よりフォーマルな表現。`the number of ~ exceeds ~` = 「〜の数が〜を超える」

### 文2: "When the concurrent workload for a virtual warehouse reaches the maximum, new queries are queued."

- **時間節**: When the concurrent workload reaches the maximum（同時処理負荷が上限に達すると）
- **主語 (S)**: new queries（新しいクエリが）
- **動詞 (V)**: are queued（キューに入れられる）← 受動態
- **注目ポイント**: `reach the maximum` = 「上限に達する」。`be queued` = 「キューに入れられる・待ち行列に並ぶ」

### 文3: "Multi-cluster virtual warehouses address this by adding clusters as needed."

- **主語 (S)**: Multi-cluster virtual warehouses
- **動詞 (V)**: address（対処する）
- **目的語 (O)**: this（この問題を）← 前文のキュー問題を指す
- **手段**: by adding clusters as needed（必要に応じてクラスターを追加することで）← `by + 動名詞`
- **注目ポイント**: `address` = 「〜に対処する・解決する」。`as needed` = 「必要に応じて」。技術文書で自動調整を説明するときの定番表現

### 文4: "When the demand drops, the extra clusters are removed."

- **時間節**: When the demand drops（需要が落ちると）
- **主語 (S)**: the extra clusters（余分なクラスターが）
- **動詞 (V)**: are removed（削除される）← 受動態
- **注目ポイント**: `drop` = 「減少する・落ちる」。需要減少をシンプルに表す動詞

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| be utilized | 受動態 | 利用される（`be used` のフォーマル版） | Multi-cluster WHs are utilized for high concurrency. |
| exceed | 動詞 | 超える・上回る | When users exceed capacity, new clusters are added. |
| be queued | 受動態 | キューに入れられる・待ち行列に並ぶ | New queries are queued when the WH is at capacity. |
| address | 動詞 | 〜に対処する・解決する | Multi-cluster WHs address the concurrency issue. |
| as needed | 副詞句 | 必要に応じて | Clusters are added as needed. |
| drop | 動詞 | 減少する・落ちる | When demand drops, extra clusters are removed. |

## 3-3. 解説文（日本語）

> マルチクラスター仮想ウェアハウスは、同時接続ユーザー数が単一の仮想ウェアハウスのキャパシティを超えたときに利用されます。仮想ウェアハウスへの同時処理負荷が上限に達すると、新しいクエリはキューに入れられます。マルチクラスター仮想ウェアハウスは、必要に応じてクラスターを追加することでこの問題に対処します。需要が落ちると、余分なクラスターは削除されます。

---

## 復習メモ

- [ ] マルチクラスターWHがコンカレンシー問題（クエリキュー）を解決することを説明できる
- [ ] スケールアップ（サイズ変更）とスケールアウト（クラスター追加）の違いを言える
- [ ] Enterprise以上のエディションでのみ利用可能であることを覚えた
- [ ] `address`・`as needed`・`be queued`・`exceed` の英語を確認した
- [ ] この問題は理論問題のためサンドボックス検証は不要
