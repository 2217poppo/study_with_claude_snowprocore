# 001: Standard Scaling Policy — Minimize Query Queuing

**SnowPro Core Domain**: Domain 4 — Performance Concepts
**作成日**: 2026-04-17
**正答**: Standard（クエリキューを最小化するのはStandardポリシー）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Scaling Policy（スケーリングポリシー） | Multi-Cluster Virtual Warehouseがクラスターを追加・削除するタイミングを決める設定。**Standard**と**Economy**の2種類がある |
| Standard Scaling Policy | クエリキューが発生し始めたらほぼ即座に新クラスターを追加する積極的なポリシー。**キューを最小化**することを優先する |
| Economy Scaling Policy | クレジット節約を優先するポリシー。キューが発生してもすぐには追加せず、追加基準（additional criteria）を適用して判断する。Standard より応答が遅い |
| Query Queuing（クエリキューイング） | ウェアハウスのリソース不足で余分なクエリが待機行列に入る状態。Multi-Cluster WHのScaling Policyで対処する |
| Multi-Cluster Virtual Warehouse | Enterprise以上で利用できるウェアハウス形式。クラスター数を動的に増減してコンカレンシー（同時実行数）問題を解消する |

## 1-2. 重要コンセプトまとめ

- **Standardポリシー = キューを防ぐ（最小化）優先**
  - キューが検出され次第、ほぼ即座に新クラスターをスピンアップ（spin up）する
  - パフォーマンスとユーザー体験を重視
- **Economyポリシー = クレジット節約優先**
  - キューが観察されても追加基準をチェックしてから判断するため応答が遅い
  - コスト削減優先でパフォーマンスを妥協する
- **試験の引っかけポイント**: Economy（節約）というワードから「コスト効率が良い」と誤解しやすいが、クエリキュー**最小化**はStandard
- **クラスター削減タイミング**:
  - Standard: クラスター縮小は保守的（少なめ）
  - Economy: クラスター縮小は積極的（使われていないクラスターを素早く削除）

## 1-3. 公式ドキュメントURL

