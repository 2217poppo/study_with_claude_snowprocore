# 063: External Table Edition

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-13
**正答**: Standard

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| External Table（外部テーブル） | 外部ステージ（S3/Azure Blob/GCS等）に保存されたデータを参照するテーブル。データはSnowflake内部にコピーされない。すべてのエディションで利用可能 |
| Snowflake Editions | Standard < Enterprise < Business Critical < VPS の4段階。機能が上位になるほど増える |
| Standard Edition | Snowflakeの最も基本的なエディション。外部テーブルを含む多くの基本機能を提供 |

## 1-2. 重要コンセプトまとめ

- External Tableは **すべてのエディション** で利用可能 → 最小は **Standard**
- 「minimum edition」問題の解法:
  - Standard: 外部テーブル、基本機能、Time Travel(1日)
  - **Enterprise以上**: Multi-Cluster WH、Materialized Views、Column-level Masking、Row Access Policy、Search Optimization、Time Travel(90日)
  - **Business Critical以上**: Failover/Failback、Tri-Secret Secure、HIPAA対応
  - **VPS**: 完全な分離環境
- 外部テーブルはSnowflakeの基本機能であり、上位エディション限定ではない

## 1-3. 公式ドキュメントURL

- [Snowflake Editions](https://docs.snowflake.com/en/user-guide/intro-editions)

---

## 2-1. 問題文（英語）

> To create an external table, what minimum Snowflake edition is required?
>
> A. Standard
> B. Business Critical
> C. Enterprise
> D. Virtual Private Snowflake

## 2-2. 問題文の文法解析

### 文1: "To create an external table, what minimum Snowflake edition is required?"

- **主語 (S)**: what minimum Snowflake edition
- **動詞 (V)**: is required（受動態）
- **修飾語 (M)**: To create an external table（目的の不定詞）
- **文型**: SV（受動態疑問文）
- **注目ポイント**: `To ~ , what ~ is required?` は「～するために何が必要か」。minimum edition問題の典型フォーマット。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| external table | noun | 外部テーブル | All editions support external tables. |
| minimum edition | noun | 最小エディション | The minimum edition is Standard. |
| thus | adverb | したがって | Thus, the minimum edition is Standard. |

## 2-3. 問題文（日本語）

> 外部テーブルを作成するために必要な最小のSnowflakeエディションは何ですか？
>
> A. Standard
> B. Business Critical
> C. Enterprise
> D. Virtual Private Snowflake

---

## 3-1. 解説文（英語）

> All Snowflake editions support external tables; thus, the minimum edition that supports it is the Standard edition.

## 3-2. 解説文の文法解析

### 文1: "All Snowflake editions support external tables; thus, the minimum edition that supports it is the Standard edition."

- **主語 (S)**: All Snowflake editions / the minimum edition
- **動詞 (V)**: support / is
- **目的語/補語**: external tables / the Standard edition
- **修飾語 (M)**: thus（結論）、that supports it（関係詞節）
- **文型**: SVO + SVC
- **注目ポイント**: セミコロン + `thus` で「したがって」と結論を導く。全エディション対応 → 最小はStandard。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| thus | adverb | したがって | Thus, the minimum edition is Standard. |

## 3-3. 解説文（日本語）

> すべてのSnowflakeエディションが外部テーブルをサポートしています。したがって、それをサポートする最小のエディションはStandard Editionです。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
