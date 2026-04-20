# 013: Warehouse Minimum Billing Time

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-09
**正答**: 60 seconds

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Virtual Warehouse（仮想ウェアハウス） | Snowflakeのコンピュートリソース。クエリ実行やデータロードに使用される。起動中はクレジットを消費し、サスペンド中は消費しない |
| Snowflake Credits（クレジット） | Snowflakeのコンピュートリソース消費の課金単位。ウェアハウスのサイズ（X-Small〜6X-Large）と稼働時間に応じて消費される |
| Per-Second Billing（秒単位課金） | Snowflakeのウェアハウス課金方式。起動から停止までの秒数に応じてクレジットを消費する。ただし**最低60秒の課金**が適用される |
| Minimum Billing（最低課金） | ウェアハウスの起動後、実際の稼働時間に関わらず**最低60秒分**のクレジットが課金される仕組み。35秒で停止しても60秒分が課金される |
| Provisioned / Resumed / Suspended（プロビジョン/再開/サスペンド） | ウェアハウスのライフサイクル状態。プロビジョン＝新規起動、再開＝サスペンドからの復帰、サスペンド＝一時停止。いずれの状態遷移でも最低60秒の課金ルールが適用される |

## 1-2. 重要コンセプトまとめ

- **秒単位課金だが最低60秒**：Snowflakeは秒単位で課金するが、ウェアハウスの起動ごとに最低60秒の課金が発生する
- **60秒未満の停止でも60秒分課金**：35秒で停止 → 60秒分のクレジット消費。10秒で停止 → 60秒分のクレジット消費
- **クエリの有無は無関係**：ウェアハウスが起動していれば、クエリを実行していなくてもクレジットを消費する
- **ひっかけ選択肢に注意**：「35 seconds if a query was run; otherwise, 0 seconds」はクエリ有無で課金が変わるように見せるが誤り。起動 = 課金
- **再開（resume）のたびに最低60秒**が適用される。頻繁なサスペンド/再開はコスト増の原因になりうる

## 1-3. 公式ドキュメントURL

