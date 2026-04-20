# 006: Secure UDF

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-02
**正答**: A と B の両方（複数選択）
- A. Secure UDF does not use specific SQL optimizations.（正しい選択・未選択）
- B. Secure UDFs don't allow unauthorized users to see the UDF definition.（選択済み・正解）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| UDF (User-Defined Function) | ユーザーが独自に定義した関数。SQLまたはJavaScript/Python/Java等で記述し、クエリ内で呼び出せる。処理のカプセル化・再利用に使う。 |
| Secure UDF（セキュアUDF） | 通常のUDFにセキュリティ制限を加えたもの。①UDFの定義（コード）を所有者ロール以外から隠す、②SQL最適化を無効化してデータの間接アクセスを防ぐ、という2つの特徴を持つ。 |
| SQL Optimization（SQL最適化） | Snowflakeがクエリを効率化するために行う内部処理（インライン展開など）。通常のUDFではこれが適用されるが、最適化の副作用として本来見せてはいけないデータに間接的にアクセスできてしまう場合がある。 |
| UDF Definition（UDF定義） | UDFのソースコード・ロジック部分。Secure UDFでは所有者ロールを付与されたユーザーのみが参照できる。通常のUDFはDESCRIBE等で誰でも定義を閲覧できる。 |
| Secure View（セキュアビュー） | Secure UDFと同様のコンセプトをビューに適用したもの。定義の隠蔽とSQL最適化の無効化という同じ2つの特性を持つ。 |

## 1-2. 重要コンセプトまとめ

- **Secure UDF の2つの特徴**（両方が正答）:
  1. **SQL最適化を使用しない** — 最適化の副作用でデータが間接的に漏れるのを防ぐ
  2. **UDF定義を権限のないユーザーから隠す** — 所有者ロールを持つユーザーのみ定義を閲覧可能
- **この問題は複数選択（AとBの両方）**。Bだけ選んで不完全だった点に注意
- 通常のUDFとSecure UDFの比較:

  | 特性 | 通常UDF | Secure UDF |
  |------|---------|-----------|
  | SQL最適化 | 適用される | 適用されない |
  | UDF定義の可視性 | 誰でも閲覧可 | 所有者ロールのみ |
  | パフォーマンス | 速い（最適化あり） | やや遅い（最適化なし） |

- **誤答の整理**:
  - C「管理者のみ実行可能」→ 誤り。所有者ロールを付与されたユーザーなら誰でも実行可
  - D「機械語でコンパイル」→ 誤り。SQLやJavaScript/Python等で記述する
- **試験ポイント**: Secure UDFとSecure Viewは同じ2つの特性を持つ。セットで覚える

## 1-3. 公式ドキュメントURL

