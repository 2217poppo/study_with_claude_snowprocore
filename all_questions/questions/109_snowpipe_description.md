# 109: Snowpipe — Continuous Micro-Batch Data Loading

**SnowPro Core Domain**: Domain 3 — Data Loading and Transformation
**作成日**: 2026-04-06
**正答**: Snowpipe is used to load a small volume of data that arrives frequently and continuously.

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Snowpipe | Snowflakeのサーバーレスな継続的データロードサービス。ステージにデータが到着すると自動的にマイクロバッチでロードを開始する。**サーバーレスのため仮想ウェアハウスに依存しない**。コストはウェアハウス費用とは別途請求される |
| Micro-Batch Loading（マイクロバッチロード） | 大量データを一括処理するのではなく、少量のデータを頻繁・継続的にロードする方式。Snowpipeの動作方式。`COPY INTO`（バッチロード）との対比で重要 |
| Serverless（サーバーレス） | ユーザーが仮想ウェアハウスを管理・指定しなくても処理が実行される形式。Snowpipeはサーバーレスであり、Snowflakeが自動的にコンピュートリソースを管理・スケーリングする |
| Continuous Data Loading（継続的データロード） | リアルタイムまたはほぼリアルタイムで継続的にデータをロードする仕組み。トランザクションやイベントデータなど「流れ続けるデータ」に適している |
| Computational Capability（処理能力） | Snowpipeが持つ独自のコンピュートリソース。仮想ウェアハウスとは独立した処理能力を持つため、ウェアハウスへの依存がない |

## 1-2. 重要コンセプトまとめ

- **正解**: 「頻繁・継続的に到着する少量データをロードするために使用する」
- **Snowpipeの特徴**（試験頻出）:
  1. **マイクロバッチ方式**: 少量データを継続的にロード（大量バッチではない）
  2. **サーバーレス**: 仮想ウェアハウスに依存しない
  3. **自動コンピュート管理**: Snowflakeが自動でスケールアップ/ダウン
  4. **別途課金**: ウェアハウス費用とは分離した料金体系
  5. **ステージ到着から数分以内にロード**
- **Snowpipe vs COPY INTO**:

| 比較項目 | Snowpipe | COPY INTO |
|---------|----------|-----------|
| ロード方式 | マイクロバッチ（継続的） | バッチ（一括） |
| データ量 | 少量・継続的 | 大量・定期的 |
| 実行方式 | 自動（サーバーレス） | 手動or定期スケジュール |
| コンピュート | Snowflake管理 | 仮想ウェアハウス必要 |

- **不正解の選択肢の落とし穴**:
  - 「大量データをバッチで」→ Snowpipeではなく`COPY INTO`
  - 「セキュアな通信パイプ」→ Snowpipeの用途ではない（名前に惑わされないこと）
  - 「バックアップと復元」→ Fail-Safe・Time Travelの役割

## 1-3. 公式ドキュメントURL

