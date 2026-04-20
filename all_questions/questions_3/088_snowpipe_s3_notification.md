# 088: Snowpipe S3 Notification

**SnowPro Core Domain**: Domain 3 — Data Loading, Unloading, and Connectivity
**作成日**: 2026-04-16
**正答**: A, B, C

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Snowpipe | サーバーレスな継続的データロードサービス。ステージにデータが到着するとマイクロバッチでロードする |
| External Stage（外部ステージ） | クラウドストレージ（S3/Azure Blob/GCS）を参照するステージ |
| Cloud Event Notification | クラウドプラットフォームのイベント通知サービス（S3 Event Notification等）。新ファイル検知でSnowpipeをトリガーする |
| REST API Trigger | Snowpipe専用のREST APIを呼び出してSnowpipeをトリガーする方法。内部ステージ使用時は必須 |

## 1-2. 重要コンセプトまとめ

- 外部ステージでのSnowpipeセットアップ手順（3ステップ）:
  1. **外部ステージを作成**（S3バケットの上に）
  2. **Snowpipeを作成**（外部ステージからデータをロード）
  3. **S3にイベント通知を設定**（Snowpipeをトリガー）
- Snowpipeのトリガー方法は**2つ**:
  - **クラウドイベント通知**（外部ステージで使用可能）
  - **REST API呼び出し**（内部・外部ステージどちらでも使用可能）
- **内部ステージではREST APIのみ**（イベント通知は使えない）
- Snowpipeは**S3バケットを自分でチェックしない**（ポーリングではない）
- 「RUN Snowpipe」コマンドは**存在しない**
- 「S3バケットを継続的にチェック」は**誤り**（通知またはAPI呼び出しでトリガー）

## 1-3. 公式ドキュメントURL

