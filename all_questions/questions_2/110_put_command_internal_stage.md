# 110: PUT Command Internal Stage

**SnowPro Core Domain**: Domain 3 — Data Loading, Unloading, and Connectivity
**作成日**: 2026-04-14
**正答**: Transfer data into a Snowflake internal stage.

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| PUT Command | オンプレミスシステムからSnowflakeの**内部ステージ**にファイルをアップロードするコマンド。外部ステージには使用不可 |
| GET Command | 内部ステージからオンプレミスシステムにファイルをダウンロードするコマンド。PUTの逆方向 |
| Internal Stage | Snowflake内部のファイル保管場所。PUT/GETコマンドの対象 |
| External Stage | 外部クラウドストレージ（S3等）への参照。クラウドプロバイダーのツールでデータ操作 |

## 1-2. 重要コンセプトまとめ

- PUTコマンド = **オンプレミス → 内部ステージ** へのアップロード
- GETコマンド = **内部ステージ → オンプレミス** へのダウンロード
- **外部ステージにはPUT/GETは使えない** → クラウドプロバイダーのツール（aws s3 cp等）を使用
- ひっかけ: 「on-premise → cloud object storage」は不正解（PUTの宛先はinternal stageであって直接のcloud storageではない）

## 1-3. 公式ドキュメントURL

- [Bulk Unloading Process](https://docs.snowflake.com/en/user-guide/data-unload-overview#bulk-unloading-process)

---

## 2-1. 問題文（英語）

> What is the PUT command used for?
>
> A. Transfer data into a Snowflake internal stage.
> B. Transfer data from on-premise storage to cloud object storage.
> C. Transfer data into a Snowflake external stage.
> D. Transfer data from cloud object storage to on-premise storage.

## 2-2. 問題文の文法解析

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| upload | verb | アップロードする | PUT uploads data to an internal stage. |
| download | verb | ダウンロードする | GET downloads data from an internal stage. |
| cloud provider utilities | noun | クラウドプロバイダーのツール | Use cloud provider utilities for external stages. |

## 2-3. 問題文（日本語）

> PUTコマンドは何に使用されますか？

---

## 3-1. 解説文（英語）

> The PUT command uploads data from an on-premises system to an internal stage. The GET command is used to download data from an internal stage to an on-premises system. To download or upload data to an external stage, cloud provider utilities or other tools are used to interact with data in the cloud storage pointed to by the external stage.

## 3-3. 解説文（日本語）

> PUTコマンドはオンプレミスシステムから内部ステージにデータをアップロードします。GETコマンドは内部ステージからオンプレミスシステムにデータをダウンロードします。外部ステージとのデータのやり取りには、外部ステージが参照するクラウドストレージと対話するクラウドプロバイダーのツール等を使用します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
