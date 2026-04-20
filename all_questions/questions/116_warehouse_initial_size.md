# 116: Warehouse Initial Size — Trial and Experiment

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-06
**正答**: Try different types of queries and warehouse sizes to find the optimum fit for your query needs and workload.
**ユーザー回答**: "Choose X-Small virtual warehouse to conserve costs."（不正解）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Initial Warehouse Size（初期ウェアハウスサイズ） | 新しい仮想ウェアハウスを作成する際の最初のサイズ選択。**正しいアプローチは実験（試行錯誤）**であり、コスト最小化や最大サイズへの固定ではない |
| Workload（ワークロード） | ウェアハウスが処理するクエリ・ジョブの総体。クエリの種類・複雑さ・同時実行数などによって最適なウェアハウスサイズが変わる |
| Optimum Fit（最適な適合） | 特定のクエリ要件とワークロードに対して最も適したウェアハウスサイズ・構成の組み合わせ。試行錯誤によって見つける |

## 1-2. 重要コンセプトまとめ

- **正解: 試行錯誤（Experiment）が正しいアプローチ** — 異なるサイズで実際のクエリを試して最適なサイズを見つける
- **不正解の選択肢の落とし穴**:
  - 「X-Smallを選んでコスト節約」→ コスト最小化が目的ではなく、**クエリパフォーマンスとコストのバランス**を見つけることが目的
  - 「Snowflakeに問い合わせる」→ 自分のワークロードを最もよく知っているのは管理者自身
  - 「5X-Largeを選んでパフォーマンス保証」→ オーバースペックになりコストが無駄になる
- **公式推奨アプローチ**:
  1. 定義されたクエリセットを用意する
  2. 複数のウェアハウスサイズ（例: X-Large, Large, Medium）で実行する
  3. クエリパフォーマンスとコストを比較する
  4. 最適な組み合わせを決定する
- **試行錯誤の重要性**: ワークロードは組織・業務によって異なるため、一概に「このサイズが最適」とは言えない

## 1-3. 公式ドキュメントURL

