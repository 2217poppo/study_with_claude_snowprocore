# 036: Data Sharing Cost Split

**SnowPro Core Domain**: Domain 5 — Data Collaboration
**作成日**: 2026-04-15
**正答**: A, C

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Data Sharing（通常のSnowflake間） | アカウント間でデータをコピーなしで共有。ストレージはプロバイダー負担、コンピュートはコンシューマー負担 |
| Data Provider | データを提供する側。ストレージコストを負担 |
| Data Consumer | データを利用する側。自分のWHでクエリ実行 → コンピュートコストを負担 |

## 1-2. 重要コンセプトまとめ

- **通常のData Sharing（Snowflake間）** のコスト分担:
  - **ストレージ**: **プロバイダーのみ**が負担（コンシューマーは無料）
  - **コンピュート**: **コンシューマー**が自分のWHで実行 → コンシューマー負担
- **Reader Account** との違い（混同注意）:
  - Reader Account: コンピュートもプロバイダー負担
  - 通常のSharing: コンピュートはコンシューマー負担

| 共有方法 | ストレージ | コンピュート |
|---------|----------|------------|
| 通常のSharing | プロバイダー | **コンシューマー** |
| Reader Account | プロバイダー | **プロバイダー** |

## 1-3. 公式ドキュメントURL

- [Introduction to Secure Data Sharing](https://docs.snowflake.com/en/user-guide/data-sharing-intro)

---

## 2-1. 問題文（英語）

> Which statements are true regarding costs when a Snowflake account shares data with another Snowflake account? Select all that apply.
>
> A. The data consumer is NOT charged for any storage costs associated with the shared data.
> B. Both the data provider and the data consumer are charged for the storage costs.
> C. The data consumer is charged for the compute charges for queries they run.
> D. The data provider is charged for the compute charges for queries the data consumer runs.

## 2-2. 問題文の文法解析

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| charged for ~ | phrase | ～に対して課金される | The consumer is charged for compute. |
| associated with ~ | phrase | ～に関連した | Storage costs associated with shared data. |

## 2-3. 問題文（日本語）

> Snowflakeアカウントがデータを別のSnowflakeアカウントと共有する際のコストに関して正しいのはどれですか？

---

## 3-1. 解説文（英語）

> Since the provider account stores and pays for the data storage, the data consumer doesn't have to pay anything extra for storage. However, the data consumer pays for the compute used to run queries on shared data. When queries are run on shared data, the compute of the data consumer is used.

## 3-3. 解説文（日本語）

> プロバイダーがデータストレージを保存・支払いするため、コンシューマーはストレージに追加料金を支払う必要がありません。ただし、コンシューマーは共有データへのクエリ実行に使用するコンピュートの費用を支払います。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
