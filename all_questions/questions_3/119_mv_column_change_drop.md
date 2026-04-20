# 119: Materialized View — Column Changed or Dropped Behavior

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-17
**正答**: A, C（MVはサスペンドされる / MVを再作成する必要がある）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Materialized View (MV) | SELECT結果を事前計算して物理的に保存するビュー。ベーステーブルへの変更を検知して自動的に更新される |
| Base Table Column Change（ベーステーブルの列変更） | ALTER TABLE ... ALTER COLUMN（型変更・名前変更）などによる列の変更 |
| Base Table Column Drop（ベーステーブルの列削除） | ALTER TABLE ... DROP COLUMN によるベーステーブルからの列の削除 |
| Suspended MV（サスペンドされたMV） | MVが停止状態になること。クエリに使用できなくなる。サスペンドされたMVはResume（再開）または再作成が必要 |
| MV Re-creation（MVの再作成） | `CREATE OR REPLACE MATERIALIZED VIEW` などでMVを最初から作り直すこと。列の変更・削除後には必須 |

## 1-2. 重要コンセプトまとめ

- **列の変更・削除とMVの動作（前問Q109との違いが重要！）**

  | 操作 | MVはサスペンドされるか | 再作成が必要か | Resumeできるか |
  |------|---------------------|--------------|--------------|
  | ベーステーブルに**新列追加** | ❌ サスペンドされない | ❌ 不要 | — |
  | ベーステーブルの**列変更・削除** | ✅ サスペンドされる | ✅ 必要 | ❌ できない |

- **列変更・削除時のMV動作まとめ**
  - 変更はMVに自動伝播されない
  - MVは**サスペンドされる**（新列追加の場合と逆）
  - サスペンドされたMVは**Resumeできない**
  - **再作成（Re-create）するしか使い続ける方法はない**
- **「Resumeすれば使える」は誤り**
  - 列変更・削除後のMVはResume不可
  - 必ず `CREATE OR REPLACE MATERIALIZED VIEW` などで再定義が必要
- **Q109との比較（混同注意）**
  - Q109: 新列追加 → MVサスペンドされない → 引き続き使用可能
  - Q119: 列変更・削除 → MVサスペンドされる → Resume不可・再作成必須

## 1-3. 公式ドキュメントURL

