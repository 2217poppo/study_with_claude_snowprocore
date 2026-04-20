# 088: Secure View Multi-DB Sharing

**SnowPro Core Domain**: Domain 5 — Data Collaboration
**作成日**: 2026-04-14
**正答**: True

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Secure View | データ保護機能を持つビュー。定義が非所有者から隠蔽される。Data Sharingで共有可能 |
| SHARE | データ共有オブジェクト。**1つのSHAREに追加できるDBは1つだけ** |
| Multi-Database Sharing | 複数DBのデータを共有すること。Secure Viewを1つのDBに作成して実現 |

## 1-2. 重要コンセプトまとめ

- 複数DBのデータを共有する場合 → **Secure Viewを1つのDBに作成** することをSnowflakeが推奨
- 理由: 1つのSHAREには**1つのDBしか追加できない**
- 解決策: 1つのDBにSecure Viewを作成し、そのビューが複数DBのテーブルを参照する
- これにより1つのSHAREで複数DBのデータを間接的に共有可能

## 1-3. 公式ドキュメントURL

- [Sharing Data from Multiple Databases](https://docs.snowflake.com/en/user-guide/data-sharing-mutiple-db)

---

## 2-1. 問題文（英語）

> True or False: Snowflake recommends creating a secure view to share data from several tables in different databases.
>
> A. False
> B. True

## 2-2. 問題文の文法解析

### 文1: "Snowflake recommends creating a secure view to share data from several tables in different databases."

- **主語 (S)**: Snowflake
- **動詞 (V)**: recommends
- **目的語 (O)**: creating a secure view
- **修飾語 (M)**: to share data from several tables in different databases（目的）
- **文型**: SVO

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| recommends ~ing | phrase | ～することを推奨する | Recommends creating a secure view. |

## 2-3. 問題文（日本語）

> 真/偽: Snowflakeは、異なるデータベースの複数テーブルからデータを共有するために、セキュアビューの作成を推奨している。

---

## 3-1. 解説文（英語）

> You can create secure views if you need to share data from many tables in different databases. Since you can't add more than one database to a single share, Snowflake recommends creating secure views in a single database.

## 3-2. 解説文の文法解析

### 文1: "Since you can't add more than one database to a single share, Snowflake recommends creating secure views in a single database."

- **主語 (S)**: Snowflake
- **動詞 (V)**: recommends
- **目的語 (O)**: creating secure views in a single database
- **修飾語 (M)**: Since you can't add more than one database to a single share（理由）
- **文型**: SVO
- **注目ポイント**: `Since ~` で制約（1 SHARE = 1 DB）を理由として提示し、推奨策を導く。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| more than one | phrase | 1つ以上の | Can't add more than one database. |
| single | adjective | 単一の | In a single database. |

## 3-3. 解説文（日本語）

> 異なるデータベースの複数テーブルからデータを共有する必要がある場合、セキュアビューを作成できます。1つのSHAREに複数のデータベースを追加することはできないため、Snowflakeは1つのデータベースにセキュアビューを作成することを推奨しています。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
