# 022: Dedicated Compute Resources — VPS Edition

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-10
**正答**: B（Virtual Private Snowflake）
**ユーザー回答**: A（Standard）— 不正解

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Virtual Private Snowflake (VPS) | Snowflakeの最上位エディション。他のすべてのSnowflakeアカウントから完全に分離された**専用のメタデータストアと専用のコンピュートリソース**を持つ。最高水準のセキュリティ・プライバシーが必要な組織向け |
| Dedicated Compute Resources（専用コンピュートリソース） | VPSエディションのみが提供する、他の顧客と共有しない独立したコンピュートリソース。通常のエディションではコンピュートリソースはマルチテナント環境で共有される |
| Isolation（分離） | VPSの核心概念。メタデータストア・コンピュートリソースの両方で他の顧客テナントとリソースを共有しないこと |
| Standard Edition | Snowflakeの基本エディション。マルチテナント環境でリソースを共有する。Time Travel最大1日 |
| Enterprise Edition | Standardの上位。Time Travel最大90日・Multi-Cluster WH・Materialized Viewなどが追加。コンピュートリソースは依然として共有環境 |
| Business Critical Edition | Enterpriseの上位。HIPAA/PCI DSS準拠・Tri-Secret Secure等が追加。セキュリティ強化版だが、専用コンピュートリソースは持たない |
| Multi-Tenant（マルチテナント） | 1つのインフラを複数の顧客（テナント）が共有するアーキテクチャ。Standard〜Business Criticalはマルチテナント。VPSのみがシングルテナント |

## 1-2. 重要コンセプトまとめ

- **専用コンピュートリソースを持つのはVPSのみ**: Standard / Enterprise / Business Criticalはすべてマルチテナント環境でコンピュートリソースを共有
- **VPSが提供する「専用」は2つ**（Q041と合わせて覚える）:
  1. **専用メタデータストア**（dedicated metadata store）— Q041で学習済み
  2. **専用コンピュートリソース**（dedicated compute resources）— 本問
- **VPSの目的 = 完全な分離（isolation）**: 他の顧客との分離が必要な業種（政府・防衛・金融等）向け
- **エディション別の分離レベル**:

| エディション | メタデータストア | コンピュートリソース | 分離レベル |
|-------------|----------------|-------------------|-----------|
| Standard | 共有 | 共有 | マルチテナント |
| Enterprise | 共有 | 共有 | マルチテナント |
| Business Critical | 共有 | 共有 | マルチテナント |
| **VPS** | **専用** | **専用** | **シングルテナント** |

- **ひっかけポイント**: Business Criticalはセキュリティ面で強化されている（暗号化・コンプライアンス）が、リソースの分離はVPSのみ
- **試験キーワード**: "dedicated" / "isolation" / "separate instance" → VPS

## 1-3. 公式ドキュメントURL

- [Snowflake Editions](https://docs.snowflake.com/en/user-guide/intro-editions)

---

## 2-1. 問題文（英語）

> What is the minimum Snowflake edition that supports dedicated compute resources?
>
> A. Standard
> B. Virtual Private Snowflake
> C. Business Critical
> D. Enterprise

## 2-2. 問題文の文法解析

### 文1: "What is the minimum Snowflake edition that supports dedicated compute resources?"

- **疑問詞+動詞 (V)**: What is（何ですか）
- **補語 (C)**: the minimum Snowflake edition（最低限のSnowflakeエディション）
- **関係詞節 (M)**: that supports dedicated compute resources（専用コンピュートリソースをサポートする）
- **文型**: SVC（疑問文）
- **注目ポイント**:
  - `the minimum ~ that supports ~` は「〜をサポートする最低エディション」を問う試験頻出パターン（Q041, Q118でも同様の構文）
  - `dedicated` は「専用の、独占的な」という形容詞。`shared`（共有の）の対義語

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| dedicated | adj | 専用の、独占的な | VPS provides dedicated compute resources. |
| minimum edition | noun phrase | 最低エディション | What is the minimum edition that supports this feature? |
| isolation | noun | 分離、隔離 | VPS provides isolation from other customers. |

## 2-3. 問題文（日本語）

> 専用コンピュートリソースをサポートする最低限のSnowflakeエディションはどれですか？
>
> A. Standard
> B. Virtual Private Snowflake
> C. Business Critical
> D. Enterprise

---

## 3-1. 解説文（英語）

> The VPS edition is meant to provide isolation from other customers; thus, each instance has its own metadata store and compute resources.

## 3-2. 解説文の文法解析

### 文1: "The VPS edition is meant to provide isolation from other customers; thus, each instance has its own metadata store and compute resources."

- **主語1 (S1)**: The VPS edition（VPSエディションは）
- **動詞1 (V1)**: is meant to provide（提供することを目的としている）— `be meant to do` = 「〜することを意図されている」
- **目的語1 (O1)**: isolation from other customers（他の顧客からの分離を）
- **接続副詞**: thus（したがって）— セミコロン + thus で因果関係を示す
- **主語2 (S2)**: each instance（各インスタンスは）
- **動詞2 (V2)**: has（持つ）
- **目的語2 (O2)**: its own metadata store and compute resources（独自のメタデータストアとコンピュートリソースを）
- **文型**: SVO; thus, SVO（2つの独立節をセミコロン+接続副詞で結合）
- **注目ポイント**:
  - `be meant to do` — 「〜することを意図されている」。設計目的を述べる表現
  - `; thus,` — セミコロン+thus で「したがって」。前文の理由から後文の結果を導く
  - `its own` — 「独自の、自分だけの」。他と共有しないことを強調

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| be meant to do | verb phrase | 〜することを意図されている | VPS is meant to provide complete isolation. |
| thus | adv | したがって、それゆえ | VPS provides isolation; thus, resources are dedicated. |
| its own | pronoun + adj | 独自の、自分だけの | Each instance has its own metadata store. |
| instance | noun | インスタンス、実体 | Each VPS instance is separate from others. |

## 3-3. 解説文（日本語）

> VPSエディションは他の顧客からの分離を提供することを目的としています。したがって、各インスタンスは独自のメタデータストアとコンピュートリソースを持ちます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
