# 039: Fail-Safe Disable

**SnowPro Core Domain**: Domain 5 — Data Collaboration
**作成日**: 2026-04-13
**正答**: False

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Fail-Safe（フェイルセーフ） | Time Travel期間終了後にSnowflakeが内部的にデータを7日間保持する障害回復機能。エンドユーザーはアクセス・操作不可。Snowflakeサポートのみが復元可能 |
| Time Travel | 過去のデータ状態にアクセスできる機能。Permanent Tableは最大90日（Enterprise以上）、Transient/Temporaryは最大1日 |
| Transient Table（トランジェントテーブル） | Fail-Safe **なし（0日）**・Time Travel最大1日のテーブル。セッションをまたいで存在する。Fail-Safeを避けたい場合の選択肢 |
| Temporary Table（テンポラリテーブル） | Fail-Safe **なし（0日）**・Time Travel最大1日のテーブル。セッション内のみ存在。Transientと同様にFail-Safeなし |
| Permanent Table（永続テーブル） | デフォルトのテーブル種別。Time Travel最大90日（Enterprise以上）・Fail-Safe 7日を持つ |

## 1-2. 重要コンセプトまとめ

- Fail-Safeは **無効化・設定変更ができない**（アカウント・DB・スキーマ・テーブルいずれのレベルでも不可）
- Fail-SafeはSnowflakeが内部的に管理する保護機能であり、ユーザーが制御するものではない
- Fail-Safeを「回避」する方法: **Transient Table または Temporary Table を使う**（Fail-Safe 0日）
- Permanent Table の Fail-Safe 7日は変更不可能な固定値
- Time Travel は `DATA_RETENTION_TIME_IN_DAYS` パラメータで設定変更可能だが、**Fail-Safe は設定パラメータ自体が存在しない**
- 試験のひっかけ: 「disable」「configure」「change」などの動詞が Fail-Safe と一緒に出たら **False** を疑う

## 1-3. 公式ドキュメントURL

- [Understanding & Using Fail-safe](https://docs.snowflake.com/en/user-guide/data-failsafe)
- [Temporary and Transient Tables](https://docs.snowflake.com/en/user-guide/tables-temp-transient)

---

## 2-1. 問題文（英語）

> True/False: It is possible to disable failsafe for specific databases, schemas, or tables.
>
> A. True
> B. False

## 2-2. 問題文の文法解析

### 文1: "It is possible to disable failsafe for specific databases, schemas, or tables."

- **主語 (S)**: It（形式主語）
- **動詞 (V)**: is
- **補語 (C)**: possible
- **真主語**: to disable failsafe for specific databases, schemas, or tables
- **文型**: SVC（形式主語構文）
- **注目ポイント**: `It is possible to ~` は「～することが可能である」。True/False問題でこの構文が出たら、本当に可能かどうか慎重に判断する必要がある。`for specific ~` で対象を限定している。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| disable | verb | 無効にする | You cannot disable fail-safe. |
| specific | adjective | 特定の | For specific databases or tables. |
| fail-safe | noun | フェイルセーフ（障害回復保護） | Fail-safe cannot be configured. |

## 2-3. 問題文（日本語）

> 真/偽: 特定のデータベース、スキーマ、またはテーブルに対してフェイルセーフを無効にすることは可能である。
>
> A. 真
> B. 偽

---

## 3-1. 解説文（英語）

> Once the Time Travel period ends, Snowflake keeps the data for a further 7-day period as further protection. This fail-safe can not be disabled or configured. You can NOT change it for a Snowflake account, database, schema, or table. However, you can use Transient or Temporary tables, which have zero days of fail-safe storage.

## 3-2. 解説文の文法解析

### 文1: "Once the Time Travel period ends, Snowflake keeps the data for a further 7-day period as further protection."

- **主語 (S)**: Snowflake
- **動詞 (V)**: keeps
- **目的語 (O)**: the data
- **修飾語 (M)**: Once the Time Travel period ends（条件節）、for a further 7-day period（期間）、as further protection（目的）
- **文型**: SVO
- **注目ポイント**: `Once ~` は「一旦～すると」。`for a further ~ period` で「さらなる～期間の間」。`as further protection` で「さらなる保護として」。

### 文2: "This fail-safe can not be disabled or configured."

- **主語 (S)**: This fail-safe
- **動詞 (V)**: can not be disabled or configured（受動態 + 助動詞否定）
- **文型**: SV（受動態）
- **注目ポイント**: `can not be disabled or configured` で「無効化も設定変更もできない」。`or` で2つの動作を並列否定。

### 文3: "You can NOT change it for a Snowflake account, database, schema, or table."

- **主語 (S)**: You
- **動詞 (V)**: can NOT change
- **目的語 (O)**: it（= fail-safe）
- **修飾語 (M)**: for a Snowflake account, database, schema, or table（対象の列挙）
- **文型**: SVO
- **注目ポイント**: `NOT` が大文字で強調。4つのレベル（account, database, schema, table）すべてで不可能であることを明示。

### 文4: "However, you can use Transient or Temporary tables, which have zero days of fail-safe storage."

- **主語 (S)**: you
- **動詞 (V)**: can use
- **目的語 (O)**: Transient or Temporary tables
- **修飾語 (M)**: However（逆接）、which have zero days of fail-safe storage（非制限的関係詞節）
- **文型**: SVO
- **注目ポイント**: `However` で「ただし」と代替手段を提示。`which have zero days of ~` で Transient/Temporary の特性を補足。「無効化はできないが、そもそもFail-Safeを持たないテーブル型を選べる」という論理。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| further | adjective | さらなる、追加の | A further 7-day period of protection. |
| configure | verb | 設定する | Fail-safe cannot be configured. |
| zero days of ~ | phrase | ～が0日 | Zero days of fail-safe storage. |
| however | adverb | しかしながら | However, you can use Transient tables. |

## 3-3. 解説文（日本語）

> Time Travel期間が終了すると、Snowflakeはさらなる保護としてデータをさらに7日間保持します。このフェイルセーフは無効化も設定変更もできません。Snowflakeアカウント、データベース、スキーマ、テーブルのいずれに対しても変更できません。ただし、フェイルセーフのストレージが0日であるTransient（トランジェント）テーブルまたはTemporary（テンポラリ）テーブルを使用することはできます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
