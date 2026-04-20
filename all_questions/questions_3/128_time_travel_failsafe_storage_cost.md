# 128: Time Travel & Fail-Safe — Storage Cost (True/False)

**SnowPro Core Domain**: Domain 5 — Data Collaboration, Marketplace, and Sharing
**作成日**: 2026-04-17
**正答**: False（Time TravelとFail-safeのストレージは無料ではない）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Time Travel Storage（タイムトラベルストレージ） | Time Travel期間中（Standard版: 最大1日、Enterprise版以上: 最大90日）に保持されるデータのコピー。有料 |
| Fail-Safe Storage（フェイルセーフストレージ） | Time Travel期間終了後に7日間保持されるデータ。Snowflakeによる内部災害復旧用。有料 |
| CDP Storage Cost（CDPストレージコスト） | Continuous Data Protection（CDP）の一環としてTime TravelとFail-safeに発生するストレージコスト |
| Continuous Data Protection (CDP) | Snowflakeが提供するデータ保護の仕組み。Time Travel + Fail-safeの2層構造 |
| Storage Calculation（ストレージ計算） | Time Travel/Fail-safeのコストは24時間ごとに計算される。保持日数と最終変更からの経過時間に基づく |

## 1-2. 重要コンセプトまとめ

- **Time TravelとFail-safeのストレージは有料（無料ではない）**
  - どちらも余分なストレージを消費するため、ストレージコストが発生する
  - 「無料」という選択肢は誤り → 答えはFalse
- **コスト計算の仕組み**
  - 24時間ごとに計算される
  - 保持日数 × 最終変更からの経過時間に基づく
  - 変更が多いほどコストが高くなる傾向がある
- **Fail-safeのストレージに関する注意**
  - Fail-safeは無効化できない（コストを削減する方法なし）
  - Transient/TemporaryテーブルにはFail-safeがない（= コスト削減の方法）
  - Fail-safeのデータはSnowflakeのサポートのみがアクセス可能（ユーザーは不可）
- **コスト削減の方法**
  - Transientテーブルを使用する（Fail-safeなし・Time Travel 0または1日のみ）
  - データ保持期間（DATA_RETENTION_TIME_IN_DAYS）を短縮する
- **ストレージコストの全体像（試験で覚えること）**
  - 通常データ + Time Travel分 + Fail-safe分 = 合計ストレージコスト

## 1-3. 公式ドキュメントURL

- [CDP Storage Costs](https://docs.snowflake.com/en/user-guide/data-cdp-storage-costs)
- [Understanding Storage Costs for Time Travel and Fail-Safe](https://docs.snowflake.com/en/user-guide/data-cdp-storage-costs)

---

## 2-1. 問題文（英語）

> True or False: Data in Time Travel and fail-safe storage is stored free of charge by Snowflake.
>
> A. False
> B. True

## 2-2. 問題文の文法解析

### 文1: "True or False: Data in Time Travel and fail-safe storage is stored free of charge by Snowflake."

- **形式**: True or False問題（真偽問題）
- **主語 (S)**: Data in Time Travel and fail-safe storage
- **動詞 (V)**: is stored（受動態）
- **様態の副詞句**: free of charge（無料で）
- **行為者**: by Snowflake
- **文型**: SV（受動態）
- **注目ポイント**: 
  - `free of charge` = 無料で（chargeは「料金」、free of = 〜がない）
  - `is stored free of charge` = 無料で保存される（これがFalseだと知っていれば正解）
  - `Data in Time Travel and fail-safe storage` = Time TravelとFail-safeストレージ内のデータ

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| free of charge | 副詞句 | 無料で | Time Travel storage is NOT stored free of charge. |
| True or False | 問題形式 | 真偽問題 | True or False questions require binary answers. |
| fail-safe | 名詞/形容詞 | フェイルセーフ | Fail-safe data is protected by Snowflake for 7 days. |

## 2-3. 問題文（日本語）

> 真偽問題: SnowflakeはTime TravelとFail-safeストレージ内のデータを無料で保存している。
>
> A. 誤り（False）
> B. 正しい（True）

---

## 3-1. 解説文（英語）

> Snowflake charges for Time Travel and failsafe data storage. The cost of maintaining data for Time Travel and fail-safe is calculated every 24 hours based on the number of days it is maintained and the time since it was last modified.
>
> https://docs.snowflake.com/en/user-guide/data-cdp-storage-costs

## 3-2. 解説文の文法解析

### 文1: "Snowflake charges for Time Travel and failsafe data storage."

- **主語 (S)**: Snowflake
- **動詞 (V)**: charges for（〜に対して料金を請求する）
- **目的語 (O)**: Time Travel and failsafe data storage
- **文型**: SVO
- **注目ポイント**: 
  - `charge for ~` = 〜に対して料金を請求する（`charge`の自動詞用法）
  - シンプルな一文で「有料である」を断言

### 文2: "The cost of maintaining data for Time Travel and fail-safe is calculated every 24 hours based on the number of days it is maintained and the time since it was last modified."

- **主語 (S)**: The cost of maintaining data for Time Travel and fail-safe
- **動詞 (V)**: is calculated（受動態）
- **頻度の副詞句**: every 24 hours
- **基準の副詞句**: based on the number of days it is maintained and the time since it was last modified
- **文型**: SV（受動態）
- **注目ポイント**: 
  - `every 24 hours` = 24時間ごとに（頻度の表現）
  - `based on A and B` = AとBに基づいて（2つの基準を and で並列）
  - `the number of days it is maintained` = 保持されている日数（関係節で具体化）
  - `the time since it was last modified` = 最後に変更されてからの時間（since節）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| charge for | 句動詞 | 〜に対して料金を請求する | Snowflake charges for Time Travel storage. |
| every 24 hours | 副詞句 | 24時間ごとに | Storage costs are calculated every 24 hours. |
| since it was last modified | 時間節 | 最後に変更されてから | Cost is based on the time since it was last modified. |
| maintain | 動詞 | 維持する、保持する | Data is maintained for the retention period. |

## 3-3. 解説文（日本語）

> SnowflakeはTime TravelとFail-safeのデータストレージに対して料金を請求します。Time TravelとFail-safeのデータを維持するコストは、保持日数と最後に変更されてからの時間に基づいて24時間ごとに計算されます。

---

## 復習メモ

- [ ] Time TravelとFail-safeのストレージは有料であることを覚えた（True or FalseはFalse）
- [ ] コストは24時間ごとに計算され、保持日数と最終変更時刻に基づくことを把握した
- [ ] `free of charge`（無料で）と `charge for ~`（〜に対して料金を請求する）の使い方を確認した
