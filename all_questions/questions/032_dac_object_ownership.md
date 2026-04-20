# 032: DAC Object Ownership

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-02
**正答**: D（1つ・正解）
- A. SYSADMIN（誤り・未選択）
- B. ACCOUNTADMIN（誤り・未選択）
- C. PUBLIC（誤り・未選択）
- D. The role that was used by the user while creating the new object.（**選択済み・正解**）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| DAC (Discretionary Access Control) | 裁量アクセス制御。オブジェクトを作成したロールがそのオブジェクトを所有し、他のロールへのアクセス付与も自由に行える。Snowflakeのアクセス制御の主要な仕組み |
| Object Ownership（オブジェクト所有権） | オブジェクトを管理・制御する権限。所有ロールはオブジェクトをDROP・MODIFY・権限付与等が可能 |
| PUBLIC ロール | Snowflakeのシステムロール。すべてのユーザーが自動的に持つ最低限の権限ロール。オブジェクト作成時の所有者にはならない |

## 1-2. 重要コンセプトまとめ

- **DACの核心ルール**:
  - オブジェクトを **作成したロール** = **所有者（Owner）**
  - 所有ロールは他のロールにアクセス権を付与できる（Discretionary = 裁量的）

- **「作成したロール」の意味**:
  - テーブルAをSYSADMINで作成 → SYSADMINが所有
  - テーブルBをカスタムロール `ANALYST` で作成 → `ANALYST` が所有
  - **どのロールで作成したか** によって決まる

- **ひっかけ選択肢の整理**:
  - ❌ **SYSADMIN** — 常に所有者になるわけではない
  - ❌ **ACCOUNTADMIN** — 最強ロールだが自動的に所有者になるわけではない
  - ❌ **PUBLIC** — 全ユーザーが持つ最低限ロール。所有者にはならない

- **Q001 との関連**（DACの復習）:
  - Q001 では「Snowflakeのアクセス制御はDAC + RBAC」と学習
  - 今回は「DACにおいてオブジェクトの所有者は誰か」をより具体的に確認

- **実務での注意点**（試験にも出うる）:
  - カスタムロールをSYSADMINの配下に置くことが推奨（Q003）
  - カスタムロールで作成したオブジェクトはそのロールが所有 → SYSADMINが間接的に管理できる
  - ACCOUNTADMINで作業すると、オブジェクトがACCOUNTADMINの所有になり管理が複雑化 → 非推奨

- **試験ポイント**: 「新しく作成されたオブジェクトの所有者 = 作成時に使用していたロール」

## 1-3. 公式ドキュメントURL

- [Access Control Overview](https://docs.snowflake.com/en/user-guide/security-access-control-overview)

---

## 2-1. 問題文（英語）

> Which role owns a newly created object?
>
> A. SYSADMIN
> B. ACCOUNTADMIN
> C. PUBLIC
> D. The role that was used by the user while creating the new object.

## 2-2. 問題文の文法解析

### 文1: "Which role owns a newly created object?"

- **疑問詞**: Which role（主語として疑問詞）
- **動詞 (V)**: owns
- **目的語 (O)**: a newly created object
- **文型**: SVO（疑問文）
- **注目ポイント**:
  - 「newly created object」の newly は副詞で created（過去分詞）を修飾。「新しく作成された」
  - 「owns」は所有権を示す動詞。単純現在形でSnowflakeの仕様を述べる

### 選択肢D の文法注目点

- 「The role that was used by the user while creating the new object」
  - `that was used by the user` — 関係代名詞節（受動態）。「ユーザーによって使用されたロール」
  - `while creating the new object` — 時間を示す分詞構文。「新しいオブジェクトを作成している間に」
  - 全体: 「新しいオブジェクトを作成している最中にユーザーが使用していたロール」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| own | verb | 所有する | The role that created an object owns it. |
| newly created | adjective phrase | 新しく作成された | The ownership of a newly created object goes to the creator. |
| while creating ~ | 分詞構文 | 〜を作成している間に | The role used while creating the object becomes the owner. |
| provide access to ~ | 動詞句 | 〜にアクセスを提供する | Owners can provide access to other roles. |

## 2-3. 問題文（日本語）

> 新しく作成されたオブジェクトを所有するロールはどれですか？
>
> A. SYSADMIN
> B. ACCOUNTADMIN
> C. PUBLIC
> D. 新しいオブジェクトの作成時にユーザーが使用していたロール

---

## 3-1. 解説文（英語）

> Snowflake supports discretionary access control (DAC), which means that the role that created an object owns it and can provide access to other roles to that item.

## 3-2. 解説文の文法解析

### 文1: "Snowflake supports discretionary access control (DAC), which means that the role that created an object owns it and can provide access to other roles to that item."

- **主節**: Snowflake supports discretionary access control (DAC)
- **非制限関係詞節**: which means that ~（前節全体を先行詞に「それはつまり〜を意味する」）
- **that節内**:
  - 主語: the role that created an object（関係詞節で修飾）
  - 述語1: owns it
  - 述語2: can provide access to other roles to that item
- **文型**: SVO, which means that [SVO and SVO]
- **注目ポイント**:
  - 「which means that ~」のカンマ + which は非制限用法。前の内容全体を説明し直す
  - 「owns it」の it は an object を指す代名詞
  - 「provide access to other roles to that item」= 「他のロールにそのアイテムへのアクセスを提供する」。2つの to 前置詞句の並列

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| discretionary | adjective | 裁量的な（所有者が自由に判断できる） | DAC stands for Discretionary Access Control. |
| which means that ~ | 関係詞節 | それはつまり〜を意味する（説明・言い換え） | Snowflake uses DAC, which means the creator owns the object. |
| provide access to A to B | 動詞句 | BにAへのアクセスを提供する | Owners can provide access to the object to other roles. |

## 3-3. 解説文（日本語）

> Snowflakeは裁量アクセス制御（DAC）をサポートしています。これは、オブジェクトを作成したロールがそのオブジェクトを所有し、他のロールにそのアイテムへのアクセスを提供できることを意味します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
