# 018: ACCOUNTADMIN Role Privileges

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-02
**正答**: A と D（2つ・完全正解）
- A. A user with the ACCOUNTADMIN role can create & manage resource monitors（選択済み・正解）
- B. A user with the ACCOUNTADMIN role can NOT view billing information.（誤り・未選択）
- C. A user with the ACCOUNTADMIN role can NOT create a new reader account.（誤り・未選択）
- D. ACCOUNTADMIN role has full access rights and is the most powerful account.（選択済み・正解）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| ACCOUNTADMIN | Snowflakeで最も強力なシステムロール。SECURITYADMIN と SYSADMIN の両方を包含し、全権限を持つ。請求情報の閲覧、リソースモニタの管理、リーダーアカウントの作成なども可能。 |
| Resource Monitor（リソースモニタ） | ウェアハウスのクレジット消費を監視・制限する機能。ACCOUNTADMIN のみが作成・管理できる（SYSADMINはできない）。 |
| Reader Account（リーダーアカウント） | データプロバイダーが作成する、データを受け取るための特別なアカウント。データ共有（Secure Data Sharing）で使用。ACCOUNTADMINが作成可能。 |
| Billing Information（請求情報） | アカウントのクレジット消費・コスト情報。ACCOUNTADMINのみが閲覧できる。 |
| Encapsulate（包含する） | ACCOUNTADMINがSECURITYADMINとSYSADMINの権限を含むこと。子ロールの全権限を引き継ぐ。 |

## 1-2. 重要コンセプトまとめ

- **ACCOUNTADMINの主な権限**（試験頻出）:
  - ✅ すべてのセキュアオブジェクトへのアクセス
  - ✅ **請求情報の閲覧**（ACCOUNTADMINのみ）
  - ✅ **リソースモニタの作成・管理**（ACCOUNTADMINのみ）
  - ✅ **リーダーアカウントの作成**
  - ✅ SECURITYADMINとSYSADMINの全権限を包含

- **ロール階層（重要）**:
  ```
  ACCOUNTADMIN
  ├── SECURITYADMIN（ユーザー・ロール管理）
  │   └── USERADMIN（ユーザー・ロール作成）
  └── SYSADMIN（オブジェクト管理）
      └── カスタムロール（推奨配置先）
  ```

- **誤答の整理**（B・Cは二重否定のひっかけ）:
  - B「請求情報を**見られない**」→ 誤り。ACCOUNTADMINは**見られる**
  - C「リーダーアカウントを**作れない**」→ 誤り。ACCOUNTADMINは**作れる**
  - 「can NOT ~」という否定形の選択肢は典型的なひっかけ

- **試験ポイント**: 「最強ロール」「全権限」「SECURITYADMIN + SYSADMINを包含」→ ACCOUNTADMIN

## 1-3. 公式ドキュメントURL

