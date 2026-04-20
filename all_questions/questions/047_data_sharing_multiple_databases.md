# 047: Data Sharing Across Multiple Databases — Secure View Approach

**SnowPro Core Domain**: Domain 5 — Data Collaboration
**作成日**: 2026-04-03
**正答**: D（1つのデータベースにセキュアビューを作成して集約し、そのDBを共有）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Share（シェア） | データプロバイダーがコンシューマーと共有するオブジェクト。**1つのShareに追加できるデータベースは1つのみ**という制約がある |
| Secure View（セキュアビュー） | 定義を隠し、SQLの最適化も無効化するビュー。**他のデータベースのテーブルを参照するクロスデータベースビューを作成し、それをShareに含めることで複数DBのデータを共有できる** |
| Cross-Database Reference（クロスデータベース参照） | `database.schema.table` の形式で別データベースのオブジェクトを参照すること。セキュアビューの定義内でこれを使い、複数DBのデータを1つのビューに集約できる |
| Consolidate（集約する） | 複数の場所に散らばったデータを1つにまとめること。この問題のキーコンセプト |
| Data Copy（データコピー） | テーブルデータを物理的にコピーする方法。ストレージコスト増・同期管理が必要になるため非推奨 |
| Clone（クローン） | ゼロコピーでテーブルを複製する方法。クローン後はソースと独立するため、ソースの変更が反映されない。共有には不適切 |

## 1-2. 重要コンセプトまとめ

- **Shareの制約（この問題の核心）**: **1つのShareには1つのデータベースしか追加できない**
  - 複数DBのデータをShareするには工夫が必要

- **推奨アプローチ（正答D）**:
  1. 1つの「共有用データベース」を作成
  2. その中に**セキュアビュー**を作成し、複数DBのテーブルをクロスデータベース参照で集約
  3. この1つのデータベースをShareに追加

- **各選択肢が非推奨な理由**:
  | 選択肢 | 問題点 |
  |--------|--------|
  | A（DBごとにShare作成） | コンシューマー側に複数Shareを管理させる手間 / 非推奨 |
  | B（データをコピー） | ストレージコスト増・データの同期問題・Snowflakeの思想に反する |
  | C（クローンで新DB作成） | クローンはソースと独立するため変更が反映されない |
  | **D（セキュアビュー集約）** | **コスト不要・リアルタイム参照・1つのShareで完結** ← 正解 |

- **試験頻出ポイント**: 「複数データベースのデータをShareしたい」→ **セキュアビュー + 1つのDB** を想起する

## 1-3. 公式ドキュメントURL

