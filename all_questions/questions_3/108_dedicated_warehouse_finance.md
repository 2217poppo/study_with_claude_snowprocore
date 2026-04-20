# 108: Dedicated Virtual Warehouse for Specific Department

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-17
**正答**: C（Finance部門専用のウェアハウスを作成し、Auto-suspend/Auto-resumeを設定する）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Virtual Warehouse | Snowflakeのクエリ処理コンピュートリソース。独立したクラスターで構成され、他のウェアハウスとCPU・メモリを共有しない |
| Dedicated Virtual Warehouse（専用ウェアハウス） | 特定のユーザーグループや部門のみが使用するウェアハウス。リソースを排他的に使用できるため、他の部門の負荷に影響されない |
| Auto-Suspend（自動サスペンド） | 指定した時間アイドル状態が続くとウェアハウスを自動停止する機能。コスト管理に有効 |
| Auto-Resume（自動再開） | サスペンド中のウェアハウスにクエリが届いた際に自動的に再起動する機能 |
| Workload Isolation（ワークロード分離） | 異なるユーザーグループのクエリ処理を独立したウェアハウスで実行することで、互いの負荷に影響されないようにする設計 |
| Solution Architect（ソリューションアーキテクト） | システム設計の専門家。ビジネス要件を技術的な設計に落とし込む役割 |

## 1-2. 重要コンセプトまとめ

- **Snowflakeの重要原則：部門ごとに専用ウェアハウスを作成してワークロードを分離する**
  - 1つの共有ウェアハウスでは、Financeのクエリが他部門のクエリに影響され、またその逆も発生する
  - 専用ウェアハウスにより Finance 部門は最大・専用のパフォーマンスを得られる
- **「ウェアハウスサイズを最大に上げる」は誤り**
  - 最大サイズにすると全ユーザーのコストが増大し、Finance の問題が根本的に解決されない
  - 問題の根本原因は「リソースの共有」であり、「サイズ不足」ではない
- **「クエリ数を制限する」はユーザー体験を悪化させる逆効果**
  - 問題文は「体験を改善する」ことを求めており、制限は逆効果
- **Auto-suspend + Auto-resume はコスト効率に必須**
  - 使用しないときに自動停止、必要なときに自動再開することでコストを最小化

## 1-3. 公式ドキュメントURL

