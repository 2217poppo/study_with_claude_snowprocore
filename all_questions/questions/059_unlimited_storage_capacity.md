# 059: Storage Capacity — Virtually Unlimited via Cloud Storage

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-03
**正答**: True（クラウドストレージを使うためストレージ容量は事実上無制限）

> 関連問題: 025（Hybrid Architecture）・026（Proprietary Storage Format）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Virtually Unlimited（事実上無制限） | 技術的な上限は存在するが、実用上はユーザーが気にする必要がない規模であること。Snowflakeのストレージはクラウドプロバイダーのインフラに依存するため、この表現が使われる |
| Underlying Storage Mechanism（基盤となるストレージの仕組み） | Snowflakeのデータ保存に使われるクラウドオブジェクトストレージ（S3・Azure Blob・GCS）のこと。Snowflakeはこの上に構築されている |
| Cloud-based Storage（クラウドベースストレージ） | Amazon S3・Azure Blob Storage・Google Cloud Storageなどのクラウドオブジェクトストレージ。物理的なハードウェア制限を意識せずに利用できる |
| Storage Layer（ストレージレイヤー） | Snowflakeの3層アーキテクチャの最下層。クラウドオブジェクトストレージでデータを保持する |

## 1-2. 重要コンセプトまとめ

- **なぜ「事実上無制限」か**:
  - Snowflakeのストレージ = AWS S3 / Azure Blob / GCS などのクラウドオブジェクトストレージ
  - クラウドオブジェクトストレージは必要に応じて自動拡張されるため、ユーザーが容量を事前に確保する必要がない
  - → 従来のオンプレミスDBのように「ディスクが足りなくなる」という問題が発生しない

- **「virtually（事実上）」という言葉に注意**:
  - 物理的に絶対無制限というわけではない（技術的上限はある）
  - しかし**実用上はユーザーが制限を気にする必要がない**という意味でTrue
  - 試験では `virtually unlimited` = True として扱う

- **Snowflakeのストレージとコンピュートの分離**（アーキテクチャの核心）:
  - ストレージ層 ← クラウドオブジェクトストレージ（事実上無制限・従量課金）
  - コンピュート層 ← 仮想ウェアハウス（独立・別課金）
  - → 「ストレージとコンピュートの分離」がSnowflakeの設計思想

## 1-3. 公式ドキュメントURL

- [Snowflake Architecture Overview](https://docs.snowflake.com/en/user-guide/intro-key-concepts)

---

## 2-1. 問題文（英語）

> True/False: The storage capacity of your Snowflake-based data warehouse is virtually unlimited because it uses cloud storage as the underlying storage mechanism.
>
> A. True
> B. False

## 2-2. 問題文の文法解析

### 文1: "The storage capacity of your Snowflake-based data warehouse is virtually unlimited because it uses cloud storage as the underlying storage mechanism."

- **主語 (S)**: The storage capacity of your Snowflake-based data warehouse（Snowflakeベースのデータウェアハウスのストレージ容量は）
- **動詞 (V)**: is（〜である）
- **補語 (C)**: virtually unlimited（事実上無制限である）
- **理由節**: because it uses cloud storage as the underlying storage mechanism（クラウドストレージを基盤ストレージの仕組みとして使っているため）
- **注目ポイント1**: `Snowflake-based` = 「Snowflakeを基盤とした」。ハイフンで結んだ複合形容詞
- **注目ポイント2**: `as the underlying storage mechanism` = 「基盤となるストレージの仕組みとして」。`as` + 名詞で役割・機能を示す
- **注目ポイント3**: `virtually unlimited` = 「事実上無制限」。`virtually` = 「実質的に・事実上」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| virtually | 副詞 | 事実上・実質的に | Storage is virtually unlimited in Snowflake. |
| unlimited | 形容詞 | 無制限の | The capacity is virtually unlimited. |
| underlying | 形容詞 | 基盤となる・根底にある | Cloud storage is the underlying mechanism. |
| mechanism | 名詞 | 仕組み・メカニズム | The underlying storage mechanism is cloud-based. |
| Snowflake-based | 複合形容詞 | Snowflakeを基盤とした | A Snowflake-based data warehouse. |

## 2-3. 問題文（日本語）

> 正しい（True）か誤り（False）か：Snowflakeを基盤とするデータウェアハウスのストレージ容量は、クラウドストレージを基盤ストレージの仕組みとして使用しているため、事実上無制限である。
>
> A. True
> B. False

---

## 3-1. 解説文（英語）

> Since Snowflake uses cloud-based storage like Amazon S3 or Azure Blob storage, the amount of space available to Snowflake is virtually unlimited.

## 3-2. 解説文の文法解析

### 文1: "Since Snowflake uses cloud-based storage like Amazon S3 or Azure Blob storage, the amount of space available to Snowflake is virtually unlimited."

- **理由節**: Since Snowflake uses cloud-based storage like Amazon S3 or Azure Blob storage（SnowflakeがAmazon S3やAzure Blobストレージのようなクラウドベースストレージを使うため）← `since` = 「〜なので・〜のため」
- **主語 (S)**: the amount of space available to Snowflake（Snowflakeが利用可能なスペースの量は）← `available to ~` = 「〜が利用可能な」
- **動詞 (V)**: is
- **補語 (C)**: virtually unlimited（事実上無制限）
- **注目ポイント**: `the amount of space available to ~` = 「〜が利用可能なスペースの量」。`available to Snowflake` は `space` を後置修飾

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| since | 接続詞 | 〜なので・〜のため（= because） | Since it uses cloud storage, capacity is unlimited. |
| cloud-based | 複合形容詞 | クラウドベースの | Snowflake uses cloud-based storage. |
| the amount of ~ available to | 名詞句 | 〜が利用可能な量 | The amount of space available to Snowflake is unlimited. |
| like ~ | 前置詞 | 〜のような | Cloud storage like S3 or Azure Blob. |

## 3-3. 解説文（日本語）

> SnowflakeはAmazon S3やAzure Blobストレージのようなクラウドベースのストレージを使用しているため、Snowflakeが利用できるスペースの量は事実上無制限です。

---

## 復習メモ

- [ ] Snowflakeのストレージが「事実上無制限」な理由（クラウドオブジェクトストレージ使用）を説明できる
- [ ] `virtually unlimited` = True として扱う（完全な無制限ではないが実用上そう）を理解した
- [ ] ストレージとコンピュートが分離されていることを確認した
- [ ] `virtually`・`underlying`・`Snowflake-based`（複合形容詞）の英語を確認した
- [ ] この問題は理論問題のためサンドボックス検証は不要
