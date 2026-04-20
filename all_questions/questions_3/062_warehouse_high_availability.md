# 062: Warehouse High Availability

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-16
**正答**: C, D

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| High Availability（高可用性） | システムが障害時にもサービスを継続できる能力。Snowflakeは各レイヤーで異なるHA戦略を採用 |
| Availability Zone (AZ) | クラウドプロバイダーの物理的に分離されたデータセンター群。Snowflakeのストレージ・Cloud Servicesは3AZに複製されるが、コンピュートは通常1AZで動作 |
| Compute Instance（コンピュートインスタンス） | 仮想ウェアハウスを構成する個々のサーバーノード。障害時にSnowflakeが自動で交換する |
| Cloud Services Layer | Snowflakeの3層アーキテクチャの最上位。認証・メタデータ管理・クエリ最適化を担う。ウェアハウスの再プロビジョニングもこのレイヤーが実行 |

## 1-2. 重要コンセプトまとめ

- **コンピュート層（VW）は複製されない** — データを永続的に保存しないため、レプリケーション不要
- ウェアハウスは通常**単一のAZ**で動作する（3AZに複製はされない）
- 障害時の2つのHA機能:
  1. **コンピュートインスタンスの自動交換**: VW内のノードが故障しても自動で置き換え、クエリは中断されない
  2. **AZ障害時の再プロビジョニング**: Cloud Services LayerがVWを別のAZに再構築できる
- テーブルデータが破損する心配はない（ストレージは別レイヤーで3AZ複製済み）
- 「3AZに複製」はストレージとCloud Servicesの話であり、コンピュートの話ではない

## 1-3. 公式ドキュメントURL

