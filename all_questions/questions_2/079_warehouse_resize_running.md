# 079: Warehouse Resize Running

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-13
**正答**: Yes

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Warehouse Resize（リサイズ） | WHのサイズを変更すること。実行中でもいつでも可能。ノードが追加（スケールアップ）または削除（スケールダウン）される |
| Node Removal（ノード削除） | スケールダウン時のノード削除。アクティブなクエリが完了してからのみ実行される |

## 1-2. 重要コンセプトまとめ

- WHは**実行中でもリサイズ可能**（Yes）
- リサイズの動作:
  - **スケールアップ**: ノードが追加される（即座）
  - **スケールダウン**: ノードは**アクティブクエリ完了後**に削除される
- `at any time, even when they are running` — いつでも、実行中でも可能

## 1-3. 公式ドキュメントURL

- [Resizing a Warehouse](https://docs.snowflake.com/en/user-guide/warehouses-tasks#resizing-a-warehouse)

---

## 2-1. 問題文（英語）

> A virtual warehouse is running. Can it be resized?
>
> A. Yes
> B. No

## 2-2. 問題文の文法解析

### 文1: "A virtual warehouse is running. Can it be resized?"

- **注目ポイント**: シンプルな受動態疑問文。`be resized` は「リサイズされることができるか」。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| resize | verb | リサイズする | You can resize at any time. |
| at any time | phrase | いつでも | Resize at any time, even when running. |

## 2-3. 問題文（日本語）

> 仮想ウェアハウスが実行中です。リサイズできますか？
>
> A. はい
> B. いいえ

---

## 3-1. 解説文（英語）

> You can resize a virtual warehouse at any time, even when they are running. When a virtual warehouse is resized, Snowflake adds or removes nodes according to the new size. The removal of nodes takes place only when all active queries on those nodes have finished.

## 3-2. 解説文の文法解析

### 文1: "You can resize a virtual warehouse at any time, even when they are running."

- **主語 (S)**: You
- **動詞 (V)**: can resize
- **目的語 (O)**: a virtual warehouse
- **修飾語 (M)**: at any time（いつでも）、even when they are running（譲歩条件）
- **文型**: SVO
- **注目ポイント**: `even when ~` で「たとえ～のときでも」。

### 文2: "The removal of nodes takes place only when all active queries on those nodes have finished."

- **主語 (S)**: The removal of nodes
- **動詞 (V)**: takes place
- **修飾語 (M)**: only when all active queries on those nodes have finished
- **文型**: SV
- **注目ポイント**: `takes place only when ~` で「～のときのみ行われる」。ノード削除の安全性を保証。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| takes place | phrase | 行われる | Removal takes place only when queries finish. |
| according to ~ | phrase | ～に応じて | Adds or removes nodes according to the new size. |

## 3-3. 解説文（日本語）

> 仮想ウェアハウスは実行中であってもいつでもリサイズできます。リサイズされると、Snowflakeは新しいサイズに応じてノードを追加または削除します。ノードの削除は、それらのノード上のすべてのアクティブクエリが完了した場合にのみ行われます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
