# 087: Data Integration Partners

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-06
**正答**: A・B・C・D・E（すべて正解）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Data Integration Partner（データ統合パートナー） | Snowflakeのエコシステムパートナーカテゴリの1つ。ETL/ELTツールを提供し、さまざまなデータソースからSnowflakeへのデータ移行・変換を支援するベンダー |
| IBM DataStage | IBMが提供するエンタープライズ向けETLツール。大規模データ統合・変換処理に対応。Snowflakeのデータ統合パートナー |
| Matillion | クラウドネイティブなETL/ELTツール。クラウドデータウェアハウス（Snowflakeを含む）向けに最適化されており、コードなしでデータパイプラインを構築できる |
| AbInitio | 大規模並列データ処理プラットフォーム。バッチ処理・リアルタイム処理に対応する高性能なデータ統合ツール。Snowflakeのデータ統合パートナー |
| Talend | オープンソースのデータ統合プラットフォーム。ETL/ELT・データ品質管理・クラウドデータ統合を提供。Snowflakeとのネイティブコネクタを持つ |
| Informatica | エンタープライズデータ管理のリーダー的存在。PowerCenter（ETL）・IICS（クラウド統合）など多数の製品でSnowflakeとの統合をサポートする |
| Snowflake Ecosystem（スノーフレーク・エコシステム） | Snowflakeと統合・連携するパートナーや技術の総体。Data Integration・Business Intelligence・Security・Storage・Data Science等のカテゴリに分類されるパートナーが存在する |

## 1-2. 重要コンセプトまとめ

- **全5社がデータ統合パートナー**: IBM DataStage・Matillion・AbInitio・Talend・InformaticaはすべてSnowflakeのデータ統合パートナー
- **Snowflakeのパートナーカテゴリ**（試験での出題範囲）:
  - **Data Integration**: ETL/ELTツール（Matillion, Talend, Informatica, IBM DataStage, AbInitio等）
  - **Business Intelligence**: BIツール（Tableau, Looker, Power BI等）
  - **Security & Governance**: セキュリティツール
  - **Storage**: ストレージソリューション
- **「Select all that apply」問題の戦略**: すべての選択肢が正解のケースがある。各ツールのカテゴリを知ることが重要
- **暗記のポイント**: 試験では特定のツールがどのカテゴリかを問われることがある。ETL/ELTツール = Data Integration partners と覚える

## 1-3. 公式ドキュメントURL

- [Snowflake Ecosystem](https://docs.snowflake.com/en/user-guide/ecosystem.html)

---

## 2-1. 問題文（英語）

> Which of the following are Snowflake Data Integration partners? Select all that apply.
>
> A. IBM DataStage
> B. Matillion
> C. AbInitio
> D. Talend
> E. Informatica

## 2-2. 問題文の文法解析

### 文1: "Which of the following are Snowflake Data Integration partners?"

- **主語 (S)**: Which of the following（複数扱い、疑問詞節）
- **動詞 (V)**: are
- **補語 (C)**: Snowflake Data Integration partners
- **文型**: SVC（疑問文）
- **注目ポイント**:
  - **"Which of the following are ~?"**: 「次のうちどれが〜ですか？」。主語が複数（Which = 複数候補）なので動詞は `are`（is ではなく）。`Select all that apply` と組み合わさり「複数正解の可能性あり」を示す
  - **"Data Integration partners"**: 「データ統合パートナー」。大文字で固有のパートナーカテゴリを示す

### 文2: "Select all that apply."

- **動詞 (V)**: Select（命令形）
- **目的語 (O)**: all that apply（関係詞節を含む名詞句）
- **文型**: VO（命令文）
- **注目ポイント**:
  - **"all that apply"**: 「当てはまるものすべて」。`that` は関係代名詞、`apply` = 当てはまる・適用される。複数選択問題の定番指示文

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| integration | 名詞 | 統合、インテグレーション | Data integration connects multiple data sources. |
| partner | 名詞 | パートナー、提携先 | Matillion is a certified Snowflake partner. |
| apply | 動詞 | 当てはまる、適用される | Select all options that apply to this scenario. |

## 2-3. 問題文（日本語）

> 次のうち、SnowflakeのData Integration（データ統合）パートナーはどれですか？当てはまるものをすべて選んでください。
>
> A. IBM DataStage
> B. Matillion
> C. AbInitio
> D. Talend
> E. Informatica

---

## 3-1. 解説文（英語）

> All of these are Data Integration partners of Snowflake. Please see https://docs.Snowflake.com/en/user-guide/ecosystem.html

## 3-2. 解説文の文法解析

### 文1: "All of these are Data Integration partners of Snowflake."

- **主語 (S)**: All of these
- **動詞 (V)**: are
- **補語 (C)**: Data Integration partners of Snowflake
- **文型**: SVC
- **注目ポイント**:
  - **"All of these are ~"**: 「これらはすべて〜である」。「全選択肢が正解」であることを明示する最もシンプルな表現。`All of the above` と同義だが、選択肢が一覧形式でない場合に `All of these` を使う
  - **"partners of Snowflake"**: 「Snowflakeのパートナー」。所有格 `of` でSnowflakeとの関係を示す

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| All of these | 代名詞句 | これらはすべて | All of these are valid Snowflake integration partners. |

## 3-3. 解説文（日本語）

> これらはすべてSnowflakeのData Integrationパートナーです。詳細はhttps://docs.Snowflake.com/en/user-guide/ecosystem.html をご覧ください。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
