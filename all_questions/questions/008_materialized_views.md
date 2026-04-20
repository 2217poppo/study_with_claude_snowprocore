# 008: Materialized Views

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-02
**正答**: A と F（2つ選択・正解）
- A. Materialized view refreshes are performed automatically.（選択済み・正解）
- F. Materialized views are created to improve the performance of specific queries.（選択済み・正解）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Materialized View（マテリアライズドビュー） | SELECT クエリの結果を事前に計算して物理的に保存するビュー。通常のビューはクエリ実行時に毎回計算するが、マテリアライズドビューは結果をストレージに保持するため、特定クエリのパフォーマンスを大幅に向上できる。 |
| View（通常ビュー） | クエリ結果を保存せず、参照されるたびにSQLを実行する仮想テーブル。マテリアライズドビューと異なりストレージを消費しない。 |
| Automatic Refresh（自動更新） | ベーステーブルのデータが変更されると、Snowflakeがマテリアライズドビューを自動的に更新する仕組み。ユーザーによる手動メンテナンスは不要。 |
| Pre-computation（事前計算） | クエリ実行前に集計・結合などの計算を済ませておくこと。マテリアライズドビューの核心的な仕組み。 |
| Secure Materialized View（セキュアマテリアライズドビュー） | Secure UDFやSecure Viewと同様に、定義を隠蔽しSQL最適化を無効化したマテリアライズドビュー。 |

## 1-2. 重要コンセプトまとめ

- **マテリアライズドビューの2つの正しい特性**（正答A・F）:
  1. **自動更新** — ベーステーブル変更時にSnowflakeが自動でリフレッシュ（手動不要）
  2. **特定クエリのパフォーマンス向上** — すべてのクエリではなく、事前計算した内容に合致するクエリのみ高速化

- **誤答の解説**（ひっかけポイント）:
  | 選択肢 | 誤りの理由 |
  |--------|-----------|
  | B「手動リフレッシュが必要」 | 誤り。Snowflakeは自動でリフレッシュする |
  | C「すべてのクエリのパフォーマンス向上」 | 誤り。事前計算に合致する**特定の**クエリのみ |
  | D「複数テーブルのJOINを含める」 | 誤り。SnowflakeのMVは**単一テーブル**のSELECTのみ対応（JOINは不可） |
  | E「ベーステーブルより遅い」 | 誤り。結果が保存済みのため通常は速い |
  | G「データ共有のために作成」 | 誤り。データ共有はData Sharingの機能 |

- **Snowflakeのマテリアライズドビューの制約**（試験ポイント）:
  - JOINは含められない（単一テーブルのみ）
  - サブクエリは含められない
  - GROUP BY / DISTINCT は一部制限あり
  - Enterprise Edition以上が必要

- **通常ビューとの比較**:
  | 特性 | 通常ビュー | マテリアライズドビュー |
  |------|-----------|---------------------|
  | 結果の保存 | しない | する（物理ストレージ） |
  | 更新タイミング | 毎回クエリ時 | 自動（ベーステーブル変更時） |
  | パフォーマンス | ベーステーブルと同等 | 特定クエリで高速 |
  | ストレージコスト | なし | あり |

## 1-3. 公式ドキュメントURL

