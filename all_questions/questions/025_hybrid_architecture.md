# 025: Snowflake Hybrid Architecture

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-02
**正答**: A (No)
- A. No（正解・未選択）
- B. Yes（**選択済み・不正解**）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Shared-Nothing Architecture（シェアードナッシングアーキテクチャ） | 各ノードが独立したストレージ・メモリ・CPUを持ち、何も共有しないアーキテクチャ。Teradata・Greenplum・Hadoopが採用。スケールアウト容易だがデータ移動コストが高い |
| Shared-Disk Architecture（シェアードディスクアーキテクチャ） | 複数のコンピュートノードが共通のストレージを共有するアーキテクチャ。データの一貫性は高いが、コンピュートのスケールに限界がある |
| Hybrid Architecture（ハイブリッドアーキテクチャ） | Snowflakeが採用するアーキテクチャ。Shared-DiskとShared-Nothingの両方のメリットを組み合わせた新しい設計 |
| MPP (Massively Parallel Processing) | 大量のプロセッサを並列稼働させてデータ処理を行う方式。Snowflakeも並列処理を使うが、Shared-Nothing型のMPPとは異なる |
| Teradata / Greenplum / Hadoop | Shared-Nothing型アーキテクチャを採用する従来のデータウェアハウスまたはデータレイク製品 |

## 1-2. 重要コンセプトまとめ

- **Snowflakeのアーキテクチャは「ハイブリッド」** — 純粋なShared-NothingではなくShared-DiskとShared-Nothingの融合

- **2つのアーキテクチャの特性と Snowflake での取り込み方**:

  | アーキテクチャ | 特性 | Snowflakeでの対応 |
  |-------------|------|-----------------|
  | **Shared-Disk** | ストレージを全コンピュートが共有 | S3/Azure Blob/GCS の中央ストレージをすべてのWHが共有 |
  | **Shared-Nothing** | 各コンピュートが独自のメモリ・処理能力を持つ | 各仮想ウェアハウスは独立したメモリ・CPUを持つ |

- **3層構造との対応**:
  ```
  Cloud Services Layer    ← メタデータ管理・クエリ最適化
  Virtual Warehouse Layer ← 各WHが独立したメモリ・CPU（Shared-Nothing的）
  Storage Layer           ← 中央の共有ストレージ（Shared-Disk的）
  ```

- **「Shared-Nothing MPP」と言われがちだが誤り**:
  - Teradata・Greenplum・Hadoop は純粋なShared-Nothing MPP
  - Snowflake は「ストレージは共有・コンピュートは独立」というハイブリッド
  - この区別が試験で問われる

- **ハイブリッドのメリット**:
  - コンピュートとストレージを独立してスケール可能
  - 複数のWHが同じデータに同時アクセス可能（ストレージ共有のため）
  - 各WHは他のWHと干渉せずに処理できる（コンピュートが独立のため）

- **試験ポイント**: 「Snowflakeはshared-nothing」という記述は **誤り**。「hybrid（shared-disk + shared-nothing）」が正解

## 1-3. 公式ドキュメントURL

