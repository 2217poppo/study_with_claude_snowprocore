# 086: Snowflake Marketplace — Browse Without Edition

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-06
**正答**: B（You don't need a Snowflake edition to browse the Snowflake marketplace listings）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Browse（ブラウズ） | Snowflake Marketplaceでリスティング（データ製品）を閲覧・検索する行為。**Snowflakeアカウントなしでも可能**。データを実際に取得（consume）することとは異なる |
| Consume（コンシューム） | Snowflake Marketplaceのデータを実際に自分のアカウントに取り込んで利用すること。**Snowflakeアカウントへのサインアップが必要**。最低Standard以上のエディションが必要（VPS除く） |
| Snowflake Marketplace | サードパーティのデータセットを提供するSnowflakeのデータマーケットプレイス。**ブラウズは誰でも（非Snowflakeユーザーも）可能**だが、データの取得にはエディションが必要 |
| Standard Edition | Snowflakeの最低エディション。Marketplaceのデータを消費（consume）できる最小のエディション。ブラウズは不要（誰でも可能）だが、消費するにはStandard以上が必要 |
| VPS（Virtual Private Snowflake） | Snowflakeの最上位エディション。**Snowflake Marketplaceをサポートしない**。分離されたメタデータと共通クラウドサービスとの非互換性が理由 |

## 1-2. 重要コンセプトまとめ

- **ブラウズ ≠ 消費（Browse ≠ Consume）**: 試験の核心。Marketplaceの「閲覧」と「データ取得」は別概念
  - **ブラウズ（Browse）**: Snowflakeアカウント不要。非Snowflakeユーザーでも可能
  - **消費（Consume）**: Snowflakeアカウント必要。Standard以上（VPS除く）
- **最小エディション for Browse = 不要（None）**: 問題の正解。エディションなしでブラウズ可能
- **最小エディション for Consume = Standard**: データを実際に利用するにはStandard以上が必要
- **VPSの例外**: VPSはMarketplaceを一切サポートしない（ブラウズも消費も）
- **試験の引っかけポイント**: 「最小エディションは何か」と聞かれたとき、ブラウズか消費かを見分けることが重要。本問は"browse"なので答えは「不要」

## 1-3. 公式ドキュメントURL

