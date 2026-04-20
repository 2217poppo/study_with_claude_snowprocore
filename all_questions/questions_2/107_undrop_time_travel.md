# 107: UNDROP Time Travel

**SnowPro Core Domain**: Domain 5 — Data Collaboration
**作成日**: 2026-04-14
**正答**: B, D

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| UNDROP | Time Travel期間中に削除されたテーブル・スキーマ・データベースを復元するコマンド |
| Time Travel | 過去のデータ状態にアクセスできる機能。DROP後もTime Travel期間中はデータが保持される |
| Soft Delete（ソフト削除） | DROPされてもデータは物理的に削除されず「削除済み」とマークされるだけ。UNDROPで状態を復元 |

## 1-2. 重要コンセプトまとめ

- UNDROPで復元可能: **テーブル・スキーマ・データベース** ✅
- UNDROPで**できないこと**:
  - Snowflakeアカウントのリセット ❌
  - 外部ステージのデータ復元 ❌（Snowflake管理外）
- DROPの仕組み: **物理削除ではなく「削除済み」マーク** → UNDROPで状態を「非削除」に戻すだけ

## 1-3. 公式ドキュメントURL

- [Restoring Objects](https://docs.snowflake.com/en/user-guide/data-time-travel#restoring-objects)

---

## 2-1. 問題文（英語）

> Which of the following is true regarding Time Travel in Snowflake? Select all that apply.
>
> A. Undrop can be used to reset a Snowflake account.
> B. Tables, Schemas, and Databases are not immediately deleted physically but instead marked as deleted.
> C. Undrop can be used to recover data in external stages.
> D. Undrop allows users to restore dropped tables, schemas, and databases.

## 2-2. 問題文の文法解析

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| marked as deleted | phrase | 削除済みとマークされた | Objects are marked as deleted, not physically removed. |
| merely sets the state | phrase | 単に状態を設定する | Snowflake merely sets the table's state to non-deleted. |

## 2-3. 問題文（日本語）

> Time Travelに関して正しいのはどれですか？

---

## 3-1. 解説文（英語）

> Undrop allows users to restore dropped tables, schemas, and databases. When tables, schemas, or databases are dropped in Snowflake, they are not immediately removed from the system and are still recoverable during Time Travel. Snowflake merely sets the table's state to non-deleted to undrop it.

## 3-3. 解説文（日本語）

> UNDROPはドロップされたテーブル・スキーマ・データベースの復元を可能にします。DROPされてもシステムから即座に削除されず、Time Travel期間中は復元可能です。Snowflakeはテーブルの状態を「非削除」に設定するだけでUNDROPを実現します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
