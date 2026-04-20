# 011: Virtual Warehouse Resize Behavior

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-02
**正答**: B
- A. The queries are paused while the virtual warehouse is resized to a smaller size.（誤り）
- B. The resize operation succeeds, but the node removal occurs once the active queries are finished.（**正解**・未選択）
- C. The resize operation fails as a virtual warehouse cannot be resized while it is running queries（**選択したが不正解**）
- D. The queries are stopped, and the virtual warehouse is immediately resized to a smaller size.（誤り）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Virtual Warehouse（仮想ウェアハウス） | Snowflakeのコンピュートリソース。クエリ実行・データロード等に使用する。サイズ変更・停止・再開がいつでも可能。 |
| Resize（サイズ変更） | ウェアハウスのサイズ（X-Small〜6X-Large）を変更する操作。実行中のクエリがあっても可能。縮小と拡大で動作が異なる。 |
| Node（ノード） | ウェアハウスを構成するコンピュートノード（サーバー）。サイズ縮小時はノードが削除されるが、アクティブなクエリが終わるまで削除は待機される。 |
| Scale Down（スケールダウン） | ウェアハウスを小さいサイズに変更すること。ノード削除はアクティブクエリ終了後まで遅延される。 |
| Scale Up（スケールアップ） | ウェアハウスを大きいサイズに変更すること。追加ノードはほぼ即座に利用可能になる。 |

## 1-2. 重要コンセプトまとめ

- **ウェアハウスはクエリ実行中でもいつでもリサイズ可能**（失敗しない）
- **スケールダウン時の動作**（正答Bのポイント）:
  - リサイズ操作自体は**即座に成功**する
  - ただしノードの削除は**アクティブクエリが終了してから**実行される
  - クエリはキャンセルも一時停止もされない

- **誤答の整理**:
  | 選択肢 | 誤りの理由 |
  |--------|-----------|
  | A「クエリが一時停止される」 | 誤り。クエリは継続して実行される |
  | C「リサイズが失敗する」 | **誤り。クエリ実行中でもリサイズは成功する**（今回の間違い） |
  | D「クエリが停止されて即座にリサイズ」 | 誤り。クエリは停止されない |

- **スケールアップ vs スケールダウンの比較**（試験頻出）:
  | 操作 | タイミング | クエリへの影響 |
  |------|-----------|--------------|
  | スケールアップ | ほぼ即座にノード追加 | なし（恩恵は即座に受けられる） |
  | スケールダウン | ノード削除は**クエリ終了後** | なし（クエリは継続） |

- **試験ポイント**: 「even when running queries（実行中でもリサイズ可）」「node removal occurs only when all active queries finished（削除はクエリ終了後）」の2点が核心

## 1-3. 公式ドキュメントURL

