-- ============================================
-- SnowPro Core 学習用 初期セットアップ
-- 最初に1回だけ実行する
-- ============================================

-- データベース作成
CREATE DATABASE IF NOT EXISTS SNOWPRO_STUDY;

-- ウェアハウス作成（X-Small、60秒で自動サスペンド）
CREATE WAREHOUSE IF NOT EXISTS STUDY_WH
  WITH WAREHOUSE_SIZE = 'XSMALL'
  AUTO_SUSPEND = 60
  AUTO_RESUME = TRUE
  INITIALLY_SUSPENDED = TRUE;

-- デフォルト設定
USE DATABASE SNOWPRO_STUDY;
USE WAREHOUSE STUDY_WH;
USE SCHEMA PUBLIC;
