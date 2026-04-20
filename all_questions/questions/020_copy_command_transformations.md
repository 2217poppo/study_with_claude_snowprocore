# 020: COPY Command Supported Transformations

**SnowPro Core Domain**: Domain 3 — Data Loading, Unloading, and Connectivity
**作成日**: 2026-04-02
**正答**: A, B, D（3つ・完全正解）
- A. JOIN（**選択済み・正解**）
- B. GROUP BY（**選択済み・正解**）
- C. Truncate columns（選択済み・**不正解** — これはCOPYでサポートされている）
- D. SUM（**選択済み・正解**）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| COPY コマンド（COPY INTO） | ステージからSnowflakeテーブルへデータをロードするコマンド。ロード中にかんたんな変換も可能 |
| Simple Transformation（シンプルな変換） | COPYロード中にサポートされる変換。列の順序変更・列の省略・型キャスト・値の切り詰め（Truncate）が対象 |
| Complex Transformation（複雑な変換） | COPYロード中にはサポートされない変換。JOIN・GROUP BY・集計関数（SUM/COUNT等）・FLATTEN が対象 |
| Truncate columns（列の切り詰め） | 文字列や数値を指定した長さ・精度に切り詰めるシンプル変換。COPYでサポートされる |
| Casting（型キャスト） | データ型を変換すること（例: 文字列 → 日付）。COPYでサポートされる |
| FLATTEN | 半構造化データ（VARIANT型等）を行に展開する関数。COPYロード中はサポートされない |
| Aggregation（集計） | SUM・COUNT・AVG・GROUP BY などデータをまとめる操作。COPYロード中はサポートされない |

## 1-2. 重要コンセプトまとめ

- **COPYでサポートされる変換（シンプル）**:
  - ✅ 列の順序変更（column reordering）
  - ✅ 列の省略（omitting columns）
  - ✅ 型キャスト（casting）
  - ✅ 値の切り詰め（truncating values）

- **COPYでサポートされない変換（複雑）**:
  - ❌ JOIN（テーブル結合）
  - ❌ GROUP BY（グループ化）
  - ❌ 集計関数: SUM / COUNT / AVG 等
  - ❌ FLATTEN（半構造化データの展開）
  - ❌ フィルタ（WHERE句の複雑な条件）

- **「C: Truncate columns」のひっかけポイント**:
  - Truncateは「切り詰め」という意味でシンプル変換に分類される
  - TRUNCATE TABLE（テーブル全削除）とは別物なので混同しないこと

- **複雑な変換はいつできる？**:
  - ロード後にSELECTクエリを実行する → その時点でJOIN・GROUP BY等が使える
  - COPYはあくまで「取り込みの最適化」が目的なのでシンプルな変換のみ

- **試験ポイント**: COPYでサポートされる変換は「1テーブル内での操作」のみ。複数テーブルにまたがるJOINや集計は不可

## 1-3. 公式ドキュメントURL