- [Selecting an Initial Warehouse Size](https://docs.snowflake.com/en/user-guide/warehouses-considerations#selecting-an-initial-warehouse-size)

---

## 2-1. 問題文（英語）

> What is the best way for a system administrator to determine the initial size of a new virtual warehouse?
>
> A. Try different types of queries and warehouse sizes to find the optimum fit for your query needs and workload. ✅
> B. Choose X-Small virtual warehouse to conserve costs.
> C. Contact Snowflake to get help with determining the right size for your organization.
> D. Choose 5X-Large virtual warehouse size to ensure performance.

## 2-2. 問題文の文法解析

### 文1: "What is the best way for a system administrator to determine the initial size of a new virtual warehouse?"

- **主語 (S)**: What（疑問詞）
- **動詞 (V)**: is
- **補語 (C)**: the best way for a system administrator to determine the initial size of a new virtual warehouse
- **文型**: SVC（疑問文）
- **注目ポイント**:
  - **"the best way for ~ to do"**: 「〜が〜するための最善の方法」。`the best way`（最善の方法）+ `for A to do`（AがするためのBest way）。`for + 名詞 + to不定詞` が `way` の内容を限定する
  - **"to determine the initial size"**: 「初期サイズを決定するために」。`determine`（決定する・判断する）は試験でよく登場する意思決定の動詞

### 選択肢A: "Try different types of queries and warehouse sizes to find the optimum fit for your query needs and workload."

- **動詞 (V)**: Try（命令形）
- **目的語 (O)**: different types of queries and warehouse sizes
- **目的（to不定詞）**: to find the optimum fit for your query needs and workload
- **文型**: VO（命令文）
- **注目ポイント**:
  - **"Try different types of ~ and ~"**: 「様々な〜と〜を試してみる」。`Try`（試す）命令形で実験的アプローチを推奨
  - **"the optimum fit"**: 「最適な適合・最も合ったもの」。`optimum`（最適な）は `optimal` と同義。`fit`（適合・ぴったり合うもの）で「要件に合ったサイズ」を示す
  - **"for your query needs and workload"**: 「あなたのクエリニーズとワークロードに対して」。組織固有の要件を示す `your`（あなたの）が重要

### 選択肢B: "Choose X-Small virtual warehouse to conserve costs."

- **注目ポイント**:
  - **"to conserve costs"**: 「コストを節約するために」。`conserve`（節約する・保護する）+ `costs`（コスト）。これが**誤り** — コスト節約が優先ではなく、パフォーマンスとコストのバランスを見つけることが優先

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| determine | 動詞 | 決定する・判断する | Determine the initial warehouse size through experimentation. |
| optimum | 形容詞 | 最適な | Find the optimum fit for your query needs. |
| workload | 名詞 | ワークロード・作業負荷 | The optimal size depends on your specific workload. |
| conserve | 動詞 | 節約する・保護する | Choosing X-Small to conserve costs is not the best approach. |

## 2-3. 問題文（日本語）

> システム管理者が新しい仮想ウェアハウスの初期サイズを決定するための最善の方法はどれか？
>
> A. 異なる種類のクエリとウェアハウスサイズを試して、クエリニーズとワークロードに最適なものを見つける。✅
> B. コストを節約するためにX-Smallの仮想ウェアハウスを選択する。
> C. 組織に適したサイズを決定するためにSnowflakeに問い合わせる。
> D. パフォーマンスを保証するために5X-Largeの仮想ウェアハウスサイズを選択する。

---

## 3-1. 解説文（英語）

> Experiment with a defined set of queries against various warehouse sizes (e.g., X-Large, Large, Medium) warehouse sizes to determine the optimal combination for your specific query requirements and workload.

## 3-2. 解説文の文法解析

### 文1: "Experiment with a defined set of queries against various warehouse sizes (e.g., X-Large, Large, Medium) warehouse sizes to determine the optimal combination for your specific query requirements and workload."

- **動詞 (V)**: Experiment with（命令形 + 句動詞）
- **目的語 (O)**: a defined set of queries
- **基準 (M1)**: against various warehouse sizes
- **具体例**: (e.g., X-Large, Large, Medium)
- **目的（to不定詞）**: to determine the optimal combination for your specific query requirements and workload
- **文型**: VO（命令文）
- **注目ポイント**:
  - **"Experiment with ~"**: 「〜で実験する・〜を試してみる」。`experiment with ~`（〜で実験する）は科学的・系統的な試行錯誤を示す。`Try ~` より「計画的な実験」のニュアンス
  - **"a defined set of queries"**: 「定義されたクエリセット」。`a defined set of`（定義された一群の）は「ランダムではなく計画的に選んだ代表的なクエリ群」を示す
  - **"against various warehouse sizes"**: 「様々なウェアハウスサイズに対して」。Q114でも登場した `against ~`（〜に対して・〜と照らし合わせて）で「複数サイズを比較基準として」を示す
  - **"the optimal combination"**: 「最適な組み合わせ」。`optimal`（最適な）= `optimum`（問題文）。クエリセットとWHサイズの**組み合わせ**を見つけることが目標

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| Experiment with ~ | 動詞句 | 〜で実験する・試してみる | Experiment with various warehouse sizes to find the best fit. |
| a defined set of ~ | 名詞句 | 定義された一群の〜 | Use a defined set of queries to test warehouse performance. |
| optimal combination | 名詞句 | 最適な組み合わせ | Determine the optimal combination for your workload. |
| specific | 形容詞 | 特定の・固有の | Find the optimal size for your specific query requirements. |

## 3-3. 解説文（日本語）

> 特定のクエリ要件とワークロードに最適な組み合わせを決定するために、定義されたクエリセットを様々なウェアハウスサイズ（例: X-Large, Large, Medium）に対して実験してください。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
