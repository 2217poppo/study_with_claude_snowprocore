# 110: Micro-Partition Characteristics

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-06
**正答**: "Micro-partitions are created and added to a table in the order that new data arrives." および "Column values may overlap across micro-partitions."
**ユーザー回答**: 正解1は選択済み、正解2（Column values may overlap）を見落とし。不正解の「Column values can never overlap」を誤選択

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Micro-Partition（マイクロパーティション） | Snowflakeがテーブルデータを分割する固定サイズのファイル単位。**データが到着した順番に作成・追加される**。**一度作成したら変更不可（immutable）** |
| Columnar Storage（列指向ストレージ） | データを行単位ではなく列単位で保存する形式。Snowflakeは各マイクロパーティション内でこの形式を採用。圧縮効率が高く分析クエリに有利（行指向とは逆） |
| Value Overlap（値の重複・オーバーラップ） | 異なるマイクロパーティションが同じ列値の範囲を含むこと。Snowflakeでは**異なるマイクロパーティション間で列値が重複することがある**。これは他のDBの伝統的なパーティションとの違い |
| Physical Partition（物理パーティション） | 実際にストレージに保存されているデータの分割単位。マイクロパーティションが「物理パーティション」。イミュータブルのため新しいデータや変更データは必ず新しい物理パーティションに入る |

## 1-2. 重要コンセプトまとめ

- **正解2つ**:
  1. **「データが到着した順番に作成・追加される」** — マイクロパーティションの作成順序
  2. **「列値は異なるマイクロパーティション間で重複することがある」** — オーバーラップの許可
- **ユーザーの誤り**: 「Column values can **never** overlap」（絶対に重複しない）を選択 → 実際は重複**あり得る**

### マイクロパーティションの主要特性（試験頻出）

| 特性 | 詳細 |
|------|------|
| 作成順序 | データが到着した順番（insertion order） |
| 変更可否 | **Immutable（変更不可）** — Q105参照 |
| ストレージ形式 | **列指向（Columnar）**（行指向ではない） |
| 値の重複 | **異なるパーティション間で重複あり得る**（他DBと異なる） |
| イミュータブルの帰結 | 新データ・変更データは常に新しいパーティションへ → 似た値が同じパーティションに集まらない場合がある |

- **「行指向ストレージ」は誤り**: Snowflakeは列指向（Columnar）ストレージを採用。行指向は従来のRDB（MySQL, PostgreSQLなど）が採用する形式
- **「絶対に重複しない」は誤り**: イミュータブル特性により、データが到着順に別々のパーティションに格納されるため、同じ値が異なるパーティションに存在し得る
- **クラスタリングとの関係**: クラスタリングキーを設定すると、同じ値が近いパーティションに集まるように再整理されオーバーラップが減る → Q077参照

## 1-3. 公式ドキュメントURL

