# 092: MFA Disable and Re-enroll

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-16
**正答**: A (True)

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| MFA (Multi-Factor Authentication) | 多要素認証。パスワードに加えて追加の認証要素を要求するセキュリティ機能 |
| ACCOUNTADMIN | 最も強力なシステムロール。MFAの無効化が可能 |
| SECURITYADMIN | セキュリティ管理ロール。MFAの無効化が可能（SECURITYADMIN以上） |
| MFA Enrollment（MFA登録） | ユーザーがMFAに自己登録すること。Snowsight経由で実施 |

## 1-2. 重要コンセプトまとめ

- MFAはすべてのSnowflakeアカウントで**デフォルト有効**
- ユーザーは**Snowsight経由で自分自身をMFAに登録**できる
- **SECURITYADMIN以上**（SECURITYADMIN, ACCOUNTADMIN）がユーザーのMFAを無効化可能
- MFA無効化後、ユーザーはMFA機能を使うために**再登録が必要**
- SYSADMINやUSERADMINではMFAの無効化はできない

## 1-3. 公式ドキュメントURL

- [Multi-Factor Authentication (MFA)](https://docs.snowflake.com/en/user-guide/security-mfa)

---

## 2-1. 問題文（英語）

> True or False: An ACCOUNTADMIN or SECURITYADMIN can disable a user's MFA and allow the user to re-enroll in MFA if required.
>
> A. True
> B. False

## 2-2. 問題文の文法解析

### 文1: "An ACCOUNTADMIN or SECURITYADMIN can disable a user's MFA and allow the user to re-enroll in MFA if required."

- **主語 (S)**: An ACCOUNTADMIN or SECURITYADMIN
- **動詞 (V)**: can disable ... and allow
- **目的語 (O)**: a user's MFA / the user to re-enroll in MFA
- **修飾語 (M)**: if required
- **文型**: SVO + SVOC
- **注目ポイント**: 「allow + O + to不定詞」で「Oが～できるようにする」。「if required」は条件の省略形。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| disable | 動詞 | 無効化する | Disable a user's MFA enrollment. |
| re-enroll | 動詞 | 再登録する | The user must re-enroll in MFA. |
| if required | 条件句 | 必要に応じて | Re-enroll if required. |

## 2-3. 問題文（日本語）

> True/False: ACCOUNTADMINまたはSECURITYADMINはユーザーのMFAを無効化し、必要に応じてユーザーがMFAに再登録できるようにすることができる。
>
> A. True（真）
> B. False（偽）

---

## 3-1. 解説文（英語）

> Multi-factor authentication (MFA) is enabled by default for all Snowflake accounts, and any Snowflake user can enroll themselves in MFA through the Snowflake web interface. An administrator can disable a user's MFA enrolment; in this case, the user must re-enroll to access the MFA features and functionality. An administrator with the SECURITYADMIN or above role can disable MFA for a user.

## 3-2. 解説文の文法解析

### 文1: "Multi-factor authentication (MFA) is enabled by default for all Snowflake accounts, and any Snowflake user can enroll themselves in MFA through the Snowflake web interface."

- **主語 (S)**: MFA / any Snowflake user
- **動詞 (V)**: is enabled / can enroll
- **目的語**: themselves
- **修飾語 (M)**: by default / for all Snowflake accounts / in MFA / through the Snowflake web interface
- **文型**: SV（受動態）; SVO

### 文2: "An administrator with the SECURITYADMIN or above role can disable MFA for a user."

- **主語 (S)**: An administrator with the SECURITYADMIN or above role
- **動詞 (V)**: can disable
- **目的語 (O)**: MFA
- **修飾語 (M)**: for a user
- **文型**: SVO
- **注目ポイント**: 「SECURITYADMIN or above」で最低限SECURITYADMINが必要であることを示す。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| enabled by default | 受動態 | デフォルトで有効化されている | MFA is enabled by default. |
| enroll themselves | 再帰動詞句 | 自分自身を登録する | Users can enroll themselves in MFA. |
| or above | 前置詞句 | ～以上 | SECURITYADMIN or above role. |

## 3-3. 解説文（日本語）

> 多要素認証（MFA）はすべてのSnowflakeアカウントでデフォルトで有効化されており、すべてのSnowflakeユーザーはSnowflake Webインターフェースを通じてMFAに自己登録できます。管理者はユーザーのMFA登録を無効化できます。この場合、ユーザーはMFA機能にアクセスするために再登録する必要があります。SECURITYADMIN以上のロールを持つ管理者がユーザーのMFAを無効化できます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
