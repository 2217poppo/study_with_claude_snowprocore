# 020: No Warehouse Required Queries

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-09
**正答**: USE / SHOW TABLES LIKE / DESCRIBE TABLE / SELECT COUNT(*)（すべて選択）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Metadata Cache（メタデータキャッシュ） | Cloud Services Layerに保持されるテーブル・マイクロパーティション・列ごとの統計情報（行数・最大値・最小値など）。**ウェアハウス不要**で結果を返せる |
| Cloud Services Layer（クラウドサービスレイヤー） | Snowflake 3層アーキテクチャの最上層。メタデータ管理・認証・アクセス制御・クエリプラン生成を担当。`USE`・`SHOW`・`DESCRIBE`などのDDL/メタデータ操作はこのレイヤーで完結する |
| Virtual Warehouse（仮想ウェアハウス） | クエリ実行のためのコンピュートリソース。`SELECT * FROM`・`GROUP BY`・`JOIN`など**実データのスキャン・処理が必要なクエリ**に使用される |
| USE（コンテキスト設定） | 現在のセッションで使用するデータベース/スキーマ/ウェアハウスを設定するコマンド。Cloud Servicesレイヤーのメタデータ操作であり、ウェアハウス不要 |
| SHOW TABLES（テーブル一覧表示） | スキーマ内のテーブル一覧を表示するコマンド。Cloud Servicesレイヤーのメタデータ操作であり、ウェアハウス不要 |
| DESCRIBE TABLE（テーブル定義表示） | テーブルの列定義（名前・型・デフォルト値など）を表示するコマンド。Cloud Servicesレイヤーのメタデータ操作であり、ウェアハウス不要 |
| SELECT COUNT(*)（行数カウント） | テーブルの総行数を返すクエリ。行数はメタデータキャッシュに保持されているため、**ウェアハウス不要**で結果を返せる |

## 1-2. 重要コンセプトまとめ

- **ウェアハウス不要な操作**（Cloud Services / メタデータで完結）:
  - `USE` — セッションコンテキストの設定
  - `SHOW` — オブジェクト一覧の表示
  - `DESCRIBE` / `DESC` — オブジェクト定義の表示
  - `SELECT COUNT(*)` — 行数カウント（メタデータキャッシュから取得）
  - `CREATE` / `ALTER` / `DROP` などのDDLコマンド
  - `GRANT` / `REVOKE` などのアクセス制御コマンド

- **ウェアハウスが必要な操作**（実データの読み取り・処理）:
  - `SELECT * FROM` — 全行取得（実データスキャン）
  - `SELECT ... GROUP BY` — 集約クエリ（実データ処理）
  - `SELECT ... WHERE` — フィルタクエリ（実データスキャン）
  - `INSERT` / `UPDATE` / `DELETE` — DML操作

- **判断基準**: 「実データの読み取り・処理が必要か？」
  - Yes → ウェアハウス必要
  - No（メタデータで完結）→ ウェアハウス不要

- **SELECT COUNT(*) の特殊性**: 一見データを読み取るSELECTだが、行数はメタデータとして保持されているため**ウェアハウス不要**。これが最も間違えやすいポイント

## 1-3. 公式ドキュメントURL

