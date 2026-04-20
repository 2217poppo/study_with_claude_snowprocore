# 080: Warehouse Resize When Suspended

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-16
**正答**: A (Yes)

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Virtual Warehouse Resize（リサイズ） | ウェアハウスのサイズ変更（ノード数の増減）。**いつでも可能**（サスペンド中・稼働中どちらでも） |
| Suspended State（サスペンド状態） | ウェアハウスが一時停止している状態。クレジット消費なし |
| Node（ノード） | ウェアハウスを構成するコンピュートインスタンス。サイズが大きいほどノード数が多い |

## 1-2. 重要コンセプトまとめ

- ウェアハウスは**いつでもリサイズ可能**（サスペンド中でも稼働中でも）
- 稼働中のリサイズ:
  - サイズ増加: ノードが追加される
  - サイズ縮小: 該当ノード上のクエリ完了後にノードが削除される
- サスペンド中のリサイズ: 次回レジューム時に新しいサイズで起動
- リサイズは即座に完了し、実行中のクエリに悪影響を与えない

## 1-3. 公式ドキュメントURL

- [Resizing a Warehouse](https://docs.snowflake.com/en/user-guide/warehouses-tasks#resizing-a-warehouse)

---

## 2-1. 問題文（英語）

> A virtual warehouse is in a suspended state. Can it be resized?
>
> A. Yes
> B. No

## 2-2. 問題文の文法解析

### 文1: "A virtual warehouse is in a suspended state."

- **主語 (S)**: A virtual warehouse
- **動詞 (V)**: is
- **補語 (C)**: in a suspended state
- **文型**: SVC

### 文2: "Can it be resized?"

- **主語 (S)**: it（= a virtual warehouse）
- **動詞 (V)**: can be resized（受動態）
- **文型**: SV（受動態・疑問文）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| resize | 動詞 | リサイズする | A warehouse can be resized at any time. |
| suspended state | 名詞句 | サスペンド状態 | The warehouse is in a suspended state. |

## 2-3. 問題文（日本語）

> 仮想ウェアハウスがサスペンド状態にあります。リサイズできますか？
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
- **修飾語 (M)**: at any time / even when they are running
- **文型**: SVO
- **注目ポイント**: 「at any time」で「いつでも」。「even when ~ are running」で稼働中でも可能なことを強調。

### 文2: "When a virtual warehouse is resized, Snowflake adds or removes nodes according to the new size."

- **主語 (S)**: Snowflake
- **動詞 (V)**: adds or removes
- **目的語 (O)**: nodes
- **修飾語 (M)**: When a virtual warehouse is resized（条件）/ according to the new size
- **文型**: SVO
- **注目ポイント**: 「according to ~」で「～に応じて」。

### 文3: "The removal of nodes takes place only when all active queries on those nodes have finished."

- **主語 (S)**: The removal of nodes
- **動詞 (V)**: takes place
- **修飾語 (M)**: only when all active queries on those nodes have finished（条件を限定）
- **文型**: SV
- **注目ポイント**: 「takes place only when ~」で「～の場合にのみ行われる」。ノード削除は安全に行われる。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| at any time | 副詞句 | いつでも | Resize at any time, even when running. |
| according to | 前置詞句 | ～に応じて | Adds or removes nodes according to the new size. |
| takes place | 動詞句 | 行われる | Removal takes place only when queries finish. |

## 3-3. 解説文（日本語）

> 仮想ウェアハウスはいつでもリサイズできます。稼働中であってもリサイズ可能です。仮想ウェアハウスがリサイズされると、Snowflakeは新しいサイズに応じてノードを追加または削除します。ノードの削除は、そのノード上のすべてのアクティブなクエリが完了した場合にのみ行われます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