- [System-Defined Roles](https://docs.snowflake.com/en/user-guide/security-access-control-overview#system-defined-roles)

---

## 2-1. 問題文（英語）

> Which of the following statements is true regarding the ACCOUNTADMIN role? Select all that apply.
>
> A. A user with the ACCOUNTADMIN role can create & manage resource monitors.
> B. A user with the ACCOUNTADMIN role can NOT view billing information.
> C. A user with the ACCOUNTADMIN role can NOT create a new reader account.
> D. ACCOUNTADMIN role has full access rights and is the most powerful account.

## 2-2. 問題文の文法解析

### 文1: "Which of the following statements is true regarding the ACCOUNTADMIN role?"

- **主語 (S)**: Which of the following statements（単数扱い → is）
- **動詞 (V)**: is
- **補語 (C)**: true
- **修飾語 (M)**: regarding the ACCOUNTADMIN role
- **文型**: SVC + M
- **注目ポイント**: statements（複数）だが Which of the following は単数扱いで is を使う場合がある。ただし今回は Select all that apply なので実質複数

### 選択肢の文法注目点

- **A**: 「can create & manage ~」— can + 動詞原形の並列。「作成・管理できる」
- **B・C**: 「can NOT ~」— 大文字の NOT で否定を強調。「～できない」という主張
- **D**: 「has full access rights and is the most powerful ~」— 2つの述語の並列。「完全な権限を持ち、最も強力な～である」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| resource monitor | noun phrase | リソースモニタ（クレジット消費監視） | Only ACCOUNTADMIN can create resource monitors. |
| billing information | noun phrase | 請求情報、課金情報 | ACCOUNTADMIN can view billing information. |
| reader account | noun phrase | リーダーアカウント（データ共有受信用） | ACCOUNTADMIN can create new reader accounts. |
| full access rights | noun phrase | 完全なアクセス権 | ACCOUNTADMIN has full access rights. |

## 2-3. 問題文（日本語）

> ACCOUNTADMINロールに関して正しい記述はどれですか？該当するものをすべて選びなさい。
>
> A. ACCOUNTADMINロールを持つユーザーはリソースモニタを作成・管理できる。
> B. ACCOUNTADMINロールを持つユーザーは請求情報を閲覧できない。
> C. ACCOUNTADMINロールを持つユーザーは新しいリーダーアカウントを作成できない。
> D. ACCOUNTADMINロールは完全なアクセス権を持ち、最も強力なロールである。

---

## 3-1. 解説文（英語）

> ACCOUNTADMIN is the account administrator role with full access rights. As the most powerful role in the organization, access to this role should be rigorously managed. This role encapsulates the SECURITYADMIN and SYSADMIN roles, therefore, has all the privileges of SYSADMIN and SECURITYADMIN too.

## 3-2. 解説文の文法解析

### 文1: "ACCOUNTADMIN is the account administrator role with full access rights."

- **主語 (S)**: ACCOUNTADMIN
- **動詞 (V)**: is
- **補語 (C)**: the account administrator role with full access rights
- **文型**: SVC
- **注目ポイント**: 「with full access rights」は前置詞句が名詞を後置修飾。「完全なアクセス権を持つ」

### 文2: "As the most powerful role in the organization, access to this role should be rigorously managed."

- **前置詞句（様態）**: As the most powerful role in the organization（「組織内で最も強力なロールとして」）
- **主語 (S)**: access to this role
- **動詞 (V)**: should be rigorously managed（受動態 + 助動詞）
- **文型**: M + SV（受動態）
- **注目ポイント**:
  - 「As ~」は「～として」。役割・立場を示す前置詞
  - 「rigorously managed」の rigorously は「厳密に、厳格に」。日常語でない技術文書の重要語
  - 「should be managed」は義務・推奨の助動詞。「管理されるべきである」

### 文3: "This role encapsulates the SECURITYADMIN and SYSADMIN roles, therefore, has all the privileges of SYSADMIN and SECURITYADMIN too."

- **主語 (S)**: This role
- **動詞1 (V1)**: encapsulates / **動詞2 (V2)**: has
- **目的語1 (O1)**: the SECURITYADMIN and SYSADMIN roles
- **接続副詞**: therefore（因果）
- **目的語2 (O2)**: all the privileges of SYSADMIN and SECURITYADMIN
- **文型**: SVO, therefore, SVO
- **注目ポイント**:
  - 「encapsulates」は「包含する、カプセル化する」。技術用語としてロールが他ロールを内包することを示す
  - 「therefore」が因果関係（包含する → 権限を持つ）を示す

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| encapsulate | verb | 包含する、カプセル化する | ACCOUNTADMIN encapsulates SYSADMIN and SECURITYADMIN. |
| rigorously | adverb | 厳密に、厳格に | Access to ACCOUNTADMIN should be rigorously managed. |
| privilege | noun | 権限、特権 | This role has all the privileges of SYSADMIN. |
| therefore | adverb | したがって、そのため | It encapsulates SYSADMIN; therefore, has all its rights. |

## 3-3. 解説文（日本語）

> ACCOUNTADMINはアカウント管理者ロールであり、完全なアクセス権を持ちます。組織内で最も強力なロールであるため、このロールへのアクセスは厳格に管理されるべきです。このロールはSECURITYADMINとSYSADMINのロールを包含しており、したがってSYSADMINとSECURITYADMINの全権限も持ちます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
