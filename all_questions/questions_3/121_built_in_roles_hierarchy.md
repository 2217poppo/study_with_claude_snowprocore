# 121: Built-in Roles — Privilege Inheritance via Hierarchy

**SnowPro Core Domain**: Domain 2 — Account Management and Security
**作成日**: 2026-04-17
**正答**: B, C, D（ACCOUNTADMIN→SECURITYADMIN作成ロール変更可 / SECURITYADMIN→USERADMIN作成ユーザー削除可 / ACCOUNTADMIN→SYSADMIN作成オブジェクト削除可）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Role Hierarchy（ロール階層） | Snowflakeのシステム定義ロールの上下関係。上位ロールは下位ロールの権限をすべて継承する |
| Privileges Inheritance（権限継承） | ロール階層において、上位ロールが下位ロールのすべての権限を自動的に引き継ぐ仕組み |
| ACCOUNTADMIN | 最上位のシステム定義ロール。SYSADMIN・SECURITYADMINの全権限を継承する。ロール階層の頂点 |
| SECURITYADMIN | ACCOUNTADMINの下位。グラント管理専門ロール。USERADMINの権限も継承するため、ユーザー削除なども可能 |
| SYSADMIN | ACCOUNTADMINの下位。データベース・ウェアハウス・テーブルなどのデータオブジェクト作成・管理が可能 |
| USERADMIN | SECURITYADMINの下位。ユーザー・ロールの作成・管理に特化したロール |
| PUBLIC | 最下位ロール。すべてのSnowflakeユーザーに自動付与されるロール。最小権限のみ |

## 1-2. 重要コンセプトまとめ

- **Snowflakeのロール階層（上位→下位）**
  ```
  ACCOUNTADMIN
  ├── SYSADMIN
  └── SECURITYADMIN
      └── USERADMIN
              └── PUBLIC
  ```
- **権限継承のルール**
  - 上位ロールは下位ロールのすべての権限を継承する
  - ACCOUNTADMIN → 全ロールの権限を持つ
  - SECURITYADMIN → USERADMIN・PUBLIC の権限を持つ
  - SYSADMIN → PUBLIC の権限を持つ
- **各選択肢の解説**
  - B. ACCOUNTADMIN can modify a ROLE created by SECURITYADMIN → ✅ ACCOUNTADMINはSECURITYADMINより上位なので可
  - C. SECURITYADMIN can drop USERS created by USERADMIN → ✅ SECURITYADMINはUSERADMINより上位なので可
  - D. ACCOUNTADMIN can delete objects created by SYSADMIN → ✅ ACCOUNTADMINはSYSADMINより上位なので可
  - A. PUBLIC can delete objects created by SYSADMIN → ❌ PUBLICはSYSADMINより下位（権限なし）
- **試験でのポイント**
  - 「上位ロールは下位ロールの作成したものを管理できるか？」→ YES（継承のため）
  - 「下位ロールは上位ロールの作成したものを管理できるか？」→ NO

## 1-3. 公式ドキュメントURL

