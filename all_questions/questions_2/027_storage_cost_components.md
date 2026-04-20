# 027: Storage Cost Components in Snowflake

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-10
**正答**: A（Time Travel Storage）, B（Fail-Safe Storage）, D（Permanent Table Storage）
**ユーザー回答**: D（Permanent Table Storage）✅, E（Cached Results）❌ — Time Travel StorageとFail-Safe Storageを見落とし

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Permanent Table Storage（永続テーブルストレージ） | 永続テーブルに保存されたデータのストレージ。**ストレージコストに含まれる** |
| Time Travel Storage（タイムトラベルストレージ） | Time Travel機能のために保持される過去データのストレージ。**ストレージコストに含まれる**。Permanent Tableは最大90日分、Transient/Temporaryは最大1日分 |
| Fail-Safe Storage（フェイルセーフストレージ） | Time Travel期間終了後にSnowflakeが7日間保持するデータのストレージ。**ストレージコストに含まれる**。Transient/Temporaryテーブルには適用されない |
| Metadata Cache（メタデータキャッシュ） | Cloud Services Layerが管理するテーブル・列の統計情報。**ストレージコストに含まれない** |
| Query Result Cache（クエリ結果キャッシュ） | Cloud Services Layerが保持する過去のクエリ結果。**ストレージコストに含まれない** |
| Warehouse Cache（ウェアハウスキャッシュ） | 仮想ウェアハウスのローカルSSDに保存されるデータキャッシュ。**ストレージコストに含まれない** |
| Temporary Table（テンポラリテーブル） | セッション内のみ存在するテーブル。ストレージコストはセッション中のみ発生。Fail-Safeなし・Time Travel最大1日 |
| Transient Table（トランジェントテーブル） | セッションをまたいで存在するが、Fail-Safeなし・Time Travel最大1日のテーブル。DROPまたはデータクリアまでストレージコスト発生 |

## 1-2. 重要コンセプトまとめ

- **ストレージコストに含まれるもの（3つ）**:
  1. **Permanent Table Storage** — テーブルデータ本体
  2. **Time Travel Storage** — 過去データの保持
  3. **Fail-Safe Storage** — 災害復旧用の7日間保持

- **ストレージコストに含まれないもの**:
  - ❌ **Cached Results（キャッシュ）** — すべてのキャッシュはストレージコストに含まれない
  - ❌ **Metadata** — Cloud Services Layerの一部

- **キャッシュの種類と所属レイヤー**:

| キャッシュ | 所属レイヤー | ストレージコスト |
|-----------|------------|----------------|
| Query Result Cache | Cloud Services Layer | **なし** |
| Metadata Cache | Cloud Services Layer | **なし** |
| Warehouse Cache（Local Disk Cache） | Virtual Warehouse | **なし** |

- **テーブル種別とストレージコストの関係**:

| テーブル種別 | テーブルデータ | Time Travel | Fail-Safe |
|-------------|-------------|-------------|-----------|
| **Permanent** | ✅ | 最大90日分 | 7日分 |
| **Transient** | ✅（DROP/クリアまで） | 最大1日分 | **なし** |
| **Temporary** | ✅（セッション中のみ） | 最大1日分 | **なし** |

- **ユーザーのミス**: Cached Resultsを選択 → キャッシュはストレージコストに含まれない。Time Travel StorageとFail-Safe Storageを見落とし

## 1-3. 公式ドキュメントURL

