# 087: Multi-Cluster Scaling Policies

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-16
**正答**: A, B

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Multi-Cluster Warehouse（マルチクラスタWH） | 複数のクラスタ（ウェアハウスのコピー）を自動的にスケーリングするウェアハウス。同時実行クエリの処理能力を向上させる |
| Auto-Scale Mode（オートスケールモード） | 最小・最大クラスタ数の範囲内で、需要に応じて自動的にクラスタを増減するモード |
| Maximized Mode（最大化モード） | 常に最大クラスタ数で稼働するモード。スケーリングポリシーは適用されない |
| Standard Policy（スタンダードポリシー） | キューイングを検知するとすぐにクラスタを追加する積極的なポリシー。パフォーマンス優先 |
| Economy Policy（エコノミーポリシー） | クレジット節約を優先するポリシー。キューイング発生後も追加基準を満たすまでクラスタを増やさない |

## 1-2. 重要コンセプトまとめ

- マルチクラスタWHのスケーリングポリシーは**2種類のみ**:
  1. **Standard**: パフォーマンス優先 — キュー検知で即座にクラスタ追加
  2. **Economy**: コスト優先 — 追加基準を慎重に判断してからクラスタ追加
- 「Fast」「Efficient」は**存在しない**（ダミー選択肢）
- スケーリングポリシーは**Auto-Scaleモードでのみ有効**
- Maximizedモードでは全クラスタが常時稼働するため、ポリシーの意味がない
- Standard vs Economy の対比は試験頻出

## 1-3. 公式ドキュメントURL

- [Setting the Scaling Policy for a Multi-Cluster Warehouse](https://docs.snowflake.com/en/user-guide/warehouses-multicluster#setting-the-scaling-policy-for-a-multi-cluster-warehouse)

---

## 2-1. 問題文（英語）

> A multi-clustered virtual warehouse is configured in Auto Scaling mode. Which of the following Scaling Policies does it support? Select two options.
>
> A. Standard
> B. Economy
> C. Fast
> D. Efficient

## 2-2. 問題文の文法解析

### 文1: "A multi-clustered virtual warehouse is configured in Auto Scaling mode."

- **主語 (S)**: A multi-clustered virtual warehouse
- **動詞 (V)**: is configured（受動態）
- **修飾語 (M)**: in Auto Scaling mode
- **文型**: SV（受動態）

### 文2: "Which of the following Scaling Policies does it support?"

- **主語 (S)**: it（= multi-clustered virtual warehouse）
- **動詞 (V)**: does support
- **目的語 (O)**: Which of the following Scaling Policies
- **文型**: SVO

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| scaling policy | 名詞句 | スケーリングポリシー | Standard and Economy are the two scaling policies. |
| spin up | 句動詞 | 起動する | Spin up extra virtual warehouses. |
| queue up | 句動詞 | キューに入る | Queries are starting to queue up. |
| conserve | 動詞 | 節約する | Economy policy conserves credits. |

## 2-3. 問題文（日本語）

> マルチクラスタ仮想ウェアハウスがオートスケーリングモードで構成されています。以下のうちどのスケーリングポリシーをサポートしていますか？2つ選んでください。
>
> A. Standard
> B. Economy
> C. Fast
> D. Efficient

---

## 3-1. 解説文（英語）

> With the scaling policy set to Standard, Snowflake prefers to spin up extra virtual warehouses almost as soon as it detects that queries are starting to queue up. The Standard scaling policy aims to prevent or minimize queuing. The Economy scaling policy attempts to conserve credits over performance and user experience. It doesn't spin up more virtual warehouses as soon as queuing is observed but instead applies additional criteria to ascertain whether or not to spin up new virtual warehouses. The scaling policies are applied only when a virtual warehouse is running in the auto-scale mode because all clusters are automatically started anyway in a maximized manner, and a scaling policy does not have much use.

## 3-2. 解説文の文法解析

### 文1: "With the scaling policy set to Standard, Snowflake prefers to spin up extra virtual warehouses almost as soon as it detects that queries are starting to queue up."

- **主語 (S)**: Snowflake
- **動詞 (V)**: prefers to spin up
- **目的語 (O)**: extra virtual warehouses
- **修飾語 (M)**: With the scaling policy set to Standard（付帯状況）/ almost as soon as it detects ...（時間の副詞節）
- **文型**: SVO
- **注目ポイント**: 「as soon as ~」で「～するとすぐに」。Standardポリシーの即応性を示す。

### 文2: "The Economy scaling policy attempts to conserve credits over performance and user experience."

- **主語 (S)**: The Economy scaling policy
- **動詞 (V)**: attempts to conserve
- **目的語 (O)**: credits
- **修飾語 (M)**: over performance and user experience
- **文型**: SVO
- **注目ポイント**: 「conserve A over B」で「BよりAを優先して節約する」。prioritize A over B と類似パターン。

### 文3: "It doesn't spin up more virtual warehouses as soon as queuing is observed but instead applies additional criteria to ascertain whether or not to spin up new virtual warehouses."

- **主語 (S)**: It（= Economy policy）
- **動詞 (V)**: doesn't spin up ... but instead applies
- **目的語 (O)**: more virtual warehouses / additional criteria
- **文型**: SVO（否定 + 代替動作）
- **注目ポイント**: 「doesn't ~ but instead ~」で「～せず代わりに～する」。Economyの慎重さを示す。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| as soon as | 接続詞 | ～するとすぐに | Spins up as soon as queuing is detected. |
| conserve ~ over ~ | 動詞句 | ～を～より優先して節約する | Conserve credits over performance. |
| ascertain | 動詞 | 確認する、確かめる | Ascertain whether to spin up new warehouses. |
| additional criteria | 名詞句 | 追加の基準 | Applies additional criteria before scaling. |

## 3-3. 解説文（日本語）

> Standardスケーリングポリシーでは、Snowflakeはクエリがキューに入り始めたことを検知するとほぼ即座にウェアハウスを追加します。Standardポリシーはキューイングの防止または最小化を目指します。Economyスケーリングポリシーはパフォーマンスやユーザーエクスペリエンスよりもクレジットの節約を優先します。キューイングが観測されてもすぐにウェアハウスを追加せず、代わりに新しいウェアハウスを起動すべきかどうかを判断するための追加基準を適用します。スケーリングポリシーはオートスケールモードで動作している場合にのみ適用されます。Maximizedモードではすべてのクラスタが常に自動的に起動されるため、スケーリングポリシーはあまり意味を持ちません。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
