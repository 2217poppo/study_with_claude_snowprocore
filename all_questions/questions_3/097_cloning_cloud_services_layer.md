# 097: Cloning — Cloud Services Layer

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-17
**正答**: B（Cloud Services Layer）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Zero-Copy Cloning | データを物理的にコピーせず、メタデータ操作だけでオブジェクトの複製を作成するSnowflakeの機能 |
| Cloud Services Layer | Snowflakeアーキテクチャの3層のうち最上位。認証、クエリ最適化、メタデータ管理、トランザクション管理などを担う |
| Micro-partition | Snowflakeの不変なストレージ単位。テーブルデータは多数のマイクロパーティションに分けて格納される |
| Metadata | データそのものではなく、データを説明する情報。テーブル構造、統計情報、マイクロパーティションの位置情報など |
| Query Processing Layer | Snowflakeの第2層。Virtual Warehouseで構成され、クエリの実際の計算を担う |
| Storage Layer | Snowflakeの第1層（最下位）。S3などのクラウドストレージにデータを格納する |

## 1-2. 重要コンセプトまとめ

- **クローニングはCloud Services Layerのメタデータ操作で実現される**
  - データの物理コピーは行われず、クローンはソーステーブルと同じマイクロパーティションを参照するポインタを持つ
- **クローン直後のストレージコストはほぼゼロ**
  - 新しいマイクロパーティションは作成されない。変更が発生した時点で初めて新しいマイクロパーティションが作られる（Copy-on-Write）
- **仮のレイヤー名（Sharing Management Layer, Cloning Management Layer）は存在しない**
  - Snowflakeの実際の3層はStorage / Query Processing / Cloud Services の3つのみ

## 1-3. 公式ドキュメントURL

- [Cloning Considerations — Storage Costs](https://docs.snowflake.com/en/user-guide/tables-storage-considerations#label-cloning-tables)
- [Snowflake Architecture Overview](https://docs.snowflake.com/en/user-guide/intro-key-concepts)

---

## 2-1. 問題文（英語）

> Which of the following layer facilitates the cloning of tables?
>
> A. Sharing Management Layer
> B. Cloud Services Layer
> C. Cloning Management Layer
> D. Query Processing Layer

## 2-2. 問題文の文法解析

### 文1: "Which of the following layer facilitates the cloning of tables?"

- **主語 (S)**: Which of the following layer（疑問詞 Which が主語）
- **動詞 (V)**: facilitates
- **目的語 (O)**: the cloning of tables
- **文型**: SVO
- **注目ポイント**: 
  - `facilitate` = 促進する、可能にする（技術文書でよく使われる動詞）
  - `the cloning of tables` = 動名詞句が目的語（`cloning` は動名詞）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| facilitate | 動詞 | 促進する、可能にする | The Cloud Services Layer facilitates query optimization. |
| cloning | 動名詞 | クローニング（複製）| Zero-copy cloning creates an instant copy. |
| layer | 名詞 | 層、レイヤー | The three-layer architecture separates storage from compute. |

## 2-3. 問題文（日本語）

> 次のうち、テーブルのクローニングを実現するレイヤーはどれですか？
>
> A. Sharing Management Layer
> B. Cloud Services Layer
> C. Cloning Management Layer
> D. Query Processing Layer

---

## 3-1. 解説文（英語）

> Cloning is achieved through metadata operation performed in the cloud services layer. Data is not physically copied, nor are new micro-partitions created—instead, the cloned table points to the micro-partitions of the source table. https://docs.snowflake.com/en/user-guide/tables-storage-considerations#label-cloning-tables

## 3-2. 解説文の文法解析

### 文1: "Cloning is achieved through metadata operation performed in the cloud services layer."

- **主語 (S)**: Cloning
- **動詞 (V)**: is achieved（受動態）
- **修飾語 (M)**: through metadata operation（手段）/ performed in the cloud services layer（過去分詞句、metadata operation を修飾）
- **文型**: SV（受動態）
- **注目ポイント**: `be achieved through ~` = 〜を通じて実現される

### 文2: "Data is not physically copied, nor are new micro-partitions created—instead, the cloned table points to the micro-partitions of the source table."

- **節1**: Data is not physically copied（受動態、否定）
- **節2**: nor are new micro-partitions created（nor による倒置：are new micro-partitions created）
- **節3**: the cloned table points to the micro-partitions of the source table
- **注目ポイント**: 
  - `nor + 倒置` = 〜もまた〜でない（強調の否定）
  - `instead` = その代わりに（対比を導く副詞）
  - `point to ~` = 〜を指し示す、参照する

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| achieve | 動詞 | 達成する、実現する | Zero-copy cloning is achieved through metadata. |
| physically | 副詞 | 物理的に | Data is not physically moved to a new location. |
| nor | 接続詞 | 〜もまた〜でない | It doesn't copy data, nor does it create new partitions. |
| point to | 動詞句 | 参照する、指し示す | The clone points to the same micro-partitions. |

## 3-3. 解説文（日本語）

> クローニングは、Cloud Services Layerで実行されるメタデータ操作によって実現されます。データは物理的にコピーされず、新しいマイクロパーティションも作成されません。その代わりに、クローンされたテーブルはソーステーブルのマイクロパーティションを参照します。

---

## 復習メモ

- [ ] クローニングがメタデータ操作であることを理解した
- [ ] Cloud Services Layerの役割を把握した
- [ ] 英語の文法ポイント（nor の倒置、achieved through）を確認した
