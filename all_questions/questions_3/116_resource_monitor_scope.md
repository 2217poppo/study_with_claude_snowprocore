# 116: Resource Monitor — Scope and Limitations

**SnowPro Core Domain**: Domain 2 — Account Management and Security
**作成日**: 2026-04-17
**正答**: A, B, C（単一WH / グループWH / アカウント全体 — Snowpipeは不可）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Resource Monitor（リソースモニター） | Snowflakeのクレジット使用量を監視・制限するオブジェクト。しきい値超過時に通知やウェアハウス停止を実行できる |
| Credit Usage（クレジット使用量） | 仮想ウェアハウスが消費するSnowflakeクレジットの量。リソースモニターの監視対象 |
| Account-Level Resource Monitor | アカウント全体のクレジット消費を追跡するリソースモニター。アカウント内のすべてのウェアハウスを対象とする |
| Warehouse-Level Resource Monitor | 特定のウェアハウス（単一または複数）のクレジット消費を追跡するリソースモニター |
| Snowpipe | Snowflakeのサーバーレスデータインジェスト機能。継続的にファイルをロードする。リソースモニターの管理対象外 |
| Serverless Feature（サーバーレス機能） | Snowpipe、Automatic Clustering、Materialized View Refreshなど。ユーザーが管理するウェアハウスとは別に動作し、リソースモニターで追跡できない |

## 1-2. 重要コンセプトまとめ

- **リソースモニターが管理できるスコープ**
  - 単一の仮想ウェアハウス
  - 複数の仮想ウェアハウスのグループ
  - アカウント全体（すべての仮想ウェアハウス）
- **リソースモニターが管理できないもの**
  - **Snowpipe**（サーバーレス）
  - Automatic Clustering（サーバーレス）
  - Materialized View Refresh（サーバーレス）
  - その他のサーバーレス機能
- **なぜサーバーレスは対象外か**
  - リソースモニターは「ウェアハウス」のクレジット消費を追跡する
  - サーバーレス機能はウェアハウスを使用せず、Snowflakeが自動でコンピュートを管理する
  - そのため、ウェアハウスベースのリソースモニターでは捕捉できない
- **リソースモニターの主な機能**
  - しきい値設定（例：100クレジットで警告、120クレジットで停止）
  - メール通知
  - ウェアハウスの自動停止

## 1-3. 公式ドキュメントURL

- [Resource Monitors](https://docs.snowflake.com/en/user-guide/resource-monitors)
- [Assignment of Resource Monitors](https://docs.snowflake.com/en/user-guide/resource-monitors#assignment-of-resource-monitors)

---

## 2-1. 問題文（英語）

> Which of the following can be tracked and managed by a resource monitor?
>
> A. A group of virtual warehouses
> B. The whole account
> C. A single virtual warehouse
> D. A single Snowpipe

## 2-2. 問題文の文法解析

### 文1: "Which of the following can be tracked and managed by a resource monitor?"

- **主語 (S)**: Which of the following
- **動詞 (V)**: can be tracked and managed（受動態の並列 + 助動詞 can）
- **行為者**: by a resource monitor
- **文型**: SV（受動態、疑問文）
- **注目ポイント**: 
  - `tracked and managed` = 追跡・管理される（2つの動詞を and で並列）
  - `by a resource monitor` = リソースモニターによって（受動態の行為者）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| track | 動詞 | 追跡する、監視する | Resource monitors track credit usage over time. |
| manage | 動詞 | 管理する | Snowpipe cannot be managed by a resource monitor. |
| resource monitor | 名詞 | リソースモニター | Set up a resource monitor to control spending. |
| whole | 形容詞 | 全体の | A resource monitor can cover the whole account. |

## 2-3. 問題文（日本語）

> 次のうち、リソースモニターによって追跡・管理できるものはどれですか？
>
> A. 仮想ウェアハウスのグループ
> B. アカウント全体
> C. 単一の仮想ウェアハウス
> D. 単一のSnowpipe

---

## 3-1. 解説文（英語）

> Resource monitors can track & manage a single virtual warehouse or multiple virtual warehouses together. Resource Monitors can also be created at the account level, which means that such resource monitors track credit usage at the account level, considering the credit usage of all virtual warehouses. Resource Monitors can not manage costs for Snowpipe or other serverless functions.
>
> https://docs.snowflake.com/en/user-guide/resource-monitors#assignment-of-resource-monitors

## 3-2. 解説文の文法解析

### 文1: "Resource monitors can track & manage a single virtual warehouse or multiple virtual warehouses together."

- **主語 (S)**: Resource monitors
- **動詞 (V)**: can track & manage（並列動詞）
- **目的語 (O)**: a single virtual warehouse or multiple virtual warehouses together
- **文型**: SVO
- **注目ポイント**: `A or B` の選択肢提示（単一または複数のウェアハウスを示す）

### 文2: "Resource Monitors can also be created at the account level, which means that such resource monitors track credit usage at the account level, considering the credit usage of all virtual warehouses."

- **主語 (S)**: Resource Monitors
- **動詞 (V)**: can also be created（受動態 + also）
- **場所の修飾語**: at the account level
- **関係詞節**: which means that ...（先行詞：前節全体）
- **that節**: such resource monitors track credit usage at the account level
- **分詞構文**: considering the credit usage of all virtual warehouses
- **注目ポイント**: 
  - `which means that ~` = つまり〜ということ（説明を加える非制限用法）
  - `considering ~` = 〜を考慮して（付帯状況の分詞構文）

### 文3: "Resource Monitors can not manage costs for Snowpipe or other serverless functions."

- **主語 (S)**: Resource Monitors
- **動詞 (V)**: can not manage（否定の助動詞）
- **目的語 (O)**: costs for Snowpipe or other serverless functions
- **文型**: SVO（否定文）
- **注目ポイント**: `costs for ~` = 〜のコスト（forは対象を示す）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| serverless function | 名詞句 | サーバーレス機能 | Snowpipe is a serverless function, not managed by resource monitors. |
| at the account level | 副詞句 | アカウントレベルで | Create a resource monitor at the account level for global tracking. |
| considering | 前置詞/分詞 | 〜を考慮して | The monitor considers the usage of all warehouses. |
| credit usage | 名詞句 | クレジット使用量 | Track credit usage with a resource monitor. |

## 3-3. 解説文（日本語）

> リソースモニターは、単一の仮想ウェアハウスまたは複数の仮想ウェアハウスをまとめて追跡・管理することができます。リソースモニターはアカウントレベルで作成することもでき、その場合、すべての仮想ウェアハウスのクレジット使用量を考慮してアカウントレベルのクレジット使用量を追跡します。リソースモニターはSnowpipeやその他のサーバーレス機能のコストを管理することはできません。

---

## 復習メモ

- [ ] リソースモニターのスコープ（単一WH / 複数WH / アカウント全体）を理解した
- [ ] Snowpipeとサーバーレスはリソースモニターのスコープ外であることを把握した
- [ ] `which means that ~`（説明を加える関係詞）と `considering ~`（付帯状況の分詞）を確認した
