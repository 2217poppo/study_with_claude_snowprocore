# 001: Materialized Views — Beneficial Scenarios

**SnowPro Core Domain**: Domain 4 — Performance Concepts
**作成日**: 2026-04-08
**正答**: A, E（The data does not change often / The query consumes a large number of compute credits）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Materialized View（マテリアライズドビュー） | SELECTクエリの結果を事前計算して物理的に保存するビュー。ベーステーブルが更新されると自動的にリフレッシュされる。頻繁に実行される重いクエリのパフォーマンス向上に有効。 |
| Compute Credits（コンピュートクレジット） | Snowflakeのウェアハウス（仮想コンピュートリソース）の使用量を表す単位。クエリの複雑さ・データ量・ウェアハウスサイズに応じて消費される。 |
| Base Table（ベーステーブル） | マテリアライズドビューの元となるテーブル。ベーステーブルのDML変更に応じてMVが自動リフレッシュされる。 |
| Pre-compute（事前計算） | クエリ実行前にあらかじめ結果を計算・保存しておくこと。クエリ実行時のコンピュートコストを削減できる。 |

## 1-2. 重要コンセプトまとめ

- **MVが有効な条件（2つ）**:
  1. **データが頻繁に変わらない** — ベーステーブルの更新頻度が低いほど、MVのリフレッシュコストが低く、恩恵が大きい
  2. **クエリのコンピュートコストが高い** — 毎回重いクエリを実行するより、事前計算結果を再利用する方がコスト効率が良い
- **MVが不向きな条件**:
  - ベーステーブルが頻繁に更新される → リフレッシュのオーバーヘッドが利益を上回る
  - クエリコストが低い / クレジット消費が無視できるほど少ない → MVを維持するコストに見合わない
- **試験ポイント**: "benefits outweigh the costs" の考え方。MVは「維持コスト < クエリ削減コスト」のときに有効
- **比較**: 通常のビュー（View）はクエリを毎回実行 → 結果を保存しない。MVは結果を保存 → 追加ストレージ・リフレッシュコストが発生

## 1-3. 公式ドキュメントURL

