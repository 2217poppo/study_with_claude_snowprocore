# 107: Warehouse Scaling — Scale Up vs Scale Out

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-06
**正答**: Complex queries are executed on the system and are required to finish faster.

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Scaling Up（スケールアップ） | 仮想ウェアハウスのサイズを大きくすること（例: X-Small → Large）。**複雑なクエリやCPU集約的なクエリ**のパフォーマンスを向上させる。コンカレンシー問題の解決には無効 |
| Scaling Out（スケールアウト） | Multi-Cluster Virtual Warehouseでクラスター数を増やすこと。**同時接続ユーザーや同時クエリ数が多い場合**に有効。コンカレンシー（並列処理）問題を解決する |
| CPU-Intensive Query（CPU集約的クエリ） | 大量のデータスキャン・複雑な集計・JOINなど、処理に多くのCPUリソースを必要とするクエリ。スケールアップで恩恵を受けるクエリ種別 |
| Concurrent Queries/Users（同時クエリ/同時ユーザー） | 同じタイミングで並行して実行されるクエリや接続するユーザーの数。スケールアウト（Multi-Cluster WH）で解決する問題。スケールアップでは解決できない |
| Multi-Cluster Virtual Warehouse（マルチクラスターWH） | 同時実行クエリ数・同時接続ユーザー数の増加に対応するため、クラスター数を自動追加・削除できるウェアハウス形式。スケールアウトの手段 |

## 1-2. 重要コンセプトまとめ

- **正解**: 「複雑なクエリが実行されており、より速く完了させる必要がある」→ スケールアップが適切
- **スケールアップ vs スケールアウトの使い分け**（試験最頻出）:

| 問題の種類 | 解決策 | 理由 |
|-----------|--------|------|
| 複雑なクエリが遅い（CPU不足） | **Scale Up**（サイズ拡大） | CPU・メモリが増え、1クエリの処理が速くなる |
| 同時クエリ数が多い | **Scale Out**（Multi-Cluster WH） | クラスターを増やしてクエリを分散処理 |
| 同時ユーザー数が多い | **Scale Out**（Multi-Cluster WH） | 接続を複数クラスターに分散 |

- **スケールアップが無効なケース**: 同時ユーザー/クエリ数が多い場合。WHを大きくしても1クラスターで処理できる同時実行数は変わらない
- **Q095・Q057との関連**: クエリキューイング（Q095）の解決策がMulti-Cluster WH（Q057）。本問はスケールアップとスケールアウトの使い分けを明確に問う

## 1-3. 公式ドキュメントURL

