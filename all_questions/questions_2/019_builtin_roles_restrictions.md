# 019: Built-in Roles Restrictions

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-09
**正答**: The built-in roles can NOT be dropped / The default privileges provided to the built-in roles can NOT be revoked（2つ選択）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Built-in Role（ビルトインロール / システム定義ロール） | Snowflakeがあらかじめ定義しているシステムロール。**ACCOUNTADMIN・SYSADMIN・USERADMIN・SECURITYADMIN・PUBLIC・ORGADMIN** の6種類。**削除不可・デフォルト権限の取り消し不可** |
| Default Privileges（デフォルト権限） | ビルトインロールに最初から付与されている権限。例: SYSADMINの `CREATE DATABASE` 権限、SECURITYADMINの `MANAGE GRANTS` 権限。これらは**誰にも取り消せない** |
| DROP（ドロップ） | オブジェクトを削除するSQLコマンド。カスタムロールは `DROP ROLE` で削除可能だが、ビルトインロールは削除不可 |
| REVOKE（取り消し） | ロールに付与された権限を取り消すSQLコマンド。ユーザーが追加で付与した権限は取り消せるが、ビルトインロールのデフォルト権限は取り消せない |
| ORGADMIN | 組織（Organization）レベルのロール。アカウント作成・一覧表示など組織固有タスクを担当。ビルトインロールのデフォルト権限取り消しはORGADMINにもできない |

## 1-2. 重要コンセプトまとめ

- **ビルトインロールの2つの不変ルール**（この問題のコア）:
  1. **削除不可**: ビルトインロールは `DROP ROLE` できない
  2. **デフォルト権限の取り消し不可**: ビルトインロールに最初から付与されている権限は `REVOKE` できない
- **誰にもできない**: ACCOUNTADMIN・ORGADMIN・その他どのロールでも、デフォルト権限の取り消しは不可能
- **追加権限は管理可能**: ユーザーが後から追加で付与した権限は `REVOKE` で取り消し可能。取り消せないのは「デフォルト（最初から付与された）権限」のみ
- **ひっかけ選択肢パターン**:
  - 「ORGADMINならできる」→ 不可
  - 「ACCOUNTADMINならできる」→ 不可
  - 「必要であれば削除できる」→ 不可

## 1-3. 公式ドキュメントURL

- [Roles](https://docs.snowflake.com/en/user-guide/security-access-control-overview#roles)
- [System-Defined Roles](https://docs.snowflake.com/en/user-guide/security-access-control-overview#system-defined-roles)

---

## 2-1. 問題文（英語）

> Which of the following statements is true regarding the built-in system roles in Snowflake? Select two answers.
>
> A. The built-in roles can NOT be dropped.
> B. An ORGADMIN can revoke the privileges granted as default to the built-in roles.
> C. The default privileges provided to the built-in roles can NOT be revoked.
> D. An ACCOUNTADMIN can revoke the privileges granted as default to the built-in roles.
> E. The built-in roles can be dropped if required.

## 2-2. 問題文の文法解析

### 文1: "Which of the following statements is true regarding the built-in system roles in Snowflake?"

- **疑問詞+主語 (S)**: Which of the following statements（次の文のうちどれが）
- **動詞 (V)**: is true（正しいか）
- **修飾語 (M)**: regarding the built-in system roles in Snowflake（Snowflakeのビルトインシステムロールに関して）
- **文型**: SVC（疑問文）
- **注目ポイント**:
  - `regarding ~` — 「〜に関して」。`about` よりフォーマル。`with regard to` と同義
  - `built-in system roles` — 「組み込みのシステムロール」。ハイフン付き複合形容詞 `built-in`

### 選択肢A: "The built-in roles can NOT be dropped."

- **主語 (S)**: The built-in roles（ビルトインロールは）
- **動詞 (V)**: can NOT be dropped（削除できない）— 助動詞否定 + 受動態
- **文型**: SV（受動態否定）
- **注目ポイント**: `can NOT` — 大文字 `NOT` で不可能を強調

### 選択肢C: "The default privileges provided to the built-in roles can NOT be revoked."

- **主語 (S)**: The default privileges provided to the built-in roles（ビルトインロールに提供されたデフォルト権限は）
- **動詞 (V)**: can NOT be revoked（取り消せない）— 助動詞否定 + 受動態
- **文型**: SV（受動態否定）
- **注目ポイント**:
  - `provided to ~` — 過去分詞の後置修飾。「〜に提供された」
  - `revoked` — 「取り消された」。権限管理の重要動詞

### 選択肢B: "An ORGADMIN can revoke the privileges granted as default to the built-in roles."

- **注目ポイント**: `granted as default` — 「デフォルトとして付与された」。`as default` が「デフォルトとして」の意味で `granted` を修飾

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| regarding | 前置詞 | 〜に関して | What is true regarding the system roles? |
| built-in | 形容詞 | 組み込みの、内蔵の | Built-in roles are predefined by Snowflake. |
| dropped | 過去分詞 | 削除された | Built-in roles cannot be dropped. |
| revoked | 過去分詞 | 取り消された | Default privileges cannot be revoked. |
| granted as default | 過去分詞句 | デフォルトとして付与された | Privileges granted as default are permanent. |
| if required | 条件節 | 必要であれば | The roles can be dropped if required. (False) |

## 2-3. 問題文（日本語）

> Snowflakeのビルトインシステムロールに関して正しい文はどれですか？2つ選択してください。
>
> A. ビルトインロールは削除できない。
> B. ORGADMINはビルトインロールにデフォルトとして付与された権限を取り消すことができる。
> C. ビルトインロールに提供されたデフォルト権限は取り消すことができない。
> D. ACCOUNTADMINはビルトインロールにデフォルトとして付与された権限を取り消すことができる。
> E. ビルトインロールは必要であれば削除できる。

---

## 3-1. 解説文（英語）

> The built-in system-defined roles cannot be dropped. The default privileges granted to those roles cannot be revoked.

## 3-2. 解説文の文法解析

### 文1: "The built-in system-defined roles cannot be dropped."

- **主語 (S)**: The built-in system-defined roles（ビルトインのシステム定義ロールは）
- **動詞 (V)**: cannot be dropped（削除できない）— 助動詞否定 + 受動態
- **文型**: SV（受動態否定）
- **注目ポイント**: `system-defined` — ハイフン付き複合形容詞。「システムで定義された」

### 文2: "The default privileges granted to those roles cannot be revoked."

- **主語 (S)**: The default privileges granted to those roles（それらのロールに付与されたデフォルト権限は）
- **動詞 (V)**: cannot be revoked（取り消せない）
- **文型**: SV（受動態否定）
- **注目ポイント**:
  - `granted to those roles` — 過去分詞の後置修飾。「それらのロールに付与された」
  - `those roles` — 前文で言及した `built-in system-defined roles` を指示代名詞 `those` で参照

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| system-defined | 形容詞 | システム定義の | System-defined roles are created by Snowflake. |
| cannot be dropped | 動詞句 | 削除できない | Built-in roles cannot be dropped by any user. |
| cannot be revoked | 動詞句 | 取り消せない | Default privileges cannot be revoked. |
| those roles | 代名詞+名詞 | それらのロール | The privileges granted to those roles are permanent. |

## 3-3. 解説文（日本語）

> ビルトインのシステム定義ロールは削除できません。それらのロールに付与されたデフォルト権限は取り消すことができません。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
