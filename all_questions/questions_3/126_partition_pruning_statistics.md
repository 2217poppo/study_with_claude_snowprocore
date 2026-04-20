# 126: Partition Pruning — Identifying Statistics in Query Profile

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-17
**正答**: A, D（Partitions scanned / Partitions total）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Partition Pruning（パーティションプルーニング） | WHERE句などの条件に基づき、スキャン不要なマイクロパーティションを除外するSnowflakeの最適化。`Partitions scanned << Partitions total` なら有効 |
| Partitions Scanned（スキャンされたパーティション数） | クエリが実際に読み取ったマイクロパーティションの数。この数がPartitions Totalよりはるかに少なければプルーニングが効いている |
| Partitions Total（パーティション合計数） | テーブルが持つマイクロパーティションの総数。クエリはこのうちPartitions Scannedのみを読む |
| Bytes Scanned（スキャンされたバイト数） | クエリがスキャンしたデータの合計バイト数。プルーニング判定には使用しない（パーティション数とは別の指標） |
| Bytes Written（書き込まれたバイト数） | クエリが書き込んだデータのバイト数（INSERT/UPDATE等）。プルーニングとは無関係 |

## 1-2. 重要コンセプトまとめ

- **パーティションプルーニングを示す統計は2つのペア**
  - **Partitions scanned**（スキャンしたパーティション数）
  - **Partitions total**（パーティション合計数）
  - この2つを比較することでプルーニングの効果を判断する
- **判断基準**
  - `Partitions scanned << Partitions total` → 効果的なプルーニング
  - `Partitions scanned ≈ Partitions total` → 非効果的（テーブル全体スキャン）
- **紛らわしい選択肢の排除**
  - `Bytes Scanned`: バイト量はわかるが、パーティション数との比較ができないのでプルーニング判定不可
  - `Bytes Written`: データ書き込み量（プルーニングと無関係）
  - `Total Bytes`: 曖昧な指標でパーティションプルーニングを直接示さない
- **Q120との関連**
  - Q120: 「Scanned=Total → 非効果的なプルーニング」を判断する問題
  - Q126: 「プルーニングを示す統計情報はどれか」を問う問題

## 1-3. 公式ドキュメントURL

- [Query Profile](https://docs.snowflake.com/en/user-guide/ui-query-profile)
- [Clustering and Micro-partitions](https://docs.snowflake.com/en/user-guide/tables-clustering-micropartitions)

---

## 2-1. 問題文（英語）

> Which of the following statistics indicate if partitioning pruning has occurred? Select two.
>
> A. Partitions scanned
> B. Bytes Written
> C. Bytes Scanned
> D. Partitions total
> E. Total Bytes

## 2-2. 問題文の文法解析

### 文1: "Which of the following statistics indicate if partitioning pruning has occurred?"

- **主語 (S)**: Which of the following statistics（複数形 → indicate）
- **動詞 (V)**: indicate
- **目的語（間接疑問文）**: if partitioning pruning has occurred
- **文型**: SVO（疑問文）
- **注目ポイント**: 
  - `indicate if ~` = 〜かどうかを示す（`indicate whether ~` と同義）
  - `has occurred` = 発生したかどうか（現在完了で「完了した状態」を確認）
  - `partitioning pruning` = パーティションプルーニング（動名詞による形容詞化）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| indicate | 動詞 | 示す、表示する | These statistics indicate if pruning occurred. |
| statistics | 名詞（複数） | 統計情報 | Query profile statistics show pruning effectiveness. |
| occur | 動詞 | 発生する | Partition pruning occurred when scanned << total. |
| partitioning pruning | 名詞句 | パーティションプルーニング | Partitioning pruning reduces the data scanned. |

## 2-3. 問題文（日本語）

> 次のうち、パーティションプルーニングが発生したかどうかを示す統計はどれですか？2つ選んでください。
>
> A. Partitions scanned（スキャンされたパーティション数）
> B. Bytes Written（書き込まれたバイト数）
> C. Bytes Scanned（スキャンされたバイト数）
> D. Partitions total（パーティション合計数）
> E. Total Bytes（合計バイト数）

---

## 3-1. 解説文（英語）

> Partition pruning occurs when the number of Partitions scanned is much smaller than Partitions total.
>
> https://docs.snowflake.com/en/user-guide/ui-query-profile

## 3-2. 解説文の文法解析

### 文1: "Partition pruning occurs when the number of Partitions scanned is much smaller than Partitions total."

- **主語 (S)**: Partition pruning
- **動詞 (V)**: occurs（自動詞）
- **条件節**: when the number of Partitions scanned is much smaller than Partitions total
- **文型**: SV + 条件節
- **注目ポイント**: 
  - `the number of Partitions scanned` = スキャンされたパーティションの数（`the number of + 名詞`）
  - `much smaller than` = 〜よりはるかに小さい（`much` で比較級を強調）
  - ごく短い解説文だが、2つの指標の比較が核心

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| much smaller than | 比較表現 | 〜よりはるかに少ない | Scanned is much smaller than total when pruning works. |
| the number of | 名詞句 | 〜の数 | The number of partitions scanned indicates pruning. |

## 3-3. 解説文（日本語）

> パーティションプルーニングは、スキャンされたパーティション数がパーティション合計よりはるかに少ない場合に発生します。

---

## 復習メモ

- [ ] プルーニングを示す統計はPartitions scannedとPartitions totalのペアであることを覚えた
- [ ] Bytes ScannedやBytes Writtenはプルーニングを直接示さないことを確認した
- [ ] Q120（非効果的プルーニングの判断）とQ126（プルーニングを示す統計の識別）の違いを整理した