- [Secure UDFs and Stored Procedures](https://docs.snowflake.com/en/developer-guide/secure-udf-procedure)
- [User-Defined Functions Overview](https://docs.snowflake.com/en/developer-guide/udf/udf-overview)

---

## 2-1. 問題文（英語）

> How does a secure UDF differ from a typical UDF?
>
> A. Secure UDF does not use specific SQL optimizations.
> B. Secure UDFs don't allow unauthorized users to see the UDF definition.
> C. Secure UDFs can only be executed by administrators.
> D. Secure UDFs are written in machine language and are compiled into Snowflake's code.

## 2-2. 問題文の文法解析

### 文1: "How does a secure UDF differ from a typical UDF?"

- **疑問副詞**: How（「どのように」）
- **助動詞**: does（疑問文の倒置）
- **主語 (S)**: a secure UDF
- **動詞 (V)**: differ（原形）
- **修飾語 (M)**: from a typical UDF（比較対象を示す前置詞句）
- **文型**: How + 助動詞 + S + V + M
- **注目ポイント**:
  - 「differ from ~」は「～と異なる」。比較問題の定番フレーズ
  - 「How does A differ from B?」は「AはBとどう違うか？」。2つの概念の違いを問う試験頻出パターン
  - 「typical」は「一般的な、通常の」。「typical UDF」= 普通のUDF

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| differ from | verb phrase | ～と異なる | How does a secure UDF differ from a typical one? |
| typical | adjective | 一般的な、通常の | A typical UDF can be viewed by any user. |
| unauthorized | adjective | 権限のない、認可されていない | Unauthorized users cannot see the UDF definition. |
| compiled | adjective/verb | コンパイルされた | The code is compiled into machine language. |

## 2-3. 問題文（日本語）

> セキュアUDFは通常のUDFとどのように異なりますか？
>
> A. セキュアUDFは特定のSQL最適化を使用しない。
> B. セキュアUDFは権限のないユーザーがUDFの定義を参照することを許可しない。
> C. セキュアUDFは管理者のみが実行できる。
> D. セキュアUDFは機械語で記述され、Snowflakeのコードにコンパイルされる。

---

## 3-1. 解説文（英語）

> Specific SQL UDF optimizations may allow data that should be hidden from users to be accessed indirectly via different techniques. Secure UDFs do not use these SQL optimizations, ensuring that users have no access to the underlying data, even indirectly. Furthermore, Secure UDFs allow only authorized users to see the definition and information of secure UDFs (i.e., users who are granted the role that owns the UDF).

## 3-2. 解説文の文法解析

### 文1: "Specific SQL UDF optimizations may allow data that should be hidden from users to be accessed indirectly via different techniques."

- **主語 (S)**: Specific SQL UDF optimizations
- **動詞 (V)**: may allow（助動詞 may + 動詞）
- **目的語 (O)**: data that should be hidden from users（関係詞節付き）
- **補語（複合目的語）**: to be accessed indirectly（allow + O + to不定詞）
- **修飾語 (M)**: via different techniques
- **文型**: S + may allow + O + to不定詞 + M
- **注目ポイント**:
  - 「allow + O + to be + 過去分詞」は「Oが～されることを許してしまう」。意図しない結果を示す
  - 「that should be hidden from users」: 関係詞節で「ユーザーから隠されるべき」データを特定
  - 「indirectly」：間接的に。直接ではなく最適化の副作用として漏れることを示す

### 文2: "Secure UDFs do not use these SQL optimizations, ensuring that users have no access to the underlying data, even indirectly."

- **主語 (S)**: Secure UDFs
- **動詞 (V)**: do not use（否定）
- **目的語 (O)**: these SQL optimizations
- **分詞構文**: ensuring that users have no access to the underlying data（結果・付帯状況）
- **強調**: even indirectly（「間接的にさえも」）
- **文型**: SVO + 分詞構文
- **注目ポイント**:
  - 「ensuring that ~」は「～を保証して、確実に～にして」。結果を示す分詞構文
  - 「have no access to ~」は「～にアクセスできない」。「no + 名詞」で完全否定
  - 「even indirectly」の even は強調「間接的にさえも（=いかなる形でも）」

### 文3: "Furthermore, Secure UDFs allow only authorized users to see the definition and information of secure UDFs (i.e., users who are granted the role that owns the UDF)."

- **接続副詞**: Furthermore（さらに）
- **主語 (S)**: Secure UDFs
- **動詞 (V)**: allow
- **目的語 (O)**: only authorized users（only で限定）
- **不定詞**: to see the definition and information of secure UDFs
- **挿入句**: i.e., users who are granted the role that owns the UDF
- **文型**: S + allow + O + to不定詞
- **注目ポイント**:
  - 「i.e.」は「id est」（ラテン語）の略で「すなわち、つまり」。定義や言い換えに使う
  - 「users who are granted the role that owns the UDF」: 二重の関係詞節（role を that節が修飾）
  - 「only authorized users」: only による限定が重要。管理者限定ではなく「所有ロールを持つユーザー」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| indirectly | adverb | 間接的に | Data can be accessed indirectly via optimization side effects. |
| ensuring that | 分詞構文 | ～を確実にして、保証して | Secure UDFs skip optimizations, ensuring data privacy. |
| furthermore | adverb | さらに、加えて | Furthermore, the UDF definition is hidden from others. |
| i.e. | 略語 | すなわち、つまり（言い換え） | Authorized users (i.e., those with the owner role) can view it. |
| be granted | 受動態 | 付与される、与えられる | Users who are granted the role can see the definition. |

## 3-3. 解説文（日本語）

> 特定のSQL UDF最適化により、ユーザーから隠されるべきデータに、さまざまな手法を通じて間接的にアクセスできてしまう場合があります。セキュアUDFはこれらのSQL最適化を使用しないことで、ユーザーが基となるデータに間接的にさえもアクセスできないことを保証します。さらに、セキュアUDFは権限のあるユーザー（すなわち、UDFを所有するロールを付与されたユーザー）のみがセキュアUDFの定義と情報を参照することを許可します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
