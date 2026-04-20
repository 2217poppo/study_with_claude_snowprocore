# 027: Resource Monitor Creation Privilege

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-02
**正答**: B（1つ・正解）
- A. Any user of the system（誤り・未選択）
- B. An account administrator (i.e., a person with the ACCOUNTADMIN role)（**選択済み・正解**）
- C. A user who has MONITOR and MODIFY privilege on the resource monitor.（誤り・未選択）
- D. A system administrator (i.e., a person with the SYSADMIN role).（誤り・未選択）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Resource Monitor（リソースモニタ） | ウェアハウスのクレジット消費を監視・制限するオブジェクト。作成はACCOUNTADMINのみ可能 |
| MONITOR 権限 | リソースモニタの設定内容を閲覧できる権限。ACCOUNTADMINが他ユーザーに付与可能 |
| MODIFY 権限 | リソースモニタの設定を変更できる権限。ACCOUNTADMINが他ユーザーに付与可能 |
| Access Control Privilege（アクセス制御権限） | Snowflakeオブジェクトに対して誰が何をできるかを定義する権限体系 |

## 1-2. 重要コンセプトまとめ

- **リソースモニタの操作権限（重要な区別）**:

  | 操作 | 必要なロール/権限 |
  |------|----------------|
  | **新規作成（CREATE）** | **ACCOUNTADMINのみ** |
  | 閲覧（VIEW） | MONITOR権限（ACCOUNTADMINが付与） |
  | 変更（MODIFY） | MODIFY権限（ACCOUNTADMINが付与） |

- **ひっかけ選択肢の整理**:
  - ❌ **Any user** — 誰でも作れるわけではない。権限管理の基本
  - ❌ **MONITOR + MODIFY権限を持つユーザー** — これらは既存のリソースモニタの**閲覧・変更**権限。**作成**はできない
  - ❌ **SYSADMIN** — SYSADMINはオブジェクト管理が強みだが、リソースモニタの作成はACCOUNTADMINの専権事項

- **Q018 との関連**（ACCOUNTADMIN の権限復習）:
  - ACCOUNTADMINの専権事項: リソースモニタ作成・請求情報閲覧・リーダーアカウント作成
  - SYSADMINとの違い: SYSADMINはデータベースオブジェクト管理が得意だが、アカウントレベルの管理はACCOUNTADMINに限られる

- **試験ポイント**: 「作成（CREATE）」と「閲覧・変更（VIEW/MODIFY）」の権限は別物。MONITOR/MODIFY権限保有者でも**新規作成はできない**

## 1-3. 公式ドキュメントURL

