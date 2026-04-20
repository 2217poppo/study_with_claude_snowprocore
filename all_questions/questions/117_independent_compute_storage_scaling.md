# 117: Independent Compute and Storage Scaling

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-06
**正答**: True
**ユーザー回答**: False（不正解）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Compute（コンピュート） | クエリの処理・実行を担うリソース。Snowflakeでは仮想ウェアハウス（Virtual Warehouse）がコンピュートに相当し、独立してスケールできる |
| Storage（ストレージ） | データを永続的に保存するリソース。Snowflakeではクラウドオブジェクトストレージ（S3等）を使用し、コンピュートとは独立してスケールできる |
| Independent Scaling（独立スケーリング） | コンピュートとストレージを別々に増減できる特性。コンピュートを増やしてもストレージコストは変わらず、その逆も然り |
| Compute Engine（コンピュートエンジン） | データ処理を実行する仮想ウェアハウスのこと。各コンピュートエンジンは独自のメモリ・処理能力を持ち、共有ストレージにアクセスする |

## 1-2. 重要コンセプトまとめ

- **正解: True — コンピュートとストレージは独立してスケールできる**
- **ユーザーの誤り**: SnowflakeはShared-Disk（ストレージ共有）とShared-Nothing（コンピュート独立）のハイブリッドアーキテクチャ。これを理解していれば独立スケーリングは当然の帰結
- **Snowflakeのハイブリッドアーキテクチャの2特性**:

| 特性 | 詳細 |
|------|------|
| **Shared-Disk（ストレージ部分）** | すべての仮想ウェアハウスが共通のクラウドストレージにアクセスする。データは共有されている |
| **Shared-Nothing（コンピュート部分）** | 各仮想ウェアハウスは独自のメモリ・CPU・処理能力を持つ。コンピュートは独立している |

- **独立スケーリングの実用例**:
  - クエリが増えた → コンピュート（WH）だけ増やす（ストレージ課金は変わらない）
  - データ量が増えた → ストレージだけ自動的に拡張される（コンピュート課金は変わらない）
- **なぜFalseと間違えやすいか**: 従来のデータベース（オンプレミス）はストレージとコンピュートが結合しており、独立スケーリングが難しかったため、直感的に「同時にスケールする必要がある」と思いがち

## 1-3. 公式ドキュメントURL

- [Snowflake Architecture](https://docs.snowflake.com/en/user-guide/intro-key-concepts#snowflake-architecture)

---

## 2-1. 問題文（英語）

> True/False: The compute and storage can be scaled independently in Snowflake architecture.
>
> True ✅
> False

## 2-2. 問題文の文法解析

### 文1: "The compute and storage can be scaled independently in Snowflake architecture."

- **主語 (S)**: The compute and storage（コンピュートとストレージ）
- **動詞 (V)**: can be scaled（受動態・助動詞）
- **修飾語 (M1)**: independently（副詞）
- **修飾語 (M2)**: in Snowflake architecture（前置詞句）
- **文型**: SV（受動態）
- **注目ポイント**:
  - **"can be scaled"**: 「スケールされることができる」。`can be + 過去分詞`（受動態の可能）で「〜することが可能」を示す。`can scale`（能動態）と同義だが、システム特性を客観的に述べる際に受動態がよく使われる
  - **"scaled independently"**: 「独立してスケールできる」。`independently`（副詞）が「それぞれ別々に・互いに影響なく」を意味する。`independently`は True/False問題のキーワードになりやすい
  - **"True/False:"**: 問題形式の表示。コロンで区切って質問文が続く。英語では "Is it true that ~?" の省略形として使われる

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| scaled | 動詞（過去分詞） | スケールされた・増減された | Compute can be scaled independently from storage. |
| independently | 副詞 | 独立して・別々に・互いに影響なく | Storage and compute scale independently in Snowflake. |

## 2-3. 問題文（日本語）

> 真偽問題: Snowflakeアーキテクチャでは、コンピュートとストレージを独立してスケールできる。
>
> 真（True）✅
> 偽（False）

---

## 3-1. 解説文（英語）

> True. Snowflake stores data similarly to a shared-disk architecture, i.e., the data is shared. But it also allows for using several compute engines, each with its own memory and processing capabilities. This architecture allows Snowflake to scale compute and storage independently.

## 3-2. 解説文の文法解析

### 文1: "Snowflake stores data similarly to a shared-disk architecture, i.e., the data is shared."

- **主語 (S)**: Snowflake
- **動詞 (V)**: stores
- **目的語 (O)**: data
- **修飾語 (M)**: similarly to a shared-disk architecture
- **補足説明**: i.e., the data is shared
- **文型**: SVO
- **注目ポイント**:
  - **"similarly to ~"**: 「〜と同様に」。`similar to ~`（形容詞）の副詞形 `similarly to ~`。厳密に同一ではなく「類似した方式で」というニュアンス（Snowflakeは純粋なShared-Diskではない）
  - **"i.e., the data is shared"**: 「すなわち、データは共有されている」。`i.e.,`（id est = つまり）で前の説明を言い換える。`e.g.,`（例えば）との違いに注意

### 文2: "But it also allows for using several compute engines, each with its own memory and processing capabilities."

- **主語 (S)**: it（Snowflake）
- **動詞 (V)**: allows for（句動詞）
- **目的語 (O)**: using several compute engines（動名詞句）
- **付帯状況**: each with its own memory and processing capabilities
- **文型**: SVO
- **注目ポイント**:
  - **"But"**: 文頭に置いてShared-Diskとの対比を導く。接続詞の口語的な使用で「しかし一方で」
  - **"allows for using ~"**: 「〜を使うことを可能にする」。`allow for ~`（〜を許容する・〜を可能にする）は句動詞。`allow O to do`（OにdoさせるV）とは構文が異なる
  - **"each with its own memory and processing capabilities"**: 「それぞれが独自のメモリと処理能力を持つ」。Q039などで登場した付帯状況の `each with ~` パターン（各要素が独立した属性を持つことを示す）

### 文3: "This architecture allows Snowflake to scale compute and storage independently."

- **主語 (S)**: This architecture
- **動詞 (V)**: allows
- **目的語 (O)**: Snowflake
- **補語 (C)**: to scale compute and storage independently
- **文型**: SVOC（allow O to do）
- **注目ポイント**:
  - **"allows ~ to scale"**: 「〜がスケールすることを可能にする」。`allow O to do`（OがdoするのをV）の SVOC 構文。`allows for using`（文2）と `allows O to do`（文3）の使い分けに注意
  - **"scale compute and storage independently"**: 「コンピュートとストレージを独立してスケールする」。文2で述べた「ストレージ共有・コンピュート独立」の帰結として独立スケーリングが可能になると説明している

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| similarly to ~ | 副詞句 | 〜と同様に・類似して | Snowflake stores data similarly to a shared-disk architecture. |
| allows for + 動名詞 | 句動詞 | 〜を可能にする・〜を許容する | Snowflake allows for using several compute engines. |
| processing capabilities | 名詞句 | 処理能力・処理性能 | Each compute engine has its own memory and processing capabilities. |

## 3-3. 解説文（日本語）

> 正しい（True）。Snowflakeは共有ディスクアーキテクチャと同様の方式でデータを保存する。すなわち、データは共有されている。しかし同時に、それぞれ独自のメモリと処理能力を持つ複数のコンピュートエンジンを使用することも可能にしている。このアーキテクチャにより、Snowflakeはコンピュートとストレージを独立してスケールできる。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
