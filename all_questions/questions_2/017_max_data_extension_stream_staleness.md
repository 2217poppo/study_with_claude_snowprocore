# 017: MAX_DATA_EXTENSION_TIME_IN_DAYS and Stream Staleness

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-09
**正答**: The maximum number of days that Snowflake can extend the data retention period for a table to prevent the Stream on the table from becoming stale.

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Stream（ストリーム） | テーブルへのDML変更（INSERT/UPDATE/DELETE）を追跡するオブジェクト。最後のオフセット以降の変更差分をクエリできる。長期間消費されないと**stale（陳腐化）** する |
| Stale Stream（陳腐化したストリーム） | データ保持期間を超えてストリームが消費されなかった場合に発生する状態。staleになったストリームからはデータを読み取れなくなる。再作成が必要 |
| MAX_DATA_EXTENSION_TIME_IN_DAYS | テーブルのデータ保持期間をストリームのために**自動延長できる最大日数**を制御するパラメータ。デフォルト14日。ストリームがstaleになることを防止する |
| DATA_RETENTION_TIME_IN_DAYS | Time Travel用のデータ保持期間を日数で指定するパラメータ。Standard版で最大1日、Enterprise以上で最大90日 |
| Stream Offset（ストリームオフセット） | ストリームが最後に消費された位置を示すポインタ。このオフセット以降の変更が次回のクエリ対象となる |
| Fail-Safe | データ保持期間後にSnowflakeが内部的に保持する7日間の復旧用ストレージ。ストリームとは無関係 |

## 1-2. 重要コンセプトまとめ

- **MAX_DATA_EXTENSION_TIME_IN_DAYSの役割**: ストリームがstaleにならないよう、ソーステーブルのデータ保持期間を**自動的に延長**できる最大日数を制御する
- **自動延長の仕組み**:
  - ストリームが消費されていない場合、SnowflakeはDATA_RETENTION_TIME_IN_DAYSの設定をストリームのオフセットまで**自動的に延長**する
  - この延長はDATA_RETENTION_TIME_IN_DAYSが14日未満の場合に発生
  - エディションに関係なく適用される（`No matter your Snowflake Edition`）
- **ストレージコストへの影響**: 自動延長によりデータ保持期間が長くなるため、ストレージコストが増加する。コスト管理のためにMAX_DATA_EXTENSION_TIME_IN_DAYSで制限可能
- **ひっかけ選択肢**: Fail-Safe・Transient Table・Query Result Cacheはすべてストリームとは無関係
- **間違えやすいポイント**: DATA_RETENTION_TIME_IN_DAYS（Time Travel期間）とMAX_DATA_EXTENSION_TIME_IN_DAYS（ストリーム用の延長上限）を混同しない

## 1-3. 公式ドキュメントURL

