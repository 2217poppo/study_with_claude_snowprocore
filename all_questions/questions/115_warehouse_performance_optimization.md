# 115: Warehouse Performance Optimization Strategies

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-06
**正答**: Increase the virtual warehouse size. / Reduce queuing.
**ユーザー回答**: "Increase the virtual warehouse size." ✅ を選択、"Reduce queuing." を見落とし。誤って "Suspend the virtual warehouse." と "Configure MAX_CONCURRENCY_LEVEL to a higher number" を選択

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Queuing（クエリキューイング） | ウェアハウスのリソースが不足した際にクエリが待機する状態。**クエリキューを削減（Reduce Queuing）**することはパフォーマンス改善の第一ステップ |
| Memory Spillage（メモリスピレージ） | クエリ実行に必要なメモリがウェアハウスのメモリを超えると、ディスク（ローカルSSD）に一時的に書き出す現象。パフォーマンス低下の原因。解決策: ウェアハウスサイズを大きくする |
| Query Acceleration Service（クエリ加速サービス） | 特定の重いクエリを自動的に加速するSnowflakeのサービス。クエリの一部のクラスをオフロードして並列実行する |
| MAX_CONCURRENCY_LEVEL | ウェアハウスの最大同時クエリ数を制御するパラメータ。**高くするとパフォーマンスが上がるのではなく、むしろ制限（下げる）することで各クエリのリソース配分を改善できる** |
| Warehouse Cache（ウェアハウスキャッシュ） | ウェアハウスのローカルSSDに保存されるデータキャッシュ。最適化することでパフォーマンス向上が期待できる |

## 1-2. 重要コンセプトまとめ

- **正解2つ**: Reduce queuing（クエリキューの削減）/ Increase the virtual warehouse size（サイズ拡大）
- **ユーザーの誤り**:
  - 「Suspend the virtual warehouse」→ 一時停止はパフォーマンス向上に逆効果
  - 「Configure MAX_CONCURRENCY_LEVEL to a **higher** number」→ 同時クエリ数を**増やす**のではなく**制限（減らす）**ことで各クエリのリソースが増えパフォーマンスが改善する
- **仮想ウェアハウスのパフォーマンス最適化6戦略**（公式ドキュメントより）:

| # | 戦略 | 説明 |
|---|------|------|
| 1 | **Reduce queuing** ✅ | クエリキューを削減する（Multi-Cluster WHなど） |
| 2 | Resolve memory spillage | メモリスピレージを解消する（WHサイズ拡大など） |
| 3 | **Increase warehouse size** ✅ | ウェアハウスサイズを大きくする |
| 4 | Try query acceleration | Query Acceleration Serviceを試す |
| 5 | Optimize the warehouse cache | ウェアハウスキャッシュを最適化する |
| 6 | **Limit** concurrently running queries | 同時実行クエリ数を**制限する**（MAX_CONCURRENCY_LEVEL を下げる） |

- **MAX_CONCURRENCY_LEVELの罠**: 「高い数値に設定する（to a higher number）」は誤り。パフォーマンス最適化では同時実行クエリ数を**制限**して各クエリへのリソース割り当てを増やす

## 1-3. 公式ドキュメントURL

