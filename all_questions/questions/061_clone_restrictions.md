# 061: Cloning — Objects That Cannot Be Cloned

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-03
**正答**: A（Named Internal Stage はクローン不可）

> 関連問題: 029（Clone and Load Metadata）・030（Clone Independence）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Named Internal Stage（名前付き内部ステージ） | `CREATE STAGE` で作成するSnowflake管理のステージ。**クローン不可**。DB/スキーマをクローンしてもこのステージはコピーされない |
| Named External Stage（名前付き外部ステージ） | S3・Azure Blob・GCS等への参照を定義したステージ。**クローン可能**。内部ステージとは異なる |
| Table Stage（テーブルステージ） | テーブルに自動的に紐づく内部ステージ（`@%table_name`）。テーブルをクローンすると**自動的にクローンされる** |
| Snowpipe（スノーパイプ） | DB/スキーマをクローンするとき、Named Internal Stageを参照するSnowpipeは**クローンされない** |
| External Table（外部テーブル） | クラウドストレージ上のファイルを参照する外部テーブル。**クローン不可**（データを持たないため） |
| Clone（クローン） | `CREATE ... CLONE` で作るゼロコピーの複製。データポインタとメタデータをコピーする。すべてのオブジェクトがクローン可能なわけではない |

## 1-2. 重要コンセプトまとめ

- **クローン不可のオブジェクト**（試験最頻出）:
  - **Named Internal Stage** ← この問題の正解
  - **External Table**（外部テーブル）
  - Snowpipe（Named Internal Stageを参照するもの）

- **クローン可能なオブジェクト**:
  - Database・Schema・Table・View・Stream・Task・Sequence など
  - Named **External** Stage（外部ステージはOK）
  - Table Stage（テーブルと一緒に自動クローン）

- **紛らわしいポイントの整理**:

  | ステージの種類 | クローン可否 |
  |--------------|------------|
  | Named Internal Stage | **不可** |
  | Named External Stage | **可** |
  | Table Stage | テーブルと自動クローン |
  | User Stage | 対象外（ユーザーに紐づく） |

- **DB/スキーマをクローンしたときの挙動**:
  - DB内のテーブル・ビュー → クローンされる
  - Named Internal Stageを参照するSnowpipe → **クローンされない**（Internal Stageが存在しないため）

- **試験の引っかけ**: `External Stage` はクローンできる。`Internal Stage` との混同に注意

## 1-3. 公式ドキュメントURL

- [Cloning Considerations — Cloning and Stages](https://docs.snowflake.com/en/user-guide/object-clone#cloning-and-stages)

---

## 2-1. 問題文（英語）

> Which one of the following objects can NOT be cloned?
>
> A. Named Internal Stage
> B. External Stage
> C. Schemas
> D. Databases

## 2-2. 問題文の文法解析

### 文1: "Which one of the following objects can NOT be cloned?"

- **疑問詞**: Which one of the following objects（以下のオブジェクトのうちどれが）
- **助動詞**: can NOT（〜できない）← 大文字 `NOT` で否定を強調
- **動詞 (V)**: be cloned（クローンされる）← 受動態
- **注目ポイント**: `can NOT be cloned` = 「クローンできない」。否定の受動態。`Which one` = 「1つだけ選べ」（複数選択ではない）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| can NOT be cloned | 否定受動態 | クローンできない | Named Internal Stages cannot be cloned. |
| which one | 疑問詞 | どれ1つ（単数） | Which one cannot be cloned? |
| object | 名詞 | オブジェクト（DBの構成要素） | Snowflake objects include tables, stages, and views. |

## 2-3. 問題文（日本語）

> 以下のオブジェクトのうち、クローンできないものはどれですか？
>
> A. 名前付き内部ステージ（Named Internal Stage）
> B. 外部ステージ（External Stage）
> C. スキーマ
> D. データベース

---

## 3-1. 解説文（英語）

> Named Internal Stages cannot be cloned. When a database or schema is cloned, any Snowpipe that points to a Named Internal Stage is not cloned. Named External Stages can be cloned. Since a table stage is associated with a table, it is automatically cloned when the table is cloned. Additionally, external tables cannot be cloned either. Databases, Schema, Tables, etc., can be cloned.

## 3-2. 解説文の文法解析

### 文1: "Named Internal Stages cannot be cloned."

- **主語 (S)**: Named Internal Stages
- **動詞 (V)**: cannot be cloned（クローンできない）← 受動態否定
- **注目ポイント**: シンプルかつ断言的な文。試験の正答根拠として覚える

### 文2: "When a database or schema is cloned, any Snowpipe that points to a Named Internal Stage is not cloned."

- **時間節**: When a database or schema is cloned（DB/スキーマがクローンされると）
- **主語 (S)**: any Snowpipe that points to a Named Internal Stage（Named Internal Stageを参照するすべてのSnowpipeは）← `that` = 関係代名詞
- **動詞 (V)**: is not cloned（クローンされない）
- **注目ポイント**: `points to ~` = 「〜を指す・〜を参照する」。Snowpipeの参照先を示す動詞

### 文3: "Since a table stage is associated with a table, it is automatically cloned when the table is cloned."

- **理由節**: Since a table stage is associated with a table（テーブルステージはテーブルに紐づいているため）← `be associated with ~` = 「〜と関連付けられている」
- **主語 (S)**: it（テーブルステージは）
- **動詞 (V)**: is automatically cloned（自動的にクローンされる）
- **時間節**: when the table is cloned（テーブルがクローンされると）
- **注目ポイント**: `be associated with ~` = 「〜に関連付けられている・〜と紐づいている」。オブジェクト間の依存関係を示す定番表現

### 文4: "Additionally, external tables cannot be cloned either."

- **接続副詞**: Additionally（さらに）← 追加情報を導く
- **主語 (S)**: external tables
- **動詞 (V)**: cannot be cloned（クローンできない）
- **注目ポイント**: `either` = 否定文の末尾に置いて「〜もまた（できない）」を示す。`Named Internal Stage も、External Table も`クローン不可と並べる効果

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| point to ~ | 動詞句 | 〜を参照する・〜を指す | A Snowpipe that points to a Named Internal Stage. |
| be associated with ~ | 受動態熟語 | 〜に関連付けられている・〜と紐づいている | A table stage is associated with its table. |
| additionally | 接続副詞 | さらに・加えて | Additionally, external tables cannot be cloned. |
| ~ either（否定文末） | 副詞 | 〜もまた（できない） | External tables cannot be cloned either. |
| automatically | 副詞 | 自動的に | Table stages are automatically cloned with the table. |

## 3-3. 解説文（日本語）

> Named Internal Stageはクローンできません。DBまたはスキーマがクローンされると、Named Internal Stageを参照するSnowpipeはクローンされません。Named External Stageはクローンできます。テーブルステージはテーブルに紐づいているため、テーブルがクローンされると自動的にクローンされます。さらに、外部テーブルもクローンできません。データベース・スキーマ・テーブル等はクローン可能です。

---

## 復習メモ

- [ ] Named Internal Stageがクローン不可であることを覚えた
- [ ] Named External Stageはクローン可能（Internal との混同に注意）
- [ ] External Tableもクローン不可であることも合わせて覚えた
- [ ] `point to ~`・`be associated with ~`・`~ either` の英語パターンを確認した
- [ ] この問題は理論問題のためサンドボックス検証は不要
