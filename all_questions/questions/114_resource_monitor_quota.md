# 114: Resource Monitor — Quota Assignment per Warehouse

**SnowPro Core Domain**: Domain 2 — Account Management & Security
**作成日**: 2026-04-06
**正答**: Warehouse 4 / Warehouse 5
**ユーザー回答**: Warehouse 4 ✅, Warehouse 5 ✅, Warehouse 1 ❌, Warehouse 2 ❌, Warehouse 3 ❌

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Resource Monitor（リソースモニタ） | 仮想ウェアハウスのクレジット消費を**定義されたクォータ（上限）に対して**追跡・管理する機能。ACCOUNTADMINのみが作成・管理できる |
| Quota（クォータ・上限） | リソースモニタで設定するクレジット消費の上限値。クォータに達するとアクションが実行される（通知・中断など） |
| Account-Level Resource Monitor（アカウントレベルモニタ） | すべての仮想ウェアハウスのクレジット消費をアカウント全体で追跡するリソースモニタ |
| Warehouse-Level Resource Monitor（ウェアハウスレベルモニタ） | 特定の1つまたは複数の仮想ウェアハウスのクレジット消費を追跡するリソースモニタ。複数のウェアハウスを**一緒に（合計として）**管理できる |

## 1-2. 重要コンセプトまとめ

- **正解: Warehouse 4 と Warehouse 5** — この2つのウェアハウスが5,000クレジットの上限を持つリソースモニタに割り当てられている
- **問題の設定（画像の推定内容）**: 複数のリソースモニタが設定されており、異なるウェアハウスが異なるクォータのモニタに割り当てられている。WH4とWH5が5,000クレジットのモニタに属する
- **Resource Monitorの割り当て方式**:
  1. **1対1**: 1つのリソースモニタが1つのWHを管理
  2. **1対多**: 1つのリソースモニタが複数のWHを**合計クレジットとして**管理
  3. **アカウントレベル**: すべてのWHのクレジット消費を追跡
- **重要概念**: 複数WHを1つのモニタで管理する場合、クォータはそれらWHの**合計クレジット消費**に適用される（個別ではない）
- **ACCOUNTADMINのみが操作可能**: リソースモニタの作成・管理はACCOUNTADMINの専権事項

## 1-3. 公式ドキュメントURL

