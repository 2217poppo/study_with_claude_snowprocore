# 081: Snowflake Marketplace

**SnowPro Core Domain**: Domain 5 — Data Sharing
**作成日**: 2026-04-06
**正答**: D

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Snowflake Marketplace | サードパーティのデータセットを検索・取得できるSnowflakeのデータマーケットプレイス。さまざまな組織が提供するデータ製品（Listing）を無料または有料で利用できる。データのコピーではなく、Secure Data Sharingの仕組みを通じてリアルタイムアクセスが可能 |
| Sharing Centre | 誤答の選択肢。Snowflakeの正式な機能名ではない。"Data Sharing"や"Snowflake Marketplace"との混同を狙ったディストラクター |
| Secure Data Sharing | Snowflakeのコア機能で、データのコピーを作らずにアカウント間でデータをリアルタイム共有する仕組み。Snowflake Marketplaceの基盤技術でもあるが、Marketplaceとは別の機能 |
| Partner Hub | 誤答の選択肢。Snowflakeのパートナーエコシステムに関連する名称だが、サードパーティデータセットを検索・消費するための機能ではない |
| third-party dataset | 第三者（サードパーティ）が提供するデータセット。自組織以外が収集・作成したデータ。Snowflake Marketplaceでは気象データ、金融データ、人口統計データなど多種多様なサードパーティデータが提供されている |
| consume（データの消費） | データを利用・活用すること。Snowflake Marketplaceでは、データをローカルにコピーすることなく「消費」（クエリ実行）できる |

## 1-2. 重要コンセプトまとめ

- **Snowflake Marketplace = サードパーティデータの検索・利用プラットフォーム**: 試験では「外部データを探す場所はどこか」という問いに対して Snowflake Marketplace が唯一の正解
- **Secure Data Sharing との区別**: Secure Data Sharing は自アカウントと他のSnowflakeアカウント間でデータを共有する「仕組み」。Marketplace はその仕組みを使って第三者データを「発見・利用する場所」
- **ディストラクターの特徴**: "Sharing Centre"（実在しない機能名）や "Partner Hub"（パートナー関連の用語）は試験で混乱を狙う選択肢。機能の正式名称を正確に覚えることが重要
- **データコピーなし**: Marketplace のデータも Secure Data Sharing 技術により、購入者のアカウントにコピーされることなくリアルタイムでアクセスできる
- **無料・有料・プライベートの3形態**: Marketplace のリスティングには、無料（Free）・有料（Paid）・プライベート（Private）の形態がある

## 1-3. 公式ドキュメントURL

- [Snowflake Marketplace Overview](https://other-docs.snowflake.com/en/collaboration/collaboration-marketplace-about.html)
- [About Snowflake Marketplace](https://docs.snowflake.com/en/user-guide/data-marketplace-intro)

---

## 2-1. 問題文（英語）

> Through which of the following can users search for and consume third-party datasets?
>
> A. Sharing Centre
> B. Secure Data Sharing
> C. Partner Hub
> D. Snowflake Marketplace

## 2-2. 問題文の文法解析

### 文1: "Through which of the following can users search for and consume third-party datasets?"

- **主語 (S)**: users
- **動詞 (V)**: can search for and consume（助動詞 can + 動詞の原形2つを and で並列）
- **目的語 (O)**: third-party datasets
- **修飾語 (M)**: Through which of the following（前置詞句、疑問詞節として文頭に倒置）
- **文型**: SVO（倒置疑問文）
- **注目ポイント**:
  - **前置詞の前置 + 倒置**: 通常の語順は "Users can search for and consume third-party datasets through which of the following?" だが、疑問文では前置詞 `through` が疑問詞 `which` と共に文頭に出る
  - **"which of the following"**: 「次のうちどれを通じて」。試験問題で頻出のフレーズ
  - **"search for and consume"**: 2つの動詞句を `and` で並列。`search for`（〜を検索する）は句動詞で `for` を省略できない

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| consume | 動詞 | 消費する、利用する | Users can consume third-party data through the Marketplace. |
| third-party | 形容詞 | 第三者の、サードパーティの | Third-party datasets are available on Snowflake Marketplace. |
| search for | 句動詞 | 〜を検索する、〜を探す | You can search for weather data on the Marketplace. |
| through | 前置詞 | 〜を通じて、〜によって | Users access shared data through Secure Data Sharing. |

## 2-3. 問題文（日本語）

> 次のうち、どれを通じてユーザーはサードパーティのデータセットを検索し利用することができますか？
>
> A. Sharing Centre
> B. Secure Data Sharing
> C. Partner Hub
> D. Snowflake Marketplace

---

## 3-1. 解説文（英語）

> Snowflake Marketplace is the place to find and use third-party datasets that different organizations have made available. Users can search and consume third-party data sets using Snowflake Marketplace.

## 3-2. 解説文の文法解析

### 文1: "Snowflake Marketplace is the place to find and use third-party datasets that different organizations have made available."

- **主語 (S)**: Snowflake Marketplace
- **動詞 (V)**: is
- **補語 (C)**: the place to find and use third-party datasets that different organizations have made available
- **文型**: SVC
- **注目ポイント**:
  - **to不定詞の形容詞的用法**: `to find and use` が `the place` を修飾。「見つけて利用するための場所」
  - **関係代名詞 that**: `that different organizations have made available` が `third-party datasets` を修飾
  - **"make + O + available" (SVOC)**: `have made [third-party datasets] available` = 「（データセットを）利用可能にした」。過去分詞 `available` が補語（C）として目的語を説明するSVOC構文
  - **現在完了形 (have made)**: 過去に行われた行為の結果が現在も続いていることを示す

### 文2: "Users can search and consume third-party data sets using Snowflake Marketplace."

- **主語 (S)**: Users
- **動詞 (V)**: can search and consume（助動詞 + 動詞の原形を and で並列）
- **目的語 (O)**: third-party data sets
- **修飾語 (M)**: using Snowflake Marketplace（現在分詞句、手段を示す付帯状況）
- **文型**: SVO
- **注目ポイント**:
  - **using + 名詞**: 「〜を使って」。手段・方法を示す分詞構文。`by using` の `by` を省略した形とも解釈できる
  - **search and consume**: 文1では `find and use`、文2では `search and consume` と言い換えて同じ概念を繰り返している

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| make ~ available | 句動詞 (SVOC) | 〜を利用可能にする | Organizations make their data available on the Marketplace. |
| have made available | 動詞句 | 利用可能にしてきた（現在完了） | Different companies have made datasets available for purchase. |

## 3-3. 解説文（日本語）

> Snowflake Marketplace は、さまざまな組織が公開したサードパーティのデータセットを見つけて利用するための場所です。ユーザーは Snowflake Marketplace を使って、サードパーティのデータセットを検索し消費することができます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