- [Micro-partitions & Data Clustering](https://docs.snowflake.com/en/user-guide/tables-clustering-micropartitions)

---

## 2-1. 問題文（英語）

> Which of the following statements about micro-partitions is correct? Select all that apply.
>
> A. Column values can never overlap between micro-partitions.
> B. Micro-partitions are created and added to a table in the order that new data arrives. ✅
> C. Snowflake uses a row storage format to store columns in each micro-partition.
> D. Column values may overlap across micro-partitions. ✅

## 2-2. 問題文の文法解析

### 選択肢A: "Column values can never overlap between micro-partitions."

- **主語 (S)**: Column values
- **動詞 (V)**: can never overlap（否定の可能性）
- **修飾語 (M)**: between micro-partitions
- **文型**: SV
- **注目ポイント**:
  - **"can never overlap"**: 「絶対に重複することができない」。`never`（絶対に〜しない）は完全否定。これが**誤り**。実際は `may overlap`（重複することがある）が正しい。`never` vs `may` の対比に注目

### 選択肢B: "Micro-partitions are created and added to a table in the order that new data arrives."

- **主語 (S)**: Micro-partitions
- **動詞 (V)**: are created and added（受動態並列）
- **目的語 (O)**: to a table
- **修飾語 (M)**: in the order that new data arrives（順序の関係詞節）
- **文型**: SV（受動態）
- **注目ポイント**:
  - **"in the order that new data arrives"**: 「新しいデータが到着する順番で」。`in the order that ~`（〜する順番で）は作成順序を示す関係詞節。`in the order in which ~` とも言い換えられる
  - **"are created and added"**: 2つの受動態動詞を `and` で並列。「作成されかつ追加される」

### 選択肢D: "Column values may overlap across micro-partitions."

- **主語 (S)**: Column values
- **動詞 (V)**: may overlap
- **修飾語 (M)**: across micro-partitions
- **文型**: SV
- **注目ポイント**:
  - **"may overlap"**: 「重複することがある」。`may`（〜かもしれない・〜することがある）で可能性を示す助動詞。`can never` とは全く逆の意味
  - **"across micro-partitions"**: 「マイクロパーティションをまたいで」。`between micro-partitions`（選択肢Aの `between`）と同義だが、`across`（〜をまたいで）の方が「複数をまたぐ」ニュアンスが強い

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| overlap | 動詞 | 重複する・重なる | Column values may overlap across micro-partitions. |
| in the order that ~ | 関係詞句 | 〜する順番で | Partitions are added in the order that data arrives. |
| across | 前置詞 | 〜をまたいで・〜を横断して | Values can overlap across different partitions. |
| row storage format | 名詞句 | 行指向ストレージ形式 | Snowflake uses columnar, not row storage format. |

## 2-3. 問題文（日本語）

> マイクロパーティションに関する次の記述のうち正しいものはどれか？当てはまるものをすべて選べ。
>
> A. 列値はマイクロパーティション間で絶対に重複しない。
> B. マイクロパーティションは新しいデータが到着した順番でテーブルに作成・追加される。✅
> C. Snowflakeは各マイクロパーティション内の列を行指向ストレージ形式で保存する。
> D. 列値はマイクロパーティションをまたいで重複することがある。✅

---

## 3-1. 解説文（英語）

> Because micro-partitions are immutable and new or changed data must be added to a new micro-partition, similar values may not be in the same physical partition. When micro-partitions are added to a table, they are created in the order that the data came in. When more data is added to a table, another micro-partition or possibly many micro-partitions are created to store the new data. Unlike partitioning in many other databases, in Snowflake, values can overlap between different micro-partitions.

## 3-2. 解説文の文法解析

### 文1: "Because micro-partitions are immutable and new or changed data must be added to a new micro-partition, similar values may not be in the same physical partition."

- **主節の主語 (S)**: similar values
- **主節の動詞 (V)**: may not be
- **主節の補語 (C)**: in the same physical partition
- **理由節**: Because micro-partitions are immutable and new or changed data must be added to a new micro-partition
- **文型**: SVC（理由節付き）
- **注目ポイント**:
  - **"Because ~ are immutable and ~ must be added"**: `because` 節の中で2つの理由（immutable + 新データは新パーティションへ）を `and` で並列
  - **"similar values may not be in the same physical partition"**: 「似た値が同じ物理パーティションにない場合がある」。`may not be`（〜でない場合がある）で確率的な可能性を示す。「絶対にない」ではなく「ない場合もある」

### 文2: "When more data is added to a table, another micro-partition or possibly many micro-partitions are created to store the new data."

- **主語 (S)**: another micro-partition or possibly many micro-partitions
- **動詞 (V)**: are created（受動態）
- **目的（to不定詞）**: to store the new data
- **時間節**: When more data is added to a table
- **文型**: SV（受動態）
- **注目ポイント**:
  - **"another ~ or possibly many ~"**: 「1つまたはおそらく多くの〜」。`another`（もう1つ）+ `or possibly many`（またはおそらく多数の）で「追加データ量に応じて柔軟に拡張される」ことを示す。`possibly`（おそらく）が不確実性を示す

### 文3: "Unlike partitioning in many other databases, in Snowflake, values can overlap between different micro-partitions."

- **主語 (S)**: values
- **動詞 (V)**: can overlap
- **修飾語 (M)**: between different micro-partitions
- **対比**: Unlike partitioning in many other databases（前置詞句）
- **文型**: SV
- **注目ポイント**:
  - **"Unlike ~ in many other databases"**: 「他の多くのDBのパーティションとは異なり」。`unlike`（〜とは異なり）で先行技術との対比を示す。Snowflakeの独自性を強調する定番パターン
  - **"values can overlap between different micro-partitions"**: 「値は異なるマイクロパーティション間で重複できる」。`can overlap`（重複することができる）で可能性を示す

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| possibly | 副詞 | おそらく・場合によっては | Another or possibly many micro-partitions are created. |
| Unlike ~ | 前置詞 | 〜とは異なり | Unlike other databases, Snowflake allows value overlaps. |
| physical partition | 名詞句 | 物理パーティション | Similar values may not be in the same physical partition. |

## 3-3. 解説文（日本語）

> マイクロパーティションはイミュータブルであり、新しいデータや変更されたデータは必ず新しいマイクロパーティションに追加されなければならないため、似た値が同じ物理パーティションに存在しない場合があります。マイクロパーティションがテーブルに追加されるとき、データが到着した順番で作成されます。テーブルにさらにデータが追加されると、新しいデータを保存するために別のマイクロパーティション、あるいは場合によっては多数のマイクロパーティションが作成されます。他の多くのDBのパーティションとは異なり、Snowflakeでは異なるマイクロパーティション間で値が重複することができます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
