# 073: Stored Procedure — Return Types

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation (Extending Snowflake Functionality)
**作成日**: 2026-04-03
**正答**: C・D（Single Value と Tabular Data）

> 関連問題: 006（Secure UDF）・009（UDF Types）・052（Snowpark Languages）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Stored Procedure（ストアドプロシージャ） | 複雑な手続き的ロジック（制御フロー・ループ・エラーハンドリング等）をデータベース側で実行するオブジェクト。**戻り値は必須ではない**が、Single ValueやTabular Dataを返すことができる |
| Single Value（単一値） | ストアドプロシージャが返せる結果の1つ。1つのスカラー値（数値・文字列・日付等）を返す |
| Tabular Data（表形式データ） | ストアドプロシージャが返せる結果の1つ。複数行・複数列のテーブル形式で結果を返す |
| UDF（User-Defined Function） | ユーザー定義関数。ストアドプロシージャと異なり、**必ず単一の値を返す**（戻り値が必須）。SQLクエリ内で直接呼び出せる点もストアドプロシージャと異なる |

## 1-2. 重要コンセプトまとめ

- **ストアドプロシージャが返せる型**:
  - ✓ **Single Value**（単一スカラー値）
  - ✓ **Tabular Data**（表形式データ）
  - ✗ Exe files（実行可能ファイル）— 返せない
  - ✗ Binary Executables（バイナリ実行ファイル）— 返せない

- **最重要ポイント**: 「戻り値は必須ではない」
  - `CALL my_procedure()` — 戻り値なしで正常実行可
  - 戻り値が**必要な場合にのみ**返す設計が可能

- **ストアドプロシージャとUDFの違い**（試験頻出）:

  | | Stored Procedure | UDF |
  |--|-----------------|-----|
  | 戻り値 | **任意**（なくてもよい） | **必須**（常に単一値を返す） |
  | SQLクエリ内での利用 | 不可（CALLで呼び出す） | 可能（SELECT等で使用） |
  | 手続き的ロジック | ✓ 制御フロー・ループ等 | 限定的 |
  | 返せるデータ型 | Single Value / Tabular Data | 単一スカラー値のみ |

- **不正解の選択肢の解説**:
  - 「Exe files」「Binary Executables」→ 誤り。ストアドプロシージャはコードやバイナリを実行ファイルとして返せない

## 1-3. 公式ドキュメントURL

- [Stored Procedures vs. UDFs](https://docs.snowflake.com/en/developer-guide/stored-procedures-vs-udfs)

---

## 2-1. 問題文（英語）

> A stored procedure can return which type of results?
>
> A. Exe files
> B. Binary Executables
> C. Single Value
> D. Tabular Data

## 2-2. 問題文の文法解析

### 文1: "A stored procedure can return which type of results?"

- **主語 (S)**: A stored procedure（ストアドプロシージャは）
- **動詞 (V)**: can return（返すことができる）
- **疑問詞句 (O)**: which type of results（どのタイプの結果を）← 目的語位置に疑問詞を置く技術文書スタイル
- **注目ポイント**: `which type of results` = 「どのタイプの結果」。`what type of ~` より選択肢を限定する `which` を使った問い。試験問題の典型的な問いかけパターン

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| stored procedure | 名詞句 | ストアドプロシージャ | A stored procedure can return tabular data. |
| tabular data | 名詞句 | 表形式データ・テーブルデータ | The procedure returns tabular data with multiple rows. |
| binary executable | 名詞句 | バイナリ実行ファイル | Stored procedures cannot return binary executables. |
| which type of ~ | 疑問詞句 | どのタイプの〜 | Which type of results can a stored procedure return? |

## 2-3. 問題文（日本語）

> ストアドプロシージャはどのタイプの結果を返すことができますか？
>
> A. Exeファイル
> B. バイナリ実行ファイル
> C. 単一値
> D. 表形式データ

---

## 3-1. 解説文（英語）

> A stored procedure can also return a single value or tabular data if desired; however, it is not a requirement that a stored procedure must return a value.

## 3-2. 解説文の文法解析

### 文1: "A stored procedure can also return a single value or tabular data if desired; however, it is not a requirement that a stored procedure must return a value."

- **前節**: A stored procedure can also return a single value or tabular data if desired（ストアドプロシージャは必要であれば単一値または表形式データを返すこともできる）
  - `if desired` = `if it is desired` の省略形。「必要であれば・希望すれば」
- **接続副詞**: however（しかしながら）← セミコロン後に逆接で重要な制約を示す
- **後節**: it is not a requirement that a stored procedure must return a value（ストアドプロシージャが値を返すことは要件ではない）
  - 形式主語構文: `it is not a requirement that ~` = 「〜は必須ではない」
- **注目ポイント**: `it is not a requirement that ~` = 「〜は要件ではない・〜は必須ではない」。形式主語 `it` + `requirement` + that節で制約の非必須性を示す定番表現

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| if desired | 条件句 | 必要であれば・希望すれば | It can return tabular data if desired. |
| it is not a requirement that ~ | 形式主語構文 | 〜は必須ではない | It is not a requirement that it must return a value. |
| however | 接続副詞 | しかしながら | It can return values; however, it is not required. |

## 3-3. 解説文（日本語）

> ストアドプロシージャは、必要であれば単一値または表形式データを返すこともできます。しかしながら、ストアドプロシージャが値を返すことは必須ではありません。

---

## 復習メモ

- [ ] ストアドプロシージャはSingle ValueとTabular Dataを返せることを覚えた
- [ ] 戻り値は**必須ではない**（UDFと異なる重要ポイント）を確認した
- [ ] ストアドプロシージャとUDFの戻り値の違いを区別できた
- [ ] `if desired`・`it is not a requirement that ~` の英語パターンを確認した
- [ ] この問題は理論問題のためサンドボックス検証は不要
