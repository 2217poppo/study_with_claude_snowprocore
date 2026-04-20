# 009: UDF Types (Scalar vs Table)

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-02
**正答**: A と B（2つ選択）
- A. Table UDFs（選択済み・正解）
- B. Scalar UDFs（正しい選択・**未選択**）
- C. Compiled UDFs（誤り）
- D. Interpreted UDFs（誤り）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| UDF (User-Defined Function) | ユーザーが独自に定義した関数。SQL・JavaScript・Python・Java等で記述できる。戻り値の形式によってScalar UDFとTable UDFに大別される。 |
| Scalar UDF（スカラーUDF） | 入力行1行に対して1行（1つの値）を返すUDF。最も一般的なUDFの形式。例: 文字列変換、計算処理など。 |
| Table UDF / UDTF (User-Defined Table Function) | 入力行1行に対して0行・1行・複数行を返すUDF。結果は複数列を含むテーブル形式。UDTFはTable UDFの別名。 |
| Compiled UDF | Snowflakeには存在しない誤答の選択肢。UDFはコンパイル方式では分類しない。 |
| Interpreted UDF | Snowflakeには存在しない誤答の選択肢。インタープリタ方式でも分類しない。 |

## 1-2. 重要コンセプトまとめ

- **UDFは「戻り値の形式」で2種類に大別される**:
  | 種類 | 戻り値 | 特徴 |
  |------|--------|------|
  | **Scalar UDF** | 入力1行 → 出力1行（1列/1値） | 最も一般的。値の変換・計算に使う |
  | **Table UDF (UDTF)** | 入力1行 → 出力0〜複数行（複数列） | テーブルを返す。JOIN等で使用 |

- **UDTF = User-Defined Table Function = Table UDF**（別名として覚える）
- **誤答の整理**: 「Compiled」「Interpreted」はUDFの分類方法として存在しない
- **今回のミス**: Table UDFは選べたが、Scalar UDFを見逃した。「Scalar（スカラー）」という語に不慣れだった可能性
- **試験ポイント**: 「broadly categorized」「based on how they return data」→ Scalar / Table の2分類を想起

## 1-3. 公式ドキュメントURL

- [UDF Overview — Scalar and Tabular Functions](https://docs.snowflake.com/en/sql-reference/udf-overview#scalar-and-tabular-functions)

---

## 2-1. 問題文（英語）

> Snowflake UDFs can be broadly categorized into which two based on how they return data.
>
> A. Table UDFs
> B. Scalar UDFs
> C. Compiled UDFs
> D. Interpreted UDFs

## 2-2. 問題文の文法解析

### 文1: "Snowflake UDFs can be broadly categorized into which two based on how they return data."

- **主語 (S)**: Snowflake UDFs
- **動詞 (V)**: can be categorized（受動態 + 助動詞）
- **副詞 (M)**: broadly（「大まかに」）
- **前置詞句**: into which two（「どの2つに」）
- **根拠の句**: based on how they return data（「データをどのように返すかに基づいて」）
- **文型**: SV（受動態）+ M + 前置詞句 + based on句
- **注目ポイント**:
  - 「broadly categorized」は「大まかに分類される」。be categorized into ~ で「～に分類される」
  - 「based on how ~」は「～に基づいて」。how節（間接疑問文）が前置詞 on の目的語
  - 文末がピリオドでなくピリオドなし（問題文スタイル）。疑問文の意図を持つ平叙文形式

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| broadly | adverb | 大まかに、広く | UDFs can be broadly categorized into two types. |
| categorize into | verb phrase | ～に分類する | Functions are categorized into scalar and table types. |
| based on | preposition | ～に基づいて | Categories are based on how they return data. |
| scalar | adjective/noun | スカラー（単一値の） | A scalar UDF returns one value per input row. |

## 2-3. 問題文（日本語）

> Snowflake UDFは、データを返す方法に基づいて大まかにどの2つに分類できますか？
>
> A. Table UDF
> B. Scalar UDF
> C. Compiled UDF
> D. Interpreted UDF

---

## 3-1. 解説文（英語）

> There are broad types of UDF in terms of the kind of result they can return. Scalar UDFs return one row for each input row, with each output row containing a single column or value. You can also create table UDFs that return zero, one, or several rows for each input, with each result row containing multiple columns. UDTFs are another name for user-defined table functions.

## 3-2. 解説文の文法解析

### 文1: "There are broad types of UDF in terms of the kind of result they can return."

- **構文**: There are ~（存在を示す There 構文）
- **主語 (S)**: broad types of UDF
- **修飾語**: in terms of the kind of result they can return（「返せる結果の種類という観点で」）
- **文型**: There + V + S + M
- **注目ポイント**: 「in terms of ~」は「～という観点から、～に関して」。比較・分類の基準を示す頻出表現

### 文2: "Scalar UDFs return one row for each input row, with each output row containing a single column or value."

- **主語 (S)**: Scalar UDFs
- **動詞 (V)**: return
- **目的語 (O)**: one row
- **修飾語**: for each input row（「入力行ごとに」）
- **付帯状況の with句**: with each output row containing a single column or value
  - with + 名詞 + 現在分詞（「各出力行が単一列または値を含んだ状態で」）
- **文型**: SVO + M + with付帯状況
- **注目ポイント**: 「with + O + 現在分詞」は付帯状況の構文。008のwith+過去分詞と対比して覚える

### 文3: "You can also create table UDFs that return zero, one, or several rows for each input, with each result row containing multiple columns."

- **主語 (S)**: You
- **動詞 (V)**: can also create
- **目的語 (O)**: table UDFs that return zero, one, or several rows for each input（関係詞節付き）
- **付帯状況**: with each result row containing multiple columns
- **文型**: SVO + with付帯状況
- **注目ポイント**:
  - 「zero, one, or several rows」：0行・1行・複数行が返せることを示す。Scalar（必ず1行）との対比
  - 「can also create」の also は「さらに、加えて」。Scalar UDFに加えてTable UDFも作れることを強調

### 文4: "UDTFs are another name for user-defined table functions."

- **主語 (S)**: UDTFs
- **動詞 (V)**: are
- **補語 (C)**: another name for user-defined table functions
- **文型**: SVC
- **注目ポイント**: 「another name for ~」は「～の別名」。UDTF = Table UDF という同義語関係を直接定義する

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| in terms of | phrase | ～という観点から、～に関して | Categorized in terms of the kind of result returned. |
| with + O + 現在分詞 | 付帯状況構文 | 〜が〜している状態で | ...with each row containing a single value. |
| another name for | phrase | ～の別名 | UDTFs are another name for table functions. |

## 3-3. 解説文（日本語）

> UDFには、返せる結果の種類という観点から大まかな分類があります。Scalar UDFは入力行ごとに1行を返し、各出力行には単一の列または値が含まれます。また、各入力に対して0行・1行・複数行を返すTable UDFを作成することもでき、各結果行には複数の列が含まれます。UDTFはUser-Defined Table Functionの別名です。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
