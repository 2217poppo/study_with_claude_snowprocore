# 099: Virtual Warehouse Independence — No Shared Memory/CPU

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-06
**正答**: False

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Virtual Warehouse（仮想ウェアハウス） | Snowflakeのコンピュートリソースの単位。クエリ実行に使うCPU・メモリ・一時ストレージを持つ独立したクラスター。複数のウェアハウスを同時に稼働させてもリソースは共有されない |
| Shared-Disk Architecture（共有ディスクアーキテクチャ） | 複数のコンピュートノードが単一のストレージを共有するアーキテクチャ。Snowflakeはデータの保存部分にこれを採用している（すべてのウェアハウスが同じ共有ストレージにアクセスする） |
| Shared-Nothing Architecture（共有なしアーキテクチャ） | 各ノードが独自のストレージ・CPU・メモリを持ち、ノード間でリソースを共有しないアーキテクチャ。Snowflakeはコンピュート部分にこれを採用している（各ウェアハウスが独立したメモリ・CPUを持つ） |
| Hybrid Architecture（ハイブリッドアーキテクチャ） | SnowflakeのアーキテクチャはShared-DiskとShared-Nothingの両方の長所を組み合わせたハイブリッド型。ストレージは共有、コンピュートは独立という構成 |

## 1-2. 重要コンセプトまとめ

- **False = 仮想ウェアハウスはメモリ・CPUを共有しない**: 各ウェアハウスが独自のメモリ・処理能力を持つ
- **Snowflakeの2層アーキテクチャの理解が鍵**:
  - **ストレージ層**: 共有（Shared-Disk的）— すべてのWHが同じデータにアクセス可能
  - **コンピュート層**: 独立（Shared-Nothing的）— 各WHは独自のCPU・メモリを持つ
- **複数ウェアハウスの特徴**:
  - 互いに独立（independent of each other）
  - 同じ共有データにアクセス・処理できる
  - メモリ・CPUは共有しない（= 問題の False の根拠）
- **間違えやすいポイント**: ストレージが共有されるのでメモリ・CPUも共有されると思いがちだが、**共有されるのはデータ（ストレージ）のみ**
- **試験頻出**: 「Virtual Warehouseはメモリ・CPUを共有するか」→ **常にFalse**

## 1-3. 公式ドキュメントURL

