# 036: Enterprise Edition Features

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-13
**正答**: Enterprise

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Snowflake Editions | Snowflakeの製品グレード。Standard → Enterprise → Business Critical → Virtual Private Snowflake (VPS) の順に機能が増える |
| Enterprise Edition | Standard Editionの全機能に加え、Multi-Cluster Warehouse・Column-level Masking・Row Access Policy・Materialized Views・Search Optimizationなどが利用可能になるエディション |
| Multi-Cluster Virtual Warehouse | 同時接続ユーザー数に応じてクラスター数を自動追加・削除できるウェアハウス。Enterprise以上で利用可能 |
| Column-level Masking | Dynamic Data Maskingにより、テーブルの特定列のデータをロールに応じてマスク（隠蔽）する機能 |
| Row Access Policy | テーブルの特定行へのアクセスをロールに応じて制御するポリシー。行レベルセキュリティを実現 |
| Search Optimization Service | ポイントルックアップクエリ（等値検索）を高速化するサーバーレスサービス。Enterprise以上で利用可能 |

## 1-2. 重要コンセプトまとめ

- Snowflakeには4つのエディションがある: **Standard < Enterprise < Business Critical < VPS**
- **Enterprise Edition** はStandardから機能が大幅に強化される境目のエディション
- Enterprise以上で利用可能になる主要機能:
  - Multi-Cluster Virtual Warehouses（マルチクラスターWH）
  - Column-level Masking（列レベルマスキング）
  - Row Access Policies（行アクセスポリシー）
  - Materialized Views（マテリアライズドビュー）
  - Search Optimization Service（検索最適化サービス）
- **「minimum edition」を問う問題では、その機能が最初に使えるエディションを答える**
- Business CriticalやVPSでも使えるが、**最小（minimum）はEnterprise**

## 1-3. 公式ドキュメントURL

- [Snowflake Editions](https://docs.snowflake.com/en/user-guide/intro-editions)

---

## 2-1. 問題文（英語）

> What is the minimum Snowflake edition that supports multi-cluster virtual warehouses?
>
> A. Enterprise
> B. Virtual Private Snowflake
> C. Standard
> D. Business Critical

## 2-2. 問題文の文法解析

### 文1: "What is the minimum Snowflake edition that supports multi-cluster virtual warehouses?"

- **主語 (S)**: What
- **動詞 (V)**: is
- **補語 (C)**: the minimum Snowflake edition
- **修飾語 (M)**: that supports multi-cluster virtual warehouses（関係詞節 → editionを修飾）
- **文型**: SVC（疑問文）
- **注目ポイント**: `the minimum ~ that ...` で「～を満たす最小のもの」を問うパターン。試験で頻出。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| minimum | adjective | 最小の、最低限の | The minimum edition required is Enterprise. |
| edition | noun | エディション、版 | Snowflake offers four editions. |
| support | verb | サポートする、対応する | Enterprise supports multi-cluster warehouses. |

## 2-3. 問題文（日本語）

> マルチクラスター仮想ウェアハウスをサポートするSnowflakeの最小エディションはどれですか？
>
> A. Enterprise
> B. Virtual Private Snowflake
> C. Standard
> D. Business Critical

---

## 3-1. 解説文（英語）

> The Enterprise edition has several additional capabilities not provided in the Standard edition. These include multi-cluster virtual warehouses, column-level masking, row access policies, materialized views, and search optimization. https://docs.snowflake.com/en/user-guide/intro-editions.html

## 3-2. 解説文の文法解析

### 文1: "The Enterprise edition has several additional capabilities not provided in the Standard edition."

- **主語 (S)**: The Enterprise edition
- **動詞 (V)**: has
- **目的語 (O)**: several additional capabilities
- **修飾語 (M)**: not provided in the Standard edition（過去分詞の後置修飾 → capabilitiesを修飾）
- **文型**: SVO
- **注目ポイント**: `capabilities not provided in ~` は「～では提供されていない機能」。過去分詞 `not provided` が名詞を後ろから修飾する典型パターン。

### 文2: "These include multi-cluster virtual warehouses, column-level masking, row access policies, materialized views, and search optimization."

- **主語 (S)**: These（= capabilities）
- **動詞 (V)**: include
- **目的語 (O)**: multi-cluster virtual warehouses, column-level masking, row access policies, materialized views, and search optimization（5項目の列挙）
- **文型**: SVO
- **注目ポイント**: `These include ~` で前文の内容を具体的に列挙するパターン。試験解説で頻出。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| additional | adjective | 追加の | Enterprise has additional capabilities. |
| capability | noun | 機能、能力 | These capabilities are not in Standard. |
| not provided in ~ | phrase | ～では提供されていない | Features not provided in the Standard edition. |

## 3-3. 解説文（日本語）

> Enterprise Editionには、Standard Editionでは提供されていない追加機能がいくつかあります。それらにはマルチクラスター仮想ウェアハウス、列レベルマスキング、行アクセスポリシー、マテリアライズドビュー、検索最適化が含まれます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