- [Setting the Scaling Policy for a Multi-Cluster Warehouse](https://docs.snowflake.com/en/user-guide/warehouses-multicluster#setting-the-scaling-policy-for-a-multi-cluster-warehouse)

---

## 2-1. 問題文（英語）

> Which of the following scaling policies aims to minimize query queuing?
>
> A. Economy
> B. Standard

## 2-2. 問題文の文法解析

### 文1: "Which of the following scaling policies aims to minimize query queuing?"

- **主語 (S)**: Which of the following scaling policies（以下のスケーリングポリシーのうちどれが）
- **動詞 (V)**: aims to minimize（最小化することを目指す）
- **目的語 (O)**: query queuing（クエリキューイング）
- **文型**: SVO（疑問詞 which を使った疑問文）
- **注目ポイント**:
  - `which of the following` = 「以下のうちどれが」 — 選択肢問題の定番フレーズ
  - `aim to + 原形` = 「〜することを目指す、〜を目的とする」
  - `minimize` = 最小化する（maximize の対義語）
  - `queuing` = キューイング（British English: queuing / American: queueing）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| aim to | 動詞句 | 〜することを目指す | Standard aims to minimize query queuing. |
| minimize | 動詞 | 最小化する | The Standard policy minimizes queuing. |
| queuing | 名詞/動名詞 | キューに入ること、待機 | Query queuing occurs when resources are exhausted. |
| scaling policy | 名詞句 | スケーリングポリシー | Set the scaling policy to Standard or Economy. |

## 2-3. 問題文（日本語）

> 以下のスケーリングポリシーのうち、クエリキューイングを最小化することを目的としているのはどれですか？
>
> A. Economy
> B. Standard

---

## 3-1. 解説文（英語）

> With the scaling policy set to Standard, Snowflake prefers to spin up extra virtual warehouses almost as soon as it detects that queries are starting to queue up. The Standard scaling policy aims to prevent or minimize queuing. The Economy scaling policy attempts to conserve credits over performance and user experience. It doesn't spin up more virtual warehouses as soon as queuing is observed but instead applies additional criteria to ascertain whether or not to spin up new virtual warehouses.
>
> https://docs.snowflake.com/en/user-guide/warehouses-multicluster#setting-the-scaling-policy-for-a-multi-cluster-warehouse

## 3-2. 解説文の文法解析

### 文1: "With the scaling policy set to Standard, Snowflake prefers to spin up extra virtual warehouses almost as soon as it detects that queries are starting to queue up."

- **付帯状況の前置詞句**: With the scaling policy set to Standard（スケーリングポリシーがStandardに設定されている状態で）
- **主語 (S)**: Snowflake
- **動詞 (V)**: prefers to spin up（スピンアップすることを好む）
- **目的語 (O)**: extra virtual warehouses（追加の仮想ウェアハウス）
- **時間の副詞節**: almost as soon as it detects that queries are starting to queue up（クエリがキューに入り始めたことを検出したほぼ同時に）
- **注目ポイント**:
  - `with + O + 過去分詞` = 付帯状況（〜の状態で）
  - `spin up` = サーバー・サービスを起動すること（技術用語）
  - `as soon as` = 〜するとすぐに（ほぼ同時性を示す接続詞）
  - `almost as soon as` = ほぼ〜するとすぐに（"almost" で僅かな時差を示す）

### 文2: "The Standard scaling policy aims to prevent or minimize queuing."

- **主語 (S)**: The Standard scaling policy
- **動詞 (V)**: aims to prevent or minimize（防止または最小化することを目指す）
- **目的語 (O)**: queuing
- **文型**: SVO

### 文3: "The Economy scaling policy attempts to conserve credits over performance and user experience."

- **主語 (S)**: The Economy scaling policy
- **動詞 (V)**: attempts to conserve（節約しようとする）
- **目的語 (O)**: credits（クレジット）
- **副詞句**: over performance and user experience（パフォーマンスやユーザー体験よりも優先して）
- **注目ポイント**:
  - `conserve` = 節約する、保護する（save よりフォーマル）
  - `over ~` = 〜よりも（優先度を示す前置詞）= at the expense of ~

### 文4: "It doesn't spin up more virtual warehouses as soon as queuing is observed but instead applies additional criteria to ascertain whether or not to spin up new virtual warehouses."

- **主語 (S)**: It（= The Economy scaling policy）
- **動詞 (V)**: doesn't spin up ... but instead applies（〜せず、代わりに〜を適用する）
- **目的語 (O1)**: more virtual warehouses（追加の仮想ウェアハウス）
- **目的語 (O2)**: additional criteria（追加の基準）
- **不定詞句**: to ascertain whether or not to spin up new virtual warehouses（新しいウェアハウスをスピンアップすべきかどうかを確認するために）
- **注目ポイント**:
  - `but instead` = 「そうではなく、代わりに」（対比を強調）
  - `ascertain` = 確認する、確かめる（verify より客観的な調査を含意）
  - `whether or not` = 〜かどうか（yes/no の選択）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| spin up | 動詞句 | （クラスターを）起動する | Standard spins up warehouses almost immediately. |
| as soon as | 接続詞 | 〜するとすぐに | Snowflake adds clusters as soon as it detects queuing. |
| conserve | 動詞 | 節約する、保存する | Economy conserves credits over performance. |
| ascertain | 動詞 | 確認する、確かめる | Apply additional criteria to ascertain whether to spin up. |
| over (前置詞) | 前置詞 | 〜よりも優先して | Economy prioritizes credits over user experience. |

## 3-3. 解説文（日本語）

> スケーリングポリシーがStandardに設定されている場合、Snowflakeはクエリがキューに入り始めたことを検出したほぼ同時に、追加の仮想ウェアハウスをスピンアップすることを優先します。Standardスケーリングポリシーはキューイングを防止または最小化することを目的としています。Economyスケーリングポリシーはパフォーマンスやユーザー体験よりもクレジットの節約を優先します。キューイングが観察されてもすぐには追加ウェアハウスをスピンアップせず、代わりに追加の基準を適用して新しいウェアハウスをスピンアップするかどうかを判断します。

---

## 復習メモ

- [ ] Standard = キュー最小化（即座にスピンアップ）、Economy = クレジット節約（基準を適用してから判断）を覚えた
- [ ] `spin up`（起動する）と `as soon as`（〜するとすぐに）の使い方を確認した
- [ ] `conserve X over Y` = Yよりも優先してXを節約する、という構文を理解した
