# 118: Failover/Failback — Supported Snowflake Editions

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-06
**正答**: Business Critical / Virtual Private Snowflake
**ユーザー回答**: Business Critical ✅（正解）を選択、Virtual Private Snowflake を見落とし。誤って Enterprise と Standard を選択

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Database Failover（データベースフェイルオーバー） | プライマリアカウントに障害が発生した際、別のSnowflakeアカウントに処理を引き継ぐ機能。**Business Critical以上**のエディションで利用可能 |
| Database Failback（データベースフェイルバック） | フェイルオーバー後、障害が復旧したプライマリアカウントに処理を戻す機能。フェイルオーバーとセットで提供される |
| Business Continuity（事業継続性） | 障害・災害発生時もビジネス運用を継続できる能力。フェイルオーバー/フェイルバック機能が支える |
| Disaster Recovery（障害復旧） | 自然災害・システム障害・データ消失などから業務システムを復旧させる計画・仕組み。Snowflakeではフェイルオーバー/フェイルバックが中心機能 |

## 1-2. 重要コンセプトまとめ

- **正解: Business Critical と Virtual Private Snowflake (VPS)** の2エディションのみ
- **ユーザーの誤り**:
  - Enterprise → フェイルオーバー/フェイルバック機能なし（Time Travel最大90日・Multi-Cluster WHなどは含む）
  - Standard → 基本機能のみ。フェイルオーバー非対応
- **エディション別 Failover/Failback 対応**:

| エディション | Failover/Failback | 備考 |
|-------------|-------------------|------|
| Standard | ✗ | 非対応 |
| Enterprise | ✗ | 非対応（Time Travel 90日・Multi-Cluster WHは対応） |
| **Business Critical** | **✅** | **最初に提供されるエディション** |
| **Virtual Private Snowflake (VPS)** | **✅** | Business Criticalの全機能＋完全専用環境 |

- **記憶のポイント**: "Business Critical **and above**" という表現が試験によく出る。VPSはBusiness Criticalより上位なので当然含まれる
- **「select all that apply」問題の罠**: Business Criticalだけ選んでVPSを忘れがち。上位エディションは下位の全機能を含むため、Business Criticalで使える機能はVPSでも使える

## 1-3. 公式ドキュメントURL

- [Snowflake Editions](https://docs.snowflake.com/en/user-guide/intro-editions.html)

---

## 2-1. 問題文（英語）

> Which of the following Snowflake editions support database failover and failback between Snowflake accounts, thus providing business continuity and disaster recovery? Select all that apply.
>
> A. Business Critical ✅
> B. Virtual Private Snowflake ✅
> C. Enterprise
> D. Standard

## 2-2. 問題文の文法解析

### 文1: "Which of the following Snowflake editions support database failover and failback between Snowflake accounts, thus providing business continuity and disaster recovery?"

- **主語 (S)**: Which of the following Snowflake editions
- **動詞 (V)**: support
- **目的語 (O)**: database failover and failback between Snowflake accounts
- **付帯状況**: thus providing business continuity and disaster recovery
- **文型**: SVO
- **注目ポイント**:
  - **"Which of the following ~ support"**: 「以下の〜のうちどれが〜をサポートするか」。`Which of the following`（以下のうちどれが）は試験問題の定番構文。主語が複数形なので `support`（三単現のsなし）になる
  - **"database failover and failback"**: 「データベースフェイルオーバーとフェイルバック」。`failover`（障害時の切り替え）と `failback`（復旧後の切り戻し）は必ずセットで出題される
  - **"between Snowflake accounts"**: 「Snowflakeアカウント間で」。フェイルオーバーは**同一アカウント内**ではなく、別アカウントへの引き継ぎであることを示す
  - **", thus providing ~"**: 「そのため〜を提供する（ことになる）」。`thus + 現在分詞`（付帯状況）で「その結果〜となる」を示す。前の動作の帰結・効果を分詞構文で追加する用法

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| failover | 名詞 | フェイルオーバー・障害時の系切り替え | Database failover is supported in Business Critical edition. |
| failback | 名詞 | フェイルバック・復旧後の系切り戻し | Failover and failback work together for disaster recovery. |
| business continuity | 名詞句 | 事業継続性・BCP | Failover enables business continuity during outages. |
| disaster recovery | 名詞句 | 障害復旧・DR | Disaster recovery requires failover capabilities. |

## 2-3. 問題文（日本語）

> 以下のSnowflakeエディションのうち、Snowflakeアカウント間のデータベースフェイルオーバーとフェイルバックをサポートし、事業継続性と障害復旧を提供するものはどれか？あてはまるものをすべて選べ。
>
> A. Business Critical ✅
> B. Virtual Private Snowflake ✅
> C. Enterprise
> D. Standard

---

## 3-1. 解説文（英語）

> Database failover and failback between Snowflake accounts are provided first in the Business Critical edition and are also available in the virtual private Snowflake (VPS) edition.

## 3-2. 解説文の文法解析

### 文1: "Database failover and failback between Snowflake accounts are provided first in the Business Critical edition and are also available in the virtual private Snowflake (VPS) edition."

- **主語 (S)**: Database failover and failback between Snowflake accounts
- **動詞 (V1)**: are provided（受動態）
- **修飾語 (M1)**: first in the Business Critical edition
- **接続**: and
- **動詞 (V2)**: are also available
- **修飾語 (M2)**: in the virtual private Snowflake (VPS) edition
- **文型**: SV（受動態）& SVC（形容詞補語）の並列
- **注目ポイント**:
  - **"are provided first in ~"**: 「〜で最初に提供される」。`first`（最初に）が「Business Criticalが最初のエディション」つまり「これ以上下のエディションには含まれない」を示す。試験では "provided first in Business Critical" の `first` が重要なキーワード
  - **"and are also available in ~"**: 「そして〜でも利用可能である」。`also available in`（〜でも利用可能）でVPSも同様に対応していることを追加する。VPSはBusiness Criticalの上位エディションなので機能を継承している
  - **"virtual private Snowflake (VPS)"**: 括弧内で略称を示す。試験では `Virtual Private Snowflake` と `VPS` のどちらの表記でも登場するため両方認識する

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| provided first in ~ | 受動態+副詞 | 〜で最初に提供される | This feature is provided first in the Business Critical edition. |
| are also available in ~ | 形容詞述語 | 〜でも利用可能である | The feature is also available in the VPS edition. |

## 3-3. 解説文（日本語）

> Snowflakeアカウント間のデータベースフェイルオーバーとフェイルバックは、Business Criticalエディションで最初に提供され、Virtual Private Snowflake（VPS）エディションでも利用可能です。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
