# 009: Shared Storage — Multiple Virtual Warehouses

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-08
**正答**: True

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Virtual Warehouse（仮想ウェアハウス） | Query Processing Layerを構成するコンピュートクラスター。それぞれが独自のメモリとCPUを持ち、独立して動作するが、同じ共有ストレージにアクセスする。 |
| Shared Data（共有データ） | すべての仮想ウェアハウスが共通でアクセスできるDatabase Storage Layer（S3等）に保存されたデータ。どのウェアハウスも同じデータを参照できる。 |
| Shared-Disk Architecture（共有ディスクアーキテクチャ） | 複数のコンピュートノードが単一の共有ストレージにアクセスするアーキテクチャ。Snowflakeのストレージ層はこれに相当する。 |
| Shared-Nothing Architecture（共有なしアーキテクチャ） | 各ノードが独自のストレージ・CPU・メモリを持つアーキテクチャ。Snowflakeの仮想ウェアハウス（コンピュート層）はこれに相当する。 |
| Hybrid Architecture（ハイブリッドアーキテクチャ） | Snowflakeが採用する独自のアーキテクチャ。ストレージ部分は Shared-Disk、コンピュート部分は Shared-Nothing を組み合わせた両方の長所を持つ設計。 |

## 1-2. 重要コンセプトまとめ

- **答えが True の理由**: 複数の仮想ウェアハウスは互いに独立しているが、**すべて同じ共有ストレージにアクセスする**
- **Snowflakeのハイブリッドアーキテクチャの核心**:
  - **ストレージ = Shared-Disk**: 全ウェアハウスが同じデータにアクセス可能
  - **コンピュート = Shared-Nothing**: 各ウェアハウスが独自のメモリ・CPU を持つ
- **仮想ウェアハウスの独立性**: ウェアハウス間でコンピュートリソースは競合しない（Snowflake分離の鍵）
- **試験ポイント**: 「independent of each other **but** access the same shared data」— この対比（逆接）がポイント
- **キャッシュへの影響**: 複数ウェアハウスがアクセスするため、ウェアハウスキャッシュは各ウェアハウス内に閉じる。Query Result Cache（Cloud Services Layer）はすべてのウェアハウスで共有される

## 1-3. 公式ドキュメントURL

- [Snowflake Architecture — Key Concepts](https://docs.snowflake.com/en/user-guide/intro-key-concepts#snowflake-architecture)

---

## 2-1. 問題文（英語）

> True/False: If you have multiple virtual warehouses in your Snowflake system, they will access the same shared data.
>
> A. True
>
> B. False

## 2-2. 問題文の文法解析

### 文1: "If you have multiple virtual warehouses in your Snowflake system, they will access the same shared data."

- **条件節**: If you have multiple virtual warehouses in your Snowflake system
- **主語 (S)**: they（= the multiple virtual warehouses）
- **動詞 (V)**: will access（助動詞 will + 動詞）
- **目的語 (O)**: the same shared data
- **文型**: SVO（条件節付き）
- **注目ポイント**:
  - `If ~ , they will ~` — 一般的な条件文（直説法）。「もし〜なら、〜だろう」。仮定法ではなく、現実的な条件を述べる
  - `the same shared data` — `same`（同じ）+ `shared`（共有された）が重複しているように見えるが、「すべてのウェアハウスが共通してアクセスする同一のデータ」を強調
  - `they` — 指示代名詞として前述の `multiple virtual warehouses` を受ける

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| multiple | 形容詞 | 複数の、多数の | Multiple virtual warehouses can run concurrently. |
| the same shared data | 名詞句 | 同じ共有データ | All warehouses access the same shared data. |
| access | 動詞 | アクセスする、参照する | Virtual warehouses access data from cloud storage. |

## 2-3. 問題文（日本語）

> 正誤問題: Snowflakeシステムに複数の仮想ウェアハウスがある場合、それらは同じ共有データにアクセスする。
>
> A. 正しい（True）
>
> B. 誤り（False）

---

## 3-1. 解説文（英語）

> Snowflake stores data in a shared manner, like in shared-disk architecture. But it also allows for using several compute engines, each with its own memory and processing capabilities. The virtual warehouses are independent of each other but access and process the same shared data.

## 3-2. 解説文の文法解析

### 文1: "Snowflake stores data in a shared manner, like in shared-disk architecture."

- **主語 (S)**: Snowflake
- **動詞 (V)**: stores
- **目的語 (O)**: data
- **修飾語 (M1)**: in a shared manner（副詞句 — 方法）
- **修飾語 (M2)**: like in shared-disk architecture（比喩の前置詞句）
- **注目ポイント**: `in a shared manner` — 「共有された形で」。`in a ~ manner` は「〜の方法で」の定型表現（008 でも登場）

### 文2: "But it also allows for using several compute engines, each with its own memory and processing capabilities."

- **主語 (S)**: it（= Snowflake）
- **動詞 (V)**: allows for（句動詞）
- **目的語 (O)**: using several compute engines（動名詞句）
- **付帯状況**: each with its own memory and processing capabilities
- **注目ポイント**:
  - `allow for ~` — `allow O to do` とは異なる句動詞。「〜を可能にする・〜に対応する」
  - `each with its own ~` — 「それぞれが独自の〜を持つ」。並列する要素に独立した属性があることを示す付帯状況

### 文3: "The virtual warehouses are independent of each other but access and process the same shared data."

- **主語 (S)**: The virtual warehouses
- **動詞1 (V1)**: are independent of（形容詞述語）
- **逆接 (but)**
- **動詞2 (V2)**: access and process（並列動詞）
- **目的語 (O)**: the same shared data
- **文型**: SVC but SVO
- **注目ポイント**:
  - `independent of each other` — 「互いに独立している」。`of` を忘れずに（`independent from` は誤り）
  - `but` — 対比の接続詞。「独立しているが、同じデータにアクセスする」という逆接が本問の核心
  - `access and process` — 2つの動詞が並列。「アクセスして処理する」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| in a shared manner | 副詞句 | 共有された形で | Snowflake stores data in a shared manner. |
| compute engine | 名詞句 | コンピュートエンジン（仮想ウェアハウス） | Each compute engine has its own memory. |
| processing capabilities | 名詞句 | 処理能力 | Each warehouse has its own processing capabilities. |
| independent of each other | 形容詞句 | 互いに独立している | Virtual warehouses are independent of each other. |

## 3-3. 解説文（日本語）

> Snowflakeは共有ディスクアーキテクチャのように、共有された形でデータを保存します。しかし同時に、それぞれが独自のメモリと処理能力を持つ複数のコンピュートエンジン（仮想ウェアハウス）の使用も可能です。仮想ウェアハウスは互いに独立していますが、同じ共有データにアクセスして処理します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
