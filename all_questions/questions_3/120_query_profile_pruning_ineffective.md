# 120: Query Profile — Ineffective Partition Pruning

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-17
**正答**: B（クエリプロファイルはパーティションプルーニングが非効果的であることを示している）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Query Profile（クエリプロファイル） | Snowflakeのクエリ実行詳細を可視化する機能。Snowsight（WebUI）から確認でき、ノードごとの処理時間・データ量・統計情報を表示する |
| Partitions Scanned（スキャンしたパーティション数） | クエリが実際にスキャンしたマイクロパーティションの数。Partitions Totalよりはるかに少なければ効果的なプルーニング |
| Partitions Total（パーティション合計数） | テーブルが持つマイクロパーティションの総数 |
| Partition Pruning（パーティションプルーニング） | WHERE句などの条件で不要なマイクロパーティションをスキャンしないようにするSnowflakeの最適化。Partitions Scanned << Partitions Total なら効果的 |
| Ineffective Pruning（非効果的なプルーニング） | Partitions Scanned ≈ Partitions Total の状態。テーブル全体をスキャンしており、クラスタリングキーの見直しが必要 |
| Clustering Key（クラスタリングキー） | パーティションプルーニングを可能にするための列定義。効果的なプルーニングには適切なクラスタリングキーが必要 |

## 1-2. 重要コンセプトまとめ

- **Partitions Scanned と Partitions Total の解釈**
  - `Partitions Scanned << Partitions Total` → **効果的なプルーニング**（Scannedが極めて少ない）
  - `Partitions Scanned ≈ Partitions Total` → **非効果的なプルーニング**（テーブル全体スキャン）
  - `Partitions Scanned = Partitions Total` → **プルーニングなし**（全マイクロパーティションをスキャン）
- **クエリプロファイルで確認できる情報**
  - パーティションプルーニングの効果（Partitions Scanned vs Total）
  - スピル（ローカル/リモートへのスピル量）
  - 実行時間の内訳（ノードごと）
  - キャッシュ使用状況
- **非効果的なプルーニング時の対策**
  - クラスタリングキーを見直す・設定する
  - WHERE句の条件をクラスタリングキーに合わせる
- **他の選択肢の排除**
  - 「メタデータキャッシュが使用された」→ キャッシュ使用時はパーティションスキャン自体が0になる
  - 「ウェアハウスサイズが小さすぎる」→ パーティション統計からはわからない（スピル情報を参照）

## 1-3. 公式ドキュメントURL

