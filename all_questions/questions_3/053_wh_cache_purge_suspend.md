# 053: WH Cache Purge on Suspend

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-15
**正答**: True

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Warehouse Cache（ローカルディスクキャッシュ） | WHのローカルSSDに保存されるデータキャッシュ。WHサスペンド時に**パージ（削除）される** |
| Suspend（サスペンド） | WHを停止状態にすること。キャッシュがパージされ、課金が停止する |
| Resume（レジューム） | WHを再開すること。キャッシュはゼロから再構築される |

## 1-2. 重要コンセプトまとめ

- WHがサスペンドされると**ローカルキャッシュはパージされる**（True）
- レジューム後、キャッシュはクエリ実行に伴い**時間をかけて再構築**される
- つまり: サスペンド直後のレジュームではキャッシュの恩恵がなく、パフォーマンスが一時的に低下
- ローカルキャッシュからの読み取りはクラウドストレージからの読み取りより**はるかに効率的**

## 1-3. 公式ドキュメントURL

- [How Does Warehouse Caching Impact Queries?](https://docs.snowflake.com/en/user-guide/warehouses-considerations#how-does-warehouse-caching-impact-queries)

---

## 2-1. 問題文（英語）

> True or False. The local disk cache is purged when a virtual warehouse is suspended.
>
> A. True
> B. False

## 2-2. 問題文の文法解析

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| purged | verb | パージされる（削除される） | The cache is purged when suspended. |
| rebuilt over time | phrase | 時間をかけて再構築される | The cache is rebuilt over time. |

## 2-3. 問題文（日本語）

> 真/偽: 仮想ウェアハウスがサスペンドされると、ローカルディスクキャッシュはパージされる。

---

## 3-1. 解説文（英語）

> Every time a virtual warehouse accesses data from a table, it caches that data locally. This data cache can improve the performance of subsequent queries if those queries can reuse the data in the cache instead of reading from the table in the cloud storage. The warehouse cache is purged if the virtual warehouse is suspended. When the virtual house is resumed, the warehouse cache is rebuilt over time as queries are processed.

## 3-3. 解説文（日本語）

> WHがテーブルからデータにアクセスするたびにデータをローカルにキャッシュします。このキャッシュはクラウドストレージからの読み取りの代わりに再利用できれば後続クエリのパフォーマンスを向上させます。WHがサスペンドされるとキャッシュはパージされます。レジューム後、クエリ処理に伴いキャッシュは時間をかけて再構築されます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