- [Snowflake High Availability for Data Apps (Whitepaper)](https://developers.snowflake.com/wp-content/uploads/2021/06/Snowflake-High-Availability-for-Data-Apps-Whitepaper.pdf)

---

## 2-1. 問題文（英語）

> Which of the following statements are true regarding Snowflake virtual warehouse's high availability?
>
> Select all that apply.
>
> A. Snowflake replicates virtual warehouses across three availability zones.
> B. A failed virtual warehouse will result in corrupted data in tables.
> C. Snowflake can provision Virtual Warehouses in a different availability zone if required.
> D. Snowflake will automatically replace failed compute instances within a virtual warehouse without causing disruptions.

## 2-2. 問題文の文法解析

### 文1: "Which of the following statements are true regarding Snowflake virtual warehouse's high availability?"

- **主語 (S)**: Which of the following statements
- **動詞 (V)**: are
- **補語 (C)**: true
- **修飾語 (M)**: regarding Snowflake virtual warehouse's high availability（前置詞句）
- **文型**: SVC
- **注目ポイント**: 「regarding ~」で話題を限定。「virtual warehouse's high availability」で所有格を使い、VWの高可用性に焦点を当てる。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| high availability | 名詞句 | 高可用性 | Snowflake ensures high availability of data. |
| replicate | 動詞 | 複製する | Data is replicated across three AZs. |
| provision | 動詞 | プロビジョニングする、構築する | Snowflake can provision warehouses in a different AZ. |
| corrupted | 形容詞 | 破損した | A failure will not result in corrupted data. |
| disruption | 名詞 | 中断、障害 | Replace instances without causing disruptions. |

## 2-3. 問題文（日本語）

> Snowflakeの仮想ウェアハウスの高可用性について、正しい記述をすべて選んでください。
>
> A. Snowflakeは仮想ウェアハウスを3つのアベイラビリティゾーンに複製する。
> B. 仮想ウェアハウスの障害はテーブルデータの破損を引き起こす。
> C. Snowflakeは必要に応じて異なるアベイラビリティゾーンに仮想ウェアハウスをプロビジョニングできる。
> D. Snowflakeは仮想ウェアハウス内の故障したコンピュートインスタンスを中断なく自動で交換する。

---

## 3-1. 解説文（英語）

> Snowflake automatically & transparently replaces failed compute instances within a virtual warehouse. This occurs without disruption to any queries.
>
> The compute layer, i.e., the virtual warehouses, is not replicated. The virtual warehouses do not permanently store data and thus don't require replication.
>
> Snowflake typically runs each virtual warehouse in a single availability zone. However, in case of an availability zone failure, Snowflake's cloud services layer can re-provision impacted warehouses in a different availability zone.

## 3-2. 解説文の文法解析

### 文1: "Snowflake automatically & transparently replaces failed compute instances within a virtual warehouse."

- **主語 (S)**: Snowflake
- **動詞 (V)**: replaces
- **目的語 (O)**: failed compute instances
- **修飾語 (M)**: automatically & transparently / within a virtual warehouse
- **文型**: SVO
- **注目ポイント**: 「automatically & transparently」で自動的かつ透過的に行われることを強調。ユーザーが意識する必要がない。

### 文2: "This occurs without disruption to any queries."

- **主語 (S)**: This
- **動詞 (V)**: occurs
- **修飾語 (M)**: without disruption to any queries
- **文型**: SV
- **注目ポイント**: 「without disruption to ~」で「～に対する中断なしに」。

### 文3: "The compute layer, i.e., the virtual warehouses, is not replicated."

- **主語 (S)**: The compute layer（= the virtual warehouses）
- **動詞 (V)**: is not replicated（受動態・否定）
- **文型**: SV（受動態）
- **注目ポイント**: 「i.e.,」で言い換え。コンピュート層 = 仮想ウェアハウスであることを明示。

### 文4: "The virtual warehouses do not permanently store data and thus don't require replication."

- **主語 (S)**: The virtual warehouses
- **動詞 (V)**: do not store ... and don't require
- **目的語 (O)**: data / replication
- **修飾語 (M)**: permanently / thus（結果を示す副詞）
- **文型**: SVO + SVO（等位接続）
- **注目ポイント**: 「thus」で因果関係を示す。データを永続保存しない → レプリケーション不要。

### 文5: "Snowflake typically runs each virtual warehouse in a single availability zone."

- **主語 (S)**: Snowflake
- **動詞 (V)**: runs
- **目的語 (O)**: each virtual warehouse
- **修飾語 (M)**: typically / in a single availability zone
- **文型**: SVO

### 文6: "However, in case of an availability zone failure, Snowflake's cloud services layer can re-provision impacted warehouses in a different availability zone."

- **主語 (S)**: Snowflake's cloud services layer
- **動詞 (V)**: can re-provision
- **目的語 (O)**: impacted warehouses
- **修飾語 (M)**: However / in case of an availability zone failure / in a different availability zone
- **文型**: SVO
- **注目ポイント**: 「in case of ~」で「～の場合に」。「re-provision」で再構築を示す。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| transparently | 副詞 | 透過的に（ユーザーに見えない形で） | Instances are transparently replaced. |
| i.e. | 略語 | すなわち（id est） | The compute layer, i.e., virtual warehouses. |
| permanently | 副詞 | 永続的に | Warehouses do not permanently store data. |
| thus | 副詞 | したがって | Thus, replication is not required. |
| in case of | 前置詞句 | ～の場合に | In case of an AZ failure. |
| re-provision | 動詞 | 再プロビジョニングする | Re-provision warehouses in a different AZ. |
| impacted | 形容詞 | 影響を受けた | Impacted warehouses are re-provisioned. |

## 3-3. 解説文（日本語）

> Snowflakeは、仮想ウェアハウス内の故障したコンピュートインスタンスを自動的かつ透過的に交換します。これはクエリへの中断なしに行われます。
>
> コンピュート層、すなわち仮想ウェアハウスは、レプリケーションされません。仮想ウェアハウスはデータを永続的に保存しないため、レプリケーションを必要としません。
>
> Snowflakeは通常、各仮想ウェアハウスを単一のアベイラビリティゾーンで実行します。ただし、アベイラビリティゾーンの障害が発生した場合、Snowflakeのクラウドサービスレイヤーは影響を受けたウェアハウスを異なるアベイラビリティゾーンに再プロビジョニングできます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