- [Access Control Privileges for Resource Monitors](https://docs.snowflake.com/en/user-guide/resource-monitors#access-control-privileges-for-resource-monitors)

---

## 2-1. 問題文（英語）

> Which of the following can create a new resource monitor?
>
> A. Any user of the system
> B. An account administrator (i.e., a person with the ACCOUNTADMIN role)
> C. A user who has MONITOR and MODIFY privilege on the resource monitor.
> D. A system administrator (i.e., a person with the SYSADMIN role).

## 2-2. 問題文の文法解析

### 文1: "Which of the following can create a new resource monitor?"

- **主語 (S)**: Which of the following
- **動詞 (V)**: can create
- **目的語 (O)**: a new resource monitor
- **文型**: SVO
- **注目ポイント**:
  - 「Which of the following can ~?」は「以下のうちどれが〜できるか」。能力・権限を問う定型パターン
  - 「a new resource monitor」の new が「既存のものを操作する」との違いを示すキーワード

### 選択肢の文法注目点

- **B**: 「An account administrator (i.e., a person with the ACCOUNTADMIN role)」
  - `i.e.,` で「すなわち〜の権限を持つ人」と言い換え。役割の定義を括弧内で補足
- **C**: 「A user who has MONITOR and MODIFY privilege on the resource monitor」
  - `who has ~` の関係代名詞節。「〜の権限を持つユーザー」
  - `on the resource monitor` の on は「〜に対する（権限）」。対象を示す前置詞
- **D**: 「A system administrator (i.e., a person with the SYSADMIN role)」
  - B と同構造。SYSADMIN は誤答のひっかけ

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| resource monitor | noun phrase | リソースモニタ（クレジット消費監視） | Only ACCOUNTADMIN can create a resource monitor. |
| account administrator | noun phrase | アカウント管理者（ACCOUNTADMINロール） | Account administrators manage billing and resource monitors. |
| privilege on ~ | noun phrase | 〜に対する権限 | The MODIFY privilege on a resource monitor allows changes. |
| system administrator | noun phrase | システム管理者（SYSADMINロール） | System administrators manage database objects, not resource monitors. |

## 2-3. 問題文（日本語）

> 以下のうち、新しいリソースモニタを作成できるのはどれですか？
>
> A. システムの任意のユーザー
> B. アカウント管理者（ACCOUNTADMINロールを持つ人）
> C. リソースモニタに対してMONITORおよびMODIFY権限を持つユーザー
> D. システム管理者（SYSADMINロールを持つ人）

---

## 3-1. 解説文（英語）

> From a privilege perspective, only Account Administrators (users with ACCOUNTADMIN role) can create new resource monitors. However, account administrators can grant privileges to an existing resource monitor to allow other users to view and modify the resource monitor configuration. The MONITOR and MODIFY privileges on a resource monitor allow other users to view and modify a specific resource monitor.

## 3-2. 解説文の文法解析

### 文1: "From a privilege perspective, only Account Administrators (users with ACCOUNTADMIN role) can create new resource monitors."

- **視点の前置詞句**: From a privilege perspective（「権限の観点から」）
- **主語 (S)**: only Account Administrators (users with ACCOUNTADMIN role)
- **動詞 (V)**: can create
- **目的語 (O)**: new resource monitors
- **文型**: M + SVO
- **注目ポイント**:
  - 「From a ~ perspective」は「〜の観点から」。議論の切り口を示す定型表現
  - 「only」が主語を限定。「〜だけが」という排他性を強調
  - 括弧内 `(users with ACCOUNTADMIN role)` で言い換え補足

### 文2: "However, account administrators can grant privileges to an existing resource monitor to allow other users to view and modify the resource monitor configuration."

- **接続副詞**: However（逆接）
- **主語 (S)**: account administrators
- **動詞 (V)**: can grant
- **目的語 (O)**: privileges
- **修飾語1**: to an existing resource monitor（「既存のリソースモニタに対して」）
- **目的語の修飾**: to allow other users to view and modify ~（不定詞の副詞的用法・目的）
- **文型**: SVO + M + 不定詞句（目的）
- **注目ポイント**:
  - 「grant privileges to ~」は「〜に権限を付与する」。Snowflakeの権限管理の定番表現
  - 「to allow other users to do」は目的を示す不定詞。「他ユーザーが〜できるようにするため」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| from a ~ perspective | 前置詞句 | 〜の観点から | From a privilege perspective, only ACCOUNTADMIN can create it. |
| grant privileges to ~ | 動詞句 | 〜に権限を付与する | Administrators can grant MONITOR privilege to other users. |
| existing | adjective | 既存の、すでに存在する | Privileges can be granted to an existing resource monitor. |
| allow O to do | 構文 | OがするのをOKにする | Grant privileges to allow other users to view the monitor. |

## 3-3. 解説文（日本語）

> 権限の観点から、新しいリソースモニタを作成できるのはアカウント管理者（ACCOUNTADMINロールを持つユーザー）のみです。ただし、アカウント管理者は既存のリソースモニタに権限を付与して、他のユーザーがリソースモニタの設定を閲覧・変更できるようにすることができます。リソースモニタに対するMONITORおよびMODIFY権限により、他のユーザーは特定のリソースモニタを閲覧・変更できます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
