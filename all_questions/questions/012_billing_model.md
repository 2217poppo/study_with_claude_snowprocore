# 012: Snowflake Billing Model

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-02
**正答**: C と D（2つ）
- A. Snowflake billing is based on the amount of data processed by queries（**選択したが不正解**）
- B. Snowflake billing is based on the number of queries executed.（誤り・未選択）
- C. If a virtual warehouse is suspended, it does not contribute to the cost.（選択済み・正解）
- D. Snowflake billing is based on the actual used storage.（**正しい選択・未選択**）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Billing（課金） | Snowflakeの費用発生の仕組み。コンピュート（ウェアハウス）とストレージの2軸で課金される。クエリ数や処理データ量では課金されない。 |
| Compute Cost（コンピュートコスト） | 仮想ウェアハウスが稼働（resumed/active）状態にある時間に対して発生する費用。クエリを実行中かどうかは関係なく、稼働中であれば課金される。 |
| Storage Cost（ストレージコスト） | 実際に使用したストレージ容量に対して発生する費用。課金対象: テーブルデータ・内部ステージのファイル・Time Travel履歴・Fail-safeストレージ。 |
| Suspended（サスペンド状態） | ウェアハウスが停止・休止している状態。この状態ではコンピュートコストは**発生しない**。 |
| Resumed（レジューム状態） | ウェアハウスが起動・稼働している状態。クエリを実行していなくても課金される。 |
| Credit（クレジット） | Snowflakeのコンピュートリソースの課金単位。ウェアハウスのサイズと稼働時間に応じて消費される。 |

## 1-2. 重要コンセプトまとめ

- **Snowflakeの課金モデルの2軸**:
  1. **コンピュート**: ウェアハウスの稼働時間（サイズ × 時間）
  2. **ストレージ**: 実際に使用したデータ量

- **コンピュート課金の重要なポイント**（試験頻出のひっかけ）:
  - ✅ ウェアハウスが resumed（起動中）→ **課金される**
  - ✅ ウェアハウスが起動中でもクエリを実行していない → **課金される**
  - ✅ ウェアハウスが suspended（停止中）→ **課金されない**（正答C）

- **課金されないもの（誤答の選択肢）**:
  | 誤った思い込み | 実際 |
  |--------------|------|
  | A「処理データ量で課金」 | **誤り**。処理データ量は課金に関係しない |
  | B「クエリ実行数で課金」 | **誤り**。クエリ数は課金に関係しない |

- **ストレージ課金の対象**（正答D「actual used storage」）:
  - テーブルデータ
  - 内部ステージのファイル
  - Time Travelデータ
  - Fail-safeデータ

- **試験ポイント**: 「処理データ量」「クエリ数」は課金に**無関係**。「稼働時間」と「使用ストレージ量」が課金の2本柱

## 1-3. 公式ドキュメントURL

