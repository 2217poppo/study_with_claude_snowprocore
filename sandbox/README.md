# Snowflake サンドボックス接続ガイド

## 初期セットアップ

以下のSQLを順番に実行して、学習用の環境を構築する:

```
sandbox/setup/00_create_database.sql  -- DB・WH作成
sandbox/setup/01_shared_tables.sql    -- 共有テーブル作成
```

## 接続方法

### 1. Snowsight（WebUI）— 手動実行
1. Snowflakeアカウントにブラウザでログイン
2. ワークシートを開く
3. `sandbox/exercises/` 内のSQLをコピー&ペーストして実行

### 2. Snowflake公式MCP — Claude Codeから直接実行
`.mcp.json` を設定すると、Claude CodeからSnowflakeに直接クエリを実行できる。
設定方法はプロジェクトルートの `.mcp.json` を参照。

### 3. Cortex Code CLI
Snowflakeの提供するCLIツールで実行する。

## 共有オブジェクト一覧

`sandbox/setup/` で作成される共有オブジェクト:

| オブジェクト | 種類 | 用途 |
|-------------|------|------|
| SNOWPRO_STUDY | Database | 学習用データベース |
| STUDY_WH | Warehouse | X-Small、自動サスペンド60秒 |
| sample_sales | Table | 売上データ（集約、Time Travel、クラスタリング等） |
| sample_customers | Table | 顧客データ（JOIN、マスキング、データ共有等） |

## コスト注意事項
- STUDY_WH は AUTO_SUSPEND = 60 に設定済み（60秒で自動停止）
- 演習後に `ALTER WAREHOUSE STUDY_WH SUSPEND;` で手動停止も可能
- トライアルアカウントのクレジットに注意
