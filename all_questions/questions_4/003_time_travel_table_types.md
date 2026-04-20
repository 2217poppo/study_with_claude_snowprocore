# 003: Time Travel — Which Table Types Support It

**SnowPro Core Domain**: Domain 5 — Data Protection and Data Sharing
**作成日**: 2026-04-17
**正答**: Permanent Tables, Transient Tables, Temporary Tables（External TablesとView-based Tablesは不可）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Time Travel（タイムトラベル） | 過去の任意の時点のデータをクエリ・復元できるSnowflakeの機能。`AT(TIMESTAMP => ...)` や `BEFORE(STATEMENT => ...)` で時点を指定する |
| Permanent Table（永続テーブル） | 標準テーブル。**Time Travel: 最大90日（Enterprise以上）/ 最大1日（Standard）**。Fail-Safe: 7日。デフォルトのテーブルタイプ |
| Transient Table（トランジェントテーブル） | セッションをまたいで存在するがFail-Safeを持たないテーブル。**Time Travel: 最大1日**（0日に設定可能）。Fail-Safe: 0日 |
| Temporary Table（テンポラリテーブル） | セッション内のみ存在するテーブル。**Time Travel: 最大1日**。Fail-Safe: 0日。セッション終了で自動削除 |
| External Table（外部テーブル） | クラウドストレージのファイルを参照するテーブル。実データをSnowflakeに持たない。**Time Travel: 不可** |
| View（ビュー） | SELECT文を定義したオブジェクト。データを物理保存しない。**Time Travel: 不可**（ベーステーブルのTime Travelは可能） |

## 1-2. 重要コンセプトまとめ

- **Time Travelをサポートするテーブルタイプ（3種）**:
  - **Permanent**: 最大90日（Enterprise以上）または1日（Standard）
  - **Transient**: 最大1日（0日設定可能）
  - **Temporary**: 最大1日
- **Time Travelをサポートしないオブジェクト**:
  - External Table: データがSnowflake外（クラウドストレージ）にあるため
  - View / View-based Table: データを保存しないため
- **Fail-SafeはPermanentのみ（7日間）**:
  - Transient / Temporary = Fail-Safe 0日
  - Time TravelなしでもFail-Safeはなし
- **試験頻出の対比**:

| テーブルタイプ | Time Travel最大日数 | Fail-Safe |
|---|---|---|
| Permanent | 90日（Enterprise以上）| 7日 |
| Transient | 1日 | 0日（なし） |
| Temporary | 1日 | 0日（なし） |
| External | **なし** | なし |
| View | **なし** | なし |

## 1-3. 公式ドキュメントURL