- [Resource Monitors — Assignment](https://docs.snowflake.com/en/user-guide/resource-monitors#assignment-of-resource-monitors)

---

## 2-1. 問題文（英語）

> Consider the following resource monitor configuration.
>
> [Resource Monitor Configuration Image — WH4 and WH5 are assigned to a resource monitor with a 5,000 credit quota]
>
> Which two of the given virtual warehouses can use a maximum of 5,000 credits?
>
> A. Warehouse 5 ✅
> B. Warehouse 3
> C. Warehouse 4 ✅
> D. Warehouse 1
> E. Warehouse 2

## 2-2. 問題文の文法解析

### 文1: "Consider the following resource monitor configuration."

- **動詞 (V)**: Consider（命令形）
- **目的語 (O)**: the following resource monitor configuration
- **文型**: VO（命令文）
- **注目ポイント**:
  - **"Consider the following ~"**: 「次の〜を考慮せよ・次の〜を参照せよ」。図表・設定を提示するときの定番導入命令文。`Look at the following ~` と同義

### 文2: "Which two of the given virtual warehouses can use a maximum of 5,000 credits?"

- **主語 (S)**: Which two of the given virtual warehouses
- **動詞 (V)**: can use
- **目的語 (O)**: a maximum of 5,000 credits
- **文型**: SVO（疑問文）
- **注目ポイント**:
  - **"Which two of the given ~"**: 「与えられた〜のうちどの2つが」。`Select two answers` 系問題の疑問文形式。`the given`（与えられた）で「問題に提示された」を示す
  - **"a maximum of 5,000 credits"**: 「最大5,000クレジット」。`a maximum of N`（最大N）で上限を明示。Resource Monitorのquota（クォータ）に対応

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| configuration | 名詞 | 設定・構成 | Consider the following resource monitor configuration. |
| quota | 名詞 | クォータ・上限 | The resource monitor has a quota of 5,000 credits. |
| the given ~ | 形容詞句 | 与えられた・提示された | Which of the given warehouses uses the 5,000 credit quota? |

## 2-3. 問題文（日本語）

> 次のリソースモニタ設定を考慮してください。
>
> [設定画像: WH4とWH5が5,000クレジットのクォータを持つリソースモニタに割り当てられている]
>
> 与えられた仮想ウェアハウスのうち、最大5,000クレジットを使用できる2つはどれか？
>
> A. Warehouse 5 ✅
> B. Warehouse 3
> C. Warehouse 4 ✅
> D. Warehouse 1
> E. Warehouse 2

---

## 3-1. 解説文（英語）

> Resource monitors can track & manage a single virtual warehouse against a defined quota. Resource monitors can be created to track the credit usage of multiple virtual warehouses together.
>
> Resource Monitors can also be created at the account level, which means that such resource monitors track credit usage at the account level, considering the credit usage of all virtual warehouses.

## 3-2. 解説文の文法解析

### 文1: "Resource monitors can track & manage a single virtual warehouse against a defined quota."

- **主語 (S)**: Resource monitors
- **動詞 (V)**: can track & manage（`&` で並列）
- **目的語 (O)**: a single virtual warehouse
- **修飾語 (M)**: against a defined quota
- **文型**: SVO
- **注目ポイント**:
  - **"against a defined quota"**: 「定義されたクォータに対して」。`against ~`（〜に対して）は「基準・上限と照らし合わせて」という測定・比較の意味で使われる。`track ~ against a quota`（クォータに照らして〜を追跡する）

### 文2: "Resource monitors can be created to track the credit usage of multiple virtual warehouses together."

- **主語 (S)**: Resource monitors
- **動詞 (V)**: can be created（受動態）
- **目的（to不定詞）**: to track the credit usage of multiple virtual warehouses together
- **文型**: SV（受動態）
- **注目ポイント**:
  - **"track the credit usage of multiple virtual warehouses together"**: 「複数の仮想ウェアハウスのクレジット使用量を一緒に追跡する」。`together`（一緒に・合計として）が「個別ではなく合計」を示す。複数WHを1つのモニタで管理する場合の動作を説明

### 文3: "Resource Monitors can also be created at the account level, which means that such resource monitors track credit usage at the account level, considering the credit usage of all virtual warehouses."

- **主語 (S)**: Resource Monitors
- **動詞 (V)**: can also be created（受動態）
- **場所 (M)**: at the account level
- **非制限関係詞節**: which means that ~ considering the credit usage of all virtual warehouses
- **文型**: SV（受動態）
- **注目ポイント**:
  - **"at the account level"**: 「アカウントレベルで」。`at the ~ level`（〜レベルで）は適用範囲を示す定番の前置詞句
  - **", which means that ~"**: 前文全体を先行詞にとる非制限関係詞節で定義を補足
  - **"considering the credit usage of all virtual warehouses"**: 「すべての仮想ウェアハウスのクレジット使用量を考慮して」。現在分詞の付帯状況で「全WHを対象に含める」ことを示す

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| against a defined quota | 前置詞句 | 定義されたクォータに対して | Track warehouse usage against a defined quota. |
| together | 副詞 | 一緒に・合計として | Track multiple warehouses together with one resource monitor. |
| at the account level | 前置詞句 | アカウントレベルで | Resource monitors can be set at the account level. |

## 3-3. 解説文（日本語）

> リソースモニタは定義されたクォータに対して単一の仮想ウェアハウスを追跡・管理することができます。リソースモニタは複数の仮想ウェアハウスのクレジット使用量を一緒に追跡するように作成することもできます。
>
> リソースモニタはアカウントレベルでも作成でき、そのようなリソースモニタはすべての仮想ウェアハウスのクレジット使用量を考慮した上でアカウントレベルのクレジット使用量を追跡します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
