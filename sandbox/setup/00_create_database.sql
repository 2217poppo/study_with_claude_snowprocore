-- ============================================
-- SnowPro Core 学習用 初期セットアップ
-- 最初に1回だけ実行する
--
-- 事前準備:
--   cp .env.example .env
--   .env を開いて DB_NAME / WH_NAME を自分の環境に合わせて変更する
--
-- 実行方法:
--   Snowsight : source .env && envsubst < sandbox/setup/00_create_database.sql
--               → 出力されたSQLをSnowsightにコピペして実行
--   SnowSQL   : source .env && envsubst < sandbox/setup/00_create_database.sql | snowsql
-- ============================================

-- データベース作成
CREATE DATABASE IF NOT EXISTS ${DB_NAME};

-- ウェアハウス作成（X-Small、60秒で自動サスペンド）
CREATE WAREHOUSE IF NOT EXISTS ${WH_NAME}
  WITH WAREHOUSE_SIZE = 'XSMALL'
  AUTO_SUSPEND = 60
  AUTO_RESUME = TRUE
  INITIALLY_SUSPENDED = TRUE;

-- デフォルト設定
USE DATABASE ${DB_NAME};
USE WAREHOUSE ${WH_NAME};
USE SCHEMA PUBLIC;
