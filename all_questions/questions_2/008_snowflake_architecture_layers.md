# 008: Snowflake Architecture — Three Key Layers

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-08
**正答**: A（Database Storage）, B（Cloud Services）, D（Query Processing）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Snowflake Architecture（スノーフレークアーキテクチャ） | Snowflakeの3層構造アーキテクチャ。従来のシェアードディスクとシェアードナッシングのハイブリッド。ストレージ・コンピュート・サービスが完全に分離されている。 |
| Database Storage Layer（データベースストレージレイヤー） | Snowflake 3層アーキテクチャの最下層。AWS/Azure/GCP上の安価なクラウドストレージ（S3等）に、マイクロパーティション形式で列指向にデータを保存する。コンピュートから完全に分離。 |
| Query Processing Layer（クエリ処理レイヤー） | Snowflake 3層アーキテクチャの中間層。仮想ウェアハウス（Virtual Warehouse）で構成され、クエリの実行・データの処理を担当する。複数のウェアハウスが同時にストレージにアクセスできる。 |
| Cloud Services Layer（クラウドサービスレイヤー） | Snowflake 3層アーキテクチャの最上層。Snowflake全体の「頭脳」。メタデータ管理・認証・アクセス制御・クエリプラン生成・最適化・トランザクション管理を担当する。 |
| Virtual Warehouse（仮想ウェアハウス） | Query Processing Layerを構成するコンピュートクラスター。クエリ実行に使用され、独立してスケール可能。複数のウェアハウスが同じストレージを共有できる。 |

## 1-2. 重要コンセプトまとめ

- **Snowflakeの3層アーキテクチャ（試験最頻出）**:
  | レイヤー | 別名 | 役割 | 構成要素 |
  |---------|------|------|---------|
  | Database Storage | Storage Layer | データ永続化 | クラウドストレージ（S3等）、マイクロパーティション |
  | Query Processing | Compute Layer | クエリ実行 | 仮想ウェアハウス（Virtual Warehouses） |
  | Cloud Services | Services Layer | 全体の管理・制御 | メタデータ、認証、クエリプラン、トランザクション |
- **誤答の選択肢**:
  - ❌ Docker Containers — Snowflakeのアーキテクチャ層ではない
  - ❌ Azure VMs — 特定クラウドプロバイダーのサービスであり、Snowflakeの層ではない
- **覚え方**: 「Storage（下） → Compute（中） → Services（上）」の順で覚える
- **試験ポイント**: 「Cloud Services Layer = Snowflakeの頭脳（brain）」という表現がそのまま出題される

## 1-3. 公式ドキュメントURL

- [Snowflake Architecture — Key Concepts](https://docs.snowflake.com/en/user-guide/intro-key-concepts#snowflake-architecture)

---

## 2-1. 問題文（英語）

> Please select the 3 key layers which are part of the Snowflake Architecture.
>
> A. Database Storage
>
> B. Cloud Services
>
> C. Docker Containers
>
> D. Query Processing
>
> E. Azure VMs

## 2-2. 問題文の文法解析

### 文1: "Please select the 3 key layers which are part of the Snowflake Architecture."

- **主語 (S)**: （you — 命令文につき省略）
- **動詞 (V)**: select（命令形）
- **目的語 (O)**: the 3 key layers（+ 関係詞節）
- **関係詞節**: which are part of the Snowflake Architecture（layers を修飾）
- **文型**: SVO（命令文）
- **注目ポイント**:
  - `Please select ~` — `Please` を付けた命令文。試験問題の「選択してください」指示の丁寧形
  - `which are part of ~` — 主格関係代名詞。`that` に置き換え可能
  - `be part of ~` — 「〜の一部である・〜に含まれる」。構成要素を示す重要表現

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| key layers | 名詞句 | 主要なレイヤー（層） | Select the 3 key layers of Snowflake Architecture. |
| be part of ~ | 動詞句 | 〜の一部である | Database Storage is part of the Snowflake Architecture. |
| architecture | 名詞 | アーキテクチャ（設計・構造） | Snowflake has a unique three-layer architecture. |

## 2-3. 問題文（日本語）

> Snowflakeアーキテクチャを構成する3つの主要なレイヤーを選択してください。
>
> A. データベースストレージ
>
> B. クラウドサービス
>
> C. Dockerコンテナ
>
> D. クエリ処理
>
> E. Azure VM

---

## 3-1. 解説文（英語）

> Snowflake architecture has three distinct layers: Database Storage - Cheap cloud storage on AWS, Azure, or Google Cloud Query Processing - Primarily composed of virtual warehouses Cloud Services - The brain of the whole operation

## 3-2. 解説文の文法解析

### 文1: "Snowflake architecture has three distinct layers: Database Storage - ..., Query Processing - ..., Cloud Services - ..."

- **主語 (S)**: Snowflake architecture
- **動詞 (V)**: has
- **目的語 (O)**: three distinct layers（コロン以降で各層を列挙）
- **文型**: SVO
- **注目ポイント**: コロン（:）の後にダッシュ（-）区切りで各レイヤーの名称と説明を並列列挙するリスト形式

### 各層の説明フレーズ

- **Database Storage**: "Cheap cloud storage on AWS, Azure, or Google Cloud"
  - `Cheap` — 「安価な」。クラウドストレージのコスト優位性を示す
  - `on AWS, Azure, or Google Cloud` — 対応クラウドプロバイダーの列挙

- **Query Processing**: "Primarily composed of virtual warehouses"
  - `primarily` — 副詞「主として・主に」
  - `composed of ~` — 「〜で構成される」。受動態的な形容詞として名詞を後置修飾
  - `primarily composed of virtual warehouses` — 「主に仮想ウェアハウスで構成された」

- **Cloud Services**: "The brain of the whole operation"
  - `the brain of ~` — 「〜の頭脳」。比喩的表現で制御・判断の中枢であることを示す
  - `the whole operation` — 「全体的な操作・システム全体」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| distinct | 形容詞 | 明確に区別された、独立した | Snowflake has three distinct layers. |
| primarily | 副詞 | 主として、主に | Query Processing is primarily composed of virtual warehouses. |
| composed of ~ | 形容詞句 | 〜で構成された | The layer is composed of virtual warehouses. |
| the brain of ~ | 名詞句（比喩） | 〜の頭脳 | Cloud Services is the brain of the whole operation. |
| whole operation | 名詞句 | 全体の操作・システム全体 | Cloud Services manages the whole operation. |

## 3-3. 解説文（日本語）

> Snowflakeアーキテクチャには3つの独立したレイヤーがあります: データベースストレージ — AWS・Azure・またはGoogle Cloud上の安価なクラウドストレージ。クエリ処理 — 主に仮想ウェアハウスで構成される。クラウドサービス — システム全体の頭脳。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
