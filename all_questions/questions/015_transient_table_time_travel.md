# 015: Transient Table — Time Travel & Fail-Safe

**SnowPro Core Domain**: Domain 5 — Data Collaboration
**作成日**: 2026-04-02
**正答**: C と D（2つ）
- A. The maximum allowed Time Travel duration for a transient table is 7 days.（**選択したが不正解** — 正しくは1日）
- B. A transient table has 7 days of fail-safe storage.（誤り・未選択）
- C. There is no fail-safe storage for a transient table.（選択済み・正解）
- D. The maximum allowed Time Travel duration for a transient table is 1 day.（**正しい選択・未選択**）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Permanent Table（永続テーブル） | Snowflakeの標準テーブル。Time Travel最大90日・Fail-safe 7日の両方が利用可能。 |
| Transient Table（一時的テーブル） | セッションをまたいで存在するが、Fail-safeなし・Time Travel最大1日に制限されたテーブル。ストレージコスト削減に使う。 |
| Temporary Table（テンポラリテーブル） | セッション内のみ存在するテーブル。セッション終了で自動削除。Transient同様、Fail-safeなし・Time Travel最大1日。 |
| Time Travel（タイムトラベル） | 過去の特定時点のデータを参照・復元できる機能。`AT` または `BEFORE` 句で時点を指定。テーブル種別により最大日数が異なる。 |
| Fail-Safe（フェイルセーフ） | Time Travel期間終了後にSnowflakeが内部的にデータを保持する障害回復機能。Snowflake側のみがアクセス可能（ユーザーは操作できない）。Permanent Tableのみ7日間。 |
| DATA_RETENTION_TIME_IN_DAYS | Time Travelの保持期間を設定するパラメータ。Permanent Tableはデフォルト1日（最大90日）。Transient/Temporary Tableは0〜1日のみ設定可。 |

## 1-2. 重要コンセプトまとめ

- **テーブル種別とTime Travel / Fail-Safeの比較**（試験最重要テーブル）:
  | テーブル種別 | Time Travel最大 | Fail-Safe |
  |------------|---------------|-----------|
  | **Permanent** | **90日** | **7日** |
  | **Transient** | **1日** | **なし（0日）** |
  | **Temporary** | **1日** | **なし（0日）** |

- **今回のミス**: Time Travelを「7日」と誤答（Fail-Safeの日数と混同）
  - **Permanent Table の Fail-Safe = 7日**
  - **Transient Table の Time Travel = 最大1日**（7日ではない）

- **なぜTransientにFail-Safeがないか**: Fail-Safeはストレージコストがかかるため、コスト削減目的のTransient/Temporaryテーブルには存在しない

- **試験ポイント**:
  - 「7日」→ Permanent Table の **Fail-Safe** 期間
  - 「90日」→ Permanent Table の **Time Travel** 最大期間
  - Transient/Temporary → Time Travel **最大1日**・Fail-Safe **なし**

## 1-3. 公式ドキュメントURL

- [Temporary and Transient Tables](https://docs.snowflake.com/en/user-guide/tables-temp-transient)

---

## 2-1. 問題文（英語）

> Which of the following statements are correct regarding Time Travel & fail-safe storage? Select all that apply.
>
> A. The maximum allowed Time Travel duration for a transient table is 7 days.
> B. A transient table has 7 days of fail-safe storage.
> C. There is no fail-safe storage for a transient table.
> D. The maximum allowed Time Travel duration for a transient table is 1 day.

## 2-2. 問題文の文法解析

### 文1: "Which of the following statements are correct regarding Time Travel & fail-safe storage?"

- **主語 (S)**: Which of the following statements（複数扱い → are）
- **動詞 (V)**: are
- **補語 (C)**: correct
- **修飾語 (M)**: regarding Time Travel & fail-safe storage
- **文型**: SVC + M
- **注目ポイント**: 「statements are correct」は複数主語なので are。「which statement is correct」（単数）との使い分けに注意

### 選択肢の文法注目点

- **A・D**: 「The maximum allowed ~ duration is N days」— 最大許容期間を表す定型表現。maximum allowed は「許可された最大の」
- **B**: 「has N days of fail-safe storage」— has + 期間 + of + 機能名。「～日間の機能を持つ」
- **C**: 「There is no ~ for ~」— 存在の否定。「～には～が存在しない」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| maximum allowed | adjective | 許可された最大の | The maximum allowed duration is 1 day. |
| duration | noun | 期間、持続時間 | The Time Travel duration can be set per table. |
| fail-safe storage | noun phrase | フェイルセーフストレージ（障害回復用保存領域） | Transient tables have no fail-safe storage. |
| transient | adjective | 一時的な、短命の | A transient table exists across sessions but has limits. |

## 2-3. 問題文（日本語）

> Time TravelとFail-Safeストレージに関して正しい記述はどれですか？該当するものをすべて選びなさい。
>
> A. トランジェントテーブルで許可されているTime Travelの最大期間は7日である。
> B. トランジェントテーブルには7日間のFail-Safeストレージがある。
> C. トランジェントテーブルにはFail-Safeストレージがない。
> D. トランジェントテーブルで許可されているTime Travelの最大期間は1日である。

---

## 3-1. 解説文（英語）

> Transient and temporary tables don't have fail-safe functionality; therefore, data in such tables goes through zero days of fail-safe storage. Also, Transient and Temporary tables have a maximum of 1 day of Time Travel.

## 3-2. 解説文の文法解析

### 文1: "Transient and temporary tables don't have fail-safe functionality; therefore, data in such tables goes through zero days of fail-safe storage."

- **主語1 (S1)**: Transient and temporary tables
- **動詞1 (V1)**: don't have
- **目的語1 (O1)**: fail-safe functionality
- **接続副詞**: therefore（「そのため」。因果関係）
- **主語2 (S2)**: data in such tables
- **動詞2 (V2)**: goes through
- **目的語2 (O2)**: zero days of fail-safe storage
- **文型**: SVO; therefore, SVO
- **注目ポイント**:
  - 「therefore」はセミコロン後に置かれ、論理的な帰結を示す
  - 「goes through zero days」は「0日間を経る」= Fail-Safeが存在しないことを「0日間」という表現で示す

### 文2: "Also, Transient and Temporary tables have a maximum of 1 day of Time Travel."

- **接続副詞**: Also（「また、さらに」）
- **主語 (S)**: Transient and Temporary tables
- **動詞 (V)**: have
- **目的語 (O)**: a maximum of 1 day of Time Travel
- **文型**: SVO
- **注目ポイント**: 「a maximum of N day(s)」は「最大N日間」。上限を示す定型表現

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| therefore | adverb | そのため、したがって（因果の帰結） | Tables lack fail-safe; therefore, data has zero days. |
| go through | phrasal verb | ～を経る、～を通過する | Data goes through zero days of fail-safe. |
| a maximum of N days | 名詞句 | 最大N日間 | Transient tables have a maximum of 1 day of Time Travel. |
| functionality | noun | 機能（性）、機能セット | Transient tables don't have fail-safe functionality. |

## 3-3. 解説文（日本語）

> トランジェントテーブルとテンポラリテーブルはFail-Safe機能を持ちません。そのため、これらのテーブルのデータはFail-Safeストレージを0日間経ることになります。また、トランジェントテーブルとテンポラリテーブルのTime Travelの最大期間は1日です。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
