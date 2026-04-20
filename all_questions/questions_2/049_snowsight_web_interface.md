# 049: Snowsight Web Interface

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-13
**正答**: Snowsight

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Snowsight | SnowflakeのWebベースのユーザーインターフェース。モダンで軽量。ブラウザからクエリ実行・ダッシュボード・管理操作が可能。Snowflakeの主要な操作手段 |
| SnowCD（Snowflake Connectivity Diagnostics） | Snowflakeへのネットワーク接続を診断するツール。接続テスト用であり、操作インターフェースではない |
| SnowSQL | Snowflakeのコマンドラインクライアント（CLI）。ターミナルからSQL実行・データロード/アンロードが可能。Webベースではない |
| Snowpipe | サーバーレスの継続的データロードサービス。ステージへのデータ到着を検知して自動ロード。インターフェースではない |

## 1-2. 重要コンセプトまとめ

- Snowflakeのインターフェースは複数あるが、**Webベースは Snowsight のみ**
- 各ツールの分類:
  - **Web UI**: Snowsight
  - **CLI**: SnowSQL
  - **診断ツール**: SnowCD
  - **データロードサービス**: Snowpipe（インターフェースではない）
- Snowsightの特徴: モダン・軽量・新技術ベース・主要な操作手段
- 紛らわしい「Snow○○」の名前に注意 — 機能が全く異なる

## 1-3. 公式ドキュメントURL

- [Snowsight](https://docs.snowflake.com/en/user-guide/ui-snowsight)
- [SnowSQL](https://docs.snowflake.com/en/user-guide/snowsql)

---

## 2-1. 問題文（英語）

> Which of the following is a web-based interface to Snowflake?
>
> A. Snowsight
> B. SnowCD
> C. SnowSQL
> D. Snowpipe

## 2-2. 問題文の文法解析

### 文1: "Which of the following is a web-based interface to Snowflake?"

- **主語 (S)**: Which of the following
- **動詞 (V)**: is
- **補語 (C)**: a web-based interface to Snowflake
- **文型**: SVC（疑問文）
- **注目ポイント**: `web-based` はハイフン結合の複合形容詞。`interface to ~` で「～へのインターフェース」。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| web-based | adjective | Webベースの | Snowsight is a web-based interface. |
| interface | noun | インターフェース、操作画面 | A primary method of interacting. |
| lightweight | adjective | 軽量な | Snowsight is modern and lightweight. |

## 2-3. 問題文（日本語）

> 以下のうち、SnowflakeへのWebベースのインターフェースはどれですか？
>
> A. Snowsight
> B. SnowCD
> C. SnowSQL
> D. Snowpipe

---

## 3-1. 解説文（英語）

> Snowsight is a modern and lightweight web interface using new technologies and is a primary method of interacting with your Snowflake instance.

## 3-2. 解説文の文法解析

### 文1: "Snowsight is a modern and lightweight web interface using new technologies and is a primary method of interacting with your Snowflake instance."

- **主語 (S)**: Snowsight
- **動詞 (V)**: is ... and is（並列）
- **補語 (C)**: a modern and lightweight web interface / a primary method of interacting with your Snowflake instance
- **修飾語 (M)**: using new technologies（分詞構文）
- **文型**: SVC + SVC（並列）
- **注目ポイント**: 2つの `is` が並列。`a primary method of interacting` で「主要な操作手段」。`using new technologies` で最新技術ベースであることを補足。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| primary method | noun | 主要な方法 | A primary method of interacting with Snowflake. |
| instance | noun | インスタンス（稼働中の環境） | Your Snowflake instance. |
| interact with ~ | phrase | ～と対話する、操作する | Interacting with your Snowflake instance. |

## 3-3. 解説文（日本語）

> Snowsightは新しい技術を使用したモダンで軽量なWebインターフェースであり、Snowflakeインスタンスと対話するための主要な手段です。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
