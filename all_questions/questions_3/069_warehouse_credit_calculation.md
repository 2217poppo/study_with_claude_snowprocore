# 069: Warehouse Credit Calculation

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-16
**正答**: A (True)

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Snowflake Credit（クレジット） | Snowflakeのコンピュート使用量の課金単位。ウェアハウスのサイズと稼働時間で消費量が決まる |
| X-Small Warehouse | 1ノード構成。1時間あたり1クレジット消費。最小のウェアハウスサイズ |
| Small Warehouse | 2ノード構成。1時間あたり2クレジット消費 |
| Medium Warehouse | 4ノード構成。1時間あたり4クレジット消費 |

## 1-2. 重要コンセプトまとめ

- クレジット消費は**サイズが1段階上がるごとに2倍**になる:
  - X-Small: 1 credit/hr（1ノード）
  - Small: 2 credits/hr（2ノード）
  - Medium: 4 credits/hr（4ノード）
  - Large: 8 credits/hr（8ノード）
  - X-Large: 16 credits/hr（16ノード）
- 計算例: Medium × 2時間 = 4 × 2 = **8クレジット**
- 計算例: Small × 4時間 = 2 × 4 = **8クレジット**（同じ！）
- サイズ変更の判断: 同じクレジットを使うなら、大きいWHで短時間の方が効率的な場合が多い

## 1-3. 公式ドキュメントURL

- [Warehouse Credit Usage](https://docs.snowflake.com/en/user-guide/credits#virtual-warehouse-credit-usage)

---

## 2-1. 問題文（英語）

> True/False: Credits used by a Medium virtual warehouse running for 2 hours is equal to 4 hours of Small virtual warehouse usage.
>
> A. True
> B. False

## 2-2. 問題文の文法解析

### 文1: "Credits used by a Medium virtual warehouse running for 2 hours is equal to 4 hours of Small virtual warehouse usage."

- **主語 (S)**: Credits used by a Medium virtual warehouse running for 2 hours
- **動詞 (V)**: is
- **補語 (C)**: equal to 4 hours of Small virtual warehouse usage
- **文型**: SVC
- **注目ポイント**:
  - 「used by ~」は過去分詞の後置修飾（～によって使用されるクレジット）
  - 「running for 2 hours」は現在分詞の後置修飾（2時間稼働する）
  - 「is equal to ~」で等しいかどうかを問う
  - 後置修飾が二重に積み重なった長い主語

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| credit | 名詞 | クレジット（課金単位） | Credits are consumed based on warehouse size. |
| is equal to | 形容詞句 | ～に等しい | 8 credits is equal to 8 credits. |
| usage | 名詞 | 使用量 | Small virtual warehouse usage for 4 hours. |
| running for | 現在分詞句 | ～時間稼働する | A warehouse running for 2 hours. |

## 2-3. 問題文（日本語）

> True/False: Mediumサイズの仮想ウェアハウスが2時間稼働した場合のクレジット消費は、Smallサイズの仮想ウェアハウスの4時間の使用量と等しい。
>
> A. True（真）
> B. False（偽）

---

## 3-1. 解説文（英語）

> Virtual warehouses' compute time is paid for using Snowflake credits. The quantity of Snowflake credits used is determined by the size of the virtual warehouse and the length of time they are in a running state. When the size of a virtual warehouse is increased, the number of credits used in an hour also increases. An X-Small (1-node) virtual warehouse consumes 1 credit for an hour of use. Since the credit usage per hour doubles for each increase in size, a Small virtual warehouse (consisting of 2 nodes) running for 4 hours consumes 8 Snowflake credits. Similarly, a Medium virtual warehouse consumes 8 Snowflake credits within 2 hours because it consists of 4 nodes and is consuming credits at twice the rate of a Small virtual warehouse.

## 3-2. 解説文の文法解析

### 文1: "Virtual warehouses' compute time is paid for using Snowflake credits."

- **主語 (S)**: Virtual warehouses' compute time
- **動詞 (V)**: is paid for（受動態）
- **修飾語 (M)**: using Snowflake credits（手段を示す分詞構文）
- **文型**: SV（受動態）

### 文2: "The quantity of Snowflake credits used is determined by the size of the virtual warehouse and the length of time they are in a running state."

- **主語 (S)**: The quantity of Snowflake credits used
- **動詞 (V)**: is determined（受動態）
- **修飾語 (M)**: by the size ... and the length of time ...（動作主 — 2要素）
- **文型**: SV（受動態）
- **注目ポイント**: クレジット消費を決める2つの要素: ①サイズ ②稼働時間。

### 文3: "Since the credit usage per hour doubles for each increase in size, a Small virtual warehouse (consisting of 2 nodes) running for 4 hours consumes 8 Snowflake credits."

- **主語 (S)**: a Small virtual warehouse (consisting of 2 nodes) running for 4 hours
- **動詞 (V)**: consumes
- **目的語 (O)**: 8 Snowflake credits
- **修飾語 (M)**: Since the credit usage per hour doubles for each increase in size（理由の副詞節）
- **文型**: SVO
- **注目ポイント**: 「doubles for each increase in size」で「サイズが1段階上がるごとに2倍になる」。核心の計算ルール。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| is determined by | 受動態 | ～によって決まる | Cost is determined by size and time. |
| doubles | 動詞 | 2倍になる | Credit usage doubles for each size increase. |
| at twice the rate | 前置詞句 | 2倍の速度で | Consuming credits at twice the rate. |
| running state | 名詞句 | 稼働状態 | The time they are in a running state. |

## 3-3. 解説文（日本語）

> 仮想ウェアハウスのコンピュート時間はSnowflakeクレジットを使用して支払われます。使用されるSnowflakeクレジットの量は、仮想ウェアハウスのサイズと稼働状態にある時間の長さによって決まります。仮想ウェアハウスのサイズが増加すると、1時間あたりのクレジット消費も増加します。X-Small（1ノード）の仮想ウェアハウスは1時間の使用で1クレジットを消費します。サイズが1段階上がるごとに1時間あたりのクレジット使用量は2倍になるため、Small仮想ウェアハウス（2ノード構成）が4時間稼働すると8 Snowflakeクレジットを消費します。同様に、Medium仮想ウェアハウスは4ノード構成でSmallの2倍の速度でクレジットを消費するため、2時間で8 Snowflakeクレジットを消費します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
