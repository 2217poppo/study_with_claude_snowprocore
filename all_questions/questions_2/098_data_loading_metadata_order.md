# 098: Data Loading Metadata and Order

**SnowPro Core Domain**: Domain 3 — Data Loading, Unloading, and Connectivity
**作成日**: 2026-04-14
**正答**: A, C

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Load Metadata | データロード時にSnowflakeが作成するメタデータ。ファイル名・タイムスタンプを保存し、重複ロードを防止 |
| File Loading Order | ファイルのロード順序。Snowflakeは到着順でのロードを**保証しない** |

## 1-2. 重要コンセプトまとめ

- Snowflakeはロードメタデータを**維持する**（ファイル名・タイムスタンプ）
- ロードメタデータで**重複ロードを防止**
- ファイルの到着順でのロードは**保証しない**
- この2点がセットで出題される

## 1-3. 公式ドキュメントURL

- [Data Loading Considerations](https://docs.snowflake.com/en/user-guide/data-load-considerations-load)

---

## 2-1. 問題文（英語）

> Which of the following is true regarding data loading in Snowflake?
>
> A. Snowflake does not ensure that files are loaded in the order they arrived.
> B. Snowflake guarantees that files are loaded in the order they arrived.
> C. Snowflake maintains load metadata to track processed files.
> D. Snowflake does not maintain any load metadata for tracking processed files.

## 2-2. 問題文の文法解析

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| ensure | verb | 保証する | Does not ensure the order. |
| guarantee | verb | 保証する | Does not guarantee loading order. |
| maintain | verb | 維持する | Maintains load metadata. |

## 2-3. 問題文（日本語）

> Snowflakeのデータロードに関して正しいのはどれですか？
>
> A. Snowflakeはファイルが到着順にロードされることを保証しない。
> B. Snowflakeはファイルが到着順にロードされることを保証する。
> C. Snowflakeは処理済みファイルを追跡するためにロードメタデータを維持する。
> D. Snowflakeは処理済みファイルを追跡するためのロードメタデータを維持しない。

---

## 3-1. 解説文（英語）

> Each time data is loaded, metadata is created, called load metadata. The load metadata stores a variety of information, such as the name of every file that was loaded into that table and the time stamp corresponding to the time that a file was loaded. By utilizing this load metadata, Snowflake ensures that it will not reprocess a previously loaded file. Snowflake doesn't ensure that the files are loaded in the order they arrived.

## 3-3. 解説文（日本語）

> データがロードされるたびに、ロードメタデータと呼ばれるメタデータが作成されます。ロードメタデータは様々な情報を保存します。Snowflakeはこのメタデータを利用して、以前ロードされたファイルを再処理しないことを保証します。Snowflakeはファイルが到着順にロードされることは保証しません。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
