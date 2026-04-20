# 085: ACCOUNT_USAGE — Dropped Objects

**SnowPro Core Domain**: Domain 1 — Account & Security
**作成日**: 2026-04-06
**正答**: True

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| ACCOUNT_USAGE スキーマ | Snowflakeのシステムスキーマ。アカウント全体の使用状況・履歴を最大365日保持。**削除済み（dropped）オブジェクトの情報も含む**。最大45分〜3時間のレイテンシあり |
| Dropped Objects（削除済みオブジェクト） | DROP TABLE・DROP VIEW等で削除されたオブジェクト。ACCOUNT_USAGEビューでは削除済みオブジェクトの情報も保持されるが、INFORMATION_SCHEMAでは保持されない |
| DELETED カラム | ACCOUNT_USAGEの多くのビューに存在する列。削除済みオブジェクトの削除日時（タイムスタンプ）または削除状態を示す。INFORMATION_SCHEMAには存在しない |
| ID カラム | ACCOUNT_USAGEビューが持つ内部IDの列。同名のオブジェクトが削除・再作成された場合に区別するためにシステムが割り当てる一意のID。INFORMATION_SCHEMAにはなく、ACCOUNT_USAGE固有の特徴 |
| INFORMATION_SCHEMA | 各データベース内のメタデータ・履歴を保持するシステムスキーマ。ほぼリアルタイム。**削除済みオブジェクトの情報は含まない**点がACCOUNT_USAGEとの最大の違いの1つ |

## 1-2. 重要コンセプトまとめ

- **True = ACCOUNT_USAGEは削除済みオブジェクトを含む**: ACCOUNT_USAGEはすべての削除済みオブジェクトの情報を保持する。INFORMATION_SCHEMAは保持しない
- **DELETED カラムの存在**: 多くのACCOUNT_USAGEビューに `DELETED` カラムがあり、削除されたオブジェクトの情報を表示する
- **ID カラムの必要性**: 同名オブジェクトが削除・再作成されると名前での区別が不可能になるため、システムが各オブジェクトに一意のIDを付与し、ACCOUNT_USAGEビューの `ID` カラムに表示
- **ACCOUNT_USAGE vs INFORMATION_SCHEMA の差異まとめ**:

  | 比較項目 | ACCOUNT_USAGE | INFORMATION_SCHEMA |
  |---------|--------------|-------------------|
  | 削除済みオブジェクト | 含む | 含まない |
  | データ保持期間 | 最大365日 | 7〜14日 |
  | レイテンシ | 45分〜3時間 | ほぼリアルタイム |
  | IDカラム | あり（一意ID） | なし |

## 1-3. 公式ドキュメントURL