- [Introduction to Snowpipe](https://docs.snowflake.com/en/user-guide/data-load-snowpipe-intro)

---

## 2-1. 問題文（英語）

> You are a telecom company's data engineer who uses Snowflake as a data warehouse. The company requires all network signaling data to be loaded into a table in near real-time. The network signaling data already lands into an S3 bucket every 1 minute. What is the course of action that you should take?
>
> Select three options; each option forms part of the answer.
>
> A. Create an external stage on top of the S3 bucket where the near real-time data lands.
> B. Create a Snowpipe that loads data from an external stage.
> C. Configure notification event on the S3 bucket, which triggers the Snowpipe.
> D. Execute RUN Snowpipe to start the Snowpipe.
> E. Configure the Snowpipe to check for new files in the S3 bucket continuously.

## 2-2. 問題文の文法解析

### 文1: "You are a telecom company's data engineer who uses Snowflake as a data warehouse."

- **主語 (S)**: You
- **動詞 (V)**: are
- **補語 (C)**: a telecom company's data engineer
- **修飾語 (M)**: who uses Snowflake as a data warehouse（関係詞節）
- **文型**: SVC
- **注目ポイント**: シナリオ設定文。「who uses ~」で役割を明確化。

### 文2: "The company requires all network signaling data to be loaded into a table in near real-time."

- **主語 (S)**: The company
- **動詞 (V)**: requires
- **目的語 (O)**: all network signaling data to be loaded into a table
- **修飾語 (M)**: in near real-time
- **文型**: SVOC（require + O + to不定詞）
- **注目ポイント**: 「requires ~ to be loaded」で「～がロードされることを要求する」。「in near real-time」で準リアルタイム要件。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| near real-time | 形容詞句 | 準リアルタイムの | Data must be loaded in near real-time. |
| course of action | 名詞句 | 行動方針、取るべき手順 | What is the course of action? |
| trigger | 動詞 | トリガーする | Notification events trigger the Snowpipe. |
| on top of | 前置詞句 | ～の上に | Create a stage on top of the S3 bucket. |

## 2-3. 問題文（日本語）

> あなたはSnowflakeをデータウェアハウスとして使用する通信会社のデータエンジニアです。会社はすべてのネットワークシグナリングデータを準リアルタイムでテーブルにロードする必要があります。ネットワークシグナリングデータはすでに1分ごとにS3バケットに到着しています。どのような手順を取るべきですか？
>
> 3つ選んでください。各オプションは回答の一部を構成します。
>
> A. 準リアルタイムデータが到着するS3バケットの上に外部ステージを作成する。
> B. 外部ステージからデータをロードするSnowpipeを作成する。
> C. S3バケットにイベント通知を設定し、Snowpipeをトリガーする。
> D. RUN Snowpipeを実行してSnowpipeを開始する。
> E. Snowpipeを設定してS3バケット内の新しいファイルを継続的にチェックする。

---

## 3-1. 解説文（英語）

> Snowpipe can load data from an external stage as well as an internal stage. When using an external stage, you can use the cloud platform notifications to trigger your Snowpipe. The cloud platform notifications can be configured to trigger an event as soon as a new file is detected in the cloud storage bucket. Additional configuration links the event to your Snowpipe, so every time new files arrive, the Snowpipe is automatically triggered into action. When triggered, the Snowpipe runs the COPY command from its definition and loads newly received data into the target table. The alternate mechanism is through a REST API call, which requires you to write a program that can trigger the Snowpipe as needed by calling Snowpipe-specific REST APIs. Using REST APIs, you control when you want to trigger the Snowpipe, either on a scheduled or ad-hoc basis. Note that when using internal stages with Snowpipe, you must trigger a Snowpipe via the REST API. There is no provision for a trigger-based invocation of Snowpipe when using the internal stage as a source. Note: A Snowpipe can not check an S3 bucket directly for a file, and it must be triggered by a notification or a REST API call.

## 3-2. 解説文の文法解析

### 文1: "Snowpipe can load data from an external stage as well as an internal stage."

- **主語 (S)**: Snowpipe
- **動詞 (V)**: can load
- **目的語 (O)**: data
- **修飾語 (M)**: from an external stage as well as an internal stage
- **文型**: SVO
- **注目ポイント**: 「as well as」で「～と同様に」。外部・内部両方のステージ対応。

### 文2: "Note that when using internal stages with Snowpipe, you must trigger a Snowpipe via the REST API."

- **主語 (S)**: you
- **動詞 (V)**: must trigger
- **目的語 (O)**: a Snowpipe
- **修飾語 (M)**: Note that（注意喚起）/ when using internal stages（条件）/ via the REST API（手段）
- **文型**: SVO
- **注目ポイント**: 内部ステージ使用時はREST APIが**必須**。重要な制約事項。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| as well as | 接続詞 | ～と同様に | External stage as well as internal stage. |
| triggered into action | 動詞句 | アクションにトリガーされる | Snowpipe is triggered into action. |
| provision | 名詞 | 規定、手段 | No provision for trigger-based invocation. |
| ad-hoc | 形容詞 | アドホック（臨時的）の | Trigger on a scheduled or ad-hoc basis. |

## 3-3. 解説文（日本語）

> Snowpipeは外部ステージと内部ステージの両方からデータをロードできます。外部ステージを使用する場合、クラウドプラットフォームの通知を使ってSnowpipeをトリガーできます。クラウドプラットフォームの通知は、クラウドストレージバケットで新しいファイルが検出されるとすぐにイベントをトリガーするよう設定できます。追加の設定でイベントをSnowpipeにリンクすると、新しいファイルが到着するたびにSnowpipeが自動的に起動されます。トリガーされると、SnowpipeはCOPY定義のCOPYコマンドを実行し、新しく受信したデータをターゲットテーブルにロードします。代替手段はREST API呼び出しで、これはSnowpipe固有のREST APIを呼び出してSnowpipeをトリガーするプログラムを作成する必要があります。内部ステージでSnowpipeを使用する場合、REST API経由でのトリガーが**必須**です。内部ステージをソースとして使用する場合、トリガーベースの呼び出しの手段はありません。注意: Snowpipeはs3バケットのファイルを直接チェックすることはできず、通知またはREST API呼び出しでトリガーする必要があります。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
