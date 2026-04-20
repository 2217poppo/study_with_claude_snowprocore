# 108: Transient Table — No Fail-Safe, No Recovery After Time Travel

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-06
**正答**: True
**ユーザー回答**: False（不正解）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Transient Table（トランジェントテーブル） | セッションをまたいで存在するテーブル。**Fail-Safeなし（0日）**・**Time Travel最大1日**に制限される。ストレージコスト削減目的で使用。Time Travel期間終了後は**Snowflakeサポートでも復元不可** |
| Temporary Table（テンポラリテーブル） | セッション内のみ存在するテーブル。TransientテーブルとFail-Safe・Time Travelの制限は同じ（Fail-Safe 0日、Time Travel最大1日）。セッション終了時に自動削除される |
| Fail-Safe（フェイルセーフ） | Time Travel終了後にSnowflakeが内部管理する障害回復機能。**Permanent Tableのみ7日間**適用される。TransientおよびTemporary Tableには**適用されない（0日）** |
| Retention Period（保持期間） | Time Travelがデータを保持する期間。Permanent Tableは0〜90日（エディション依存）、Transient/Temporary Tableは最大1日 |
| Historical Data（過去データ） | Time Travelを通じてアクセスできる特定時点のデータ。TransientテーブルのTime Travel期間終了後はFail-Safeもないため、**完全に失われ復元不可** |

## 1-2. 重要コンセプトまとめ

- **True = Time Travel期間終了後はSnowflakeサポートでも復元不可**
- **TransientおよびTemporary Tableのデータ保護比較**:

| テーブル種別 | Time Travel | Fail-Safe | Time Travel後の復元 |
|------------|------------|----------|---------------------|
| Permanent | 最大90日 | **7日間** | Snowflakeサポートが復元可 |
| Transient | **最大1日** | **0日** | **復元不可** |
| Temporary | **最大1日** | **0日** | **復元不可** |

- **復元不可の理由**: Transient/TempテーブルにはFail-Safeがない（0日）。Time Travel期間（最大1日）が終了すると、データはどこにも残らない
- **Snowflakeサポートの役割**: Permanent TableのFail-Safe期間中はサポートがデータを復元できるが、TransientテーブルにはFail-Safeがないため**サポートでも復元不可**
- **よくある誤解**: 「Snowflakeサポートが何とかしてくれる」と思いがちだが、Transient/TempテーブルはFail-Safe自体が存在しないため物理的にデータが残っていない

## 1-3. 公式ドキュメントURL

