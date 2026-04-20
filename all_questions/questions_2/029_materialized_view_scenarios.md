# 029: Materialized View — Beneficial Scenarios

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-10
**正答**: C（頻繁で類似した複雑なクエリ）, D（外部テーブルのサブセットアクセス高速化）
**ユーザー回答**: B（データ取り込み高速化）❌, C ✅ — Dを見落とし、Bを誤選択

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Materialized View（マテリアライズドビュー / MV） | クエリ結果を物理的に保存（事前計算）するビュー。通常のビューと異なり、データを実体として保持するため頻繁なクエリを高速化できる。Enterprise以上のエディションで利用可能 |
| External Table（外部テーブル） | Snowflake外部のストレージ（S3/GCS/Azure Blob等）上のデータを参照する読み取り専用テーブル。MVを作成してパフォーマンスを改善できるが、手動リフレッシュまたは通知システムによるリフレッシュが必要 |
| Pre-compute（事前計算） | クエリ結果をあらかじめ計算して保存しておくこと。MVの核心機能。クエリ実行時に再計算不要なため高速 |
| Data Ingestion（データ取り込み） | 外部ソースからSnowflakeにデータをロードするプロセス。MVの目的ではない（Snowpipe等の機能が担当） |
| Row-Level Security（行レベルセキュリティ） | ユーザーのロールに基づいて異なる行を返す機能。Secure View + Row Access Policyで実現。MVの目的ではない |
| Refresh（リフレッシュ） | MVのデータをソーステーブルの最新状態に更新する操作。内部テーブルのMVは自動リフレッシュ、外部テーブルのMVは手動または通知ベース |

## 1-2. 重要コンセプトまとめ

- **MVが有効なシナリオ（2つ）**:
  1. **頻繁に類似の複雑なクエリが実行される** → MVで事前計算しておけばクエリ高速化
  2. **外部テーブルのサブセットアクセスの高速化** → 外部テーブルにMVを作成してパフォーマンス改善

- **MVが有効でないシナリオ**:
  - ❌ **ロールに基づいて異なる行を返す** → これはRow Access Policy / Secure Viewの役割
  - ❌ **データ取り込み（ingestion）の高速化** → Snowpipe等のロード機能の役割。MVはクエリの高速化であってロードの高速化ではない

- **外部テーブルのMVの特殊性**:
  - 内部テーブルのMV → **自動リフレッシュ**
  - 外部テーブルのMV → **手動リフレッシュ**または**通知システム経由**のリフレッシュが必要

- **MVの判断基準キーワード**:
  - 「frequent queries」「complex queries」「same table」→ MV有効
  - 「external table」「subset of data」→ MV有効
  - 「data ingestion」「data loading」→ MV無関係

- **関連問題**: Q008（Materialized Views）、Q033（Materialized View Features）、Q2-001（Materialized Views Benefit）

## 1-3. 公式ドキュメントURL

