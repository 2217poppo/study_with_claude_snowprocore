# 055: Data Exchange Share — Default Managing Role

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-03
**正答**: A（ACCOUNTADMIN のみ）

> 関連問題: 018（ACCOUNTADMIN Role）・023（Share Consumer Accounts）・047（Data Sharing Multiple Databases）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Data Exchange（データエクスチェンジ） | 複数の組織・アカウント間でデータを共有・発見・交換するSnowflakeのマーケットプレイス的な仕組み。Snowflake Data Marketplaceもこれに含まれる |
| Share（シェア） | データプロバイダーがコンシューマーと共有するオブジェクト。`CREATE SHARE` で作成し、対象テーブル・ビュー等を追加してコンシューマーアカウントに付与する |
| ACCOUNTADMIN | Snowflakeで最も強力なシステムロール。**デフォルトではShareの作成・管理が可能な唯一のロール**。他のロールへの権限付与も可能 |
| SECURITYADMIN | ユーザーとロールのグローバル管理に特化したシステムロール。Shareの管理権限は**デフォルトでは持たない** |
| SYSADMIN | すべてのセキュアオブジェクトの所有者として機能するシステムロール。Shareの管理権限は**デフォルトでは持たない** |
| USERADMIN | ユーザーとロールの作成・管理に特化したシステムロール。Shareの管理権限は**デフォルトでは持たない** |
| Privilege（権限） | 特定の操作（SELECT・CREATE・MANAGE等）を実行できる権限。ACCOUNTADMINが他のロールにShare権限を付与できる |

## 1-2. 重要コンセプトまとめ

- **Shareの作成・管理はデフォルトでは ACCOUNTADMIN のみ**:
  - SECURITYADMIN・SYSADMIN・USERADMIN はデフォルトでは Share を管理できない
  - ただし、ACCOUNTADMIN が他のロールに権限を付与することで委譲可能

- **「by default」に注意**（試験頻出の引っかけ）:
  - 「デフォルトでは誰が〜できるか？」という問いには、権限付与で変わる可能性を無視して初期状態だけを答える
  - 「権限を付与すれば他のロールもできる」は事実だが、これは "by default" の答えではない

- **ACCOUNTADMINが「唯一のデフォルト管理ロール」になる機能の例**（試験でよく出る）:

  | 機能 | デフォルト管理ロール |
  |------|-------------------|
  | Share の作成・管理 | **ACCOUNTADMIN** |
  | Resource Monitor の作成 | **ACCOUNTADMIN** |
  | Reader Account の作成 | **ACCOUNTADMIN** |
  | 請求情報の閲覧 | **ACCOUNTADMIN** |

- **SECURITYADMINとの混同に注意**:
  - SECURITYADMIN = ユーザー・ロールの管理
  - Share管理 ≠ SECURITYADMINの担当（試験の引っかけ）

## 1-3. 公式ドキュメントURL

- [Access Control Privileges — Shares](https://docs.snowflake.com/en/user-guide/security-access-privileges-shares)

---

## 2-1. 問題文（英語）

> Which of the following roles can manage a Data Exchange share by default?
>
> A. ACCOUNTADMIN
> B. USERADMIN
> C. SECURITYADMIN
> D. SYSADMIN

## 2-2. 問題文の文法解析

### 文1: "Which of the following roles can manage a Data Exchange share by default?"

- **主語 (S)**: Which of the following roles（以下のロールのうちどれが）
- **助動詞**: can（〜できる）
- **動詞 (V)**: manage（管理する）
- **目的語 (O)**: a Data Exchange share（Data Exchangeのシェアを）
- **修飾語 (M)**: by default（デフォルトでは）← 初期状態・標準設定を示す副詞句
- **注目ポイント**: `by default` = 「デフォルトでは・初期設定では」。権限付与前の標準状態を問う表現。この語が入ると「変更可能だが初期値は？」という問いになる

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| manage | 動詞 | 管理する・運営する | Only ACCOUNTADMIN can manage shares by default. |
| Data Exchange | 固有名詞 | Snowflakeのデータ共有・交換プラットフォーム | A Data Exchange share is created by ACCOUNTADMIN. |
| by default | 副詞句 | デフォルトでは・初期設定では | By default, only ACCOUNTADMIN has this privilege. |

## 2-3. 問題文（日本語）

> 以下のロールのうち、デフォルトでData Exchangeのシェアを管理できるのはどれですか？
>
> A. ACCOUNTADMIN
> B. USERADMIN
> C. SECURITYADMIN
> D. SYSADMIN

---

## 3-1. 解説文（英語）

> As a default, only the ACCOUNTADMIN role has the privileges to create and manage shares. However, if required, the privileges can be granted to other roles.

## 3-2. 解説文の文法解析

### 文1: "As a default, only the ACCOUNTADMIN role has the privileges to create and manage shares."

- **修飾語 (M)**: As a default（デフォルトとして）← `by default` と同義
- **主語 (S)**: only the ACCOUNTADMIN role（ACCOUNTADMINロールだけが）← `only` で排他性を強調
- **動詞 (V)**: has（持つ）
- **目的語 (O)**: the privileges to create and manage shares（シェアを作成・管理する権限を）← `privileges to do` = 〜する権限
- **注目ポイント**: `only ~ has the privileges to do` = 「〜だけが〜する権限を持つ」。唯一性を強調する構文

### 文2: "However, if required, the privileges can be granted to other roles."

- **接続副詞**: However（しかしながら）← 前文との対比・例外を導く
- **条件節**: if required（必要であれば）← `if it is required` の省略形
- **主語 (S)**: the privileges（その権限は）
- **動詞 (V)**: can be granted（付与することができる）← 受動態
- **修飾語 (M)**: to other roles（他のロールに）
- **注目ポイント**: `if required` = 「必要であれば」。主語・be動詞を省略した慣用的な条件節。`be granted to ~` = 「〜に付与される」の受動態

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| as a default | 副詞句 | デフォルトとして（= by default） | As a default, ACCOUNTADMIN manages shares. |
| privilege to do | 名詞句 | 〜する権限 | The privilege to create shares belongs to ACCOUNTADMIN. |
| only ~ has | 構文 | 〜だけが持つ | Only ACCOUNTADMIN has the privilege. |
| if required | 条件句 | 必要であれば（= if it is required） | Privileges can be granted if required. |
| be granted to ~ | 受動態熟語 | 〜に付与される | Privileges can be granted to other roles. |

## 3-3. 解説文（日本語）

> デフォルトでは、ACCOUNTADMINロールのみがシェアを作成・管理する権限を持っています。ただし、必要であれば、その権限を他のロールに付与することも可能です。

---

## 復習メモ

- [ ] Shareの作成・管理はデフォルトでACCOUNTADMINのみであることを覚えた
- [ ] SECURITYADMINはユーザー・ロール管理であってShare管理ではないことを確認した
- [ ] `by default` / `as a default` が入る問題は「初期状態」を答えると意識した
- [ ] `privilege to do`・`if required`・`be granted to ~` の英語パターンを確認した
- [ ] この問題は理論問題のためサンドボックス検証は不要
