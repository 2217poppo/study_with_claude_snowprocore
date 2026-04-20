# 076: Data Sharing — Automatic Refresh When Object Added to Share

**SnowPro Core Domain**: Domain 5 — Data Collaboration (Data Sharing)
**作成日**: 2026-04-03
**正答**: A（コンシューマーは即座に新しいオブジェクトを参照・利用できる）

> 関連問題: 069（Share Object Update）← 同じコンセプト・異なる引っかけ選択肢

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Share Object（シェアオブジェクト） | データプロバイダーが作成・管理するデータ共有の単位。作成後もオブジェクトの追加・削除が可能。コンシューマーがデータベースを作成済みでも変更は即座に反映される |
| Read-Only Database（読み取り専用データベース） | コンシューマーがShareから作成するデータベース。書き込み操作（INSERT/UPDATE/DELETE）は不可。プロバイダーが追加した新オブジェクトは**手動リフレッシュなしに自動反映される** |
| consume（消費する） | データ共有の文脈で「データにアクセスして利用する」の意味。コンシューマーがデータを読み取り・活用すること |
| ALTER SHARE REFRESH | **存在しないコマンド**。Shareに追加されたオブジェクトはコンシューマー側の手動操作なしに即座に反映されるため、このようなコマンドは不要 |

## 1-2. 重要コンセプトまとめ

- **Q069との比較**（同じコンセプト・異なる引っかけ）:

  | 問題 | 引っかけ選択肢 |
  |------|--------------|
  | Q069 | 「コンシューマーがDBを再作成が必要」 |
  | Q076（本問） | 「`ALTER SHARE <name> REFRESH` を実行する必要がある」 |

- **正解の根拠**:
  - Snowflakeのデータ共有はデータのコピーなし・リアルタイム参照の仕組み
  - プロバイダーがShareにオブジェクトを追加 → **コンシューマーの操作なしに即座にアクセス可能**
  - 「ADD → 自動反映」がSnowflake Data Sharingの核心

- **不正解の選択肢の解説**:
  - 「Shareへの追加は不可能」→ 誤り。作成後もいつでも追加・削除できる
  - 「`ALTER SHARE REFRESH` が必要」→ 誤り。そのようなコマンドは存在せず、手動操作も不要

- **試験頻出パターン**: 「〜を実行する必要がある」系の選択肢は、Snowflakeが自動処理している場合はほぼ常に誤り（キャッシュ更新・Share反映・動的データマスキング適用等）

## 1-3. 公式ドキュメントURL

- [What is a Share?](https://docs.snowflake.com/en/user-guide/data-sharing-intro#what-is-a-share)

---

## 2-1. 問題文（英語）

> A data consumer has created a read-only database on a Share object shared by a data provider. The data provider adds an object to the Share. Which of the following statement correctly describe what happens?
>
> A. The data consumer can see and consume the new object immediately.
> B. Adding objects to a Share is impossible after a consumer creates a read-only database.
> C. The data consumer needs to run "ALTER SHARE \<share_name\> REFRESH" to ensure that the added object appears in the read-only database.

## 2-2. 問題文の文法解析

### 文1: "A data consumer has created a read-only database on a Share object shared by a data provider."

- **主語 (S)**: A data consumer（データコンシューマーが）
- **動詞 (V)**: has created（作成している）← 現在完了（状態の継続）
- **目的語 (O)**: a read-only database（読み取り専用データベースを）
- **修飾語1**: on a Share object（Shareオブジェクトから）← `on ~` = 「〜をベースに・〜から」
- **修飾語2**: shared by a data provider（データプロバイダーによって共有された）← 過去分詞後置修飾
- **注目ポイント**: `on a Share object` の `on` は「基盤として・〜に基づいて」を示す前置詞。`create a DB on a Share` = 「Shareを基にDBを作成する」

### 文2: "The data provider adds an object to the Share."

- **主語 (S)**: The data provider
- **動詞 (V)**: adds（追加する）← 現在形（シナリオの行為）
- **注目ポイント**: `add ~ to the Share` = 「Shareに〜を追加する」。Shareへのオブジェクト追加の定番表現

### 選択肢C: "The data consumer needs to run 'ALTER SHARE \<share_name\> REFRESH' to ensure that the added object appears in the read-only database."

- **主語 (S)**: The data consumer
- **動詞 (V)**: needs to run（実行する必要がある）← `need to do` = 「〜する必要がある」
- **目的**: to ensure that the added object appears（追加されたオブジェクトが表示されることを確実にするために）← `ensure that ~` = 「〜を確実にする」
- **注目ポイント**: `ensure that ~` = 「〜であることを確実にする・保証する」。誤答選択肢でよく使われる「手動操作が必要」を示す表現パターン

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| see and consume | 動詞句 | 参照して利用する | The consumer can see and consume the new object. |
| on a Share object | 前置詞句 | Shareオブジェクトを基に | Create a read-only database on a Share object. |
| ensure that ~ | 熟語 | 〜であることを確実にする | Run the command to ensure that the object appears. |
| appear | 動詞 | 現れる・表示される | The new object appears in the read-only database. |

## 2-3. 問題文（日本語）

> データコンシューマーが、データプロバイダーによって共有されたShareオブジェクトから読み取り専用データベースを作成しています。データプロバイダーがShareにオブジェクトを追加します。以下のうち、何が起こるかを正しく説明しているものはどれですか？
>
> A. データコンシューマーは新しいオブジェクトを即座に参照・利用できる。
> B. コンシューマーが読み取り専用データベースを作成した後は、Shareへのオブジェクト追加は不可能になる。
> C. データコンシューマーは、追加されたオブジェクトが読み取り専用データベースに表示されることを確実にするために `ALTER SHARE <share_name> REFRESH` を実行する必要がある。

---

## 3-1. 解説文（英語）

> All new objects added to a share object by the data provider automatically become accessible to the consumer.

## 3-2. 解説文の文法解析

### 文1: "All new objects added to a share object by the data provider automatically become accessible to the consumer."

- **主語 (S)**: All new objects added to a share object by the data provider（データプロバイダーによってShareオブジェクトに追加されたすべての新しいオブジェクトが）← `added by ~` 過去分詞後置修飾
- **副詞**: automatically（自動的に）
- **動詞 (V)**: become accessible to the consumer（コンシューマーにアクセス可能になる）← `become + 形容詞`
- **注目ポイント**: Q069解説文の `as soon as they are added to the Share` を省略した形。「自動的に（automatically）」が手動操作不要を示すキーワード

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| automatically become accessible | 熟語 | 自動的にアクセス可能になる | Objects automatically become accessible to the consumer. |

## 3-3. 解説文（日本語）

> データプロバイダーによってShareオブジェクトに追加されたすべての新しいオブジェクトは、コンシューマーに自動的にアクセス可能になります。

---

## 復習メモ

- [ ] ShareへのオブジェクトはコンシューマーのDB作成後も追加可能であることを再確認した
- [ ] `ALTER SHARE REFRESH` は存在しない・不要であることを確認した（手動操作なしに自動反映）
- [ ] `ensure that ~`（〜であることを確実にする）の引っかけパターンを認識した
- [ ] Q069と合わせて「Share即時反映」の概念を2問で確認した
- [ ] この問題は理論問題のためサンドボックス検証は不要
