# 072: Partner Connect ACCOUNTADMIN

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-16
**正答**: D

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Partner Connect | Snowsight内からサードパーティツール（ETL, BI等）のトライアルアカウントを作成・接続できる機能 |
| ACCOUNTADMIN | Snowflakeで最も強力なシステムロール。Partner Connectへのアクセスにはこのロールと検証済みメールアドレスが必要 |
| ORGADMIN | 組織レベルの管理ロール。複数アカウントの管理に使用。Partner Connectのアクセスには使われない |
| SECURITYADMIN | アクセス権（GRANT/REVOKE）を管理するロール。ユーザー管理は可能だがPartner Connectの利用は不可 |
| Verified Email Address（検証済みメールアドレス） | Snowflakeで認証済みのメールアドレス。Partner Connect利用にはACCOUNTADMINロール + 検証済みメールの両方が必要 |

## 1-2. 重要コンセプトまとめ

- Partner Connectの利用には**ACCOUNTADMINロール + 検証済みメールアドレス**の2条件が必要
- SYSADMIN, SECURITYADMIN, ORGADMIN, PUBLICではPartner Connectにアクセスできない
- Partner ConnectはSnowsight内の機能（UI操作）
- パートナーツールのトライアルアカウント作成・Snowflakeとの接続設定を簡略化する
- ACCOUNTADMINが必要な理由: パートナーツール接続のためにDB・WH・ユーザー等を自動作成するため

## 1-3. 公式ドキュメントURL

- [Connecting with a Snowflake Partner](https://docs.snowflake.com/en/user-guide/ecosystem-partner-connect#connecting-with-a-snowflake-partner)

---

## 2-1. 問題文（英語）

> What is the minimum required role to create a trial account through Partner Connect?
>
> A. SECURITYADMIN
> B. ORGADMIN
> C. SYSADMIN
> D. ACCOUNTADMIN
> E. PUBLIC

## 2-2. 問題文の文法解析

### 文1: "What is the minimum required role to create a trial account through Partner Connect?"

- **主語 (S)**: the minimum required role
- **動詞 (V)**: is
- **補語 (C)**: What
- **修飾語 (M)**: to create a trial account through Partner Connect（目的の不定詞句）
- **文型**: SVC（疑問文）
- **注目ポイント**: 「minimum required role」で最小限必要なロールを問う。「through Partner Connect」で手段を限定。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| minimum required | 形容詞句 | 最低限必要な | The minimum required role is ACCOUNTADMIN. |
| trial account | 名詞句 | トライアルアカウント | Create a trial account through Partner Connect. |

## 2-3. 問題文（日本語）

> Partner Connectを通じてトライアルアカウントを作成するために最低限必要なロールは何ですか？
>
> A. SECURITYADMIN
> B. ORGADMIN
> C. SYSADMIN
> D. ACCOUNTADMIN
> E. PUBLIC

---

## 3-1. 解説文（英語）

> Only users with the ACCOUNTADMIN role and a verified email address in Snowflake can access Partner Connect.

## 3-2. 解説文の文法解析

### 文1: "Only users with the ACCOUNTADMIN role and a verified email address in Snowflake can access Partner Connect."

- **主語 (S)**: Only users with the ACCOUNTADMIN role and a verified email address in Snowflake
- **動詞 (V)**: can access
- **目的語 (O)**: Partner Connect
- **文型**: SVO
- **注目ポイント**: 「Only users with ~」で対象を厳密に限定。「ACCOUNTADMIN role and a verified email address」の2条件がANDで結ばれている。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| verified | 形容詞 | 検証済みの | A verified email address is required. |
| access | 動詞 | アクセスする | Only ACCOUNTADMIN can access Partner Connect. |

## 3-3. 解説文（日本語）

> ACCOUNTADMINロールとSnowflakeで検証済みのメールアドレスを持つユーザーのみがPartner Connectにアクセスできます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
