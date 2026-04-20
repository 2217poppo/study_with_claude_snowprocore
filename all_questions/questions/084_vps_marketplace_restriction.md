# 084: VPS — Snowflake Marketplace Restriction

**SnowPro Core Domain**: Domain 5 — Data Sharing
**作成日**: 2026-04-06
**正答**: C

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| VPS / Virtual Private Snowflake | Snowflakeの最上位エディション。**専用の分離されたメタデータストアとコンピュートリソース**を持つ唯一のエディション。Snowflakeの共通クラウドサービスとは独立しているため、Snowflake Marketplaceを利用できない |
| Isolated Metadata（分離メタデータ） | VPS固有の特性。他のSnowflake顧客と共有されないプライベートなメタデータストアを保有する。Snowflake Marketplaceは共通メタデータ基盤の上に構築されているため、VPSはアクセス不可 |
| Common Cloud Services（共通クラウドサービス） | SnowflakeのCloud Services Layer（クラウドサービス層）のうち、全Snowflakeアカウントで共有されるコンポーネント。メタデータ管理・認証・最適化などを担う。VPSはこの共通基盤を使わない |
| Snowflake Marketplace | サードパーティのデータセットを検索・利用できるSnowflakeのマーケットプレイス。共通クラウドサービスとメタデータ基盤の上に構築されているため、VPSアカウントからは利用不可（他のすべてのエディションは利用可能） |

## 1-2. 重要コンセプトまとめ

- **VPS = Marketplace利用不可の唯一のエディション**: Standard・Enterprise・Business Criticalはすべて利用可能。VPSのみ利用不可
- **理由は「分離されたメタデータと共通基盤の不一致」**: Snowflake Marketplaceは共通クラウドサービスとメタデータ上に構築されている。VPSは専用（分離）メタデータを持つため、この共通基盤にアクセスできない
- **VPSの特徴**: Snowflakeの4つのエディション（Standard → Enterprise → Business Critical → VPS）の中で最も高いセキュリティ分離レベル。他のすべての顧客から完全に分離された専用インフラを持つ
- **試験の引っかけポイント**:「最上位エディション＝最も機能が多い」と思いがちだが、VPSはセキュリティ分離のためにMarketplaceを含む一部の共通機能が使えない
- **"except VPS"**: 「VPSを除くすべての」という表現が解説の核心。試験では `except` + エディション名のパターンに注目

## 1-3. 公式ドキュメントURL

- [About the Snowflake Marketplace](https://other-docs.snowflake.com/en/collaboration/collaboration-marketplace-about.html#about-the-snowflake-marketplace)

---

## 2-1. 問題文（英語）

> Which of the following Snowflake edition doesn't support Snowflake Marketplace?
>
> A. Enterprise
> B. Business Critical
> C. VPS or Virtual Private Snowflake
> D. Standard

## 2-2. 問題文の文法解析

### 文1: "Which of the following Snowflake edition doesn't support Snowflake Marketplace?"

- **主語 (S)**: Which of the following Snowflake edition（疑問詞節が主語）
- **動詞 (V)**: doesn't support（否定の助動詞 + 動詞原形）
- **目的語 (O)**: Snowflake Marketplace
- **文型**: SVO（疑問文）
- **注目ポイント**:
  - **"Which of the following ~"**: 「次のうちどの〜が」。試験問題の定番フォーマット
  - **"doesn't support"**: 否定形で「サポートしない＝利用できない」を問う。肯定の「supports」ではなく否定の「doesn't support」を使うことで「例外を探す」問題と明示
  - **文法上の備考**: 正確には "edition" は複数の選択肢があるので "editions" が自然だが、試験問題では "edition" の単数形が使われている

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| support | 動詞 | サポートする、対応する、利用できる | Not all editions support every Snowflake feature. |
| edition | 名詞 | エディション、製品グレード | VPS is the highest edition of Snowflake. |

## 2-3. 問題文（日本語）

> 次のうち、Snowflake Marketplaceをサポートしていないエディションはどれですか？
>
> A. Enterprise
> B. Business Critical
> C. VPS（Virtual Private Snowflake）
> D. Standard

---

## 3-1. 解説文（英語）

> All Snowflake accounts, except VPS Snowflake accounts, can use the Snowflake Marketplace. VPS accounts have isolated metadata and compute and, therefore, can't use the Snowflake marketplace built on the common cloud services and metadata provided by Snowflake.

## 3-2. 解説文の文法解析

### 文1: "All Snowflake accounts, except VPS Snowflake accounts, can use the Snowflake Marketplace."

- **主語 (S)**: All Snowflake accounts（except VPS Snowflake accounts は挿入句）
- **動詞 (V)**: can use
- **目的語 (O)**: the Snowflake Marketplace
- **修飾語 (M)**: except VPS Snowflake accounts（前置詞句、除外を示す挿入句）
- **文型**: SVO
- **注目ポイント**:
  - **"except + 名詞（挿入句）"**: 「〜を除いて」。`All ~ , except X,` の形でコンマで挟んで挿入し、例外を明示する。試験の解説文でよく使われるパターン。「全体から例外を引く」論理構造
  - **"All Snowflake accounts ... can use"**: 全体を肯定したあとに例外（except VPS）を挿入する構造。先に全体ルールを示してから例外を示すのが英語の典型的な説明順序

### 文2: "VPS accounts have isolated metadata and compute and, therefore, can't use the Snowflake marketplace built on the common cloud services and metadata provided by Snowflake."

- **主語 (S)**: VPS accounts
- **動詞1 (V1)**: have
- **目的語1 (O1)**: isolated metadata and compute
- **接続**: and
- **動詞2 (V2)**: can't use
- **目的語2 (O2)**: the Snowflake marketplace built on the common cloud services and metadata provided by Snowflake
- **修飾語 (M)**: therefore（因果の接続副詞、コンマで挟んで挿入）
- **文型**: SVO and (therefore) SVO
- **注目ポイント**:
  - **"and, therefore,"**: `therefore` をコンマで前後を挟んで `and` の後に置く挿入パターン。「そして、したがって〜できない」。前文の事実（isolated metadata and compute）から論理的帰結（can't use）を導く
  - **"built on the common cloud services and metadata"**: 過去分詞句が `the Snowflake marketplace` を後置修飾。「共通クラウドサービスとメタデータの上に構築された（Marketplace）」
  - **"provided by Snowflake"**: さらに `metadata` を後置修飾する過去分詞句。「Snowflakeによって提供される（メタデータ）」。連鎖する後置修飾

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| isolated | 形容詞 | 分離された、独立した | VPS has isolated metadata from other Snowflake customers. |
| compute | 名詞 | コンピュートリソース（処理資源） | VPS has dedicated compute resources. |
| therefore | 接続副詞 | したがって、それゆえ | VPS has isolated metadata and, therefore, can't access Marketplace. |
| built on ~ | 分詞句 | 〜の上に構築された | Marketplace is built on Snowflake's common cloud services. |

## 3-3. 解説文（日本語）

> VPS Snowflakeアカウントを除くすべてのSnowflakeアカウントは、Snowflake Marketplaceを利用できます。VPSアカウントは分離されたメタデータとコンピュートリソースを持っているため、Snowflakeが提供する共通クラウドサービスとメタデータの上に構築されたSnowflake Marketplaceを利用することができません。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
