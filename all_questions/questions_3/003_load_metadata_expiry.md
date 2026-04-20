# 003: Load Metadata Expiry

**SnowPro Core Domain**: Domain 3 — Data Loading, Unloading, and Connectivity
**作成日**: 2026-04-14
**正答**: True

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Load Metadata（ロードメタデータ） | ファイルロード時にSnowflakeが作成するメタデータ。ファイル名・タイムスタンプを記録し重複ロードを防止。**64日後に期限切れ** |
| Load Status（ロードステータス） | ファイルがロード済みかどうかの状態。メタデータ期限切れ後は「undetermined（不明）」となり、そのファイルはスキップされる |

## 1-2. 重要コンセプトまとめ

- ファイルロード後、Snowflakeはメタデータに**ロード済みとマーク**する（True）
- ロードメタデータの重要な数字: **64日で期限切れ**
- 64日を過ぎたファイルはロードステータスが「undetermined」→ Snowflakeは**スキップ**する
- メタデータに保存される情報: ファイル名 + ロード時のタイムスタンプ

## 1-3. 公式ドキュメントURL

- [Load Metadata](https://docs.snowflake.com/en/user-guide/data-load-considerations-load#load-metadata)

---

## 2-1. 問題文（英語）

> True or False: When a file has been loaded into a table, Snowflake marks that file as loaded in the metadata so that the file does not get processed again.
>
> A. True
> B. False

## 2-2. 問題文の文法解析

### 文1: "When a file has been loaded into a table, Snowflake marks that file as loaded in the metadata so that the file does not get processed again."

- **主語 (S)**: Snowflake
- **動詞 (V)**: marks
- **目的語 (O)**: that file
- **補語 (C)**: as loaded（SVOC構文）
- **修飾語 (M)**: When a file has been loaded into a table（条件）、in the metadata（場所）、so that the file does not get processed again（目的）
- **文型**: SVOC
- **注目ポイント**: `mark O as C` は「OをCとしてマークする」。`so that ~ does not ~` は「～しないように」。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| mark ~ as loaded | phrase | ～をロード済みとしてマーク | Marks that file as loaded. |
| expire | verb | 期限が切れる | Load metadata expires after 64 days. |
| undetermined | adjective | 不明な | Load status is undetermined. |
| skip over | phrasal verb | スキップする | Snowflake skips over older files. |

## 2-3. 問題文（日本語）

> 真/偽: ファイルがテーブルにロードされると、Snowflakeはそのファイルがメタデータにロード済みとマークし、再処理されないようにする。

---

## 3-1. 解説文（英語）

> The load metadata stores a variety of information, such as the name of every file that was loaded into that table and the time stamp corresponding to the time that a file was loaded. By utilizing this load metadata, Snowflake ensures that it will not reprocess a previously loaded file. The load metadata expires after 64 days. Snowflake skips over any older files for which the load status is undetermined.

## 3-2. 解説文の文法解析

### 文1: "The load metadata expires after 64 days."

- **注目ポイント**: **64日**という具体的な数字が重要。試験で問われる。

### 文2: "Snowflake skips over any older files for which the load status is undetermined."

- **注目ポイント**: `for which` は関係代名詞。64日経過後のファイルはステータスが不明となりスキップされる。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| expires after ~ days | phrase | ～日後に期限切れになる | Metadata expires after 64 days. |
| for which | phrase | そのための（関係代名詞） | Files for which the status is undetermined. |

## 3-3. 解説文（日本語）

> ロードメタデータはファイル名やロード時刻のタイムスタンプなど様々な情報を保存します。このロードメタデータを利用して、Snowflakeは以前ロードされたファイルを再処理しないことを保証します。ロードメタデータは64日後に期限切れになります。Snowflakeはロードステータスが不明な古いファイルをスキップします。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
