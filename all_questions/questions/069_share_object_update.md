# 069: Data Sharing — Adding Objects to an Existing Share

**SnowPro Core Domain**: Domain 5 — Data Collaboration (Data Sharing)
**作成日**: 2026-04-03
**正答**: A（新しいオブジェクトはコンシューマーに即座にアクセス可能になる）

> 関連問題: 023（Share Consumer Accounts）・047（Data Sharing Multiple Databases）・055（Share Management Role）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Share（シェア） | データプロバイダーがコンシューマーに共有するオブジェクト。作成後もオブジェクトの追加・削除が可能。コンシューマーがDBを作成済みでも、新しいオブジェクトは自動的にアクセス可能になる |
| Read-Only Database（読み取り専用データベース） | コンシューマーがShareから作成するデータベース。INSERT・UPDATE・DELETE等の書き込み操作は不可。プロバイダーが追加した新オブジェクトは自動的に反映される |
| Data Provider（データプロバイダー） | Shareを作成・管理してデータを提供するSnowflakeアカウント |
| Consumer（コンシューマー） | Shareからデータベースを作成してデータにアクセスするアカウント。データのコピーは持たない |
| Immediately（即座に） | プロバイダーがShareにオブジェクトを追加すると、コンシューマーは再操作なしに即アクセスできる。再作成・再承認は不要 |

## 1-2. 重要コンセプトまとめ

- **Shareにオブジェクトを追加したとき**:
  - コンシューマーに**即座に（immediately）** アクセス可能になる
  - コンシューマーによる再作業（DB再作成・再承認等）は**不要**
  - これはSnowflakeのデータ共有が「データのコピーなし・リアルタイム参照」の仕組みであるため

- **不正解の選択肢の解説**:
  - 「追加不可能」→ 誤り。Shareは作成後もいつでもオブジェクトを追加・削除できる
  - 「コンシューマーがDB再作成が必要」→ 誤り。再作成は不要。追加されたオブジェクトは自動的に見える

- **Snowflake Data Sharingの「リアルタイム性」**（試験頻出）:
  - プロバイダーのデータ更新 → コンシューマーに即時反映
  - Shareへのオブジェクト追加 → コンシューマーに即時反映
  - データのコピーが存在しないため、常に最新状態

- **試験のポイント**: `as soon as` = 「〜するとすぐに・即座に」という即時性を示すキーワードを覚える

## 1-3. 公式ドキュメントURL

- [Introduction to Secure Data Sharing](https://docs.snowflake.com/en/user-guide/data-sharing-intro)

---

## 2-1. 問題文（英語）

> Assume a share has been granted to a consumer, and the consumer has created a database on the Share. Which of the following correctly describes what occurs if a new object is added to the Share?
>
> A. The new object becomes accessible to the consumer immediately.
> B. Adding objects to a share is impossible once created and granted to a consumer.
> C. The consumer is required to re-create a database from the granted Share object.

## 2-2. 問題文の文法解析

### 文1: "Assume a share has been granted to a consumer, and the consumer has created a database on the Share."

- **命令形**: Assume（〜と仮定せよ）← 試験問題で前提条件を設定する定番表現
- **条件1**: a share has been granted to a consumer（シェアがコンシューマーに付与されている）← 現在完了受動態
- **条件2**: the consumer has created a database on the Share（コンシューマーがShareからDBを作成している）← 現在完了
- **注目ポイント**: `Assume ~` = 「〜と仮定してください」。試験問題でシナリオの前提を設定するときの定番の命令形

### 文2: "Which of the following correctly describes what occurs if a new object is added to the Share?"

- **疑問文**: Which of the following correctly describes ~
- **目的語**: what occurs if a new object is added to the Share（新しいオブジェクトがShareに追加された場合に何が起こるか）← 間接疑問文
- **注目ポイント**: `what occurs if ~` = 「〜の場合に何が起こるか」。条件文を含む間接疑問文

### 選択肢C: "The consumer is required to re-create a database from the granted Share object."

- **注目ポイント**: `re-create` = 「再作成する」。`re-` 接頭辞 = 「再〜」。これが正解でない理由は再作成が不要なため

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| assume | 動詞（命令形） | 〜と仮定せよ・前提として考えよ | Assume the share has been granted. |
| what occurs if ~ | 間接疑問文 | 〜の場合に何が起こるか | What occurs if a new object is added? |
| accessible | 形容詞 | アクセス可能な | The object becomes accessible immediately. |
| immediately | 副詞 | 即座に・すぐに | The new object is accessible immediately. |
| re-create | 動詞 | 再作成する（re- = 再〜） | The consumer does not need to re-create anything. |

## 2-3. 問題文（日本語）

> シェアがコンシューマーに付与され、コンシューマーがShareからデータベースを作成済みと仮定します。新しいオブジェクトがShareに追加された場合、以下のうち正しく説明しているものはどれですか？
>
> A. 新しいオブジェクトはコンシューマーに即座にアクセス可能になる。
> B. ShareへのオブジェクトAの追加は、一度作成されてコンシューマーに付与されると不可能になる。
> C. コンシューマーは付与されたShareオブジェクトからデータベースを再作成することが求められる。

---

## 3-1. 解説文（英語）

> Once a share has been granted to a consumer, and the consumer has created a read-only database on the Share, all new objects added to the Share by the data provider automatically become accessible to the consumer as soon as they are added to the Share by the data provider.

## 3-2. 解説文の文法解析

### 文1: "Once a share has been granted to a consumer, and the consumer has created a read-only database on the Share, all new objects added to the Share by the data provider automatically become accessible to the consumer as soon as they are added to the Share by the data provider."

- **時間節**: Once a share has been granted ... and the consumer has created ...（一旦Shareが付与され、コンシューマーがDBを作成すると）← `Once` + 現在完了
- **主語 (S)**: all new objects added to the Share by the data provider（データプロバイダーによってShareに追加された新しいオブジェクトすべてが）← `added by ~` 過去分詞後置修飾
- **副詞**: automatically（自動的に）
- **動詞 (V)**: become accessible to the consumer（コンシューマーにアクセス可能になる）← `become + 形容詞`
- **時間節**: as soon as they are added to the Share by the data provider（プロバイダーがShareに追加するとすぐに）← `as soon as ~` = 「〜するとすぐに」
- **注目ポイント**: `as soon as ~` = 「〜するとすぐに・即座に」。この問題の核心となる即時性を示す最重要表現

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| as soon as ~ | 接続詞 | 〜するとすぐに・即座に | Objects become accessible as soon as they are added. |
| become accessible to ~ | 熟語 | 〜にアクセス可能になる | New objects become accessible to the consumer. |
| automatically | 副詞 | 自動的に | Objects automatically become accessible. |

## 3-3. 解説文（日本語）

> 一旦Shareがコンシューマーに付与され、コンシューマーがShareから読み取り専用データベースを作成すると、データプロバイダーによってShareに追加されたすべての新しいオブジェクトは、プロバイダーがShareに追加するとすぐに自動的にコンシューマーにアクセス可能になります。

---

## 復習メモ

- [ ] Shareに新しいオブジェクトを追加するとコンシューマーに即座にアクセス可能になることを覚えた
- [ ] コンシューマーによる再作成・再操作が不要であることを確認した
- [ ] `as soon as ~`（〜するとすぐに）・`assume`（仮定する）の英語パターンを確認した
- [ ] この問題は理論問題のためサンドボックス検証は不要
