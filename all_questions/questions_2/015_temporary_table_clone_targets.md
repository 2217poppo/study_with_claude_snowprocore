# 015: Temporary Table Clone Targets

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-09
**正答**: Temporary tables can be cloned to transient tables / Temporary tables can be cloned to temporary tables（2つ選択）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Temporary Table（テンポラリテーブル） | セッション内のみ存在するテーブル。Fail-Safeなし・Time Travel最大1日。セッション終了時に自動削除される。**永続テーブル（Permanent）へのクローンは不可** |
| Transient Table（トランジェントテーブル） | セッションをまたいで存在するが、Fail-Safeなし・Time Travel最大1日のテーブル。Permanent と Temporary の中間的な存在 |
| Permanent Table（永続テーブル） | デフォルトのテーブルタイプ。Fail-Safe 7日・Time Travel最大90日（Enterprise以上）。最も保護レベルが高い |
| External Table（外部テーブル） | Snowflake外部のストレージ（S3/GCS/Azure Blob等）上のデータを参照する読み取り専用テーブル。クローンの対象外 |
| Zero-Copy Cloning（ゼロコピークローン） | データの物理コピーを作成せず、メタデータのみをコピーして即座にクローンを作成するSnowflakeの機能。`CREATE TABLE ... CLONE` で実行 |

## 1-2. 重要コンセプトまとめ

- **テーブルタイプ間のクローン制約**（重要な暗記ポイント）:

| クローン元 → クローン先 | Permanent | Transient | Temporary |
|---|---|---|---|
| **Permanent** | OK | OK | OK |
| **Transient** | NG | OK | OK |
| **Temporary** | **NG** | OK | OK |

- **原則**: 保護レベルが低いテーブル → 保護レベルが高いテーブルへのクローンは不可
  - Temporary/Transient（Fail-Safeなし）→ Permanent（Fail-Safe 7日）は不可
  - 理由: クローン先でFail-Safeが発生すると予期しないストレージコストが生じるため
- **Temporary → Transient は可能**: 同じ保護レベル（Fail-Safeなし）なので許可される
- **Temporary → Temporary も可能**: 同じテーブルタイプ同士のクローン
- **External Table はクローン不可**: 外部テーブルはクローンの対象外
- **エラーメッセージ**: `"Temp table cannot be cloned to a permanent table; clone to a transient table instead."` — このエラー文を覚えておくと試験で役立つ

## 1-3. 公式ドキュメントURL

