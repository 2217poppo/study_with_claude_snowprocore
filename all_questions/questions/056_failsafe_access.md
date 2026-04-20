# 056: Fail-Safe — Access Restrictions

**SnowPro Core Domain**: Domain 5 — Data Collaboration (Fail-safe)
**作成日**: 2026-04-03
**正答**: False（Fail-SafeはSnowflakeサポートチームのみが使用できる。エンドユーザーはアクセス不可）

> 関連問題: 015（Transient Table Time Travel）・051（Time Travel Editions）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Fail-Safe（フェイルセーフ） | Time Travel終了後にSnowflakeが内部的に保持するデータ保護機能。Permanent Tableのみ7日間保持。**エンドユーザーはアクセス・操作不可**。Snowflakeサポートチームのみが復元作業を実施できる |
| Time Travel Retention Period（Time Travel保持期間） | ユーザーが`AT`/`BEFORE`句で遡れる期間。Standard=最大1日、Enterprise以上=最大90日 |
| Snowflake Support Team（Snowflakeサポートチーム） | Fail-Safe期間中のデータ復元を実施できる唯一の主体。ユーザーからの要求を受けて作業する |
| Historical Data（過去データ） | 過去の時点のデータ。Time Travelはユーザーが自分でアクセスできるが、Fail-Safeはユーザーが直接アクセスできない |
| Accidental Data Loss（誤ったデータ損失） | 意図しないDROPやDELETE等によるデータ消失。Fail-SafeはSnowflakeサポート経由でこれを回復するための最後の手段 |

## 1-2. 重要コンセプトまとめ

- **Fail-SafeはSnowflakeサポートチームのみが使用できる**（エンドユーザーはアクセス不可）:
  - Time TravelはユーザーがSQLで直接過去データにアクセス可能
  - Fail-SafeはユーザーがSQL等で直接アクセスする手段がない

- **Time Travel vs Fail-Safe の比較**（試験最頻出の区別）:

  | 項目 | Time Travel | Fail-Safe |
  |------|-------------|-----------|
  | 目的 | **ユーザー**による過去データの参照・復元 | **Snowflakeサポート**による災害復旧 |
  | アクセス主体 | **エンドユーザー**（SQL） | **Snowflakeサポートチームのみ** |
  | 期間（Permanent Table） | 最大90日（エディション依存） | **7日間**（固定） |
  | 期間（Transient/Temp Table） | 最大1日 | **なし**（0日） |
  | ユーザーによる操作 | 可能（AT/BEFORE句） | **不可** |

- **問題文の引っかけポイント**: 「any Snowflake user」= 誰でも使える → False。Fail-Safeは**Snowflakeサポートのみ**

- **試験頻出パターン**: 「Fail-SafeはTime Travel後のユーザー向けバックアップか？」→ **No**。Snowflake内部の保護機能であり、ユーザーは利用不可

## 1-3. 公式ドキュメントURL