- [Snowflake Architecture](https://docs.snowflake.com/en/user-guide/intro-key-concepts#snowflake-architecture)

---

## 2-1. 問題文（英語）

> Snowflake database is based on the massively parallel shared nothing architecture used by databases like Teradata and Greenplum and data lakes like Hadoop.
>
> A. No
> B. Yes

## 2-2. 問題文の文法解析

### 文1: "Snowflake database is based on the massively parallel shared nothing architecture used by databases like Teradata and Greenplum and data lakes like Hadoop."

- **主語 (S)**: Snowflake database
- **動詞 (V)**: is based on（受動態句「〜に基づいている」）
- **目的語/補語**: the massively parallel shared nothing architecture
- **architectureの修飾**: used by databases like Teradata and Greenplum and data lakes like Hadoop（過去分詞の後置修飾）
- **文型**: SV（受動態）+ M
- **注目ポイント**:
  - 「is based on ~」は「〜に基づいている、〜を採用している」。技術仕様の説明に頻出
  - 「massively parallel」は「大規模並列」。MPP の形容詞表現
  - 「shared nothing」は形容詞句として architecture を修飾。ハイフンなし（shared-nothing）で書かれることもある
  - 「used by ~ like ~」は過去分詞の後置修飾 + like（例示）。「〜のようなデータベースに使われている」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| is based on ~ | 受動態句 | 〜に基づいている、〜を採用している | Snowflake is based on a hybrid architecture. |
| massively parallel | adjective phrase | 大規模並列の | MPP databases process data using massively parallel computing. |
| shared nothing | adjective phrase | シェアードナッシング（何も共有しない） | Hadoop uses a shared-nothing architecture. |
| data lake | noun phrase | データレイク（大量の生データを格納するストレージ） | Hadoop is used as a data lake platform. |

## 2-3. 問題文（日本語）

> Snowflakeデータベースは、TerradataやGreenplumのようなデータベース、Hadoopのようなデータレイクで使われている大規模並列シェアードナッシングアーキテクチャに基づいている。
>
> A. No（いいえ）
> B. Yes（はい）

---

## 3-1. 解説文（英語）

> Snowflake implements a new hybrid architecture that combines the best features of shared-disk and shared-nothing architectures. Snowflake stores data similarly to a shared-disk architecture, i.e., the data is shared. But it also allows for using several compute engines, each with its own memory and processing capabilities.

## 3-2. 解説文の文法解析

### 文1: "Snowflake implements a new hybrid architecture that combines the best features of shared-disk and shared-nothing architectures."

- **主語 (S)**: Snowflake
- **動詞 (V)**: implements
- **目的語 (O)**: a new hybrid architecture
- **関係代名詞節**: that combines the best features of shared-disk and shared-nothing architectures
- **文型**: SVO + 関係詞節
- **注目ポイント**:
  - 「implements」は「実装する、採用する」。技術文書の定番動詞
  - 「combines the best features of A and B」は「AとBの最良の特性を組み合わせる」。ハイブリッドの定義として重要な表現

### 文2: "Snowflake stores data similarly to a shared-disk architecture, i.e., the data is shared."

- **主語 (S)**: Snowflake
- **動詞 (V)**: stores
- **目的語 (O)**: data
- **修飾語 (M)**: similarly to a shared-disk architecture
- **言い換え**: i.e., the data is shared
- **文型**: SVO + M + i.e.節
- **注目ポイント**:
  - 「similarly to ~」は「〜と同様に」。比較の副詞句
  - 「i.e.,」（ラテン語 id est）は「すなわち」。前の内容を言い換えて説明する

### 文3: "But it also allows for using several compute engines, each with its own memory and processing capabilities."

- **接続詞**: But（対比）
- **主語 (S)**: it（= Snowflake）
- **動詞 (V)**: allows for（句動詞「〜を可能にする」）
- **目的語 (O)**: using several compute engines
- **付帯状況**: each with its own memory and processing capabilities
- **文型**: SVO + 付帯状況
- **注目ポイント**:
  - 「each with its own ~」は独立分詞構文的な付帯状況。「それぞれが独自の〜を持つ」
  - 「processing capabilities」は「処理能力」。computing power と同義
  - But で始まり、前文（Shared-Disk的）との対比でShared-Nothing的な特性を追加説明

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| implement | verb | 実装する、採用する | Snowflake implements a hybrid architecture. |
| combines the best features of A and B | 句 | AとBの最良の特性を組み合わせる | The hybrid model combines the best features of both architectures. |
| similarly to ~ | adverb phrase | 〜と同様に | Data is stored similarly to a shared-disk architecture. |
| each with its own ~ | 付帯状況 | それぞれが独自の〜を持つ | Several compute engines, each with its own memory. |
| processing capabilities | noun phrase | 処理能力 | Each warehouse has its own memory and processing capabilities. |

## 3-3. 解説文（日本語）

> Snowflakeは、Shared-DiskとShared-Nothingアーキテクチャの最良の特性を組み合わせた新しいハイブリッドアーキテクチャを実装しています。Snowflakeはデータをshared-diskアーキテクチャと同様に保存します（すなわち、データは共有されます）。しかし同時に、複数のコンピュートエンジンを利用することも可能であり、それぞれが独自のメモリと処理能力を持ちます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
