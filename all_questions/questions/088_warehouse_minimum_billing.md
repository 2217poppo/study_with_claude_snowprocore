# 088: Virtual Warehouse — 60-Second Minimum Billing

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-06
**正答**: D（60 seconds）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Per-Second Billing（秒単位課金） | Snowflakeのクレジット消費単位。ウェアハウスが起動している秒数に応じて課金される。ただし**最低60秒の課金**が適用される |
| 60-Second Minimum（最低60秒） | Snowflakeウェアハウスの課金最低単位。ウェアハウスを起動してから1分以内にシャットダウンしても、最低60秒分のクレジットが消費される |
| Snowflake Credits（スノーフレーク・クレジット） | Snowflakeの課金単位。ウェアハウスのサイズと稼働時間に応じて消費される。ストレージは別途データ量で課金 |
| Virtual Warehouse（仮想ウェアハウス） | Snowflakeのコンピュートリソース。クエリ実行・DML操作に使用。起動中のみクレジットを消費し、サスペンド中は課金されない |

## 1-2. 重要コンセプトまとめ

- **正解は60秒**: 45秒しか使っていなくても最低60秒分の課金が発生
- **課金ルール**:
  - **秒単位課金**: 1分以上使った場合は秒単位で正確に課金
  - **最低60秒**: 1分未満で停止した場合でも60秒分が課金される
- **ディストラクター分析**:
  - 45秒 → 実際の使用時間だが最低課金を下回る → 誤り
  - 315秒 → 60 + 255（根拠不明）→ 誤り
  - 3600秒（1時間）→ 最低課金の誤解（「1時間単位で課金」はSnowflakeではなくRedshiftの課金方式）→ 誤り
- **なぜ最低60秒？**: ウェアハウスの起動には一定のリソースが必要。非常に短時間の使用でも最低限のコスト保証がある
- **コスト管理のヒント**: 60秒未満の使用でも60秒分課金されるため、短時間のクエリを頻繁に実行する場合はウェアハウスをサスペンドせず再利用する方が効率的

## 1-3. 公式ドキュメントURL