- [Temporary and Transient Tables](https://docs.snowflake.com/en/user-guide/tables-temp-transient)

---

## 2-1. 問題文（英語）

> True or False: Once the Time Travel retention period has ended for a transient table, historical data for that table can not be recovered by Snowflake support.
>
> A. True
> B. False

## 2-2. 問題文の文法解析

### 文1: "Once the Time Travel retention period has ended for a transient table, historical data for that table can not be recovered by Snowflake support."

- **主節の主語 (S)**: historical data for that table
- **主節の動詞 (V)**: can not be recovered（否定の受動態）
- **行為者 (A)**: by Snowflake support
- **時間節**: Once the Time Travel retention period has ended for a transient table
- **文型**: SV（受動態）
- **注目ポイント**:
  - **"Once the ~ period has ended"**: 「〜期間が終了したとたんに」。`Once`（一度〜すると）+ 現在完了 `has ended`（終了した状態）で期間終了を起点とした恒久的な状態を示す。`Once created` とは異なり能動態現在完了の時間節
  - **"historical data for that table"**: 「そのテーブルの過去データ」。`historical data`（過去データ・履歴データ）は Time Travelで参照できるデータ。`for that table`（そのテーブルの）で特定テーブルに限定
  - **"can not be recovered by Snowflake support"**: 「Snowflakeサポートによっても回復できない」。受動態否定 `can not be recovered` + 行為者 `by Snowflake support`。`Snowflake support` が主語に来ないことで「たとえサポートでも無理」を示す

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| retention period | 名詞句 | 保持期間 | The Time Travel retention period for transient tables is maximum 1 day. |
| historical data | 名詞句 | 過去データ・履歴データ | Historical data cannot be recovered after the retention period ends. |
| recovered | 過去分詞 | 回復された・復元された | Data can not be recovered by Snowflake support for transient tables. |

## 2-3. 問題文（日本語）

> 正誤問題：トランジェントテーブルのTime Travel保持期間が終了すると、そのテーブルの過去データはSnowflakeサポートでも回復できない。
>
> A. True（正しい）
> B. False（誤り）

---

## 3-1. 解説文（英語）

> Transient and temporary tables don't have fail-safe functionality; therefore, data in such tables goes through zero days of fail-safe storage. Also, Transient and Temporary tables have a maximum of 1 day of Time Travel. Therefore, once the Time Travel period for these tables is complete, there is no way to recover historical data.

## 3-2. 解説文の文法解析

### 文1: "Transient and temporary tables don't have fail-safe functionality; therefore, data in such tables goes through zero days of fail-safe storage."

- **前半の主語 (S)**: Transient and temporary tables
- **前半の動詞 (V)**: don't have
- **前半の目的語 (O)**: fail-safe functionality
- **後半の主語 (S)**: data in such tables
- **後半の動詞 (V)**: goes through
- **後半の目的語 (O)**: zero days of fail-safe storage
- **文型**: SVO ; SVO（; therefore, で因果）
- **注目ポイント**:
  - **"; therefore,"**: 「したがって」。セミコロンで前節の事実（Fail-Safeなし）と論理的帰結（0日のFail-Safe）を接続
  - **"goes through zero days of fail-safe storage"**: 「Fail-Safeストレージの0日間を経る」。`go through ~`（〜を経る・通過する）で「Fail-Safe期間を経験する」を示す。`zero days`（ゼロ日間）で「実質的にFail-Safeが存在しない」を表す

### 文2: "Also, Transient and Temporary tables have a maximum of 1 day of Time Travel."

- **主語 (S)**: Transient and Temporary tables
- **動詞 (V)**: have
- **目的語 (O)**: a maximum of 1 day of Time Travel
- **文型**: SVO
- **注目ポイント**:
  - **"Also, ~"**: 「また・加えて」。前文に関連する追加情報を続ける。`Furthermore` / `Additionally` より口語的でシンプル
  - **"a maximum of 1 day"**: 「最大1日」。`a maximum of N`（最大N）で上限を示す。Permanent Table（最大90日）との対比でTransientの制限を強調

### 文3: "Therefore, once the Time Travel period for these tables is complete, there is no way to recover historical data."

- **主節**: there is no way to recover historical data
- **時間節**: once the Time Travel period for these tables is complete
- **文型**: there is 構文
- **注目ポイント**:
  - **"once ~ is complete"**: 「〜が完了すると」。`complete`（完了している）は形容詞として述語に使われる。問題文の `has ended`（現在完了）と同義だが、形容詞 `complete` を使う点が異なる
  - **"there is no way to recover ~"**: 「〜を回復する方法がない・どうやっても〜できない」。`there is no way to do`（〜する方法がない）は「不可能・手段なし」を示す強調表現。`cannot be recovered` より「手段そのものが存在しない」のニュアンスが強い

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| fail-safe functionality | 名詞句 | Fail-Safe機能 | Transient tables don't have fail-safe functionality. |
| goes through ~ | 句動詞 | 〜を経る・〜の過程を経る | Data goes through zero days of fail-safe storage. |
| there is no way to do | 構文 | 〜する方法がない・どうやっても〜できない | There is no way to recover historical data after the period ends. |
| complete | 形容詞 | 完了した・終了した | Once the Time Travel period is complete, data is lost. |

## 3-3. 解説文（日本語）

> トランジェントテーブルとテンポラリテーブルにはFail-Safe機能がありません。したがって、そのようなテーブルのデータはFail-Safeストレージの0日間を経ることになります。また、トランジェントテーブルとテンポラリテーブルのTime Travelは最大1日です。したがって、これらのテーブルのTime Travel期間が終了すると、過去データを回復する方法はありません。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
