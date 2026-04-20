# 048: Warehouse Node Count

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-13
**正答**: 512

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Virtual Warehouse Size | X-Small〜6X-Largeの10段階。サイズごとにノード数・クレジット消費が倍増する |
| Node（ノード） | ウェアハウスを構成するコンピュートリソースの単位。サイズが1段階上がるとノード数が2倍 |
| 6X-Large | 現時点で最大のウェアハウスサイズ。512ノードを持つ |
| Large | 8ノードのウェアハウスサイズ。ノード数計算の基準として覚えやすい |
| Cluster（クラスター） | ウェアハウスを構成するノードのグループ。Single-Clusterの場合、クラスター = ウェアハウス |

## 1-2. 重要コンセプトまとめ

- ウェアハウスサイズとノード数の対応（倍増ルール）:
  - X-Small: 1ノード
  - Small: 2ノード
  - Medium: 4ノード
  - **Large: 8ノード**（覚えやすい基準点）
  - X-Large: 16ノード
  - 2X-Large: 32ノード
  - 3X-Large: 64ノード
  - 4X-Large: 128ノード
  - 5X-Large: 256ノード
  - **6X-Large: 512ノード**（最大）
- 計算方法: **Large（8ノード）× 2^6 = 512**
- サイズが1段階上がるたびにノード数とクレジット消費が **2倍** になる
- 6X-Largeは現時点で最大のクラスター構成

## 1-3. 公式ドキュメントURL

- [Warehouse Overview](https://docs.snowflake.com/en/user-guide/warehouses-overview)

---

## 2-1. 問題文（英語）

> What is the number of nodes in a 6X-Large virtual warehouse?
>
> A. 512
> B. 256
> C. 128
> D. 64

## 2-2. 問題文の文法解析

### 文1: "What is the number of nodes in a 6X-Large virtual warehouse?"

- **主語 (S)**: What
- **動詞 (V)**: is
- **補語 (C)**: the number of nodes in a 6X-Large virtual warehouse
- **文型**: SVC（疑問文）
- **注目ポイント**: `the number of ~` は「～の数」。シンプルな知識問題の典型的な問い方。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| node | noun | ノード（コンピュートリソース単位） | A 6X-Large warehouse has 512 nodes. |
| cluster configuration | noun | クラスター構成 | The largest cluster configuration. |
| doubled in size | phrase | サイズが2倍になった | Large doubled in size 6 times. |

## 2-3. 問題文（日本語）

> 6X-Large仮想ウェアハウスのノード数はいくつですか？
>
> A. 512
> B. 256
> C. 128
> D. 64

---

## 3-1. 解説文（英語）

> 6X-Large, the largest cluster configuration (at the moment), has 512 nodes. The easy way to calculate is from the Large size, which has 8 nodes. 6X-Large means Large doubled in size 6 times. i.e. 8 nodes * (2*2*2*2*2*2) = 512

## 3-2. 解説文の文法解析

### 文1: "6X-Large, the largest cluster configuration (at the moment), has 512 nodes."

- **主語 (S)**: 6X-Large
- **動詞 (V)**: has
- **目的語 (O)**: 512 nodes
- **修飾語 (M)**: the largest cluster configuration (at the moment)（同格・挿入句）
- **文型**: SVO
- **注目ポイント**: 同格の挿入句で補足情報を追加。`at the moment` は「現時点では」で将来変わる可能性を示唆。

### 文2: "The easy way to calculate is from the Large size, which has 8 nodes."

- **主語 (S)**: The easy way to calculate
- **動詞 (V)**: is
- **補語 (C)**: from the Large size
- **修飾語 (M)**: which has 8 nodes（非制限的関係詞節）
- **文型**: SVC
- **注目ポイント**: 計算の基準をLarge（8ノード）に置く覚え方のコツを紹介。

### 文3: "6X-Large means Large doubled in size 6 times."

- **主語 (S)**: 6X-Large
- **動詞 (V)**: means
- **目的語 (O)**: Large doubled in size 6 times
- **文型**: SVO
- **注目ポイント**: `doubled in size N times` で「サイズがN回2倍になった」。命名規則の意味を解説。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| at the moment | phrase | 現時点では | The largest configuration at the moment. |
| doubled in size | phrase | サイズが2倍になった | Large doubled in size 6 times = 6X-Large. |
| i.e. | abbreviation | すなわち（id est） | i.e. 8 * 64 = 512. |

## 3-3. 解説文（日本語）

> 6X-Largeは現時点で最大のクラスター構成で、512ノードを持ちます。計算の簡単な方法はLargeサイズ（8ノード）を基準にすることです。6X-Largeは「Largeが6回サイズ2倍になった」ことを意味します。つまり、8ノード × (2×2×2×2×2×2) = 512です。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
