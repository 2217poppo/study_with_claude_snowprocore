# 066: Table Types Session Persistence

**SnowPro Core Domain**: Domain 5 — Data Collaboration
**作成日**: 2026-04-13
**正答**: B, D

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Permanent Table（永続テーブル） | デフォルトのテーブル種別。セッションとは無関係に存在し続ける。Time Travel最大90日 + Fail-Safe 7日 |
| Transient Table（トランジェントテーブル） | セッションが閉じても存続するテーブル。異なるセッションからアクセス可能。Time Travel最大1日、Fail-Safe 0日 |
| Temporary Table（テンポラリテーブル） | セッションにローカルなテーブル。セッションが閉じると**即座に削除される**。Time Travel最大1日、Fail-Safe 0日 |
| Dual Storage | Snowflakeの公式テーブル種別ではない（ダミー選択肢） |

## 1-2. 重要コンセプトまとめ

- セッション終了後も存続するテーブル: **Permanent** と **Transient**
- セッション終了で消える: **Temporary**
- 3種類のテーブルの比較:

| 特性 | Permanent | Transient | Temporary |
|------|-----------|-----------|-----------|
| セッション終了後 | **存続** | **存続** | 削除 |
| 他セッションからアクセス | 可 | 可 | 不可 |
| Time Travel | 最大90日 | 最大1日 | 最大1日 |
| Fail-Safe | 7日 | 0日 | 0日 |

- Temporary = 「セッションローカル」がキーワード
- Transient は一見Temporaryに似ているが、**セッションをまたいで存在**する
- 「Dual Storage」はSnowflakeのテーブル種別ではない

## 1-3. 公式ドキュメントURL

- [Temporary and Transient Tables](https://docs.snowflake.com/en/user-guide/tables-temp-transient)

---

## 2-1. 問題文（英語）

> Which of the following table types will continue to exist even if the session is closed? Select all that apply.
>
> A. Temporary
> B. Transient
> C. Dual Storage
> D. Permanent

## 2-2. 問題文の文法解析

### 文1: "Which of the following table types will continue to exist even if the session is closed?"

- **主語 (S)**: Which of the following table types
- **動詞 (V)**: will continue to exist
- **修飾語 (M)**: even if the session is closed（譲歩条件）
- **文型**: SV（疑問文）
- **注目ポイント**: `continue to exist` は「存在し続ける」。`even if ~` は「たとえ～しても」で条件を設定。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| continue to exist | phrase | 存在し続ける | Permanent tables continue to exist. |
| even if ~ | phrase | たとえ～しても | Even if the session is closed. |
| local to a session | phrase | セッションにローカルな | Temporary tables are local to a session. |
| dropped | adjective | 削除された | Dropped as soon as the session is closed. |

## 2-3. 問題文（日本語）

> セッションが閉じられても存在し続けるテーブルタイプは以下のどれですか？該当するものをすべて選んでください。
>
> A. Temporary
> B. Transient
> C. Dual Storage
> D. Permanent

---

## 3-1. 解説文（英語）

> Permanent tables exist regardless of the session and are not destroyed when a session is closed. Transient tables are not dropped when a session is closed, so they can be accessed from different sessions. Temporary tables are local to a session and are dropped as soon as the session is closed.

## 3-2. 解説文の文法解析

### 文1: "Permanent tables exist regardless of the session and are not destroyed when a session is closed."

- **主語 (S)**: Permanent tables
- **動詞 (V)**: exist / are not destroyed（並列）
- **修飾語 (M)**: regardless of the session（条件無関係）、when a session is closed（時間条件）
- **文型**: SV + SV
- **注目ポイント**: `regardless of ~` は「～にかかわらず」。

### 文2: "Transient tables are not dropped when a session is closed, so they can be accessed from different sessions."

- **主語 (S)**: Transient tables / they
- **動詞 (V)**: are not dropped / can be accessed（受動態）
- **修飾語 (M)**: when a session is closed（条件）、so（結果）、from different sessions（出所）
- **文型**: SV + SV

### 文3: "Temporary tables are local to a session and are dropped as soon as the session is closed."

- **主語 (S)**: Temporary tables
- **動詞 (V)**: are / are dropped（並列）
- **補語**: local to a session
- **修飾語 (M)**: as soon as the session is closed（即座の条件）
- **文型**: SVC + SV
- **注目ポイント**: `as soon as ~` は「～するとすぐに」。Temporaryの即座削除を強調。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| regardless of ~ | phrase | ～にかかわらず | Exist regardless of the session. |
| as soon as ~ | phrase | ～するとすぐに | Dropped as soon as the session is closed. |

## 3-3. 解説文（日本語）

> 永続テーブルはセッションにかかわらず存在し、セッションが閉じられても破棄されません。トランジェントテーブルはセッションが閉じられてもドロップされないため、異なるセッションからアクセスできます。テンポラリテーブルはセッションにローカルであり、セッションが閉じられるとすぐにドロップされます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
