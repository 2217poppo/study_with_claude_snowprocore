# 005: Phased Release — Day 1 Update Targets

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-08
**正答**: A（Only those Enterprise edition accounts which have opted into early access）, C（Standard edition accounts）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Phased Release Strategy（段階的リリース戦略） | Snowflakeの新バージョン展開方式。全アカウントに一度にデプロイせず、エディションとアーリーアクセス登録の有無に応じて段階的に展開する。 |
| Weekly Release（週次リリース） | Snowflakeのソフトウェアリリース頻度。毎週新機能・改善・バグ修正がデプロイされる。SaaSの特性によりユーザーの操作なしに自動適用される。 |
| Early Access（アーリーアクセス） | Snowflakeの新バージョンをDay 1に受け取るオプト・イン制度。Enterprise以上のエディションが対象。Snowflakeサポートに連絡して登録する。 |
| Opt In（オプト・イン） | 明示的に登録・参加を選択すること。Early Accessはデフォルトではなく、自発的な登録が必要。 |
| Standard Edition（スタンダードエディション） | SnowflakeのエディションのうちEnterpriseより下位のもの。Day 1またはDay 2（Regular Access）でリリースが適用される。 |
| Business Critical Edition（ビジネスクリティカルエディション） | Enterprise以上のエディション。Early Accessに登録していない限り、Day 2（最終デプロイ）で適用される。 |

## 1-2. 重要コンセプトまとめ

- **Day 1 に更新されるアカウント（2種類）**:
  1. Early Accessに登録した **Enterprise以上のアカウント**
  2. **Standard Editionのすべてのアカウント**（Regular Access: Day 1 または Day 2）
- **Day 2 に更新されるアカウント**:
  - Early Accessに登録していない残りの Enterprise以上のアカウント
- **リリーススケジュールの全体像**:
  | タイミング | 対象 |
  |-----------|------|
  | Day 1（Early Access） | Enterprise+でアーリーアクセス登録済み |
  | Day 1〜2（Regular Access） | Standard Edition の全アカウント |
  | Day 2（Last） | 残りの Enterprise+ 全アカウント |
- **最低24時間ルール**: Early Accessデプロイと最終デプロイの間に必ず24時間以上の間隔を設ける
- **試験の引っかけ**: 「Business Critical はDay 1」は誤り。Early Accessに登録しない限りDay 2
- **目的**: Early Accessで問題を早期発見・対処し、残りのアカウントを守る

## 1-3. 公式ドキュメントURL

