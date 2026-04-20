# 014: Release Cycle Day 2

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-15
**正答**: B, C

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Phased Release（段階的リリース） | Snowflakeが新バージョンを全アカウントに一斉展開せず、段階的にデプロイする戦略 |
| Early Access | Enterprise以上のアカウントが申請できる早期アクセス。Day 1にデプロイされる |
| Regular Access | Standard EditionおよびEarly Access未申請のEnterprise以上のアカウント |

## 1-2. 重要コンセプトまとめ

- リリースサイクル（3段階）:
  - **Day 1**: Early Accessに申請したEnterprise以上のアカウント
  - **Day 1 or 2**: **全Standard Editionアカウント**
  - **Day 2**: **残りのEnterprise以上のアカウント**（Early Access未申請）
- Day 2に更新されるアカウント:
  1. Standard Edition全体（Day 1 or 2）
  2. Early Access未申請のEnterprise以上（Day 2）
- Early Access申請はSnowflakeサポートに連絡
- Early AccessデプロイとFinalデプロイの間には**最低24時間**の間隔

## 1-3. 公式ドキュメントURL

- [Snowflake Releases](https://docs.snowflake.com/en/user-guide/intro-releases)

---

## 2-1. 問題文（英語）

> During a weekly release cycle, which of the following accounts may be updated on the second day of release?
>
> A. Only business critical edition accounts
> B. All enterprise edition (and above) accounts that have not opted into early access
> C. All standard edition accounts
> D. Only those Enterprise edition accounts which have opted into early access

## 2-3. 問題文（日本語）

> 週次リリースサイクルにおいて、リリース2日目に更新される可能性があるアカウントはどれですか？

---

## 3-1. 解説文（英語）

> Snowflake does not instantly deploy a new version to all Snowflake accounts; rather, customer accounts are moved into the new release over time in a phased manner. Day 1 (early access): Deployed for Enterprise edition (or higher) accounts that have elected for early access. Day 1 or 2 (regular access): Deployment of all Snowflake accounts on the Standard edition. Day 2 (last): All remaining Enterprise edition (or higher) accounts are deployed. Between an early access deployment and a final deployment, a minimum of 24 hours must pass.

## 3-3. 解説文（日本語）

> Snowflakeは新バージョンを全アカウントに即座にデプロイせず、段階的に展開します。Day 1（早期アクセス）: Early Accessに申請したEnterprise以上のアカウント。Day 1または2（通常アクセス）: 全Standard Editionアカウント。Day 2（最後）: 残りのEnterprise以上のアカウント。Early AccessとFinalデプロイの間には最低24時間の間隔が必要です。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