- [Metadata Cache](https://docs.snowflake.com/en/user-guide/querying-metadata)
- [Cloud Services Layer](https://docs.snowflake.com/en/user-guide/intro-key-concepts#cloud-services)

---

## 2-1. 問題文（英語）

> Consider the CUSTOMER table in the SNOWFLAKE_SAMPLE_DATA.TPCH_SF1 schema. Which of the following queries do NOT require an active virtual warehouse? Select all that apply.
>
> A. USE SNOWFLAKE_SAMPLE_DATA.TPCH_SF1;
> B. SHOW TABLES LIKE '%CUSTOMER%';
> C. SELECT C_MKTSEGMENT, SUM(C_ACCTBAL) FROM SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER GROUP BY C_MKTSEGMENT;
> D. DESCRIBE TABLE SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER;
> E. SELECT COUNT(*) FROM SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER;
> F. SELECT * FROM SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER

## 2-2. 問題文の文法解析

### 文1: "Consider the CUSTOMER table in the SNOWFLAKE_SAMPLE_DATA.TPCH_SF1 schema."

- **動詞 (V)**: Consider（考えてください）— 命令形
- **目的語 (O)**: the CUSTOMER table（CUSTOMERテーブルを）
- **修飾語 (M)**: in the SNOWFLAKE_SAMPLE_DATA.TPCH_SF1 schema（TPCH_SF1スキーマ内の）
- **文型**: VO（命令文）
- **注目ポイント**: `Consider ~` — 「〜を考慮してください」。問題の前提条件を設定する命令形

### 文2: "Which of the following queries do NOT require an active virtual warehouse?"

- **疑問詞+主語 (S)**: Which of the following queries（次のクエリのうちどれが）
- **動詞 (V)**: do NOT require（必要としないか）— 否定疑問文
- **目的語 (O)**: an active virtual warehouse（アクティブな仮想ウェアハウスを）
- **文型**: SVO（否定疑問文）
- **注目ポイント**:
  - `do NOT require` — 大文字 `NOT` で否定を強調。「必要としない」クエリを問う
  - `an active virtual warehouse` — 「アクティブな（稼働中の）ウェアハウス」。`active` がキーワード

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| consider | 動詞 | 考慮する、検討する | Consider the following table for this question. |
| require | 動詞 | 必要とする | This query does not require a warehouse. |
| active | 形容詞 | アクティブな、稼働中の | An active warehouse is needed for data scanning. |
| select all that apply | 定型句 | 該当するものをすべて選択 | Select all that apply from the following list. |

## 2-3. 問題文（日本語）

> SNOWFLAKE_SAMPLE_DATA.TPCH_SF1スキーマのCUSTOMERテーブルについて考えてください。次のクエリのうち、アクティブな仮想ウェアハウスを**必要としない**ものはどれですか？該当するものをすべて選択してください。
>
> A. USE SNOWFLAKE_SAMPLE_DATA.TPCH_SF1;
> B. SHOW TABLES LIKE '%CUSTOMER%';
> C. SELECT C_MKTSEGMENT, SUM(C_ACCTBAL) FROM ... GROUP BY C_MKTSEGMENT;
> D. DESCRIBE TABLE SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER;
> E. SELECT COUNT(*) FROM SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER;
> F. SELECT * FROM SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER

---

## 3-1. 解説文（英語）

> Statistics are kept in the metadata cache in the cloud services layer for each table, micro-partition, and column. The metadata cache can return results if the query simply counts the number of rows.
>
> Similarly, the cloud services layer can provide table definitions (i.e., DESCRIBE) and a list of tables in a schema (i.e., SHOW TABLES LIKE).
>
> Metadata cache or cloud services operations do not require an active virtual warehouse.

## 3-2. 解説文の文法解析

### 文1: "Statistics are kept in the metadata cache in the cloud services layer for each table, micro-partition, and column."

- **主語 (S)**: Statistics（統計情報は）
- **動詞 (V)**: are kept（保持されている）— 受動態
- **場所 (M1)**: in the metadata cache（メタデータキャッシュに）
- **場所 (M2)**: in the cloud services layer（クラウドサービスレイヤーの）
- **対象 (M3)**: for each table, micro-partition, and column（テーブル・マイクロパーティション・列ごとに）
- **文型**: SV（受動態）+ 三重の前置詞句
- **注目ポイント**:
  - `are kept in ~` — 「〜に保持されている」。データの保存場所を示す受動態
  - `for each ~` — 「〜ごとに」。粒度を明示

### 文2: "The metadata cache can return results if the query simply counts the number of rows."

- **主語 (S)**: The metadata cache（メタデータキャッシュは）
- **動詞 (V)**: can return（返すことができる）
- **目的語 (O)**: results（結果を）
- **条件節 (M)**: if the query simply counts the number of rows（クエリが単純に行数をカウントするだけなら）
- **文型**: SVO + if条件節
- **注目ポイント**:
  - `simply counts` — `simply`（単に）が条件を限定。単純なCOUNTのみがメタデータで処理可能であることを強調

### 文3: "Similarly, the cloud services layer can provide table definitions (i.e., DESCRIBE) and a list of tables in a schema (i.e., SHOW TABLES LIKE)."

- **接続副詞**: Similarly（同様に）
- **主語 (S)**: the cloud services layer（クラウドサービスレイヤーは）
- **動詞 (V)**: can provide（提供できる）
- **目的語 (O)**: table definitions ... and a list of tables in a schema（テーブル定義...およびスキーマ内のテーブル一覧を）
- **文型**: SVO
- **注目ポイント**:
  - `i.e.,` — 「すなわち」。括弧内で具体的なコマンド名を言い換え
  - `Similarly` — 前文との類似性を示す接続副詞

### 文4: "Metadata cache or cloud services operations do not require an active virtual warehouse."

- **主語 (S)**: Metadata cache or cloud services operations（メタデータキャッシュまたはクラウドサービスの操作は）
- **動詞 (V)**: do not require（必要としない）
- **目的語 (O)**: an active virtual warehouse（アクティブな仮想ウェアハウスを）
- **文型**: SVO（否定文）
- **注目ポイント**: この文が問題全体の結論。メタデータ/クラウドサービスの操作 = ウェアハウス不要

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| statistics | 名詞 | 統計情報 | Statistics are kept in the metadata cache. |
| kept in | 動詞句（受動態） | 〜に保持されている | Row counts are kept in the metadata cache. |
| simply counts | 動詞句 | 単純にカウントする | The cache returns results if the query simply counts rows. |
| table definitions | 名詞 | テーブル定義 | DESCRIBE provides table definitions. |
| do not require | 動詞句 | 必要としない | These operations do not require a warehouse. |

## 3-3. 解説文（日本語）

> テーブル・マイクロパーティション・列ごとの統計情報は、クラウドサービスレイヤーのメタデータキャッシュに保持されています。クエリが単純に行数をカウントするだけであれば、メタデータキャッシュが結果を返すことができます。
>
> 同様に、クラウドサービスレイヤーはテーブル定義（すなわちDESCRIBE）やスキーマ内のテーブル一覧（すなわちSHOW TABLES LIKE）を提供できます。
>
> メタデータキャッシュまたはクラウドサービスの操作は、アクティブな仮想ウェアハウスを必要としません。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