- [Transforming Data During a Load](https://docs.snowflake.com/en/user-guide/data-load-overview#id2)

---

## 2-1. 問題文（英語）

> Which of the following transformations are NOT supported by the COPY command? Select all that apply.
>
> A. JOIN
> B. GROUP BY
> C. Truncate columns
> D. SUM

## 2-2. 問題文の文法解析

### 文1: "Which of the following transformations are NOT supported by the COPY command?"

- **主語 (S)**: Which of the following transformations（複数扱い → are）
- **動詞 (V)**: are NOT supported（受動態の否定）
- **修飾語 (M)**: by the COPY command
- **文型**: SV（受動態）+ M
- **注目ポイント**:
  - 「NOT supported by ~」は「～によってサポートされていない」。受動態の否定形
  - 「Which of the following ~」は複数名詞なので are（not is）
  - 大文字の NOT で否定を強調するのは試験問題の典型パターン（ひっかけの合図）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| transformation | noun | 変換、変形 | Simple transformations are supported during COPY. |
| supported by ~ | 受動態句 | ～によってサポートされている | JOINs are not supported by the COPY command. |
| Select all that apply | 指示句 | 該当するものをすべて選べ | Select all that apply — there may be multiple answers. |
| truncate | verb | 切り詰める、短くする | Truncate columns to fit within the target data type. |

## 2-3. 問題文（日本語）

> 以下のうち、COPYコマンドでサポートされていない変換はどれですか？該当するものをすべて選びなさい。
>
> A. JOIN
> B. GROUP BY
> C. 列の切り詰め（Truncate columns）
> D. SUM

---

## 3-1. 解説文（英語）

> When loading data into a table using the COPY command, Snowflake allows you to do simple transformations on the data as it is being loaded. During the load process, the COPY command allows for modifying the order of columns, omitting one or more columns, casting data into specified data types, and truncating values. While loading the data, complex transformations such as joins, filters, aggregations, and the use of FLATTEN are not supported as they are not essential data transformations. Therefore, joining, filtering, and aggregating the data are supported ONLY after the data has been loaded into a table.

## 3-2. 解説文の文法解析

### 文1: "When loading data into a table using the COPY command, Snowflake allows you to do simple transformations on the data as it is being loaded."

- **時間の副詞節**: When loading data into a table using the COPY command（分詞構文 = When Snowflake is loading ~）
- **主語 (S)**: Snowflake
- **動詞 (V)**: allows
- **目的語 (O)**: you to do simple transformations（SVOC構文 allow O to do）
- **修飾節**: as it is being loaded（「ロードされている最中に」）
- **文型**: M（when節）+ SVOC + M（as節）
- **注目ポイント**:
  - 「allow O to do」は「OがするのをOKにする」使役的な表現
  - 「as it is being loaded」は進行形の受動態。「ロード処理が行われている最中に」という継続中の状態

### 文2: "During the load process, the COPY command allows for modifying the order of columns, omitting one or more columns, casting data into specified data types, and truncating values."

- **修飾語 (M)**: During the load process
- **主語 (S)**: the COPY command
- **動詞 (V)**: allows for（句動詞「〜を可能にする」）
- **目的語 (O)**: modifying ... , omitting ... , casting ... , and truncating ...（4つの動名詞の並列）
- **文型**: M + SV + O（動名詞×4の並列）
- **注目ポイント**:
  - 「allow for ~」は「〜を可能にする、〜に対応する」。`allow + to不定詞` とは異なる
  - 4つの動名詞を並列させる列挙構造。最後の要素の前に and

### 文3: "While loading the data, complex transformations such as joins, filters, aggregations, and the use of FLATTEN are not supported as they are not essential data transformations."

- **時間の副詞節**: While loading the data（「データをロードしている間は」）
- **主語 (S)**: complex transformations such as joins, filters, aggregations, and the use of FLATTEN
- **動詞 (V)**: are not supported（受動態の否定）
- **理由節**: as they are not essential data transformations
- **文型**: M + SV（受動態）+ 理由節
- **注目ポイント**:
  - 「such as ~」は例示。「〜などの」
  - 「as they are not essential」の as は「〜なので」理由を示す接続詞
  - 「essential」は「必要不可欠な」。ロードに必須でない変換は非対応という論理

### 文4: "Therefore, joining, filtering, and aggregating the data are supported ONLY after the data has been loaded into a table."

- **接続副詞**: Therefore（因果）
- **主語 (S)**: joining, filtering, and aggregating the data（動名詞×3の並列）
- **動詞 (V)**: are supported
- **修飾語 (M)**: ONLY after the data has been loaded into a table
- **文型**: SV + M
- **注目ポイント**:
  - 「ONLY after ~」の ONLY が大文字で「〜した後にのみ」を強調
  - 「has been loaded」は現在完了の受動態。「ロードが完了した後」という完了の時点を示す

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| allow for ~ | phrasal verb | ～を可能にする、〜に対応する | COPY allows for casting and truncating. |
| omit | verb | 省略する、除外する | You can omit one or more columns during COPY. |
| cast (into) | verb | 型変換する | Cast the string data into a date type. |
| essential | adjective | 必要不可欠な | JOINs are not essential during the load process. |
| aggregation | noun | 集計（SUM・COUNT・AVGなどの操作） | Aggregations are not supported during COPY. |

## 3-3. 解説文（日本語）

> COPYコマンドを使ってテーブルにデータをロードする際、Snowflakeはロード中にシンプルな変換を行うことを可能にします。ロード処理中に、COPYコマンドは列の順序変更、1つ以上の列の省略、指定したデータ型へのキャスト、値の切り詰めを行うことができます。データのロード中は、JOIN・フィルタ・集計・FLATTENの使用といった複雑な変換はサポートされていません。これらは本質的なデータ変換ではないためです。したがって、データの結合・フィルタリング・集計は、テーブルへのロードが完了した後にのみ行うことができます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
