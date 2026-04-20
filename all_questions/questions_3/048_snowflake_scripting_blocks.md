# 048: Snowflake Scripting Blocks

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-15
**正答**: A, B, D, E

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Snowflake Scripting | SnowflakeのSQL拡張スクリプト言語。手続き的ロジック（変数宣言・ループ・例外処理等）を記述可能 |
| DECLARE | 変数やカーソルを宣言するセクション |
| BEGIN / END | スクリプトの実際のロジックを囲むブロック |
| EXCEPTION | 例外（エラー）を処理するオプショナルなセクション。BEGIN/END内に配置 |

## 1-2. 重要コンセプトまとめ

- Snowflake Scriptingの構造:
  - **DECLARE** — 変数・カーソルの宣言
  - **BEGIN** — ロジック開始
  - **EXCEPTION** — 例外処理（オプション）
  - **END** — ロジック終了
- Snowflake Scriptingに**存在しない**キーワード:
  - **NOTIFY** ❌
  - **PARALLEL** ❌
- 典型的なブロック構造: `DECLARE → BEGIN → (EXCEPTION) → END`

## 1-3. 公式ドキュメントURL

- [Snowflake Scripting](https://docs.snowflake.com/en/developer-guide/snowflake-scripting/index)

---

## 2-1. 問題文（英語）

> Which of the following are supported in Snowflake Scripting code?
>
> A. END
> B. EXCEPTION
> C. NOTIFY
> D. DECLARE
> E. BEGIN
> F. PARALLEL

## 2-2. 問題文の文法解析

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| scripting block | noun | スクリプトブロック | A typical Snowflake Scripting block. |
| declare | verb | 宣言する | Variables and cursors may be declared. |
| enclose | verb | 囲む | BEGIN & END enclose the logic. |
| optionally contain | phrase | オプションで含む | May optionally contain the EXCEPTION section. |

## 2-3. 問題文（日本語）

> Snowflake Scriptingコードでサポートされているのはどれですか？

---

## 3-1. 解説文（英語）

> A typical Snowflake Scripting block will have a DECLARE section where variables and cursors may be declared. The BEGIN & END enclose the actual logic of the script and may optionally contain the EXCEPTION section, where you handle any exceptions.

## 3-3. 解説文（日本語）

> 典型的なSnowflake Scriptingブロックには、変数やカーソルを宣言するDECLAREセクションがあります。BEGINとENDがスクリプトの実際のロジックを囲み、オプションで例外を処理するEXCEPTIONセクションを含むことができます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