- [Cloning Considerations](https://docs.snowflake.com/en/user-guide/tables-storage-considerations#cloning-tables)
- [CREATE TABLE ... CLONE](https://docs.snowflake.com/en/sql-reference/sql/create-table#create-table-clone)

---

## 2-1. 問題文（英語）

> Which of the following correctly describes the behaviour when a Temporary table is attempted to be cloned?
>
> Select two answers.
>
> A. Temporary tables can be cloned to transient tables.
> B. Temporary tables can be cloned to temporary tables.
> C. Temporary tables can be cloned to permanent tables.
> D. Temporary tables can be cloned to external tables.

## 2-2. 問題文の文法解析

### 文1: "Which of the following correctly describes the behaviour when a Temporary table is attempted to be cloned?"

- **主語 (S)**: Which of the following（次のうちどれが）
- **動詞 (V)**: correctly describes（正しく説明しているか）
- **目的語 (O)**: the behaviour（その動作を）
- **修飾節 (M)**: when a Temporary table is attempted to be cloned（テンポラリテーブルのクローンが試みられた場合の）
- **文型**: SVO + when節
- **注目ポイント**:
  - `is attempted to be cloned` — 受動態の二重構造。「クローンされることが試みられる」。`attempt to do` の受動態
  - `correctly describes` — 「正しく説明する」。副詞 `correctly` が動詞を修飾
  - `behaviour` — イギリス英語の綴り（米語: behavior）

### 選択肢の文法: "Temporary tables can be cloned to transient tables."

- **主語 (S)**: Temporary tables（テンポラリテーブルは）
- **動詞 (V)**: can be cloned（クローンできる）— 助動詞 + 受動態
- **修飾語 (M)**: to transient tables（トランジェントテーブルへ）
- **注目ポイント**: `can be cloned to ~` — 「〜へクローンできる」。クローン先を `to` で示すパターン

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| behaviour | 名詞 | 動作、振る舞い（英綴り） | Describe the behaviour of the CLONE command. |
| attempted to be | 受動態 | 〜されることが試みられる | When cloning is attempted, an error may occur. |
| cloned to | 動詞+前置詞 | 〜へクローンされる | Temporary tables can be cloned to transient tables. |
| correctly describes | 動詞句 | 正しく説明する | Which option correctly describes the restriction? |

## 2-3. 問題文（日本語）

> テンポラリテーブルのクローンが試みられた場合の動作を正しく説明しているのは、次のうちどれですか？
>
> 2つ選択してください。
>
> A. テンポラリテーブルはトランジェントテーブルへクローンできる。
> B. テンポラリテーブルはテンポラリテーブルへクローンできる。
> C. テンポラリテーブルは永続テーブルへクローンできる。
> D. テンポラリテーブルは外部テーブルへクローンできる。

---

## 3-1. 解説文（英語）

> Temporary tables can NOT be cloned to a permanent table.
>
> Doing so will typically show the following error "Temp table cannot be cloned to a permanent table; clone to a transient table instead."
>
> However, a temporary table may be cloned to a transient table or another temporary table.

## 3-2. 解説文の文法解析

### 文1: "Temporary tables can NOT be cloned to a permanent table."

- **主語 (S)**: Temporary tables（テンポラリテーブルは）
- **動詞 (V)**: can NOT be cloned（クローンできない）— 助動詞否定 + 受動態
- **修飾語 (M)**: to a permanent table（永続テーブルへ）
- **文型**: SV（受動態否定）
- **注目ポイント**: `can NOT` — 大文字の `NOT` で不可であることを強調

### 文2: "Doing so will typically show the following error ..."

- **主語 (S)**: Doing so（そうすると）— 動名詞句。前文の「クローンを試みること」を指す
- **動詞 (V)**: will typically show（通常〜を表示する）
- **目的語 (O)**: the following error（次のエラーを）
- **文型**: SVO
- **注目ポイント**:
  - `Doing so` — 「そうすること」。前述の行為を動名詞で受ける定型表現
  - `typically` — 「通常は」。例外がありうることを含意する副詞

### 文3: "However, a temporary table may be cloned to a transient table or another temporary table."

- **接続副詞**: However（しかしながら）
- **主語 (S)**: a temporary table（テンポラリテーブルは）
- **動詞 (V)**: may be cloned（クローンされうる）— 可能性の助動詞 + 受動態
- **修飾語 (M)**: to a transient table or another temporary table（トランジェントテーブルまたは別のテンポラリテーブルへ）
- **文型**: SV + or接続の2つの前置詞句
- **注目ポイント**:
  - `may be cloned` — `can be cloned` よりやや控えめな許可・可能性を示す
  - `another temporary table` — `another` で「別の（同タイプの）」テーブルであることを明示

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| doing so | 動名詞句 | そうすること（前述の行為を指す） | Doing so will result in an error. |
| typically | 副詞 | 通常は | The error will typically appear immediately. |
| instead | 副詞 | 代わりに | Clone to a transient table instead. |
| may be cloned | 助動詞+受動態 | クローンされうる | A temporary table may be cloned to a transient table. |

## 3-3. 解説文（日本語）

> テンポラリテーブルは永続テーブルへクローンすることはできません。
>
> これを行うと、通常次のエラーが表示されます：「テンポラリテーブルは永続テーブルへクローンできません。代わりにトランジェントテーブルへクローンしてください。」
>
> ただし、テンポラリテーブルはトランジェントテーブルまたは別のテンポラリテーブルへクローンすることは可能です。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
