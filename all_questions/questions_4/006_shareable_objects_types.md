# 006: Data Sharing — Shareable Object Types

**SnowPro Core Domain**: Domain 5 — Data Protection and Data Sharing
**作成日**: 2026-04-17
**正答**: Tables, Secure Materialized Views, Secure Views, Secure UDFs（通常のViews・Materialized Viewsは共有不可）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Direct Data Sharing（ダイレクトデータ共有） | Snowflakeのデータ共有の仕組み。データをコピーせずにコンシューマーがプロバイダーのデータにアクセスできる |
| Secure View（セキュアビュー） | ビューの定義（SQL）を所有者ロール以外から隠すビュー。**共有可能** |
| Secure Materialized View（セキュアマテリアライズドビュー） | マテリアライズドビューにセキュリティを付加したもの。定義を隠す。**共有可能** |
| Secure UDF（セキュアUDF） | UDFの定義を非所有者から隠す関数。**共有可能** |
| View（通常のビュー） | SELECTクエリを定義したオブジェクト。ビューの定義が見える。**共有不可** |
| Materialized View（通常のマテリアライズドビュー） | 事前計算結果を物理保存するビュー。**共有不可**（Secureバージョンのみ共有可能） |
| External Table（外部テーブル） | 共有可能なオブジェクトの1つ。（この問題では選択肢に含まれていないが試験では重要） |

## 1-2. 重要コンセプトまとめ

- **共有可能なオブジェクト（Direct Data Sharing）**:
  1. **Tables**（テーブル）
  2. **External Tables**（外部テーブル）
  3. **Secure Views**（セキュアビュー）
  4. **Secure Materialized Views**（セキュアマテリアライズドビュー）
  5. **Secure UDFs**（セキュアUDF）
- **共有できないオブジェクト（引っかけ）**:
  - **通常の Views** — セキュリティ上、ビュー定義が見えてしまうため
  - **通常の Materialized Views** — 同じ理由でSecureバージョンのみ共有可能
- **「Secure」が共有のキー**: 通常のView/MV/UDFは共有不可。**Secure**を付けた版のみ共有可能
- **Tables / External Tables はSecureでなくても共有可能**

| オブジェクト | 共有可能 |
|---|---|
| Table | ✓ |
| External Table | ✓ |
| Secure View | ✓ |
| Secure Materialized View | ✓ |
| Secure UDF | ✓ |
| View（通常） | ✗ |
| Materialized View（通常） | ✗ |

## 1-3. 公式ドキュメントURL

- [Introduction to Secure Data Sharing](https://docs.snowflake.com/en/user-guide/data-sharing-intro)

---

## 2-1. 問題文（英語）

> Which of the following objects can be shared? Select all that apply.
>
> A. Materialized Views
> B. Tables ✓
> C. Secure Materialized Views ✓
> D. Views
> E. Secure Views ✓
> F. Secure UDFs ✓

## 2-2. 問題文の文法解析

### 文1: "Which of the following objects can be shared?"

- **主語 (S)**: Which of the following objects（以下のオブジェクトのうちどれが）
- **動詞 (V)**: can be shared（共有できる / 受動態・助動詞）
- **文型**: SV（受動態）
- **注目ポイント**:
  - `can be shared` = 「共有され得る」（can + 受動態）
  - 能力・可能性を示す助動詞 `can` の受動態形式

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| can be shared | 動詞句（受動態） | 共有できる | Tables and secure views can be shared. |
| Select all that apply | 命令句 | すべて選択せよ | Select all that apply = Multiple answers may be correct. |

## 2-3. 問題文（日本語）

> 以下のオブジェクトのうち、共有できるものはどれですか？すべて選択してください。
>
> A. Materialized Views（通常のマテリアライズドビュー）
> B. Tables（テーブル）✓
> C. Secure Materialized Views（セキュアマテリアライズドビュー）✓
> D. Views（通常のビュー）
> E. Secure Views（セキュアビュー）✓
> F. Secure UDFs（セキュアUDF）✓

---

## 3-1. 解説文（英語）

> Standard views cannot be shared. Direct data sharing enables sharing of the following types of objects: Tables, External tables, Secure views, Secure materialized views, Secure UDFs.
>
> https://docs.snowflake.com/en/user-guide/data-sharing-intro

## 3-2. 解説文の文法解析

### 文1: "Standard views cannot be shared."

- **主語 (S)**: Standard views（通常のビュー）
- **動詞 (V)**: cannot be shared（共有できない / 受動態・否定）
- **文型**: SV（受動態・否定）
- **注目ポイント**:
  - `Standard views` = 通常のビュー（Secure Viewsとの対比で「Standard（標準の）」と表現）
  - `cannot be shared` = 「共有され得ない」（can の否定 = 不可能）

### 文2: "Direct data sharing enables sharing of the following types of objects: Tables, External tables, Secure views, Secure materialized views, Secure UDFs."

- **主語 (S)**: Direct data sharing
- **動詞 (V)**: enables（可能にする）
- **目的語 (O)**: sharing of the following types of objects（以下の種類のオブジェクトの共有）
- **コロン以降**: 共有可能なオブジェクトのリスト
- **注目ポイント**:
  - `enable + 動名詞` = 「〜することを可能にする」
  - `the following types of ~` = 「以下の種類の〜」（リスト導入の定番）
  - コロン（:）でリストを導入

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| Standard views | 名詞句 | 通常のビュー | Standard views cannot be shared; only Secure Views can. |
| enable | 動詞 | 可能にする | Direct data sharing enables sharing of tables. |
| the following types of | 限定詞句 | 以下の種類の | Sharing enables the following types of objects: ... |

## 3-3. 解説文（日本語）

> 通常のビューは共有できません。ダイレクトデータ共有では以下の種類のオブジェクトの共有が可能です: テーブル、外部テーブル、セキュアビュー、セキュアマテリアライズドビュー、セキュアUDF。

---

## 復習メモ

- [ ] 共有可能は Tables / External Tables / Secure Views / Secure MVs / Secure UDFs の5種類と覚えた
- [ ] 通常の View と通常の MV は共有不可（Secure版のみ可能）と理解した
- [ ] `Standard views cannot be shared` — "Standard" = 通常のビューという表現に慣れた