- [Materialized Views](https://docs.snowflake.com/en/user-guide/views-materialized)

---

## 2-1. 問題文（英語）

> Which of the following correctly describes materialized views?
>
> Select two answers.
>
> A. Materialized view refreshes are performed automatically.
> B. Materialized views need to be refreshed manually.
> C. Materialized views are created to improve the performance of all queries.
> D. Materialized views definition can contain multiple tables and joins.
> E. Querying a materialized view is typically slower than the base table used in the materialized view.
> F. Materialized views are created to improve the performance of specific queries.
> G. Materialized views are created to enable sharing of data.

## 2-2. 問題文の文法解析

### 文1: "Which of the following correctly describes materialized views?"

- **主語 (S)**: Which of the following
- **副詞 (M)**: correctly（「正確に」）
- **動詞 (V)**: describes
- **目的語 (O)**: materialized views
- **文型**: SVO
- **注目ポイント**:
  - 「correctly describes」の correctly は「正しく説明している」という意味で重要。誤った記述を除外するキーワード
  - 「materialized views」：複数形。ビューという概念全体の特性を問う

### 選択肢の文法注目点

- **A**: 「refreshes are performed automatically」— refreshes が名詞（更新処理）として使われている。動詞 refresh の名詞形
- **D**: 「definition can contain」— definition は単数形。「～を含む（can contain）」で可能性を示す
- **E**: 「typically slower than ~」— typically は「一般的に、通常は」。比較級 slower + than で比較

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| materialized | adjective | 物質化された、実体化された | Materialized views store query results physically. |
| refresh | noun/verb | 更新、リフレッシュ | The refresh is performed automatically by Snowflake. |
| specific | adjective | 特定の | MVs improve performance for specific queries, not all. |
| typically | adverb | 一般的に、通常は | Querying an MV is typically faster than the base table. |

## 2-3. 問題文（日本語）

> 次のうち、マテリアライズドビューを正しく説明しているものはどれですか？
>
> 2つ選びなさい。
>
> A. マテリアライズドビューの更新は自動的に実行される。
> B. マテリアライズドビューは手動でリフレッシュする必要がある。
> C. マテリアライズドビューはすべてのクエリのパフォーマンスを向上させるために作成される。
> D. マテリアライズドビューの定義には複数のテーブルとJOINを含めることができる。
> E. マテリアライズドビューへのクエリは、使用されているベーステーブルへのクエリより通常遅い。
> F. マテリアライズドビューは特定のクエリのパフォーマンスを向上させるために作成される。
> G. マテリアライズドビューはデータ共有を可能にするために作成される。

---

## 3-1. 解説文（英語）

> A materialized view is a view that pre-computes data based on a SELECT query. The query's results are pre-computed and physically stored to enhance performance for similar queries that are executed in the future. When the underlying table is updated, the materialized view refreshes automatically, requiring no additional maintenance. Snowflake-managed services perform the update in the background transparent to the user without interfering with the user's experience.

## 3-2. 解説文の文法解析

### 文1: "A materialized view is a view that pre-computes data based on a SELECT query."

- **主語 (S)**: A materialized view
- **動詞 (V)**: is
- **補語 (C)**: a view that pre-computes data based on a SELECT query
  - 関係詞節: that pre-computes data（view を修飾）
  - 前置詞句: based on a SELECT query（「SELECTクエリに基づいて」）
- **文型**: SVC
- **注目ポイント**: 「pre-computes」の pre- は「あらかじめ」を意味する接頭辞。事前計算がマテリアライズドビューの本質

### 文2: "The query's results are pre-computed and physically stored to enhance performance for similar queries that are executed in the future."

- **主語 (S)**: The query's results
- **動詞 (V)**: are pre-computed and physically stored（受動態の並列）
- **目的修飾語**: to enhance performance（目的を示す不定詞）
- **修飾語**: for similar queries that are executed in the future
- **文型**: SV（受動態）+ 不定詞句 + 前置詞句
- **注目ポイント**:
  - 「physically stored」：物理的に保存される。通常のビューとの違いを示す重要な語
  - 「similar queries」：すべてのクエリではなく類似したクエリのみ（選択肢Cが誤りの根拠）

### 文3: "When the underlying table is updated, the materialized view refreshes automatically, requiring no additional maintenance."

- **従属節**: When the underlying table is updated（時間の副詞節・受動態）
- **主語 (S)**: the materialized view
- **動詞 (V)**: refreshes（自動詞）
- **副詞 (M)**: automatically
- **分詞構文**: requiring no additional maintenance（「追加のメンテナンスを必要とせず」）
- **文型**: When節 + SV + M + 分詞構文
- **注目ポイント**: refreshes が自動詞として使われている（「更新される」）。requiring no ~ の否定分詞構文が「手動不要」の根拠

### 文4: "Snowflake-managed services perform the update in the background transparent to the user without interfering with the user's experience."

- **主語 (S)**: Snowflake-managed services（複合形容詞が修飾）
- **動詞 (V)**: perform
- **目的語 (O)**: the update
- **修飾語**: in the background（「バックグラウンドで」）
- **修飾語**: transparent to the user（「ユーザーに透明な」）
- **修飾語**: without interfering with the user's experience（「ユーザーの操作を妨げることなく」）
- **文型**: SVO + M + M + M
- **注目ポイント**:
  - 「without interfering with ~」は「～を妨げることなく」。without + 動名詞で否定の付帯状況
  - 「transparent to the user」は007でも登場。ユーザーが意識しなくてよい処理を示す定番表現

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| pre-compute | verb | 事前に計算する | MVs pre-compute results to speed up future queries. |
| physically stored | 受動態句 | 物理的に保存される | Results are physically stored in Snowflake storage. |
| interfere with | verb phrase | ～を妨げる、干渉する | The update runs without interfering with user queries. |
| in the background | phrase | バックグラウンドで（裏側で自動処理） | Snowflake performs refreshes in the background. |

## 3-3. 解説文（日本語）

> マテリアライズドビューは、SELECTクエリに基づいてデータを事前に計算するビューです。クエリの結果は事前に計算され、将来実行される類似クエリのパフォーマンスを向上させるために物理的に保存されます。ベーステーブルが更新されると、マテリアライズドビューは自動的にリフレッシュされ、追加のメンテナンスは一切不要です。Snowflakeが管理するサービスが、ユーザーの操作を妨げることなく、ユーザーには透明な形でバックグラウンドで更新を実行します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