- [Working with Materialized Views](https://docs.snowflake.com/en/user-guide/views-materialized)

---

## 2-1. 問題文（英語）

> A materialized view will be beneficial for which of the following scenarios?
>
> Select all that apply.
>
> A. The data processed by the query does not change often.
>
> B. The data in the base table is updated frequently.
>
> C. The query cost is very low.
>
> D. The query consumes a negligible number of compute credits on each execution.
>
> E. The query consumes a large number of compute credits on each execution.

## 2-2. 問題文の文法解析

### 文1: "A materialized view will be beneficial for which of the following scenarios?"

- **主語 (S)**: A materialized view
- **動詞 (V)**: will be（助動詞 will + be動詞）
- **補語 (C)**: beneficial（形容詞）
- **修飾語 (M)**: for which of the following scenarios（前置詞句、疑問詞節）
- **文型**: SVC（主語 + 動詞 + 補語）
- **注目ポイント**: `will be beneficial for ~` は「〜にとって有益である」の表現。`which of the following` は「以下のうちどれが」の定型表現で試験問題に頻出。

### 選択肢の文法

- **A.** "The data processed by the query does not change often."
  - 主語: The data（+ 過去分詞句 `processed by the query` が後置修飾）
  - 動詞: does not change
  - 修飾: often（副詞）
  - **注目**: 過去分詞の後置修飾 `processed by the query` = クエリによって処理されるデータ

- **E.** "The query consumes a large number of compute credits on each execution."
  - 主語: The query
  - 動詞: consumes
  - 目的語: a large number of compute credits
  - 修飾: on each execution（前置詞句 = 実行のたびに）
  - **注目**: `a large number of` = 大量の（可算名詞に使う）。`on each execution` = 毎回の実行ごとに

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| beneficial | 形容詞 | 有益な、恩恵をもたらす | Clustering keys are beneficial for large tables. |
| scenario | 名詞 | シナリオ、状況、場面 | In which scenario would you use Time Travel? |
| consume | 動詞 | 消費する | This query consumes many credits. |
| negligible | 形容詞 | 無視できるほど少ない、取るに足らない | The overhead is negligible. |
| execution | 名詞 | 実行 | On each execution, the query runs fresh. |
| frequently | 副詞 | 頻繁に | The base table is updated frequently. |

## 2-3. 問題文（日本語）

> マテリアライズドビューが有益になるのは、次のシナリオのうちどれですか？
>
> 該当するものをすべて選択してください。
>
> A. クエリが処理するデータがあまり変わらない。
>
> B. ベーステーブルのデータが頻繁に更新される。
>
> C. クエリのコストが非常に低い。
>
> D. クエリは実行のたびに無視できるほどわずかなコンピュートクレジットしか消費しない。
>
> E. クエリは実行のたびに大量のコンピュートクレジットを消費する。

---

## 3-1. 解説文（英語）

> Materialized views can be helpful if a query or slight variation is executed frequently.
>
> The executed queries are complex and take time and resources; a materialized view can pre-compute the results and speed up the processing.
>
> The query result is consistent and does not change frequently. This indicates that the data underlying the query doesn't change too frequently. If it did change frequently, then the resources & compute required to keep the materialized view up-to-date will outweigh the benefit the view provides.

## 3-2. 解説文の文法解析

### 文1: "Materialized views can be helpful if a query or slight variation is executed frequently."

- **主語 (S)**: Materialized views
- **動詞 (V)**: can be（助動詞 + be動詞）
- **補語 (C)**: helpful
- **条件節 (M)**: if a query or slight variation is executed frequently
- **文型**: SVC + 条件節
- **注目ポイント**: 条件節内は `is executed`（受動態）。`slight variation` = わずかなバリエーション（同じクエリの微妙に異なるバージョン）

### 文2: "The executed queries are complex and take time and resources; a materialized view can pre-compute the results and speed up the processing."

- **前半**: 主語 The executed queries / 動詞 are（補語 complex）and take（目的語 time and resources）
- **後半**: 主語 a materialized view / 動詞 can pre-compute（目的語 the results）and speed up（目的語 the processing）
- **注目**: セミコロン（;）で2つの独立節を接続。前半が理由、後半が結果を述べる因果構造。

### 文3: "If it did change frequently, then the resources & compute required to keep the materialized view up-to-date will outweigh the benefit the view provides."

- **条件節**: If it did change frequently（仮定法過去的な表現）
- **主節主語**: the resources & compute required to keep the materialized view up-to-date（過去分詞句が主語を後置修飾）
- **主節動詞**: will outweigh
- **目的語**: the benefit the view provides（関係詞節が benefit を修飾）
- **注目ポイント**:
  - `If it did change` — 直説法過去だが、実際には「もし仮に変わったとしたら」の仮定ニュアンス
  - `required to keep ~ up-to-date` — 分詞形容詞として resources を修飾
  - `outweigh` = 〜より重い → 「上回る、勝る」の重要動詞

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| slight variation | 名詞句 | わずかな変形、微妙なバリエーション | A slight variation of the query still benefits from the MV. |
| outweigh | 動詞 | 〜を上回る、勝る | The cost outweighs the benefit in this case. |
| up-to-date | 形容詞 | 最新の状態 | Keep the materialized view up-to-date with the base table. |
| consistent | 形容詞 | 一貫した、変動しない | The result is consistent across executions. |
| underlying | 形容詞 | 根底にある、基礎となる | The underlying data doesn't change often. |
| indicate | 動詞 | 示す、指し示す | This indicates that the base table is stable. |

## 3-3. 解説文（日本語）

> マテリアライズドビューは、あるクエリまたはそのわずかな変形が頻繁に実行される場合に役立ちます。
>
> 実行されるクエリが複雑で時間とリソースを要する場合、マテリアライズドビューは結果を事前計算して処理を高速化できます。
>
> クエリ結果が一貫しており、頻繁に変わらない場合も有効です。これは、クエリの基となるデータがあまり頻繁に変わらないことを示しています。もし頻繁に変わるならば、マテリアライズドビューを最新状態に保つために必要なリソースとコンピュートが、ビューがもたらす恩恵を上回ってしまいます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
