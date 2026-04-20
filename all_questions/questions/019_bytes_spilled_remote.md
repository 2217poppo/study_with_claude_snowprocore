# 019: Bytes Spilled to Remote Storage

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-01
**正答**: C（1つ・正解）
- A. "Bytes spilled to remote storage" shows that a file from an on-premise system is being loaded.（誤り・未選択）
- B. "Bytes spilled to remote storage" indicates network issues.（誤り・未選択）
- C. "Bytes Spilled to remote storage" indicates that the volume of data could not fit in either the memory or the temporary storage of the virtual warehouse and had to be spilled to temporary cloud storage.（**選択済み・正解**）
- D. "Bytes spilled to remote storage" indicates the amount of data uploaded using the PUT command.（誤り・未選択）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Query Profile（クエリプロファイル） | Snowflakeでクエリの実行詳細を視覚的に確認できる機能。各オペレーターのCPU時間・IO・スピル量などのメトリクスが表示される |
| Bytes Spilled to Local Storage（ローカルストレージへのスピル） | クエリ処理がメモリに収まりきらず、ウェアハウスのローカル（一時）ディスクに書き出されたデータ量。メモリより遅い |
| Bytes Spilled to Remote Storage（リモートストレージへのスピル） | ローカルディスクも満杯になり、クラウドのリモートストレージ（S3/Azure Blob/GCS）にまで書き出されたデータ量。ローカルよりさらに遅い |
| Data Spilling（データスピリング） | 処理データがメモリに収まらず、一時的にディスクやリモートストレージへ書き出される現象。クエリのパフォーマンス低下の原因 |
| Virtual Warehouse（仮想ウェアハウス） | Snowflakeのコンピューティングリソース。クエリ処理に使用されるメモリとローカルディスクを持つ |
| Temporary Cloud Storage（一時クラウドストレージ） | スピル先となるリモートのクラウドストレージ。S3（AWS）、Azure Blob（Azure）、GCS（GCP）など。永続ストレージではなく一時的な書き出し先 |

## 1-2. 重要コンセプトまとめ

- **スピルの3段階（重要）**:
  1. **メモリ内で処理**（最速）— ウェアハウスのRAMに収まる場合
  2. **Bytes spilled to local storage**（遅い）— メモリ不足 → ローカルディスクへ書き出し
  3. **Bytes spilled to remote storage**（さらに遅い）— ローカルも満杯 → クラウドストレージへ書き出し

- **なぜ遅くなるのか**: ディスク・リモートアクセスは追加のIOオペレーションが必要で、メモリアクセスより大幅に遅い

- **"remote"の意味**: オンプレのシステムでも、ネットワーク問題でもなく、**リモートクラウドストレージ**（S3等）へのスピル

- **Query Profileで確認できるメトリクス**:
  - `Bytes spilled to local storage` — ローカルスピル量
  - `Bytes spilled to remote storage` — リモートスピル量（より深刻なパフォーマンス問題の兆候）

- **スピル削減の対策**:
  - ウェアハウスをスケールアップ（メモリ増加）
  - クエリを最適化（不要なデータを排除）
  - クラスタリングキーの設定

- **試験ポイント**: 「remote storage」= クラウドの一時ストレージ。ネットワーク問題・オンプレ・PUTコマンドとは無関係

## 1-3. 公式ドキュメントURL

