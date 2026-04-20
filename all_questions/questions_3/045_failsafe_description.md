# 045: Fail-Safe Description

**SnowPro Core Domain**: Domain 5 — Data Collaboration
**作成日**: 2026-04-15
**正答**: A, B, C

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Fail-Safe（フェイルセーフ） | Time Travel期間終了後にSnowflakeが内部的にデータを**7日間**保持する障害回復機能。Permanent Tableのみ。ユーザーはアクセス不可、Snowflakeサポートのみが復元可能 |
| Time Travel | 過去のデータにユーザーがアクセスできる機能。Fail-Safeとは別の保護レイヤー |
| Catastrophic Failure | 壊滅的障害。Fail-Safeはこのような事態からデータを保護するために存在 |

## 1-2. 重要コンセプトまとめ

- Fail-Safeの正しい説明（3つ）:
  1. Time Travelに**追加**の保護（Time Travelと「同じ」ではない）
  2. 壊滅的障害から**履歴データを保護**
  3. Permanent Tableに**最大7日間**の保護を提供
- Fail-Safeの誤り:
  - Fail-Safe = Time Travelと同じ ❌（別の保護レイヤー）
  - Fail-Safe = 90日間 ❌（7日間が正しい。90日はTime Travelの最大値）
- Fail-Safeのデータにアクセスできるのは**Snowflakeサポートのみ**

## 1-3. 公式ドキュメントURL

- [Understanding & Using Fail-safe](https://docs.snowflake.com/en/user-guide/data-failsafe)

---

## 2-1. 問題文（英語）

> Which of the following statements correctly describes fail-safe in Snowflake? Select all that apply.
>
> A. The fail-safe protection is in addition to the protection provided by Time Travel.
> B. Failsafe ensures that historical data is protected in the event of a catastrophic failure.
> C. Failsafe provides up to 7 days of historical data protection for permanent tables.
> D. Failsafe is the same as Time Travel.
> E. Failsafe provides up to 90 days of historical data protection for permanent tables.

## 2-2. 問題文の文法解析

### 文(A): "The fail-safe protection is in addition to the protection provided by Time Travel."

- **注目ポイント**: `in addition to ~` は「～に加えて」。Fail-SafeはTime Travelとは別の追加保護。

### 文(B): "Failsafe ensures that historical data is protected in the event of a catastrophic failure."

- **注目ポイント**: `in the event of ~` は「～が発生した場合に」。壊滅的障害時の保護。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| in addition to ~ | phrase | ～に加えて | In addition to Time Travel protection. |
| in the event of ~ | phrase | ～が発生した場合に | In the event of a catastrophic failure. |
| an extra layer of protection | noun | 追加の保護レイヤー | Provides an extra layer of protection. |
| catastrophic failure | noun | 壊滅的障害 | Protected against catastrophic failure. |

## 2-3. 問題文（日本語）

> Snowflakeのフェイルセーフを正しく説明しているのはどれですか？該当するものをすべて選んでください。

---

## 3-1. 解説文（英語）

> In addition to protection provided by Time Travel, data that has been modified also goes through a failsafe period. Failsafe storage is intended to provide an extra layer of protection against data loss caused by human error. Once the Time Travel period ends, Snowflake keeps the data for a further 7-day period as further protection. When data is in failsafe storage, ordinary users cannot access it; only Snowflake support employees can access and recover it if the customer requests it.

## 3-2. 解説文の文法解析

### 文1: "Failsafe storage is intended to provide an extra layer of protection against data loss caused by human error."

- **主語 (S)**: Failsafe storage
- **動詞 (V)**: is intended to provide
- **目的語 (O)**: an extra layer of protection
- **修飾語 (M)**: against data loss caused by human error
- **文型**: SVO
- **注目ポイント**: `is intended to ~` は「～することを意図している」。`caused by human error` で原因を明示。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| is intended to ~ | phrase | ～することを意図している | Intended to provide extra protection. |
| ordinary users | noun | 一般ユーザー | Ordinary users cannot access it. |
| caused by human error | phrase | 人為的ミスによって引き起こされた | Data loss caused by human error. |

## 3-3. 解説文（日本語）

> Time Travelの保護に加えて、変更されたデータはフェイルセーフ期間も経過します。フェイルセーフストレージは人為的ミスによるデータ損失に対する追加の保護レイヤーを提供することを意図しています。Time Travel期間が終了すると、Snowflakeはさらなる保護としてデータをさらに7日間保持します。データがフェイルセーフストレージにある場合、一般ユーザーはアクセスできず、顧客の要求に応じてSnowflakeサポート社員のみがアクセスして復元できます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
