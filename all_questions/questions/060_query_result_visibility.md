# 060: Query Result Visibility — ACCOUNTADMIN Limitations

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-03
**正答**: False（ACCOUNTADMINでも他ユーザーのクエリ結果は見られない）

> 関連問題: 004（Query History Retention）・018（ACCOUNTADMIN Role）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Query Result（クエリ結果） | クエリを実行したときに返されるデータ（行・値）そのもの。**自分が実行したクエリの結果のみ**表示される。ACCOUNTADMINでも他ユーザーの結果は見られない |
| Query Detail Page（クエリ詳細ページ） | Snowsightでクエリの実行情報（実行時間・SQL文・ステータス等）を確認できるページ。管理者は他ユーザーの詳細ページにアクセスできるが、**実際の結果データは表示されない** |
| Query History（クエリ履歴） | 過去に実行されたクエリのメタデータ（SQL文・実行時刻・実行者・ステータス等）の記録。ACCOUNTADMINは他ユーザーのクエリ履歴を閲覧できる |
| Data Privacy（データプライバシー） | 個人・機密データを保護する原則。SnowflakeはACCOUNTADMINでも他ユーザーのクエリ結果を見せないことでこれを実現している |
| personally executed（本人が実行した） | 自分自身でクエリを実行したこと。Snowflakeのクエリ結果表示はこれに限定される |

## 1-2. 重要コンセプトまとめ

- **クエリ結果は「自分が実行したもの」しか見られない**:
  - ACCOUNTADMINでも例外ではない
  - 他ユーザーが実行したクエリの**結果データ**は閲覧不可

- **ACCOUNTADMINが「見られるもの」と「見られないもの」の区別**（試験頻出）:

  | | ACCOUNTADMINが見られるか |
  |---|---|
  | 他ユーザーのクエリ履歴（SQL文・実行時刻等） | **見られる** |
  | 他ユーザーのQuery Detail（実行詳細） | **見られる** |
  | 他ユーザーのクエリ結果（実際のデータ） | **見られない** ← この問題のポイント |

- **なぜ見られないのか**: データプライバシーのため。管理者権限があっても、ユーザーが取得したデータ内容まで閲覧できると機密データが漏洩する恐れがある

- **試験の引っかけパターン**: ACCOUNTADMINは「何でもできる最強ロール」というイメージから True を選びがち → False

## 1-3. 公式ドキュメントURL

- [Viewing Query Details in Snowsight](https://docs.snowflake.com/en/user-guide/ui-snowsight-query)

---

## 2-1. 問題文（英語）

> True or False: An ACCOUNTADMIN can see the results of any query executed by any user in a Snowflake system.
>
> A. True
> B. False

## 2-2. 問題文の文法解析

### 文1: "An ACCOUNTADMIN can see the results of any query executed by any user in a Snowflake system."

- **主語 (S)**: An ACCOUNTADMIN
- **助動詞**: can（〜できる）
- **動詞 (V)**: see（見る）
- **目的語 (O)**: the results of any query executed by any user（すべてのユーザーによって実行されたすべてのクエリの結果を）
- **修飾語 (M)**: in a Snowflake system（Snowflakeシステムにおいて）
- **注目ポイント1**: `any query executed by any user` = 「すべてのユーザーが実行したすべてのクエリ」。`any` が2回使われ、例外なしの包括性を主張 → False のシグナル
- **注目ポイント2**: `executed by any user` は `query` を後置修飾する過去分詞句

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| any ~ executed by any ~ | 強調表現 | すべての〜によって実行されたすべての〜 | Any query executed by any user → False |
| see the results of ~ | 動詞句 | 〜の結果を見る | You can only see results of your own queries. |

## 2-3. 問題文（日本語）

> 正しい（True）か誤り（False）か：ACCOUNTADMINはSnowflakeシステム内のすべてのユーザーが実行したすべてのクエリの結果を見ることができる。
>
> A. True
> B. False

---

## 3-1. 解説文（英語）

> You can only view results for queries you have personally executed. For example, as an administrator, If you have permission to view queries run by another user, the Query Detail page displays the query's details but not the actual query result for data privacy reasons.

## 3-2. 解説文の文法解析

### 文1: "You can only view results for queries you have personally executed."

- **主語 (S)**: You（あなたは）
- **助動詞**: can only（〜のみできる）← `only` で限定
- **動詞 (V)**: view（閲覧する）
- **目的語 (O)**: results for queries you have personally executed（あなたが自分で実行したクエリの結果を）
- **関係詞節（省略）**: queries [that] you have personally executed（あなたが自分で実行したクエリ）← 関係代名詞 `that` が省略
- **注目ポイント**: `personally` = 「自分自身で・個人的に」。本人実行に限定することを強調する副詞

### 文2: "If you have permission to view queries run by another user, the Query Detail page displays the query's details but not the actual query result for data privacy reasons."

- **条件節**: If you have permission to view queries run by another user（別ユーザーのクエリを閲覧する権限があっても）
- **主語 (S)**: the Query Detail page
- **動詞 (V)**: displays（表示する）
- **目的語 (O)**: the query's details but not the actual query result（クエリの詳細は表示するが、実際のクエリ結果は表示しない）← `A but not B` = 「AはするがBはしない」
- **修飾語**: for data privacy reasons（データプライバシー上の理由から）← `for ~ reasons` = 「〜の理由から」
- **注目ポイント**: `A but not B` = 「AはするがBはしない」。詳細と結果の表示を明確に対比させる構文

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| personally | 副詞 | 自分自身で・個人的に | You can only view queries you personally executed. |
| A but not B | 対比構文 | AはするがBはしない | Details are shown but not the actual results. |
| for ~ reasons | 前置詞句 | 〜の理由から | This is restricted for data privacy reasons. |
| actual | 形容詞 | 実際の | The actual query result is not displayed. |
| permission to do | 名詞句 | 〜する権限・許可 | If you have permission to view another user's queries. |

## 3-3. 解説文（日本語）

> クエリ結果を閲覧できるのは、自分自身が実行したクエリの結果のみです。例えば、管理者として別ユーザーが実行したクエリを閲覧する権限がある場合でも、Query詳細ページにはクエリの詳細情報は表示されますが、データプライバシー上の理由から実際のクエリ結果は表示されません。

---

## 復習メモ

- [ ] ACCOUNTADMINでも他ユーザーのクエリ結果（データ）は見られないことを覚えた
- [ ] Query Historyの詳細（SQL等）は見られるが、結果データは見られないという区別を理解した
- [ ] `personally`・`A but not B`・`for ~ reasons` の英語パターンを確認した
- [ ] この問題は理論問題のためサンドボックス検証は不要
