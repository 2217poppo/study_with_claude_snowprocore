# 023: Virtual Warehouse — Resize at Any Time

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-10
**正答**: B（False）
**ユーザー回答**: B（False）— 正解

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Virtual Warehouse（仮想ウェアハウス） | Snowflakeのコンピュートリソース。クエリ実行やデータロードに使用される。X-Small〜6X-Largeのサイズがあり、**作成後もいつでもサイズ変更が可能** |
| Warehouse Resize（ウェアハウスのリサイズ） | ウェアハウスのサイズを変更する操作。`ALTER WAREHOUSE SET WAREHOUSE_SIZE = 'LARGE'` で実行。**クエリ実行中でも変更可能** |
| Scale Up / Scale Down（スケールアップ/ダウン） | ウェアハウスのサイズを大きく/小さくすること。複雑なクエリや大量データ処理に対応するためにサイズを上げ、不要時に下げてコストを削減する |
| Running Warehouse（実行中のウェアハウス） | クエリを処理中、またはサスペンドされていない状態のウェアハウス。Snowflakeでは実行中のウェアハウスに対してもリサイズが可能 |

## 1-2. 重要コンセプトまとめ

- **ウェアハウスはいつでもリサイズ可能**: 作成後にサイズを変更できる。「一度作成したら変更不可」は誤り
- **実行中でもリサイズ可能**: クエリが走っている最中でもサイズ変更ができる（ダウンタイム不要）
- **リサイズ時の挙動**:
  - **サイズ拡大（Scale Up）**: 追加ノードがプロビジョニングされ、**次のクエリから**新しいリソースが利用可能
  - **サイズ縮小（Scale Down）**: 実行中のクエリが完了した後にノードが削除される
- **Q011との関連**: Q011（Warehouse Resize Behavior）ではリサイズ時の具体的な動作を学習済み。本問はリサイズの可否を問うTrue/False問題
- **試験のひっかけパターン**: 「cannot be changed」「is fixed」などの絶対表現が出たらFalseを疑う

## 1-3. 公式ドキュメントURL

- [Resizing a Warehouse](https://docs.snowflake.com/en/user-guide/warehouses-tasks#resizing-a-warehouse)
- [Warehouse Overview](https://docs.snowflake.com/en/user-guide/warehouses-overview)

---

## 2-1. 問題文（英語）

> True/False: Once a virtual warehouse has been created, its size cannot be changed.
>
> A. True
> B. False

## 2-2. 問題文の文法解析

### 文1: "Once a virtual warehouse has been created, its size cannot be changed."

- **時間節 (M)**: Once a virtual warehouse has been created（仮想ウェアハウスが一度作成されると）
- **主語 (S)**: its size（そのサイズは）
- **動詞 (V)**: cannot be changed（変更できない）— 否定の受動態
- **文型**: SV（受動態）+ Once時間節
- **注目ポイント**:
  - `Once + 現在完了` — 「一度〜されると」。完了した動作を起点とする時間節
  - `cannot be changed` — 否定の受動態。「変更できない」という絶対的な制限を主張 → True/False問題ではFalseの可能性が高いシグナル
  - `its` — 所有格代名詞。`a virtual warehouse` を受ける

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| once | conj | 一度〜すると | Once created, the warehouse can be resized. |
| resize | verb | サイズを変更する | You can resize a warehouse at any time. |
| at any time | adv phrase | いつでも | Warehouses can be resized at any time. |

## 2-3. 問題文（日本語）

> True/False: 仮想ウェアハウスが一度作成されると、そのサイズは変更できない。
>
> A. True（正しい）
> B. False（誤り）

---

## 3-1. 解説文（英語）

> You can resize a virtual warehouse at any time, even when they are running.

## 3-2. 解説文の文法解析

### 文1: "You can resize a virtual warehouse at any time, even when they are running."

- **主語 (S)**: You（あなたは / ユーザーは）
- **動詞 (V)**: can resize（リサイズできる）
- **目的語 (O)**: a virtual warehouse（仮想ウェアハウスを）
- **修飾語 (M1)**: at any time（いつでも）
- **修飾語 (M2)**: even when they are running（実行中であっても）
- **文型**: SVO
- **注目ポイント**:
  - `at any time` — 「いつでも」。制限がないことを強調
  - `even when ~` — 「たとえ〜のときでも」。予想される制約を打ち消す強調表現（既出パターン）
  - `they are running` — 進行形。ウェアハウスがアクティブ（クエリ実行中）であることを示す

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| at any time | adv phrase | いつでも | You can resize a warehouse at any time. |
| even when ~ | conj phrase | たとえ〜のときでも | You can resize even when queries are running. |
| running | adj/verb | 実行中の、稼働中の | The warehouse is currently running. |

## 3-3. 解説文（日本語）

> 仮想ウェアハウスはいつでもリサイズできます。実行中であっても可能です。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