- [Query Profile](https://docs.snowflake.com/en/user-guide/ui-query-profile)
- [Clustering and Micro-partitions](https://docs.snowflake.com/en/user-guide/tables-clustering-micropartitions)

---

## 2-1. 問題文（英語）

> Consider the following snippet from the query profile of a finished query.
>
> [Image: Partitions scanned = 1,024 / 1,024 total (Partitions scanned equals Partitions total)]
>
> Which of the following accurately describes the highlighted statistics?
>
> A. The query profile indicates extremely effective partition pruning.
> B. The query profile indicates ineffective partition pruning.
> C. The query profile indicates that the virtual warehouse used is too small for the query.
> D. The query profile indicates that the metadata cache was used.

## 2-2. 問題文の文法解析

### 文1: "Consider the following snippet from the query profile of a finished query."

- **命令文**: Consider（検討せよ・参照せよ）
- **目的語 (O)**: the following snippet
- **修飾語**: from the query profile of a finished query
- **文型**: VO（命令文）
- **注目ポイント**: 
  - `snippet` = 断片・切り抜き（画像や一部のデータを示す際に使う）
  - `of a finished query` = 完了したクエリの（finishedが「実行完了した」を示す）

### 文2: "Which of the following accurately describes the highlighted statistics?"

- **主語 (S)**: Which of the following
- **動詞 (V)**: accurately describes
- **目的語 (O)**: the highlighted statistics
- **文型**: SVO（疑問文）
- **注目ポイント**: 
  - `highlighted` = 強調表示された、ハイライトされた
  - `statistics` = 統計情報（複数形）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| snippet | 名詞 | 断片、切り抜き | Consider the following snippet from the query profile. |
| highlight | 動詞/形容詞 | 強調する/ハイライトされた | The highlighted statistics show partition counts. |
| indicate | 動詞 | 示す、指示する | The statistics indicate ineffective partition pruning. |
| ineffective | 形容詞 | 非効果的な | Partitions scanned = total means ineffective pruning. |
| accurate | 形容詞 | 正確な | Which description accurately describes the statistics? |

## 2-3. 問題文（日本語）

> 完了したクエリのクエリプロファイルから取得した以下のスニペットを参考にしてください。
>
> [画像: スキャンしたパーティション数 = 合計パーティション数（例: 1,024 / 1,024）]
>
> 次のうち、ハイライトされた統計情報を正確に説明しているものはどれですか？
>
> A. クエリプロファイルは極めて効果的なパーティションプルーニングを示している。
> B. クエリプロファイルは非効果的なパーティションプルーニングを示している。
> C. クエリプロファイルは、使用された仮想ウェアハウスがクエリに対して小さすぎることを示している。
> D. クエリプロファイルはメタデータキャッシュが使用されたことを示している。

---

## 3-1. 解説文（英語）

> Partition pruning occurs when the number of Partitions scanned is much smaller than Partitions total. If the partitions scanned equal the partition total, the query scanned the complete table. Therefore, no partition pruning happened, and the clustering key should be improved.
>
> https://docs.snowflake.com/en/user-guide/ui-query-profile

## 3-2. 解説文の文法解析

### 文1: "Partition pruning occurs when the number of Partitions scanned is much smaller than Partitions total."

- **主語 (S)**: Partition pruning
- **動詞 (V)**: occurs
- **条件節**: when the number of Partitions scanned is much smaller than Partitions total
- **文型**: SV + 条件節
- **注目ポイント**: 
  - `occurs when ~` = 〜のときに発生する（条件の明示）
  - `much smaller than` = 〜よりはるかに少ない（`much` が比較級を強調）

### 文2: "If the partitions scanned equal the partition total, the query scanned the complete table."

- **条件節**: If the partitions scanned equal the partition total（同等の場合）
- **主節主語 (S)**: the query
- **主節動詞 (V)**: scanned
- **目的語 (O)**: the complete table
- **文型**: SVO（仮定の帰結）
- **注目ポイント**: 
  - `equal the partition total` = パーティション合計に等しい（動詞として使われるequalに注意）
  - `the complete table` = テーブル全体（complete = 完全な、テーブル全体）

### 文3: "Therefore, no partition pruning happened, and the clustering key should be improved."

- **接続副詞**: Therefore（したがって）
- **主節1**: no partition pruning happened（否定の主語 + 動詞）
- **接続詞**: and
- **主節2**: the clustering key should be improved（受動態 + 推奨の助動詞）
- **文型**: SV + SV（並列）
- **注目ポイント**: 
  - `no ~ happened` = 〜は発生しなかった（no + 名詞で完全否定）
  - `should be improved` = 改善されるべき（受動態で推奨・提言）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| occur | 動詞 | 発生する | Partition pruning occurs when scanned << total. |
| complete table | 名詞句 | テーブル全体 | Scanning the complete table is inefficient. |
| equal | 動詞 | 等しい（動詞） | If scanned equals total, no pruning happened. |
| therefore | 接続副詞 | したがって | Therefore, the clustering key should be improved. |

## 3-3. 解説文（日本語）

> パーティションプルーニングは、スキャンしたパーティション数がパーティション合計よりはるかに少ない場合に発生します。スキャンしたパーティション数がパーティション合計と等しい場合、クエリはテーブル全体をスキャンしたことになります。したがって、パーティションプルーニングは発生しておらず、クラスタリングキーを改善すべきです。

---

## 復習メモ

- [ ] Partitions Scanned = Partitions Total → プルーニングなし（非効果的）を覚えた
- [ ] Partitions Scanned << Partitions Total → 効果的なプルーニングの条件を把握した
- [ ] `much smaller than`（はるかに少ない）と `equal`（動詞：等しい）の用法を確認した
