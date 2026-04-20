# 052: Snowpark — Supported Languages

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-03
**正答**: A・B・C（Python / Scala / Java — すべて正解）

> 関連問題: 009（UDF Types）・006（Secure UDF）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Snowpark | Snowflake上でPython・Scala・Javaのコードを直接実行できる開発フレームワーク。SQLを書かずにDataFrame APIでデータ処理ができる。処理はSnowflake内部で実行されるためデータ移動が不要 |
| DataFrame API | Snowparkの主要なインターフェース。テーブルデータを「DataFrame」として扱い、メソッドチェーンでデータ変換・集計・フィルタリングを行う。Apache SparkのDataFrameに類似した設計 |
| Python（Snowpark） | Snowparkで最も広く使われる言語。データサイエンス・機械学習ワークフローとの相性が良い |
| Scala（Snowpark） | JVM言語。Snowparkの最初の対応言語。Apache Sparkに慣れた開発者に親しみやすい |
| Java（Snowpark） | JVM言語。エンタープライズ開発者がSnowflakeをネイティブに利用できる。ScalaとともにJVM上で動作 |

## 1-2. 重要コンセプトまとめ

- **Snowparkが対応する3言語**（すべて正解）:
  - **Python**
  - **Scala**
  - **Java**

- **試験ポイント**: 「JavaScriptは？」「R は？」「SQL は？」→ Snowparkの対象外。JavaScriptはUDFとして使えるが、Snowparkとは別の仕組み

- **Snowparkの特徴**:
  - データをSnowflakeの外に出さずにコードを実行（セキュア・効率的）
  - DataFrame APIを使ってSQL相当の処理をプログラム言語で記述
  - Snowpark ML（機械学習パイプライン）にも使用される

- **UDFとの違い**（006・009と関連）:

  | | UDF | Snowpark |
  |---|---|---|
  | 目的 | 関数定義（単一の処理単位） | データパイプライン全体の構築 |
  | 対応言語 | SQL・JavaScript・Python・Java・Scala等 | Python・Scala・Java |
  | 実行場所 | クエリ内に組み込まれて実行 | Snowflakeサーバー上で独立実行 |

## 1-3. 公式ドキュメントURL

- [Snowpark Developer Guide](https://docs.snowflake.com/en/developer-guide/snowpark/index)

---

## 2-1. 問題文（英語）

> Snowpark supports which of the following languages? Select all that apply.
>
> A. Python
> B. Scala
> C. Java

## 2-2. 問題文の文法解析

### 文1: "Snowpark supports which of the following languages?"

- **主語 (S)**: Snowpark
- **動詞 (V)**: supports（サポートする）
- **目的語 (O)**: which of the following languages（以下の言語のうちどれを）
- **注目ポイント**: 通常の疑問文 `Which languages does Snowpark support?` と語順が異なる。`Snowpark supports which ~?` は疑問詞が目的語位置に残る**埋め込み疑問**のような語順で、技術試験問題に特有のやや形式的な文体

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| Snowpark | 固有名詞 | SnowflakeのデータフレームAPIフレームワーク | Snowpark supports Python, Scala, and Java. |
| language | 名詞 | （プログラミング）言語 | Which programming languages does it support? |

## 2-3. 問題文（日本語）

> Snowparkは以下の言語のうちどれをサポートしていますか？当てはまるものをすべて選択してください。
>
> A. Python
> B. Scala
> C. Java

---

## 3-1. 解説文（英語）

> Java, Scala & Python are all supported by Snowpark.

## 3-2. 解説文の文法解析

### 文1: "Java, Scala & Python are all supported by Snowpark."

- **主語 (S)**: Java, Scala & Python（JavaとScalaとPythonは）← 3つの名詞が `&` で並列
- **副詞**: all（すべて）← 主語全体を強調する副詞。`are` と `supported` の間に挿入
- **動詞 (V)**: are supported（サポートされている）← 受動態
- **動作主**: by Snowpark（Snowparkによって）
- **注目ポイント**: `are all supported` の `all` は「例外なく全員」を強調する副詞。`All of them are supported` と同義だが `are all + 過去分詞` はより簡潔で試験解説文に頻出

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| are all + 過去分詞 | 副詞強調受動態 | すべて〜される（例外なく全員が対象） | Java, Scala & Python are all supported. |
| A & B & C | 並列表現 | AとBとC（`and` の代わりに `&` を使う略記法） | Java, Scala & Python are supported. |

## 3-3. 解説文（日本語）

> Java、Scala、PythonはすべてSnowparkによってサポートされています。

---

## 復習メモ

- [ ] Snowparkの対応3言語（Python・Scala・Java）を言える
- [ ] JavaScriptやRはSnowpark非対応（UDFとは別）であることを覚えた
- [ ] `are all supported by ~` の英語パターンを確認した
- [ ] この問題は理論問題のためサンドボックス検証は不要