- [Resizing a Warehouse](https://docs.snowflake.com/en/user-guide/warehouses-tasks#resizing-a-warehouse)

---

## 2-1. 問題文（英語）

> A virtual warehouse is running and executing two queries. The virtual warehouse is resized to a smaller size. What best describes the resize operation?
>
> A. The queries are paused while the virtual warehouse is resized to a smaller size.
> B. The resize operation succeeds, but the node removal occurs once the active queries are finished.
> C. The resize operation fails as a virtual warehouse cannot be resized while it is running queries.
> D. The queries are stopped, and the virtual warehouse is immediately resized to a smaller size.

## 2-2. 問題文の文法解析

### 文1: "A virtual warehouse is running and executing two queries."

- **主語 (S)**: A virtual warehouse
- **動詞 (V)**: is running and executing（現在進行形の並列）
- **目的語 (O)**: two queries（executing の目的語）
- **文型**: SV（and）SVO
- **注目ポイント**: 現在進行形で「稼働中」というシナリオ設定。試験問題で状況を示す定番パターン

### 文2: "The virtual warehouse is resized to a smaller size."

- **主語 (S)**: The virtual warehouse
- **動詞 (V)**: is resized（受動態）
- **修飾語 (M)**: to a smaller size
- **文型**: SV（受動態）+ M
- **注目ポイント**: 「is resized to ~」は「〜にリサイズされる」。to + 比較級（smaller）で変更方向を示す

### 文3: "What best describes the resize operation?"

- **疑問詞**: What
- **副詞**: best（「最もよく」）
- **動詞 (V)**: describes
- **目的語 (O)**: the resize operation
- **文型**: What + V + O
- **注目ポイント**: 「What best describes ~?」は「～を最もよく説明しているものはどれか」。試験で正確な動作を問う際の定番表現

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| resize | verb | サイズ変更する | You can resize a warehouse at any time. |
| node removal | noun phrase | ノードの削除・除去 | Node removal occurs after active queries finish. |
| active queries | noun phrase | 実行中のクエリ | Nodes are kept until all active queries complete. |
| what best describes | 疑問表現 | 最もよく説明しているものは | What best describes the behavior of this operation? |

## 2-3. 問題文（日本語）

> ある仮想ウェアハウスが稼働中で、2つのクエリを実行しています。この仮想ウェアハウスをより小さいサイズにリサイズしました。このリサイズ操作を最もよく説明しているものはどれですか？
>
> A. 仮想ウェアハウスが小さいサイズにリサイズされる間、クエリは一時停止される。
> B. リサイズ操作は成功するが、ノードの削除はアクティブなクエリが終了した後に行われる。
> C. 仮想ウェアハウスはクエリ実行中はリサイズできないため、リサイズ操作は失敗する。
> D. クエリは停止され、仮想ウェアハウスは即座に小さいサイズにリサイズされる。

---

## 3-1. 解説文（英語）

> You can resize a virtual warehouse anytime, even when they are running queries. When resizing to a smaller size, nodes' removal occurs only when all active queries on those nodes have finished.

## 3-2. 解説文の文法解析

### 文1: "You can resize a virtual warehouse anytime, even when they are running queries."

- **主語 (S)**: You
- **動詞 (V)**: can resize
- **目的語 (O)**: a virtual warehouse
- **修飾語**: anytime（「いつでも」）
- **強調の副詞節**: even when they are running queries（「クエリを実行中であっても」）
- **文型**: SVO + M + even when節
- **注目ポイント**:
  - 「even when ~」は「たとえ〜のときでも」。通常は制約になりそうな条件を even で打ち消す
  - 「anytime」は「いつでも」。制限がないことを強調

### 文2: "When resizing to a smaller size, nodes' removal occurs only when all active queries on those nodes have finished."

- **時の副詞節**: When resizing to a smaller size（分詞構文相当。「小さいサイズにリサイズするとき」）
- **主語 (S)**: nodes' removal（所有格 nodes' + 名詞）
- **動詞 (V)**: occurs
- **条件の副詞節**: only when all active queries on those nodes have finished（「それらのノード上のすべてのアクティブクエリが終了したときのみ」）
- **文型**: When節 + SV + only when節
- **注目ポイント**:
  - 「only when ~」は「〜のときのみ」。ノード削除の条件を厳密に限定する
  - 「have finished」は現在完了形。「終了が完了した状態になったとき」
  - 「nodes' removal」は名詞句。「ノードの削除（という行為）」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| anytime | adverb | いつでも | You can resize a warehouse anytime. |
| even when ~ | 接続詞句 | たとえ〜のときでも | Resizing works even when queries are running. |
| only when ~ | 接続詞句 | 〜のときのみ（限定） | Removal occurs only when all queries have finished. |
| have finished | 現在完了形 | 終了した（完了を示す） | Nodes are removed once all queries have finished. |

## 3-3. 解説文（日本語）

> 仮想ウェアハウスは、クエリを実行中であっても、いつでもリサイズできます。小さいサイズにリサイズする場合、ノードの削除は、そのノード上のすべてのアクティブクエリが終了したときのみ実行されます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
