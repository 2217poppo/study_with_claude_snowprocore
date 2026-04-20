# 099: Snowflake Cloud Only

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-14
**正答**: False

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Cloud-Native | クラウド環境専用に設計されたアーキテクチャ。Snowflakeはクラウドネイティブでオンプレミスインストール不可 |
| On-Premises（オンプレミス） | 自社サーバーにソフトウェアをインストール・運用する形態。Snowflakeは非対応 |
| Cloud Providers | Snowflakeが利用可能なクラウド: **AWS, Azure, GCP** の3つのみ |

## 1-2. 重要コンセプトまとめ

- Snowflakeは**クラウド専用**（クラウドネイティブ）
- **オンプレミスインストールは不可能**（False）
- 利用可能なクラウド: **AWS, Azure, GCP** の3つ
- Snowflakeは「engineered for the cloud」（クラウド向けに設計された）

## 1-3. 公式ドキュメントURL

- [Snowflake Editions](https://docs.snowflake.com/en/user-guide/intro-editions)

---

## 2-1. 問題文（英語）

> True or False: Snowflake is available to be installed on-premises servers.
>
> A. False
> B. True

## 2-2. 問題文の文法解析

### 文1: "Snowflake is available to be installed on-premises servers."

- **注目ポイント**: `available to be installed` は「インストール可能」。`on-premises` は「オンプレミスの」。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| on-premises | adjective | オンプレミスの | Not available on-premises. |
| engineered for the cloud | phrase | クラウド向けに設計された | Snowflake is engineered for the cloud. |

## 2-3. 問題文（日本語）

> 真/偽: Snowflakeはオンプレミスサーバーにインストールして利用できる。

---

## 3-1. 解説文（英語）

> False. Snowflake is engineered for the cloud and is available only on AWS, Azure & GCP.

## 3-3. 解説文（日本語）

> 偽。Snowflakeはクラウド向けに設計されており、AWS、Azure、GCPでのみ利用可能です。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
