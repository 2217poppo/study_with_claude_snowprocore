# 117: ORGADMIN — SYSTEM$GLOBAL_ACCOUNT_SET_PARAMETER Function

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features and Architecture
**作成日**: 2026-04-17
**正答**: B, C（Client Redirect / Replication）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| ORGADMIN（組織管理者） | 複数のSnowflakeアカウントを横断して管理する最上位ロール。組織（Organization）全体の設定を管理する |
| SYSTEM$GLOBAL_ACCOUNT_SET_PARAMETER | ORGADMINが特定のアカウントに対してレプリケーションやフェイルオーバー機能を有効化するためのシステム関数 |
| Replication（レプリケーション） | データベースやオブジェクトを別のSnowflakeアカウントまたはリージョンに複製する機能。ORGADMIN経由で有効化が必要 |
| Client Redirect（クライアントリダイレクト） | フェイルオーバー時にクライアント接続を別のSnowflakeアカウントに自動的にリダイレクトする機能 |
| Failover（フェイルオーバー） | プライマリアカウントに障害が発生した場合に、セカンダリアカウントに切り替えるBCDR（事業継続・災害復旧）機能 |
| Automatic Clustering | 明示的クラスタリングキーのメンテナンスを自動で行うサーバーレスサービス。ORGADMIN関数では有効化しない |
| Data Sharing（データ共有） | Snowflakeのデータ共有機能。ORGADMIN関数では有効化しない（別の設定方法を使う） |

## 1-2. 重要コンセプトまとめ

- **SYSTEM$GLOBAL_ACCOUNT_SET_PARAMETER で有効化できる機能**
  - **Replication**（レプリケーション）
  - **Failover / Failback**（フェイルオーバー）
  - **Client Redirect**（クライアントリダイレクト）
  - ※ これらはすべてBCDR（事業継続・災害復旧）に関連する機能
- **SYSTEM$GLOBAL_ACCOUNT_SET_PARAMETER で有効化できない機能**
  - Automatic Clustering → テーブルレベルで `ALTER TABLE ... RESUME RECLUSTER` で設定
  - Data Sharing → 別のコマンドと権限で設定
  - Time Travel → アカウント・テーブルパラメータで設定（DATA_RETENTION_TIME_IN_DAYS）
- **使用条件**
  - ORGADMIN ロールのみが呼び出し可能
  - アカウントごとに1回ずつ呼び出す必要がある
- **試験での混同ポイント**: 「ORGADMINが使うから何でもできる」ではなく、この関数はBCDR機能に特化している

## 1-3. 公式ドキュメントURL

