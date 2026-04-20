# 084: Shared DB RBAC Access

**SnowPro Core Domain**: Domain 5 — Data Collaboration
**作成日**: 2026-04-16
**正答**: B (True)

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| RBAC (Role-Based Access Control) | ロールに基づくアクセス制御。Snowflakeの主要なアクセス制御方式 |
| Shared Database（共有データベース） | コンシューマーがShareから作成するデータベース。プロバイダーのデータを参照する |
| Consumer Account（コンシューマーアカウント） | 共有データを利用する側のアカウント。共有DBを作成し、RBACでアクセス制御する |
| Share（シェア） | プロバイダーが作成するデータ共有オブジェクト。コンシューマーはこれからDBを作成する |

## 1-2. 重要コンセプトまとめ

- 共有データベースへのアクセスはSnowflakeのRBACで**制御可能**
- コンシューマーは共有DBを作成後、通常のオブジェクトと同様にGRANTで権限を管理できる
- 共有DB内のオブジェクトの変更はできないが、**アクセス権限の付与/取消は可能**
- これにより、コンシューマーアカウント内の特定のロール/ユーザーにのみ共有データへのアクセスを許可できる

## 1-3. 公式ドキュメントURL

- [Data Share Consumers](https://docs.snowflake.com/en/user-guide/data-share-consumers)

---

## 2-1. 問題文（英語）

> True or False: A database is created from a share by the consuming account; the access to this database is configurable using Snowflake's role-based access control.
>
> A. False
> B. True

## 2-2. 問題文の文法解析

### 文1: "A database is created from a share by the consuming account; the access to this database is configurable using Snowflake's role-based access control."

- **主語 (S)**: A database / the access to this database
- **動詞 (V)**: is created / is（configurable）
- **修飾語 (M)**: from a share / by the consuming account / using Snowflake's role-based access control
- **文型**: SV（受動態）; SVC
- **注目ポイント**: セミコロンで2つの独立節を接続。前半でDBの作成方法、後半でアクセス制御の仕組みを述べる。「configurable using ~」で「～を使って設定可能」。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| consuming account | 名詞句 | コンシューマーアカウント | Created by the consuming account. |
| configurable | 形容詞 | 設定可能な | Access is configurable using RBAC. |
| role-based access control | 名詞句 | ロールベースアクセス制御 | RBAC applies to shared databases. |

## 2-3. 問題文（日本語）

> True/False: コンシューマーアカウントがShareからデータベースを作成する。このデータベースへのアクセスは、Snowflakeのロールベースアクセス制御を使用して設定可能である。
>
> A. False（偽）
> B. True（真）

---

## 3-1. 解説文（英語）

> Correct. Role-based access control (RBAC), typically used for securing objects in a Snowflake account, also applies to consumer accounts and can control access to databases created on shared objects.

## 3-2. 解説文の文法解析

### 文1: "Role-based access control (RBAC), typically used for securing objects in a Snowflake account, also applies to consumer accounts and can control access to databases created on shared objects."

- **主語 (S)**: Role-based access control (RBAC)
- **動詞 (V)**: applies to ... and can control
- **目的語 (O)**: consumer accounts / access to databases
- **修飾語 (M)**: typically used for securing objects in a Snowflake account（挿入の過去分詞句）/ created on shared objects（後置修飾）
- **文型**: SVO + SVO（並列）
- **注目ポイント**: 「typically used for ~」の挿入句でRBACの通常用途を補足。「also applies to」で共有DBにも適用されることを示す。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| applies to | 動詞句 | ～に適用される | RBAC also applies to consumer accounts. |
| typically used for | 過去分詞句 | 通常は～に使用される | RBAC, typically used for securing objects. |
| created on | 過去分詞句 | ～上に作成された | Databases created on shared objects. |

## 3-3. 解説文（日本語）

> 正解です。ロールベースアクセス制御（RBAC）は通常Snowflakeアカウント内のオブジェクトを保護するために使用されますが、コンシューマーアカウントにも適用され、共有オブジェクトから作成されたデータベースへのアクセスを制御できます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