- [Introduction to Snowpipe](https://docs.snowflake.com/en/user-guide/data-load-snowpipe-intro)

---

## 2-1. 問題文（英語）

> Which of the following correctly describe Snowpipe?
>
> A. Snowpipe is used to load large volumes of data in a batch manner.
> B. Snowpipe is used to load a small volume of data that arrives frequently and continuously. ✅
> C. Snowpipe is a security mechanism providing a secure pipe for communication.
> D. Snowpipe is used for backup and recovery.

## 2-2. 問題文の文法解析

### 文1: "Which of the following correctly describe Snowpipe?"

- **主語 (S)**: Which of the following
- **動詞 (V)**: describe（複数形）
- **目的語 (O)**: Snowpipe
- **修飾語 (M)**: correctly（副詞）
- **文型**: SVO（疑問文）
- **注目ポイント**:
  - **"correctly describe"**: `describe`（説明する・記述する）に副詞 `correctly`（正確に）を加え「正確に説明している」を問う。`correctly` の位置（動詞の前）に注意

### 選択肢B: "Snowpipe is used to load a small volume of data that arrives frequently and continuously."

- **主語 (S)**: Snowpipe
- **動詞 (V)**: is used to load（受動態 + to不定詞）
- **目的語 (O)**: a small volume of data that arrives frequently and continuously
- **文型**: SV（受動態）
- **注目ポイント**:
  - **"a small volume of data"**: 「少量のデータ」。`volume`（量）は `amount` と同義だが技術文書（特にデータ量）で好んで使われる。`large volume` との対比が重要
  - **"that arrives frequently and continuously"**: 「頻繁・継続的に到着する」関係詞節。`frequently`（頻繁に）+ `continuously`（継続的に）の2副詞で「途切れない流れ」を示す

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| volume | 名詞 | 量（データ量） | Load a small volume of data using Snowpipe. |
| continuously | 副詞 | 継続的に・途切れなく | Data arrives frequently and continuously from the source. |
| batch manner | 名詞句 | バッチ方式 | COPY INTO loads data in a batch manner, not Snowpipe. |

## 2-3. 問題文（日本語）

> 次のうち、Snowpipeを正確に説明しているものはどれか？
>
> A. Snowpipeは大量のデータをバッチ方式でロードするために使用する。
> B. Snowpipeは頻繁・継続的に到着する少量のデータをロードするために使用する。✅
> C. Snowpipeは通信のためのセキュアなパイプを提供するセキュリティ機構である。
> D. Snowpipeはバックアップと復元に使用する。

---

## 3-1. 解説文（英語）

> Snowflake allows continuous data loading using Snowpipe, a serverless service. Snowpipe enables you to load data in a micro-batch manner, loading small volumes of data on each execution. The micro-batch-based data loading is used when a continuous stream of data, such as transactions or events, must be loaded and made available to enterprises quickly. Snowpipe enables continuous data loading and can load data within a few minutes after it arrives in a stage. Snowpipe is serverless and has its own computational capability; therefore, it does not rely on virtual warehouses for processing. Snowflake automatically manages the compute required by a Snowpipe. Snowflake also manages the scaling up and down of a Snowpipe as per the data load requirement. Since a Snowpipe is serverless, its costs are charged separately from virtual warehousing fees.

## 3-2. 解説文の文法解析

### 文1: "Snowflake allows continuous data loading using Snowpipe, a serverless service."

- **主語 (S)**: Snowflake
- **動詞 (V)**: allows
- **目的語 (O)**: continuous data loading using Snowpipe
- **同格語**: a serverless service（Snowpipeの同格説明）
- **文型**: SVO
- **注目ポイント**:
  - **"allows continuous data loading using ~"**: `allow + 動名詞`（〜を可能にする）+ `using ~`（〜を使って）。機能紹介の定番パターン
  - **"Snowpipe, a serverless service"**: コンマ + 名詞句で同格説明（アポジション）。「Snowpipe（サーバーレスサービス）」と定義を付加する

### 文2: "The micro-batch-based data loading is used when a continuous stream of data, such as transactions or events, must be loaded and made available to enterprises quickly."

- **主語 (S)**: The micro-batch-based data loading
- **動詞 (V)**: is used
- **時間節**: when ~ must be loaded and made available to enterprises quickly
- **文型**: SV（受動態）
- **注目ポイント**:
  - **"micro-batch-based"**: 「マイクロバッチベースの」。`-based`（〜に基づく）接尾辞で複合形容詞を形成。`based on micro-batch` の圧縮形
  - **"must be loaded and made available to enterprises quickly"**: `must be + 過去分詞` の2つ（`loaded` と `made available`）を `and` で並列。「ロードされかつ利用可能にされなければならない」で**両方の条件が必須**であることを示す
  - **"such as transactions or events"**: 「トランザクションやイベントなど」。`such as`（〜など）で具体例を列挙

### 文3: "Snowpipe is serverless and has its own computational capability; therefore, it does not rely on virtual warehouses for processing."

- **前半 (S+V)**: Snowpipe is serverless and has its own computational capability
- **後半 (S+V)**: it does not rely on virtual warehouses for processing
- **文型**: SVC and SVO ; SVO
- **注目ポイント**:
  - **"has its own computational capability"**: 「独自の処理能力を持つ」。`its own`（それ自身の）で独立性を強調
  - **"does not rely on ~ for processing"**: 「処理のために〜に依存しない」。`rely on ~`（〜に依存する）の否定形 + `for processing`（処理のために）

### 文4: "Snowflake also manages the scaling up and down of a Snowpipe as per the data load requirement."

- **主語 (S)**: Snowflake
- **動詞 (V)**: manages
- **目的語 (O)**: the scaling up and down of a Snowpipe
- **修飾語 (M)**: as per the data load requirement
- **文型**: SVO
- **注目ポイント**:
  - **"as per ~ requirement"**: 「〜要件に従って・〜に応じて」。`as per ~`（〜に従って・〜に応じて）はフォーマルなビジネス英語の前置詞句。`according to ~` と同義
  - **"the scaling up and down"**: 「スケールアップとダウン」。`scaling up`（拡大）と `down`（縮小）を `and` で並列。Snowflakeが両方向を自動管理することを示す

### 文5: "Since a Snowpipe is serverless, its costs are charged separately from virtual warehousing fees."

- **主語 (S)**: its costs
- **動詞 (V)**: are charged（受動態）
- **修飾語 (M)**: separately from virtual warehousing fees
- **理由節**: Since a Snowpipe is serverless
- **文型**: SV（受動態）
- **注目ポイント**:
  - **"are charged separately from ~"**: 「〜とは別途請求される」。`charge`（課金する）の受動態 + `separately from ~`（〜とは分けて・別々に）でコスト分離を示す

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| micro-batch | 名詞/形容詞 | マイクロバッチ | Snowpipe loads data in a micro-batch manner. |
| rely on ~ | 句動詞 | 〜に依存する | Snowpipe does not rely on virtual warehouses. |
| as per ~ | 前置詞句 | 〜に従って・〜に応じて | Snowflake scales Snowpipe as per the data load requirement. |
| charged separately from ~ | 受動態句 | 〜とは別途請求される | Snowpipe costs are charged separately from warehousing fees. |
| computational capability | 名詞句 | 処理能力・コンピュート能力 | Snowpipe has its own computational capability. |

## 3-3. 解説文（日本語）

> SnowflakeはサーバーレスサービスであるSnowpipeを使用して、継続的なデータロードを可能にします。Snowpipeはデータをマイクロバッチ方式でロードし、実行ごとに少量のデータをロードします。マイクロバッチベースのデータロードは、トランザクションやイベントなど継続的なデータストリームを企業に素早くロードして利用可能にする必要がある場合に使用されます。Snowpipeは継続的なデータロードを可能にし、ステージにデータが到着してから数分以内にロードできます。Snowpipeはサーバーレスで独自の処理能力を持つため、処理に仮想ウェアハウスに依存しません。Snowflakeは自動的にSnowpipeに必要なコンピュートを管理します。Snowflakeはデータロード要件に応じてSnowpipeのスケールアップとダウンも管理します。Snowpipeはサーバーレスであるため、そのコストは仮想ウェアハウス費用とは別途請求されます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
