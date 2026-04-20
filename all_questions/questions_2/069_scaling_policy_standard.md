# 069: Scaling Policy Standard

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-13
**正答**: Standard

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Scaling Policy（スケーリングポリシー） | Multi-Cluster WHでクラスターの追加・削除タイミングを制御するポリシー。StandardとEconomyの2種類 |
| Standard Scaling Policy | **パフォーマンス優先**。クエリがキューに入り始めるとほぼ即座に追加クラスターを起動。キューイングの防止・最小化が目的 |
| Economy Scaling Policy | **コスト優先**。キューが発生しても即座には追加せず、追加基準を満たすか検証してから起動。クレジット節約が目的 |
| Query Queuing（クエリキューイング） | WHのリソース不足でクエリが待ち行列に入る状態。スケーリングポリシーがこの対処方法を決める |
| Multi-Cluster Virtual Warehouse | 複数クラスターで構成されるWH。スケーリングポリシーを設定可能 |

## 1-2. 重要コンセプトまとめ

- 2つのスケーリングポリシーの対比:

| 特性 | Standard | Economy |
|------|----------|---------|
| 優先 | **パフォーマンス** | **コスト** |
| 追加タイミング | キュー検出後**即座** | 追加基準を**検証してから** |
| 目的 | キューイングの防止・最小化 | クレジットの節約 |

- **Standard = パフォーマンス優先**（コストより速度）
- **Economy = コスト優先**（速度よりコスト）
- 「Fast」「Efficient」はSnowflakeのスケーリングポリシーではない（ダミー選択肢）
- StandardはAuto-Scaleモードと組み合わせて使用
- 覚え方: Standard = Standard（標準）= パフォーマンスが標準（デフォルト）的な考え方

## 1-3. 公式ドキュメントURL

- [Setting the Scaling Policy for a Multi-cluster Warehouse](https://docs.snowflake.com/en/user-guide/warehouses-multicluster#setting-the-scaling-policy-for-a-multi-cluster-warehouse)

---

## 2-1. 問題文（英語）

> Which of the following Scaling Policies prioritizes performance over cost?
>
> A. Economy
> B. Fast
> C. Standard
> D. Efficient

## 2-2. 問題文の文法解析

### 文1: "Which of the following Scaling Policies prioritizes performance over cost?"

- **主語 (S)**: Which of the following Scaling Policies
- **動詞 (V)**: prioritizes
- **目的語 (O)**: performance
- **修飾語 (M)**: over cost（比較対象）
- **文型**: SVO
- **注目ポイント**: `prioritize A over B` は「BよりAを優先する」。`over` が比較の基準を示す。試験で頻出の比較パターン。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| prioritize A over B | phrase | BよりAを優先する | Standard prioritizes performance over cost. |
| scaling policy | noun | スケーリングポリシー | Set the scaling policy to Standard. |
| queue up | phrasal verb | キューに入る | Queries are starting to queue up. |
| ascertain | verb | 確認する、確かめる | Ascertain whether to spin up new warehouses. |

## 2-3. 問題文（日本語）

> 以下のスケーリングポリシーのうち、コストよりパフォーマンスを優先するのはどれですか？
>
> A. Economy
> B. Fast
> C. Standard
> D. Efficient

---

## 3-1. 解説文（英語）

> With the scaling policy set to Standard, Snowflake prefers to spin up extra virtual warehouses almost as soon as it detects that queries are starting to queue up. The Standard scaling policy aims to prevent or minimize queuing. The Economy scaling policy attempts to conserve credits over performance and user experience. It doesn't spin up more virtual warehouses as soon as queuing is observed but instead applies additional criteria to ascertain whether or not to spin up new virtual warehouses.

## 3-2. 解説文の文法解析

### 文1: "With the scaling policy set to Standard, Snowflake prefers to spin up extra virtual warehouses almost as soon as it detects that queries are starting to queue up."

- **主語 (S)**: Snowflake
- **動詞 (V)**: prefers to spin up
- **目的語 (O)**: extra virtual warehouses
- **修飾語 (M)**: With the scaling policy set to Standard（付帯状況）、almost as soon as it detects that ~（タイミング）
- **文型**: SVO
- **注目ポイント**: `With + O + 過去分詞` の付帯状況構文。`almost as soon as ~` で「～するとほぼ即座に」。`prefers to ~` で「～することを好む」。

### 文2: "The Standard scaling policy aims to prevent or minimize queuing."

- **主語 (S)**: The Standard scaling policy
- **動詞 (V)**: aims to prevent or minimize
- **目的語 (O)**: queuing
- **文型**: SVO
- **注目ポイント**: `aims to ~` は「～することを目指す」。Standardの目的を端的に表す。

### 文3: "The Economy scaling policy attempts to conserve credits over performance and user experience."

- **主語 (S)**: The Economy scaling policy
- **動詞 (V)**: attempts to conserve
- **目的語 (O)**: credits
- **修飾語 (M)**: over performance and user experience（比較対象）
- **文型**: SVO
- **注目ポイント**: `conserve ~ over ~` で「～より～を節約する」。`attempts to ~` は `aims to ~` と類似。

### 文4: "It doesn't spin up more virtual warehouses as soon as queuing is observed but instead applies additional criteria to ascertain whether or not to spin up new virtual warehouses."

- **主語 (S)**: It（= Economy policy）
- **動詞 (V)**: doesn't spin up / applies（並列）
- **目的語 (O)**: more virtual warehouses / additional criteria
- **修飾語 (M)**: as soon as queuing is observed（条件）、but instead（逆接）、to ascertain whether or not to ~（目的）
- **文型**: SVO + SVO
- **注目ポイント**: `but instead` で対比。`whether or not to ~` は「～するかどうか」。Economyは「即座に追加」ではなく「追加基準を検証」するという動作の違い。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| prefer to ~ | phrase | ～することを好む | Prefers to spin up extra warehouses. |
| aim to ~ | phrase | ～することを目指す | Aims to prevent queuing. |
| conserve | verb | 節約する | Conserve credits over performance. |
| ascertain | verb | 確認する | Ascertain whether to spin up. |
| but instead | phrase | しかし代わりに | Doesn't spin up but instead applies criteria. |

## 3-3. 解説文（日本語）

> スケーリングポリシーがStandardに設定されている場合、Snowflakeはクエリがキューに入り始めたことを検出するとほぼ即座に追加の仮想ウェアハウスを起動することを好みます。Standardスケーリングポリシーはキューイングを防止または最小化することを目指します。Economyスケーリングポリシーはパフォーマンスやユーザー体験よりもクレジットの節約を試みます。キューイングが観察されても即座に追加のウェアハウスを起動せず、代わりに新しいウェアハウスを起動すべきかどうかを確認するための追加基準を適用します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
