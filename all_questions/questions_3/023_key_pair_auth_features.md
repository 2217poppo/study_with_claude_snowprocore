# 023: Key Pair Authentication Features

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-15
**正答**: C, D

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Key Pair Authentication | 公開鍵と秘密鍵のペアを使用する認証方式。ユーザー名/パスワードに加えた追加セキュリティレイヤー |
| Public Key（公開鍵） | ユーザーに割り当てられる鍵。最大**2つ**まで割り当て可能 |
| Private Key（秘密鍵） | 認証に使用される鍵。ユーザーが保持 |
| Key Rotation（鍵ローテーション） | 鍵を新しいものに切り替えること。**いつでも実行可能** |

## 1-2. 重要コンセプトまとめ

- Key Pair Authenticationの特徴:
  - ユーザーに公開鍵を**最大2つ**まで割り当て可能
  - 鍵は**いつでもローテーション可能**
  - **全エディション対応**（Business Critical限定ではない）
  - ログインごとのユーザー名/パスワード入力は不要（鍵ベース）
  - 全SnowSQLおよびドライバー/コネクタがサポート

## 1-3. 公式ドキュメントURL

- [Key Pair Authentication](https://docs.snowflake.com/en/user-guide/key-pair-auth)

---

## 2-1. 問題文（英語）

> Which of the following statements is true for Snowflake's key pair authentication? Select all that apply.
>
> A. Key-pair authentication is supported only by the Business-Critical edition.
> B. It requires inputting your Snowflake username and password for every login attempt.
> C. A user may have up to two public keys allocated to them.
> D. If desired, the keys can be rotated.

## 2-3. 問題文（日本語）

> Snowflakeのキーペア認証に関して正しいのはどれですか？

---

## 3-1. 解説文（英語）

> Snowflake provides an additional layer of security by supporting key pair authentication in addition to the standard username/password login. A user can have up to two public keys, which can be rotated at any point in time. Key pair authentication is supported by all SnowSQL and Snowflake drivers and connectors. All Snowflake editions support Key-pair authentication.

## 3-3. 解説文（日本語）

> Snowflakeは標準のユーザー名/パスワード認証に加えてキーペア認証をサポートし、追加のセキュリティレイヤーを提供します。ユーザーは最大2つの公開鍵を持つことができ、いつでもローテーション可能です。すべてのSnowflakeエディションがキーペア認証をサポートしています。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