- [Working with Temporary and Transient Tables](https://docs.snowflake.com/en/user-guide/tables-temp-transient)
- [Understanding & Using Time Travel](https://docs.snowflake.com/en/user-guide/data-time-travel)

---

## 2-1. 問題文（英語）

> Which of the following table types allow Time Travel queries?
>
> A. External Tables
> B. View-based Tables
> C. Permanent Tables ✓
> D. Transient Tables ✓
> E. Temporary Tables ✓

## 2-2. 問題文の文法解析

### 文1: "Which of the following table types allow Time Travel queries?"

- **主語 (S)**: Which of the following table types（以下のテーブルタイプのうちどれが）
- **動詞 (V)**: allow（許可する、可能にする）
- **目的語 (O)**: Time Travel queries（タイムトラベルクエリ）
- **文型**: SVO（疑問詞 which を使った疑問文）
- **注目ポイント**:
  - `allow + 目的語` = 「〜を許可する、〜を可能にする」
  - `Time Travel queries` = タイムトラベルを利用したクエリ（過去時点のデータへのクエリ）
  - 複数正解（Select all that apply）形式

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| allow | 動詞 | 許可する、可能にする | Permanent tables allow up to 90 days of Time Travel. |
| table type | 名詞句 | テーブルタイプ | Snowflake has four table types. |
| View-based | 形容詞 | ビューベースの | View-based tables do not support Time Travel. |

## 2-3. 問題文（日本語）

> 以下のテーブルタイプのうち、Time Travelクエリが可能なものはどれですか？（すべて選択）
>
> A. External Tables（外部テーブル）
> B. View-based Tables（ビューベーステーブル）
> C. Permanent Tables（永続テーブル）✓
> D. Transient Tables（トランジェントテーブル）✓
> E. Temporary Tables（テンポラリテーブル）✓

---

## 3-1. 解説文（英語）

> Transient and temporary tables don't have fail-safe functionality; therefore, data in such tables goes through zero days of fail-safe storage. However, Transient and Temporary tables do have a maximum of 1 day of Time Travel.
>
> Permanent tables also have time travel capability and can go up to 90 days of time travel depending on the configuration.
>
> https://docs.snowflake.com/en/user-guide/tables-temp-transient

## 3-2. 解説文の文法解析

### 文1: "Transient and temporary tables don't have fail-safe functionality; therefore, data in such tables goes through zero days of fail-safe storage."

- **主語 (S)**: Transient and temporary tables
- **動詞 (V)**: don't have（持っていない）
- **目的語 (O)**: fail-safe functionality（フェイルセーフ機能）
- **セミコロン**: 因果関係でつながれた2つの文（; therefore = したがって）
- **第2文の主語**: data in such tables
- **第2文の動詞**: goes through（経る、通過する）
- **第2文の目的語**: zero days of fail-safe storage（0日間のフェイルセーフストレージ）
- **注目ポイント**:
  - `go through zero days` = 「0日間経る」= フェイルセーフが存在しないことの婉曲表現
  - `; therefore` = 「したがって」（セミコロンで前文の結果を導く）

### 文2: "However, Transient and Temporary tables do have a maximum of 1 day of Time Travel."

- **逆接の副詞**: However（しかし）
- **主語 (S)**: Transient and Temporary tables
- **強調の助動詞**: do（実際に〜する）
- **動詞 (V)**: have（持っている）
- **目的語 (O)**: a maximum of 1 day of Time Travel（最大1日のTime Travel）
- **注目ポイント**:
  - `do have` = 「実際に持っている」（do を用いて肯定を強調する。前述の否定文との対比で特に効果的）
  - `a maximum of` = 「最大〜」

### 文3: "Permanent tables also have time travel capability and can go up to 90 days of time travel depending on the configuration."

- **主語 (S)**: Permanent tables
- **動詞1 (V)**: have（持っている）
- **目的語1 (O)**: time travel capability（タイムトラベル機能）
- **動詞2 (V)**: can go（〜まで及ぶことができる）
- **範囲**: up to 90 days（最大90日まで）
- **条件**: depending on the configuration（設定によって）
- **注目ポイント**:
  - `go up to ~` = 「最大〜まで及ぶ」
  - `depending on ~` = 「〜によって異なる」（条件の分岐を示す）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| do have | 動詞句（強調） | 実際に持っている | Transient tables do have 1 day of Time Travel. |
| go through | 動詞句 | 〜を経る、経験する | Data goes through zero days of fail-safe storage. |
| up to | 前置詞句 | 最大〜まで | Permanent tables allow up to 90 days of Time Travel. |
| depending on | 前置詞句 | 〜によって | The retention period varies depending on the configuration. |

## 3-3. 解説文（日本語）

> トランジェントテーブルとテンポラリテーブルはFail-Safe機能を持っていないため、これらのテーブルのデータは0日間のFail-Safeストレージを経ることになります。しかし、トランジェントテーブルとテンポラリテーブルは実際に最大1日のTime Travelを持っています。
>
> 永続テーブルもTime Travel機能を持っており、設定によって最大90日のTime Travelが可能です。

---

## 復習メモ

- [ ] Time Travel対応は Permanent / Transient / Temporary の3種類、External と View は非対応と覚えた
- [ ] TransientとTemporaryはFail-Safeなし（0日）でTime Travelは最大1日のみと理解した
- [ ] `do have`（強調の do）と `up to`（最大〜）の使い方を確認した
