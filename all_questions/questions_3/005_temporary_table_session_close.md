# 005: Temporary Table Session Close

**SnowPro Core Domain**: Domain 5 — Data Collaboration
**作成日**: 2026-04-14
**正答**: Temporary

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Temporary Table | セッション終了時に即座にドロップされるテーブル。セッションローカル。Fail-Safe 0日・Time Travel最大1日 |
| Transient Table | セッション終了後も存続。Fail-Safe 0日・Time Travel最大1日 |
| Permanent Table | デフォルトテーブル。セッションと無関係に永続。Fail-Safe 7日 |

## 1-2. 重要コンセプトまとめ

- セッション終了で消える = **Temporary** のみ
- `cease to exist` = 「存在しなくなる」= ドロップされる
- Transientはセッション終了後も存続（短期だがセッションをまたぐ）
- Permanentは永続（セッションと無関係）

## 1-3. 公式ドキュメントURL

- [Temporary and Transient Tables](https://docs.snowflake.com/en/user-guide/tables-temp-transient)

---

## 2-1. 問題文（英語）

> Which type of Snowflake tables will cease to exist once the session is closed?
>
> A. Temporary
> B. Permanent
> C. Clustered
> D. Transient

## 2-2. 問題文の文法解析

### 文1: "Which type of Snowflake tables will cease to exist once the session is closed?"

- **主語 (S)**: Which type of Snowflake tables
- **動詞 (V)**: will cease to exist
- **修飾語 (M)**: once the session is closed
- **文型**: SV
- **注目ポイント**: `cease to exist` は「存在しなくなる」。`once ~` は「一旦～すると」。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| cease to exist | phrase | 存在しなくなる | Temporary tables cease to exist. |
| once ~ | conjunction | 一旦～すると | Once the session is closed. |

## 2-3. 問題文（日本語）

> セッションが閉じられると存在しなくなるSnowflakeテーブルのタイプはどれですか？

---

## 3-1. 解説文（英語）

> Temporary tables are local to a session and are dropped as soon as the session is closed.

## 3-3. 解説文（日本語）

> テンポラリテーブルはセッションにローカルであり、セッションが閉じられるとすぐにドロップされます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
