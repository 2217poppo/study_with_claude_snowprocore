# 116: ACCOUNTADMIN Most Powerful Role

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-14
**正答**: ACCOUNTADMIN

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| ACCOUNTADMIN | Snowflakeアカウントで**最も強力なロール**。SYSADMIN + SECURITYADMINの全権限を継承。アクセスは厳格に管理すべき。MFA必須推奨 |

## 1-2. 重要コンセプトまとめ

- ACCOUNTADMIN = **最も強力なロール**
- ACCOUNTADMINのセキュリティベストプラクティス:
  - アクセスを**厳格に管理**
  - **MFAを必ず有効化**
  - 日常操作には使用しない
  - 最小限のユーザーのみに付与

## 1-3. 公式ドキュメントURL

- [System-Defined Roles](https://docs.snowflake.com/en/user-guide/security-access-control-overview#system-defined-roles)

---

## 2-1. 問題文（英語）

> Which of the following is the most powerful role in a Snowflake account?
>
> A. SECURITYADMIN
> B. SYSADMIN
> C. ACCOUNTADMIN
> D. PUBLIC

## 2-3. 問題文（日本語）

> Snowflakeアカウントで最も強力なロールはどれですか？

---

## 3-1. 解説文（英語）

> ACCOUNTADMIN is the most powerful role in a Snowflake account. Access to the ACCOUNTADMIN role should be managed carefully. Any user with the ACCOUNTADMIN role should have MFA enabled to ensure it is not easy to compromise their account.

## 3-3. 解説文（日本語）

> ACCOUNTADMINはSnowflakeアカウントで最も強力なロールです。ACCOUNTADMINロールへのアクセスは慎重に管理すべきです。ACCOUNTADMINロールを持つユーザーはMFAを有効化してアカウント侵害を防ぐべきです。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
