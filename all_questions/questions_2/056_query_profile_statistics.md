# 056: Query Profile Statistics

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-13
**正答**: A, B, D

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Query Profile（クエリプロファイル） | クエリの実行詳細を視覚化する機能。Operator Tree・Operator Details・Statisticsの3ペイン構成 |
| Partition Pruning（パーティションプルーニング） | WHERE条件で不要なパーティションをスキャンから除外する最適化。Partitions Scanned << Partitions Totalで効果大 |
| Partitions Scanned / Partitions Total | Query Profileの統計値。Scannedが大幅に少ない = プルーニング効果大 |
| Data Spilling（データスピリング） | 処理がメモリに収まらずディスクやリモートストレージに書き出される現象。クエリが遅くなる原因 |
| Bytes Spilled to Local Storage | ローカルSSDに書き出されたデータ量。WHサイズが小さいことを示唆 |
| Bytes Spilled to Remote Storage | リモートクラウドストレージに書き出されたデータ量。さらに深刻なメモリ不足 |
| Warehouse Cache（ウェアハウスキャッシュ） | ウェアハウスのローカルSSDに保存されるキャッシュ。Percentage Scanned from Cacheで使用率を確認 |

## 1-2. 重要コンセプトまとめ

- Query Profileの統計から読み取れる情報:
  1. **Partition Pruning の効果**: Partitions Scanned << Partitions Total → 効果的
  2. **WHサイズの適切さ**: Bytes Spilled > 0 → WHが小さすぎる兆候
  3. **キャッシュの利用**: Percentage Scanned from Cache > 0 → WHキャッシュが使用された
- Data Spillingの2段階:
  - **Local Storage Spill**: メモリ不足でローカルSSDへ → やや遅い
  - **Remote Storage Spill**: SSDでも不足でリモートへ → 非常に遅い
- WHが小さすぎるサイン:
  - Bytes Spilled to Local Storage が大きい
  - Bytes Spilled to Remote Storage が存在する
- **disk access is slower than memory access** — スピリングが性能低下を引き起こす根本原因

## 1-3. 公式ドキュメントURL

- [Query Profile](https://docs.snowflake.com/en/user-guide/ui-query-profile)

---

## 2-1. 問題文（英語）

> Consider the following snippet from the query profile of a finished query. Which of the following accurately describes the highlighted statistics?
>
> A. The query profile indicates that the virtual warehouse used is too small for the query.
> B. The query profile indicates effective partition pruning.
> C. The query profile indicates ineffective partition pruning.
> D. The query profile indicates that the virtual warehouse cache was used.

## 2-2. 問題文の文法解析

### 文1: "Consider the following snippet from the query profile of a finished query."

- **主語 (S)**: （命令文のため省略 = you）
- **動詞 (V)**: Consider
- **目的語 (O)**: the following snippet from the query profile of a finished query
- **文型**: VO（命令文）
- **注目ポイント**: `snippet` は「抜粋、断片」。`finished query` は「完了したクエリ」。

### 文2: "Which of the following accurately describes the highlighted statistics?"

- **主語 (S)**: Which of the following
- **動詞 (V)**: describes
- **目的語 (O)**: the highlighted statistics
- **修飾語 (M)**: accurately（副詞）
- **文型**: SVO（疑問文）
- **注目ポイント**: `accurately describes` は「正確に説明している」。`highlighted` は「ハイライトされた」。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| snippet | noun | 抜粋、断片 | A snippet from the query profile. |
| indicate | verb | 示す | The profile indicates effective pruning. |
| highlighted | adjective | ハイライトされた | The highlighted statistics. |
| accurately | adverb | 正確に | Accurately describes the statistics. |

## 2-3. 問題文（日本語）

> 完了したクエリのクエリプロファイルから以下の抜粋を考慮してください。ハイライトされた統計を正確に説明しているのは以下のどれですか？
>
> A. クエリプロファイルは、使用した仮想ウェアハウスがクエリに対して小さすぎることを示している。
> B. クエリプロファイルは効果的なパーティションプルーニングを示している。
> C. クエリプロファイルは非効果的なパーティションプルーニングを示している。
> D. クエリプロファイルは仮想ウェアハウスキャッシュが使用されたことを示している。

---

## 3-1. 解説文（英語）

> Partition pruning occurs when the number of Partitions scanned is much smaller than Partitions total. Snowflake saves data on the warehouse's local disk and sometimes remote cloud storage if it can't fit an operation into memory. Data spilling slows down queries because it requires more IO operations, and disk access is slower than memory access.

## 3-2. 解説文の文法解析

### 文1: "Partition pruning occurs when the number of Partitions scanned is much smaller than Partitions total."

- **主語 (S)**: Partition pruning
- **動詞 (V)**: occurs
- **修飾語 (M)**: when the number of Partitions scanned is much smaller than Partitions total（条件節）
- **文型**: SV
- **注目ポイント**: `much smaller than ~` で「～よりはるかに小さい」。プルーニングの判断基準を明確に定義。

### 文2: "Snowflake saves data on the warehouse's local disk and sometimes remote cloud storage if it can't fit an operation into memory."

- **主語 (S)**: Snowflake
- **動詞 (V)**: saves
- **目的語 (O)**: data
- **修飾語 (M)**: on the warehouse's local disk and sometimes remote cloud storage（場所）、if it can't fit an operation into memory（条件）
- **文型**: SVO
- **注目ポイント**: `can't fit ~ into memory` は「メモリに収められない」。`sometimes` でリモートは更に深刻な場合のみ発生することを示唆。

### 文3: "Data spilling slows down queries because it requires more IO operations, and disk access is slower than memory access."

- **主語 (S)**: Data spilling
- **動詞 (V)**: slows down
- **目的語 (O)**: queries
- **修飾語 (M)**: because it requires more IO operations, and disk access is slower than memory access（理由）
- **文型**: SVO
- **注目ポイント**: 2つの理由（IO増加 + ディスクが遅い）を `because` 以下で並列提示。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| much smaller than ~ | phrase | ～よりはるかに小さい | Scanned is much smaller than total. |
| fit ~ into memory | phrase | メモリに収める | Can't fit the operation into memory. |
| spilling | noun | スピリング（あふれ出し） | Data spilling slows down queries. |
| IO operations | noun | 入出力操作 | More IO operations are required. |

## 3-3. 解説文（日本語）

> パーティションプルーニングは、スキャンされたパーティション数がパーティション総数よりはるかに小さいときに発生しています。Snowflakeは操作がメモリに収まらない場合、ウェアハウスのローカルディスクに、場合によってはリモートクラウドストレージにデータを保存します。データスピリングはクエリを遅くします。なぜならより多くのIO操作が必要であり、ディスクアクセスはメモリアクセスより遅いためです。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