- [Understanding & Using Fail-safe](https://docs.snowflake.com/en/user-guide/data-failsafe)

---

## 2-1. 問題文（英語）

> Failsafe is provided as an alternate means for any Snowflake user to access historical data once the Time Travel retention period has ended.
>
> A. False
> B. True

## 2-2. 問題文の文法解析

### 文1: "Failsafe is provided as an alternate means for any Snowflake user to access historical data once the Time Travel retention period has ended."

- **主語 (S)**: Failsafe（フェイルセーフは）
- **動詞 (V)**: is provided（提供されている）← 受動態
- **修飾語1**: as an alternate means（代替手段として）← as + 名詞で役割を示す
- **修飾語2**: for any Snowflake user to access historical data（すべてのSnowflakeユーザーが過去データにアクセスするための）← `for O to do` 構文
- **時間節**: once the Time Travel retention period has ended（Time Travelの保持期間が終了したら）← `once` + 現在完了
- **注目ポイント**: `alternate means` = 「代替手段」。`for any ~ to do` = 「誰でも〜できるための」。これが False の核心 — Fail-SafeはANYユーザー向けではない

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| alternate means | 名詞句 | 代替手段 | Fail-safe is NOT an alternate means for users. |
| for any ~ to do | 不定詞構文 | 誰でも〜するための | It is not provided for any user to access data. |
| once + 完了形 | 時間節 | 〜が終わったら・〜したとたん | Once the retention period has ended, ... |
| retention period | 名詞句 | 保持期間 | The Time Travel retention period is up to 90 days. |
| historical data | 名詞句 | 過去データ・履歴データ | Time Travel lets users access historical data. |

## 2-3. 問題文（日本語）

> フェイルセーフは、Time Travelの保持期間が終了した後に、すべてのSnowflakeユーザーが過去データにアクセスするための代替手段として提供されている。
>
> A. False
> B. True

---

## 3-1. 解説文（英語）

> After the Time Travel period has been completed, the fail-safe storage feature stores data for an additional period of seven days. The fail-safe storage offers additional security against data loss; however, only the Snowflake support team can restore data from the fail-safe storage. Fail-safe is not used by end users to access historical data but to recover from accidental data loss by Snowflake support.

## 3-2. 解説文の文法解析

### 文1: "After the Time Travel period has been completed, the fail-safe storage feature stores data for an additional period of seven days."

- **時間節**: After the Time Travel period has been completed（Time Travel期間が完了した後）← 現在完了受動態
- **主語 (S)**: the fail-safe storage feature（フェイルセーフストレージ機能は）
- **動詞 (V)**: stores（保存する）
- **目的語 (O)**: data（データを）
- **修飾語 (M)**: for an additional period of seven days（さらに7日間）← `an additional period of ~` = 「さらに〜の期間」
- **注目ポイント**: `an additional period of seven days` = 「追加で7日間」。Time Travel終了後に始まる点が重要

### 文2: "The fail-safe storage offers additional security against data loss; however, only the Snowflake support team can restore data from the fail-safe storage."

- **主語 (S)**: The fail-safe storage
- **動詞 (V)**: offers（提供する）
- **目的語 (O)**: additional security against data loss（データ損失に対する追加のセキュリティを）
- **接続副詞**: however（しかしながら）← セミコロン後で対比・制限を導く
- **帰結**: only the Snowflake support team can restore data（Snowflakeサポートチームのみがデータを復元できる）← `only ~` で唯一性を強調
- **注目ポイント**: `security against ~` = 「〜に対するセキュリティ・保護」。`only ~ can` = 「〜だけが〜できる」

### 文3: "Fail-safe is not used by end users to access historical data but to recover from accidental data loss by Snowflake support."

- **主語 (S)**: Fail-safe
- **動詞 (V)**: is not used（使われない）← 受動態否定
- **構造**: `not A but B` = 「AではなくB」← 目的の対比
  - not: by end users to access historical data（エンドユーザーが過去データにアクセスするために）
  - but: to recover from accidental data loss by Snowflake support（Snowflakeサポートが誤ったデータ損失から回復するために）
- **注目ポイント**: `not A but B` = 「AではなくB」は試験解説文で目的の誤解を正すときに頻出

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| an additional period of ~ | 名詞句 | さらに〜の期間 | Data is stored for an additional period of 7 days. |
| security against ~ | 名詞句 | 〜に対する保護・セキュリティ | Fail-safe offers security against data loss. |
| not A but B | 構文 | AではなくB | Not for users, but for Snowflake support recovery. |
| accidental | 形容詞 | 偶発的な・意図しない | Fail-safe recovers from accidental data loss. |
| recover from ~ | 熟語 | 〜から回復する | Snowflake support can recover from data loss. |

## 3-3. 解説文（日本語）

> Time Travel期間が完了した後、フェイルセーフストレージ機能はさらに7日間データを保存します。フェイルセーフストレージはデータ損失に対する追加の保護を提供しますが、フェイルセーフストレージからデータを復元できるのはSnowflakeサポートチームだけです。フェイルセーフはエンドユーザーが過去データにアクセスするためではなく、Snowflakeサポートが誤ったデータ損失から回復するために使用されます。

---

## 復習メモ

- [ ] Fail-SafeはSnowflakeサポートチームのみが使用できる（ユーザーはアクセス不可）を覚えた
- [ ] Time Travel（ユーザー向け・SQL）とFail-Safe（Snowflakeサポート専用）の違いを説明できる
- [ ] `not A but B`・`security against ~`・`once + 完了形` の英語パターンを確認した
- [ ] この問題は理論問題のためサンドボックス検証は不要
