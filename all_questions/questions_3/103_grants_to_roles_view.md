# 103: ACCOUNT_USAGE — GRANTS_TO_ROLES View

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-17
**正答**: D（GRANTS_TO_ROLES）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| ACCOUNT_USAGE | アカウント全体の使用状況・メタデータを提供するSnowflakeのスキーマ。最大365日の履歴を保持（1〜2時間の遅延あり）|
| GRANTS_TO_ROLES | ロールに付与された権限（特権）の情報を提供するACCOUNT_USAGEビュー。過去365日間の付与・取り消し履歴も含む |
| GRANTS_TO_USERS | ユーザーに付与されたロールの情報を提供するACCOUNT_USAGEビュー（ロールへの権限ではなく、ユーザーへのロール付与）|
| OBJECT_DEPENDENCIES | オブジェクト間の依存関係を提供するACCOUNT_USAGEビュー |
| ACCESS_HISTORY | クエリによるオブジェクトへのアクセス履歴を提供するACCOUNT_USAGEビュー |
| GRANT | ロールまたはユーザーに権限を付与するSQLコマンド。`GRANT privilege ON object TO ROLE role_name` の形式 |
| REVOKE | 付与された権限を取り消すSQLコマンド |

## 1-2. 重要コンセプトまとめ

- **GRANTS_TO_ROLES: ロールへの権限付与を追跡**
  - 365日間の履歴を保持。過去に付与して取り消した権限も表示される
- **GRANTS_TO_USERS と混同しないこと**
  - GRANTS_TO_USERS は「ユーザーへのロール付与」であり、「ロールへの権限付与」ではない
- **混同しやすい4ビューの使い分け**
  - `GRANTS_TO_ROLES` → ロールが持つ権限の一覧・履歴
  - `GRANTS_TO_USERS` → ユーザーに付与されたロールの一覧
  - `ACCESS_HISTORY` → どのクエリがどのオブジェクトにアクセスしたか
  - `OBJECT_DEPENDENCIES` → オブジェクト間の依存関係

## 1-3. 公式ドキュメントURL

- [GRANTS_TO_ROLES View](https://docs.snowflake.com/en/sql-reference/account-usage/grants_to_roles)
- [GRANTS_TO_USERS View](https://docs.snowflake.com/en/sql-reference/account-usage/grants_to_users)
- [ACCESS_HISTORY View](https://docs.snowflake.com/en/sql-reference/account-usage/access_history)

---

## 2-1. 問題文（英語）

> Which of the following ACCOUNT_USAGE view can be used to view privileges granted to roles?
>
> A. OBJECT_DEPENDENCIES
> B. GRANTS_TO_USERS
> C. ACCESS_HISTORY
> D. GRANTS_TO_ROLES

## 2-2. 問題文の文法解析

### 文1: "Which of the following ACCOUNT_USAGE view can be used to view privileges granted to roles?"

- **主語 (S)**: Which of the following ACCOUNT_USAGE view
- **動詞 (V)**: can be used（受動態 + 助動詞）
- **不定詞**: to view privileges granted to roles
- **文型**: SV（受動態）
- **注目ポイント**: 
  - `can be used to ~` = 〜するために使うことができる
  - `privileges granted to roles` = ロールに付与された権限（過去分詞 granted が後置修飾）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| privilege | 名詞 | 権限、特権 | The GRANTS_TO_ROLES view shows all privileges granted to roles. |
| granted | 形容詞（過去分詞） | 付与された | View the privileges granted to each role. |
| view | 名詞/動詞 | ビュー（DB）/ 参照する | Use this view to monitor access privileges. |

## 2-3. 問題文（日本語）

> ロールに付与された権限を表示するために使用できるACCOUNT_USAGEビューはどれですか？
>
> A. OBJECT_DEPENDENCIES
> B. GRANTS_TO_USERS
> C. ACCESS_HISTORY
> D. GRANTS_TO_ROLES

---

## 3-1. 解説文（英語）

> The GRANTS_TO_ROLES view can be used to view information about access privileges granted to a role. This view also contains historical information (up to 365 days), so privileges that have been granted and revoked in the last 365 days will also be shown.
>
> https://docs.snowflake.com/en/sql-reference/account-usage/grants_to_users

## 3-2. 解説文の文法解析

### 文1: "The GRANTS_TO_ROLES view can be used to view information about access privileges granted to a role."

- **主語 (S)**: The GRANTS_TO_ROLES view
- **動詞 (V)**: can be used（受動態 + 助動詞）
- **不定詞**: to view information about access privileges granted to a role
- **注目ポイント**: `granted to a role` は `access privileges` を修飾する過去分詞の後置修飾

### 文2: "This view also contains historical information (up to 365 days), so privileges that have been granted and revoked in the last 365 days will also be shown."

- **主節**: This view also contains historical information (up to 365 days)
- **結果節**: so privileges ... will also be shown
- **関係詞節**: that have been granted and revoked in the last 365 days（privileges を修飾）
- **注目ポイント**: 
  - `so` = そのため（結果を導く等位接続詞）
  - `have been granted and revoked` = 付与され取り消されてきた（現在完了受動態）
  - `in the last 365 days` = 過去365日間で

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| revoke | 動詞 | 取り消す、撤回する | Revoke the privilege if the user no longer needs it. |
| historical | 形容詞 | 過去の、履歴の | The view provides historical information up to 365 days. |
| up to | 前置詞句 | 最大〜まで | Data is retained up to 365 days. |

## 3-3. 解説文（日本語）

> GRANTS_TO_ROLESビューは、ロールに付与されたアクセス権限に関する情報を表示するために使用できます。このビューには過去の情報（最大365日間）も含まれているため、過去365日以内に付与され取り消された権限も表示されます。

---

## 復習メモ

- [ ] GRANTS_TO_ROLES（ロールへの権限）とGRANTS_TO_USERS（ユーザーへのロール）の違いを理解した
- [ ] ACCOUNT_USAGEの365日履歴保持を把握した
- [ ] `have been granted and revoked` の現在完了受動態を確認した
