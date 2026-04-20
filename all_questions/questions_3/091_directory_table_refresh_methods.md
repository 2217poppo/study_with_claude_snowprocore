# 091: Directory Table Refresh Methods

**SnowPro Core Domain**: Domain 3 — Data Loading, Unloading, and Connectivity
**作成日**: 2026-04-16
**正答**: C, D

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Directory Table Metadata Refresh | ディレクトリテーブルのファイルメタデータを最新に更新する操作 |
| ALTER STAGE ... REFRESH | ディレクトリテーブルのメタデータを手動で更新するコマンド |
| AUTO_REFRESH | クラウドイベント通知を利用して自動的にメタデータを更新する設定（`AUTO_REFRESH = TRUE`） |
| Cloud Event Notification | S3 Event Notification/Azure Event Grid/GCS Pub/Sub等のクラウドイベントサービス |

## 1-2. 重要コンセプトまとめ

- 外部ステージのディレクトリテーブルメタデータの更新方法は**2つ**:
  1. **手動更新**: `ALTER STAGE <stage-name> REFRESH;`
  2. **自動更新**: クラウドイベント通知 + `AUTO_REFRESH = TRUE`
- Snowflakeサポートへの依頼やResource Monitorでの更新は**不可**
- Resource Monitorはクレジット消費の監視用であり、メタデータ更新とは無関係
- 内部ステージでは`ALTER STAGE ... REFRESH`のみ使用可能（自動更新は外部ステージのみ）

## 1-3. 公式ドキュメントURL

- [Automatically Refreshing Directory Table Metadata](https://docs.snowflake.com/en/user-guide/data-load-dirtables-intro#automatically-refreshing-directory-table-metadata)

---

## 2-1. 問題文（英語）

> You are required to regularly refresh the metadata for a directory table for an external stage. Which of the following methods can you use?
>
> Select all that apply.
>
> A. Request Snowflake support to refresh the stage periodically.
> B. Configure a Resource Monitor to refresh the stage periodically.
> C. Run ALTER STAGE \<stage-name\> REFRESH; periodically to manually refresh the metadata.
> D. Configure event notifications on the cloud platform and set the stage to auto-refresh.

## 2-2. 問題文の文法解析

### 文1: "You are required to regularly refresh the metadata for a directory table for an external stage."

- **主語 (S)**: You
- **動詞 (V)**: are required（受動態）
- **目的語**: to regularly refresh the metadata
- **修飾語 (M)**: for a directory table for an external stage
- **文型**: SVO（受動態 + to不定詞）
- **注目ポイント**: 「are required to ~」で「～することが求められている」。ビジネス要件の提示。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| regularly | 副詞 | 定期的に | Regularly refresh the metadata. |
| periodically | 副詞 | 定期的に | Refresh the stage periodically. |
| auto-refresh | 名詞/動詞 | 自動更新 | Set the stage to auto-refresh. |

## 2-3. 問題文（日本語）

> 外部ステージのディレクトリテーブルのメタデータを定期的に更新する必要があります。以下のどの方法を使用できますか？
>
> 該当するものをすべて選んでください。
>
> A. Snowflakeサポートにステージの定期更新を依頼する。
> B. Resource Monitorを設定してステージを定期的に更新する。
> C. ALTER STAGE \<stage-name\> REFRESH; を定期的に実行してメタデータを手動更新する。
> D. クラウドプラットフォームのイベント通知を設定し、ステージを自動更新に設定する。

---

## 3-1. 解説文（英語）

> A directory table's metadata can be manually refreshed.
>
> ALTER STAGE \<stage-name\> REFRESH;
>
> In the case of an external stage, a directory table's metadata can also be automatically refreshed using cloud provider event notification services with AUTO_REFRESH = true configuration for cloud provider notification.

## 3-2. 解説文の文法解析

### 文1: "A directory table's metadata can be manually refreshed."

- **主語 (S)**: A directory table's metadata
- **動詞 (V)**: can be refreshed（受動態）
- **修飾語 (M)**: manually
- **文型**: SV（受動態）

### 文2: "In the case of an external stage, a directory table's metadata can also be automatically refreshed using cloud provider event notification services with AUTO_REFRESH = true configuration."

- **主語 (S)**: a directory table's metadata
- **動詞 (V)**: can be refreshed（受動態）
- **修飾語 (M)**: In the case of an external stage / also / automatically / using cloud provider event notification services / with AUTO_REFRESH = true configuration
- **文型**: SV（受動態）
- **注目ポイント**: 「In the case of an external stage」で外部ステージに限定。手動に加え自動更新も可能。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| in the case of | 前置詞句 | ～の場合に | In the case of an external stage. |
| manually | 副詞 | 手動で | Metadata can be manually refreshed. |
| automatically | 副詞 | 自動的に | Also automatically refreshed using notifications. |

## 3-3. 解説文（日本語）

> ディレクトリテーブルのメタデータは手動で更新できます。
>
> `ALTER STAGE <stage-name> REFRESH;`
>
> 外部ステージの場合、クラウドプロバイダーのイベント通知サービスと `AUTO_REFRESH = TRUE` の設定を使用して、ディレクトリテーブルのメタデータを自動的に更新することもできます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
