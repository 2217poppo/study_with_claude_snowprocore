# 105: Micro-Partition Immutability

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-06
**正答**: True
**ユーザー回答**: False（不正解）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Micro-Partition（マイクロパーティション） | Snowflakeがテーブルデータを内部的に分割する固定サイズのファイル単位（50〜500MB非圧縮）。列指向で圧縮保存される。一度作成されると**変更不可（immutable）** |
| Immutable（イミュータブル・不変） | 「変更できない・一度作成したら修正不可」という性質。Snowflakeのマイクロパーティションはイミュータブルであり、データ更新時は既存パーティションを変更せず新しいパーティションを作成する（古いパーティションはTime Travelで参照可能） |
| Copy-on-Write（コピーオンライト） | データ変更時に既存パーティションを変更せず、変更部分を含む新しいパーティションを作成するメカニズム。イミュータブルの実装方式。Zero-Copy Cloningでも同じ仕組みが使われる |

## 1-2. 重要コンセプトまとめ

- **True = マイクロパーティションは一度作成したら変更できない（immutable）**
- **イミュータブルの意味**: `cannot be changed once created`（一度作成されたら変更不可）
- **なぜイミュータブルか**:
  - データ整合性の保証
  - Time Travelの実現（古いパーティションが残るため過去データを参照できる）
  - Zero-Copy Cloningの実現（パーティションへのポインター共有が安全にできる）
- **UPDATE/DELETEをすると何が起きるか**:
  - 既存パーティションは**変更されない**
  - 変更後のデータを含む**新しいパーティション**が作成される
  - 古いパーティションはTime Travel期間中は残り、期間後にFail-Safeへ移行
- **よくある誤解**: UPDATEするとパーティションが書き換わると思いがちだが、実際は新パーティション作成 + 古いパーティションの参照解除

## 1-3. 公式ドキュメントURL

- [Micro-partitions & Data Clustering](https://docs.snowflake.com/en/user-guide/tables-clustering-micropartitions)

---

## 2-1. 問題文（英語）

> True or False: Once created, micro-partitions are immutable and cannot be modified.
>
> A. True
> B. False

## 2-2. 問題文の文法解析

### 文1: "Once created, micro-partitions are immutable and cannot be modified."

- **主語 (S)**: micro-partitions
- **動詞1 (V1)**: are
- **補語 (C)**: immutable
- **動詞2 (V2)**: cannot be modified（受動態）
- **従属節**: Once created（分詞構文）
- **文型**: SVC and SV（受動態）
- **注目ポイント**:
  - **"Once created"**: 「一度作成されると」。`Once + 過去分詞`（分詞構文）で「〜されたとたんに・〜した以降は」を示す。省略形 = `Once they are created`。時間的な起点と恒久性を同時に示す
  - **"are immutable and cannot be modified"**: 「イミュータブルであり変更できない」。形容詞述語 `are immutable` と受動態否定 `cannot be modified` を `and` で並列。2つの表現で同じ事実を補強する（強調的反復）
  - **"immutable"**: 「変更不可能な・不変の」。`im-`（否定接頭辞）+ `mutable`（変更可能な）。プログラミング・データ管理で「作成後に変更できない」オブジェクトを指す技術用語

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| immutable | 形容詞 | 変更不可能な・不変の | Micro-partitions are immutable once created. |
| modified | 過去分詞 | 変更された | Immutable objects cannot be modified after creation. |
| Once + 過去分詞 | 分詞構文 | 〜されると・〜した以降は | Once created, the partition remains unchanged. |

## 2-3. 問題文（日本語）

> 正誤問題：マイクロパーティションは一度作成されると、変更不可（イミュータブル）であり修正できない。
>
> A. True（正しい）
> B. False（誤り）

---

## 3-1. 解説文（英語）

> Snowflake partitions are immutable, which means they cannot be changed once created.

## 3-2. 解説文の文法解析

### 文1: "Snowflake partitions are immutable, which means they cannot be changed once created."

- **主語 (S)**: Snowflake partitions
- **動詞 (V)**: are
- **補語 (C)**: immutable
- **非制限関係詞節**: which means they cannot be changed once created
- **文型**: SVC（+ 非制限関係詞で定義を補足）
- **注目ポイント**:
  - **", which means ~"**: 「それはつまり〜を意味する」。`which` が前文全体（`are immutable`）を先行詞にとる非制限関係詞節。難しい技術用語（`immutable`）の後に `which means ~` で平易な言い換えを提供する定番パターン
  - **"they cannot be changed once created"**: 「一度作成されたら変更できない」。問題文の `cannot be modified` が `cannot be changed` に言い換えられている。`modified` と `changed` はほぼ同義で技術文書では互換的に使われる
  - **"once created"**: 問題文と同様の分詞構文。解説文でも同じ表現を繰り返すことで定義を確定させる

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| partition | 名詞 | パーティション（データの分割単位） | Snowflake partitions are immutable once created. |
| cannot be changed | 受動態否定 | 変更できない | Immutable objects cannot be changed after creation. |

## 3-3. 解説文（日本語）

> Snowflakeのパーティションはイミュータブルです。つまり、一度作成されたら変更することができません。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
