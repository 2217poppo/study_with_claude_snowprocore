---
name: sandbox-doc
description: 指定した問題番号に対して、Snowflakeサンドボックスでの検証手順ドキュメントとSQLスクリプトを作成する。
argument-hint: <NNN_topic_name（例: 001_view_history）>
allowed-tools: [Read, Write, Edit, Glob, Grep]
---

# サンドボックス検証手順の作成

指定された問題に対して、Snowflakeサンドボックスでのハンズオン検証手順を作成する。

## 環境変数

このスキルが使用する環境設定の一覧。実際の値は `.env.example` を参照する。

| 変数名   | 用途                 |
|----------|----------------------|
| DB_NAME  | USE DATABASE の対象  |
| WH_NAME  | USE WAREHOUSE の対象 |

## 入力
$ARGUMENTS は問題ファイルの識別子（例: `001_view_history`）

## 手順

### Step 1: 問題ファイルの読み込み
`questions/$ARGUMENTS.md` を読み、問題のコンセプトと正答の理由を理解する。

### Step 2: 共有リソースの確認
`sandbox/setup/` 内のファイルを読み、既存の共有テーブル・ビュー等を確認する。
再利用できるものがあればそれを使い、不要な重複作成を避ける。

### Step 3: SQLスクリプトの作成
`sandbox/exercises/$ARGUMENTS.sql` を作成する:

```sql
-- ============================================
-- Exercise: NNN - Topic Name
-- Question: questions/NNN_topic.md
-- ============================================

-- 前提: sandbox/setup/ のセットアップ済み
USE DATABASE $DB_NAME;
USE WAREHOUSE $WH_NAME;
USE SCHEMA PUBLIC;

-- Step 1: [概要]
-- [日本語でこのステップの目的を説明]
SQL文;

-- Step 2: [概要]
SQL文;

-- 検証: [期待される結果の説明]
SQL文;

-- クリーンアップ（共有オブジェクトは削除しない）
-- DROP TABLE IF EXISTS temp_xxx;
```

ルール:
- 共有テーブル（sandbox/setup/ で定義済み）はDROPしない
- 演習固有の一時オブジェクトにはわかりやすい名前をつける
- 新しく作成したオブジェクトが他の演習でも使えそうな場合、`sandbox/setup/01_shared_tables.sql` への追加も提案する
- コメントは日本語で

### Step 4: 検証手順ドキュメントの作成
`docs/$ARGUMENTS.md` を作成する:

```markdown
# NNN: Topic Name — サンドボックス検証手順

## 目的
この検証で確認すること（日本語）

## 前提条件
- データベース: $DB_NAME
- ウェアハウス: $WH_NAME（起動済み）
- ロール: SYSADMIN
- 共有テーブル: [必要なもの一覧]

## 手順

### Step 1: タイトル
**実行するSQL:**
\```sql
SQL文
\```

**確認ポイント:**
- 何を確認するか（日本語）
- 期待される結果

### Step 2: タイトル
...

## まとめ
- この検証で確認できたこと
- 試験問題との対応関係

## コスト注意
- ウェアハウスが自動サスペンドされるか確認
- 不要なオブジェクトのクリーンアップ手順
```

### Step 5: 新しい環境変数が必要な場合
演習で新たに設定値（スキーマ名・ロール名など）を変数化したい場合:

1. `.env.example` に変数とコメントを追記する
2. このスキルファイル（SKILL.md）の「環境変数」テーブルにも同じ変数を追記する
3. ユーザーに以下を案内する:

> `.env.example` に `変数名=値` を追加しました。
> ご自身の環境では `.env` にも同じ変数を追加してください:
> ```
> 変数名=あなたの環境の値
> ```

### Step 6: 出力
- 作成したファイルパスを表示
- 検証の概要を簡潔に説明
- 必要な前提条件があれば案内

$ARGUMENTS
