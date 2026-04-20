# 010: MFA Enrollment — Manual Process

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-08
**正答**: False

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| MFA（Multi-Factor Authentication / 多要素認証） | パスワードに加えて第2の認証要素を要求する認証方式。全エディション・全アカウントでデフォルト有効。ただしユーザーは**自分で登録手続きを開始・完了する必要がある**（自動登録はされない）。 |
| MFA Enrollment（MFA登録） | ユーザーがMFAを使えるようにするための登録プロセス。Snowflakeのウェブインターフェース（Snowsight）から自分で手続きする。管理者が強制することも可能だが、デフォルトでは自動登録されない。 |
| Enabled by Default（デフォルト有効） | 設定変更なしに最初から機能が使用可能な状態。MFAはデフォルトで全アカウント・全ユーザーに対して有効（= 利用可能）だが、ユーザーが登録しない限り実際には適用されない。 |
| Snowflake Web Interface（Snowflakeウェブインターフェース） | SnowsightなどのSnowflake公式WebUI。ユーザーはここからMFA登録を開始できる。 |

## 1-2. 重要コンセプトまとめ

- **答えが False の理由**: MFAはデフォルトで有効（enabled）だが、新規ユーザーが**自動的にMFAに登録（enrolled）される**わけではない
- **「enabled」と「enrolled」の違い（試験の核心）**:
  | 用語 | 意味 | MFAの場合 |
  |------|------|---------|
  | enabled（有効化） | 機能が利用可能な状態 | 全アカウント・全ユーザーでデフォルト有効 |
  | enrolled（登録済み） | ユーザーが実際に登録・参加している状態 | ユーザー自身が手動で登録する必要あり |
- **MFA登録の流れ**:
  1. ユーザーがSnowflakeウェブインターフェース（Snowsight）にアクセス
  2. ユーザー自身がMFA登録プロセスを開始（initiate）
  3. ユーザー自身が登録プロセスを完了（complete）
- **試験ポイント**: 「automatically enrolled」は誤り。「Instead, a user must initiate and complete the process themselves」が正しい
- **関連問題**: 063（MFAの対応クライアント）

## 1-3. 公式ドキュメントURL

- [Multi-Factor Authentication (MFA)](https://docs.snowflake.com/en/user-guide/security-mfa)

---

## 2-1. 問題文（英語）

> True or False: When a new user is created, the user is automatically enrolled in multi-factor authentication (MFA).
>
> A. True
>
> B. False

## 2-2. 問題文の文法解析

### 文1: "When a new user is created, the user is automatically enrolled in multi-factor authentication (MFA)."

- **時間節**: When a new user is created（受動態 — 「新規ユーザーが作成されたとき」）
- **主語 (S)**: the user
- **動詞 (V)**: is automatically enrolled in（受動態 + 副詞）
- **修飾語 (M)**: in multi-factor authentication（前置詞句）
- **文型**: SV（受動態）
- **注目ポイント**:
  - `is created`（受動態）→ `is enrolled`（受動態）— 両方の動詞が受動態。「作られる・登録される」という受動の連鎖
  - `automatically` — 「自動的に」。この副詞の有無が正誤のポイント（実際は自動ではない）
  - `enrolled in ~` — 「〜に登録された」。`enroll in ~`（〜に登録する）の受動態

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| automatically enrolled | 形容詞句（受動態） | 自動的に登録された | New users are NOT automatically enrolled in MFA. |
| enrolled in ~ | 動詞句（受動態） | 〜に登録された | Users must enroll themselves in MFA manually. |
| multi-factor authentication | 名詞句 | 多要素認証 | MFA adds a second layer of security. |

## 2-3. 問題文（日本語）

> 正誤問題: 新しいユーザーが作成されると、そのユーザーは自動的に多要素認証（MFA）に登録される。
>
> A. 正しい（True）
>
> B. 誤り（False）

---

## 3-1. 解説文（英語）

> Multi-factor authentication (MFA) is enabled by default for all Snowflake accounts, and any Snowflake user can enroll themselves in MFA through the Snowflake web interface. Although multi-factor is enabled for all accounts and all users, new users are not automatically enrolled in MFA. Instead, a user must initiate and complete the MFA enrolment process themselves.

## 3-2. 解説文の文法解析

### 文1: "Multi-factor authentication (MFA) is enabled by default for all Snowflake accounts, and any Snowflake user can enroll themselves in MFA through the Snowflake web interface."

- **前節**: MFA / is enabled by default / for all Snowflake accounts（受動態 SV + 修飾）
- **後節**: any Snowflake user / can enroll themselves / in MFA / through the Snowflake web interface
- **注目ポイント**:
  - `enabled by default` — 「デフォルトで有効」。`by default` はデフォルト状態を示す副詞句
  - `enroll themselves in ~` — 再帰代名詞 `themselves`（自分自身）。「自分でMFAに登録する」。管理者が代わりに登録するのではなく、ユーザー自身が行うことを強調

### 文2: "Although multi-factor is enabled for all accounts and all users, new users are not automatically enrolled in MFA."

- **譲歩節**: Although multi-factor is enabled for all accounts and all users（「〜であるにもかかわらず」）
- **主節**: new users / are not automatically enrolled / in MFA（受動態の否定）
- **文型**: 譲歩節 + 主節（SV受動態）
- **注目ポイント**:
  - `Although ~` — 「〜にもかかわらず」の譲歩接続詞。`even though ~` とほぼ同義だが書き言葉的。前節が事実でも後節は別の事実（逆接）
  - `not automatically enrolled` — `automatically` の否定で「自動ではない」ことを明示

### 文3: "Instead, a user must initiate and complete the MFA enrolment process themselves."

- **接続副詞**: Instead（「その代わりに」）
- **主語 (S)**: a user
- **動詞 (V)**: must initiate and complete（義務の助動詞 + 並列動詞）
- **目的語 (O)**: the MFA enrolment process
- **強調語**: themselves（再帰代名詞 — 強調用法）
- **注目ポイント**:
  - `must initiate and complete` — 義務（must）+ 「開始して完了する」の2段階の並列
  - `themselves`（強調用法） — 「自分自身で・他人ではなく」を強調。主語（a user）を受ける再帰代名詞の強調的用法

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| enabled by default | 形容詞句 | デフォルトで有効な | MFA is enabled by default for all accounts. |
| enroll themselves in ~ | 動詞句 | 自分で〜に登録する | Users can enroll themselves in MFA via Snowsight. |
| although ~ | 接続詞 | 〜にもかかわらず | Although MFA is enabled, users must enroll themselves. |
| initiate | 動詞 | 開始する、着手する | A user must initiate the MFA enrollment process. |
| enrolment / enrollment | 名詞 | 登録（プロセス）| Complete the MFA enrolment process in Snowsight. |
| themselves（強調） | 再帰代名詞 | 自分自身で（他人でなく） | Users must complete the process themselves. |

## 3-3. 解説文（日本語）

> 多要素認証（MFA）はすべてのSnowflakeアカウントでデフォルトで有効になっており、すべてのSnowflakeユーザーはSnowflakeウェブインターフェースを通じて自分でMFAに登録できます。多要素認証はすべてのアカウントとユーザーで有効になっていますが、新規ユーザーが自動的にMFAに登録されるわけではありません。その代わりに、ユーザーは自分でMFA登録プロセスを開始・完了する必要があります。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