- [Improve Virtual Warehouse Performance](https://docs.snowflake.com/en/user-guide/performance-query-warehouse)

---

## 2-1. 問題文（英語）

> Which of the following strategies should be used to optimize the performance of a virtual warehouse?
>
> Select two answers.
>
> A. Configure memory spilling parameters to True.
> B. Increase the local disk cache size.
> C. Suspend the virtual warehouse.
> D. Configure MAX_CONCURRENCY_LEVEL to a higher number.
> E. Increase the virtual warehouse size. ✅
> F. Reduce queuing. ✅

## 2-2. 問題文の文法解析

### 文1: "Which of the following strategies should be used to optimize the performance of a virtual warehouse?"

- **主語 (S)**: Which of the following strategies
- **動詞 (V)**: should be used（受動態）
- **目的（to不定詞）**: to optimize the performance of a virtual warehouse
- **文型**: SV（受動態）
- **注目ポイント**:
  - **"should be used to optimize"**: 「〜を最適化するために使うべき」。`should be used to do`（〜するために使われるべき）で推奨される用途を問う。`optimize`（最適化する）は動詞で「最良の状態にする」
  - **"the performance of a virtual warehouse"**: 「仮想ウェアハウスのパフォーマンス」。`performance of ~`（〜のパフォーマンス）で対象を明示

### 選択肢D: "Configure MAX_CONCURRENCY_LEVEL to a higher number."

- **動詞 (V)**: Configure（命令形）
- **目的語 (O)**: MAX_CONCURRENCY_LEVEL
- **修飾語 (M)**: to a higher number
- **注目ポイント**:
  - **"Configure ~ to a higher number"**: 「〜をより高い数値に設定する」。これが**誤り**。正しい戦略は「higher → lower（制限する）」。`to a higher number` vs `to a lower number` の方向性に注目

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| optimize | 動詞 | 最適化する | These strategies optimize the performance of a warehouse. |
| queuing | 名詞 | キューイング・待機 | Reduce queuing to improve warehouse performance. |
| spillage | 名詞 | スピレージ・あふれ出し | Memory spillage occurs when queries exceed available memory. |

## 2-3. 問題文（日本語）

> 仮想ウェアハウスのパフォーマンスを最適化するために使うべき戦略はどれか？
>
> 2つ選べ。
>
> A. メモリスピリングパラメータをTrueに設定する。
> B. ローカルディスクキャッシュサイズを増やす。
> C. 仮想ウェアハウスを一時停止する。
> D. MAX_CONCURRENCY_LEVELをより高い数値に設定する。
> E. 仮想ウェアハウスのサイズを大きくする。✅
> F. クエリキューを削減する。✅

---

## 3-1. 解説文（英語）

> The following strategies may be applied to improve the performance of a virtual warehouse.
>
> 1. Reduce queuing
> 2. Resolve memory spillage.
> 3. Increase warehouse size.
> 4. Try query acceleration.
> 5. Optimize the warehouse cache.
> 6. Limit concurrently running queries.

## 3-2. 解説文の文法解析

### 文1: "The following strategies may be applied to improve the performance of a virtual warehouse."

- **主語 (S)**: The following strategies
- **動詞 (V)**: may be applied（受動態）
- **目的（to不定詞）**: to improve the performance of a virtual warehouse
- **文型**: SV（受動態）
- **注目ポイント**:
  - **"may be applied to improve ~"**: 「〜を改善するために適用されうる」。`may be applied`（適用されうる）で「すべてが必要ではなく、状況に応じて適用する」という柔軟性を示す。`should be used` より穏やかな推奨

### 戦略の語彙解説

| 戦略 | 英語のポイント |
|------|-------------|
| **Reduce queuing** | `reduce`（削減する）+ 動名詞 `queuing`。クエリ待機を減らす |
| **Resolve memory spillage** | `resolve`（解決する）+ `memory spillage`（メモリスピレージ）。原因を取り除く |
| **Try query acceleration** | `try`（試す）+ `query acceleration`（クエリ加速）。選択肢として試してみる |
| **Optimize the warehouse cache** | `optimize`（最適化する）+ `warehouse cache` |
| **Limit concurrently running queries** | `Limit`（制限する）≠ 増やす。同時実行クエリを**制限**することがポイント |

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| may be applied | 受動態 | 適用されうる・使えうる | These strategies may be applied to improve performance. |
| Limit concurrently running queries | 動詞句 | 同時実行クエリを制限する | Limit concurrently running queries to allocate more resources per query. |
| resolve | 動詞 | 解決する・取り除く | Resolve memory spillage by increasing the warehouse size. |

## 3-3. 解説文（日本語）

> 仮想ウェアハウスのパフォーマンスを改善するために以下の戦略を適用することができます。
>
> 1. クエリキューを削減する
> 2. メモリスピレージを解消する
> 3. ウェアハウスサイズを大きくする
> 4. クエリ加速を試す
> 5. ウェアハウスキャッシュを最適化する
> 6. 同時実行クエリ数を制限する

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
