# 008: MFA — Enabled by Default for All Accounts

**SnowPro Core Domain**: Domain 2 — Account Access and Security
**作成日**: 2026-04-17
**正答**: True（MFAはすべてのSnowflakeアカウントでデフォルト有効）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| MFA（Multi-Factor Authentication / 多要素認証） | パスワードに加えて第2の認証要素（Duo Mobileアプリ等）を要求する認証方式。全エディション・全アカウントでデフォルト有効 |
| Snowflake Edition（エディション） | Snowflakeの製品グレード。Standard / Enterprise / Business Critical / VPS の4種類。MFAは**すべてのエディション**で利用可能 |
| Duo Security | SnowflakeのMFAで使用される認証プロバイダー。スマートフォンアプリで認証コードを生成する |
| MFA Enrollment（MFA登録） | MFAを使用するためにユーザーが自分で登録するプロセス。**新規ユーザーへの自動登録はない** — 各ユーザーが自発的に登録する必要がある |

## 1-2. 重要コンセプトまとめ

- **MFAはすべてのSnowflakeアカウントでデフォルト有効（True）**
  - エディションによる制限なし（Standard含む全エディション対応）
  - 有効化すること自体はデフォルトだが、各ユーザーが自分でenrollment（登録）を完了させる必要がある
- **MFAがサポートするクライアント**:
  - Snowsight（WebUI）
  - SnowSQL（CLIツール）
  - JDBCドライバー
  - ODBCドライバー
  - その他のコネクタ・ドライバー
- **MFAが適用されないケース**:
  - Snowpipe（サーバーレスサービス。ログイン概念がないため）
  - Key Pair Authentication（パスワード自体を使わない認証方式）
- **混同しやすい問題**:
  - 「MFAは有効（enabled）」= True — 機能として利用可能
  - 「MFAは自動登録（auto-enrolled）」= False — ユーザーが手動で登録する必要がある

## 1-3. 公式ドキュメントURL

- [Multi-Factor Authentication (MFA)](https://docs.snowflake.com/en/user-guide/security-mfa)

---

## 2-1. 問題文（英語）

> True or False: Multi-factor authentication, or MFA, is enabled by default for all Snowflake accounts.
>
> A. False
> B. True ✓

## 2-2. 問題文の文法解析

### 文1: "True or False: Multi-factor authentication, or MFA, is enabled by default for all Snowflake accounts."

- **形式**: True or False問題（真偽問題）
- **主語 (S)**: Multi-factor authentication, or MFA（多要素認証、すなわちMFA）
- **動詞 (V)**: is enabled（有効になっている / 受動態）
- **様態の副詞句**: by default（デフォルトで）
- **対象**: for all Snowflake accounts（すべてのSnowflakeアカウントで）
- **文型**: SV（受動態）
- **注目ポイント**:
  - `Multi-factor authentication, or MFA` = 同格句（前の名詞を別の名前・略称で言い換える）
  - `is enabled by default` = 「デフォルトで有効になっている」（受動態 + by default の組み合わせ）
  - `for all ~` = 「すべての〜に対して」（例外なく全体に適用）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| is enabled by default | 受動態句 | デフォルトで有効になっている | MFA is enabled by default for all accounts. |
| for all ~ | 前置詞句 | すべての〜に対して | MFA is available for all Snowflake editions. |
| A, or B | 同格句 | A、すなわちB（略称の導入） | Multi-factor authentication, or MFA, is required. |

## 2-3. 問題文（日本語）

> 真偽問題: 多要素認証（MFA）は、すべてのSnowflakeアカウントでデフォルトで有効になっている。
>
> A. 誤り（False）
> B. 正しい（True）✓

---

## 3-1. 解説文（英語）

> MFA is enabled by default for all Snowflake accounts and is available in all Snowflake editions.
>
> https://docs.snowflake.com/en/user-guide/security-mfa

## 3-2. 解説文の文法解析

### 文1: "MFA is enabled by default for all Snowflake accounts and is available in all Snowflake editions."

- **主語 (S)**: MFA
- **動詞1 (V1)**: is enabled（有効になっている / 受動態）
- **様態1**: by default（デフォルトで）
- **範囲1**: for all Snowflake accounts（すべてのアカウントで）
- **動詞2 (V2)**: is available（利用可能である）
- **範囲2**: in all Snowflake editions（すべてのエディションで）
- **文型**: SV1 and V2（並列述語）
- **注目ポイント**:
  - `is enabled by default` と `is available in all editions` の2点が試験ポイント
  - `available` = 「利用可能な」（機能が使えることを示す）
  - 1文で「全アカウントでデフォルト有効」+ 「全エディションで利用可能」の2点を述べている

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| is available in | 動詞句 | 〜で利用可能である | MFA is available in all Snowflake editions. |
| all Snowflake editions | 名詞句 | すべてのSnowflakeエディション | Standard is the entry-level of all Snowflake editions. |

## 3-3. 解説文（日本語）

> MFAはすべてのSnowflakeアカウントでデフォルトで有効になっており、すべてのSnowflakeエディションで利用可能です。

---

## 復習メモ

- [ ] MFAはすべてのアカウントでデフォルト有効・すべてのエディションで利用可能（True）を覚えた
- [ ] 「デフォルト有効」≠「自動登録済み」の区別（各ユーザーが手動でenrollment必要）を理解した
- [ ] `is available in all ~`（すべての〜で利用可能）という表現を確認した
