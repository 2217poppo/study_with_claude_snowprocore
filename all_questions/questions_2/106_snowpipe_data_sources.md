# 106: Snowpipe Data Sources

**SnowPro Core Domain**: Domain 3 — Data Loading, Unloading, and Connectivity
**作成日**: 2026-04-14
**正答**: A, B

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| External Stage | 外部クラウドストレージを参照するステージ。Snowpipeはクラウド通知でトリガー可能 |
| Internal Stage | Snowflake内部のステージ。Snowpipeは**REST APIでのみ**トリガー可能（通知ベースは不可） |
| Cloud Platform Notification | S3イベント通知等。外部ステージのファイル到着をSnowpipeに通知 |
| REST API Trigger | プログラムからSnowpipeを呼び出すAPI。Internal Stageでは唯一のトリガー方法 |

## 1-2. 重要コンセプトまとめ

- Snowpipeのデータソース: **External Stage** と **Internal Stage** の2つ
- **Snowflakeテーブルからは直接ロードできない**（ひっかけ）
- トリガー方式の違い:
  - External Stage: **クラウド通知** または REST API
  - Internal Stage: **REST APIのみ**（通知ベースは不可）
- Snowpipeは直接S3バケットをチェックしない — 通知 or REST APIで**トリガー**される必要がある

## 1-3. 公式ドキュメントURL

- [Introduction to Snowpipe](https://docs.snowflake.com/en/user-guide/data-load-snowpipe-intro)

---

## 2-1. 問題文（英語）

> Snowpipe can load data directly from which of the following? Select all that apply.
>
> A. External Stage
> B. Internal Stage
> C. Snowflake tables
> D. On-premises system

## 2-2. 問題文の文法解析

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| trigger | verb | トリガーする | Cloud notifications trigger the Snowpipe. |
| provision | noun | 規定、仕組み | No provision for trigger-based invocation. |
| ad-hoc basis | noun | アドホック（随時）ベース | Trigger on a scheduled or ad-hoc basis. |

## 2-3. 問題文（日本語）

> Snowpipeが直接データをロードできるのは以下のどれですか？

---

## 3-1. 解説文（英語）

> Snowpipe can load data from an external stage as well as an internal stage. When using an external stage, you can use the cloud platform notifications to trigger your Snowpipe. Note that when using internal stages with Snowpipe, you must trigger a Snowpipe via the REST API. There is no provision for a trigger based invocation of Snowpipe when using the internal stage as a source.

## 3-3. 解説文（日本語）

> Snowpipeは外部ステージからも内部ステージからもデータをロードできます。外部ステージ使用時はクラウドプラットフォーム通知でSnowpipeをトリガーできます。内部ステージ使用時はREST APIでSnowpipeをトリガーする必要があります。内部ステージをソースとする場合、通知ベースの呼び出しの仕組みはありません。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
