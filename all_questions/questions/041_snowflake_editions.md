# 041: Snowflake Editions — Dedicated Metadata Store (VPS)

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-02
**正答**: A（Virtual Private Snowflake）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Virtual Private Snowflake (VPS) | Snowflakeの最上位エディション。他のすべてのSnowflakeアカウントから完全に分離された、専用のメタデータストアとコンピュートリソースを持つ。最高水準のセキュリティ・プライバシーが必要な組織向け |
| Dedicated Metadata Store（専用メタデータストア） | VPSエディションのみが持つ、他の顧客と共有しない独自のメタデータ管理領域。通常のエディションはメタデータをSnowflake全体で共有するクラウドサービス層で管理する |
| Standard Edition | Snowflakeの基本エディション。Time Travel（最大1日）・基本的なセキュリティ・標準サポートが含まれる |
| Enterprise Edition | Standard の上位。Time Travel 最大90日・Multi-Cluster Warehouse・Materialized View・列レベル/行レベルセキュリティなどが追加される |
| Business Critical Edition | Enterprise の上位。HIPAA/PCI DSS準拠・強化されたセキュリティ・Tri-Secret Secure（お客様管理キー）などが追加される。医療・金融向け |
| Isolation（分離） | VPSの核心概念。他の顧客テナントとリソースを共有しないこと。マルチテナント環境では禁止される業種（政府・防衛等）向け |
| Metadata Store（メタデータストア） | テーブル・スキーマ・クエリ履歴・アクセス制御などのメタデータを管理するストレージ。VPS以外のエディションではSnowflakeの共有クラウドサービス層が担当 |

## 1-2. 重要コンセプトまとめ

- **Snowflakeエディションの階層（低→高）**:
  1. **Standard** — 基本機能
  2. **Enterprise** — Time Travel 90日 / Multi-Cluster WH / MV
  3. **Business Critical** — HIPAA対応 / Tri-Secret Secure / 強化暗号化
  4. **Virtual Private Snowflake (VPS)** — **専用メタデータストア** / **専用コンピュートリソース** / 完全分離

- **専用メタデータストアを持つのはVPSのみ**: Business Critical でも他の顧客と同じメタデータインフラを共有している

- **VPSが必要なユースケース**:
  - 政府機関・防衛産業（マルチテナント禁止の規制）
  - 最高レベルのデータ分離が必要な金融・医療組織

- **引っかけポイント**: Business Critical はセキュリティ強化版だが、「専用メタデータストア」は持たない。VPSとの違いはここ

- **試験キーワード**: "dedicated metadata store" = Virtual Private Snowflake

## 1-3. 公式ドキュメントURL

- [Snowflake Editions](https://docs.snowflake.com/en/user-guide/intro-editions)

---

## 2-1. 問題文（英語）

> What is the minimum Snowflake edition that supports a dedicated metadata store?
>
> A. Virtual Private Snowflake
> B. Business Critical
> C. Standard
> D. Enterprise

## 2-2. 問題文の文法解析

### 文1: "What is the minimum Snowflake edition that supports a dedicated metadata store?"

- **主語 (S)**: What（何が）← 疑問詞
- **動詞 (V)**: is（〜である）
- **補語 (C)**: the minimum Snowflake edition（最低のSnowflakeエディション）← `minimum` = 「最低限の・最小の」。ここでは「その機能を持つ最も低い（最初の）エディション」を意味する
- **修飾語 (M)**: that supports a dedicated metadata store（専用のメタデータストアをサポートする）← 関係代名詞節
- **文型**: SVC（倒置）
- **注目ポイント**:
  - `minimum edition` = 「最小のエディション」= 「その機能を備えた最も下位のエディション」。試験では "minimum" = 最低ラインを問う
  - `dedicated` = 「専用の・他と共有しない」。技術文書で重要な形容詞

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| minimum | 形容詞/名詞 | 最低限の、最小の | What is the minimum edition required for this feature? |
| dedicated | 形容詞 | 専用の（他と共有しない） | VPS has a dedicated metadata store for each customer. |
| metadata store | 名詞句 | メタデータストア（メタデータの管理領域） | The metadata store tracks table schemas and query history. |
| edition | 名詞 | エディション（製品グレード） | The Enterprise edition adds multi-cluster warehouse support. |

## 2-3. 問題文（日本語）

> 専用のメタデータストアをサポートする最低のSnowflakeエディションはどれですか？
>
> A. Virtual Private Snowflake
> B. Business Critical
> C. Standard
> D. Enterprise

---

## 3-1. 解説文（英語）

> The VPS edition is meant to provide isolation from other customers; thus, each instance has its own metadata store and compute resources.

## 3-2. 解説文の文法解析

### 文1: "The VPS edition is meant to provide isolation from other customers; thus, each instance has its own metadata store and compute resources."

**前半: "The VPS edition is meant to provide isolation from other customers"**

- **主語 (S)**: The VPS edition（VPSエディションは）
- **動詞 (V)**: is meant to（〜することを目的とする・意図されている）← `be meant to ~` = 目的・設計意図を示す受動態
- **目的語 (O)**: provide isolation（分離を提供すること）← to不定詞
- **修飾語 (M)**: from other customers（他の顧客から）
- **注目ポイント**: `be meant to ~` = 「〜するために設計されている・〜を目的としている」。製品・機能の設計意図を述べる表現

**後半: "thus, each instance has its own metadata store and compute resources"**

- **接続副詞**: thus（したがって）← セミコロン + thus で前文の論理的帰結を示す
- **主語 (S)**: each instance（各インスタンスは）
- **動詞 (V)**: has（持つ）
- **目的語 (O)**: its own metadata store and compute resources（独自のメタデータストアとコンピュートリソース）
- **注目ポイント**:
  - `thus` = therefore と同義。セミコロン後に置いて論理的帰結を導く
  - `its own ~` = 「独自の・専用の〜」。shared ではないことを強調

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| be meant to ~ | 熟語 | 〜することを意図されている、〜のために設計されている | VPS is meant to provide complete isolation. |
| isolation | 名詞 | 分離、隔離 | VPS provides isolation from other Snowflake customers. |
| thus | 接続副詞 | したがって（= therefore） | Resources are dedicated; thus, no sharing occurs. |
| its own ~ | 所有代名詞 + 形容詞 | 独自の〜、自分自身の〜 | Each VPS instance has its own metadata store. |
| compute resources | 名詞句 | コンピュートリソース（処理能力） | VPS instances have dedicated compute resources. |

## 3-3. 解説文（日本語）

> VPSエディションは他の顧客からの分離を提供することを目的としています。したがって、各インスタンスは独自のメタデータストアとコンピュートリソースを持ちます。

---

## 復習メモ

- [ ] 4つのSnowflakeエディション（Standard / Enterprise / Business Critical / VPS）の順序を覚えた
- [ ] 専用メタデータストアはVPSのみの機能であることを確認した
- [ ] Business Critical との違い（セキュリティ強化 vs 完全分離）を説明できる
- [ ] 英語の文法ポイント（be meant to / thus / its own）を確認した
- [ ] この問題は製品ライセンスの理論問題のためサンドボックス検証は不要
