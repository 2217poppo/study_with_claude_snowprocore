# 081: Query Result Cache Conditions

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-16
**正答**: A, B, C

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Query Result Cache（クエリ結果キャッシュ） | 以前実行したクエリの結果をCloud Servicesレイヤーが保持するキャッシュ。同一クエリ・同一データ条件下で再利用される |
| Micro-Partition（マイクロパーティション） | Snowflakeのデータ保存単位。データが変更されるとマイクロパーティションが変更され、キャッシュが無効化される |
| Syntactically Identical（構文的に同一） | クエリのSQL文が文字レベルで一致すること。スペース・大文字小文字の微妙な違いでもキャッシュが使えない場合がある |
| Privileges（権限） | テーブルへのアクセス権限。キャッシュを利用するにはクエリ実行ロールが対象テーブルへの権限を持っている必要がある |

## 1-2. 重要コンセプトまとめ

- クエリ結果キャッシュが使われる**3つの条件**:
  1. **クエリが構文的に同一**（以前実行したクエリと一致）
  2. **マイクロパーティションが変更されていない**（データ未変更）
  3. **実行ロールがテーブルへの権限を持っている**
- キャッシュは**24時間有効**（再利用のたびに延長、最大31日）
- **同じユーザーである必要はない** — 異なるユーザーでも上記条件を満たせばキャッシュ利用可能
- 新しいマイクロパーティションが追加された場合はキャッシュ**無効**（データ変更とみなされる）

## 1-3. 公式ドキュメントURL

- [Persisted Query Results](https://docs.snowflake.com/en/user-guide/querying-persisted-results)

---

## 2-1. 問題文（英語）

> Under which circumstances will the query result cache fulfill the query result? Select all that apply.
>
> A. The role executing the query has the necessary privileges on the tables used in the query.
> B. The query matches a previously executed query for which cached results are still available.
> C. The micro-partitions for the tables in the query have not changed.
> D. The query is executed by the same user who generated the result cache for a previous query.
> E. New micro-partitions have been added to one of the tables used in the query.

## 2-2. 問題文の文法解析

### 文1: "Under which circumstances will the query result cache fulfill the query result?"

- **主語 (S)**: the query result cache
- **動詞 (V)**: will fulfill
- **目的語 (O)**: the query result
- **修飾語 (M)**: Under which circumstances（前置詞句 — 条件を問う）
- **文型**: SVO
- **注目ポイント**: 「Under which circumstances」で条件を問う。「fulfill」は「充足する、満たす」（キャッシュから結果を返す）。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| circumstances | 名詞 | 条件、状況 | Under which circumstances is the cache used? |
| fulfill | 動詞 | 満たす、充足する | The cache fulfills the query result. |
| necessary privileges | 名詞句 | 必要な権限 | The role has the necessary privileges. |
| syntactically identical | 形容詞句 | 構文的に同一の | The query must be syntactically identical. |

## 2-3. 問題文（日本語）

> どのような条件下でクエリ結果キャッシュがクエリ結果を返しますか？該当するものをすべて選んでください。
>
> A. クエリを実行するロールが、クエリで使用されるテーブルに対する必要な権限を持っている。
> B. クエリが、キャッシュ結果がまだ利用可能な以前に実行されたクエリと一致する。
> C. クエリで使用されるテーブルのマイクロパーティションが変更されていない。
> D. クエリが、以前のクエリで結果キャッシュを生成した同じユーザーによって実行される。
> E. クエリで使用されるテーブルの1つに新しいマイクロパーティションが追加された。

---

## 3-1. 解説文（英語）

> The underlying data and micro-partitions must not change, and the query should be syntactically identical for the query result cache to be used. The cache must have been generated (or last used) less than 24 hours ago.

## 3-2. 解説文の文法解析

### 文1: "The underlying data and micro-partitions must not change, and the query should be syntactically identical for the query result cache to be used."

- **主語 (S)**: The underlying data and micro-partitions / the query
- **動詞 (V)**: must not change / should be
- **補語 (C)**: syntactically identical
- **修飾語 (M)**: for the query result cache to be used（目的のfor + 不定詞）
- **文型**: SV; SVC
- **注目ポイント**: 「must not change」で絶対条件。「for ~ to be used」で「～が使われるためには」。

### 文2: "The cache must have been generated (or last used) less than 24 hours ago."

- **主語 (S)**: The cache
- **動詞 (V)**: must have been generated（完了形の受動態）
- **修飾語 (M)**: (or last used) / less than 24 hours ago
- **文型**: SV（受動態）
- **注目ポイント**: 「must have been generated」は「生成されたはずである」ではなく「生成されている必要がある」。24時間以内の条件。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| underlying | 形容詞 | 基盤となる、元の | The underlying data must not change. |
| syntactically identical | 形容詞句 | 構文的に同一の | The query should be syntactically identical. |
| for ~ to be used | 構文 | ～が使われるためには | For the cache to be used. |

## 3-3. 解説文（日本語）

> 基盤となるデータとマイクロパーティションが変更されていないこと、そしてクエリが構文的に同一であることが、クエリ結果キャッシュが使用されるための条件です。キャッシュは24時間以内に生成（または最後に使用）されている必要があります。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
