# 010: Warehouse Resize — Impact on Running vs Future Queries

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-17
**正答**: (1) Only future queries can take advantage of the increased size / (2) There is no impact on the running query

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Warehouse Resize（ウェアハウスリサイズ） | 仮想ウェアハウスのサイズを変更すること（例: Medium → Large）。**クエリ実行中でもいつでも実行可能** |
| Running Query（実行中クエリ） | ウェアハウスリサイズの時点で既に実行が開始されているクエリ。**リサイズの影響を受けない** |
| Future Query（将来のクエリ） | リサイズ完了後に新たに開始されるクエリ。**新しいサイズの恩恵を受ける** |
| Cluster Node（クラスターノード） | 仮想ウェアハウスを構成するコンピュートリソースの単位。リサイズでノード数が増減する |

## 1-2. 重要コンセプトまとめ

- **ウェアハウスリサイズのルール（試験最頻出）**:
  - 実行中のクエリ = **影響なし**（新しいノードはすぐには使わない）
  - 将来のクエリ = **新サイズを活用**（リサイズ後に開始されるクエリのみ）
- **選択肢の引っかけ**:
  - ❌ "The current query immediately utilizes the additional nodes" — **誤り**: 実行中クエリはすぐには新ノードを使わない
  - ❌ "The existing running queries are stopped and re-submitted" — **誤り**: 停止・再サブミットはない
  - ✓ "Only future queries can take advantage of the increased size" — **正解**
  - ✓ "There is no impact on the running query" — **正解**（上と同じ意味を別の角度から述べている）
- **スケールダウン時の特記事項**:
  - サイズを下げる場合も実行中クエリは影響なし
  - ノードの削除は**実行中クエリが完了するまで遅延**される（クエリを強制停止しない）
- **実用上のポイント**:
  - クエリが遅い場合はウェアハウスを大きくすれば良いが、その恩恵は「次のクエリ」から

## 1-3. 公式ドキュメントURL

- [Resizing a Warehouse](https://docs.snowflake.com/en/user-guide/warehouses-tasks#resizing-a-warehouse)

---

## 2-1. 問題文（英語）

> A virtual warehouse is in a running state and is executing a complex query. The administrator increases the size of the virtual warehouse. What best describes the impact on the running query and any future queries? Select all that apply.
>
> A. The current query immediately utilizes the additional nodes available after the resize operation.
> B. Only future queries can take advantage of the increased size. ✓
> C. The existing running queries are stopped and re-submitted after the virtual warehouse is resized.
> D. There is no impact on the running query. ✓

## 2-2. 問題文の文法解析

### 文1: "A virtual warehouse is in a running state and is executing a complex query."

- **主語 (S)**: A virtual warehouse
- **動詞1 (V1)**: is in a running state（実行状態にある）
- **動詞2 (V2)**: is executing（実行している / 現在進行形）
- **目的語 (O)**: a complex query
- **注目ポイント**:
  - `is in a running state` = 「実行状態にある」（state を使ったSVC構文）
  - `be in a ~ state` = 「〜の状態にある」（状態を表す定番表現）

### 文2: "The administrator increases the size of the virtual warehouse."

- **主語 (S)**: The administrator
- **動詞 (V)**: increases（増加させる）
- **目的語 (O)**: the size of the virtual warehouse
- **注目ポイント**: シンプルなSVO。`increases the size` = サイズを大きくする（= リサイズアップ）

### 文3: "What best describes the impact on the running query and any future queries?"

- **疑問詞**: What（何が）
- **副詞**: best（最もよく）
- **動詞 (V)**: describes（説明する）
- **目的語 (O)**: the impact on the running query and any future queries
- **注目ポイント**:
  - `What best describes ~?` = 「〜を最もよく説明するものは何か」（試験頻出フレーズ）
  - `any future queries` = 「将来のいかなるクエリ」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| is in a running state | 動詞句 | 実行状態にある | The warehouse is in a running state when resized. |
| immediately utilizes | 動詞句 | すぐに活用する | Running queries do NOT immediately utilize new nodes. |
| take advantage of | 動詞句 | 〜を活用する | Only future queries take advantage of the larger size. |
| re-submitted | 形容詞（過去分詞） | 再サブミットされた | Running queries are NOT stopped and re-submitted. |

## 2-3. 問題文（日本語）

> 仮想ウェアハウスが実行状態で複雑なクエリを処理しています。管理者が仮想ウェアハウスのサイズを大きくしました。実行中のクエリと将来のクエリへの影響を最もよく説明しているものはどれですか？すべて選択してください。
>
> A. 現在のクエリはリサイズ操作後すぐに追加ノードを活用する
> B. 将来のクエリのみがサイズ増加の恩恵を受けられる ✓
> C. 既存の実行中クエリは停止され、ウェアハウスのリサイズ後に再サブミットされる
> D. 実行中のクエリには影響がない ✓

---

## 3-1. 解説文（英語）

> When a virtual warehouse is resized, any currently executing queries are not impacted—only new queries are affected by the new size.
>
> https://docs.snowflake.com/en/user-guide/warehouses-tasks#resizing-a-warehouse

## 3-2. 解説文の文法解析

### 文1: "When a virtual warehouse is resized, any currently executing queries are not impacted—only new queries are affected by the new size."

- **時間節**: When a virtual warehouse is resized（仮想ウェアハウスがリサイズされるとき）
- **主節（前半）**: any currently executing queries are not impacted（現在実行中のクエリは影響を受けない）
  - **主語 (S)**: any currently executing queries
  - **動詞 (V)**: are not impacted（受動態・否定）
- **ダッシュ（—）**: 補足・対比説明を導く
- **主節（後半）**: only new queries are affected by the new size
  - **主語 (S)**: only new queries
  - **動詞 (V)**: are affected（受動態）
  - **行為者**: by the new size
- **注目ポイント**:
  - `any currently executing queries` = 「現在実行中のいかなるクエリも」（any + 現在分詞）
  - `are not impacted` = 「影響を受けない」（impact の受動態否定）
  - `are affected by ~` = 「〜によって影響を受ける」（impact との対比）
  - ダッシュ（—）で対比構造を作る: 「〜は影響なし — 〜のみ影響あり」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| currently executing | 形容詞句 | 現在実行中の | Currently executing queries are not impacted. |
| are not impacted | 受動態（否定） | 影響を受けない | Running queries are not impacted by the resize. |
| are affected by | 受動態句 | 〜によって影響を受ける | Only new queries are affected by the new size. |
| only new queries | 名詞句 | 新しいクエリのみ | Only new queries benefit from the larger warehouse. |

## 3-3. 解説文（日本語）

> 仮想ウェアハウスがリサイズされると、現在実行中のいかなるクエリも影響を受けません — 新しいサイズによって影響を受けるのは新しいクエリのみです。

---

## 復習メモ

- [ ] リサイズ時、実行中クエリ = 影響なし、将来のクエリのみが新サイズの恩恵を受けると覚えた
- [ ] `take advantage of ~`（〜を活用する）と `are not impacted`（影響を受けない）の使い方を確認した
- [ ] `What best describes ~?`（最もよく説明するものは）という試験頻出フレーズを把握した
