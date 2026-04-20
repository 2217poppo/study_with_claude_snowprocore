# 054: Snowsight — Multiple Concurrent Queries

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-03
**正答**: False（Snowsightは同時に複数クエリを実行できる）

> 関連問題: 004（Query History）・005（SnowSQL CLI）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Snowsight | SnowflakeのWebベースUIインターフェース。ブラウザからSQL実行・ダッシュボード・クエリ履歴確認などが可能 |
| Worksheet（ワークシート） | Snowsight上でSQLを書いて実行するタブ形式のエディタ。複数のワークシートを同時に開ける |
| Inactive Worksheet（非アクティブなワークシート） | 現在表示していないワークシート。表示していなくてもクエリは継続して実行される |
| Simultaneous Execution（同時実行） | 複数のクエリが同じタイミングで並行して実行されること。Snowsightでは複数ワークシートを通じてこれが可能 |

## 1-2. 重要コンセプトまとめ

- **Snowsightは複数クエリを同時実行できる（= `only one` は False）**:
  - 複数のワークシートをタブとして開ける
  - 別タブに切り替えても、元のワークシートのクエリは**バックグラウンドで継続実行**
  - → 複数クエリの並列実行が可能

- **「True or False」問題のパターン認識**:
  - `only one`・`cannot`・`always`・`never` などの**絶対表現**が含まれる → False になりやすい
  - この問題の `only one query at a given time` = 絶対的な制限を主張 → False

- **Snowsightのワークシート特性まとめ**:

  | 特性 | 内容 |
  |------|------|
  | 複数ワークシート | 同時に複数タブを開ける |
  | バックグラウンド実行 | 非アクティブでもクエリは継続 |
  | 並行実行数 | 複数（制限なし） |

## 1-3. 公式ドキュメントURL

- [Snowsight Overview](https://docs.snowflake.com/en/user-guide/ui-snowsight)

---

## 2-1. 問題文（英語）

> True or False: In Snowsight (Snowflake web user interface), you can execute only one query at a given time.
>
> A. False
> B. True

## 2-2. 問題文の文法解析

### 文1: "In Snowsight (Snowflake web user interface), you can execute only one query at a given time."

- **修飾語 (M)**: In Snowsight（Snowsightでは）← 場所を示す前置詞句
- **主語 (S)**: you（あなたは）
- **助動詞**: can（〜できる）
- **動詞 (V)**: execute（実行する）
- **目的語 (O)**: only one query（たった1つのクエリのみを）← `only` が制限を強調
- **修飾語 (M2)**: at a given time（ある時点において）← 「一度に」という意味
- **注目ポイント**: `only one ~ at a given time` = 「ある時点ではたった1つだけ」。絶対的な制限を主張する表現。True or False問題でこのような絶対表現があると False の可能性が高い

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| at a given time | 副詞句 | ある時点において・一度に | Only one process can run at a given time. → False |
| execute | 動詞 | 実行する | You can execute multiple queries simultaneously. |
| only one ~ | 数量表現 | たった1つだけ | Only one query? False — multiple are possible. |

## 2-3. 問題文（日本語）

> 正しい（True）か誤り（False）か：Snowsight（Snowflake WebUIインターフェース）では、ある時点において1つのクエリしか実行できない。
>
> A. False
> B. True

---

## 3-1. 解説文（英語）

> Multiple worksheets can be opened in Snowsight, each with a different query. The queries continue to execute even if the worksheets are inactive; thus, multiple queries can be executed simultaneously.

## 3-2. 解説文の文法解析

### 文1: "Multiple worksheets can be opened in Snowsight, each with a different query."

- **主語 (S)**: Multiple worksheets（複数のワークシートが）
- **動詞 (V)**: can be opened（開くことができる）← 受動態
- **修飾語 (M)**: in Snowsight（Snowsightで）
- **付帯状況**: each with a different query（それぞれが異なるクエリを持つ）← `each with ~` = 各要素が〜を持つ状態
- **注目ポイント**: `each with a different query` は `each [being] with a different query` の省略。「それぞれに別のクエリが入っている」という状態を簡潔に表す

### 文2: "The queries continue to execute even if the worksheets are inactive; thus, multiple queries can be executed simultaneously."

- **主語 (S)**: The queries（クエリは）
- **動詞 (V)**: continue to execute（実行し続ける）← `continue to do` = 〜し続ける
- **条件節**: even if the worksheets are inactive（ワークシートが非アクティブであっても）← `even if` = たとえ〜でも
- **接続副詞**: thus（したがって）← セミコロン後に論理的帰結を導く
- **帰結**: multiple queries can be executed simultaneously（複数のクエリが同時に実行できる）
- **注目ポイント**: `even if ~` = 「たとえ〜でも」。予想される障害（非アクティブ）を打ち消す強調表現。`continue to execute` = クエリがバックグラウンドで継続することを示す

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| each with ~ | 付帯状況句 | それぞれが〜を持つ | Multiple tabs, each with a different query. |
| continue to execute | 熟語 | 実行し続ける | Queries continue to execute in the background. |
| even if ~ | 接続詞 | たとえ〜でも | Queries run even if the worksheet is inactive. |
| thus | 接続副詞 | したがって | Data is not moved; thus, it is efficient. |
| simultaneously | 副詞 | 同時に | Multiple queries can be executed simultaneously. |
| inactive | 形容詞 | 非アクティブな・操作されていない | An inactive worksheet still runs queries. |

## 3-3. 解説文（日本語）

> Snowsightでは複数のワークシートを開くことができ、それぞれに異なるクエリを設定できます。ワークシートが非アクティブであってもクエリは実行し続けます。したがって、複数のクエリを同時に実行できます。

---

## 復習メモ

- [ ] Snowsightが複数クエリを同時実行できること（複数ワークシート・バックグラウンド継続実行）を説明できる
- [ ] True or False問題で `only one`・`at a given time` のような絶対表現に注意する習慣をつけた
- [ ] `even if ~`・`continue to execute`・`each with ~` の英語パターンを確認した
- [ ] この問題は理論問題のためサンドボックス検証は不要