- [Differences Between Account Usage and Information Schema](https://docs.snowflake.com/en/sql-reference/account-usage#differences-between-account-usage-and-information-schema)

---

## 2-1. 問題文（英語）

> True or False: The ACCOUNT_USAGE views contain information on objects that have been deleted.
>
> A. True
> B. False

## 2-2. 問題文の文法解析

### 文1: "The ACCOUNT_USAGE views contain information on objects that have been deleted."

- **主語 (S)**: The ACCOUNT_USAGE views
- **動詞 (V)**: contain
- **目的語 (O)**: information on objects that have been deleted
- **文型**: SVO
- **注目ポイント**:
  - **"information on ~"**: 「〜に関する情報」。`information about ~` と同義だが、`on` はより限定的・特定的な対象を示すニュアンス
  - **"that have been deleted"**: 関係代名詞 `that` が `objects` を修飾する関係詞節。現在完了形の受動態 `have been deleted`（削除されてきた・削除された状態にある）= 「削除されたオブジェクト」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| contain | 動詞 | 含む、収録する | The view contains records for all dropped objects. |
| deleted | 形容詞/過去分詞 | 削除された | Deleted objects are still tracked in ACCOUNT_USAGE. |

## 2-3. 問題文（日本語）

> 正誤問題：ACCOUNT_USAGEビューは、削除されたオブジェクトに関する情報を含んでいる。
>
> A. True（正しい）
> B. False（誤り）

---

## 3-1. 解説文（英語）

> ACCOUNT_USAGE views include information for all dropped objects. Many of these views include a DELETED column showing the dropped object's information. INFORMATION_SCHEMA does not include dropped objects. Furthermore, because objects can be dropped and recreated with the same name, the account use views include ID columns that display the internal IDs generated and assigned to each object by the system to differentiate amongst object records with the same name.

## 3-2. 解説文の文法解析

### 文1: "ACCOUNT_USAGE views include information for all dropped objects."

- **主語 (S)**: ACCOUNT_USAGE views
- **動詞 (V)**: include
- **目的語 (O)**: information for all dropped objects
- **文型**: SVO
- **注目ポイント**:
  - **"information for ~"**: 「〜の情報・〜に関する情報」。`information on ~` や `information about ~` と同義。`for` は「〜を対象とした」というニュアンス
  - **"dropped objects"**: 過去分詞形容詞。`deleted objects` と同義。Snowflakeのドキュメントでは「DROP コマンドで削除されたオブジェクト」を `dropped` と表現することが多い

### 文2: "Many of these views include a DELETED column showing the dropped object's information."

- **主語 (S)**: Many of these views
- **動詞 (V)**: include
- **目的語 (O)**: a DELETED column
- **修飾語 (M)**: showing the dropped object's information（現在分詞句、DELETEDカラムの機能を説明）
- **文型**: SVO
- **注目ポイント**:
  - **"Many of these views"**: 「これらのビューの多く」。`many` + `of` + 特定のグループ。全てではなく「多く」であることを示す
  - **"showing the dropped object's information"**: 現在分詞句が `a DELETED column` を後置修飾。「削除されたオブジェクトの情報を表示する（カラム）」

### 文3: "INFORMATION_SCHEMA does not include dropped objects."

- **主語 (S)**: INFORMATION_SCHEMA
- **動詞 (V)**: does not include（否定）
- **目的語 (O)**: dropped objects
- **文型**: SVO（否定）
- **注目ポイント**:
  - 文1でACCOUNT_USAGEの特徴を述べた後、文3でINFORMATION_SCHEMAとの対比を示す。前後の対比構造

### 文4: "Furthermore, because objects can be dropped and recreated with the same name, the account use views include ID columns that display the internal IDs generated and assigned to each object by the system to differentiate amongst object records with the same name."

- **主語 (S)**: the account use views
- **動詞 (V)**: include
- **目的語 (O)**: ID columns that display the internal IDs generated and assigned to each object by the system
- **目的語の修飾節**: to differentiate amongst object records with the same name
- **従属節**: because objects can be dropped and recreated with the same name（理由）
- **文型**: SVO（because節が理由を修飾）
- **注目ポイント**:
  - **"Furthermore,"**: 「さらに・加えて」。前文に追加情報を続ける接続副詞。`Moreover` や `In addition` と同義。段落・説明の展開でよく使われる
  - **"because objects can be dropped and recreated with the same name"**: 理由節。「オブジェクトが同名で削除・再作成される可能性があるため」。この現実的なシナリオがIDカラムの必要性を説明する
  - **"generated and assigned to each object by the system"**: 過去分詞句が `internal IDs` を後置修飾。`generated`（生成された）と `assigned`（割り当てられた）の2つの過去分詞を `and` で並列。`by the system`（システムによって）が行為者を示す
  - **"to differentiate amongst ~"**: to不定詞の副詞的用法（目的）。「〜を区別するために」。`differentiate` = 区別する。`amongst` は `among` のイギリス英語表記で「〜の中で・〜間で」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| Furthermore | 接続副詞 | さらに、加えて | Furthermore, ACCOUNT_USAGE includes ID columns. |
| recreate | 動詞 | 再作成する | Objects can be dropped and recreated with the same name. |
| differentiate | 動詞 | 区別する、差別化する | IDs differentiate objects with the same name. |
| amongst | 前置詞 | 〜の中で（among のイギリス英語形） | Differentiate amongst records with the same name. |
| internal ID | 名詞句 | 内部ID、システム割当ID | The system generates internal IDs for each object. |

## 3-3. 解説文（日本語）

> ACCOUNT_USAGEビューは、削除済みのすべてのオブジェクトの情報を含んでいます。これらのビューの多くには `DELETED` カラムがあり、削除されたオブジェクトの情報を表示します。INFORMATION_SCHEMAは削除済みオブジェクトを含みません。さらに、オブジェクトは同名で削除・再作成される可能性があるため、ACCOUNT_USAGEビューには `ID` カラムが含まれており、同名のオブジェクトレコードを区別するためにシステムが各オブジェクトに生成・割り当てた内部IDを表示します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
