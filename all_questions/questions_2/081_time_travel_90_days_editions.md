# 081: Time Travel 90 Days Editions

**SnowPro Core Domain**: Domain 5 — Data Collaboration
**作成日**: 2026-04-13
**正答**: B, C, D

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Time Travel | 過去のデータ状態にアクセスできる機能。DATA_RETENTION_TIME_IN_DAYSパラメータで設定 |
| DATA_RETENTION_TIME_IN_DAYS | Time Travelの保持期間を設定するパラメータ。Standard: 最大1日、Enterprise以上: 最大90日 |

## 1-2. 重要コンセプトまとめ

- Time Travel **最大90日** をサポートするエディション:
  - **Enterprise** ✅
  - **Business Critical** ✅
  - **Virtual Private Snowflake (VPS)** ✅
- Standard Editionは **最大1日のみ** ❌
- Enterprise以上 = 「Enterprise **and above**」のパターン
- Time Travel日数の設定:
  - デフォルト: 1日（すべてのエディション）
  - 最大: Standard=1日、Enterprise以上=90日
  - Transient/Temporary テーブル: 最大1日（エディション問わず）

## 1-3. 公式ドキュメントURL

- [Data Retention Period](https://docs.snowflake.com/en/user-guide/data-time-travel#data-retention-period)

---

## 2-1. 問題文（英語）

> Which Snowflake Editions support up to 90 days of Time Travel? Select all that apply.
>
> A. Standard
> B. Virtual Private Snowflake
> C. Business Critical
> D. Enterprise

## 2-2. 問題文の文法解析

### 文1: "Which Snowflake Editions support up to 90 days of Time Travel?"

- **主語 (S)**: Which Snowflake Editions
- **動詞 (V)**: support
- **目的語 (O)**: up to 90 days of Time Travel
- **文型**: SVO
- **注目ポイント**: `up to 90 days` は「最大90日」。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| up to ~ days | phrase | 最大～日 | Support up to 90 days of Time Travel. |
| and above | phrase | 以上 | Enterprise edition and above. |

## 2-3. 問題文（日本語）

> 最大90日のTime Travelをサポートするエディションはどれですか？該当するものをすべて選んでください。
>
> A. Standard
> B. Virtual Private Snowflake
> C. Business Critical
> D. Enterprise

---

## 3-1. 解説文（英語）

> The enterprise edition and above support Time Travel for up to 90 days.

## 3-2. 解説文の文法解析

### 文1: "The enterprise edition and above support Time Travel for up to 90 days."

- **主語 (S)**: The enterprise edition and above
- **動詞 (V)**: support
- **目的語 (O)**: Time Travel
- **修飾語 (M)**: for up to 90 days（期間）
- **文型**: SVO
- **注目ポイント**: `and above` で「Enterprise以上のすべてのエディション」を一括指定。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| and above | phrase | 以上 | Enterprise and above support 90 days. |

## 3-3. 解説文（日本語）

> Enterprise Edition以上がTime Travelを最大90日間サポートします。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