- [Snowflake Architecture](https://docs.snowflake.com/en/user-guide/intro-key-concepts#snowflake-architecture)

---

## 2-1. 問題文（英語）

> True or False: If you create more than one virtual warehouse, they will share the memory and CPU resources.
>
> A. False
> B. True

## 2-2. 問題文の文法解析

### 文1: "If you create more than one virtual warehouse, they will share the memory and CPU resources."

- **主節の主語 (S)**: they（= the virtual warehouses）
- **主節の動詞 (V)**: will share
- **主節の目的語 (O)**: the memory and CPU resources
- **条件節**: If you create more than one virtual warehouse
- **文型**: SVO（条件文）
- **注目ポイント**:
  - **"If you create more than one ~"**: 「〜を複数作成した場合」。`more than one`（1つを超える = 複数）で条件を設定。試験問題でシナリオを設定する定番の条件節
  - **"they will share"**: 「それら（複数WH）は共有するであろう」。主語 `they` は前文の複数ウェアハウスを受ける。`will` で（誤った）予測を示す。この文がFalse = 「共有しない」
  - **"the memory and CPU resources"**: 「メモリとCPUリソース」。`and` で2種のコンピュートリソースを並列。`the` で特定のリソース（各WHのもの）を指す

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| share | 動詞 | 共有する | Virtual warehouses do NOT share memory or CPU resources. |
| more than one | 数量表現 | 複数の・1つ超の | If you create more than one warehouse, each has its own resources. |
| CPU resources | 名詞句 | CPUリソース・処理能力 | Each warehouse has its own memory and CPU resources. |

## 2-3. 問題文（日本語）

> 正誤問題：仮想ウェアハウスを複数作成した場合、それらはメモリとCPUリソースを共有する。
>
> A. False（誤り）
> B. True（正しい）

---

## 3-1. 解説文（英語）

> Snowflake stores data in a shared manner, like in shared-disk architecture. But it also allows for using several compute engines, each with its own memory and processing capabilities. The virtual warehouses are independent of each other but access and process the same shared data.

## 3-2. 解説文の文法解析

### 文1: "Snowflake stores data in a shared manner, like in shared-disk architecture."

- **主語 (S)**: Snowflake
- **動詞 (V)**: stores
- **目的語 (O)**: data
- **修飾語 (M1)**: in a shared manner（方法・様態）
- **修飾語 (M2)**: like in shared-disk architecture（比喩・比較）
- **文型**: SVO
- **注目ポイント**:
  - **"in a shared manner"**: 「共有された方法で」。`in a ~ manner`（〜の方法で）の定型表現。データのストレージが共有されることを示す
  - **"like in shared-disk architecture"**: 「共有ディスクアーキテクチャにおけるように」。`like in ~` は「〜の中のように・〜の場合のように」。比喩・類似を示す前置詞句（`like + 前置詞句`の形は口語的で技術文書でも使われる）。`as in ~` より略式的

### 文2: "But it also allows for using several compute engines, each with its own memory and processing capabilities."

- **主語 (S)**: it（= Snowflake）
- **動詞 (V)**: allows for
- **目的語 (O)**: using several compute engines（動名詞句）
- **付帯状況**: each with its own memory and processing capabilities（独立分詞構文的な付帯状況）
- **文型**: SVO
- **注目ポイント**:
  - **"But it also allows for ~"**: 「しかし〜も可能にする」。`But` で前文（共有ストレージ）と対比し、`also` で追加特性（独立コンピュート）を示す。文頭の `But` は書き言葉では珍しいが、口語的・平易な技術文書で対比を際立たせる
  - **"allows for using ~"**: `allow for + 動名詞`（〜を可能にする）。`allow O to do` とは異なる句動詞で「〜の余地を与える・〜に対応する」のニュアンス
  - **"each with its own memory and processing capabilities"**: 「それぞれが独自のメモリと処理能力を持つ」。`each with its own ~` は複数要素の各々が独立した属性を持つことを示す付帯状況（独立分詞構文的）。Q099のキーポイント

### 文3: "The virtual warehouses are independent of each other but access and process the same shared data."

- **主語 (S)**: The virtual warehouses
- **動詞1 (V1)**: are independent of each other
- **動詞2 (V2)**: access and process（`but` で逆接接続）
- **目的語 (O)**: the same shared data
- **文型**: SVC but SVO（`but` で逆接並列）
- **注目ポイント**:
  - **"independent of each other"**: 「互いに独立している」。`independent of ~`（〜から独立している）で完全な独立性を示す。`of each other` で相互に独立することを強調
  - **"but access and process"**: `but` で逆接。前半「独立している（コンピュート）」vs 後半「同じデータにアクセス（ストレージ共有）」。Snowflakeのハイブリッドアーキテクチャの核心を一文で表す
  - **"the same shared data"**: 「同じ共有データ」。`the same ~`（同一の〜）+ `shared`（共有された）で、ストレージが単一共有であることを強調

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| independent of each other | 形容詞句 | 互いに独立している | Virtual warehouses are independent of each other. |
| processing capabilities | 名詞句 | 処理能力・処理性能 | Each warehouse has its own memory and processing capabilities. |
| like in ~ | 前置詞句 | 〜の場合のように | Data is stored in a shared manner, like in shared-disk architecture. |

## 3-3. 解説文（日本語）

> Snowflakeは、共有ディスクアーキテクチャのように、データを共有された方法で保存します。しかし同時に、それぞれが独自のメモリと処理能力を持つ複数のコンピュートエンジンの使用も可能にしています。仮想ウェアハウスは互いに独立していますが、同じ共有データにアクセスして処理することができます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
