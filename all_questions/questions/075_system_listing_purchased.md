# 075: Data Sharing — SYSTEM$IS_LISTING_PURCHASED Function

**SnowPro Core Domain**: Domain 5 — Data Collaboration (Data Sharing)
**作成日**: 2026-04-03
**正答**: B（SYSTEM$IS_LISTING_PURCHASED）

> 関連問題: 023（Share Consumer Accounts）・047（Data Sharing Multiple Databases）・055（Share Management Role）・069（Share Object Update）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| SYSTEM$IS_LISTING_PURCHASED | Snowflakeのシステム関数。Shareのリスティング（有料・無料）を確認し、**有料顧客に見せるデータとトライアル顧客に見せるデータを制御する**ために使用する |
| Listing（リスティング） | Snowflake Marketplaceでデータプロバイダーが公開するデータ製品のパッケージ。無料・有料（paid）・プライベートの形態がある |
| Paid Listing（有料リスティング） | 料金を支払ったコンシューマーだけが完全なデータへのアクセスを持つリスティング形態 |
| Trial Customer（トライアル顧客） | 有料購入前のお試し段階のコンシューマー。`SYSTEM$IS_LISTING_PURCHASED` で有料顧客と区別される |
| Paying Customer（有料顧客） | リスティングを購入済みのコンシューマー。全データへのアクセスが許可される |
| SYSTEM$ALLOWLIST | Snowflakeがネットワークポリシーのホワイトリストに使用する別のシステム関数。**データアクセス制御ではなく、ネットワーク接続制御**に使う |
| SYSTEM$BLOCK_INTERNAL_STAGES_PUBLIC_ACCESS | 内部ステージへのパブリックアクセスをブロックするシステム関数。データ共有の支払い制御とは無関係 |

## 1-2. 重要コンセプトまとめ

- **`SYSTEM$IS_LISTING_PURCHASED` の用途**:
  - Shareのリスティングが購入済みかどうかをチェックする
  - 有料顧客 → 完全なデータへのアクセスを許可
  - トライアル顧客 → 制限されたデータ（サンプル等）のみ表示
  - 典型的な使い方: ビューやセキュアビューの中でこの関数をWHERE条件や CASE式に組み込む

- **不正解の選択肢の解説**:
  - `SYSTEM$BLOCK_INTERNAL_STAGES_PUBLIC_ACCESS` → ステージへのパブリックアクセスをブロックする。支払い制御と無関係
  - `SYSTEM$ALLOWLIST` → ネットワークのホワイトリスト取得用。IPアドレス制御に使う
  - `SYSTEM$DISABLE_BEHAVIOR_CHANGE_BUNDLE` → 動作変更バンドルを無効化するための関数。支払い制御と無関係

- **Snowflake Marketplace のデータ共有モデル**:
  - データはコピーされずリアルタイムで参照される（Data Sharingと同様）
  - 有料・無料・プライベートのリスティング形態がある
  - `SYSTEM$IS_LISTING_PURCHASED` で有料/トライアルを区別できる

- **試験のポイント**: `SYSTEM$IS_LISTING_PURCHASED` は「有料顧客向けのデータアクセス制御」という用途に紐づけて覚える

## 1-3. 公式ドキュメントURL

- [Preparing Shares for a Paid Listing](https://other-docs.snowflake.com/en/collaboration/provider-listings-preparing#preparing-shares-for-a-paid-listing)

---

## 2-1. 問題文（英語）

> Which system function can be used to control access to data in a share and allow specific data only to paying customers?
>
> A. SYSTEM$BLOCK_INTERNAL_STAGES_PUBLIC_ACCESS
> B. SYSTEM$IS_LISTING_PURCHASED
> C. SYSTEM$ALLOWLIST
> D. SYSTEM$DISABLE_BEHAVIOR_CHANGE_BUNDLE

## 2-2. 問題文の文法解析

### 文1: "Which system function can be used to control access to data in a share and allow specific data only to paying customers?"

- **疑問詞**: Which system function（どのシステム関数が）
- **動詞 (V)**: can be used（使用できる）← 受動態
- **目的1**: to control access to data in a share（シェア内のデータへのアクセスを制御するために）← `control access to ~` = 「〜へのアクセスを制御する」
- **目的2**: and allow specific data only to paying customers（特定のデータのみを有料顧客に許可するために）← `allow A to B` = 「AをBに許可する」
- **注目ポイント**: `paying customers` = 「支払っている顧客・有料顧客」。`pay` の現在分詞で「お金を払っている」状態を形容詞的に使う

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| control access to ~ | 動詞句 | 〜へのアクセスを制御する | Use the function to control access to data in a share. |
| allow A to B | 動詞句 | AをBに許可する・BがAを利用できるようにする | Allow specific data only to paying customers. |
| paying customer | 名詞句 | 有料顧客・料金を支払っている顧客 | Show full data only to paying customers. |
| specific | 形容詞 | 特定の・具体的な | Allow specific data to certain customers. |

## 2-3. 問題文（日本語）

> シェア内のデータへのアクセスを制御し、特定のデータのみを有料顧客に許可するために使用できるシステム関数はどれですか？
>
> A. SYSTEM$BLOCK_INTERNAL_STAGES_PUBLIC_ACCESS
> B. SYSTEM$IS_LISTING_PURCHASED
> C. SYSTEM$ALLOWLIST
> D. SYSTEM$DISABLE_BEHAVIOR_CHANGE_BUNDLE

---

## 3-1. 解説文（英語）

> SYSTEM$IS_LISTING_PURCHASED system function can be used to control which data is visible to a paid customer and which to a trial customer.

## 3-2. 解説文の文法解析

### 文1: "SYSTEM$IS_LISTING_PURCHASED system function can be used to control which data is visible to a paid customer and which to a trial customer."

- **主語 (S)**: SYSTEM$IS_LISTING_PURCHASED system function
- **動詞 (V)**: can be used to control（制御するために使用できる）← 受動態 + 目的の不定詞
- **目的語1**: which data is visible to a paid customer（どのデータが有料顧客に見えるか）← 間接疑問文
- **目的語2**: which [data is visible] to a trial customer（どの[データが]トライアル顧客に[見えるか]）← 省略構文
- **注目ポイント**: `which ~ and which ~` = 「どれが〜で、どれが〜か」。2つの間接疑問文を `and` で並列。後半の `which` には `data is visible` が省略されている

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| be visible to ~ | 熟語 | 〜に見える・〜にとって表示される | Which data is visible to a paid customer? |
| paid customer | 名詞句 | 有料顧客 | Paid customers see full data. |
| trial customer | 名詞句 | トライアル顧客・試用顧客 | Trial customers see limited data. |
| which ~ and which ~ | 並列間接疑問 | どれが〜で、どれが〜か | Control which is visible to paid and which to trial. |

## 3-3. 解説文（日本語）

> SYSTEM$IS_LISTING_PURCHASEDシステム関数は、どのデータが有料顧客に見えるか、どのデータがトライアル顧客に見えるかを制御するために使用できます。

---

## 復習メモ

- [ ] `SYSTEM$IS_LISTING_PURCHASED` = 有料顧客とトライアル顧客でデータアクセスを分けるために使う関数であることを覚えた
- [ ] `SYSTEM$ALLOWLIST`（ネットワーク制御）と混同しないよう区別できた
- [ ] `paying customer`・`paid customer`・`trial customer` の使い分けを確認した
- [ ] `control access to ~`・`allow A to B`・`be visible to ~` の英語パターンを確認した
- [ ] この問題は理論問題のためサンドボックス検証は不要
