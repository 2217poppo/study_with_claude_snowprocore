# 094: ORGADMIN Role — Creating New Accounts

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-06
**正答**: B（ORGADMIN）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| ORGADMIN（Organization Admin） | Snowflakeの組織（Organization）レベルのロール。**新しいSnowflakeアカウントの作成**・全アカウントの一覧表示など、組織全体に関わるタスクを担当する。単一アカウント内のACCOUNTADMINとは異なる上位概念 |
| Organization（組織） | 複数のSnowflakeアカウントを一元管理するための上位概念。ORGADMINロールによって管理される |
| GLOBALADMIN | 存在しないロール名（ディストラクター）。Snowflakeの公式ロール階層には含まれない |
| ACCOUNTADMIN | 単一のSnowflakeアカウント内の最高権限ロール。ただし**新しいアカウントを作成する権限はない**（それはORGADMINの役割） |
| SYSADMIN | データベース・スキーマ・ウェアハウスなどのオブジェクトを作成・管理するロール |
| SECURITYADMIN | ユーザー・ロールの管理とアクセス制御を担当するロール |

## 1-2. 重要コンセプトまとめ

- **新規アカウント作成 = ORGADMIN**: ACCOUNTADMINではなくORGADMINが必要。「アカウント内」の最高権限がACCOUNTADMINで、「組織レベル」の権限がORGADMIN
- **ロール階層とスコープ**:

  | ロール | スコープ | 主な責務 |
  |--------|---------|---------|
  | ORGADMIN | 組織レベル | 新規アカウント作成・全アカウント一覧 |
  | ACCOUNTADMIN | アカウントレベル | アカウント全体の管理 |
  | SECURITYADMIN | アカウント内 | ユーザー・ロール管理 |
  | SYSADMIN | アカウント内 | DBオブジェクト管理 |
  | USERADMIN | アカウント内 | ユーザー・ロールのCRUD |

- **試験の引っかけ**: ACCOUNTADMINが最高権限のロールと覚えているが、**組織（Organization）レベルのタスクにはORGADMINが必要**
- **GLOBALADMIN は存在しない**: 試験でよく使われるディストラクター。Snowflakeの公式ロール一覧に含まれない

## 1-3. 公式ドキュメントURL

- [Enabling the ORGADMIN Role in an Account](https://docs.snowflake.com/en/user-guide/organizations-gs#enabling-the-orgadmin-role-in-an-account)

---

## 2-1. 問題文（英語）

> Which role must be granted to a Snowflake user to allow them to create new Snowflake accounts?
>
> A. GLOBALADMIN
> B. ORGADMIN
> C. ACCOUNTADMIN
> D. SYSADMIN
> E. SECURITYADMIN

## 2-2. 問題文の文法解析

### 文1: "Which role must be granted to a Snowflake user to allow them to create new Snowflake accounts?"

- **主語 (S)**: Which role（疑問詞節が主語）
- **動詞 (V)**: must be granted（受動態・助動詞）
- **修飾語 (M1)**: to a Snowflake user（付与先）
- **修飾語 (M2)**: to allow them to create new Snowflake accounts（to不定詞の副詞的用法・目的）
- **文型**: SV（受動態）
- **注目ポイント**:
  - **"must be granted to ~"**: 「〜に付与されなければならない」。`grant A to B`（BにAを付与する）の受動態。必須条件を示す `must`（〜しなければならない）
  - **"to allow them to create"**: to不定詞の連鎖。`grant ... to allow them to create` = 「（ロールを付与することで）彼らが〜を作成することを許可するため」。2つのto不定詞が目的の連鎖を作る
  - **"new Snowflake accounts"**: `accounts`（複数形）。1つだけでなく「新しいアカウント」を作成する能力全般を指す

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| granted | 過去分詞 | 付与された | The ORGADMIN role must be granted to the user. |
| allow them to ~ | 動詞句 | 彼らが〜することを許可する | This role allows them to create new accounts. |
| create | 動詞 | 作成する | ORGADMIN can create new Snowflake accounts within the organization. |

## 2-3. 問題文（日本語）

> Snowflakeユーザーに新しいSnowflakeアカウントを作成する権限を与えるには、どのロールを付与しなければなりませんか？
>
> A. GLOBALADMIN
> B. ORGADMIN
> C. ACCOUNTADMIN
> D. SYSADMIN
> E. SECURITYADMIN

---

## 3-1. 解説文（英語）

> The ORGADMIN role performs organization-specific tasks like listing all accounts and creating new ones.

## 3-2. 解説文の文法解析

### 文1: "The ORGADMIN role performs organization-specific tasks like listing all accounts and creating new ones."

- **主語 (S)**: The ORGADMIN role
- **動詞 (V)**: performs
- **目的語 (O)**: organization-specific tasks
- **修飾語 (M)**: like listing all accounts and creating new ones（前置詞句、具体例）
- **文型**: SVO
- **注目ポイント**:
  - **"organization-specific"**: 「組織固有の・組織に特化した」。ハイフン付き複合形容詞。`specific to an organization` の圧縮形。`account-specific`（アカウント固有）とは異なる上位レベルを示す
  - **"like + 動名詞"**: 「〜のような・例えば〜」。`like` が前置詞として機能し、動名詞句で具体例を列挙。`such as + 動名詞` と同義。`such as listing all accounts`とも言える
  - **"creating new ones"**: `ones` は `accounts` の代名詞。「新しいアカウントを作成する」。前出の名詞の繰り返しを避けるための代名詞使用

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| organization-specific | 形容詞 | 組織固有の | ORGADMIN handles organization-specific tasks. |
| like + 動名詞 | 前置詞句 | 〜のような、例えば〜 | Tasks like listing accounts and creating new ones. |
| ones | 代名詞 | 前出の名詞を受ける（accounts の代わり） | Creating new ones (= creating new accounts). |

## 3-3. 解説文（日本語）

> ORGADMINロールは、全アカウントの一覧表示や新しいアカウントの作成など、組織固有のタスクを実行します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
