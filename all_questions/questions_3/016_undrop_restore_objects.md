# 016: UNDROP Restore Objects

**SnowPro Core Domain**: Domain 5 — Data Collaboration
**作成日**: 2026-04-15
**正答**: D

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| UNDROP | Time Travel期間中に削除されたテーブル・スキーマ・データベースを復元するコマンド。物理削除ではなく状態を「非削除」に戻すだけ |
| Time Travel | 過去のデータ状態にアクセスできる機能。DROP後もTime Travel期間中はデータが保持される |
| Soft Delete（ソフト削除） | DROPされてもデータは物理的に削除されず「削除済み」とマークされるだけ。UNDROPで状態を復元可能 |

## 1-2. 重要コンセプトまとめ

- UNDROPで復元可能なオブジェクト（**3種類のみ**）:
  - **テーブル** ✅
  - **スキーマ** ✅
  - **データベース** ✅
- UNDROPで復元**できない**もの:
  - **アカウント** ❌
  - **ロール** ❌
  - ネットワーク接続やデータパケット ❌（UNDROPはネットワーク機能ではない）
- UNDROPの仕組み: 物理削除ではなく**状態を「非削除」に戻すだけ**（merely sets the state to non-deleted）
- 試験のひっかけ: UNDROPを「ネットワーク機能」「通信パケットの復元」と混同させる選択肢に注意

## 1-3. 公式ドキュメントURL

- [Restoring Objects](https://docs.snowflake.com/en/user-guide/data-time-travel#restoring-objects)

---

## 2-1. 問題文（英語）

> Which of the following is true regarding Time Travel in Snowflake?
>
> A. Undrop enables Snowflake to keep a stable client connection open even with a bad network link.
> B. The undrop feature allows Snowflake to reconstruct data packets dropped during communication.
> C. Undrop allows users to recover dropped accounts and roles.
> D. Undrop allows users to restore dropped tables, schemas, and databases.

## 2-2. 問題文の文法解析

### 文1: "Undrop allows users to restore dropped tables, schemas, and databases."

- **主語 (S)**: Undrop
- **動詞 (V)**: allows
- **目的語 (O)**: users
- **補語 (C)**: to restore dropped tables, schemas, and databases
- **文型**: SVOC（allow O to do）
- **注目ポイント**: `dropped` が過去分詞で tables/schemas/databases を修飾。「削除されたオブジェクトを復元する」。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| restore | verb | 復元する | Restore dropped tables. |
| merely | adverb | 単に | Merely sets the state to non-deleted. |
| recoverable | adjective | 復元可能な | Still recoverable during Time Travel. |
| retained | adjective | 保持された | Data is retained on cloud storage. |

## 2-3. 問題文（日本語）

> SnowflakeのTime Travelに関して正しいのはどれですか？
>
> A. UNDROPはネットワーク接続が不安定でもSnowflakeが安定した接続を維持できるようにする。
> B. UNDROP機能はSnowflakeが通信中にドロップされたデータパケットを再構築できるようにする。
> C. UNDROPはユーザーが削除されたアカウントとロールを復元できるようにする。
> D. UNDROPはユーザーが削除されたテーブル、スキーマ、データベースを復元できるようにする。

---

## 3-1. 解説文（英語）

> Undrop allows users to restore dropped tables, schemas, and databases. When tables, schemas, or databases are dropped in Snowflake, they are not immediately removed from the system and are still recoverable during Time Travel. When a table is dropped, the data is retained on the cloud storage, even though the table is listed as dropped. Snowflake merely sets the table's state to non-deleted to undrop it. Therefore, undrop can be applied to tables, schemas, and databases.

## 3-2. 解説文の文法解析

### 文1: "When tables, schemas, or databases are dropped in Snowflake, they are not immediately removed from the system and are still recoverable during Time Travel."

- **主語 (S)**: they（= tables, schemas, databases）
- **動詞 (V)**: are not removed / are recoverable（並列）
- **修飾語 (M)**: When ~ are dropped（条件）、immediately（副詞）、during Time Travel（期間）
- **文型**: SV + SVC
- **注目ポイント**: `not immediately removed` で物理削除が即座ではないことを示す。`still recoverable` で復元可能性を明示。

### 文2: "Snowflake merely sets the table's state to non-deleted to undrop it."

- **主語 (S)**: Snowflake
- **動詞 (V)**: sets
- **目的語 (O)**: the table's state
- **補語 (C)**: to non-deleted
- **修飾語 (M)**: merely（単に）、to undrop it（目的）
- **文型**: SVOC
- **注目ポイント**: `merely` が「単に状態を変えるだけ」という軽量な操作であることを強調。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| not immediately removed | phrase | 即座には削除されない | Not immediately removed from the system. |
| still recoverable | phrase | まだ復元可能 | Still recoverable during Time Travel. |
| merely sets the state | phrase | 単に状態を設定する | Merely sets the state to non-deleted. |
| can be applied to ~ | phrase | ～に適用可能 | Undrop can be applied to tables, schemas, and databases. |

## 3-3. 解説文（日本語）

> UNDROPはユーザーが削除されたテーブル、スキーマ、データベースを復元できるようにします。Snowflakeでテーブル、スキーマ、データベースがドロップされても、システムから即座に削除されず、Time Travel期間中はまだ復元可能です。テーブルがドロップされた場合、テーブルは削除済みとしてリストされていても、データはクラウドストレージに保持されます。SnowflakeはUNDROP時にテーブルの状態を単に「非削除」に設定するだけです。したがって、UNDROPはテーブル、スキーマ、データベースに適用可能です。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