- [Virtual Warehouses Overview](https://docs.snowflake.com/en/user-guide/warehouses-overview)
- [Multi-Cluster Warehouses](https://docs.snowflake.com/en/user-guide/warehouses-multicluster)

---

## 2-1. 問題文（英語）

> You are the solution architect for a large retail company running a Snowflake data warehouse. Your Snowflake implementation has just gone live with a single virtual warehouse used by users across the organization. One of your heaviest users is the Finance department, which has a large number of users and executes a large number of queries. The finance department has complained that the queries take a long time to execute. What is the best immediate action you should take to improve their experience?
>
> A. Limit the number of queries that the finance department can execute.
> B. Increase the size of your single virtual warehouse to the maximum size available so that queries for all users (not just finance) execute faster.
> C. Introduce a dedicated virtual warehouse instance for the finance department and size it according to their needs. Set the new virtual warehouse to auto-suspend and auto-resume.

## 2-2. 問題文の文法解析

### 文1: "You are the solution architect for a large retail company running a Snowflake data warehouse."

- **主語 (S)**: You
- **動詞 (V)**: are
- **補語 (C)**: the solution architect for a large retail company running a Snowflake data warehouse
- **現在分詞後置修飾**: running a Snowflake data warehouse（a large retail company を修飾）
- **文型**: SVC
- **注目ポイント**: 現在分詞句による後置修飾で「Snowflakeデータウェアハウスを運営する大手小売会社」を簡潔に表現

### 文2: "Your Snowflake implementation has just gone live with a single virtual warehouse used by users across the organization."

- **主語 (S)**: Your Snowflake implementation
- **動詞 (V)**: has just gone live（現在完了形 + 副詞 just）
- **修飾語 (M)**: with a single virtual warehouse used by users across the organization
- **注目ポイント**: 
  - `gone live` = 本番稼働した、ライブになった（IT用語）
  - `used by users across the organization` = 組織全体のユーザーによって使用される（過去分詞の後置修飾）

### 文3: "What is the best immediate action you should take to improve their experience?"

- **疑問詞**: What
- **主語 (S)**: the best immediate action you should take to improve their experience
- **動詞 (V)**: is
- **注目ポイント**: 
  - `immediate action` = 即時の行動（immediateが重要 - 今すぐできる対策）
  - `to improve their experience` = 彼らの体験を改善するために（目的の不定詞）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| go live | 句動詞 | 本番稼働する | The new system went live last week. |
| immediate | 形容詞 | 即時の、すぐの | Take immediate action to resolve the issue. |
| isolate | 動詞 | 分離する | Isolate the Finance workload using a dedicated warehouse. |
| dedicated | 形容詞 | 専用の、特定用途の | A dedicated warehouse ensures maximum performance. |
| according to | 前置詞句 | 〜に応じて、〜に従って | Size the warehouse according to their needs. |

## 2-3. 問題文（日本語）

> あなたはSnowflakeデータウェアハウスを運営する大手小売会社のソリューションアーキテクトです。Snowflakeの実装がちょうど本番稼働を開始し、組織全体のユーザーが1つの仮想ウェアハウスを使用しています。最も多くリソースを消費するユーザーの一つがFinance部門で、多数のユーザーが大量のクエリを実行しています。Finance部門からクエリの実行に時間がかかるという苦情が来ています。彼らの体験を改善するための最善の即時対応は何ですか？
>
> A. Finance部門が実行できるクエリ数を制限する。
> B. すべてのユーザー（Financeだけでなく）のクエリを高速化するために、単一の仮想ウェアハウスのサイズを最大に拡大する。
> C. Finance部門専用の仮想ウェアハウスインスタンスを導入し、彼らのニーズに合わせてサイズを設定する。新しい仮想ウェアハウスをAuto-suspendとAuto-resumeに設定する。

---

## 3-1. 解説文（英語）

> By using dedicated virtual warehouses, you can isolate the workload for a specific user group. In this case, dedicating a virtual warehouse for the finance users will ensure that they get maximum and dedicated performance.

## 3-2. 解説文の文法解析

### 文1: "By using dedicated virtual warehouses, you can isolate the workload for a specific user group."

- **手段の修飾語**: By using dedicated virtual warehouses（by + 動名詞）
- **主語 (S)**: you
- **動詞 (V)**: can isolate
- **目的語 (O)**: the workload
- **修飾語 (M)**: for a specific user group
- **文型**: SVO
- **注目ポイント**: `by + 動名詞` で手段を示す（Byを文頭に置くことで手段を強調）

### 文2: "In this case, dedicating a virtual warehouse for the finance users will ensure that they get maximum and dedicated performance."

- **修飾語 (M)**: In this case（状況）
- **主語 (S)**: dedicating a virtual warehouse for the finance users（動名詞句）
- **動詞 (V)**: will ensure
- **that節（目的語）**: that they get maximum and dedicated performance
- **文型**: SVO
- **注目ポイント**: 
  - 動名詞句が主語に立つパターン（`Dedicating A for B will ensure C`）
  - `ensure that ~` = 〜を確実にする
  - `maximum and dedicated` = 最大かつ専用の（2つの形容詞で performance を修飾）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| isolate | 動詞 | 分離する、隔離する | Isolate the workload using separate warehouses. |
| workload | 名詞 | ワークロード、処理量 | The Finance department has a heavy workload. |
| ensure | 動詞 | 確実にする | A dedicated warehouse ensures peak performance. |
| maximum | 形容詞/名詞 | 最大の、最大値 | Get maximum performance with a dedicated resource. |

## 3-3. 解説文（日本語）

> 専用の仮想ウェアハウスを使用することで、特定のユーザーグループのワークロードを分離できます。この場合、Finance部門ユーザーに専用の仮想ウェアハウスを割り当てることで、彼らが最大かつ専用のパフォーマンスを得られることが保証されます。

---

## 復習メモ

- [ ] Snowflakeでの「ワークロード分離」（専用ウェアハウス）の設計パターンを理解した
- [ ] Auto-suspend + Auto-resumeの重要性を把握した
- [ ] `By using ~, S can V` と `dedicating A ensures B` の文法パターンを確認した
