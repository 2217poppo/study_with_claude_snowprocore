# 028: Marketplace Import — Required Role

**SnowPro Core Domain**: Domain 5 — Data Sharing and Collaboration
**作成日**: 2026-04-10
**正答**: D（ACCOUNTADMIN）
**ユーザー回答**: D — 正解

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Snowflake Marketplace（マーケットプレイス） | サードパーティやSnowflakeパートナーがデータセットやアプリケーションを公開・共有するプラットフォーム。**閲覧は誰でも可能**だが、データの**インポート（消費）にはACCOUNTADMINまたはIMPORT SHARE権限が必要** |
| IMPORT SHARE 権限 | マーケットプレイスからデータをインポート（共有データを消費）するために必要な権限。ACCOUNTADMINロールはこの権限をデフォルトで保持する |
| ACCOUNTADMIN | Snowflakeで最も強力なシステム定義ロール。マーケットプレイスからのインポートを含む、アカウントレベルの全操作が可能 |
| SYSADMIN | データベース・ウェアハウス等のオブジェクト管理ロール。マーケットプレイスからのインポート権限は持たない |
| SECURITYADMIN | アクセス権限（GRANT/REVOKE）を管理するロール。マーケットプレイスからのインポート権限は持たない |
| SHAREADMIN | 存在しないシステム定義ロール（ひっかけ選択肢）。Snowflakeには「SHAREADMIN」というビルトインロールはない |

## 1-2. 重要コンセプトまとめ

- **マーケットプレイスの操作と必要な権限**:

| 操作 | 必要な権限 |
|------|-----------|
| **閲覧（explore / browse）** | **誰でも可能**（ロール不問） |
| **インポート（consume / import）** | **ACCOUNTADMIN** または **IMPORT SHARE権限** |

- **ACCOUNTADMINの専権事項の整理**（試験頻出）:
  - リソースモニタの作成（Q027）
  - マーケットプレイスからのデータインポート（本問）
  - リーダーアカウントの作成
  - 請求情報の閲覧
- **SHAREADMINは存在しない**: ひっかけ選択肢。「共有（Share）に関連する管理ロール」と思わせるが、Snowflakeにはこのようなビルトインロールはない
- **「閲覧 vs 消費」の区別**: 「any user can explore」だが「consuming requires ACCOUNTADMIN or IMPORT SHARE」。閲覧とインポートの権限が異なる点が試験のポイント
- **関連問題**: Q055（Share Management Role）、Q081（Snowflake Marketplace）

## 1-3. 公式ドキュメントURL

- [Snowflake Marketplace](https://docs.snowflake.com/en/user-guide/data-marketplace)
- [IMPORT SHARE Privilege](https://docs.snowflake.com/en/sql-reference/sql/grant-privilege#global-privileges)

---

## 2-1. 問題文（英語）

> Which of the following roles can import a dataset from Snowflake Marketplace?
>
> A. SYSADMIN
> B. SHAREADMIN
> C. SECURITYADMIN
> D. ACCOUNTADMIN

## 2-2. 問題文の文法解析

### 文1: "Which of the following roles can import a dataset from Snowflake Marketplace?"

- **疑問詞+主語 (S)**: Which of the following roles（次のロールのうちどれが）
- **動詞 (V)**: can import（インポートできるか）
- **目的語 (O)**: a dataset（データセットを）
- **修飾語 (M)**: from Snowflake Marketplace（Snowflakeマーケットプレイスから）
- **文型**: SVO（疑問文）
- **注目ポイント**: `import a dataset from ~` — 「〜からデータセットをインポートする」。マーケットプレイスの消費操作を示す

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| import | verb | インポートする、取り込む | Only ACCOUNTADMIN can import from Marketplace. |
| dataset | noun | データセット | Import a dataset from Snowflake Marketplace. |
| consume | verb | 消費する、利用する | ACCOUNTADMIN is required for consuming data. |

## 2-3. 問題文（日本語）

> Snowflakeマーケットプレイスからデータセットをインポートできるのは、次のロールのうちどれですか？
>
> A. SYSADMIN
> B. SHAREADMIN
> C. SECURITYADMIN
> D. ACCOUNTADMIN

---

## 3-1. 解説文（英語）

> Although any user or role can explore the Snowflake Marketplace, you need a user with the ACCOUNTADMIN privilege or the IMPORT SHARE privilege for consuming data. For simplicity, we suggest you utilize a user with the ACCOUNTADMIN privilege.

## 3-2. 解説文の文法解析

### 文1: "Although any user or role can explore the Snowflake Marketplace, you need a user with the ACCOUNTADMIN privilege or the IMPORT SHARE privilege for consuming data."

- **譲歩節 (M)**: Although any user or role can explore the Snowflake Marketplace（どのユーザーやロールでもマーケットプレイスを閲覧できるが）
- **主語 (S)**: you（あなたは）
- **動詞 (V)**: need（必要とする）
- **目的語 (O)**: a user with the ACCOUNTADMIN privilege or the IMPORT SHARE privilege（ACCOUNTADMIN権限またはIMPORT SHARE権限を持つユーザーを）
- **目的 (M)**: for consuming data（データを消費するために）
- **文型**: SVO + Although譲歩節
- **注目ポイント**:
  - `Although ~ can, you need ~` — 「〜できるが、〜が必要」。閲覧と消費の権限の違いを対比する譲歩構文
  - `for consuming` — 前置詞 + 動名詞で目的を示す

### 文2: "For simplicity, we suggest you utilize a user with the ACCOUNTADMIN privilege."

- **修飾語 (M)**: For simplicity（簡便さのために）
- **主語 (S)**: we（私たちは）
- **動詞 (V)**: suggest（提案する）
- **目的語 (O)**: you utilize a user with the ACCOUNTADMIN privilege（ACCOUNTADMINを使用すること）
- **文型**: SVO（suggest + that節、thatが省略）
- **注目ポイント**: `suggest (that) you utilize ~` — suggestの後のthat節ではshould/原形を使う（仮定法現在）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| explore | verb | 探索する、閲覧する | Any user can explore the Marketplace. |
| consume | verb | 消費する、利用する | ACCOUNTADMIN is required for consuming data. |
| utilize | verb | 活用する、利用する | We suggest you utilize ACCOUNTADMIN. |
| for simplicity | prep phrase | 簡便さのために | For simplicity, use the ACCOUNTADMIN role. |

## 3-3. 解説文（日本語）

> どのユーザーやロールでもSnowflakeマーケットプレイスを閲覧することはできますが、データを消費（インポート）するにはACCOUNTADMIN権限またはIMPORT SHARE権限を持つユーザーが必要です。簡便さのため、ACCOUNTADMIN権限を持つユーザーの利用をお勧めします。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