- [Understanding Overall Cost](https://docs.snowflake.com/en/user-guide/cost-understanding-overall)
- [Storage Costs](https://docs.snowflake.com/en/user-guide/cost-understanding-compute#data-storage)

---

## 2-1. 問題文（英語）

> Which of the following contributes towards the storage costs in Snowflake?
>
> Select all that apply.
>
> A. Time Travel Storage
> B. Fail-Safe Storage
> C. Metadata
> D. Permanent Table Storage
> E. Cached Results

## 2-2. 問題文の文法解析

### 文1: "Which of the following contributes towards the storage costs in Snowflake?"

- **疑問詞+主語 (S)**: Which of the following（次のうちどれが）
- **動詞 (V)**: contributes towards（〜に寄与する）
- **目的語 (O)**: the storage costs（ストレージコストに）
- **修飾語 (M)**: in Snowflake（Snowflakeにおいて）
- **文型**: SVO（疑問文）
- **注目ポイント**:
  - `contribute towards ~` — 「〜に寄与する、〜の一因となる」。コスト計算に含まれるかどうかを問う表現
  - `Select all that apply` — 「該当するものをすべて選択」。複数正解の問題

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| contribute towards ~ | verb phrase | 〜に寄与する、〜の一因となる | Time Travel storage contributes towards storage costs. |
| count towards ~ | verb phrase | 〜に算入される | Data in permanent tables counts towards storage costs. |
| cumbersome | adj | 面倒な、厄介な | Manual recovery is a cumbersome process. |

## 2-3. 問題文（日本語）

> Snowflakeのストレージコストに寄与するのは次のうちどれですか？
>
> 該当するものをすべて選択してください。
>
> A. Time Travelストレージ
> B. Fail-Safeストレージ
> C. メタデータ
> D. 永続テーブルストレージ
> E. キャッシュされた結果

---

## 3-1. 解説文（英語）

> Data stored in permanent tables counts towards the storage costs.
>
> Data stored in temporary & transient tables also contribute towards the storage costs until they are dropped or data is cleared.
>
> Data in Fail-safe storage & Time Travel storage also contribute to the storage costs.
>
> Transient and temporary tables, however, do not contribute towards Fail-safe storage costs and have a maximum of 1-day Time Travel costs.
>
> Caching is NOT considered for determining storage costs.
>
> The query result cache & metadata cache are part of the cloud services layer.
>
> The warehouse cache (local disk cache) is part of a virtual warehouse and does NOT contribute to storage costs.

## 3-2. 解説文の文法解析

### 文1: "Data stored in permanent tables counts towards the storage costs."

- **主語 (S)**: Data stored in permanent tables（永続テーブルに保存されたデータは）— 過去分詞の後置修飾
- **動詞 (V)**: counts towards（〜に算入される）
- **目的語 (O)**: the storage costs（ストレージコストに）
- **文型**: SVO
- **注目ポイント**: `count towards ~` = `contribute towards ~`（同義表現）

### 文2: "Data stored in temporary & transient tables also contribute towards the storage costs until they are dropped or data is cleared."

- **主語 (S)**: Data stored in temporary & transient tables（Temporary・Transientテーブルのデータも）
- **動詞 (V)**: contribute towards（寄与する）
- **修飾語 (M)**: until they are dropped or data is cleared（DROPされるかデータがクリアされるまで）
- **文型**: SVO + until時間節
- **注目ポイント**: `until ~` でストレージコストが発生する期間の終了条件を示す

### 文3: "Caching is NOT considered for determining storage costs."

- **主語 (S)**: Caching（キャッシュは）
- **動詞 (V)**: is NOT considered（考慮されない）— 否定の受動態
- **目的 (M)**: for determining storage costs（ストレージコストの決定にあたって）
- **文型**: SV（受動態）
- **注目ポイント**: `NOT` が大文字で強調されている。キャッシュはストレージコストに**一切含まれない**

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| count towards ~ | verb phrase | 〜に算入される | Permanent table data counts towards storage costs. |
| until ~ are dropped | conj phrase | DROPされるまで | Transient tables incur costs until they are dropped. |
| is NOT considered | verb phrase | 考慮されない | Caching is NOT considered for storage costs. |
| contribute to ~ | verb phrase | 〜に寄与する | Fail-safe storage contributes to storage costs. |

## 3-3. 解説文（日本語）

> 永続テーブルに保存されたデータはストレージコストに算入されます。
>
> Temporary・Transientテーブルに保存されたデータも、DROPされるかデータがクリアされるまでストレージコストに寄与します。
>
> Fail-SafeストレージとTime Travelストレージのデータもストレージコストに寄与します。
>
> ただし、TransientテーブルとTemporaryテーブルはFail-Safeストレージコストには寄与せず、Time Travelコストは最大1日分のみです。
>
> キャッシュはストレージコストの決定において考慮されません。
>
> クエリ結果キャッシュとメタデータキャッシュはCloud Services Layerの一部です。
>
> ウェアハウスキャッシュ（ローカルディスクキャッシュ）は仮想ウェアハウスの一部であり、ストレージコストには寄与しません。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
