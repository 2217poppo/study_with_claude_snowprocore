# 007: Snowflake Marketplace — Third-Party Datasets

**SnowPro Core Domain**: Domain 5 — Data Collaboration
**作成日**: 2026-04-08
**正答**: True

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Snowflake Marketplace（スノーフレーク・マーケットプレイス） | サードパーティのデータセットを検索・購入・利用できるSnowflakeのオンラインデータマーケットプレイス。データをコピーせずSecure Data Sharing経由でリアルタイムアクセスできる。無料・有料・プライベートの3形態がある。 |
| Third-Party Dataset（サードパーティデータセット） | 自社以外の外部組織が提供するデータセット。Snowflake Marketplaceで検索・取得でき、自社データと組み合わせて分析に活用できる。 |
| Data Enrichment（データエンリッチメント） | 自社データに外部データを組み合わせて、データの質・量・価値を高めること。例: 自社の顧客データに外部の人口統計データを追加して分析精度を向上させる。 |
| Publicly Accessible（一般公開された） | 特定のユーザーや組織に限らず、広く公開されてアクセス可能な状態。Marketplaceの多くのデータセットはSnowflakeアカウントさえあれば誰でも利用可能。 |

## 1-2. 重要コンセプトまとめ

- **答えが True の理由**: Snowflake Marketplaceは、異なる組織が公開したサードパーティデータセットを検索・利用できるプラットフォームである
- **Snowflake Marketplaceの主な特徴**:
  1. **データの購入・販売が可能** — データプロバイダーがデータセットを公開し、コンシューマーが利用（無料 or 有料）
  2. **データコピー不要** — Secure Data Sharing経由でリアルタイムアクセス
  3. **会社外のデータを自社インスタンスに取り込める** — データエンリッチメントに活用
- **試験ポイント**: 「publicly accessible」「third-party datasets」「different organizations」というキーワードがすべてMarketplaceの本質的な特徴
- **VPSとの関係**: VPS（Virtual Private Snowflake）エディションのみMarketplace利用不可（共通クラウドサービスを使わないため）
- **関連問題**: 081（Marketplace概要）、084（VPS制限）

## 1-3. 公式ドキュメントURL

- [About the Snowflake Marketplace](https://other-docs.snowflake.com/en/collaboration/collaboration-marketplace-about.html)

---

## 2-1. 問題文（英語）

> True or False: Using the Snowflake Marketplace, customers can search for and utilize publicly accessible third-party datasets made available by different organizations.
>
> A. True
>
> B. False

## 2-2. 問題文の文法解析

### 文1: "Using the Snowflake Marketplace, customers can search for and utilize publicly accessible third-party datasets made available by different organizations."

- **分詞構文 (M1)**: Using the Snowflake Marketplace（付帯状況 — 「Marketplaceを使って」）
- **主語 (S)**: customers
- **動詞 (V)**: can search for and utilize（助動詞 + 並列動詞句）
- **目的語 (O)**: publicly accessible third-party datasets（+ 後置修飾）
- **後置修飾**: made available by different organizations（過去分詞句）
- **文型**: SVO
- **注目ポイント**:
  - `search for and utilize` — `search for ~`（〜を検索する）と `utilize ~`（〜を活用する）が `and` で並列。どちらも目的語は `third-party datasets`
  - `publicly accessible` — 「一般公開されてアクセス可能な」。副詞 `publicly`（公に）+ 形容詞 `accessible`（アクセス可能な）
  - `made available by different organizations` — 過去分詞の後置修飾「異なる組織によって利用可能にされた」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| publicly accessible | 形容詞句 | 一般公開されてアクセス可能な | Publicly accessible datasets are free to use. |
| third-party | 形容詞 | サードパーティの（第三者の） | Third-party datasets are provided by external organizations. |
| made available by ~ | 過去分詞句 | 〜によって利用可能にされた | Datasets made available by data providers can be used freely. |
| utilize | 動詞 | 活用する、利用する | Customers can utilize third-party data to enrich their analysis. |
| search for ~ | 句動詞 | 〜を検索する | Customers can search for datasets on the Marketplace. |

## 2-3. 問題文（日本語）

> 正誤問題: Snowflake Marketplaceを使って、顧客はさまざまな組織が公開した一般アクセス可能なサードパーティのデータセットを検索・利用できる。
>
> A. 正しい（True）
>
> B. 誤り（False）

---

## 3-1. 解説文（英語）

> The Snowflake Marketplace is an online marketplace where you can purchase and sell datasets. You may import data from outside your company into your Snowflake instance and utilize it to enrich your data via the Snowflake Marketplace.

## 3-2. 解説文の文法解析

### 文1: "The Snowflake Marketplace is an online marketplace where you can purchase and sell datasets."

- **主語 (S)**: The Snowflake Marketplace
- **動詞 (V)**: is
- **補語 (C)**: an online marketplace（+ 関係副詞節）
- **関係副詞節**: where you can purchase and sell datasets（`where` = in which）
- **文型**: SVC
- **注目ポイント**: `where` は場所の関係副詞。`an online marketplace where ~` = 「〜できるオンラインマーケットプレイス」。定義文の典型パターン

### 文2: "You may import data from outside your company into your Snowflake instance and utilize it to enrich your data via the Snowflake Marketplace."

- **主語 (S)**: You
- **動詞1 (V1)**: may import（助動詞 may + 動詞）
- **目的語 (O)**: data
- **修飾語1 (M1)**: from outside your company（データの出所）
- **修飾語2 (M2)**: into your Snowflake instance（取り込み先）
- **動詞2 (V2)**: utilize（and で V1 と並列）
- **目的語2**: it（= the imported data）
- **目的の不定詞**: to enrich your data（目的）
- **修飾語3 (M3)**: via the Snowflake Marketplace（手段）
- **注目ポイント**:
  - `from outside your company` — 「自社の外から」。`outside`（外部）が前置詞の目的語として名詞句を形成
  - `enrich your data` — 「データを豊かにする・価値を高める」。`enrich`（エンリッチメント）の動詞用法
  - `via the Snowflake Marketplace` — 「Marketplaceを経由して」。手段を示す `via`

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| import data from outside ~ | 動詞句 | 〜の外部からデータを取り込む | You may import data from outside your company. |
| enrich your data | 動詞句 | データを豊かにする・エンリッチメントする | Use third-party data to enrich your data. |
| via ~ | 前置詞 | 〜を経由して・〜を通じて | Access datasets via the Snowflake Marketplace. |
| instance | 名詞 | インスタンス（Snowflakeアカウント上の環境） | Import data into your Snowflake instance. |
| purchase and sell | 動詞句 | 購入・販売する | The Marketplace allows you to purchase and sell datasets. |

## 3-3. 解説文（日本語）

> Snowflake Marketplaceは、データセットを購入・販売できるオンラインマーケットプレイスです。Snowflake Marketplaceを通じて、自社の外部からデータをSnowflakeインスタンスに取り込み、自社データのエンリッチメントに活用することができます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
