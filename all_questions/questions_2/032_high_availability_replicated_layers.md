# 032: High Availability — Replicated Layers

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-12
**正答**: A（Cloud Services Layer）, C（Storage Layer）
**ユーザー回答**: A, C — 正解

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| High Availability（高可用性） | システム障害が発生してもサービスが継続できる設計。Snowflakeは特定のレイヤーを複数のアベイラビリティゾーンにレプリケーションすることで高可用性を実現する |
| Availability Zone（アベイラビリティゾーン / AZ） | クラウドプロバイダー（AWS/Azure/GCP）が提供する物理的に分離されたデータセンター群。Snowflakeは**少なくとも3つのAZ**にデータをレプリケーションする |
| Cloud Services Layer（クラウドサービスレイヤー） | Snowflake 3層アーキテクチャの最上層。メタデータ管理・認証・クエリプラン生成等を担当。**3つのAZにレプリケーション**される |
| Storage Layer（ストレージレイヤー） | Snowflake 3層アーキテクチャの最下層。クラウドプロバイダーのBlobストア（S3/Azure Blob/GCS）にデータを保存。**複数のディスクデバイスおよび少なくとも3つのAZに同期レプリケーション**される |
| Compute Layer（コンピュートレイヤー） | 仮想ウェアハウスで構成される中間層。**レプリケーションされない**。ただし、必要に応じて別のAZでコンピュートインスタンスを起動できる |
| Replication（レプリケーション） | データやサービスを複数の場所にコピーして冗長性を確保すること。障害時のデータ損失やサービス停止を防ぐ |
| Synchronous Replication（同期レプリケーション） | データの書き込みが完了する前に、複数の場所にコピーが完了することを保証するレプリケーション方式。Storage Layerで採用 |

## 1-2. 重要コンセプトまとめ

- **レプリケーションされる2つのレイヤー**:
  1. **Cloud Services Layer** — メタデータストレージが3つのAZにレプリケーション
  2. **Storage Layer** — Blobストアが複数ディスク＋少なくとも3つのAZに同期レプリケーション

- **レプリケーションされないレイヤー**:
  - ❌ **Compute Layer**（仮想ウェアハウス）— レプリケーションされない。ただし必要時に別のAZでインスタンスを起動可能

- **3層アーキテクチャとレプリケーションの整理**:

| レイヤー | レプリケーション | AZ数 | 方式 |
|---------|----------------|------|------|
| **Cloud Services** | **あり** | 3 AZ | デプロイ＋レプリケーション |
| **Storage** | **あり** | 3+ AZ | 同期レプリケーション |
| **Compute** | **なし** | — | 必要時に別AZで起動可能 |

- **誤答の整理**:
  - ❌ Partner Layer — Snowflakeのアーキテクチャに存在しない
  - ❌ On-Premises storage — Snowflakeはクラウドネイティブ。オンプレミスストレージはない
  - ❌ Compute Layer — レプリケーションされない（上記参照）

- **「transparent to the users」**: ストレージのレプリケーションはユーザーに透明（意識する必要がない）
- **試験ポイント**: 「高可用性のためにレプリケーションされるレイヤーは？」→ **Cloud Services + Storage** の2つ

## 1-3. 公式ドキュメントURL