- [Query Profile — Queries Too Large to Fit in Memory](https://docs.snowflake.com/en/user-guide/ui-query-profile#queries-too-large-to-fit-in-memory)

---

## 2-1. 問題文（英語）

> Which of the following best describes "Bytes spilled to remote storage" shown in a query profile?
>
> A. "Bytes spilled to remote storage" shows that a file from an on-premise system is being loaded.
> B. "Bytes spilled to remote storage" indicates network issues.
> C. "Bytes Spilled to remote storage" indicates that the volume of data could not fit in either the memory or the temporary storage of the virtual warehouse and had to be spilled to temporary cloud storage.
> D. "Bytes spilled to remote storage" indicates the amount of data uploaded using the PUT command.

## 2-2. 問題文の文法解析

### 文1: "Which of the following best describes 'Bytes spilled to remote storage' shown in a query profile?"

- **主語 (S)**: Which of the following（「以下のうちどれが」）
- **動詞 (V)**: best describes（副詞 best + 動詞）
- **目的語 (O)**: "Bytes spilled to remote storage" shown in a query profile
- **文型**: SVO
- **注目ポイント**:
  - 「best describes」の best は副詞で「最もよく説明している」。試験頻出の `What best describes ~?` パターン
  - 「shown in a query profile」は過去分詞の後置修飾。「クエリプロファイルに表示された（Bytes spilled to remote storage）」
  - 「spilled to remote storage」も過去分詞句で名詞 Bytes を後置修飾

### 選択肢の文法注目点

- **A**: 「shows that + 節」— that節で内容を説明。「～であることを示す」
- **B**: 「indicates + 名詞句」— 目的語に名詞句。「～を示す」
- **C**: 「indicates that the volume of data could not fit in either the memory or the temporary storage ... and had to be spilled to ~」
  - `either A or B` 構文：「AまたはBのどちらにも」（否定文なので「どちらにも収まらない」）
  - `had to be spilled` — 受動態の過去助動詞。「書き出されなければならなかった」
- **D**: 「indicates the amount of data uploaded using the PUT command」— 過去分詞句 `uploaded using ~` が名詞 data を修飾

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| spill | verb | 溢れ出す、書き出す（技術的スピル） | Data is spilled to local storage when memory is full. |
| query profile | noun phrase | クエリプロファイル（実行詳細画面） | Check the query profile for performance bottlenecks. |
| on-premise | adjective | オンプレミス（自社設備内） | On-premise data must be loaded before querying. |
| indicate | verb | 示す、表す | The metric indicates remote spillage has occurred. |
| PUT command | noun phrase | PUTコマンド（ファイルアップロード） | Use the PUT command to upload files to a stage. |

## 2-3. 問題文（日本語）

> クエリプロファイルに表示される「Bytes spilled to remote storage」を最もよく説明しているものはどれですか？
>
> A. 「Bytes spilled to remote storage」は、オンプレミスシステムからファイルがロードされていることを示す。
> B. 「Bytes spilled to remote storage」は、ネットワークの問題を示す。
> C. 「Bytes spilled to remote storage」は、データ量が仮想ウェアハウスのメモリにも一時ストレージにも収まりきらず、一時クラウドストレージへ書き出されたことを示す。
> D. 「Bytes spilled to remote storage」は、PUTコマンドを使ってアップロードされたデータ量を示す。

---

## 3-1. 解説文（英語）

> Snowflake saves data on the warehouse's local disk if it can't fit an operation into memory. Data spilling slows down queries because it requires more IO operations, and disk access is slower than memory access. "Bytes spilled to local storage." indicates local spillage. Snowflake will spill data to remote cloud storage if the local disk becomes full, which is even slower storage than the local disk, making this operation even slower. "Bytes spilled to remote storage" in the query profile indicates remote spillage.

## 3-2. 解説文の文法解析

### 文1: "Snowflake saves data on the warehouse's local disk if it can't fit an operation into memory."

- **主語 (S)**: Snowflake
- **動詞 (V)**: saves
- **目的語 (O)**: data
- **修飾語 (M)**: on the warehouse's local disk
- **条件節**: if it can't fit an operation into memory
- **文型**: SVO + M + 条件節
- **注目ポイント**:
  - 「fit ~ into memory」は「～をメモリに収める」。`fit A into B`（AをBに収める）の構文
  - 「if it can't fit」の it は形式主語で operation の処理を指す
  - 「warehouse's」の所有格。「ウェアハウスのローカルディスク」

### 文2: "Data spilling slows down queries because it requires more IO operations, and disk access is slower than memory access."

- **主語 (S)**: Data spilling（動名詞句が主語）
- **動詞 (V)**: slows down
- **目的語 (O)**: queries
- **理由節**: because it requires more IO operations
- **並列節**: and disk access is slower than memory access
- **文型**: SVO + because節 + and節
- **注目ポイント**:
  - 「Data spilling」は動名詞が主語。「データのスピリング（という行為）が」
  - 「slows down」は句動詞「〜を遅くする」
  - 「slower than ~」の比較表現。「〜より遅い」

### 文3: "Snowflake will spill data to remote cloud storage if the local disk becomes full, which is even slower storage than the local disk, making this operation even slower."

- **主節**: Snowflake will spill data to remote cloud storage
- **条件節**: if the local disk becomes full
- **関係代名詞節（非制限用法）**: which is even slower storage than the local disk（リモートストレージを先行詞に）
- **分詞構文**: making this operation even slower（結果を示す）
- **文型**: SVO + 条件節 + 関係詞節 + 分詞構文
- **注目ポイント**:
  - 「even slower」の even は比較級を強調する副詞。「さらに遅い」
  - 「which is even slower storage」の which はカンマ後の非制限用法（前節全体を補足）
  - 「making this operation even slower」は付帯状況の分詞構文。「その結果この処理をさらに遅くする」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| fit ~ into memory | phrase | ～をメモリに収める | Snowflake saves to disk if it can't fit data into memory. |
| IO operation | noun phrase | 入出力操作（Input/Output） | Disk access requires more IO operations than memory. |
| slow down | phrasal verb | 遅くする | Data spilling slows down query performance. |
| even + 比較級 | phrase | さらに〜、一層〜（比較級の強調） | Remote storage is even slower than local disk. |
| making ~ | 分詞構文 | その結果〜にする | The spill occurs, making queries much slower. |

## 3-3. 解説文（日本語）

> Snowflakeは、処理をメモリに収められない場合、ウェアハウスのローカルディスクにデータを保存します。データのスピリングは、より多くのIO操作を必要とし、ディスクアクセスはメモリアクセスより遅いため、クエリが遅くなります。「Bytes spilled to local storage」はローカルへのスピルを示します。ローカルディスクが満杯になると、Snowflakeはリモートクラウドストレージへデータをスピルします。これはローカルディスクよりさらに遅いストレージであり、この処理をさらに遅くします。クエリプロファイルの「Bytes spilled to remote storage」はリモートへのスピルを示します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