- [Virtual Warehouse Credit Usage](https://docs.snowflake.com/en/user-guide/warehouses-overview#warehouse-credit-usage)

---

## 2-1. 問題文（英語）

> A virtual warehouse was started, used for 45 seconds, and shut down after that. The customer will be charged for how many seconds?
>
> A. 315 seconds
> B. 3600 seconds
> C. 45 seconds
> D. 60 seconds

## 2-2. 問題文の文法解析

### 文1: "A virtual warehouse was started, used for 45 seconds, and shut down after that."

- **主語 (S)**: A virtual warehouse
- **動詞 (V)**: was started, (was) used, (was) shut down（受動態の並列）
- **修飾語 (M1)**: for 45 seconds（期間）
- **修飾語 (M2)**: after that（時間の順序）
- **文型**: SV（受動態）× 3並列
- **注目ポイント**:
  - **受動態3つの並列**: `was started`, `(was) used`, `(was) shut down` の3つの受動態動詞を `, and` でつなぐ。2番目・3番目の `was` は省略される。「起動され、使用され、シャットダウンされた」という3段階の操作
  - **"shut down"**: 句動詞「シャットダウンする・停止する」。コンピュータ・ウェアハウスの停止を示す定番表現。過去分詞では `shut down`（変化なし）
  - **"after that"**: 「その後」。前述の時系列（45秒使用）の後にシャットダウンされたことを示す

### 文2: "The customer will be charged for how many seconds?"

- **主語 (S)**: The customer
- **動詞 (V)**: will be charged（受動態、未来形）
- **修飾語 (M)**: for how many seconds（疑問詞句）
- **文型**: SV（受動態）
- **注目ポイント**:
  - **"will be charged"**: 「課金される」。受動態の未来形。`charge A for B`（AにBの料金を課す）の受動態
  - **"for how many seconds"**: 疑問詞 `how many` + 名詞 `seconds` の疑問句が文末に来る形。直接疑問文と間接疑問文の中間的な表現

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| shut down | 句動詞 | シャットダウンする、停止する | The warehouse was shut down after the query finished. |
| charged | 過去分詞 | 課金される | Customers are charged based on credit usage. |
| charge for ~ | 動詞句 | 〜に対して課金する | Snowflake charges for compute on a per-second basis. |

## 2-3. 問題文（日本語）

> 仮想ウェアハウスが起動され、45秒間使用されてからシャットダウンされました。顧客は何秒分を課金されますか？
>
> A. 315秒
> B. 3600秒
> C. 45秒
> D. 60秒

---

## 3-1. 解説文（英語）

> Snowflake credits are billed on a per-second usage basis. However, note that a minimum of 60 seconds of billing applies, so if a virtual warehouse were started and shut down within the first 1st minute, a minimum of 60-second credit usage would apply.

## 3-2. 解説文の文法解析

### 文1: "Snowflake credits are billed on a per-second usage basis."

- **主語 (S)**: Snowflake credits
- **動詞 (V)**: are billed（受動態）
- **修飾語 (M)**: on a per-second usage basis（方法・基準を示す前置詞句）
- **文型**: SV（受動態）
- **注目ポイント**:
  - **"on a ~ basis"**: 「〜の基準で・〜単位で」。課金・評価の基準を示す定型前置詞句。`on a per-second basis`（秒単位で）/ `on a monthly basis`（月単位で）などのバリエーションがある
  - **"per-second"**: 「1秒ごとの・秒単位の」。`per` は単位を示すラテン語由来の前置詞。ハイフンで形容詞として名詞を修飾

### 文2: "However, note that a minimum of 60 seconds of billing applies, so if a virtual warehouse were started and shut down within the first 1st minute, a minimum of 60-second credit usage would apply."

- **主節の構造**: note that [a minimum of 60 seconds of billing applies]（命令文 + that節）
- **条件節 (S)**: if a virtual warehouse were started and shut down within the first 1st minute
- **帰結節 (S)**: a minimum of 60-second credit usage would apply
- **注目ポイント**:
  - **"note that ~"**: 「〜に注意せよ」。重要情報を強調する命令形。`Do note that ~`（Q086で登場）より少し柔らかい表現
  - **"a minimum of N applies"**: 「最低N〔単位〕が適用される」。`apply` の自動詞用法（「適用される・当てはまる」）。目的語を持たない点に注意。`a minimum of 60 seconds` が主語
  - **"if ~ were started and shut down"**: 仮定法過去。`were` は「もし〜されたとしたら」の仮定を示す。実際に起きたこと（45秒で停止）を仮定法で一般化して説明している
  - **"within the first 1st minute"**: 「最初の1分以内に」。`within ~`（〜の範囲内で）。"first 1st" は試験問題特有の冗長な表現（本来は "within the first minute" or "within 60 seconds" で十分）
  - **"would apply"**: 仮定法過去の帰結。「〜が適用されるだろう」。`apply` の再使用で「最低課金が適用される」を締める

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| billed | 過去分詞 | 請求される、課金される | Credits are billed on a per-second basis. |
| per-second | 形容詞 | 秒単位の | Snowflake uses per-second billing for warehouses. |
| applies | 動詞（自動詞） | 適用される、当てはまる | A minimum of 60 seconds of billing applies. |
| within | 前置詞 | 〜以内に、〜の範囲内で | If shut down within the first minute, 60 seconds is charged. |

## 3-3. 解説文（日本語）

> Snowflakeのクレジットは秒単位の使用量に基づいて請求されます。ただし、最低60秒の課金が適用されることに注意してください。仮想ウェアハウスが最初の1分以内に起動・シャットダウンされた場合、最低60秒分のクレジット使用量が適用されます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
