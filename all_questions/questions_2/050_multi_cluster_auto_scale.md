# 050: Multi-Cluster Auto Scale

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-13
**正答**: Auto Scale

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Auto-Scale Mode（オートスケールモード） | Multi-Cluster WHのスケーリングモード。最小クラスター数と最大クラスター数に**異なる値**を設定すると有効化。ワークロードに応じて動的にクラスターを起動・停止 |
| Maximized Mode（マキシマイズドモード） | Multi-Cluster WHのもう一つのモード。最小=最大クラスター数を同じ値に設定。起動時に常に最大数のクラスターが稼働する（動的な増減なし） |
| Multi-Cluster Virtual Warehouse | 複数クラスターで構成されるウェアハウス。Enterprise以上で利用可能。同時実行数の増加に対応するスケールアウト機能 |
| Minimum Cluster Count（最小クラスター数） | Auto-Scale起動時のクラスター数の下限。需要が下がると最小数まで減少する |
| Maximum Cluster Count（最大クラスター数） | クラスター数の上限。需要が上がっても最大数を超えない |
| Spin Up / Shut Down | クラスターの起動（spin up）と停止（shut down）。Auto-Scaleモードで動的に行われる |

## 1-2. 重要コンセプトまとめ

- Multi-Cluster WHの2つのスケーリングモード:
  - **Auto-Scale**: 最小 ≠ 最大 → **動的にクラスター数を調整**
  - **Maximized**: 最小 = 最大 → 常に最大数のクラスターが稼働
- Auto-Scale の動作フロー:
  1. 起動時 → **最小クラスター数** でスタート
  2. 需要増加 → 最大数まで追加クラスターをspin up
  3. 需要減少 → 最小数までクラスターをshut down
- Auto-Scaleが「dynamically start or stop」を行うモード
- Maximizedは動的増減なし — 常に全クラスター稼働
- 試験のひっかけ: 「Scale on Demand」「Scale Fast」はSnowflakeの公式用語ではない

## 1-3. 公式ドキュメントURL

- [Maximized vs. Auto-scale](https://docs.snowflake.com/en/user-guide/warehouses-multicluster#maximized-vs-auto-scale)

---

## 2-1. 問題文（英語）

> A multi-cluster virtual warehouse will dynamically start or stop virtual warehouses in which scaling mode?
>
> A. Maximized
> B. Scale on Demand
> C. Scale Fast
> D. Auto Scale

## 2-2. 問題文の文法解析

### 文1: "A multi-cluster virtual warehouse will dynamically start or stop virtual warehouses in which scaling mode?"

- **主語 (S)**: A multi-cluster virtual warehouse
- **動詞 (V)**: will start or stop（並列動詞）
- **目的語 (O)**: virtual warehouses
- **修飾語 (M)**: dynamically（副詞）、in which scaling mode（疑問副詞句）
- **文型**: SVO（疑問文）
- **注目ポイント**: `dynamically start or stop` が Auto-Scale の核心動作。`in which ~ mode` で「どのモードで」を問う。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| dynamically | adverb | 動的に | Warehouses are started dynamically. |
| scaling mode | noun | スケーリングモード | Auto Scale or Maximized mode. |
| spin up | phrasal verb | 起動する | Snowflake spins up more warehouses. |
| shut down | phrasal verb | 停止する | Warehouses are shut down as demand lowers. |

## 2-3. 問題文（日本語）

> マルチクラスター仮想ウェアハウスが仮想ウェアハウスを動的に起動・停止するのは、どのスケーリングモードですか？
>
> A. Maximized
> B. Scale on Demand
> C. Scale Fast
> D. Auto Scale

---

## 3-1. 解説文（英語）

> Auto-Scaling mode is enabled by selecting different values for the multi-minimum clusters and maximum warehouse count. As a result, Snowflake starts and stops warehouses dynamically based on the workload needs. When a multi-cluster virtual warehouse using auto-scaling mode starts, the number of active virtual warehouses equals the minimum warehouse count. Snowflake spins up more warehouses according to the need, up to the maximum warehouse count. Snowflake shuts down virtual warehouses as the demand lowers until the number equals the minimum warehouse count.

## 3-2. 解説文の文法解析

### 文1: "Auto-Scaling mode is enabled by selecting different values for the multi-minimum clusters and maximum warehouse count."

- **主語 (S)**: Auto-Scaling mode
- **動詞 (V)**: is enabled（受動態）
- **修飾語 (M)**: by selecting different values for ~（手段のby句）
- **文型**: SV（受動態）
- **注目ポイント**: `is enabled by ~ing` で「～することで有効化される」。`different values` が最小≠最大を意味する。

### 文2: "When a multi-cluster virtual warehouse using auto-scaling mode starts, the number of active virtual warehouses equals the minimum warehouse count."

- **主語 (S)**: the number of active virtual warehouses
- **動詞 (V)**: equals
- **目的語 (O)**: the minimum warehouse count
- **修飾語 (M)**: When ~ starts（条件節）
- **文型**: SVO
- **注目ポイント**: 起動時は最小数から始まるという初期動作を説明。

### 文3: "Snowflake spins up more warehouses according to the need, up to the maximum warehouse count."

- **主語 (S)**: Snowflake
- **動詞 (V)**: spins up
- **目的語 (O)**: more warehouses
- **修飾語 (M)**: according to the need（需要に応じて）、up to the maximum warehouse count（上限）
- **文型**: SVO
- **注目ポイント**: `according to ~` は「～に応じて」。`up to ~` は「最大～まで」。

### 文4: "Snowflake shuts down virtual warehouses as the demand lowers until the number equals the minimum warehouse count."

- **主語 (S)**: Snowflake
- **動詞 (V)**: shuts down
- **目的語 (O)**: virtual warehouses
- **修飾語 (M)**: as the demand lowers（需要が下がるにつれて）、until the number equals the minimum warehouse count（最小数まで）
- **文型**: SVO
- **注目ポイント**: `as ~ lowers` は「～が下がるにつれて」（時間的推移）。`until ~` は「～するまで」（終了条件）。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| enable | verb | 有効化する | Auto-Scale is enabled by selecting different values. |
| equal | verb | 等しい | Active warehouses equal the minimum count. |
| according to ~ | phrase | ～に応じて | Spins up according to the need. |
| as ~ lowers | phrase | ～が下がるにつれて | As the demand lowers, warehouses shut down. |

## 3-3. 解説文（日本語）

> Auto-Scalingモードは、最小クラスター数と最大ウェアハウス数に異なる値を選択することで有効化されます。その結果、Snowflakeはワークロードの需要に基づいてウェアハウスを動的に起動・停止します。Auto-Scalingモードを使用するマルチクラスター仮想ウェアハウスが起動すると、アクティブな仮想ウェアハウスの数は最小ウェアハウス数と等しくなります。Snowflakeは需要に応じて最大ウェアハウス数までウェアハウスを追加起動します。需要が下がるにつれて、アクティブ数が最小ウェアハウス数と等しくなるまでウェアハウスを停止します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
