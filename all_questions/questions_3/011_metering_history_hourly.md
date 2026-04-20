# 011: METERING_HISTORY Hourly Credit Usage

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-15
**正答**: METERING_HISTORY

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| METERING_HISTORY | ACCOUNT_USAGEスキーマのビュー。**時間単位**のクレジット使用データを提供。開始/終了時刻、サービス別（WH・Snowpipe・Automatic Clustering等）の内訳を含む |
| METERING_DAILY_HISTORY | **日単位**のクレジット使用データ。時間単位ではない |
| WAREHOUSE_LOAD_HISTORY | WHの負荷履歴。クレジット使用量ではなくクエリ負荷情報 |
| WAREHOUSE_EVENTS_HISTORY | WHのイベント履歴（サスペンド・レジューム等） |

## 1-2. 重要コンセプトまとめ

- 時間単位のクレジット使用量 = **METERING_HISTORY**
- サービス別の内訳: Virtual Warehouse, Snowpipe, Automatic Clustering等
- METERING_DAILY_HISTORYは日単位（時間単位ではない）
- WAREHOUSE系ビューはWHの負荷/イベント情報であり、クレジット使用量ではない

## 1-3. 公式ドキュメントURL

- [METERING_HISTORY](https://docs.snowflake.com/en/sql-reference/account-usage/metering_history)

---

## 2-1. 問題文（英語）

> Which of the following ACCOUNT_USAGE view can be used to view credit usage by hour?
>
> A. METERING_HISTORY
> B. WAREHOUSE_LOAD_HISTORY
> C. METERING_DAILY_HISTORY
> D. WAREHOUSE_EVENTS_HISTORY

## 2-3. 問題文（日本語）

> 時間単位のクレジット使用量を表示するACCOUNT_USAGEビューはどれですか？

---

## 3-1. 解説文（英語）

> The METERING_HISTORY provides the credit usage data at an hourly level. The view provides the start and end times during which credit usage occurred. It also provides a breakup of the information according to the service that contributed to the credit usage, such as Virtual Warehouse compute usage, Snowpipe, Automatic Clustering, etc.

## 3-3. 解説文（日本語）

> METERING_HISTORYは時間単位のクレジット使用データを提供します。クレジット使用が発生した開始/終了時刻、およびクレジット使用に寄与したサービス（WH・Snowpipe・Automatic Clustering等）別の内訳も提供します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
