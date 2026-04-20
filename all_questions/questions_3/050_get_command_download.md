# 050: GET Command Download

**SnowPro Core Domain**: Domain 3 — Data Loading, Unloading, and Connectivity
**作成日**: 2026-04-15
**正答**: GET

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| GET Command | 内部ステージからオンプレミスシステムにファイルを**ダウンロード**するコマンド |
| PUT Command | オンプレミスから内部ステージにファイルを**アップロード**するコマンド。GETの逆方向 |
| COPY Command | ステージとテーブル間でデータをロード/アンロードするコマンド。GET/PUTとは異なる |

## 1-2. 重要コンセプトまとめ

- **GET** = 内部ステージ → オンプレミスに**ダウンロード**
- **PUT** = オンプレミス → 内部ステージに**アップロード**
- **COPY** = ステージ ↔ テーブル間のデータロード/アンロード（GETとは別）
- 外部ステージにはGET/PUT不可 → クラウドプロバイダーのツールを使用

## 1-3. 公式ドキュメントURL

- [Bulk Unloading Process](https://docs.snowflake.com/en/user-guide/data-unload-overview#bulk-unloading-process)

---

## 2-1. 問題文（英語）

> Which command can be used to download data from an internal stage to an on-premises system?
>
> A. COPY
> B. VALIDATE
> C. GET
> D. PUT

## 2-2. 問題文の文法解析

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| download | verb | ダウンロードする | Download data from an internal stage. |
| on-premises system | noun | オンプレミスシステム | Download to an on-premises system. |

## 2-3. 問題文（日本語）

> 内部ステージからオンプレミスシステムにデータをダウンロードするコマンドは？

---

## 3-1. 解説文（英語）

> The GET command is used to download data from an internal stage to an on-premises system. The PUT command uploads data from an on-premises system to an internal stage. To download or upload data to an external stage, cloud provider utilities or other tools are used to interact with data in the cloud storage pointed to by the external stage.

## 3-3. 解説文（日本語）

> GETコマンドは内部ステージからオンプレミスシステムにデータをダウンロードするために使用します。PUTコマンドはオンプレミスから内部ステージにアップロードします。外部ステージとのやり取りにはクラウドプロバイダーのツールを使用します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
