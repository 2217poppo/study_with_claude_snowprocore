# 058: Warehouse Suspend Behavior

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-16
**正答**: B (True)

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Virtual Warehouse（仮想ウェアハウス） | Snowflakeのコンピュートリソース。クエリ実行・データロードに使用。サスペンド/レジューム/リサイズが可能 |
| Suspend（サスペンド） | 仮想ウェアハウスを一時停止すること。サスペンド中はクレジットが消費されない |
| Resource Monitor（リソースモニタ） | ウェアハウスのクレジット消費を監視・制限する機能。クォータ超過時に通知・サスペンド・即時サスペンドのアクションが可能 |
| Suspend Immediately（即時サスペンド） | リソースモニタがクレジット上限に達した際に実行する強制停止。実行中のクエリも即座に停止される |

## 1-2. 重要コンセプトまとめ

- 通常のサスペンド: 実行中のクエリが**すべて完了するまで**サスペンド状態にならない（グレースフルシャットダウン）
- リソースモニタによる「Suspend Immediately」: 実行中のクエリを**即座に停止**してサスペンドする
- この2つの動作の違いは試験で問われやすい重要ポイント
- 通常のサスペンドではデータの整合性が保たれる
- Suspend Immediatelyはコスト超過時の緊急措置

## 1-3. 公式ドキュメントURL

- [Warehouse Tasks](https://docs.snowflake.com/en/user-guide/warehouses-tasks)
- [Resource Monitors](https://docs.snowflake.com/en/user-guide/resource-monitors)

---

## 2-1. 問題文（英語）

> True/False: When a virtual warehouse is suspended, it does not go into a suspended state until all ongoing queries that use that virtual warehouse are finished.
>
> A. False
> B. True

## 2-2. 問題文の文法解析

### 文1: "When a virtual warehouse is suspended, it does not go into a suspended state until all ongoing queries that use that virtual warehouse are finished."

- **主語 (S)**: it（= a virtual warehouse）
- **動詞 (V)**: does not go into
- **目的語 (O)**: a suspended state
- **修飾語 (M)**: When a virtual warehouse is suspended（時間の副詞節）/ until all ongoing queries ... are finished（時間の限度を示す副詞節）
- **文型**: SVO
- **注目ポイント**:
  - 「When ~ is suspended」は受動態の副詞節（サスペンドが要求されたとき）
  - 「does not ~ until ...」は「...するまで～しない」= 「...してはじめて～する」パターン
  - 「that use that virtual warehouse」は関係詞節で queries を修飾
  - 「are finished」は受動態で「完了している」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| suspend | 動詞 | 一時停止する | The warehouse is suspended to save credits. |
| go into a ~ state | 動詞句 | ～の状態に入る | It does not go into a suspended state immediately. |
| ongoing | 形容詞 | 進行中の | All ongoing queries must complete first. |
| not ~ until ... | 構文 | ...するまで～しない | It does not stop until all queries finish. |

## 2-3. 問題文（日本語）

> True/False: 仮想ウェアハウスがサスペンドされるとき、その仮想ウェアハウスを使用している進行中のクエリがすべて完了するまで、サスペンド状態にはならない。
>
> A. False（偽）
> B. True（真）

---

## 3-1. 解説文（英語）

> When a virtual warehouse is requested to be suspended, it does not enter a suspended state until all active queries using that virtual warehouse have been completed. Note that when a resource monitor performs a "suspend immediately" on a virtual warehouse after a credit limit has been reached, the virtual warehouse is suspended immediately, stopping all running queries. https://docs.snowflake.com/en/user-guide/warehouses-tasks

## 3-2. 解説文の文法解析

### 文1: "When a virtual warehouse is requested to be suspended, it does not enter a suspended state until all active queries using that virtual warehouse have been completed."

- **主語 (S)**: it（= a virtual warehouse）
- **動詞 (V)**: does not enter
- **目的語 (O)**: a suspended state
- **修飾語 (M)**: When a virtual warehouse is requested to be suspended（受動態の副詞節）/ until all active queries ... have been completed（完了形の副詞節）
- **文型**: SVO
- **注目ポイント**: 「is requested to be suspended」で「サスペンドを要求される」。二重の受動態。「have been completed」は現在完了受動態で完了を強調。

### 文2: "Note that when a resource monitor performs a 'suspend immediately' on a virtual warehouse after a credit limit has been reached, the virtual warehouse is suspended immediately, stopping all running queries."

- **主語 (S)**: the virtual warehouse
- **動詞 (V)**: is suspended
- **修飾語 (M)**: immediately / stopping all running queries（分詞構文 — 結果）
- **文型**: SV（受動態）
- **注目ポイント**: 「Note that」で重要な例外事項を導入。「stopping all running queries」は分詞構文で付帯結果。通常のサスペンドとの対比が示されている。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| is requested to be | 受動態 | ～するよう要求される | The warehouse is requested to be suspended. |
| enter a state | 動詞句 | 状態に入る | It does not enter a suspended state. |
| perform | 動詞 | 実行する | The monitor performs a suspend immediately. |
| credit limit | 名詞句 | クレジット上限 | After the credit limit has been reached. |
| Note that | 接続表現 | ～に注意 | Note that this behavior differs for resource monitors. |

## 3-3. 解説文（日本語）

> 仮想ウェアハウスのサスペンドが要求されると、その仮想ウェアハウスを使用しているすべてのアクティブなクエリが完了するまで、サスペンド状態にはなりません。ただし、リソースモニタがクレジット上限に達した後に仮想ウェアハウスに対して「即時サスペンド」を実行した場合、仮想ウェアハウスは即座にサスペンドされ、実行中のクエリはすべて停止されます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
