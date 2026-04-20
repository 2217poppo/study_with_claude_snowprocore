# 028: AES 256 Encryption

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-15
**正答**: AES 256-bit encryption

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| AES-256 | Snowflakeが保存データの暗号化に使用する規格。256ビット鍵。128ビットではない |

## 1-2. 重要コンセプトまとめ

- 保存データ（Data at Rest）= **AES 256-bit** 暗号化
- AES-128ではなく**256**ビット
- SHA/MD5はハッシュ関数であり暗号化方式ではない
- 転送中データ（Data in Transit）= TLS 1.2

## 1-3. 公式ドキュメントURL

- [Encryption Key Management](https://docs.snowflake.com/en/user-guide/security-encryption-manage)

---

## 2-1. 問題文（英語）

> In Snowflake, all data at rest is encrypted using which encryption method?
>
> A. AES 256-bit encryption
> B. AES 128-bit encryption
> C. SHA
> D. MD5

## 2-3. 問題文（日本語）

> Snowflakeで保存データの暗号化に使用される方式は？

---

## 3-1. 解説文（英語）

> In Snowflake, all data at rest is encrypted using AES 256-bit encryption.

## 3-3. 解説文（日本語）

> Snowflakeでは、すべての保存データがAES 256ビット暗号化を使用して暗号化されています。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