- [System-Defined Roles](https://docs.snowflake.com/en/user-guide/security-access-control-overview#system-defined-roles)
- [Role Hierarchy and Privilege Inheritance](https://docs.snowflake.com/en/user-guide/security-access-control-overview#role-hierarchy-and-privilege-inheritance)

---

## 2-1. 問題文（英語）

> Which of the following statements regarding built-in roles' privileges in Snowflake are true? Select all that apply.
>
> A. The PUBLIC role can delete objects created by SYSADMIN
> B. ACCOUNTADMIN can modify a ROLE created by the SECURITYADMIN
> C. SECURITYADMIN can drop USERS created by a USERADMIN
> D. ACCOUNTADMIN can delete objects created by a SYSADMIN

## 2-2. 問題文の文法解析

### 文1: "Which of the following statements regarding built-in roles' privileges in Snowflake are true?"

- **主語 (S)**: Which of the following statements
- **後置修飾**: regarding built-in roles' privileges in Snowflake（〜に関する）
- **動詞 (V)**: are
- **補語 (C)**: true
- **文型**: SVC（疑問文）
- **注目ポイント**: 
  - `regarding ~` = 〜に関して（前置詞的用法の分詞。`about ~` のフォーマルな表現）
  - `built-in roles' privileges` = ビルトインロールの権限（所有格の複数形 `roles'`）

### 各選択肢の文法:

- A: "The PUBLIC role **can delete** objects **created by** SYSADMIN"（can + 動詞、過去分詞の後置修飾）
- B: "ACCOUNTADMIN **can modify** a ROLE **created by** the SECURITYADMIN"（同形式）
- C: "SECURITYADMIN **can drop** USERS **created by** a USERADMIN"（同形式）
- D: "ACCOUNTADMIN **can delete** objects **created by** a SYSADMIN"（同形式）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| regarding | 前置詞 | 〜に関して | Questions regarding role privileges are common in the exam. |
| built-in | 形容詞 | 組み込みの、ビルトインの | Built-in roles are predefined by Snowflake. |
| privilege | 名詞 | 権限、特権 | Higher roles inherit all privileges of lower roles. |
| drop | 動詞 | 削除する（DDL） | SECURITYADMIN can drop users created by USERADMIN. |
| modify | 動詞 | 変更する | ACCOUNTADMIN can modify any object in the account. |

## 2-3. 問題文（日本語）

> 次のうち、Snowflakeのビルトインロールの権限に関して正しい記述はどれですか？該当するものをすべて選んでください。
>
> A. PUBLICロールはSYSADMINが作成したオブジェクトを削除できる
> B. ACCOUNTADMINはSECURITYADMINが作成したROLEを変更できる
> C. SECURITYADMINはUSERADMINが作成したUSERを削除できる
> D. ACCOUNTADMINはSYSADMINが作成したオブジェクトを削除できる

---

## 3-1. 解説文（英語）

> Due to the role hierarchy and privileges inheritance, the ACCOUNTADMIN has all the privileges that lower roles have. Therefore, It can delete and modify objects created by lower roles.
>
> Similarly, SECURITYADMIN is a higher role than USERADMIN and can drop a user created by the USERADMIN.
>
> https://docs.snowflake.com/en/user-guide/security-access-control-overview#system-defined-roles

## 3-2. 解説文の文法解析

### 文1: "Due to the role hierarchy and privileges inheritance, the ACCOUNTADMIN has all the privileges that lower roles have."

- **理由の前置詞句**: Due to the role hierarchy and privileges inheritance
- **主語 (S)**: the ACCOUNTADMIN
- **動詞 (V)**: has
- **目的語 (O)**: all the privileges that lower roles have
- **関係詞節**: that lower roles have（all the privilegesを修飾）
- **文型**: SVO
- **注目ポイント**: 
  - `Due to ~` = 〜のために（`Because of ~` のフォーマルな表現）
  - `all the privileges that lower roles have` = 下位ロールが持つすべての権限（関係詞節が privilegesを具体化）

### 文2: "Therefore, It can delete and modify objects created by lower roles."

- **接続副詞**: Therefore（したがって）
- **主語 (S)**: It（= ACCOUNTADMIN）
- **動詞 (V)**: can delete and modify（並列）
- **目的語 (O)**: objects created by lower roles
- **後置修飾**: created by lower roles（過去分詞）
- **文型**: SVO
- **注目ポイント**: `objects created by lower roles` = 下位ロールによって作成されたオブジェクト

### 文3: "Similarly, SECURITYADMIN is a higher role than USERADMIN and can drop a user created by the USERADMIN."

- **接続副詞**: Similarly（同様に）
- **主語 (S)**: SECURITYADMIN
- **動詞並列 (V)**: is a higher role than USERADMIN / can drop a user created by the USERADMIN
- **文型**: SVC / SVO（並列）
- **注目ポイント**: 
  - `Similarly` = 同様に（前文のACCOUNTADMINと同じ論理が成り立つことを示す）
  - `a higher role than ~` = 〜より上位のロール（比較表現）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| due to | 前置詞 | 〜のために、〜に起因して | Due to hierarchy, higher roles inherit lower roles' privileges. |
| similarly | 接続副詞 | 同様に | Similarly, SECURITYADMIN has more privileges than USERADMIN. |
| a higher role than | 比較表現 | 〜より上位のロール | SECURITYADMIN is a higher role than USERADMIN. |
| inheritance | 名詞 | 継承 | Privilege inheritance flows from lower to higher roles. |

## 3-3. 解説文（日本語）

> ロール階層と権限継承により、ACCOUNTADMINは下位ロールが持つすべての権限を持ちます。したがって、下位ロールが作成したオブジェクトを削除・変更することができます。
>
> 同様に、SECURITYADMINはUSERADMINより上位のロールであるため、USERADMINが作成したユーザーを削除することができます。

---

## 復習メモ

- [ ] ロール階層（ACCOUNTADMIN > SECURITYADMIN > USERADMIN > PUBLIC）を覚えた
- [ ] 上位ロールは下位ロールの作成したオブジェクトを管理できることを理解した
- [ ] `Due to ~`（〜のために）と `Similarly`（同様に）の使い方を確認した
