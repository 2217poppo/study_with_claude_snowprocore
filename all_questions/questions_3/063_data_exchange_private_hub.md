# 063: Data Exchange Private Hub

**SnowPro Core Domain**: Domain 5 — Data Collaboration
**作成日**: 2026-04-16
**正答**: B

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Data Exchange（データエクスチェンジ） | 招待制のプライベートハブ。少数の組織間でデータを共有するためのプラットフォーム。オーナーがメンバーを招待し、共有・消費の権限を制御する |
| Snowflake Marketplace | パブリックなデータマーケットプレイス。誰でもデータセットの提供・取得が可能。Data Exchangeとは異なりオープンな場 |
| Data Sharing（データ共有） | Snowflakeアカウント間でデータを共有する仕組み。データのコピーは発生せず、プロバイダーのストレージを直接参照する |
| Provider（プロバイダー） | データを共有する側のアカウント |
| Consumer（コンシューマー） | 共有データを利用する側のアカウント |

## 1-2. 重要コンセプトまとめ

- Data Exchangeは**プライベートな招待制ハブ**（少人数・組織向け）
- Snowflake Marketplaceは**パブリックなマーケットプレイス**（不特定多数向け）
- Data Exchangeの**オーナー**がメンバーを招待し、共有・消費の権限を指定
- データのコピーや転送ではない（Snowflakeのデータ共有と同じく実データのコピー不要）
- OneDriveストレージやメール送信とは無関係
- COPYコマンドによるデータ転送とも無関係

## 1-3. 公式ドキュメントURL

- [Data Exchange](https://docs.snowflake.com/en/user-guide/data-exchange)

---

## 2-1. 問題文（英語）

> Which of the following correctly describes Data Exchange?
>
> A. Data Exchange is another name for One Drive storage which can be used to share Snowflake data.
> B. Data Exchange is your own private hub for sharing data with a small group of people or organizations you invite.
> C. Data Exchange transfers data from on-premise to a Snowflake cloud storage using the COPY command.
> D. Data Exchange is a mechanism to email data extracts from a Snowflake table securely.

## 2-2. 問題文の文法解析

### 文1: "Which of the following correctly describes Data Exchange?"

- **主語 (S)**: Which of the following
- **動詞 (V)**: correctly describes
- **目的語 (O)**: Data Exchange
- **文型**: SVO
- **注目ポイント**: 「correctly describes」で正確な説明を1つ選ばせるパターン。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| correctly | 副詞 | 正しく | Which correctly describes the feature? |
| private hub | 名詞句 | プライベートなハブ（拠点） | Data Exchange is a private hub for sharing data. |
| mechanism | 名詞 | 仕組み、メカニズム | A mechanism to securely share data. |
| on-premise | 形容詞 | オンプレミスの（自社設備内の） | Transfer data from on-premise to cloud. |
| extract | 名詞 | 抽出データ | Email data extracts from a table. |

## 2-3. 問題文（日本語）

> 以下のうち、Data Exchangeを正しく説明しているのはどれですか？
>
> A. Data ExchangeはOneDriveストレージの別名で、Snowflakeデータの共有に使用できる。
> B. Data Exchangeは、招待した少数の人々や組織とデータを共有するための自分専用のプライベートハブである。
> C. Data ExchangeはCOPYコマンドを使用してオンプレミスからSnowflakeクラウドストレージにデータを転送する。
> D. Data ExchangeはSnowflakeテーブルからデータ抽出物を安全にメールで送信する仕組みである。

---

## 3-1. 解説文（英語）

> Data Exchange is your own private hub for sharing data with a small group of people or organizations who have been invited to join. The owner of the Data Exchange account is in charge of inviting members and specifying whether they can share, consume, or do both. https://docs.snowflake.com/en/user-guide/data-exchange

## 3-2. 解説文の文法解析

### 文1: "Data Exchange is your own private hub for sharing data with a small group of people or organizations who have been invited to join."

- **主語 (S)**: Data Exchange
- **動詞 (V)**: is
- **補語 (C)**: your own private hub
- **修飾語 (M)**: for sharing data（目的）/ with a small group of people or organizations（共有相手）/ who have been invited to join（関係詞節 — 招待された人々）
- **文型**: SVC
- **注目ポイント**: 「who have been invited to join」は現在完了受動態の関係詞節で、参加するよう招待された人々に限定。「your own」で個人・組織固有のものであることを強調。

### 文2: "The owner of the Data Exchange account is in charge of inviting members and specifying whether they can share, consume, or do both."

- **主語 (S)**: The owner of the Data Exchange account
- **動詞 (V)**: is
- **補語 (C)**: in charge of inviting members and specifying ...
- **修飾語 (M)**: whether they can share, consume, or do both（間接疑問節 — 名詞節）
- **文型**: SVC
- **注目ポイント**: 「is in charge of + 動名詞」で「～する責任がある」。「whether ~ or ~」で選択肢を提示。「share, consume, or do both」の3択構造。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| hub | 名詞 | ハブ（中心拠点） | A private hub for data sharing. |
| be in charge of | 動詞句 | ～を担当する、責任がある | The owner is in charge of inviting members. |
| specify | 動詞 | 指定する | Specify whether they can share or consume. |
| consume | 動詞 | 消費する（データを利用する） | Members can share, consume, or do both. |
| have been invited | 現在完了受動態 | 招待されている | Organizations who have been invited to join. |

## 3-3. 解説文（日本語）

> Data Exchangeは、参加するよう招待された少数の人々や組織とデータを共有するための、自分専用のプライベートハブです。Data Exchangeアカウントのオーナーは、メンバーの招待と、メンバーがデータの共有・消費・またはその両方を行えるかどうかの指定を担当します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
