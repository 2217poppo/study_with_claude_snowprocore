# 058: Fail-Safe — Cannot Be Disabled

**SnowPro Core Domain**: Domain 5 — Data Collaboration (Fail-safe)
**作成日**: 2026-04-03
**正答**: False（Fail-Safeは無効化・設定変更できない）

> 関連問題: 015（Transient Table Time Travel）・056（Fail-Safe Access）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Fail-Safe（フェイルセーフ） | Time Travel終了後に追加7日間データを保持するSnowflakeの内部保護機能。**無効化・設定変更は一切不可**。アカウント・DB・スキーマ・テーブルレベルすべてで変更できない |
| Disable（無効化） | 機能をオフにすること。Fail-Safeはこれが**できない**。ユーザーが制御できる設定項目ではない |
| Transient Table（トランジェントテーブル） | Fail-Safeストレージが**ゼロ日**のテーブル種別。Fail-Safeの実質的な回避策として使える。Time Travelも最大1日に制限 |
| Temporary Table（テンポラリテーブル） | セッション内のみ存在するテーブル。Fail-Safeストレージが**ゼロ日**。TransientとFail-Safe期間は同じ |
| Permanent Table（パーマネントテーブル） | 通常テーブル。Fail-Safe = 7日間固定。変更・削除不可 |

## 1-2. 重要コンセプトまとめ

- **Fail-Safeは無効化できない**（= False）:
  - アカウントレベルでも設定変更不可
  - データベース・スキーマ・テーブルレベルでも変更不可
  - これはSnowflakeが管理する内部機能であり、ユーザーは設定できない

- **Fail-Safeをゼロにする唯一の方法 = Transient/Temporary Tableの使用**:

  | テーブル種別 | Fail-Safe期間 | Time Travel最大 |
  |------------|------------|--------------|
  | Permanent | **7日（固定・変更不可）** | 90日（エディション依存） |
  | Transient | **0日** | 1日 |
  | Temporary | **0日** | 1日 |

- **「entirely（完全に）」という語に注目**（試験の引っかけ）:
  - Fail-Safeを完全に無効化することは不可能
  - ただし、Transient/Temp Tableを使えばFail-Safeコストをゼロにできる（これは"disable"ではなく、対象外のテーブル種別を使う）

- **056との違い**: 056は「誰がFail-Safeを使えるか（Snowflakeサポートのみ）」。この問題は「Fail-Safeを無効化できるか（できない）」

## 1-3. 公式ドキュメントURL