- [Snowflake High Availability Whitepaper](https://developers.snowflake.com/wp-content/uploads/2021/06/Snowflake-High-Availability-for-Data-Apps-Whitepaper.pdf)
- [Snowflake Architecture](https://docs.snowflake.com/en/user-guide/intro-key-concepts#snowflake-architecture)

---

## 2-1. 問題文（英語）

> Which of the following two layers are replicated by Snowflake to ensure high availability?
>
> Select all that apply.
>
> A. Cloud Services Layer
> B. Partner Layer
> C. Storage Layer
> D. On-Premises storage
> E. Compute Layer

## 2-2. 問題文の文法解析

### 文1: "Which of the following two layers are replicated by Snowflake to ensure high availability?"

- **疑問詞+主語 (S)**: Which of the following two layers（次の2つのレイヤーのうちどれが）
- **動詞 (V)**: are replicated（レプリケーションされるか）— 受動態
- **動作主 (M1)**: by Snowflake（Snowflakeによって）
- **目的 (M2)**: to ensure high availability（高可用性を確保するために）
- **文型**: SV（受動態・疑問文）
- **注目ポイント**:
  - `to ensure ~` — 「〜を確保するために」。目的を示す不定詞
  - `the following two` — 「次の2つの」。正解数のヒントが問題文に含まれている

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| replicate | verb | レプリケーションする、複製する | Snowflake replicates the storage layer across 3 AZs. |
| high availability | noun phrase | 高可用性 | Replication ensures high availability. |
| availability zone | noun phrase | アベイラビリティゾーン | Data is replicated across at least three availability zones. |
| spin up | phrasal verb | 起動する、立ち上げる | Snowflake can spin up compute in a different AZ. |

## 2-3. 問題文（日本語）

> 高可用性を確保するためにSnowflakeがレプリケーションする2つのレイヤーは、次のうちどれですか？
>
> 該当するものをすべて選択してください。
>
> A. Cloud Services Layer
> B. Partner Layer
> C. Storage Layer
> D. On-Premises storage
> E. Compute Layer

---

## 3-1. 解説文（英語）

> Snowflake automatically replicates the cloud services layer & the storage layer across three availability zones. The storage layer, which uses cloud providers' blob stores, is replicated synchronously across multiple disk devices and at least three availability zones, transparent to the users.
>
> Similarly, the cloud services layer, primarily composed of the metadata storage system, is deployed, and replicated across 3 availability zones.
>
> The compute layer, i.e., the virtual warehouses, is not replicated, although Snowflake can spin up compute instances in a different availability zone if required.

## 3-2. 解説文の文法解析

### 文1: "Snowflake automatically replicates the cloud services layer & the storage layer across three availability zones."

- **主語 (S)**: Snowflake
- **副詞 (M)**: automatically（自動的に）
- **動詞 (V)**: replicates（レプリケーションする）
- **目的語 (O)**: the cloud services layer & the storage layer（クラウドサービスレイヤーとストレージレイヤーを）
- **修飾語 (M)**: across three availability zones（3つのアベイラビリティゾーンにわたって）
- **文型**: SVO

### 文2: "The storage layer, which uses cloud providers' blob stores, is replicated synchronously across multiple disk devices and at least three availability zones, transparent to the users."

- **主語 (S)**: The storage layer（ストレージレイヤーは）
- **非制限関係詞節**: which uses cloud providers' blob stores（クラウドプロバイダーのBlobストアを使用する）
- **動詞 (V)**: is replicated（レプリケーションされる）— 受動態
- **副詞 (M1)**: synchronously（同期的に）
- **修飾語 (M2)**: across multiple disk devices and at least three availability zones（複数ディスクおよび少なくとも3つのAZにわたって）
- **付帯 (M3)**: transparent to the users（ユーザーに透明な形で）
- **文型**: SV（受動態）
- **注目ポイント**: `synchronously` — 同期レプリケーション。`at least three` — 最低3つのAZ

### 文3: "The compute layer, i.e., the virtual warehouses, is not replicated, although Snowflake can spin up compute instances in a different availability zone if required."

- **主語 (S)**: The compute layer（コンピュートレイヤーは）
- **同格**: i.e., the virtual warehouses（すなわち仮想ウェアハウス）
- **動詞 (V)**: is not replicated（レプリケーションされない）— 否定の受動態
- **譲歩節 (M)**: although Snowflake can spin up compute instances in a different availability zone if required（ただし必要に応じて別のAZでインスタンスを起動できる）
- **文型**: SV（受動態）+ although譲歩節
- **注目ポイント**: `spin up` — 「起動する」。クラウドインフラの文脈で頻出の句動詞

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| synchronously | adv | 同期的に | Storage is replicated synchronously across AZs. |
| blob store | noun phrase | Blobストア（S3/Azure Blob等） | The storage layer uses cloud providers' blob stores. |
| spin up | phrasal verb | 起動する | Snowflake can spin up instances in a different AZ. |
| primarily composed of ~ | adj phrase | 主に〜で構成される | The cloud services layer is primarily composed of metadata storage. |

## 3-3. 解説文（日本語）

> Snowflakeはクラウドサービスレイヤーとストレージレイヤーを3つのアベイラビリティゾーンにわたって自動的にレプリケーションします。ストレージレイヤーはクラウドプロバイダーのBlobストアを使用しており、複数のディスクデバイスおよび少なくとも3つのアベイラビリティゾーンにわたって同期レプリケーションされます。これはユーザーに透明な形で行われます。
>
> 同様に、クラウドサービスレイヤーは主にメタデータストレージシステムで構成されており、3つのアベイラビリティゾーンにデプロイ・レプリケーションされます。
>
> コンピュートレイヤー（すなわち仮想ウェアハウス）はレプリケーションされません。ただし、Snowflakeは必要に応じて別のアベイラビリティゾーンでコンピュートインスタンスを起動できます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
