# 004: Search Optimization — Effective Query Types

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-08
**正答**: C（IN predicate）, D（equality predicate）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Search Optimization Service（検索最適化サービス） | ポイントルックアップクエリのパフォーマンスを向上させるSnowflakeのサービス。テーブルに「サーチアクセスパス」を追加構築することで、スキャン量を大幅に削減する。追加ストレージコストが発生する。 |
| Point Lookup Query（ポイントルックアップクエリ） | 高選択性フィルターを使い、1〜数行のみを返すクエリ。`WHERE id = 12345` や `WHERE status IN ('A', 'B')` のような特定値の検索が典型例。 |
| Equality Predicate（等値述語） | `=` 演算子を使った条件式。`WHERE col = value`。Search Optimization が最も効果を発揮する条件の一つ。 |
| IN Predicate（IN述語） | `IN (val1, val2, ...)` を使った条件式。複数の値のいずれかにマッチする行を返す。等値比較の集合版。Search Optimization の対象。 |
| Windowing Function（ウィンドウ関数） | `OVER()` 句を使い、行のグループ（ウィンドウ）に対して集計や順位付けを行う関数（例: `ROW_NUMBER()`, `SUM() OVER(...)`）。テーブル全体またはパーティション全体をスキャンするためSearch Optimizationの恩恵を受けない。 |
| Highly Selective Filter（高選択性フィルター） | ごく少数の行にしかマッチしないWHERE条件。全行の1%未満しか返さないようなフィルターが目安。Search Optimization が効果的な前提条件。 |

## 1-2. 重要コンセプトまとめ

- **Search Optimization が有効なクエリ**: 等値述語（`=`）または IN述語を使ったポイントルックアップクエリ
- **有効でないクエリ**:
  - テーブル全体を読むクエリ → フルスキャンするのでSearch Optimizationが無意味
  - ウィンドウ関数を使うクエリ → テーブル全体/パーティション全体を参照するため恩恵なし
- **核心のロジック**: Search Optimizationは「どのマイクロパーティションに目的の値があるか」を事前索引化する。テーブル全体を読む必要があるクエリには機能しない
- **試験ポイント**: 「equality predicate」と「IN predicate」の2つが正解。セットで覚える
- **既出の関連問題**: 043（Search Optimization 非サポート対象）、093（非サポートクエリパターン）

## 1-3. 公式ドキュメントURL

- [Search Optimization Service — Understanding](https://docs.snowflake.com/en/user-guide/search-optimization-service#understanding-the-search-optimization-service)

---

## 2-1. 問題文（英語）

> Which type of queries will see a performance improvement from Search Optimization?
>
> Select two answers.
>
> A. Queries that read the entire table
>
> B. Queries that use windowing functions
>
> C. Queries that use IN predicate
>
> D. Queries that use equality predicate

## 2-2. 問題文の文法解析

### 文1: "Which type of queries will see a performance improvement from Search Optimization?"

- **主語 (S)**: Which type of queries（疑問詞 which + 名詞句）
- **動詞 (V)**: will see（助動詞 + 動詞）
- **目的語 (O)**: a performance improvement
- **修飾語 (M)**: from Search Optimization（前置詞句 — 改善の源）
- **文型**: SVO
- **注目ポイント**:
  - `see a performance improvement` — `see` の目的語に名詞句を置く表現。「パフォーマンス改善が見られる・得られる」。`experience` や `achieve` の代わりに `see` を使う慣用的パターン
  - `from Search Optimization` — 「Search Optimizationから（恩恵を受けて）」

### 選択肢の文法

- **A〜D.** "Queries that use/read + 名詞"
  - いずれも `Queries`（名詞）+ `that`（主格関係代名詞）+ 動詞の構造
  - 関係詞節 `that ~` がどのようなクエリかを後置修飾する

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| see a performance improvement | 動詞句 | パフォーマンス向上が見られる | Point lookups will see a performance improvement from Search Optimization. |
| windowing function | 名詞句 | ウィンドウ関数（OVER句を使う集計関数） | ROW_NUMBER() is a windowing function. |
| equality predicate | 名詞句 | 等値述語（= 演算子を使うWHERE条件） | WHERE id = 100 is an equality predicate. |
| IN predicate | 名詞句 | IN述語（IN演算子を使うWHERE条件） | WHERE status IN ('A', 'B') is an IN predicate. |

## 2-3. 問題文（日本語）

> Search Optimizationによってパフォーマンスが向上するクエリはどれですか？
>
> 2つ選択してください。
>
> A. テーブル全体を読み取るクエリ
>
> B. ウィンドウ関数を使用するクエリ
>
> C. IN述語を使用するクエリ
>
> D. 等値述語（=）を使用するクエリ

---

## 3-1. 解説文（英語）

> The search optimization service can be used to improve the performance of point lookup queries that return only one or a few rows, using highly selective filters using equality predicates or IN predicates.

## 3-2. 解説文の文法解析

### 文1: "The search optimization service can be used to improve the performance of point lookup queries that return only one or a few rows, using highly selective filters using equality predicates or IN predicates."

- **主語 (S)**: The search optimization service
- **動詞 (V)**: can be used（受動態 — 助動詞 + be + 過去分詞）
- **目的の不定詞 (M1)**: to improve the performance of point lookup queries
- **関係詞節 (M2)**: that return only one or a few rows（point lookup queries を修飾）
- **付帯状況の分詞句 (M3)**: using highly selective filters using equality predicates or IN predicates
- **文型**: SV（受動態）
- **注目ポイント**:
  - `can be used to do` — 「〜するために使われることができる」。機能・サービスの用途を説明する典型受動態
  - 末尾の `using highly selective filters using equality predicates or IN predicates` は分詞構文。前の `using` は「フィルターを使って」（付帯状況）、後の `using` は「等値述語またはIN述語を使った」（フィルターの内容の修飾）
  - `only one or a few rows` — Search Optimizationが有効な「少数行」の定義

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| can be used to do | 受動態句 | 〜するために使うことができる | This service can be used to speed up queries. |
| highly selective | 形容詞句 | 非常に高選択性の（返す行が極めて少ない） | Equality predicates are highly selective filters. |
| only one or a few | 数量表現 | 1つまたは少数のみ | Point lookups return only one or a few rows. |
| predicate | 名詞 | 述語（WHERE句の条件式） | An equality predicate uses the = operator. |

## 3-3. 解説文（日本語）

> Search Optimizationサービスは、等値述語またはIN述語を使った高選択性フィルターを使用して、1行または少数の行のみを返すポイントルックアップクエリのパフォーマンスを向上させるために使用できます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