- [Understanding & Using Fail-safe](https://docs.snowflake.com/en/user-guide/data-failsafe)
- [Transient & Temporary Tables](https://docs.snowflake.com/en/user-guide/tables-temp-transient)

---

## 2-1. 問題文（英語）

> True/False: It is possible to disable failsafe entirely for a Snowflake account.
>
> A. True
> B. False

## 2-2. 問題文の文法解析

### 文1: "It is possible to disable failsafe entirely for a Snowflake account."

- **形式主語**: It（形式主語、意味上の主語は `to disable failsafe entirely`）
- **動詞 (V)**: is
- **補語 (C)**: possible（可能である）
- **真の主語**: to disable failsafe entirely for a Snowflake account（Snowflakeアカウント全体でフェイルセーフを完全に無効化すること）← 不定詞句
- **注目ポイント**: `It is possible to do` = 「〜することが可能だ」。形式主語構文。True/False問題でこの構文が使われたら、実際に可能かどうかを慎重に判断する。`entirely` = 「完全に・すべて」という絶対表現が引っかけのシグナル

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| It is possible to do | 形式主語構文 | 〜することが可能だ | It is possible to resize a warehouse anytime. |
| disable | 動詞 | 無効化する・オフにする | Fail-safe cannot be disabled. |
| entirely | 副詞 | 完全に・すべて | You cannot disable fail-safe entirely. |

## 2-3. 問題文（日本語）

> 正しい（True）か誤り（False）か：Snowflakeアカウント全体でフェイルセーフを完全に無効化することは可能である。
>
> A. True
> B. False

---

## 3-1. 解説文（英語）

> Once the Time Travel period ends, Snowflake keeps the data for a further 7-day period as further protection. This fail-safe can not be disabled or configured. You can NOT change it for a Snowflake account, database, schema, or table. However, you can use Transient or Temporary tables, which have zero days of fail-safe storage.

## 3-2. 解説文の文法解析

### 文1: "Once the Time Travel period ends, Snowflake keeps the data for a further 7-day period as further protection."

- **時間節**: Once the Time Travel period ends（Time Travel期間が終わると）← `once` = 「〜したとたん」
- **主語 (S)**: Snowflake
- **動詞 (V)**: keeps（保持する）
- **目的語 (O)**: the data
- **修飾語1**: for a further 7-day period（さらに7日間）← `further` = 「さらなる・追加の」
- **修飾語2**: as further protection（さらなる保護として）← `as + 名詞` で役割を示す
- **注目ポイント**: `further` が2回使われている。`a further 7-day period` = 「さらに7日間」、`further protection` = 「追加の保護」。`further` = 「追加・それ以上の」

### 文2: "This fail-safe can not be disabled or configured."

- **主語 (S)**: This fail-safe
- **動詞 (V)**: can not be disabled or configured（無効化または設定変更できない）← 受動態否定
- **注目ポイント**: `disabled or configured` の2動詞を `or` で並列。どちらもできないことを簡潔に強調

### 文3: "You can NOT change it for a Snowflake account, database, schema, or table."

- **主語 (S)**: You
- **動詞 (V)**: can NOT change（変更できない）← 大文字の `NOT` で強調
- **目的語 (O)**: it（fail-safeを）
- **修飾語**: for a Snowflake account, database, schema, or table（アカウント・DB・スキーマ・テーブルのいずれのレベルでも）
- **注目ポイント**: 大文字の `NOT` = 強調の意図。列挙された4段階すべてで変更不可であることを明示

### 文4: "However, you can use Transient or Temporary tables, which have zero days of fail-safe storage."

- **接続副詞**: However（しかしながら）← 例外・代替手段を導く
- **主語 (S)**: you
- **動詞 (V)**: can use（使える）
- **目的語 (O)**: Transient or Temporary tables（TransientまたはTemporaryテーブルを）
- **非制限関係詞節**: which have zero days of fail-safe storage（フェイルセーフストレージがゼロ日のもの）← `which` は補足情報を追加
- **注目ポイント**: `zero days of ~` = 「〜がゼロ日間」。Transient/Temp Tableの特性を数値で示す

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| further | 形容詞/副詞 | さらなる・追加の | Data is kept for a further 7-day period. |
| be disabled or configured | 受動態 | 無効化または設定変更される | Fail-safe cannot be disabled or configured. |
| NOT（大文字） | 副詞（強調） | 絶対に〜ない（強調否定） | You can NOT change it at any level. |
| which have zero days of ~ | 非制限関係詞 | 〜がゼロ日間のもの | Tables which have zero days of fail-safe storage. |

## 3-3. 解説文（日本語）

> Time Travel期間が終わると、Snowflakeはデータをさらに7日間追加の保護として保持します。このフェイルセーフは無効化・設定変更ができません。Snowflakeのアカウント・データベース・スキーマ・テーブルのいずれのレベルでも変更することはできません。ただし、フェイルセーフストレージがゼロ日のTransientまたはTemporaryテーブルを使用することは可能です。

---

## 復習メモ

- [ ] Fail-Safeは無効化も設定変更もできないことを覚えた（アカウント・DB・スキーマ・テーブルすべて不可）
- [ ] Fail-Safeをゼロにする唯一の方法はTransient/Temporary Tableの使用だと理解した
- [ ] `further`（さらなる）・`entirely`・`It is possible to do` の英語パターンを確認した
- [ ] この問題は理論問題のためサンドボックス検証は不要