- [Understanding Snowflake Releases](https://docs.snowflake.com/en/user-guide/intro-releases)

---

## 2-1. 問題文（英語）

> During a weekly release cycle, which of the following accounts may be updated on the first day of release?
>
> Select two answers.
>
> A. Only those Enterprise edition accounts which have opted into early access
>
> B. All business critical edition accounts
>
> C. Standard edition accounts
>
> D. All Enterprise edition accounts

## 2-2. 問題文の文法解析

### 文1: "During a weekly release cycle, which of the following accounts may be updated on the first day of release?"

- **修飾語 (M1)**: During a weekly release cycle（前置詞句 — 時間的文脈）
- **主語 (S)**: which of the following accounts（疑問詞節）
- **動詞 (V)**: may be updated（受動態 + 助動詞 may）
- **修飾語 (M2)**: on the first day of release（前置詞句 — タイミング）
- **文型**: SV（受動態）
- **注目ポイント**:
  - `may be updated` — `may`（〜かもしれない / 〜してよい）の受動態。ここでは「〜される可能性がある」の意。強い断言（`will`）でなく「対象になりうる」を示す
  - `during a weekly release cycle` — 「週次リリースサイクルの間に」。時間的背景を設定する冒頭の前置詞句

### 選択肢の文法

- **A.** "Only those Enterprise edition accounts which have opted into early access"
  - `Only those ~ which` — 「〜のうちでも、特定のもの（＝early accessに登録したもの）だけ」。`those` は後続の関係詞節を予告する指示代名詞
  - `have opted into` — 現在完了で「（すでに）登録した」。`opt into ~` = 〜にオプト・インする（自発的に登録する）
- **C.** "Standard edition accounts" — 無修飾名詞句。全てのStandard editionアカウントを指す

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| weekly release cycle | 名詞句 | 週次リリースサイクル | Snowflake follows a weekly release cycle. |
| may be updated | 受動態句 | 更新される可能性がある | Standard accounts may be updated on Day 1. |
| opt into ~ | 句動詞 | 〜にオプト・インする（自発的に登録する） | You can opt into early access by contacting support. |
| early access | 名詞句 | アーリーアクセス（先行リリース） | Enterprise accounts can enroll in early access. |

## 2-3. 問題文（日本語）

> 週次リリースサイクルにおいて、リリース初日に更新される可能性があるアカウントはどれですか？
>
> 2つ選択してください。
>
> A. アーリーアクセスにオプト・インしているEnterpriseエディションのアカウントのみ
>
> B. ビジネスクリティカルエディションの全アカウント
>
> C. スタンダードエディションのアカウント
>
> D. Enterpriseエディションの全アカウント

---

## 3-1. 解説文（英語）

> Snowflake does not instantly deploy a new version to all Snowflake accounts; rather, customer accounts are moved into the new release over time in a phased manner. Day 1 (early access): Deployed for Enterprise edition (or higher) accounts that have elected for early access. You can enroll an Enterprise edition (or higher) account for early access by contacting Snowflake support. Day 1 or 2 (regular access): Deployment of all Snowflake accounts on the Standard edition. Day 2 (last): All remaining Enterprise edition (or higher) accounts are deployed. Between an early access deployment and a final deployment, a minimum of 24 hours must pass. This staged release strategy enables Snowflake to identify and address any software issues uncovered during early access.

## 3-2. 解説文の文法解析

### 文1: "Snowflake does not instantly deploy a new version to all Snowflake accounts; rather, customer accounts are moved into the new release over time in a phased manner."

- **前節**: Snowflake / does not instantly deploy / a new version / to all Snowflake accounts（SVO）
- **後節**: customer accounts / are moved（受動態）/ into the new release / over time / in a phased manner
- **注目ポイント**:
  - `; rather,` — 「そうではなく」。前節の否定（does not ~）を受けて正しい情報を対比的に提示する定番パターン
  - `over time` — 「時間をかけて、徐々に」。瞬時ではないことを強調
  - `in a phased manner` — 「段階的な方法で」

### 文2: "Between an early access deployment and a final deployment, a minimum of 24 hours must pass."

- **修飾語 (M)**: Between an early access deployment and a final deployment（前置詞句 — 2つのイベントの間）
- **主語 (S)**: a minimum of 24 hours
- **動詞 (V)**: must pass（義務の助動詞 + 自動詞）
- **文型**: SV
- **注目ポイント**:
  - `a minimum of 24 hours` — 「最低24時間」。`at least 24 hours` と同義だが書き言葉的
  - `must pass` — `pass` の自動詞用法「（時間が）経過する」

### 文3: "This staged release strategy enables Snowflake to identify and address any software issues uncovered during early access."

- **主語 (S)**: This staged release strategy
- **動詞 (V)**: enables（SVOC）
- **目的語 (O)**: Snowflake
- **補語 (C)**: to identify and address any software issues uncovered during early access
- **注目ポイント**:
  - `enable O to do` — 「Oが〜することを可能にする」のSVOC構文
  - `uncovered during early access` — 過去分詞の後置修飾「アーリーアクセス中に発見された（ソフトウェア問題）」
  - `identify and address` — 「特定して対処する」。問題発見と修正の2段階をandで接続

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| elect for ~ | 句動詞 | 〜を選択する・希望する | Accounts that have elected for early access get Day 1 updates. |
| enroll in ~ | 動詞句 | 〜に登録する・参加する | You can enroll in early access by contacting support. |
| a minimum of ~ | 数量表現 | 最低〜（の量・時間） | A minimum of 24 hours must pass between deployments. |
| uncover | 動詞 | 発見する、明らかにする | Issues uncovered during early access are addressed quickly. |
| address | 動詞 | 対処する、取り組む | Snowflake can identify and address software issues. |
| staged | 形容詞 | 段階的な | A staged release strategy minimizes risk. |

## 3-3. 解説文（日本語）

> Snowflakeは全アカウントに新バージョンを即座にデプロイするのではなく、顧客アカウントは時間をかけて段階的な方法で新リリースへと移行されます。Day 1（アーリーアクセス）: アーリーアクセスを選択したEnterpriseエディション以上のアカウントにデプロイ。Snowflakeサポートに連絡することでEnterpriseエディション以上のアカウントをアーリーアクセスに登録できます。Day 1〜2（レギュラーアクセス）: Standardエディションの全Snowflakeアカウントへのデプロイ。Day 2（最終）: 残りのEnterpriseエディション以上の全アカウントがデプロイされます。アーリーアクセスデプロイと最終デプロイの間には最低24時間が必要です。この段階的リリース戦略により、SnowflakeはアーリーアクセスReleaseで発見されたソフトウェア問題を特定・対処することが可能になります。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