- [Warehouse Credit Usage](https://docs.snowflake.com/en/user-guide/credits#virtual-warehouse-credit-usage)
- [Warehouse Billing](https://docs.snowflake.com/en/user-guide/warehouses-overview#warehouse-billing)

---

## 2-1. 問題文（英語）

> A virtual warehouse was started and then stopped after 35 seconds. How much time would be considered to calculate the number of Snowflake credits used?
>
> A. 0 seconds
> B. 35 seconds
> C. 60 seconds
> D. 35 seconds if a query was run; otherwise, 0 seconds

## 2-2. 問題文の文法解析

### 文1: "A virtual warehouse was started and then stopped after 35 seconds."

- **主語 (S)**: A virtual warehouse（仮想ウェアハウスが）
- **動詞1 (V)**: was started（起動された）— 受動態
- **接続 (M)**: and then（そしてその後）
- **動詞2 (V)**: stopped（停止された）
- **修飾語 (M)**: after 35 seconds（35秒後に）
- **文型**: SV and V（受動態の等位接続）
- **注目ポイント**:
  - `was started and then stopped` — 受動態の並列。2つの動作を時系列で接続
  - `after 35 seconds` — 「35秒後に」。時間経過を示す前置詞句

### 文2: "How much time would be considered to calculate the number of Snowflake credits used?"

- **疑問詞 (S)**: How much time（どれだけの時間が）
- **動詞 (V)**: would be considered（考慮されるか）— 仮定法受動態
- **目的 (M)**: to calculate the number of Snowflake credits used（使用されたクレジット数を計算するために）
- **文型**: SV（受動態疑問文）+ to不定詞（目的）
- **注目ポイント**:
  - `would be considered` — 仮定法（would）+ 受動態。「考慮されることになるか」
  - `to calculate` — 目的を示す to不定詞
  - `credits used` — 過去分詞 `used` が `credits` を後置修飾。「使用されたクレジット」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| virtual warehouse | 名詞 | 仮想ウェアハウス | A virtual warehouse consumes credits while running. |
| be considered | 動詞（受動態） | 考慮される、みなされる | 60 seconds would be considered for billing. |
| calculate | 動詞 | 計算する | Calculate the number of credits used per hour. |
| credits used | 名詞+過去分詞 | 使用されたクレジット | The credits used depend on warehouse size and runtime. |

## 2-3. 問題文（日本語）

> 仮想ウェアハウスが起動され、35秒後に停止されました。使用されたSnowflakeクレジット数を計算するために、どれだけの時間が考慮されますか？
>
> A. 0秒
> B. 35秒
> C. 60秒
> D. クエリが実行された場合は35秒、そうでなければ0秒

---

## 3-1. 解説文（英語）

> Snowflake credits are billed per second; however, a minimum of 60 seconds of billing applies. If a virtual warehouse were provisioned, resumed, suspended, or deleted within the first 60 seconds, a minimum of 60 seconds of credit usage would apply. Whether or not a warehouse is running a query doesn't matter; if the virtual warehouse is running, it is consuming credits.

## 3-2. 解説文の文法解析

### 文1: "Snowflake credits are billed per second; however, a minimum of 60 seconds of billing applies."

- **主語1 (S)**: Snowflake credits（Snowflakeクレジットは）
- **動詞1 (V)**: are billed（課金される）— 受動態
- **修飾語 (M)**: per second（秒単位で）
- **接続**: however（しかしながら）— セミコロンと逆接の接続副詞
- **主語2 (S)**: a minimum of 60 seconds of billing（最低60秒の課金が）
- **動詞2 (V)**: applies（適用される）
- **文型**: SV; however, SV
- **注目ポイント**:
  - `per second` — 「秒あたり・秒単位で」。課金単位を示す `per ~` 表現
  - `; however,` — セミコロン + however で逆接を示す。前半と後半が対照的な情報
  - `a minimum of ~` — 「最低〜」。下限値を示す名詞句

### 文2: "If a virtual warehouse were provisioned, resumed, suspended, or deleted within the first 60 seconds, a minimum of 60 seconds of credit usage would apply."

- **条件節 (M)**: If a virtual warehouse were provisioned, resumed, suspended, or deleted within the first 60 seconds（仮想ウェアハウスが最初の60秒以内にプロビジョン・再開・サスペンド・削除された場合）
- **主語 (S)**: a minimum of 60 seconds of credit usage（最低60秒分のクレジット使用が）
- **動詞 (V)**: would apply（適用されることになる）
- **文型**: 仮定法過去（If + 過去形, would + 動詞）
- **注目ポイント**:
  - `were provisioned, resumed, suspended, or deleted` — 仮定法過去の受動態。`were` は仮定法の標識
  - `within the first 60 seconds` — 「最初の60秒以内に」。時間の範囲を限定
  - 4つの動作を列挙（provisioned, resumed, suspended, deleted）— いずれの操作でも最低課金が適用されることを強調

### 文3: "Whether or not a warehouse is running a query doesn't matter; if the virtual warehouse is running, it is consuming credits."

- **主語 (S)**: Whether or not a warehouse is running a query（ウェアハウスがクエリを実行しているかどうかは）
- **動詞 (V)**: doesn't matter（関係ない）
- **接続**: セミコロン
- **条件節 (M)**: if the virtual warehouse is running（ウェアハウスが稼働していれば）
- **主語2 (S)**: it（それは）
- **動詞2 (V)**: is consuming（消費している）— 現在進行形
- **目的語 (O)**: credits（クレジットを）
- **文型**: SV; if SV, SVO
- **注目ポイント**:
  - `Whether or not ~ doesn't matter` — 「〜かどうかは関係ない」。条件が無関係であることを明示する定型表現
  - `is consuming` — 現在進行形で「今まさに消費している」状態を強調

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| billed per second | 動詞句 | 秒単位で課金される | Credits are billed per second with a 60-second minimum. |
| a minimum of | 名詞句 | 最低〜、少なくとも〜 | A minimum of 60 seconds of billing applies. |
| apply | 動詞 | 適用される | The minimum billing rule applies to all warehouse startups. |
| provisioned | 過去分詞 | プロビジョンされた（新規起動された） | If a warehouse were provisioned within 60 seconds... |
| whether or not | 接続詞 | 〜かどうかに関わらず | Whether or not a query runs, credits are consumed. |
| consuming credits | 動詞句 | クレジットを消費している | A running warehouse is consuming credits. |

## 3-3. 解説文（日本語）

> Snowflakeのクレジットは秒単位で課金されます。ただし、最低60秒の課金が適用されます。仮想ウェアハウスが最初の60秒以内にプロビジョン・再開・サスペンド・削除された場合でも、最低60秒分のクレジット使用が適用されます。ウェアハウスがクエリを実行しているかどうかは関係ありません。仮想ウェアハウスが稼働していれば、クレジットを消費しています。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