- [SYSTEM$GLOBAL_ACCOUNT_SET_PARAMETER](https://docs.snowflake.com/en/sql-reference/functions/system_global_account_set_parameter)
- [Replication and Failover/Failback](https://docs.snowflake.com/en/user-guide/account-replication-failover)

---

## 2-1. 問題文（英語）

> Which of the following can be enabled by an ORGADMIN using the SYSTEM$GLOBAL_ACCOUNT_SET_PARAMETER function?
>
> A. Automatic Clustering
> B. Client Redirect
> C. Replication
> D. Data Sharing
> E. Time Travel

## 2-2. 問題文の文法解析

### 文1: "Which of the following can be enabled by an ORGADMIN using the SYSTEM$GLOBAL_ACCOUNT_SET_PARAMETER function?"

- **主語 (S)**: Which of the following
- **動詞 (V)**: can be enabled（受動態 + 助動詞 can）
- **行為者**: by an ORGADMIN
- **手段**: using the SYSTEM$GLOBAL_ACCOUNT_SET_PARAMETER function（分詞構文）
- **文型**: SV（受動態、疑問文）
- **注目ポイント**: 
  - `can be enabled by A using B` = AがBを使用することによって有効化できる（受動態 + 分詞構文）
  - `using the function` = 関数を使うことで（手段の分詞構文）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| enable | 動詞 | 有効化する、可能にする | Enable replication using the ORGADMIN function. |
| ORGADMIN | 名詞 | 組織管理者ロール | Only ORGADMIN can call this system function. |
| redirect | 動詞/名詞 | リダイレクトする/リダイレクト | Client Redirect routes connections to a failover account. |
| replication | 名詞 | レプリケーション、複製 | Replication copies data to another Snowflake account. |

## 2-3. 問題文（日本語）

> 次のうち、ORGADMINがSYSTEM$GLOBAL_ACCOUNT_SET_PARAMETER関数を使用して有効化できるものはどれですか？
>
> A. Automatic Clustering（自動クラスタリング）
> B. Client Redirect（クライアントリダイレクト）
> C. Replication（レプリケーション）
> D. Data Sharing（データ共有）
> E. Time Travel（タイムトラベル）

---

## 3-1. 解説文（英語）

> This function can be used to enable replication and failover features (including Client Redirect) for the specified account.
>
> This function can only be called by the Organization Administrator (using the ORGADMIN role). The ORGADMIN must call this function once for each account for which the replication and failover features are to be configured.
>
> https://docs.snowflake.com/en/sql-reference/functions/system_global_account_set_parameter

## 3-2. 解説文の文法解析

### 文1: "This function can be used to enable replication and failover features (including Client Redirect) for the specified account."

- **主語 (S)**: This function
- **動詞 (V)**: can be used（受動態 + 助動詞 can）
- **目的（不定詞）**: to enable replication and failover features
- **追加情報（括弧）**: (including Client Redirect)（例示）
- **対象**: for the specified account
- **文型**: SV（受動態）
- **注目ポイント**: 
  - `can be used to V` = 〜するために使用できる（用途の受動態構文）
  - `including ~` = 〜を含む（括弧内で具体例を示す）
  - `the specified account` = 指定されたアカウント（過去分詞の形容詞用法）

### 文2: "This function can only be called by the Organization Administrator (using the ORGADMIN role)."

- **主語 (S)**: This function
- **動詞 (V)**: can only be called（受動態 + only で制限）
- **行為者**: by the Organization Administrator
- **補足説明（括弧）**: (using the ORGADMIN role)
- **文型**: SV（受動態）
- **注目ポイント**: 
  - `can only be called by` = 〜によってのみ呼び出せる（onlyで限定）
  - `using the ORGADMIN role` = ORGADMINロールを使って（手段の分詞構文）

### 文3: "The ORGADMIN must call this function once for each account for which the replication and failover features are to be configured."

- **主語 (S)**: The ORGADMIN
- **動詞 (V)**: must call（義務の助動詞）
- **目的語 (O)**: this function
- **頻度**: once
- **対象範囲**: for each account for which the replication and failover features are to be configured
- **関係節**: for which the replication and failover features are to be configured
- **注目ポイント**: 
  - `must call ~ once for each` = それぞれに対して1回ずつ呼び出す必要がある
  - `are to be configured` = 設定される予定の（be to 構文の受動態）
  - `for which` = 前置詞付き関係代名詞（each account が先行詞）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| failover | 名詞/動詞 | フェイルオーバー | Enable failover to switch to a secondary account. |
| specified | 形容詞 | 指定された | Call the function once for each specified account. |
| configure | 動詞 | 設定する、構成する | Features are to be configured by the ORGADMIN. |
| once | 副詞 | 1回、かつて | Call this function once per account. |

## 3-3. 解説文（日本語）

> この関数は、指定されたアカウントのレプリケーションおよびフェイルオーバー機能（クライアントリダイレクトを含む）を有効化するために使用できます。
>
> この関数は組織管理者（ORGADMINロールを使用）のみが呼び出すことができます。ORGADMINは、レプリケーションおよびフェイルオーバー機能を設定するアカウントそれぞれに対して、この関数を1回ずつ呼び出す必要があります。

---

## 復習メモ

- [ ] SYSTEM$GLOBAL_ACCOUNT_SET_PARAMETERはBCDR機能（Replication / Client Redirect）のみを有効化することを覚えた
- [ ] Automatic Clustering / Data Sharing / Time Travelは対象外であることを確認した
- [ ] `can only be called by`（〜によってのみ呼び出せる）と `are to be configured`（設定される予定）を確認した