- [Virtual Warehouse Considerations](https://docs.snowflake.com/en/user-guide/warehouses-considerations)

---

## 2-1. 問題文（英語）

> Which of the following scenarios is suitable for scaling up a virtual warehouse to a larger size?
>
> A. The system has many concurrent queries.
> B. The system has many concurrent users.
> C. Complex queries are executed on the system and are required to finish faster. ✅

## 2-2. 問題文の文法解析

### 文1: "Which of the following scenarios is suitable for scaling up a virtual warehouse to a larger size?"

- **主語 (S)**: Which of the following scenarios
- **動詞 (V)**: is
- **補語 (C)**: suitable for scaling up a virtual warehouse to a larger size
- **文型**: SVC（疑問文）
- **注目ポイント**:
  - **"is suitable for + 動名詞"**: 「〜するのに適している」。`suitable for`（〜に適した）+ 動名詞 `scaling up`。`good for`（より口語的）の書き言葉形
  - **"scaling up ~ to a larger size"**: 「〜をより大きいサイズにスケールアップする」。`scale up`（スケールアップ）+ `to a larger size`（より大きいサイズへ）で方向・目標を明示

### 選択肢C: "Complex queries are executed on the system and are required to finish faster."

- **主語 (S)**: Complex queries
- **動詞1 (V1)**: are executed（受動態）
- **動詞2 (V2)**: are required to finish faster（受動態）
- **修飾語 (M)**: on the system
- **文型**: SV and SV（受動態の並列）
- **注目ポイント**:
  - **"are executed on the system"**: 「システム上で実行される」。受動態でクエリが処理される状態を示す
  - **"are required to finish faster"**: 「より速く完了することが求められる」。`be required to do`（〜することを要求される）で要件・必要性を示す受動態。`need to finish faster` より公式的・技術的な表現

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| suitable for ~ | 形容詞句 | 〜に適した・〜に向いている | Scale up is suitable for complex, CPU-intensive queries. |
| concurrent | 形容詞 | 同時の・並行する | A high number of concurrent queries requires scaling out. |
| scale up | 句動詞 | スケールアップする・サイズを上げる | Scale up the warehouse to improve performance for complex queries. |

## 2-3. 問題文（日本語）

> 次のうち、仮想ウェアハウスをより大きいサイズにスケールアップするのに適したシナリオはどれか？
>
> A. システムに同時クエリが多い。
> B. システムに同時ユーザーが多い。
> C. 複雑なクエリがシステムで実行されており、より速く完了させる必要がある。✅

---

## 3-1. 解説文（英語）

> Based on the complexity of the queries and the desired performance, a virtual warehouse can be scaled up or down. In general, increasing the virtual warehouse size improves query speed for CPU-intensive queries. On the other hand, scaling up is ineffective when dealing with a high number of concurrent users or queries. Instead, a multi-cluster virtual warehouse (scaling out) is utilized to accommodate an increased number of users and queries.

## 3-2. 解説文の文法解析

### 文1: "Based on the complexity of the queries and the desired performance, a virtual warehouse can be scaled up or down."

- **主語 (S)**: a virtual warehouse
- **動詞 (V)**: can be scaled up or down（受動態）
- **根拠 (M)**: Based on the complexity of the queries and the desired performance
- **文型**: SV（受動態）
- **注目ポイント**:
  - **"Based on ~ and ~"**: 「〜と〜に基づいて」。`based on`（〜に基づく）+ 2要素（complexity、desired performance）で意思決定の根拠を示す
  - **"can be scaled up or down"**: 「スケールアップまたはダウンすることができる」。`scaled up or down`（上にも下にも）で双方向のサイズ変更が可能なことを示す

### 文2: "In general, increasing the virtual warehouse size improves query speed for CPU-intensive queries."

- **主語 (S)**: increasing the virtual warehouse size（動名詞句）
- **動詞 (V)**: improves
- **目的語 (O)**: query speed
- **修飾語 (M)**: for CPU-intensive queries
- **文型**: SVO
- **注目ポイント**:
  - **"In general, ~"**: 「一般的に・通常」。例外の存在を暗示しつつ一般傾向を述べる副詞句。`generally` と同義
  - **"CPU-intensive queries"**: 「CPU集約的なクエリ」。`intensive`（集中的な・集約的な）+ CPU で「多くのCPUリソースを消費する」クエリ。スケールアップが効果的なクエリ種別の核心語

### 文3: "On the other hand, scaling up is ineffective when dealing with a high number of concurrent users or queries."

- **主語 (S)**: scaling up（動名詞）
- **動詞 (V)**: is
- **補語 (C)**: ineffective
- **時間節**: when dealing with a high number of concurrent users or queries
- **文型**: SVC
- **注目ポイント**:
  - **"is ineffective when dealing with ~"**: 「〜を扱うときは無効・効果がない」。`ineffective`（= `not effective`、効果のない）が対比のキーワード。`when + 動名詞`（〜するとき）で無効な条件を示す
  - **"a high number of concurrent users or queries"**: 「多数の同時ユーザーまたは同時クエリ」。`a high number of ~`（多数の〜）で量の多さを示す

### 文4: "Instead, a multi-cluster virtual warehouse (scaling out) is utilized to accommodate an increased number of users and queries."

- **主語 (S)**: a multi-cluster virtual warehouse
- **動詞 (V)**: is utilized（受動態）
- **目的（to不定詞）**: to accommodate an increased number of users and queries
- **文型**: SV（受動態）
- **注目ポイント**:
  - **"Instead, ~"**: 「代わりに・そうではなく」。前文（スケールアップが無効）を受けて、正しい解決策（Multi-Cluster WH）を示す接続副詞
  - **"is utilized to accommodate ~"**: 「〜を収容するために利用される」。`utilize`（= `use`、利用する）の受動態 + `to accommodate`（〜を収容・対応する）で目的を示す
  - **"an increased number of users and queries"**: 「増加したユーザーとクエリの数」。`increased`（増加した）が `number of ~` を修飾。「増加分に対応する」というニュアンス

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| CPU-intensive | 形容詞 | CPU集約的な | Scale up improves performance for CPU-intensive queries. |
| ineffective | 形容詞 | 無効な・効果のない | Scaling up is ineffective for concurrent user problems. |
| accommodate | 動詞 | 収容する・対応する | Multi-cluster warehouses accommodate more users and queries. |
| Instead | 接続副詞 | 代わりに・そうではなく | Instead, use a multi-cluster warehouse for concurrency issues. |
| utilized | 過去分詞 | 利用される・活用される | Multi-cluster warehouses are utilized to handle concurrent queries. |

## 3-3. 解説文（日本語）

> クエリの複雑さと求められるパフォーマンスに基づいて、仮想ウェアハウスはスケールアップまたはダウンすることができます。一般的に、ウェアハウスのサイズを増やすとCPU集約的なクエリのクエリ速度が向上します。一方、多数の同時ユーザーまたは同時クエリを扱う場合、スケールアップは効果がありません。代わりに、ユーザーとクエリの増加に対応するためにマルチクラスター仮想ウェアハウス（スケールアウト）が利用されます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