- [Snowflake Editions](https://docs.snowflake.com/en/user-guide/intro-editions.html)
- [About the Snowflake Marketplace](https://other-docs.snowflake.com/en/collaboration/collaboration-marketplace-about.html)

---

## 2-1. 問題文（英語）

> What is the minimum Snowflake edition required to browse Snowflake Marketplace?
>
> A. Virtual Private Snowflake
> B. You don't need a Snowflake edition to browse the Snowflake marketplace listings
> C. Standard
> D. Business Critical
> E. Enterprise

## 2-2. 問題文の文法解析

### 文1: "What is the minimum Snowflake edition required to browse Snowflake Marketplace?"

- **主語 (S)**: the minimum Snowflake edition required to browse Snowflake Marketplace（疑問文のため補語的な名詞句）
- **動詞 (V)**: is
- **疑問詞**: What（補語を問う）
- **文型**: SVC（疑問文で補語を What で問う）
- **注目ポイント**:
  - **"minimum ~ required to do"**: 「〜するのに必要な最小の〜」。`required to do`（〜するために必要な）は過去分詞句が `edition` を後置修飾。試験で「最低条件」を問う定番フレーズ
  - **"browse"**: 「閲覧する・ブラウズする」。`consume`（消費・利用する）との区別が正解の鍵。この問題では browse なので「エディション不要」が正解

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| minimum | 形容詞/名詞 | 最小の・最低の | What is the minimum edition required? |
| required | 形容詞 | 必要とされる | No edition is required to browse. |
| browse | 動詞 | 閲覧する、ブラウズする | Non-Snowflake users can browse Marketplace listings. |
| listing | 名詞 | リスティング（掲載データ製品） | Marketplace listings include free and paid datasets. |

## 2-3. 問題文（日本語）

> Snowflake Marketplaceをブラウズするのに必要な最小のSnowflakeエディションは何ですか？
>
> A. Virtual Private Snowflake
> B. Snowflake MarketplaceのリスティングをブラウズするだけならSnowflakeエディションは不要
> C. Standard
> D. Business Critical
> E. Enterprise

---

## 3-1. 解説文（英語）

> Snowflake Marketplace can be browsed by non-Snowflake users as well, however they need to sign up to a Snowflake edition in order to consume data from the marketplace. Data Marketplace is supported in all Snowflake editions; thus, the minimum edition that supports it is the Standard edition. Do note that VPS doesn't support Data Marketplace.

## 3-2. 解説文の文法解析

### 文1: "Snowflake Marketplace can be browsed by non-Snowflake users as well, however they need to sign up to a Snowflake edition in order to consume data from the marketplace."

- **前半の主語 (S)**: Snowflake Marketplace
- **前半の動詞 (V)**: can be browsed（受動態、助動詞付き）
- **前半の修飾語 (M)**: by non-Snowflake users（行為者）/ as well（副詞「〜もまた」）
- **後半の主語 (S)**: they（= non-Snowflake users）
- **後半の動詞 (V)**: need to sign up
- **後半の修飾語 (M)**: to a Snowflake edition / in order to consume data from the marketplace
- **文型**: SV（受動態）, SVO
- **注目ポイント**:
  - **"as well"**: 「〜もまた」。non-Snowflakeユーザーも（Snowflakeユーザーと同様に）ブラウズできることを示す
  - **", however"**: 「しかしながら」。コンマで前節との対比を導く接続副詞。`but` より書き言葉的・フォーマル
  - **"sign up to a Snowflake edition"**: 「Snowflakeエディションに登録する」。`sign up for ~`（〜に申し込む）と同義だが `to` を使う形も見られる
  - **"in order to consume"**: 「消費するために」。`in order to + 動詞原形` は目的を明示するフォーマルな表現。`to consume` より明確に目的を示す

### 文2: "Data Marketplace is supported in all Snowflake editions; thus, the minimum edition that supports it is the Standard edition."

- **前半の主語 (S)**: Data Marketplace
- **前半の動詞 (V)**: is supported（受動態）
- **前半の修飾語 (M)**: in all Snowflake editions
- **後半の主語 (S)**: the minimum edition that supports it
- **後半の動詞 (V)**: is
- **後半の補語 (C)**: the Standard edition
- **文型**: SV（受動態）; SVC
- **注目ポイント**:
  - **"; thus,"**: セミコロン + thus で論理的帰結を導く。「〜である、したがって〜」。`; therefore,` と同義
  - **"that supports it"**: 関係詞節が `the minimum edition` を修飾。`it` = Data Marketplace（前出の名詞を指す代名詞）
  - **"the minimum edition ... is the Standard edition"**: SVC構文で「最小エディション = Standard」を定義

### 文3: "Do note that VPS doesn't support Data Marketplace."

- **動詞 (V)**: Do note（強調の do + 動詞原形の命令文）
- **目的語 (O)**: that VPS doesn't support Data Marketplace（that節）
- **文型**: VO（命令文）
- **注目ポイント**:
  - **"Do note that ~"**: 「〜に注意せよ、〜を覚えておけ」。`Do` を使うことで命令文を強調する。`Note that ~` より重要度が高いことを示す。試験の重要事項を伝えるときの定番フレーズ
  - **VPS例外の強調**: 「VPSはサポートしない」を別文・命令形で強調することで、この例外の重要性を示す

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| however | 接続副詞 | しかしながら | It can be browsed; however, consuming requires an account. |
| in order to ~ | 接続詞句 | 〜するために | Users sign up in order to consume data from the marketplace. |
| Do note that ~ | 強調命令 | 〜に注意せよ、〜を覚えておくこと | Do note that VPS doesn't support the Marketplace. |
| as well | 副詞 | 〜もまた | Non-Snowflake users can browse as well. |

## 3-3. 解説文（日本語）

> Snowflake Marketplaceは、Snowflakeを利用していないユーザーもブラウズ（閲覧）できます。ただし、Marketplaceからデータを消費（利用）するには、Snowflakeエディションへのサインアップが必要です。Data MarketplaceはすべてのSnowflakeエディションでサポートされているため、サポートされる最小エディションはStandardエディションです。なお、VPSはData Marketplaceをサポートしていない点に注意してください。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
