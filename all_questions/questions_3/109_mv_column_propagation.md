# 109: Materialized View — New Column Propagation Behavior

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-17
**正答**: B, D（新列は自動伝播されない / MVはサスペンドされない）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Materialized View (MV) | SELECT結果を事前計算して物理的に保存するビュー。ベーステーブル更新時にSnowflakeが自動的にMVを更新する |
| Base Table（ベーステーブル） | マテリアライズドビューの基となるテーブル。BASEテーブルへのDMLはMVのメンテナンスをトリガーする |
| Propagate（伝播） | ある場所での変更が別の場所に自動的に反映されること |
| Suspend（サスペンド） | ウェアハウスやMVの動作を一時停止すること。サスペンドされたMVはクエリに使用されなくなる |
| SELECT * | テーブルのすべての列を取得するSQL構文。MVの定義時に使っても、後から追加された列は含まれない |
| Column Definition（列定義） | MVの列はMVが作成されたときに固定される。後からベーステーブルに追加された列は含まれない |

## 1-2. 重要コンセプトまとめ

- **ベーステーブルに新しい列を追加しても、MVには自動的に反映（伝播）されない**
  - MVの列定義はMV作成時に固定される
  - `SELECT *` でMVを定義していても、後で追加された列は対象外
- **新列追加でMVはサスペンドされない（引き続き使用可能）**
  - MVは既存の列で定義された範囲で継続して機能する
  - サスペンドさせるのはエラー発生時（ベーステーブルのDROPなど）
- **「MVを再開しなければ使えない」という選択肢は誤り**
  - MVは新列追加後もそのまま使用可能
- **新しい列もMVに含めたい場合は、MVを再作成する必要がある**
  - `CREATE OR REPLACE MATERIALIZED VIEW` などで再定義

## 1-3. 公式ドキュメントURL

- [Adding Columns to the Base Table](https://docs.snowflake.com/en/user-guide/views-materialized#adding-columns-to-the-base-table)
- [Materialized Views Overview](https://docs.snowflake.com/en/user-guide/views-materialized)

---

## 2-1. 問題文（英語）

> Which of the following correctly describes the behavior of a materialized view when new columns are added to the base table? Select two answers.
>
> A. The new columns are automatically propagated to the materialized view.
> B. The new columns are NOT propagated to the materialized view automatically.
> C. The materialized view is suspended.
> D. The materialized view is NOT suspended.
> E. You must resume the materialized view if you want to use it again.

## 2-2. 問題文の文法解析

### 文1: "Which of the following correctly describes the behavior of a materialized view when new columns are added to the base table?"

- **主語 (S)**: Which of the following
- **動詞 (V)**: correctly describes
- **目的語 (O)**: the behavior of a materialized view
- **時間節**: when new columns are added to the base table（受動態）
- **文型**: SVO
- **注目ポイント**: 
  - `correctly describes` = 正確に説明する（副詞で動詞を修飾）
  - `when new columns are added` = 新しい列が追加された場合（受動態の時間節）

### 選択肢A/Bの対比:

- A: "The new columns **are automatically propagated** to the materialized view."（受動態・肯定）
- B: "The new columns **are NOT propagated** to the materialized view **automatically**."（受動態・否定）
- **注目ポイント**: 
  - `propagate` = 伝播する、広がる（受動態で「反映される」）
  - `automatically` の位置がAとBで異なる（A: 動詞の前、B: 文末）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| propagate | 動詞 | 伝播する、広がる | Changes are not propagated to the materialized view. |
| suspend | 動詞 | 停止する、サスペンドする | The view is not suspended after column changes. |
| resume | 動詞 | 再開する | You don't need to resume the view after adding columns. |
| automatically | 副詞 | 自動的に | New columns are not automatically reflected in the view. |

## 2-3. 問題文（日本語）

> ベーステーブルに新しい列が追加された場合のマテリアライズドビューの動作を正しく説明しているものはどれですか？2つ選んでください。
>
> A. 新しい列はマテリアライズドビューに自動的に伝播される。
> B. 新しい列はマテリアライズドビューに自動的には伝播されない。
> C. マテリアライズドビューはサスペンドされる。
> D. マテリアライズドビューはサスペンドされない。
> E. マテリアライズドビューを再び使用するには、再開（Resume）する必要がある。

---

## 3-1. 解説文（英語）

> When new columns are added to a base table with a materialized view on top, the new columns are NOT propagated automatically to the materialized view. Even in a scenario where a SELECT * statement might be used in a materialized view; the new columns are NOT propagated because the columns of a materialized view are defined when the materialized view is defined.
>
> Also, the materialized view is NOT suspended, so it can continue to be used.
>
> https://docs.snowflake.com/en/user-guide/views-materialized#adding-columns-to-the-base-table

## 3-2. 解説文の文法解析

### 文1: "When new columns are added to a base table with a materialized view on top, the new columns are NOT propagated automatically to the materialized view."

- **時間節**: When new columns are added to a base table with a materialized view on top
- **修飾語**: with a materialized view on top（付帯状況：上にMVがある状態で）
- **主節主語 (S)**: the new columns
- **主節動詞 (V)**: are NOT propagated（受動態・否定）
- **注目ポイント**: `with a materialized view on top` = 上部にMVが乗った状態で（on topが「上に」）

### 文2: "Even in a scenario where a SELECT * statement might be used in a materialized view; the new columns are NOT propagated because the columns of a materialized view are defined when the materialized view is defined."

- **譲歩節**: Even in a scenario where a SELECT * statement might be used in a materialized view
- **主節**: the new columns are NOT propagated
- **理由節**: because the columns of a materialized view are defined when the materialized view is defined
- **注目ポイント**: 
  - `Even in a scenario where ~` = たとえ〜のシナリオであっても（譲歩の表現）
  - `might be used` = 使われることがあるかもしれない（may の過去形で柔らかい可能性）
  - `are defined when ... is defined` = 定義される時に定義される（定義の同時性）

### 文3: "Also, the materialized view is NOT suspended, so it can continue to be used."

- **接続副詞**: Also（追加情報）
- **主節**: the materialized view is NOT suspended（受動態・否定）
- **結果節**: so it can continue to be used（助動詞 + 不定詞受動態）
- **注目ポイント**: `continue to be used` = 使い続けられる（`continue to + 受動態不定詞`）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| on top | 副詞句 | 上に・加えて | A materialized view sits on top of a base table. |
| scenario | 名詞 | シナリオ、状況 | Even in a scenario where SELECT * is used, columns are fixed. |
| defined | 形容詞/過去分詞 | 定義された | The columns are defined at view creation time. |
| continue to be used | 動詞句 | 使い続けられる | The view continues to be used after column additions. |

## 3-3. 解説文（日本語）

> マテリアライズドビューが上に乗っているベーステーブルに新しい列が追加された場合、新しい列はマテリアライズドビューに自動的には伝播されません。マテリアライズドビューで `SELECT *` 文が使用されているシナリオであっても、マテリアライズドビューの列はMVが定義された時に定義されるため、新しい列は伝播されません。
>
> また、マテリアライズドビューはサスペンドされないため、引き続き使用することができます。

---

## 復習メモ

- [ ] MVの列はMV作成時に固定され、後からベーステーブルに追加した列は伝播されないことを理解した
- [ ] 新列追加後もMVはサスペンドされず使用可能であることを把握した
- [ ] `Even in a scenario where ~`（譲歩）と `continue to be used`（受動態不定詞）を確認した
