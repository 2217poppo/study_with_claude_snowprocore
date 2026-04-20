# 108: ACCOUNTADMIN Role Inheritance

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-14
**正答**: A, C

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| ACCOUNTADMIN | 最上位システムロール。SYSADMIN + SECURITYADMIN（+ USERADMIN）の全権限を継承 |
| SYSADMIN | データオブジェクト管理ロール。ACCOUNTADMINに権限を継承 |
| SECURITYADMIN | アクセス権管理ロール。USERADMINの権限も継承。ACCOUNTADMINに権限を継承 |
| ORGADMIN | 組織レベルのロール。ACCOUNTADMINとは別系統（継承関係なし） |

## 1-2. 重要コンセプトまとめ

- ACCOUNTADMINが継承するロール: **SECURITYADMIN + SYSADMIN**（+ USERADMIN経由）
- ACCOUNTADMINが**継承しないロール**:
  - **ORGADMIN**（別系統、組織レベル）
  - **SUPERADMIN**（Snowflakeに存在しないロール）
- ロール階層: ACCOUNTADMIN > SECURITYADMIN > USERADMIN / ACCOUNTADMIN > SYSADMIN

## 1-3. 公式ドキュメントURL

- [System-Defined Roles](https://docs.snowflake.com/en/user-guide/security-access-control-overview#system-defined-roles)

---

## 2-1. 問題文（英語）

> ACCOUNTADMIN inherits the privileges of which of the following roles? Select all that apply.
>
> A. SECURITYADMIN
> B. SUPERADMIN
> C. SYSADMIN
> D. ORGADMIN

## 2-2. 問題文の文法解析

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| inherits the privileges of ~ | phrase | ～の権限を継承する | ACCOUNTADMIN inherits SYSADMIN privileges. |
| role hierarchy | noun | ロール階層 | Due to the role hierarchy. |

## 2-3. 問題文（日本語）

> ACCOUNTADMINはどのロールの権限を継承しますか？

---

## 3-1. 解説文（英語）

> Due to the role hierarchy and privileges inheritance, the ACCOUNTADMIN has all the privileges that SECURITYADMIN, USERADMIN, and SYSADMIN have.

## 3-3. 解説文（日本語）

> ロール階層と権限継承により、ACCOUNTADMINはSECURITYADMIN、USERADMIN、SYSADMINが持つすべての権限を持ちます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
