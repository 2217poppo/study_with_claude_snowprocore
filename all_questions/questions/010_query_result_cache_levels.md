# 010: Query Result Cache — Control Levels

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-02
**正答**: B・C・D の3つ（複数選択）
- A. Table（誤り — Tableレベルは存在しない）
- B. User（選択済み・正解）
- C. Account（正しい選択・**未選択**）
- D. Session（選択済み・正解）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| USE_CACHED_RESULT | Query Result Cacheの有効/無効を制御するパラメータ。デフォルトは TRUE（有効）。Session・User・Accountの3レベルで設定可能。 |
| Session-level Parameter（セッションレベルパラメータ） | 現在のセッション（接続）中のみ有効な設定。セッション終了で元に戻る。`ALTER SESSION SET USE_CACHED_RESULT = FALSE` で設定。 |
| User-level Parameter（ユーザーレベルパラメータ） | 特定のユーザーに対して永続的に適用される設定。`ALTER USER xxx SET USE_CACHED_RESULT = FALSE` で設定。 |
| Account-level Parameter（アカウントレベルパラメータ） | アカウント全体に適用される設定。すべてのユーザー・セッションに影響する。`ALTER ACCOUNT SET USE_CACHED_RESULT = FALSE` で設定。 |

## 1-2. 重要コンセプトまとめ

- **Query Result Cacheを無効化できる3つのレベル**（すべて正答）:
  1. **Session** — 現在のセッションのみ無効化
  2. **User** — 特定ユーザーに対して永続的に無効化
  3. **Account** — アカウント全体で無効化

- **「Table」レベルは存在しない** — ひっかけ選択肢。Query Result CacheはTableレベルの制御はない

- **パラメータの優先順位**（より狭いスコープが優先）:
  ```
  Session > User > Account
  ```
  セッションレベルの設定が最も強く、アカウントレベルの設定を上書きできる

- **今回のミス**: AccountレベルをUserとSessionと同様に覚えられていなかった。3つセットで覚える

- **002との関連**: Query Result Cache自体の動作（24時間・31日）はすでに学習済み。今回はその「制御方法」を問う応用問題

- **試験ポイント**: `USE_CACHED_RESULT` パラメータ名と、Session/User/Account の3レベルを覚える

## 1-3. 公式ドキュメントURL

- [Using Persisted Query Results — USE_CACHED_RESULT](https://docs.snowflake.com/en/user-guide/querying-persisted-results)

---

## 2-1. 問題文（英語）

> Query Result Cache can be turned off at which levels? Select all that apply.
>
> A. Table
> B. User
> C. Account
> D. Session

## 2-2. 問題文の文法解析

### 文1: "Query Result Cache can be turned off at which levels?"

- **主語 (S)**: Query Result Cache
- **動詞 (V)**: can be turned off（助動詞 + 受動態 + 句動詞）
- **疑問詞句**: at which levels（「どのレベルで」）
- **文型**: S + can be + V(句動詞) + 疑問詞句
- **注目ポイント**:
  - 「turn off」は「オフにする、無効にする」。受動態 be turned off で「無効にされる」
  - 「at which levels」は「どのレベルで」。場所・範囲を示す at + level の表現
  - 「can be turned off」の can は「（技術的に）できる」という可能性

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| turn off | phrasal verb | オフにする、無効にする | The cache can be turned off at the session level. |
| at the ~ level | phrase | ～レベルで | This setting can be changed at the account level. |
| select all that apply | 慣用句 | 該当するものをすべて選べ | Select all that apply — multiple answers may be correct. |

## 2-3. 問題文（日本語）

> Query Result Cacheはどのレベルで無効化できますか？該当するものをすべて選びなさい。
>
> A. テーブル
> B. ユーザー
> C. アカウント
> D. セッション

---

## 3-1. 解説文（英語）

> Query result cache is enabled by default but can be turned off at a session, user, or account level using the USE_CACHED_RESULT parameter.

## 3-2. 解説文の文法解析

### 文1: "Query result cache is enabled by default but can be turned off at a session, user, or account level using the USE_CACHED_RESULT parameter."

- **主語 (S)**: Query result cache
- **動詞1 (V1)**: is enabled（受動態）/ 修飾: by default
- **接続詞**: but（対比）
- **動詞2 (V2)**: can be turned off（受動態 + 助動詞）
- **修飾語**: at a session, user, or account level（「セッション・ユーザー・アカウントレベルで」）
- **手段**: using the USE_CACHED_RESULT parameter（「USE_CACHED_RESULTパラメータを使って」）
- **文型**: SV1（受動態）+ but + SV2（受動態）+ M + 分詞構文
- **注目ポイント**:
  - 「is enabled by default but can be turned off」: デフォルト動作と例外的操作を but で対比
  - 「at a session, user, or account level」: 3つのレベルをカンマ + or で列挙。試験の正答がここに直接書かれている
  - 「using ~」: 手段を示す現在分詞句。「～を使って」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| enabled by default | 受動態句 | デフォルトで有効になっている | The cache is enabled by default. |
| parameter | noun | パラメータ（設定値） | Use the USE_CACHED_RESULT parameter to disable the cache. |
| using ~ | 現在分詞 | ～を使って（手段） | Disable it using the ALTER SESSION command. |

## 3-3. 解説文（日本語）

> クエリ結果キャッシュはデフォルトで有効ですが、`USE_CACHED_RESULT` パラメータを使用して、セッション・ユーザー・アカウントレベルで無効にすることができます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
