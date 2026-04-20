# 018: Query Profile Statistics Box

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-09
**正答**: Partition pruning / Percentage of data read from the local disk cache（2つ選択）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Query Profile（クエリプロファイル） | Snowflakeでクエリの実行詳細を視覚化する機能。**3つのペイン**で構成される: Operator Tree（左）、Operator Details（中央）、Statistics（右） |
| Statistics Box（統計ボックス） | Query Profileの右側ペインに表示される統計情報。IO・Pruning・Spilling・Network・Processing等のカテゴリに分かれ、クエリ実行の数値データを表示する |
| Partition Pruning（パーティションプルーニング） | Statistics内の**Pruning**カテゴリに表示される。Partitions Scanned / Partitions Totalでプルーニング効率を確認できる |
| Local Disk Cache（ローカルディスクキャッシュ） | Statistics内の**IO**カテゴリに表示される。`Percentage scanned from cache` としてキャッシュ利用率を数値で確認できる |
| Operator Tree（オペレーターツリー） | Query Profileの**左側ペイン**に表示される。クエリ実行計画をツリー構造で視覚化。Statisticsボックスの内容**ではない** |
| Most Expensive Nodes（最もコストの高いノード） | Query Profileの**Overview**タブに表示される情報。Statisticsボックスの内容**ではない** |
| Bytes Spilled（スピルされたバイト数） | Statisticsに表示されるスピル統計。ローカルディスクまたはリモートストレージにスピルされたデータ量を表示 |

## 1-2. 重要コンセプトまとめ

- **Query Profileの3つの主要ペイン**を区別する:
  1. **Operator Tree**（左ペイン）— クエリ実行計画のツリー構造
  2. **Operator Details**（中央ペイン）— 選択したオペレーターの詳細
  3. **Statistics**（右ペイン）— 数値統計データ

- **Statisticsボックスに表示されるカテゴリ**:
  - **IO**: Bytes scanned, Percentage scanned from cache, Bytes written
  - **Pruning**: Partitions scanned, Partitions total
  - **Spilling**: Bytes spilled to local storage, Bytes spilled to remote storage
  - **Network**: Bytes sent over the network
  - **Processing**: Percentage of the query execution time, etc.

- **Statisticsに含まれないもの**（ひっかけ選択肢）:
  - Operator Tree → 左ペイン（別のペイン）
  - Most Expensive Nodes → Overviewタブ

- **試験のポイント**: 「Statisticsボックスに何が表示されるか」を問う問題では、**数値データ（IO/Pruning/Spilling等）** が正解。ツリー構造やノード情報は別のペイン

## 1-3. 公式ドキュメントURL

- [Query Profile: Statistics](https://docs.snowflake.com/en/user-guide/ui-query-profile#statistics)
- [Query Profile Overview](https://docs.snowflake.com/en/user-guide/ui-query-profile)

---

## 2-1. 問題文（英語）

> Which information is displayed in the Statistics box in the Query Profile?
>
> Select two answers.
>
> A. Operator tree
> B. Most expensive nodes
> C. Partition pruning
> D. Percentage of data read from the local disk cache

## 2-2. 問題文の文法解析

### 文1: "Which information is displayed in the Statistics box in the Query Profile?"

- **疑問詞+主語 (S)**: Which information（どの情報が）
- **動詞 (V)**: is displayed（表示されるか）— 受動態
- **場所1 (M)**: in the Statistics box（統計ボックスに）
- **場所2 (M)**: in the Query Profile（クエリプロファイルの）
- **文型**: SV（受動態疑問文）+ 二重の前置詞句
- **注目ポイント**:
  - `is displayed in ~` — 「〜に表示される」。UI要素の内容を問う定型パターン
  - `in the Statistics box in the Query Profile` — 2つの `in` が入れ子。「クエリプロファイルの統計ボックスに」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| displayed | 過去分詞 | 表示される | What information is displayed in the Statistics pane? |
| Statistics box | 名詞 | 統計ボックス（右ペイン） | The Statistics box shows IO and pruning metrics. |
| partition pruning | 名詞 | パーティションプルーニング | Partition pruning statistics appear in the right pane. |
| local disk cache | 名詞 | ローカルディスクキャッシュ | Data read from the local disk cache reduces IO. |
| operator tree | 名詞 | オペレーターツリー | The operator tree is shown in the left pane. |
| most expensive nodes | 名詞 | 最もコストの高いノード | Most expensive nodes are listed in the Overview tab. |

## 2-3. 問題文（日本語）

> クエリプロファイルの統計（Statistics）ボックスに表示される情報はどれですか？
>
> 2つ選択してください。
>
> A. オペレーターツリー
> B. 最もコストの高いノード
> C. パーティションプルーニング
> D. ローカルディスクキャッシュから読み取られたデータの割合

---

## 3-1. 解説文（英語）

> Please see the link for details.
>
> https://docs.snowflake.com/en/user-guide/ui-query-profile#statistics

## 3-2. 解説文の文法解析

### 文1: "Please see the link for details."

- **動詞 (V)**: see（参照してください）— 丁寧な命令形（`Please` 付き）
- **目的語 (O)**: the link（リンクを）
- **修飾語 (M)**: for details（詳細については）
- **文型**: VO（命令文）
- **注目ポイント**: `Please see ~ for details` — 「詳細は〜を参照してください」。ドキュメント参照の定型表現

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| see the link | 動詞句 | リンクを参照する | Please see the link for more information. |
| for details | 前置詞句 | 詳細については | Refer to the documentation for details. |

## 3-3. 解説文（日本語）

> 詳細は以下のリンクを参照してください。
>
> https://docs.snowflake.com/en/user-guide/ui-query-profile#statistics
>
> **補足**: Query ProfileのStatisticsボックスには以下のカテゴリの数値統計が表示されます:
> - **IO**: スキャンされたバイト数、キャッシュからの読み取り割合
> - **Pruning**: スキャンされたパーティション数 / 総パーティション数
> - **Spilling**: ローカル/リモートへのスピル量
> - **Network**: ネットワーク転送量
> - **Processing**: 処理時間の内訳
>
> Operator TreeやMost Expensive Nodesは別のペイン/タブに表示されるため、Statisticsボックスの内容ではありません。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
