# 046: Bypass Network Policy

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-13
**正答**: Contact Snowflake Support

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| MINS_TO_BYPASS_NETWORK_POLICY | ユーザーがネットワークポリシーを一時的にバイパスできる分数を指定するユーザープロパティ。**Snowflakeサポートのみが設定可能**。管理者がロックアウトされた場合の緊急手段 |
| Network Policy（ネットワークポリシー） | IPアドレスに基づいてSnowflakeへのアクセスを制御するセキュリティ機能。許可リスト・ブロックリストで管理 |
| Bypass（バイパス） | セキュリティ制御を一時的に迂回すること。ネットワークポリシーで管理者がロックアウトされた場合の緊急措置 |
| SYSADMIN | DB・WH等のデータオブジェクト管理ロール。ネットワークポリシーのバイパス設定は不可 |
| SECURITYADMIN | アクセス権の管理ロール。ネットワークポリシーの作成・適用は可能だが、バイパス設定は不可 |

## 1-2. 重要コンセプトまとめ

- `MINS_TO_BYPASS_NETWORK_POLICY` は **Snowflakeサポートのみが設定可能**
- どのロール（ACCOUNTADMIN含む）でも設定できない — サポートへの連絡が必須
- 用途: 管理者がネットワークポリシーで自分自身をロックアウトしてしまった場合の緊急対応
- ネットワークポリシー関連の権限整理:
  - **作成・適用**: SECURITYADMIN（または適切な権限を持つロール）
  - **バイパス設定**: Snowflakeサポートのみ
- 試験のひっかけ: SECURITYADMIN（セキュリティ管理者）が正解に見えるが、この特殊プロパティはサポート専用

## 1-3. 公式ドキュメントURL

- [Bypassing a Network Policy](https://docs.snowflake.com/en/user-guide/network-policies#bypassing-a-network-policy)

---

## 2-1. 問題文（英語）

> What is required to alter the property MINS_TO_BYPASS_NETWORK_POLICY for a user?
>
> A. Use SYSADMIN role
> B. Use SECURITYADMIN role
> C. Contact Snowflake Support
> D. Use USERADMIN role

## 2-2. 問題文の文法解析

### 文1: "What is required to alter the property MINS_TO_BYPASS_NETWORK_POLICY for a user?"

- **主語 (S)**: What
- **動詞 (V)**: is required（受動態）
- **修飾語 (M)**: to alter the property MINS_TO_BYPASS_NETWORK_POLICY for a user（目的の不定詞句）
- **文型**: SV（受動態疑問文）
- **注目ポイント**: `What is required to ~?` は「～するために何が必要か？」。`alter the property ~ for a user` で「ユーザーの～プロパティを変更する」。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| alter | verb | 変更する | Alter the property for a user. |
| property | noun | プロパティ、属性 | The MINS_TO_BYPASS property. |
| bypass | verb/noun | バイパスする、迂回する | Bypass the network policy temporarily. |
| required | adjective | 必要な | What is required to change this setting? |

## 2-3. 問題文（日本語）

> ユーザーのMINS_TO_BYPASS_NETWORK_POLICYプロパティを変更するために何が必要ですか？
>
> A. SYSADMINロールを使用する
> B. SECURITYADMINロールを使用する
> C. Snowflakeサポートに連絡する
> D. USERADMINロールを使用する

---

## 3-1. 解説文（英語）

> Only Snowflake support can set the value for the MINS_TO_BYPASS_NETWORK_POLICY property for a user.

## 3-2. 解説文の文法解析

### 文1: "Only Snowflake support can set the value for the MINS_TO_BYPASS_NETWORK_POLICY property for a user."

- **主語 (S)**: Only Snowflake support
- **動詞 (V)**: can set
- **目的語 (O)**: the value for the MINS_TO_BYPASS_NETWORK_POLICY property
- **修飾語 (M)**: Only（限定副詞）、for a user（対象）
- **文型**: SVO
- **注目ポイント**: `Only ~` が文頭で「～だけが」と排他的に限定。非常にシンプルだが明確に「サポートのみ」と断言。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| only | adverb | ～だけが | Only Snowflake support can set this. |
| set the value | phrase | 値を設定する | Set the value for the property. |

## 3-3. 解説文（日本語）

> Snowflakeサポートのみが、ユーザーのMINS_TO_BYPASS_NETWORK_POLICYプロパティの値を設定できます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
