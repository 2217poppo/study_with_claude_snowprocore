# 037: Dynamic Data Masking — Column-Level Security

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-02
**正答**: D（Column-level security）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Dynamic Data Masking（動的データマスキング） | 列に適用するマスキングポリシーで、ロールに応じてデータを隠す/部分的に見せるセキュリティ機能。例: SYSADMIN は本名を見られるが、一般ユーザーには `****` と表示される。列レベルセキュリティの実現手段の1つ |
| Column-level Security（列レベルセキュリティ） | テーブルの特定列へのアクセスを制御するセキュリティ手法。SnowflakeではDynamic Data Masking または External Tokenization によって実現 |
| Row-level Security（行レベルセキュリティ） | テーブルの特定行へのアクセスを制御するセキュリティ手法。SnowflakeではRow Access Policy（行アクセスポリシー）によって実現。Dynamic Data Maskingとは異なる概念 |
| Masking Policy（マスキングポリシー） | 列に適用するポリシーオブジェクト。クエリ実行者のロールに基づいてデータをどのように表示するか（そのまま/マスク/一部表示）を定義する |
| External Tokenization（外部トークン化） | サードパーティのトークン化ツールと連携して、列データをトークン（偽の値）に置き換える列レベルセキュリティの実現手段。Dynamic Data Maskingと並ぶColumnレベルセキュリティの方法 |
| Column-level Security Policy | テーブルの列に対して定義されるセキュリティポリシーの総称。マスキングポリシーが該当する |

## 1-2. 重要コンセプトまとめ

- **Dynamic Data Masking = 列レベルセキュリティ（Column-level Security）** これが試験の核心
- **行レベルセキュリティ（Row-level）との混同に注意**: 「どの行を見せるか」= Row Access Policy、「どの列を見せるか（どう表示するか）」= Dynamic Data Masking
- **Snowflakeの列レベルセキュリティの2つの実現方法**:
  1. **Dynamic Data Masking**: 列の値をロールに応じてマスク・変換して表示
  2. **External Tokenization**: 外部システムと連携してデータをトークンに置き換え
- **Database-level / Object-level ではない**: Database全体やオブジェクト全体の制御は別の機能（GRANT等）が担当
- **引っかけポイント**: Row-level security はよく似た概念だが、それはRow Access Policyの役割。Dynamic Data Maskingは列（Column）が対象

## 1-3. 公式ドキュメントURL

- [Column-Level Security](https://docs.snowflake.com/en/user-guide/security-column)
- [Dynamic Data Masking](https://docs.snowflake.com/en/user-guide/security-column-ddm-intro)
- [Row Access Policies (Row-level Security)](https://docs.snowflake.com/en/user-guide/security-row-intro)

---

## 2-1. 問題文（英語）

> Dynamic Data Masking provides what sort of security in Snowflake?
>
> A. Database-level security
> B. Row-level security
> C. Object Security
> D. Column-level security

## 2-2. 問題文の文法解析

### 文1: "Dynamic Data Masking provides what sort of security in Snowflake?"

- **主語 (S)**: Dynamic Data Masking（ダイナミックデータマスキングは）
- **動詞 (V)**: provides（提供する）
- **目的語 (O)**: what sort of security（どのような種類のセキュリティを）← `what sort of ~` が疑問詞として機能
- **修飾語 (M)**: in Snowflake（Snowflakeにおける）
- **文型**: SVO（疑問文）
- **注目ポイント**: `what sort of ~` = 「どのような種類の〜」。`what kind of ~` と同義。試験問題で機能・種類を問う時の定型表現

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| dynamic | 形容詞 | 動的な（実行時に変化する） | Dynamic masking applies rules at query runtime. |
| masking | 名詞/動名詞 | マスキング（隠すこと・置換すること） | Masking hides sensitive data from unauthorized users. |
| sort of ~ | 名詞句 | 〜の種類（= kind of ~） | What sort of security does this feature provide? |
| provide | 動詞 | 提供する | Dynamic Data Masking provides column-level security. |

## 2-3. 問題文（日本語）

> Dynamic Data Masking は Snowflake においてどのような種類のセキュリティを提供しますか？
>
> A. データベースレベルセキュリティ
> B. 行レベルセキュリティ
> C. オブジェクトセキュリティ
> D. 列レベルセキュリティ

---

## 3-1. 解説文（英語）

> Snowflake supports masking policies that may be applied to columns and enforced at the column level to provide column-level security. Column-level security is achieved by dynamic data masking or external Tokenization.

## 3-2. 解説文の文法解析

### 文1: "Snowflake supports masking policies that may be applied to columns and enforced at the column level to provide column-level security."

- **主語 (S)**: Snowflake（Snowflakeは）
- **動詞 (V)**: supports（サポートする）
- **目的語 (O)**: masking policies（マスキングポリシーを）
- **修飾語 (M1)**: that may be applied to columns（列に適用されることができる）← 関係代名詞節（受動態）
- **修飾語 (M2)**: and enforced at the column level（列レベルで強制される）← 並列する受動態分詞句
- **修飾語 (M3)**: to provide column-level security（列レベルセキュリティを提供するために）← 目的を示す to 不定詞
- **文型**: SVO
- **注目ポイント**:
  - `may be applied ... and enforced` = 可能性の助動詞 may + 受動態の並列構造
  - `enforced at the column level` = `enforce`（強制する・施行する）は法律・ポリシーの文脈で頻出

### 文2: "Column-level security is achieved by dynamic data masking or external Tokenization."

- **主語 (S)**: Column-level security（列レベルセキュリティは）
- **動詞 (V)**: is achieved（達成される・実現される）← 受動態
- **修飾語 (M)**: by dynamic data masking or external Tokenization（動的データマスキングまたは外部トークン化によって）← 手段を示す by句
- **文型**: SV（受動態）
- **注目ポイント**: `be achieved by ~` = 「〜によって実現される」。実現手段を示す受動態の定番表現。`or` で2つの手段を提示

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| enforce | 動詞 | 強制する、施行する | Policies are enforced at query time. |
| be achieved by ~ | 熟語 | 〜によって実現される | Column security is achieved by masking policies. |
| tokenization | 名詞 | トークン化（データを偽の値に置換する処理） | External tokenization replaces values with tokens. |
| apply to ~ | 句動詞 | 〜に適用する | Masking policies can be applied to any column. |

## 3-3. 解説文（日本語）

> Snowflakeは、列に適用して列レベルで強制されるマスキングポリシーをサポートし、列レベルセキュリティを提供します。列レベルセキュリティは、動的データマスキングまたは外部トークン化によって実現されます。

---

## 復習メモ

- [ ] Dynamic Data Masking = 列レベルセキュリティを確認した
- [ ] 行レベルセキュリティ（Row Access Policy）との違いを説明できる
- [ ] 列レベルセキュリティの2つの実現手段（DDM・External Tokenization）を覚えた
- [ ] 英語の文法ポイント（be achieved by / enforced at）を確認した
- [ ] この問題はセキュリティポリシーの理論問題のためサンドボックス検証は任意
