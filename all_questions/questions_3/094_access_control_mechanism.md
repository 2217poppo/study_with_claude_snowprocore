# 094: Access Control Mechanism

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-16
**正答**: A, B, D

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Securable Object（セキュアブルオブジェクト） | 権限を付与できるオブジェクト。DB、スキーマ、テーブル、ビュー、WH等 |
| Privilege（権限） | オブジェクトに対する操作権限（SELECT, INSERT, USAGE等）。**ロールにのみ付与可能**（個人には直接不可） |
| Role（ロール） | 権限の集合体。ユーザーや他のロールに付与できる |
| Role Hierarchy（ロール階層） | ロールが他のロールに付与され、権限が上位に継承される仕組み |

## 1-2. 重要コンセプトまとめ

- Snowflakeのアクセス制御の3つの原則:
  1. **権限はセキュアブルオブジェクトに付与できる**（DB, テーブル, WH等）
  2. **権限はロールにのみ付与**（個人ユーザーには直接付与できない）
  3. **ロールは他のユーザーにも他のロールにも付与可能**
- 「ロールは他のロールに付与できない」は**誤り** — ロール階層の仕組みがある
- ユーザーへの権限付与: ユーザー → ロール → 権限（間接的にのみ）

## 1-3. 公式ドキュメントURL

- [Access Control Overview](https://docs.snowflake.com/en/user-guide/security-access-control-overview)

---

## 2-1. 問題文（英語）

> Which of the following statements best describe Snowflake's access control mechanism? Select all that apply.
>
> A. Privileges can be granted on securable objects.
> B. Roles can be granted to other users.
> C. Roles can NOT be granted to other roles.
> D. Roles can be granted to other roles.

## 2-2. 問題文の文法解析

### 文1: "Which of the following statements best describe Snowflake's access control mechanism?"

- **主語 (S)**: Which of the following statements
- **動詞 (V)**: best describe
- **目的語 (O)**: Snowflake's access control mechanism
- **文型**: SVO

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| access control mechanism | 名詞句 | アクセス制御の仕組み | Snowflake's access control mechanism. |
| securable object | 名詞句 | 権限を付与可能なオブジェクト | Privileges can be granted on securable objects. |
| grant | 動詞 | 付与する | Roles can be granted to users. |

## 2-3. 問題文（日本語）

> Snowflakeのアクセス制御の仕組みを最もよく説明しているのはどれですか？該当するものをすべて選んでください。
>
> A. セキュアブルオブジェクトに対して権限を付与できる。
> B. ロールは他のユーザーに付与できる。
> C. ロールは他のロールに付与できない。
> D. ロールは他のロールに付与できる。

---

## 3-1. 解説文（英語）

> Objects or entities that can be granted privileges are called securable objects. Each securable object can be assigned a set of rights. Privileges can only be granted to roles; they cannot be granted directly to individual users. Therefore, it is possible to grant roles to other users or other roles.

## 3-2. 解説文の文法解析

### 文1: "Objects or entities that can be granted privileges are called securable objects."

- **主語 (S)**: Objects or entities that can be granted privileges
- **動詞 (V)**: are called（受動態）
- **補語 (C)**: securable objects
- **文型**: SVC（受動態）
- **注目ポイント**: 「are called ~」で定義を示す。セキュアブルオブジェクトの定義文。

### 文2: "Privileges can only be granted to roles; they cannot be granted directly to individual users."

- **主語 (S)**: Privileges / they
- **動詞 (V)**: can only be granted / cannot be granted
- **修飾語 (M)**: to roles / directly to individual users
- **文型**: SV（受動態）; SV（受動態）
- **注目ポイント**: 「can only ~ ; cannot ~」で許可と禁止を対比。権限付与はロールのみ可能。

### 文3: "Therefore, it is possible to grant roles to other users or other roles."

- **主語 (S)**: it（形式主語）
- **動詞 (V)**: is
- **補語 (C)**: possible to grant roles to other users or other roles
- **文型**: SVC
- **注目ポイント**: 「it is possible to ~」で「～することが可能」。ロールの付与先を明示。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| are called | 受動態 | ～と呼ばれる | Called securable objects. |
| can only be granted to | 受動態 | ～にのみ付与可能 | Privileges can only be granted to roles. |
| it is possible to | 構文 | ～することが可能 | It is possible to grant roles to other roles. |

## 3-3. 解説文（日本語）

> 権限を付与できるオブジェクトやエンティティはセキュアブルオブジェクトと呼ばれます。各セキュアブルオブジェクトには一連の権限を割り当てることができます。権限はロールにのみ付与可能であり、個々のユーザーに直接付与することはできません。したがって、ロールを他のユーザーや他のロールに付与することが可能です。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
