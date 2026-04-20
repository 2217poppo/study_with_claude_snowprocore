# 052: Warehouse Cache Private

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-13
**正答**: True

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Virtual Warehouse Cache（ウェアハウスキャッシュ） | ウェアハウスのローカルSSDに保存されるデータキャッシュ。テーブルからスキャンしたデータを保持し、後続クエリで再利用。各ウェアハウスに**プライベート**で共有不可 |
| Local Disk Cache | ウェアハウスキャッシュの別名。ウェアハウスのローカルディスクに保存されるため「local disk cache」とも呼ばれる |
| Query Result Cache | Cloud Servicesレイヤーに保存されるクエリ結果のキャッシュ。ウェアハウスキャッシュとは別物。ウェアハウス不要で再利用可能 |
| Cloud Storage | Snowflakeのデータが永続的に保存される場所（S3/Azure Blob/GCS）。ウェアハウスキャッシュはここからの読み取りを減らす |

## 1-2. 重要コンセプトまとめ

- ウェアハウスキャッシュは各ウェアハウスに **プライベート（private）** で **共有不可**
- WH-AがキャッシュしたデータをWH-Bは利用できない
- キャッシュの動作フロー:
  1. クエリ実行 → テーブルデータをCloud Storageから読み取り
  2. 読み取ったデータをローカルSSDにキャッシュ
  3. 後続クエリ → キャッシュから読み取り（Cloud Storageへのアクセス不要）
- 3種類のキャッシュの比較:

| キャッシュ | 保存場所 | 共有 | WH必要 |
|-----------|---------|------|--------|
| Query Result Cache | Cloud Services Layer | 可 | 不要 |
| Warehouse Cache | ウェアハウスのローカルSSD | **不可** | 必要 |
| Metadata Cache | Cloud Services Layer | 可 | 不要 |

## 1-3. 公式ドキュメントURL

- [How Does Warehouse Caching Impact Queries?](https://docs.snowflake.com/en/user-guide/warehouses-considerations#how-does-warehouse-caching-impact-queries)

---

## 2-1. 問題文（英語）

> True or False. A virtual warehouse cache or the local disk cache is private to the virtual warehouse and can not be shared with other virtual warehouses.
>
> A. False
> B. True

## 2-2. 問題文の文法解析

### 文1: "A virtual warehouse cache or the local disk cache is private to the virtual warehouse and can not be shared with other virtual warehouses."

- **主語 (S)**: A virtual warehouse cache or the local disk cache
- **動詞 (V)**: is / can not be shared（並列）
- **補語/修飾語**: private to the virtual warehouse / with other virtual warehouses
- **文型**: SVC + SV（受動態）
- **注目ポイント**: `private to ~` は「～にとってプライベートな」。`A ~ or the ~` で2つの名称が同じものを指すことを示す。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| private to ~ | phrase | ～にとってプライベートな | The cache is private to the warehouse. |
| local disk cache | noun | ローカルディスクキャッシュ | Data is cached on local disk. |
| subsequent | adjective | 後続の、その後の | Improves subsequent query performance. |

## 2-3. 問題文（日本語）

> 真か偽か。仮想ウェアハウスキャッシュまたはローカルディスクキャッシュは、その仮想ウェアハウスにプライベートであり、他の仮想ウェアハウスと共有できない。
>
> A. 偽
> B. 真

---

## 3-1. 解説文（英語）

> Every time a virtual warehouse accesses data from a table, it caches that data locally. This data cache can improve the performance of subsequent queries if those queries can reuse the data in the cache instead of reading from the table in the cloud storage. The warehouse cache is local to a virtual warehouse and can not be shared with other virtual warehouses.

## 3-2. 解説文の文法解析

### 文1: "Every time a virtual warehouse accesses data from a table, it caches that data locally."

- **主語 (S)**: it（= virtual warehouse）
- **動詞 (V)**: caches
- **目的語 (O)**: that data
- **修飾語 (M)**: Every time a virtual warehouse accesses data from a table（条件節）、locally（副詞）
- **文型**: SVO
- **注目ポイント**: `Every time ~` は「～するたびに」。自動キャッシュの仕組みを説明。

### 文2: "This data cache can improve the performance of subsequent queries if those queries can reuse the data in the cache instead of reading from the table in the cloud storage."

- **主語 (S)**: This data cache
- **動詞 (V)**: can improve
- **目的語 (O)**: the performance of subsequent queries
- **修飾語 (M)**: if those queries can reuse ~（条件節）、instead of reading from ~（代替）
- **文型**: SVO
- **注目ポイント**: `instead of ~ing` は「～する代わりに」。キャッシュヒット時の利点を説明。

### 文3: "The warehouse cache is local to a virtual warehouse and can not be shared with other virtual warehouses."

- **主語 (S)**: The warehouse cache
- **動詞 (V)**: is / can not be shared（並列）
- **補語**: local to a virtual warehouse
- **文型**: SVC + SV
- **注目ポイント**: `local to ~` は「～にローカルな」。プライベート性を2つの表現（local to / can not be shared）で強調。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| every time ~ | phrase | ～するたびに | Every time a warehouse accesses data. |
| instead of ~ing | phrase | ～する代わりに | Instead of reading from cloud storage. |
| local to ~ | phrase | ～にローカルな | The cache is local to the warehouse. |

## 3-3. 解説文（日本語）

> 仮想ウェアハウスがテーブルからデータにアクセスするたびに、そのデータをローカルにキャッシュします。このデータキャッシュは、後続のクエリがクラウドストレージのテーブルから読み取る代わりにキャッシュ内のデータを再利用できる場合、パフォーマンスを向上させることができます。ウェアハウスキャッシュは仮想ウェアハウスにローカルであり、他の仮想ウェアハウスとは共有できません。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
