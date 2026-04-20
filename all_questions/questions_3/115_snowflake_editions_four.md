# 115: Snowflake Editions — Four Available Editions

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features and Architecture
**作成日**: 2026-04-17
**正答**: A, B, D, E（Virtual Private Snowflake / Standard / Enterprise / Business Critical）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Standard Edition（スタンダード版） | Snowflakeの基本エディション。全機能の基盤となるエントリーレベル。Time Travel 1日・マルチクラスター非対応 |
| Enterprise Edition（エンタープライズ版） | Standardの上位版。マルチクラスターウェアハウス・Time Travel 90日・マスクポリシーなど追加機能あり |
| Business Critical Edition（ビジネスクリティカル版） | Enterpriseの上位版。SOC 2 Type II・HIPAA・PCI DSS準拠。顧客管理暗号化キー（Tri-Secret Secure）対応 |
| Virtual Private Snowflake（VPS） | 最上位エディション。完全に分離された専用のSnowflakeインフラ。最高レベルのセキュリティと分離性を提供 |
| On-Premise（オンプレミス） | 存在しないエディション。Snowflakeはフルクラウドサービスのみ。オンプレミス展開は提供されない |
| Government Edition（政府版） | 正式なエディション名ではない。公共機関向けにはBusiness CriticalやVPSで対応する |

## 1-2. 重要コンセプトまとめ

- **Snowflakeの4エディション（暗記必須）**
  1. **Standard**: 基本機能（Time Travel 1日）
  2. **Enterprise**: + マルチクラスター、Time Travel 90日
  3. **Business Critical**: + HIPAA/PCI DSS準拠、Tri-Secret Secure
  4. **Virtual Private Snowflake (VPS)**: + 完全専用インフラ、最高セキュリティ
- **誤りの選択肢**
  - `On-Premise`: Snowflakeはクラウド専用サービス、オンプレミスなし
  - `Government`: 独立したエディション名ではない
- **エディション昇格の方向性**
  - Standard → Enterprise → Business Critical → VPS の順に上位
  - 上位エディションは下位の機能をすべて含む
- **試験での出題パターン**: 「4つのエディションはどれか」「このエディションはこの機能をサポートするか」の2パターン

## 1-3. 公式ドキュメントURL

- [Snowflake Editions](https://docs.snowflake.com/en/user-guide/intro-editions.html)
- [Choosing the Right Edition](https://docs.snowflake.com/en/user-guide/intro-editions#choosing-the-right-edition)

---

## 2-1. 問題文（英語）

> Which of the following are the four available Snowflake editions? Select all that apply.
>
> A. Virtual Private Snowflake
> B. Standard
> C. On-Premise
> D. Enterprise
> E. Business Critical

## 2-2. 問題文の文法解析

### 文1: "Which of the following are the four available Snowflake editions?"

- **主語 (S)**: Which of the following
- **動詞 (V)**: are
- **補語 (C)**: the four available Snowflake editions
- **文型**: SVC（疑問文）
- **注目ポイント**: 
  - `the four available` = 利用可能な4つの（数字で限定しているため答えが明確）
  - `Select all that apply` = 問題文の「4つ」という数字を手がかりに全選択肢を確認する

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| edition | 名詞 | エディション、版 | Snowflake offers four editions. |
| available | 形容詞 | 利用可能な | Four editions are available for all users. |
| on-premise | 形容詞 | オンプレミスの | Snowflake has no on-premise deployment option. |
| enterprise | 名詞/形容詞 | エンタープライズ（企業向け） | Enterprise edition adds multi-cluster warehouses. |

## 2-3. 問題文（日本語）

> 次のうち、利用可能なSnowflakeの4つのエディションはどれですか？該当するものをすべて選んでください。
>
> A. Virtual Private Snowflake（仮想プライベートSnowflake）
> B. Standard（スタンダード）
> C. On-Premise（オンプレミス）
> D. Enterprise（エンタープライズ）
> E. Business Critical（ビジネスクリティカル）

---

## 3-1. 解説文（英語）

> Snowflake provides 4 editions. Standard, Enterprise, Business Critical, and Virtual Private Snowflake (VPS).
>
> https://docs.snowflake.com/en/user-guide/intro-editions.html

## 3-2. 解説文の文法解析

### 文1: "Snowflake provides 4 editions."

- **主語 (S)**: Snowflake
- **動詞 (V)**: provides
- **目的語 (O)**: 4 editions
- **文型**: SVO
- **注目ポイント**: シンプルな主張文。次の文でその4つを列挙する

### 文2: "Standard, Enterprise, Business Critical, and Virtual Private Snowflake (VPS)."

- **文型**: 体言止め（名詞句の列挙）
- **注目ポイント**: 
  - カンマ区切りで列挙し、最後に `and` を付ける（英語の列挙の基本）
  - `VPS` は `Virtual Private Snowflake` の略称として括弧内に示す

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| provide | 動詞 | 提供する | Snowflake provides four editions. |
| virtual private | 形容詞 | 仮想プライベートの | Virtual Private Snowflake is the highest-tier edition. |
| critical | 形容詞 | 重要な、クリティカルな | Business Critical edition meets HIPAA requirements. |

## 3-3. 解説文（日本語）

> Snowflakeは4つのエディションを提供しています。Standard（スタンダード）、Enterprise（エンタープライズ）、Business Critical（ビジネスクリティカル）、そしてVirtual Private Snowflake（VPS）です。

---

## 復習メモ

- [ ] Snowflakeの4エディション（Standard / Enterprise / Business Critical / VPS）を暗記した
- [ ] On-Premise（オンプレミス）はSnowflakeに存在しないことを確認した
- [ ] エディションの昇格順（Standard → Enterprise → Business Critical → VPS）を把握した
