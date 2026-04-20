# 106: External Function — Remote Service Options

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-06
**正答**: AWS Lambda Function / Node.js running on an EC2 instance / Microsoft Azure Function（すべて正解）
**ユーザー回答**: AWS Lambda Function のみ選択（Node.js on EC2, Azure Function を見落とし）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| External Function（外部関数） | Snowflake外部のリモートサービスを呼び出すユーザー定義関数。SQL から外部の API・サービスを実行できる。**リモートサービス（Remote Service）**と**API Integration**を組み合わせて実装する |
| Remote Service（リモートサービス） | External Functionが呼び出す外部の処理サービス。クラウドプロバイダーのFaaSやサーバーなど様々な形式が使える。本問の選択肢がすべてこれに該当する |
| AWS Lambda Function（AWSラムダ関数） | AWSのサーバーレス関数実行サービス（FaaS）。コードをサーバー管理なしに実行できる。External Functionのリモートサービスとして利用可能 |
| Node.js on EC2（EC2上のNode.js） | AWS EC2インスタンス上でNode.jsを実行するサーバー形式のリモートサービス。サーバーレスではなく仮想マシン上に稼働する形式。External Functionのリモートサービスとして利用可能 |
| Microsoft Azure Function（Azureファンクション） | MicrosoftのクラウドサービスAzureのサーバーレス関数実行サービス（FaaS）。AWS Lambdaに相当。External Functionのリモートサービスとして利用可能 |
| API Integration（API統合） | External Functionとリモートサービスを接続するためにSnowflakeで設定する統合オブジェクト。ACCOUNTADMINが作成する |

## 1-2. 重要コンセプトまとめ

- **正解はすべて3つ**: AWS Lambda / Node.js on EC2 / Microsoft Azure Function
- **ユーザーの見落とし**: AWS LambdaのみでNode.js on EC2とAzure Functionを未選択
- **リモートサービスの種類**（試験頻出）:
  - **FaaS（Function as a Service）型**: AWS Lambda、Azure Function、Google Cloud Functions
  - **サーバー型**: EC2上のNode.js、その他のHTTPエンドポイント
- **重要ポイント**: リモートサービスはクラウドに限らず、**HTTPエンドポイントを提供できるものなら何でも**使える
- **External Functionの仕組み**:
  1. SnowflakeのSQLでExternal Functionを呼び出す
  2. API Integrationを経由してリモートサービスにHTTPリクエスト
  3. リモートサービスが処理結果をJSONで返す
  4. Snowflakeがその結果を受け取りクエリに組み込む
- **UDF（ユーザー定義関数）との違い**: UDFはSnowflake内部で実行、External FunctionはSnowflake外部のサービスを呼び出す

## 1-3. 公式ドキュメントURL

- [Introduction to External Functions](https://docs.snowflake.com/en/sql-reference/external-functions-introduction)

---

## 2-1. 問題文（英語）

> Which of the following could be used as a remote service for an external function?
>
> A. AWS Lambda Function ✅
> B. Node.js running on an EC2 instance ✅
> C. Microsoft Azure Function ✅

## 2-2. 問題文の文法解析

### 文1: "Which of the following could be used as a remote service for an external function?"

- **主語 (S)**: Which of the following
- **動詞 (V)**: could be used（受動態）
- **役割 (M1)**: as a remote service（役割・機能）
- **目的 (M2)**: for an external function（用途）
- **文型**: SV（受動態）
- **注目ポイント**:
  - **"could be used as ~"**: 「〜として使うことができる」。`could`（過去形の can）で「潜在的な可能性・能力」を示す。`can be used` より穏やかに「使える可能性がある」を表現する
  - **"as a remote service"**: 「リモートサービスとして」。`as ~`（〜として）で役割を明示。`for` との違い: `as` は役割、`for` は目的・用途
  - **"for an external function"**: 「外部関数のために」。`for`（〜のために）で用途を限定

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| remote service | 名詞句 | リモートサービス・外部サービス | AWS Lambda can be used as a remote service for an external function. |
| external function | 名詞句 | 外部関数 | External functions call remote services from Snowflake SQL. |
| could be used as ~ | 受動態 | 〜として使われ得る | Node.js on EC2 could be used as a remote service. |

## 2-3. 問題文（日本語）

> 次のうち、外部関数のリモートサービスとして使用できるものはどれか？
>
> A. AWS Lambda Function ✅
> B. EC2インスタンス上で稼働するNode.js ✅
> C. Microsoft Azure Function ✅

---

## 3-1. 解説文（英語）

> All of these are valid examples of how an external function could be implemented.

## 3-2. 解説文の文法解析

### 文1: "All of these are valid examples of how an external function could be implemented."

- **主語 (S)**: All of these
- **動詞 (V)**: are
- **補語 (C)**: valid examples of how an external function could be implemented
- **文型**: SVC
- **注目ポイント**:
  - **"All of these are valid examples of ~"**: 「これらすべてが〜の有効な例である」。`all of these`（これらすべて）で全選択肢が正解であることを断言。`some of these` ではなく `all` を使うことで全選択が正解と明示する。試験解説で「すべて正しい」を示す定番表現
  - **"examples of how ~ could be implemented"**: 「〜がどのように実装されうるかの例」。`how + 主語 + could be + 過去分詞`（間接疑問 + 受動態）で「実装方法」を示す。`could`（仮定的な可能性）+ `be implemented`（実装される）で実装の多様性を示す

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| All of these | 名詞句 | これらすべて | All of these are valid remote service examples. |
| implemented | 過去分詞 | 実装された・実現された | An external function can be implemented using various services. |
| valid examples of ~ | 名詞句 | 〜の有効な例 | All of these are valid examples of remote services. |

## 3-3. 解説文（日本語）

> これらはすべて、外部関数がどのように実装されうるかの有効な例です。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
