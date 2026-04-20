# 086: Clustering Key Data Types

**SnowPro Core Domain**: Domain 4 — Performance Optimization, Querying, and Transformation
**作成日**: 2026-04-16
**正答**: C, E

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Clustering Key（クラスタリングキー） | テーブルデータの物理的な並び順を定義するキー。頻繁にフィルタ・結合に使われる列を指定してクエリ性能を向上させる |
| GEOGRAPHY | 地理空間データ型（WGS84座標系）。クラスタリングキーには使用**不可** |
| GEOMETRY | 幾何学的空間データ型（平面座標系）。クラスタリングキーに使用**可能** |
| VARIANT | 半構造化データ型（JSON, XML等）。クラスタリングキーには使用**不可** |
| OBJECT | VARIANT内のキーバリューペア型。クラスタリングキーには使用**不可** |
| ARRAY | VARIANT内の配列型。クラスタリングキーには使用**不可** |
| BINARY | バイナリデータ型。クラスタリングキーに使用**可能** |

## 1-2. 重要コンセプトまとめ

- クラスタリングキーに使用**できないデータ型**（4つ暗記必須）:
  - **GEOGRAPHY**
  - **VARIANT**
  - **OBJECT**
  - **ARRAY**
- それ以外のデータ型（NUMBER, VARCHAR, DATE, TIMESTAMP, BOOLEAN, BINARY, GEOMETRY等）は使用可能
- GEOGRAPHYは不可だが**GEOMETRYは可能**という紛らわしいポイントに注意
- 半構造化データ型（VARIANT/OBJECT/ARRAY）は一括で不可と覚える

## 1-3. 公式ドキュメントURL

- [Defining a Clustering Key for a Table](https://docs.snowflake.com/en/user-guide/tables-clustering-keys#defining-a-clustering-key-for-a-table)

---

## 2-1. 問題文（英語）

> Columns with which data types can be used as clustering keys?
>
> Select two.
>
> A. GEOGRAPHY
> B. OBJECT
> C. BINARY
> D. VARIANT
> E. GEOMETRY

## 2-2. 問題文の文法解析

### 文1: "Columns with which data types can be used as clustering keys?"

- **主語 (S)**: Columns with which data types
- **動詞 (V)**: can be used（受動態）
- **修飾語 (M)**: as clustering keys
- **文型**: SV（受動態）
- **注目ポイント**: 「with which data types」で「どのデータ型の列が」。「be used as ~」で「～として使用される」。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| clustering key | 名詞句 | クラスタリングキー | Define a clustering key for better performance. |
| data type | 名詞句 | データ型 | Certain data types cannot be clustering keys. |

## 2-3. 問題文（日本語）

> どのデータ型の列がクラスタリングキーとして使用できますか？
>
> 2つ選んでください。
>
> A. GEOGRAPHY
> B. OBJECT
> C. BINARY
> D. VARIANT
> E. GEOMETRY

---

## 3-1. 解説文（英語）

> Clustering keys can be of any data type except GEOGRAPHY, VARIANT, OBJECT, or ARRAY.

## 3-2. 解説文の文法解析

### 文1: "Clustering keys can be of any data type except GEOGRAPHY, VARIANT, OBJECT, or ARRAY."

- **主語 (S)**: Clustering keys
- **動詞 (V)**: can be
- **補語 (C)**: of any data type
- **修飾語 (M)**: except GEOGRAPHY, VARIANT, OBJECT, or ARRAY
- **文型**: SVC
- **注目ポイント**: 「any ~ except ...」で「...を除くすべての～」。除外リストを明確にする定番パターン。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| except | 前置詞 | ～を除いて | Any data type except GEOGRAPHY. |

## 3-3. 解説文（日本語）

> クラスタリングキーは、GEOGRAPHY、VARIANT、OBJECT、ARRAYを除くすべてのデータ型で使用できます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