- [Understanding Compute Costs](https://docs.snowflake.com/en/user-guide/cost-understanding-compute)
- [How Are Costs Incurred](https://docs.snowflake.com/en/user-guide/cost-understanding-overall#how-are-costs-incurred)

---

## 2-1. 問題文（英語）

> Which of the following statement is correct regarding Snowflake billing? Select all that apply.
>
> A. Snowflake billing is based on the amount of data processed by queries.
> B. Snowflake billing is based on the number of queries executed.
> C. If a virtual warehouse is suspended, it does not contribute to the cost.
> D. Snowflake billing is based on the actual used storage.

## 2-2. 問題文の文法解析

### 文1: "Which of the following statement is correct regarding Snowflake billing?"

- **主語 (S)**: Which of the following statement
- **動詞 (V)**: is
- **補語 (C)**: correct
- **修飾語 (M)**: regarding Snowflake billing（「Snowflakeの課金に関して」）
- **文型**: SVC + M
- **注目ポイント**:
  - 「regarding ~」は「～に関して、～について」。concerning / about と同義。ビジネス・技術文書で頻出
  - 「is correct」は「正しい」。accurately describes と同様の意味

### 選択肢の文法注目点

- **A・B・D**: 「is based on ~」は「～に基づいている」。課金の根拠・基準を示す受動態表現
- **C**: 「If + 主語 + 受動態, 主語 + does not ~」は条件文。「もし～なら、～しない」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| billing | noun | 課金、請求 | Snowflake billing is based on compute and storage. |
| regarding | preposition | ～に関して | Which statement is correct regarding billing? |
| is based on | 受動態句 | ～に基づいている | Compute costs are based on warehouse uptime. |
| contribute to | verb phrase | ～に貢献する、～の一因となる | A suspended warehouse does not contribute to cost. |
| actual used | adjective | 実際に使用した | Billing is based on actual used storage. |

## 2-3. 問題文（日本語）

> Snowflakeの課金に関して正しい記述はどれですか？該当するものをすべて選びなさい。
>
> A. Snowflakeの課金はクエリが処理したデータ量に基づいている。
> B. Snowflakeの課金は実行したクエリ数に基づいている。
> C. 仮想ウェアハウスがサスペンド状態の場合、コストは発生しない。
> D. Snowflakeの課金は実際に使用したストレージ量に基づいている。

---

## 3-1. 解説文（英語）

> Virtual warehouses in a resumed (active) state contribute to the costs. However, it does not matter if the virtual warehouse is not running a query; if it is resumed, it contributes to the costs.
>
> Snowflake charges for data storage in database tables, files staged in internal stages, time travel history, and fail-safe storage. Snowflake doesn't charge on how much data a query processed.

## 3-2. 解説文の文法解析

### 文1: "Virtual warehouses in a resumed (active) state contribute to the costs."

- **主語 (S)**: Virtual warehouses in a resumed (active) state（前置詞句が主語を修飾）
- **動詞 (V)**: contribute to
- **目的語 (O)**: the costs
- **文型**: SVO（句動詞 contribute to）
- **注目ポイント**: 「in a resumed state」は「起動（稼働）状態にある」。状態を示す前置詞句が名詞を後置修飾

### 文2: "However, it does not matter if the virtual warehouse is not running a query; if it is resumed, it contributes to the costs."

- **接続副詞**: However（「しかし」）
- **形式主語構文**: it does not matter if ~（「～かどうかは関係ない」）
- **条件節**: if the virtual warehouse is not running a query
- **セミコロン後**: if it is resumed, it contributes to the costs（条件文）
- **注目ポイント**:
  - 「it does not matter if ~」は「～かどうかは関係ない・問題ない」。試験でよく使われる否定の条件表現
  - セミコロン（;）は関連する2文をつなぐ。「クエリを実行していなくても→起動中なら課金」という論理を示す

### 文3: "Snowflake charges for data storage in database tables, files staged in internal stages, time travel history, and fail-safe storage."

- **主語 (S)**: Snowflake
- **動詞 (V)**: charges for（「～に対して課金する」）
- **目的語の列挙 (O)**: data storage / files staged / time travel history / fail-safe storage（4つを and で列挙）
- **文型**: SVO（句動詞 charges for）
- **注目ポイント**: 「charges for ~」は「～に対して料金を請求する」。ストレージ課金の対象が4つ列挙されている

### 文4: "Snowflake doesn't charge on how much data a query processed."

- **主語 (S)**: Snowflake
- **動詞 (V)**: doesn't charge on
- **目的語 (O)**: how much data a query processed（間接疑問文）
- **文型**: SVO
- **注目ポイント**: 「charge on ~」は「～に基づいて課金する」。否定形で「処理データ量には課金しない」という重要事実を明示

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| it does not matter if ~ | 表現 | ～かどうかは関係ない | It does not matter if no query is running. |
| charge for ~ | verb phrase | ～に対して課金する | Snowflake charges for storage and compute. |
| staged | adjective | ステージングされた | Files staged in internal stages incur storage costs. |
| fail-safe | noun/adjective | フェイルセーフ（障害対応データ保護） | Fail-safe storage is included in billing. |

## 3-3. 解説文（日本語）

> 起動（アクティブ）状態の仮想ウェアハウスはコストに影響します。ただし、仮想ウェアハウスがクエリを実行中かどうかは関係ありません。起動状態であればコストが発生します。
>
> Snowflakeはデータベーステーブルのデータストレージ、内部ステージにステージングされたファイル、Time Travel履歴、Fail-safeストレージに対して課金します。クエリが処理したデータ量に対しては課金されません。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