- [Streams: Data Retention Period and Staleness](https://docs.snowflake.com/en/user-guide/streams-intro#data-retention-period-and-staleness)
- [MAX_DATA_EXTENSION_TIME_IN_DAYS Parameter](https://docs.snowflake.com/en/sql-reference/parameters#max-data-extension-time-in-days)

---

## 2-1. 問題文（英語）

> The MAX_DATA_EXTENSION_TIME_IN_DAYS parameter controls which aspect of a stream?
>
> A. The maximum number of days Snowflake keeps data in Fail Safe storage.
> B. The maximum duration for which results persist in the query result cache.
> C. The maximum number of days Snowflake keeps data in Transient tables.
> D. The maximum number of days that Snowflake can extend the data retention period for a table to prevent the Stream on the table from becoming stale.

## 2-2. 問題文の文法解析

### 文1: "The MAX_DATA_EXTENSION_TIME_IN_DAYS parameter controls which aspect of a stream?"

- **主語 (S)**: The MAX_DATA_EXTENSION_TIME_IN_DAYS parameter（MAX_DATA_EXTENSION_TIME_IN_DAYSパラメータは）
- **動詞 (V)**: controls（制御する）
- **目的語 (O)**: which aspect of a stream（ストリームのどの側面を）
- **文型**: SVO（疑問文）
- **注目ポイント**:
  - `controls which aspect` — 間接疑問文が目的語。「どの側面を制御するか」
  - `aspect` — 「側面、観点」。機能の一面を問う際の汎用的な名詞

### 選択肢D: "The maximum number of days that Snowflake can extend the data retention period for a table to prevent the Stream on the table from becoming stale."

- **主要名詞句**: The maximum number of days（最大日数）
- **関係詞節**: that Snowflake can extend the data retention period for a table（Snowflakeがテーブルのデータ保持期間を延長できる）
- **目的 (M)**: to prevent the Stream on the table from becoming stale（テーブル上のストリームがstaleになることを防ぐために）
- **注目ポイント**:
  - `prevent ~ from becoming stale` — 「〜がstaleになることを防ぐ」。`prevent O from doing` 構文
  - `extend the data retention period` — 「データ保持期間を延長する」。この問題のコア概念

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| aspect | 名詞 | 側面、観点 | Which aspect of the stream does this parameter control? |
| extend | 動詞 | 延長する | Snowflake can extend the data retention period automatically. |
| data retention period | 名詞句 | データ保持期間 | The data retention period determines how long data is kept. |
| prevent ~ from becoming | 動詞句 | 〜が〜になることを防ぐ | This parameter prevents the stream from becoming stale. |
| stale | 形容詞 | 陳腐化した、古くなった | A stale stream cannot be queried for changes. |

## 2-3. 問題文（日本語）

> MAX_DATA_EXTENSION_TIME_IN_DAYSパラメータは、ストリームのどの側面を制御しますか？
>
> A. SnowflakeがFail-Safeストレージにデータを保持する最大日数
> B. クエリ結果キャッシュに結果が保持される最大期間
> C. Snowflakeがトランジェントテーブルにデータを保持する最大日数
> D. テーブル上のストリームがstale（陳腐化）になることを防ぐために、Snowflakeがテーブルのデータ保持期間を延長できる最大日数

---

## 3-1. 解説文（英語）

> Maximum number of days Snowflake may extend table data retention to prevent stale streams. No matter your Snowflake Edition, Snowflake temporarily extends the DATA_RETENTION_TIME_IN_DAYS setting for a source table to the stream's offset if it's less than 14 days and a stream hasn't been consumed. To reduce storage costs for data retention or compliance, limit this automatic extension time with the MAX_DATA_EXTENSION_TIME_IN_DAYS parameter.

## 3-2. 解説文の文法解析

### 文1: "Maximum number of days Snowflake may extend table data retention to prevent stale streams."

- **名詞句 (S)**: Maximum number of days（最大日数）
- **主語 (S)**: Snowflake
- **動詞 (V)**: may extend（延長しうる）
- **目的語 (O)**: table data retention（テーブルのデータ保持を）
- **目的 (M)**: to prevent stale streams（staleストリームを防ぐために）
- **文型**: SVO + to不定詞（目的）
- **注目ポイント**: `may extend` — 可能性の助動詞。「延長することがある」

### 文2: "No matter your Snowflake Edition, Snowflake temporarily extends the DATA_RETENTION_TIME_IN_DAYS setting for a source table to the stream's offset if it's less than 14 days and a stream hasn't been consumed."

- **譲歩節 (M)**: No matter your Snowflake Edition（Snowflakeのエディションに関係なく）
- **主語 (S)**: Snowflake
- **動詞 (V)**: temporarily extends（一時的に延長する）
- **目的語 (O)**: the DATA_RETENTION_TIME_IN_DAYS setting for a source table（ソーステーブルのDATA_RETENTION_TIME_IN_DAYS設定を）
- **方向 (M)**: to the stream's offset（ストリームのオフセットまで）
- **条件節 (M)**: if it's less than 14 days and a stream hasn't been consumed（14日未満で、ストリームが消費されていない場合）
- **文型**: SVO + if条件節
- **注目ポイント**:
  - `No matter ~` — 「〜に関係なく」。譲歩の表現。`Regardless of ~` と同義
  - `temporarily extends` — 「一時的に延長する」。恒久的な変更ではないことを `temporarily` で明示
  - `hasn't been consumed` — 現在完了受動態。「（まだ）消費されていない」

### 文3: "To reduce storage costs for data retention or compliance, limit this automatic extension time with the MAX_DATA_EXTENSION_TIME_IN_DAYS parameter."

- **目的 (M)**: To reduce storage costs for data retention or compliance（ストレージコスト削減やコンプライアンスのために）
- **動詞 (V)**: limit（制限する）— 命令形
- **目的語 (O)**: this automatic extension time（この自動延長時間を）
- **手段 (M)**: with the MAX_DATA_EXTENSION_TIME_IN_DAYS parameter（MAX_DATA_EXTENSION_TIME_IN_DAYSパラメータで）
- **文型**: VO（命令文）
- **注目ポイント**: 命令形で推奨アクションを提示。コスト管理の観点からパラメータ制限を推奨

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| no matter ~ | 接続詞句 | 〜に関係なく | No matter the edition, the extension applies. |
| temporarily | 副詞 | 一時的に | Snowflake temporarily extends the retention period. |
| consumed | 過去分詞 | 消費された | If a stream hasn't been consumed, it may become stale. |
| offset | 名詞 | オフセット（位置情報） | The stream's offset tracks the last consumed position. |
| compliance | 名詞 | コンプライアンス、法令遵守 | Limit extension time for compliance requirements. |
| automatic extension | 名詞句 | 自動延長 | Limit the automatic extension time to control costs. |

## 3-3. 解説文（日本語）

> Snowflakeがテーブルのデータ保持を延長してstaleストリームを防止できる最大日数です。Snowflakeのエディションに関係なく、ストリームが消費されておらず、DATA_RETENTION_TIME_IN_DAYSが14日未満の場合、Snowflakeはソーステーブルの設定をストリームのオフセットまで一時的に延長します。ストレージコスト削減やコンプライアンスのために、MAX_DATA_EXTENSION_TIME_IN_DAYSパラメータでこの自動延長時間を制限できます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
