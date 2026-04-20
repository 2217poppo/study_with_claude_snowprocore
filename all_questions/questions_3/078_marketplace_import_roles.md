# 078: Marketplace Import Roles

**SnowPro Core Domain**: Domain 5 — Data Collaboration
**作成日**: 2026-04-16
**正答**: C, D

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Snowflake Marketplace | パブリックなデータマーケットプレイス。データセットの提供・取得が可能。誰でも閲覧できるが、データの消費にはACCOUNTADMINまたはIMPORT SHARE権限が必要 |
| IMPORT SHARE 権限 | 共有データをインポートする権限。ACCOUNTADMINでなくてもこの権限があればMarketplaceからデータセットを取得できる |
| ACCOUNTADMIN | 最も強力なシステムロール。Marketplace利用を含むすべての操作が可能 |
| ORGADMIN | 組織レベルの管理ロール。Marketplaceインポートの権限は含まない |
| SYSADMIN | オブジェクト管理ロール。IMPORT SHARE権限はデフォルトでは持たない |

## 1-2. 重要コンセプトまとめ

- Marketplaceの**閲覧（explore）はすべてのユーザー/ロール**で可能
- Marketplaceからのデータセット**インポート（consume）には特定の権限**が必要:
  1. **ACCOUNTADMIN** ロール
  2. **IMPORT SHARE 権限**を持つ任意のロール
- ORGADMIN, SYSADMIN はデフォルトではインポートできない
- Partner Connectと同様、ACCOUNTADMINが推奨される
- 「閲覧 ≠ インポート」の区別が試験ポイント

## 1-3. 公式ドキュメントURL

- [Snowflake Marketplace](https://docs.snowflake.com/en/user-guide/data-marketplace)

---

## 2-1. 問題文（英語）

> Which of the following roles can import a dataset from Snowflake Marketplace? Select all that apply.
>
> A. ORGADMIN
> B. SYSADMIN
> C. ACCOUNTADMIN
> D. A role that has IMPORT SHARE privileges

## 2-2. 問題文の文法解析

### 文1: "Which of the following roles can import a dataset from Snowflake Marketplace?"

- **主語 (S)**: Which of the following roles
- **動詞 (V)**: can import
- **目的語 (O)**: a dataset
- **修飾語 (M)**: from Snowflake Marketplace
- **文型**: SVO

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| import | 動詞 | インポートする | Import a dataset from Marketplace. |
| dataset | 名詞 | データセット | A dataset available on Marketplace. |
| privileges | 名詞 | 権限 | A role that has IMPORT SHARE privileges. |

## 2-3. 問題文（日本語）

> Snowflake Marketplaceからデータセットをインポートできるロールはどれですか？該当するものをすべて選んでください。
>
> A. ORGADMIN
> B. SYSADMIN
> C. ACCOUNTADMIN
> D. IMPORT SHARE権限を持つロール

---

## 3-1. 解説文（英語）

> Although any user or role can explore the Snowflake Marketplace, you will need a user with the ACCOUNTADMIN privilege or the IMPORT SHARE privilege for consuming data. For simplicity, we suggest you utilize a user with the ACCOUNTADMIN privilege.

## 3-2. 解説文の文法解析

### 文1: "Although any user or role can explore the Snowflake Marketplace, you will need a user with the ACCOUNTADMIN privilege or the IMPORT SHARE privilege for consuming data."

- **主語 (S)**: any user or role / you
- **動詞 (V)**: can explore / will need
- **目的語 (O)**: the Snowflake Marketplace / a user with ...
- **修飾語 (M)**: Although ...（譲歩の副詞節）/ for consuming data（目的）
- **文型**: SVO; SVO
- **注目ポイント**: 「Although ~ , ...」で「～だが」。譲歩構文で閲覧は誰でもOKだがインポートには権限が必要という対比。

### 文2: "For simplicity, we suggest you utilize a user with the ACCOUNTADMIN privilege."

- **主語 (S)**: we
- **動詞 (V)**: suggest
- **目的語 (O)**: you utilize a user with the ACCOUNTADMIN privilege（that節）
- **修飾語 (M)**: For simplicity
- **文型**: SVO
- **注目ポイント**: 「suggest (that) you utilize」で推奨。「For simplicity」で簡便さのためと理由を提示。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| although | 接続詞 | ～だが | Although any role can explore, importing needs privileges. |
| explore | 動詞 | 閲覧する | Any user can explore the Marketplace. |
| consume | 動詞 | 消費する（データを利用する） | You need privileges for consuming data. |
| for simplicity | 前置詞句 | 簡便のために | For simplicity, use ACCOUNTADMIN. |

## 3-3. 解説文（日本語）

> すべてのユーザーやロールがSnowflake Marketplaceを閲覧できますが、データを消費（インポート）するにはACCOUNTADMIN権限またはIMPORT SHARE権限を持つユーザーが必要です。簡便のため、ACCOUNTADMIN権限を持つユーザーの使用を推奨します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