- [Changing or Dropping Columns in the Base Table](https://docs.snowflake.com/en/user-guide/views-materialized#changing-or-dropping-columns-in-the-base-table)
- [Materialized Views Overview](https://docs.snowflake.com/en/user-guide/views-materialized)

---

## 2-1. 問題文（英語）

> Which of the following correctly describes the behavior of a materialized view when columns are changed or dropped from the base table? Select two answers.
>
> A. The materialized view is suspended.
> B. You must resume the materialized view if you want to use it again.
> C. You must re-create the materialized view if you want to use it again.
> D. The materialized view is NOT suspended.
> E. The changed and dropped columns are automatically propagated to the materialized view.

## 2-2. 問題文の文法解析

### 文1: "Which of the following correctly describes the behavior of a materialized view when columns are changed or dropped from the base table?"

- **主語 (S)**: Which of the following
- **動詞 (V)**: correctly describes
- **目的語 (O)**: the behavior of a materialized view
- **時間節**: when columns are changed or dropped from the base table（受動態・並列）
- **文型**: SVO（疑問文）
- **注目ポイント**: 
  - `changed or dropped` = 変更または削除（受動態で2つの操作を並列。Q109の「added」と対比）
  - Q109では `added`（追加）、今回は `changed or dropped`（変更・削除）→ 動作が異なる

### 選択肢B vs C の対比:

- B: "You must **resume** the materialized view if you want to use it again."（再開=Resume）
- C: "You must **re-create** the materialized view if you want to use it again."（再作成）
- **注目ポイント**: 
  - `resume` = 一時停止から再開する（サスペンドを解除する）
  - `re-create` = 最初から作り直す（`re-` 接頭辞で「再び」）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| drop (column) | 動詞 | （列を）削除する | Dropping a column suspends the materialized view. |
| suspend | 動詞 | 停止する、サスペンドする | The materialized view is suspended when columns are dropped. |
| resume | 動詞 | 再開する | You cannot resume a suspended MV after column changes. |
| re-create | 動詞 | 再作成する（`re-` 接頭辞） | You must re-create the MV with the corrected definition. |
| propagate | 動詞 | 伝播する | Changes are not propagated to the materialized view. |

## 2-3. 問題文（日本語）

> ベーステーブルの列が変更または削除された場合のマテリアライズドビューの動作を正しく説明しているものはどれですか？2つ選んでください。
>
> A. マテリアライズドビューはサスペンドされる。
> B. 再び使用するには、マテリアライズドビューを再開（Resume）する必要がある。
> C. 再び使用するには、マテリアライズドビューを再作成する必要がある。
> D. マテリアライズドビューはサスペンドされない。
> E. 変更・削除された列はマテリアライズドビューに自動的に伝播される。

---

## 3-1. 解説文（英語）

> When columns are changed or dropped from a base table with a materialized view on top, the change is not propagated to the materialized view. The materialized view is suspended and can NOT be resumed. It must be re-created with the corrected definition that reflects the changed/dropped columns.
>
> https://docs.snowflake.com/en/user-guide/views-materialized#changing-or-dropping-columns-in-the-base-table

## 3-2. 解説文の文法解析

### 文1: "When columns are changed or dropped from a base table with a materialized view on top, the change is not propagated to the materialized view."

- **時間節**: When columns are changed or dropped from a base table with a materialized view on top
- **修飾語**: with a materialized view on top（付帯状況：上にMVがある状態）
- **主節主語 (S)**: the change
- **主節動詞 (V)**: is not propagated（受動態・否定）
- **文型**: SV（受動態）
- **注目ポイント**: Q109の文1と構造が同じだが、今回は「the change（変更）」が伝播されない点に注目

### 文2: "The materialized view is suspended and can NOT be resumed."

- **主語 (S)**: The materialized view
- **動詞1 (V1)**: is suspended（受動態）
- **動詞2 (V2)**: can NOT be resumed（受動態・否定の助動詞）
- **文型**: SV（受動態並列）
- **注目ポイント**: 
  - `is suspended`（サスペンドされる）と `can NOT be resumed`（再開できない）が並列
  - Q109との対比: Q109では `is NOT suspended, so it can continue to be used`

### 文3: "It must be re-created with the corrected definition that reflects the changed/dropped columns."

- **主語 (S)**: It（The materialized view）
- **動詞 (V)**: must be re-created（受動態 + must）
- **手段の修飾語**: with the corrected definition
- **関係詞節**: that reflects the changed/dropped columns
- **文型**: SV（受動態）
- **注目ポイント**: 
  - `must be re-created` = 再作成されなければならない（強い義務）
  - `the corrected definition` = 修正された定義（列変更後に合わせた正しい定義）
  - `that reflects ~` = 〜を反映する（関係詞節で再作成の内容を限定）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| corrected definition | 名詞句 | 修正された定義 | Re-create the view with the corrected definition. |
| reflect | 動詞 | 反映する | The new definition reflects the changed columns. |
| can NOT be resumed | 動詞句 | 再開できない（強い否定） | A suspended MV can NOT be resumed after column drops. |
| must be re-created | 動詞句 | 再作成しなければならない | The MV must be re-created from scratch. |

## 3-3. 解説文（日本語）

> マテリアライズドビューが上に乗っているベーステーブルの列が変更または削除された場合、変更はマテリアライズドビューに伝播されません。マテリアライズドビューはサスペンドされ、再開することができません。変更・削除された列を反映した正しい定義で再作成する必要があります。

---

## 復習メモ

- [ ] 列の「変更・削除」でMVがサスペンドされ、Resume不可（再作成必須）を覚えた
- [ ] Q109（列の「追加」ではサスペンドされない）との違いを整理した
- [ ] `can NOT be resumed`（再開できない強い否定）と `must be re-created`（再作成必須）を確認した
