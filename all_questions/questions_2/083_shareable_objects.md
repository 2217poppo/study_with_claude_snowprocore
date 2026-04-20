# 083: Shareable Objects

**SnowPro Core Domain**: Domain 5 — Data Collaboration
**作成日**: 2026-04-14
**正答**: A, C, E

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Direct Data Sharing | Snowflakeアカウント間でデータをコピーなしで直接共有する機能 |
| Secure View（セキュアビュー） | 定義が隠蔽され、データ保護機能を持つビュー。共有可能 |
| Secure Materialized View（セキュアMV） | セキュアな物理保存ビュー。共有可能 |
| Secure UDF（セキュアUDF） | データ保護機能を持つユーザー定義関数。共有可能 |
| External Table（外部テーブル） | 外部ストレージのデータを参照するテーブル。共有可能 |

## 1-2. 重要コンセプトまとめ

- Direct Data Sharingで共有可能なオブジェクト（**5種類**）:
  1. **Tables**（テーブル）
  2. **External Tables**（外部テーブル）
  3. **Secure Views**（セキュアビュー）
  4. **Secure Materialized Views**（セキュアMV）
  5. **Secure UDFs**（セキュアUDF）
- 共有**できない**もの:
  - Users（ユーザー）
  - Accounts（アカウント）
  - 通常のビュー（非セキュア）
  - 通常のUDF（非セキュア）
- ポイント: 共有可能なビュー/UDFは **Secure** 版のみ
- 1つのSHAREには**1つのデータベース**のみ追加可能。複数DBからの共有にはSecure Viewを使う

## 1-3. 公式ドキュメントURL

- [Introduction to Secure Data Sharing](https://docs.snowflake.com/en/user-guide/data-sharing-intro)

---

## 2-1. 問題文（英語）

> Which of the following objects may be shared via direct data sharing?
>
> A. Tables
> B. Users
> C. Secure Materialized Views
> D. Accounts
> E. Secure Views

## 2-2. 問題文の文法解析

### 文1: "Which of the following objects may be shared via direct data sharing?"

- **主語 (S)**: Which of the following objects
- **動詞 (V)**: may be shared（受動態）
- **修飾語 (M)**: via direct data sharing（手段）
- **文型**: SV（受動態疑問文）
- **注目ポイント**: `via ~` は「～を通じて」。`may be shared` の `may` は可能性。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| via ~ | preposition | ～を通じて | Shared via direct data sharing. |
| enable sharing of ~ | phrase | ～の共有を可能にする | Enables sharing of tables and views. |

## 2-3. 問題文（日本語）

> Direct Data Sharingで共有可能なオブジェクトは以下のどれですか？
>
> A. テーブル
> B. ユーザー
> C. セキュアマテリアライズドビュー
> D. アカウント
> E. セキュアビュー

---

## 3-1. 解説文（英語）

> Direct data sharing enables sharing of the following types of objects: Tables, External tables, Secure views, Secure materialized views, Secure UDFs.

## 3-2. 解説文の文法解析

### 文1: "Direct data sharing enables sharing of the following types of objects: Tables, External tables, Secure views, Secure materialized views, Secure UDFs."

- **主語 (S)**: Direct data sharing
- **動詞 (V)**: enables
- **目的語 (O)**: sharing of the following types of objects
- **文型**: SVO
- **注目ポイント**: コロン以下で5種類を列挙。すべて「Secure」が付くビュー/UDFのみ共有可能。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| enable | verb | 可能にする | Enables sharing of objects. |

## 3-3. 解説文（日本語）

> Direct Data Sharingは以下の種類のオブジェクトの共有を可能にします: テーブル、外部テーブル、セキュアビュー、セキュアマテリアライズドビュー、セキュアUDF。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
