# 078: Data Sharing — Consumer Privileges to Create DB from Share

**SnowPro Core Domain**: Domain 5 — Data Collaboration (Data Sharing)
**作成日**: 2026-04-03
**正答**: B・D（IMPORT SHARE 権限 または ACCOUNTADMIN ロール）

> 関連問題: 023（Share Consumer Accounts）・055（Share Management Role）・069（Share Object Update）・076（Share Auto Refresh）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| IMPORT SHARE（権限） | コンシューマーアカウントで、Shareからデータベースを作成することを許可する権限。ACCOUNTADMINロールを持たない一般ユーザーでも、この権限が付与されていればShareからDBを作成できる |
| Consumer Account（コンシューマーアカウント） | Shareを受け取ってデータにアクセスするSnowflakeアカウント。Shareからデータベースを作成する操作はACCOUNTADMINまたはIMPORT SHARE権限が必要 |
| ACCOUNTADMIN（アカウントアドミン） | Snowflakeの最上位システムロール。コンシューマーアカウントでShareからDBを作成する権限を**デフォルトで持つ** |

## 1-2. 重要コンセプトまとめ

- **コンシューマーがShareからDBを作成できる条件**（どちらか一方でOK）:
  1. **ACCOUNTADMINロール**を持っている
  2. **IMPORT SHARE権限**が付与されている

- **不正解の選択肢の解説**:
  - 「SECURITY ADMIN ロール」→ 誤り。SECURITYADMINはグラント管理担当。Shareからのデータベース作成権限はない
  - 「SYSADMIN ロール」→ 誤り。SYSADMINはオブジェクト管理担当。Shareからのデータベース作成権限はない

- **プロバイダー側とコンシューマー側の権限比較**（試験頻出）:

  | 操作 | 必要なロール/権限 |
  |------|----------------|
  | Shareを**作成・管理する**（プロバイダー側） | ACCOUNTADMIN（デフォルト）または委譲されたロール |
  | Shareから**DBを作成する**（コンシューマー側） | ACCOUNTADMIN または IMPORT SHARE権限 |

- **試験のポイント**: SYSADMIN・SECURITYADMINはどちらもShareからのDB作成権限を持たない。ACCOUNTADMINかIMPORT SHAREの2択を覚える

## 1-3. 公式ドキュメントURL

- [Consuming Shared Data](https://docs.snowflake.com/en/user-guide/data-share-consumers)

---

## 2-1. 問題文（英語）

> Which of the following privileges allows a user in a consumer account to create a database from a share? Select two.
>
> A. SECURITY ADMIN role
> B. IMPORT SHARE privileges
> C. SYSADMIN role
> D. ACCOUNTADMIN role

## 2-2. 問題文の文法解析

### 文1: "Which of the following privileges allows a user in a consumer account to create a database from a share?"

- **疑問詞**: Which of the following privileges（以下の権限のうちどれが）
- **動詞 (V)**: allows（許可する）← `allow O to do` = 「OがするのをO許可する」
- **目的語 (O)**: a user in a consumer account（コンシューマーアカウント内のユーザーが）
- **不定詞**: to create a database from a share（Shareからデータベースを作成することを）
- **注目ポイント**: `allow O to do` の構文。`privileges` が主語で「どの権限が〜を可能にするか」を問う。`from a share` = 「Shareを基にして」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| allow O to do | 動詞句 | OがするのをO許可する | The privilege allows the user to create a database. |
| in a consumer account | 前置詞句 | コンシューマーアカウント内の | Users in a consumer account can create DBs from shares. |
| from a share | 前置詞句 | Shareを基にして・Shareから | Create a database from a share. |
| privilege | 名詞 | 権限・特権 | IMPORT SHARE is a privilege for consuming shares. |

## 2-3. 問題文（日本語）

> 以下のうち、コンシューマーアカウントのユーザーがShareからデータベースを作成することを許可するものはどれですか？2つ選択してください。
>
> A. SECURITY ADMIN ロール
> B. IMPORT SHARE 権限
> C. SYSADMIN ロール
> D. ACCOUNTADMIN ロール

---

## 3-1. 解説文（英語）

> A user in a consumer account can create a database from the Share if they have the ACCOUNTADMIN role OR the IMPORT SHARE privileges.

## 3-2. 解説文の文法解析

### 文1: "A user in a consumer account can create a database from the Share if they have the ACCOUNTADMIN role OR the IMPORT SHARE privileges."

- **主語 (S)**: A user in a consumer account（コンシューマーアカウントのユーザーは）
- **動詞 (V)**: can create（作成できる）
- **目的語 (O)**: a database from the Share（ShareからDB）
- **条件節**: if they have the ACCOUNTADMIN role OR the IMPORT SHARE privileges（ACCOUNTADMINロールまたはIMPORT SHARE権限を持っている場合）
- **注目ポイント**: `A OR B` で2つの正解条件を並列。`role` と `privileges` で異なる権限の種類（ロールと個別権限）を区別していることに注目

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| A role OR B privileges | 構文 | Aロールまたは B権限（どちらか一方） | ACCOUNTADMIN role OR IMPORT SHARE privileges. |

## 3-3. 解説文（日本語）

> コンシューマーアカウントのユーザーは、ACCOUNTADMINロールまたはIMPORT SHARE権限を持っている場合、ShareからデータベースをO作成できます。

---

## 復習メモ

- [ ] コンシューマーがShareからDB作成するには ACCOUNTADMIN **または** IMPORT SHARE権限が必要と覚えた
- [ ] SYSADMIN・SECURITYADMINはShareからのDB作成権限を持たないことを確認した
- [ ] プロバイダー側（Share作成）とコンシューマー側（DB作成）の権限を区別できた
- [ ] `allow O to do`・`A OR B` の英語パターンを確認した
- [ ] この問題は理論問題のためサンドボックス検証は不要