- [Materialized Views](https://docs.snowflake.com/en/user-guide/views-materialized)
- [Materialized Views on External Tables](https://docs.snowflake.com/en/user-guide/views-materialized#materialized-views-on-external-tables)

---

## 2-1. 問題文（英語）

> Creating a materialized view will prove beneficial for which of the following scenarios? Select all that apply.
>
> A. There is a requirement to return different rows to different users based on their roles.
> B. There is a requirement to speed up the data ingestion processes.
> C. Different business users execute frequent and similar complex queries accessing the same table.
> D. Speeding up queries that access a subset of data from an external table is required.

## 2-2. 問題文の文法解析

### 文1: "Creating a materialized view will prove beneficial for which of the following scenarios?"

- **主語 (S)**: Creating a materialized view（マテリアライズドビューの作成は）— 動名詞句
- **動詞 (V)**: will prove（〜であると判明するだろう）
- **補語 (C)**: beneficial（有益な）
- **修飾語 (M)**: for which of the following scenarios（次のシナリオのうちどれにおいて）
- **文型**: SVC（疑問文）
- **注目ポイント**:
  - `prove beneficial` — 「有益であると判明する」。`prove` + 形容詞で「〜であるとわかる」
  - `will prove` — 未来形で「〜だろう」と可能性を示す

### 選択肢Dの文法: "Speeding up queries that access a subset of data from an external table is required."

- **主語 (S)**: Speeding up queries that access a subset of data from an external table（外部テーブルからデータのサブセットにアクセスするクエリの高速化は）— 動名詞句 + 関係詞節
- **動詞 (V)**: is required（必要とされている）
- **文型**: SV（受動態）
- **注目ポイント**: 長い動名詞主語に関係詞節が組み合わさった複雑な構造

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| prove beneficial | verb + adj | 有益であると判明する | Creating an MV will prove beneficial for this scenario. |
| data ingestion | noun phrase | データ取り込み | MVs do not speed up data ingestion processes. |
| a subset of data | noun phrase | データのサブセット（一部分） | MVs can speed up access to a subset of data. |
| pre-compute | verb | 事前計算する | MVs pre-compute results to speed up queries. |

## 2-3. 問題文（日本語）

> マテリアライズドビューの作成が有益であると判明するのは、次のシナリオのうちどれですか？該当するものをすべて選択してください。
>
> A. ユーザーのロールに基づいて異なる行を返す要件がある
> B. データ取り込みプロセスを高速化する要件がある
> C. 異なるビジネスユーザーが、同じテーブルにアクセスする頻繁で類似した複雑なクエリを実行する
> D. 外部テーブルからデータのサブセットにアクセスするクエリの高速化が必要である

---

## 3-1. 解説文（英語）

> Materialized views can be helpful if a query or slight variation is executed frequently.
>
> The executed queries are complex and take time and resources; a materialized view can pre-compute the results and speed up the processing.
>
> Materialized views can be created on an external table to improve performance. These materialized views must either be refreshed manually or through a notification system.

## 3-2. 解説文の文法解析

### 文1: "Materialized views can be helpful if a query or slight variation is executed frequently."

- **主語 (S)**: Materialized views（マテリアライズドビューは）
- **動詞 (V)**: can be（〜であり得る）
- **補語 (C)**: helpful（有用な）
- **条件節 (M)**: if a query or slight variation is executed frequently（クエリまたはそのわずかなバリエーションが頻繁に実行される場合）
- **文型**: SVC + if条件節
- **注目ポイント**: `slight variation` — 「わずかなバリエーション」。完全に同一のクエリでなくても、類似クエリが頻繁に実行される場合にMVが有効

### 文2: "The executed queries are complex and take time and resources; a materialized view can pre-compute the results and speed up the processing."

- **主語1 (S1)**: The executed queries（実行されるクエリは）
- **動詞1 (V1)**: are complex and take（複雑であり、時間とリソースを消費する）
- **主語2 (S2)**: a materialized view（マテリアライズドビューは）
- **動詞2 (V2)**: can pre-compute ... and speed up（事前計算し、高速化できる）
- **文型**: SVC + SVO; SVO（セミコロンで結合）

### 文3: "These materialized views must either be refreshed manually or through a notification system."

- **主語 (S)**: These materialized views（これらのMVは）
- **動詞 (V)**: must be refreshed（リフレッシュされなければならない）— 義務の受動態
- **修飾語 (M)**: either manually or through a notification system（手動または通知システムを通じてのいずれか）
- **文型**: SV（受動態）
- **注目ポイント**: `either A or B` — 「AまたはBのいずれか」。外部テーブルのMVリフレッシュ方法は2択

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| slight variation | noun phrase | わずかなバリエーション | MVs help when queries have slight variations. |
| pre-compute | verb | 事前計算する | MVs pre-compute results for faster access. |
| notification system | noun phrase | 通知システム | External table MVs can be refreshed through a notification system. |

## 3-3. 解説文（日本語）

> マテリアライズドビューは、クエリまたはそのわずかなバリエーションが頻繁に実行される場合に有用です。
>
> 実行されるクエリが複雑で時間とリソースを消費する場合、マテリアライズドビューは結果を事前計算して処理を高速化できます。
>
> マテリアライズドビューは外部テーブルに対しても作成でき、パフォーマンスを改善できます。これらのマテリアライズドビューは、手動または通知システムを通じてリフレッシュする必要があります。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
