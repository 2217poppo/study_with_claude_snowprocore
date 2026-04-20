# 029: Clone and Load Metadata

**SnowPro Core Domain**: Domain 3 — Data Loading, Unloading, and Connectivity
**作成日**: 2026-04-02
**正答**: A (True)
- A. True（**選択済み・正解**）
- B. False（誤り・未選択）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Clone（クローン） | `CREATE TABLE ... CLONE` でテーブルのメタデータとデータポインタのコピーを作成する機能。実データはコピーしないため即時・コストゼロ |
| Load Metadata（ロードメタデータ） | COPY INTOでロード済みのファイルを追跡する内部情報。「このファイルはすでにロード済み」という重複防止の記録 |
| Source Table（ソーステーブル） | クローン元のテーブル |
| Cloned Table（クローンテーブル） | CREATE CLONE で作成されたテーブル。ロードメタデータは引き継がれない |

## 1-2. 重要コンセプトまとめ

- **クローンが「コピーするもの」と「しないもの」**:
  - ✅ コピーする: テーブルデータ（ポインタ経由）・スキーマ・制約
  - ❌ コピーしない: **ロードメタデータ**（これが今回の問題の核心）

- **なぜ重要か**:
  1. ソーステーブルにファイルXをCOPY INTO → ロードメタデータに「ファイルX: ロード済み」と記録
  2. テーブルをCLONE → クローンテーブルのロードメタデータは **空**
  3. クローンテーブルにファイルXをCOPY INTO → 「ロード済み」記録がないので **再度ロードできる**

- **ロードメタデータの役割**:
  - COPY INTO のデフォルト動作: 同じファイルを2回ロードしない（重複防止）
  - `FORCE = TRUE` オプションを使えばメタデータを無視して強制再ロード可能
  - クローンはメタデータが空なので FORCE なしでも再ロード可能

- **試験ポイント**: 「クローンはデータをコピーするが、ロードメタデータはコピーしない」→ 同じファイルをクローンテーブルに再度ロードできる = **True**

- **関連知識**:
  - COPY INTO のデフォルトは重複ロード防止（過去64日以内のロード履歴を参照）
  - クローン後のテーブルはロードメタデータがリセットされた状態 = 新規テーブルと同等の扱い

## 1-3. 公式ドキュメントURL

- [Table Cloning Considerations](https://docs.snowflake.com/en/user-guide/object-clone#table-cloning-considerations)

---

## 2-1. 問題文（英語）

> True or False: Files already loaded from a stage to a table can be loaded again into a cloned table.
>
> A. True
> B. False

## 2-2. 問題文の文法解析

### 文1: "Files already loaded from a stage to a table can be loaded again into a cloned table."

- **主語 (S)**: Files already loaded from a stage to a table
- **動詞 (V)**: can be loaded（受動態）
- **副詞**: again（「再び」）
- **修飾語 (M)**: into a cloned table
- **文型**: SV（受動態）+ M
- **注目ポイント**:
  - 「already loaded from a stage to a table」は過去分詞句で Files を後置修飾。「ステージからテーブルへすでにロード済みのファイル」
  - 「can be loaded again」の again が「再度」を示す。これが True かどうかが問い
  - 「cloned table」の cloned も過去分詞の前置修飾。「クローンされたテーブル」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| already loaded | 過去分詞句 | すでにロード済みの | Files already loaded cannot be re-loaded into the same table. |
| cloned table | 名詞句 | クローンテーブル | Load metadata is not copied to a cloned table. |
| again | adverb | 再び、もう一度 | Files can be loaded again into a cloned table. |
| from ~ to ~ | 前置詞句 | 〜から〜へ | Files are loaded from a stage to a table. |

## 2-3. 問題文（日本語）

> 正誤問題：ステージからテーブルへすでにロード済みのファイルは、クローンテーブルに再度ロードできる。
>
> A. True（正しい）
> B. False（誤り）

---

## 3-1. 解説文（英語）

> Cloning doesn't copy the load metadata of a cloned table. Therefore, the load metadata for a cloned table would be empty. Thus, files already loaded for the source table can be loaded again into the cloned table.

## 3-2. 解説文の文法解析

### 文1: "Cloning doesn't copy the load metadata of a cloned table."

- **主語 (S)**: Cloning（動名詞が主語）
- **動詞 (V)**: doesn't copy（否定）
- **目的語 (O)**: the load metadata of a cloned table
- **文型**: SVO（否定）
- **注目ポイント**:
  - 「Cloning」が動名詞として主語。「クローン（という行為）は」
  - 「load metadata of a cloned table」= 「クローンテーブルのロードメタデータ」。of が所属を示す

### 文2〜3: "Therefore, the load metadata for a cloned table would be empty. Thus, files already loaded for the source table can be loaded again into the cloned table."

- **Therefore / Thus**: 両方とも因果の接続副詞。「したがって」「そのため」
- **文2**: load metadata が空（would be empty）→ 条件を示す
- **文3**: 再ロードが可能（can be loaded again）→ 結論
- **注目ポイント**:
  - 「would be empty」の would は推論・必然的結果を示す。「（メタデータがコピーされないのだから）当然空になるだろう」
  - Therefore → Thus と2つの接続副詞で因果の連鎖を強調

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| load metadata | noun phrase | ロードメタデータ（ロード済みファイルの追跡情報） | Cloning doesn't copy the load metadata. |
| therefore | adverb | したがって（因果） | It's empty; therefore, files can be loaded again. |
| thus | adverb | したがって、そのため（therefore と同義） | Thus, the files can be re-loaded into the cloned table. |
| would be | modal | 〜になるだろう（必然的な結果・推論） | The metadata would be empty after cloning. |

## 3-3. 解説文（日本語）

> クローンはクローンテーブルのロードメタデータをコピーしません。したがって、クローンテーブルのロードメタデータは空になります。そのため、ソーステーブルに対してすでにロードされたファイルを、クローンテーブルに再度ロードすることができます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
