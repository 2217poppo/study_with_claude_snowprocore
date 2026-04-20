# 042: Snowpipe COPY Command — Same Transformations as Typical COPY

**SnowPro Core Domain**: Domain 3 — Data Loading and Unloading
**作成日**: 2026-04-02
**正答**: True

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Snowpipe | Snowflakeのデータ自動取り込みサービス。ステージにファイルが置かれると自動でCOPY INTOを実行してデータをロードする。サーバーレスでウェアハウス不要 |
| Snowpipe定義（Pipe定義） | `CREATE PIPE` 文で定義するSnowpipeの設定。内部にCOPY INTO文を含む。このCOPY INTO文は通常のCOPY INTOと同じ変換をサポートする |
| COPY INTO（COPYコマンド） | ステージからSnowflakeテーブルへデータをロードするコマンド。ロード中にシンプルな変換（型キャスト・列省略・Truncate等）が可能 |
| Transformation（変換） | COPYロード中に可能な操作。列の順序変更・列の省略・型キャスト・文字列の切り詰め（Truncate）などのシンプルな変換が対象 |
| Serverless（サーバーレス） | Snowpipeの実行モデル。仮想ウェアハウスを使用せず、Snowflakeが内部で処理リソースを管理する。課金はクレジット消費量ベース |

## 1-2. 重要コンセプトまとめ

- **SnowpipeのCOPY = 通常のCOPYと同等の変換が可能**: True が正解
- **SnowpipeはCOPY INTO文をパイプ定義の内部に持つ**: `CREATE PIPE mypipe AS COPY INTO mytable FROM @mystage` という構造
- **変換の種類（どちらも共通）**:
  - 列の順序変更
  - 列の省略（ソースの一部列だけをロード）
  - キャスト（型変換）
  - 文字列の切り詰め（TRUNCATECOLUMNS）
- **Snowpipeと通常COPY INTOの主な違い**:
  - Snowpipe: ファイル到着時に**自動実行**・サーバーレス・継続的ロード
  - 通常COPY: **手動実行**・仮想ウェアハウスが必要・バッチロード
- **変換機能については差はない**: どちらも同じCOPY INTO の文法・機能を使う

## 1-3. 公式ドキュメントURL

- [Snowpipe Overview — How does Snowpipe work?](https://docs.snowflake.com/en/user-guide/data-load-snowpipe-intro#how-does-snowpipe-work)
- [Transforming Data During a Load](https://docs.snowflake.com/en/user-guide/data-load-transform)

---

## 2-1. 問題文（英語）

> True or False: The COPY command in a Snowpipe definition supports the same transformation as provided by the typical COPY command.
>
> A. True
> B. False

## 2-2. 問題文の文法解析

### 文1: "The COPY command in a Snowpipe definition supports the same transformation as provided by the typical COPY command."

- **主語 (S)**: The COPY command in a Snowpipe definition（Snowpipeの定義内のCOPYコマンドは）
- **動詞 (V)**: supports（サポートする）
- **目的語 (O)**: the same transformation（同じ変換機能を）
- **修飾語 (M)**: as provided by the typical COPY command（通常のCOPYコマンドによって提供される）← `as + 過去分詞` = 省略された関係詞節
- **文型**: SVO
- **注目ポイント**:
  - `the same ~ as ...` = 「〜と同じ…」。2つの対象を比較する定番表現
  - `as provided by ~` = `as [the transformation is] provided by ~` の省略形。技術文書で比較対象を簡潔に示す

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| definition | 名詞 | 定義（CREATE文の内容） | The pipe definition contains a COPY INTO statement. |
| transformation | 名詞 | 変換（ロード時に行う操作） | The COPY command supports simple transformations. |
| typical | 形容詞 | 典型的な、通常の | The typical COPY command requires a running warehouse. |
| the same A as B | 構文 | BによるAと同じA | Snowpipe supports the same transformations as the regular COPY. |

## 2-3. 問題文（日本語）

> 正誤問題: SnowpipeのCOPYコマンドは、通常のCOPYコマンドが提供する変換と同じ変換をサポートする。
>
> A. 正しい（True）
> B. 誤り（False）

---

## 3-1. 解説文（英語）

> Snowpipe uses the COPY command in its definition and can support the same transformations available to the COPY command.

## 3-2. 解説文の文法解析

### 文1: "Snowpipe uses the COPY command in its definition and can support the same transformations available to the COPY command."

- **主語 (S)**: Snowpipe（Snowpipeは）
- **動詞 (V1)**: uses（使用する）
- **目的語 (O1)**: the COPY command（COPYコマンドを）
- **修飾語 (M1)**: in its definition（定義の中で）
- **接続詞**: and
- **動詞 (V2)**: can support（サポートできる）
- **目的語 (O2)**: the same transformations（同じ変換機能を）
- **修飾語 (M2)**: available to the COPY command（COPYコマンドで利用可能な）← `available to ~` は過去分詞形容詞の後置修飾
- **文型**: SVO and SVO（並列）
- **注目ポイント**:
  - `available to ~` = 「〜で利用可能な」。`available for ~`（何かのための）と区別する
  - `its definition` の `its` = Snowpipe を指す所有代名詞

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| available to ~ | 形容詞句 | 〜で利用可能な（〜が使える） | The transformations available to COPY also work in Snowpipe. |
| in its definition | 前置詞句 | その定義の中で | Snowpipe uses COPY in its definition. |

## 3-3. 解説文（日本語）

> SnowpipeはCOPYコマンドをその定義の中で使用しており、COPYコマンドで利用可能な変換と同じ変換をサポートできます。

---

## 復習メモ

- [ ] SnowpipeのCOPY = 通常のCOPYと同じ変換機能を持つことを確認した
- [ ] Snowpipeと通常COPY INTOの違い（自動/手動・サーバーレス/WH必要）を説明できる
- [ ] 英語の文法ポイント（the same A as B / available to）を確認した
- [ ] この問題はSnowpipeの動作理論のためサンドボックス検証は任意
