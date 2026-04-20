# 091: Directory Table — Stream Integration

**SnowPro Core Domain**: Domain 3 — Data Loading, Unloading, and Connectivity
**作成日**: 2026-04-06
**正答**: C・D（2つ選択）
- C: Streams can be used with directory tables.
- D: To use a stream with a directory table, you must create the stream on the stage object.

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Directory Table（ディレクトリテーブル） | ステージ上のファイルのメタデータ（ファイル名・サイズ・最終更新日時等）を保持する仮想テーブル。`SELECT * FROM DIRECTORY(@stage)` でクエリ可能 |
| Stream on Directory Table（ディレクトリテーブルのStream） | ディレクトリテーブルに関連するStreamを通じてファイルの追加・削除・変更を追跡する仕組み。**Streamはディレクトリテーブルオブジェクト上ではなく、ステージオブジェクト（@stage）上に作成する** |
| Stream（ストリーム） | テーブルやステージに対するDML変更（INSERT/UPDATE/DELETE）を追跡するオブジェクト。ディレクトリテーブルのStreamはファイルの追加・削除・変更を追跡する |
| Stage Object（ステージオブジェクト） | ファイルを格納するSnowflakeのストレージ領域（`@stage_name`）。ディレクトリテーブルのStreamを作成する際はこのステージオブジェクト上に作成する |

## 1-2. 重要コンセプトまとめ

- **2つの正解**:
  1. **Streamはディレクトリテーブルと併用できる**（使用可能）
  2. **Streamはステージオブジェクト上に作成する**（ディレクトリテーブルオブジェクト上ではない）

- **Stream作成の対象が重要な引っかけポイント**:
  - ❌ 誤り: `CREATE STREAM my_stream ON TABLE DIRECTORY(@stage)` （ディレクトリテーブル上）
  - ✅ 正解: `CREATE STREAM my_stream ON STAGE @my_stage` （ステージオブジェクト上）

- **ディレクトリテーブルのStreamのユースケース**: ファイルの追加・削除・変更（added/removed/changed）をトラッキングして、ETLパイプラインのトリガーとして使用する

- **試験の引っかけ**: 「Streamを使う = ディレクトリテーブルオブジェクトの上に作成」と思いがちだが、実際は「**ステージオブジェクト**の上に作成する」

## 1-3. 公式ドキュメントURL

- [Streams on Directory Tables](https://docs.snowflake.com/en/user-guide/data-load-dirtables-manage#streams-on-directory-tables)

---

## 2-1. 問題文（英語）

> Which of the following is true regarding Directory Tables? Select all that apply.
>
> A. To use a stream with a directory table, you must create the stream on the directory table object.
> B. Streams can NOT be used with directory tables.
> C. Streams can be used with directory tables.
> D. To use a stream with a directory table, you must create the stream on the stage object.

## 2-2. 問題文の文法解析

### 文1: "Which of the following is true regarding Directory Tables?"

- **主語 (S)**: Which of the following（疑問詞節）
- **動詞 (V)**: is
- **補語 (C)**: true
- **修飾語 (M)**: regarding Directory Tables（前置詞句）
- **文型**: SVC（疑問文）
- **注目ポイント**:
  - **"is true regarding ~"**: 「〜に関して正しい（もの）はどれか」。`regarding ~`（〜に関して）は `about ~` のフォーマルな表現。正誤を問う試験問題で頻出
  - **"Which of the following"**: 複数候補から選ぶ疑問詞句。`Select all that apply` と組み合わさり複数選択問題を示す

### 選択肢A: "To use a stream with a directory table, you must create the stream on the directory table object."

- **注目ポイント**:
  - **"To use ~ with ~"**: to不定詞の副詞的用法（条件）。「〜と一緒に〜を使うためには」
  - **"on the directory table object"**: ×不正解の根拠。作成先はディレクトリテーブルオブジェクトではなくステージオブジェクト

### 選択肢D: "To use a stream with a directory table, you must create the stream on the stage object."

- **注目ポイント**:
  - **"on the stage object"**: ✓正解の根拠。StreamはSTAGEオブジェクト上に作成する
  - 選択肢AとDは "on the X object" の X だけが異なる。この微細な違いを正確に識別することが試験のポイント

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| regarding | 前置詞 | 〜に関して | Which statement is true regarding Directory Tables? |
| must | 助動詞 | 〜しなければならない | You must create the stream on the stage object. |
| on the ~ object | 前置詞句 | 〜オブジェクト上に | Create the stream on the stage object, not the directory table. |

## 2-3. 問題文（日本語）

> ディレクトリテーブルに関して正しいものはどれですか？当てはまるものをすべて選んでください。
>
> A. ストリームをディレクトリテーブルと一緒に使うには、ディレクトリテーブルオブジェクト上にストリームを作成しなければならない。
> B. ストリームはディレクトリテーブルと一緒に使うことができない。
> C. ストリームはディレクトリテーブルと一緒に使うことができる。
> D. ストリームをディレクトリテーブルと一緒に使うには、ステージオブジェクト上にストリームを作成しなければならない。

---

## 3-1. 解説文（英語）

> Streams can be used with directory tables to easily track which files have been added, removed, or changed. This is done by creating a stream on top of the stage object.

## 3-2. 解説文の文法解析

### 文1: "Streams can be used with directory tables to easily track which files have been added, removed, or changed."

- **主語 (S)**: Streams
- **動詞 (V)**: can be used（受動態）
- **修飾語 (M1)**: with directory tables（共に使う対象）
- **修飾語 (M2)**: to easily track which files have been added, removed, or changed（to不定詞の副詞的用法・目的）
- **文型**: SV（受動態）
- **注目ポイント**:
  - **"to easily track"**: to不定詞の中に副詞 `easily` が入る分離不定詞（split infinitive）。`to track easily` とも言えるが `to easily track` の方が副詞の係り方が明確
  - **"which files have been added, removed, or changed"**: 間接疑問文 `which files ~` が `track` の目的語。「どのファイルが追加・削除・変更されたか」を追跡する。`have been added`（現在完了受動態）で変化の状態を示す
  - **3つの受動態の並列**: `added`（追加された）/ `removed`（削除された）/ `changed`（変更された）をカンマと `or` で並列

### 文2: "This is done by creating a stream on top of the stage object."

- **主語 (S)**: This（前文全体の処理を指す）
- **動詞 (V)**: is done（受動態）
- **修飾語 (M)**: by creating a stream on top of the stage object（手段）
- **文型**: SV（受動態）
- **注目ポイント**:
  - **"This is done by + 動名詞"**: 「これは〜することで行われる」。前述の処理・機能の実現方法を説明する定番受動態構文。`by creating`（作成することで）が手段を示す
  - **"on top of the stage object"**: 「ステージオブジェクトの上に」。`on top of ~` は「〜の上に・〜を基盤として」を示す。単なる `on ~` より「重ねる・積み上げる」のニュアンスが強く、技術的な「上位レイヤーに作成する」感覚を示す

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| track | 動詞 | 追跡する、記録する | Streams track which files have been added or removed. |
| on top of ~ | 前置詞句 | 〜の上に、〜を基盤として | Create the stream on top of the stage object. |
| This is done by ~ | 受動態構文 | これは〜することで行われる | This is done by creating a stream on the stage. |

## 3-3. 解説文（日本語）

> Streamはディレクトリテーブルと一緒に使用でき、どのファイルが追加・削除・変更されたかを簡単に追跡できます。これはステージオブジェクトの上にStreamを作成することで実現されます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
