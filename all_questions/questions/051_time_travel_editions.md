# 051: Time Travel — Supported Editions

**SnowPro Core Domain**: Domain 5 — Data Collaboration (Time Travel)
**作成日**: 2026-04-03
**正答**: A・B・C・D（すべて正解 — 全エディションがTime Travelをサポート）

> 関連問題: 015（Transient Table Time Travel）・041（Snowflake Editions）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Time Travel | 過去の任意の時点のデータを参照・復元できるSnowflakeの機能。`AT`・`BEFORE` 句で時点を指定する。**全エディション**で利用可能 |
| Standard Edition | Snowflakeの最下位エディション。Time Travelは最大1日（24時間）。基本機能はすべて利用可能 |
| Enterprise Edition | Standard の上位エディション。Time Travelが最大**90日**に拡張される。マルチクラスターウェアハウスも利用可能 |
| Business Critical Edition | Enterprise の上位エディション。HIPAA・PCI DSS対応。Time Travelは最大90日（Enterpriseと同じ）。Tri-Secret Secure対応 |
| Virtual Private Snowflake (VPS) | 最上位エディション。専用メタデータストアを持つ唯一のエディション。Time Travelは最大90日（Enterprise以上と同じ） |
| Data Retention Period（データ保持期間） | Time Travelでデータを遡れる最大期間。StandardはデフォルトかつMAXが1日。Enterprise以上はデフォルト1日・MAX90日（設定次第） |

## 1-2. 重要コンセプトまとめ

- **Time Travelはすべてのエディションで利用可能**（試験ポイント）:

  | エディション | Time Travel 最大期間 |
  |-------------|---------------------|
  | Standard | **1日（24時間）** |
  | Enterprise | **90日** |
  | Business Critical | **90日** |
  | Virtual Private Snowflake (VPS) | **90日** |

- **エディション別の違いは「期間」だけ**:
  - Standard: 最大1日のみ
  - Enterprise以上: 最大90日まで設定可能（デフォルトは1日）

- **Transient Table・Temporary Tableとの関係**（015と関連）:
  - Permanent Table: Time Travel 最大90日（エディション依存）
  - Transient Table: Time Travel **最大1日**（エディションに関わらず固定）
  - Temporary Table: Time Travel **最大1日**（エディションに関わらず固定）

- **試験の引っかけパターン**: 「どのエディションでTime Travelが使えるか？」→ **全エディション**。「どのエディションで90日まで使えるか？」→ **Enterprise以上**

## 1-3. 公式ドキュメントURL

- [Understanding & Using Time Travel — Data Retention Period](https://docs.snowflake.com/en/user-guide/data-time-travel#data-retention-period)

---

## 2-1. 問題文（英語）

> Which of the following Snowflake Editions support Time Travel? Select all that apply.
>
> A. Standard
> B. Enterprise
> C. Business Critical
> D. Virtual Private Snowflake

## 2-2. 問題文の文法解析

### 文1: "Which of the following Snowflake Editions support Time Travel?"

- **主語 (S)**: Which of the following Snowflake Editions（以下のSnowflakeエディションのうちどれが）
- **動詞 (V)**: support（サポートしますか）← 複数扱いなので三単現の -s なし
- **目的語 (O)**: Time Travel
- **注目ポイント**: `Which of the following ~` = 「以下の〜のうちどれが」。選択問題の定番フレーズ。主語が複数扱い（`which` は複数の選択肢を指す）なので動詞は `support`（`supports` ではない）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| edition | 名詞 | エディション・版・グレード | Which Snowflake edition are you using? |
| support | 動詞 | サポートする・対応している | All editions support Time Travel. |
| Select all that apply | 定型表現 | 当てはまるものをすべて選択せよ | Select all that apply — there may be multiple correct answers. |

## 2-3. 問題文（日本語）

> 以下のSnowflakeエディションのうち、Time Travelをサポートしているものはどれですか？当てはまるものをすべて選択してください。
>
> A. Standard
> B. Enterprise
> C. Business Critical
> D. Virtual Private Snowflake

---

## 3-1. 解説文（英語）

> Time Travel is supported in all Snowflake editions.

## 3-2. 解説文の文法解析

### 文1: "Time Travel is supported in all Snowflake editions."

- **主語 (S)**: Time Travel
- **動詞 (V)**: is supported（サポートされている）← 受動態（現在形）
- **修飾語 (M)**: in all Snowflake editions（すべてのSnowflakeエディションで）
- **注目ポイント**: `be supported in ~` = 「〜でサポートされている」。`in all ~` = 「すべての〜において」。`all` は例外なしを強調する重要な限定詞

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| be supported in ~ | 受動態熟語 | 〜でサポートされている・〜に対応している | This feature is supported in all editions. |
| in all ~ | 前置詞句 | すべての〜において・〜全体で | Time Travel is available in all editions. |

## 3-3. 解説文（日本語）

> Time TravelはすべてのSnowflakeエディションでサポートされています。

---

## 復習メモ

- [ ] Time Travelは全エディション対応であることを覚えた
- [ ] エディション別のTime Travel最大期間（Standard=1日、Enterprise以上=90日）を整理した
- [ ] Transient/Temporary Tableのエディション非依存の1日制限との違いを理解した
- [ ] 英語の文法ポイント（be supported in / in all ~）を確認した
- [ ] この問題は理論問題のためサンドボックス検証は不要
