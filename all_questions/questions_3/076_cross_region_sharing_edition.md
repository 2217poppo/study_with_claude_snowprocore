# 076: Cross-Region Sharing Edition

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-16
**正答**: B (Standard)

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Replication（レプリケーション） | Snowflakeアカウント間でデータベースを複製する機能。異なるリージョン・クラウドプラットフォーム間でのデータ共有を可能にする |
| Snowflake Edition（エディション） | Snowflakeの機能レベル。Standard < Enterprise < Business Critical < VPS の順に機能が増える |
| Standard Edition | 最も基本的なエディション。クロスリージョン/クロスクラウド共有を含む基本機能をすべてサポート |
| Cross-Region Sharing | 異なるクラウドリージョン間でのデータ共有。レプリケーションを通じて実現される |

## 1-2. 重要コンセプトまとめ

- クロスリージョン/クロスクラウドのデータ共有（レプリケーション経由）は**すべてのエディション**でサポート
- したがって最小エディションは**Standard**
- VPS（Virtual Private Snowflake）は最上位エディションだが、最小ではない
- エディション別の機能の出題では「最小（minimum）」を問われることが多い — 必ず「全エディション対応 = Standard」と判断する
- Enterprise以上でのみ利用可能な機能（例: Multi-Cluster WH, Time Travel 90日, Column-level Masking等）とは区別する

## 1-3. 公式ドキュメントURL

- [Snowflake Editions](https://docs.snowflake.com/en/user-guide/intro-editions)

---

## 2-1. 問題文（英語）

> What is the minimum Snowflake edition required for securely sharing data across regions and cloud platforms (via replication)?
>
> A. Virtual Private Snowflake
> B. Standard
> C. Enterprise
> D. Business Critical

## 2-2. 問題文の文法解析

### 文1: "What is the minimum Snowflake edition required for securely sharing data across regions and cloud platforms (via replication)?"

- **主語 (S)**: the minimum Snowflake edition required for ...
- **動詞 (V)**: is
- **補語 (C)**: What
- **修飾語 (M)**: required for securely sharing data across regions and cloud platforms（過去分詞の後置修飾）/ (via replication)（手段の補足）
- **文型**: SVC（疑問文）
- **注目ポイント**: 「minimum ~ required for」で最低要件を問う。「across regions and cloud platforms」で範囲を示す。「via replication」で手段を括弧で補足。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| minimum edition required | 名詞句 | 最低限必要なエディション | The minimum edition required is Standard. |
| across | 前置詞 | ～にまたがって | Sharing data across regions. |
| via | 前置詞 | ～経由で | Sharing via replication. |
| securely | 副詞 | 安全に | Securely sharing data. |

## 2-3. 問題文（日本語）

> リージョンやクラウドプラットフォームをまたいでデータを安全に共有するために（レプリケーション経由で）必要な最小のSnowflakeエディションは何ですか？
>
> A. Virtual Private Snowflake
> B. Standard
> C. Enterprise
> D. Business Critical

---

## 3-1. 解説文（英語）

> Database sharing across regions and clouds (via replication) is supported in all Snowflake editions; thus, the minimum edition that supports it is the Standard edition.

## 3-2. 解説文の文法解析

### 文1: "Database sharing across regions and clouds (via replication) is supported in all Snowflake editions; thus, the minimum edition that supports it is the Standard edition."

- **主語 (S)**: Database sharing across regions and clouds / the minimum edition that supports it
- **動詞 (V)**: is supported / is
- **修飾語 (M)**: in all Snowflake editions / thus（結果を示す副詞）
- **文型**: SV（受動態）; SVC
- **注目ポイント**: セミコロン + 「thus」で因果関係を接続。「all editions → minimum = Standard」の論理展開。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| is supported in | 受動態 | ～でサポートされている | Supported in all editions. |
| thus | 副詞 | したがって | Thus, the minimum edition is Standard. |

## 3-3. 解説文（日本語）

> リージョンやクラウドをまたいだデータベース共有（レプリケーション経由）は、すべてのSnowflakeエディションでサポートされています。したがって、これをサポートする最小エディションはStandardエディションです。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
