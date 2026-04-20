# 065: Data Clustering — Supported Editions

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-03
**正答**: A・B・C・D（すべて正解 — 全エディションがデータクラスタリングをサポート）

> 関連問題: 035（Clustering Keys）・041（Snowflake Editions）・051（Time Travel Editions）・057（Multi-Cluster Warehouse）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Data Clustering（データクラスタリング） | テーブルのマイクロパーティションを特定列の値順に整理する機能。クエリのパーティションプルーニング効果を高めてパフォーマンスを向上させる。**全エディション**で利用可能 |
| Clustering Key（クラスタリングキー） | クラスタリングの基準となる列。`CLUSTER BY (col)` で指定する |

## 1-2. 重要コンセプトまとめ

- **Data Clusteringはすべてのエディションでサポート**（= 全選択肢が正解）

- **051（Time Travel）と同じパターン**: 「全エディション対応」の機能を問う問題。`in all Snowflake editions` と覚える

- **「エディションで差がある機能」vs「全エディション共通の機能」の区別**（試験頻出）:

  | 機能 | 対応エディション |
  |------|----------------|
  | Data Clustering（クラスタリングキー） | **全エディション** |
  | Time Travel | **全エディション**（期間がStandardは1日、Enterprise以上は最大90日） |
  | Multi-Cluster Warehouse（スケールアウト） | **Enterprise以上のみ** |
  | Search Optimization Service | **Enterprise以上のみ** |
  | VPS専用メタデータストア | **VPSのみ** |

- **試験の引っかけ**: Multi-Cluster Warehouseと混同してクラスタリングも「Enterprise以上」と思い込む → クラスタリングは**Standard含む全エディション**でOK

## 1-3. 公式ドキュメントURL

- [Snowflake Editions](https://docs.snowflake.com/en/user-guide/intro-editions.html)

---

## 2-1. 問題文（英語）

> What of the following Snowflake edition allows data clustering to improve query performance? Select all that apply.
>
> A. Business Critical
> B. Virtual Private Snowflake
> C. Enterprise
> D. Standard

## 2-2. 問題文の文法解析

### 文1: "What of the following Snowflake edition allows data clustering to improve query performance?"

- **疑問詞**: What of the following Snowflake edition（以下のSnowflakeエディションのうち何が）
- **動詞 (V)**: allows（許可する・可能にする）
- **目的語 (O)**: data clustering to improve query performance（データクラスタリングがクエリパフォーマンスを向上させることを）← `allow + O + to do` 構文
- **注目ポイント**: `allow O to do` = 「Oが〜するのを可能にする」。エディションがクラスタリング機能を「許可・有効化する」という視点の問い方

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| allow O to do | 熟語 | Oが〜するのを可能にする | The edition allows clustering to improve performance. |
| data clustering | 名詞句 | データクラスタリング | Data clustering is supported in all editions. |
| improve query performance | 動詞句 | クエリパフォーマンスを向上させる | Clustering keys improve query performance. |

## 2-3. 問題文（日本語）

> クエリパフォーマンスを向上させるためのデータクラスタリングを使用できるSnowflakeエディションはどれですか？当てはまるものをすべて選択してください。
>
> A. Business Critical
> B. Virtual Private Snowflake
> C. Enterprise
> D. Standard

---

## 3-1. 解説文（英語）

> All Snowflake editions support data clustering.

## 3-2. 解説文の文法解析

### 文1: "All Snowflake editions support data clustering."

- **主語 (S)**: All Snowflake editions（すべてのSnowflakeエディションが）
- **動詞 (V)**: support（サポートする）
- **目的語 (O)**: data clustering（データクラスタリングを）
- **注目ポイント**: 最もシンプルな断言文。`All ~` = 例外なし。051の解説文 `Time Travel is supported in all Snowflake editions.` と同じ「全エディション対応」パターンだが、今回は能動態で `All ~ support`

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| All ~ support | 構文 | すべての〜がサポートする | All Snowflake editions support data clustering. |

## 3-3. 解説文（日本語）

> すべてのSnowflakeエディションがデータクラスタリングをサポートしています。

---

## 復習メモ

- [ ] データクラスタリングは全エディション（Standard含む）で使えることを覚えた
- [ ] Multi-Cluster Warehouseはエディション制限あり（Enterprise以上）と区別できた
- [ ] `allow O to do`・`All ~ support` のパターンを確認した
- [ ] この問題は理論問題のためサンドボックス検証は不要