- [Sharing Data from Multiple Databases](https://docs.snowflake.com/en/user-guide/data-sharing-mutiple-db)
- [Secure Data Sharing Overview](https://docs.snowflake.com/en/user-guide/data-sharing-intro)

---

## 2-1. 問題文（英語）

> You are required to share data from various tables in separate databases. What is the recommended approach to simplify the sharing process?
>
> A. Create one Share per database.
> B. Copy all data from the various tables into new tables in a new database. Share the new database.
> C. Clone tables from the separate databases into a new database. Share the new database.
> D. Create secure views in a single database to consolidate the data from various databases into a new database. Share the new database.

## 2-2. 問題文の文法解析

### 文1: "You are required to share data from various tables in separate databases."

- **主語 (S)**: You（あなたは）
- **動詞 (V)**: are required to（〜することが求められる）← 受動態 + to 不定詞
- **目的**: share data（データを共有すること）
- **修飾語 (M1)**: from various tables（様々なテーブルから）
- **修飾語 (M2)**: in separate databases（別々のデータベースにある）
- **注目ポイント**: `be required to ~` = 「〜することが求められる・要求される」。要件・制約を示す定番表現

### 選択肢D: "Create secure views in a single database to consolidate the data from various databases into a new database."

- **動詞 (V)**: Create（作成する）← 命令形
- **目的語 (O)**: secure views（セキュアビューを）
- **修飾語 (M1)**: in a single database（1つのデータベースに）
- **修飾語 (M2)**: to consolidate the data（データを集約するために）← 目的の to 不定詞
- **修飾語 (M3)**: from various databases（様々なデータベースから）
- **注目ポイント**: `consolidate` = 「集約する・統合する」。バラバラなデータを1か所にまとめる動詞

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| be required to ~ | 熟語 | 〜することが求められる | You are required to share data across databases. |
| consolidate | 動詞 | 集約する、統合する | Secure views consolidate data from multiple databases. |
| separate | 形容詞 | 別々の、独立した | Data resides in separate databases. |
| simplify | 動詞 | 簡素化する | The goal is to simplify the sharing process. |

## 2-3. 問題文（日本語）

> 別々のデータベースにある様々なテーブルのデータを共有することが求められています。共有プロセスを簡素化するための推奨アプローチはどれですか？
>
> A. データベースごとに1つのShareを作成する。
> B. 様々なテーブルのすべてのデータを新しいデータベースの新しいテーブルにコピーする。その新しいデータベースを共有する。
> C. 別々のデータベースからテーブルをクローンして新しいデータベースに入れる。その新しいデータベースを共有する。
> D. 1つのデータベースにセキュアビューを作成し、様々なデータベースのデータをその新しいデータベースに集約する。その新しいデータベースを共有する。

---

## 3-1. 解説文（英語）

> You may create a secure view if you need to share data from many tables in separate databases. Because several databases cannot be added to a single share, Snowflake suggests creating secure views within a single database and sharing that database.

## 3-2. 解説文の文法解析

### 文1: "You may create a secure view if you need to share data from many tables in separate databases."

- **主語 (S)**: You
- **動詞 (V)**: may create（作成してよい）← 許可・可能性の may
- **目的語 (O)**: a secure view（セキュアビューを）
- **条件節**: if you need to share data from many tables in separate databases（別々のDBの多くのテーブルからデータを共有する必要がある場合）
- **注目ポイント**: `may create` = 「作成することができる・してよい」。推奨策を柔らかく提示する表現

### 文2: "Because several databases cannot be added to a single share, Snowflake suggests creating secure views within a single database and sharing that database."

- **理由節**: Because several databases cannot be added to a single share（複数のデータベースを1つのShareに追加できないため）← Because + 受動態否定
- **主語 (S)**: Snowflake
- **動詞 (V)**: suggests（提案する・推奨する）
- **目的語 (O)**: creating secure views within a single database and sharing that database（1つのデータベース内にセキュアビューを作成し、そのデータベースを共有すること）← 動名詞の並列
- **注目ポイント**:
  - `suggest + 動名詞` = 「〜することを提案する・推奨する」。`recommend` と同様の使い方
  - 理由節（Because...）→ 主節という因果関係の構造が明確

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| suggest + 動名詞 | 熟語 | 〜することを提案する/推奨する | Snowflake suggests creating secure views. |
| within ~ | 前置詞 | 〜の中に・〜内で | Create secure views within a single database. |
| cannot be added to ~ | 受動態否定 | 〜に追加できない | Several databases cannot be added to a single share. |

## 3-3. 解説文（日本語）

> 別々のデータベースにある多くのテーブルからデータを共有する必要がある場合、セキュアビューを作成することができます。複数のデータベースを1つのShareに追加することはできないため、Snowflakeは1つのデータベース内にセキュアビューを作成し、そのデータベースを共有することを推奨しています。

---

## 復習メモ

- [ ] 「1つのShareに1つのデータベースのみ」という制約を覚えた
- [ ] 複数DBを共有する推奨アプローチ（セキュアビュー集約）を説明できる
- [ ] コピーとクローンが非推奨な理由を説明できる
- [ ] 英語の文法ポイント（suggest + 動名詞 / be required to / consolidate）を確認した
- [ ] この問題はデータ共有の設計理論のためサンドボックス検証は不要
