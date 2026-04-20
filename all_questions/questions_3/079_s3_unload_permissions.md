# 079: S3 Unload Permissions

**SnowPro Core Domain**: Domain 3 — Data Loading, Unloading, and Connectivity
**作成日**: 2026-04-16
**正答**: A, D

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Data Unloading（データアンロード） | Snowflakeテーブルのデータをクラウドストレージにエクスポートすること。COPY INTO \<location\> コマンドを使用 |
| S3 (Amazon Simple Storage Service) | AWSのオブジェクトストレージサービス。Snowflakeの外部ステージとして使用可能 |
| s3:PutObject | S3バケットにオブジェクトを書き込む権限。アンロード（書き出し）に必須 |
| s3:DeleteObject | S3バケット内のオブジェクトを削除する権限。アンロード時にSnowflakeが一時ファイルの管理に使用 |
| s3:GetObject | S3バケットからオブジェクトを読み取る権限。ロード（読み込み）時に必要だが、アンロードには不要 |
| s3:ListBucket | S3バケット内のオブジェクト一覧を取得する権限。アンロードには不要 |

## 1-2. 重要コンセプトまとめ

- S3へのアンロードに必要な権限は**2つのみ**:
  1. **s3:PutObject** — ファイルを書き込む
  2. **s3:DeleteObject** — 一時ファイルを削除する
- s3:GetObject はアンロードには**不要**（ロード時に必要）
- s3:ListBucket はアンロードには**不要**（ロード時のファイルリスト取得に必要）
- ロードとアンロードで必要な権限が異なるため、混同に注意
- ロード時: s3:GetObject, s3:GetObjectVersion, s3:ListBucket が必要

## 1-3. 公式ドキュメントURL

- [Configuring an S3 Bucket for Unloading Data](https://docs.snowflake.com/en/user-guide/data-unload-s3#configuring-an-s3-bucket-for-unloading-data)

---

## 2-1. 問題文（英語）

> What S3 permissions are required when unloading data from Snowflake to an AWS S3 location?
>
> Select two answers.
>
> A. s3:PutObject
> B. s3:ListBucket
> C. s3:GetObject
> D. s3:DeleteObject

## 2-2. 問題文の文法解析

### 文1: "What S3 permissions are required when unloading data from Snowflake to an AWS S3 location?"

- **主語 (S)**: What S3 permissions
- **動詞 (V)**: are required（受動態）
- **修飾語 (M)**: when unloading data from Snowflake to an AWS S3 location（時間/条件の副詞節）
- **文型**: SV（受動態）
- **注目ポイント**: 「when unloading」は分詞構文で条件を示す。「from Snowflake to an AWS S3 location」で方向（ソース → ターゲット）を明示。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| unload | 動詞 | アンロードする（書き出す） | Unloading data from Snowflake to S3. |
| permission | 名詞 | 権限 | S3 permissions required for unloading. |
| required | 形容詞 | 必要な | Permissions required when unloading. |

## 2-3. 問題文（日本語）

> SnowflakeからAWS S3にデータをアンロードする際に必要なS3権限は何ですか？
>
> 2つ選んでください。
>
> A. s3:PutObject
> B. s3:ListBucket
> C. s3:GetObject
> D. s3:DeleteObject

---

## 3-1. 解説文（英語）

> Snowflake requires s3:DeleteObject & s3:PutObject permissions on the target S3 bucket.

## 3-2. 解説文の文法解析

### 文1: "Snowflake requires s3:DeleteObject & s3:PutObject permissions on the target S3 bucket."

- **主語 (S)**: Snowflake
- **動詞 (V)**: requires
- **目的語 (O)**: s3:DeleteObject & s3:PutObject permissions
- **修飾語 (M)**: on the target S3 bucket
- **文型**: SVO
- **注目ポイント**: シンプルなSVO文。「on the target S3 bucket」でターゲット（書き出し先）を限定。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| require | 動詞 | 要求する | Snowflake requires specific permissions. |
| target | 形容詞 | ターゲットの（書き出し先の） | On the target S3 bucket. |

## 3-3. 解説文（日本語）

> Snowflakeはターゲットのs3バケットに対してs3:DeleteObjectとs3:PutObjectの権限を必要とします。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
