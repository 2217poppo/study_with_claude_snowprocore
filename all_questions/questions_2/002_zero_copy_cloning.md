# 002: Zero-Copy Cloning — Physical Data Copy

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-08
**正答**: False

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Zero-Copy Cloning（ゼロコピークローン） | データを物理的にコピーせず、メタデータの参照だけでクローンを作成するSnowflakeの機能。追加ストレージ不要で即時完了。`CREATE TABLE ... CLONE` などで利用可能。 |
| Clone（クローン） | `CREATE TABLE/SCHEMA/DATABASE ... CLONE` で作成したオブジェクトのコピー。元のマイクロパーティションを参照し、変更が生じたときのみ新パーティションが作成される（Copy-on-Write）。 |
| Micro-Partition（マイクロパーティション） | Snowflakeがテーブルデータを分割して保存する不変の固定サイズファイル単位（50〜500MB非圧縮）。クローン時は物理コピーされず、クローン先のメタデータが元のパーティションを参照する。 |
| Metadata（メタデータ） | データの「データについての情報」。クローン操作ではメタデータ（どのマイクロパーティションを参照するか）のみが新たに作成される。Cloud Services Layerで管理される。 |

## 1-2. 重要コンセプトまとめ

- **答えが False の理由**: クローン操作ではデータの物理コピーは行われない。メタデータが既存のマイクロパーティションを参照するだけ
- **Zero-Copy Cloning の3つの特徴**:
  1. **追加ストレージ不要** — クローン直後は新たなストレージを消費しない
  2. **即時完了** — データの物理コピーがないため、テーブルサイズに関係なく高速
  3. **変更後は差分のみ新規パーティション** — クローン後に変更が加わった箇所のみ新しいマイクロパーティションが作成される（Copy-on-Write）
- **試験ポイント**: 「physically copied」「additional storage」「faster than physical copying」というキーワードに反応できること
- **対象オブジェクト**: テーブル・スキーマ・データベースをクローン可能。ロードメタデータはコピーされない（COPY INTOの重複排除履歴はリセット）

## 1-3. 公式ドキュメントURL

- [Cloning Considerations](https://docs.snowflake.com/en/user-guide/tables-storage-considerations#label-cloning-tables)

---

## 2-1. 問題文（英語）

> True or False: The data is physically copied into new micro-partitions during a clone operation.
>
> A. True
>
> B. False

## 2-2. 問題文の文法解析

### 文1: "The data is physically copied into new micro-partitions during a clone operation."

- **主語 (S)**: The data
- **動詞 (V)**: is physically copied（受動態 — be動詞 + 過去分詞）
- **修飾語 (M1)**: into new micro-partitions（前置詞句 — コピー先）
- **修飾語 (M2)**: during a clone operation（前置詞句 — タイミング）
- **文型**: SV（受動態）
- **注目ポイント**:
  - `is copied`（受動態） — 主語がコピーされる側（能動態なら "Snowflake copies the data"）
  - `physically` — 副詞で動詞を修飾。「物理的に」= 実データがストレージにコピーされることを強調
  - `during a clone operation` — 操作が行われる期間を示す前置詞句

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| physically | 副詞 | 物理的に | The data is not physically copied during cloning. |
| clone operation | 名詞句 | クローン操作 | A clone operation completes instantly. |
| micro-partition | 名詞 | マイクロパーティション | Snowflake stores data in micro-partitions. |

## 2-3. 問題文（日本語）

> 正誤問題: クローン操作中、データは新しいマイクロパーティションに物理的にコピーされる。
>
> A. 正しい（True）
>
> B. 誤り（False）

---

## 3-1. 解説文（英語）

> The zero-copy cloning capability of Snowflake enables users to create clones of tables, schemas, and databases without physically copying the data. Cloning does not require additional storage space, and because cloning does not physically replicate data, it is far faster than the physical copying of data. Micro-partitions and metadata enable rapid and efficient zero-copy cloning because the cloned table's metadata references the existing micro-partitions.

## 3-2. 解説文の文法解析

### 文1: "The zero-copy cloning capability of Snowflake enables users to create clones of tables, schemas, and databases without physically copying the data."

- **主語 (S)**: The zero-copy cloning capability of Snowflake
- **動詞 (V)**: enables（SVOC構文）
- **目的語 (O)**: users
- **補語 (C)**: to create clones of tables, schemas, and databases（to不定詞）
- **修飾語 (M)**: without physically copying the data（前置詞句 — 手段の否定）
- **文型**: SVOC
- **注目ポイント**:
  - `enable O to do` — 「Oが〜するのを可能にする」。SVOCの典型例
  - `without physically copying` — 前置詞 `without` + 動名詞で「〜せずに」の手段の否定

### 文2: "Cloning does not require additional storage space, and because cloning does not physically replicate data, it is far faster than the physical copying of data."

- **節1**: Cloning / does not require / additional storage space（SVO）
- **節2**: because cloning does not physically replicate data（原因の副詞節）
- **節3（主節）**: it / is / far faster than the physical copying of data（SVC）
- **注目ポイント**:
  - `far faster than ~` — `far` は比較級を強める副詞（「はるかに速い」）。`much faster` と同義
  - `replicate` = 複製する。`copy` の類義語として技術文書で使われる
  - `the physical copying of data` — 動名詞 `copying` を名詞として使い `the` で定冠詞化

### 文3: "Micro-partitions and metadata enable rapid and efficient zero-copy cloning because the cloned table's metadata references the existing micro-partitions."

- **主語 (S)**: Micro-partitions and metadata
- **動詞 (V)**: enable（SVOC構文）
- **目的語 (O)**: rapid and efficient zero-copy cloning（動名詞句）
- **原因節**: because the cloned table's metadata references the existing micro-partitions
- **注目ポイント**:
  - `the cloned table's metadata` — 所有格（`'s`）で「クローンされたテーブルのメタデータ」
  - `references` — 動詞「参照する」。名詞としても使われるが、ここは三単現の動詞
  - `existing` — 形容詞「既存の」。`existing micro-partitions` = すでにあるマイクロパーティション

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| replicate | 動詞 | 複製する、コピーする | Cloning does not physically replicate data. |
| far faster | 比較級（強調） | はるかに速い | Zero-copy cloning is far faster than a full copy. |
| reference | 動詞 | 参照する | The cloned table's metadata references existing partitions. |
| rapid | 形容詞 | 迅速な、素早い | Zero-copy cloning enables rapid table creation. |
| efficient | 形容詞 | 効率的な | Metadata enables efficient cloning. |
| additional | 形容詞 | 追加の | Cloning does not require additional storage. |

## 3-3. 解説文（日本語）

> Snowflakeのゼロコピークローン機能により、ユーザーはデータを物理的にコピーすることなく、テーブル・スキーマ・データベースのクローンを作成できます。クローン操作では追加のストレージスペースは不要であり、データを物理的に複製しないため、データの物理コピーよりもはるかに高速です。マイクロパーティションとメタデータにより迅速かつ効率的なゼロコピークローニングが実現されます。クローンされたテーブルのメタデータが既存のマイクロパーティションを参照するためです。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
