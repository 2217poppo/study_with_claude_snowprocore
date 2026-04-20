# 101: Database Replication Edition

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-14
**正答**: Standard

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Database Replication | 組織内のSnowflakeアカウント間でデータベースを複製する機能。**すべてのエディション**で利用可能 |
| Database Failover/Failback | 障害時にレプリカに切り替え/復帰する機能。**Business Critical以上**で利用可能。Replicationとは別 |

## 1-2. 重要コンセプトまとめ

- Database Replicationは**全エディション対応** → 最小は**Standard**
- **Replication ≠ Failover/Failback** の区別が重要:
  - Replication: **Standard以上**（全エディション）
  - Failover/Failback: **Business Critical以上**
- 試験のひっかけ: Failoverと混同してEnterprise/Business Criticalと答えがち

## 1-3. 公式ドキュメントURL

- [Snowflake Editions](https://docs.snowflake.com/en/user-guide/intro-editions)

---

## 2-1. 問題文（英語）

> What is the minimum Snowflake edition that supports Database replication between Snowflake accounts (within an organization)?
>
> A. Enterprise
> B. Standard
> C. Virtual Private Snowflake
> D. Business Critical

## 2-2. 問題文の文法解析

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| replication | noun | レプリケーション（複製） | Database replication between accounts. |
| within an organization | phrase | 組織内で | Replication within an organization. |

## 2-3. 問題文（日本語）

> 組織内のSnowflakeアカウント間のデータベースレプリケーションをサポートする最小エディションは？

---

## 3-1. 解説文（英語）

> Database replication is supported in all Snowflake editions; thus, the minimum edition that supports it is the Standard edition.

## 3-3. 解説文（日本語）

> データベースレプリケーションはすべてのSnowflakeエディションでサポートされています。したがって最小エディションはStandardです。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
