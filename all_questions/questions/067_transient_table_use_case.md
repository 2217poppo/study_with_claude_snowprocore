# 067: Transient Table — ETL Pipeline Use Case

**SnowPro Core Domain**: Domain 5 — Data Collaboration (Data Protection)
**作成日**: 2026-04-03
**正答**: B（Transient Table）

> 関連問題: 015（Transient Table Time Travel）・056（Fail-Safe Access）・058（Fail-Safe Disable）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Transient Table（トランジェントテーブル） | Fail-Safeなし・Time Travel最大1日のテーブル。**セッションをまたいで存在し**、複数の独立したプロセス・セッションからアクセス可能。ストレージコスト最小化に最適 |
| Temporary Table（テンポラリテーブル） | Fail-Safeなし・Time Travel最大1日のテーブル。ただし**現在のセッション内のみ**存在し、セッション終了で削除される。他セッションからはアクセス不可 |
| Interim Table（中間テーブル） | パイプラインの処理ステップ間でデータを一時的に保持するためのテーブル。正式なSnowflake用語ではなくシナリオの説明語 |
| Data Processing Pipeline（データ処理パイプライン） | 複数のステップ（プロセス）を順番・並列に実行してデータを変換・ロードするワークフロー |
| Fail-Safe Storage（フェイルセーフストレージ） | Permanent Tableが持つ7日間の内部保護ストレージ。Transient/Temporaryはゼロ日でコストが発生しない |

## 1-2. 重要コンセプトまとめ

- **この問題のキーワードと対応する選択理由**:

  | 問題の条件 | 対応するTransientの特性 |
  |-----------|----------------------|
  | 「一時的に保存」 | セッション終了後も存在する（削除まで再利用可） |
  | 「複数の独立したプロセスが使用」 | **セッションをまたいでアクセス可能** ← Temporaryとの決定的な違い |
  | 「ストレージコストを最小化」 | **Fail-Safeなし・Time Travelも1日** → 余分なストレージ料金なし |
  | 「毎回削除してロード」 | 復元保証が不要（Fail-Safeがなくても問題なし） |

- **TransientとTemporaryの最重要な違い**（試験頻出）:

  | | Transient | Temporary |
  |--|-----------|-----------|
  | セッションまたぎ | **可能** ← この問題のポイント | **不可**（セッション終了で消える） |
  | Fail-Safe | なし（0日） | なし（0日） |
  | Time Travel | 最大1日 | 最大1日 |

- **Permanentを選ばない理由**: Fail-Safe 7日分のストレージコストが発生する。日次で削除・再ロードするデータには不要

- **Externalを選ばない理由**: 読み取り専用（INSERT/DELETE不可）。データを書き込むパイプラインには使えない

## 1-3. 公式ドキュメントURL

- [Temporary & Transient Tables](https://docs.snowflake.com/en/user-guide/tables-temp-transient)

---

## 2-1. 問題文（英語）

> As part of a data processing pipeline, you are required to store data temporarily in an interim table. The first process in the pipeline deletes all existing data in the interim table and loads new data. Several independent processes in the pipeline use the data in the interim table. You are required to minimize data storage costs. Which type of table will you create?
>
> A. Temporary
> B. Transient
> C. External
> D. Permanent

## 2-2. 問題文の文法解析

### 文1: "As part of a data processing pipeline, you are required to store data temporarily in an interim table."

- **修飾語 (M)**: As part of a data processing pipeline（データ処理パイプラインの一部として）← `as part of ~` = 「〜の一部として」
- **主語 (S)**: you
- **動詞 (V)**: are required to store（保存することが求められる）← `be required to do` = 「〜することが要求される」
- **注目ポイント**: `be required to do` = 「〜することが要求されている・〜しなければならない」。要件定義・制約を示す受動態表現

### 文2: "The first process in the pipeline deletes all existing data in the interim table and loads new data."

- **主語 (S)**: The first process in the pipeline（パイプラインの最初のプロセスが）
- **動詞 (V)**: deletes ... and loads（削除し...ロードする）← 2動詞の並列
- **目的語1**: all existing data in the interim table（中間テーブルの既存データをすべて）
- **目的語2**: new data（新しいデータを）
- **注目ポイント**: `existing data` = 「既存のデータ」。`all existing data` で「残らずすべて削除」を意味する

### 文3: "Several independent processes in the pipeline use the data in the interim table."

- **主語 (S)**: Several independent processes in the pipeline（パイプライン内の複数の独立したプロセスが）
- **動詞 (V)**: use（使用する）
- **注目ポイント**: `independent processes` = 「独立したプロセス」。それぞれが別セッションで動く可能性を示唆 → Temporary（セッション限定）では不可

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| as part of ~ | 前置詞句 | 〜の一部として | As part of a pipeline, data is loaded. |
| be required to do | 受動態熟語 | 〜することが要求される | You are required to minimize storage costs. |
| interim | 形容詞 | 中間の・暫定的な | Data is stored in an interim table. |
| existing | 形容詞 | 既存の・現存する | All existing data is deleted first. |
| independent | 形容詞 | 独立した・互いに依存しない | Several independent processes use the data. |
| minimize | 動詞 | 最小化する | You are required to minimize storage costs. |

## 2-3. 問題文（日本語）

> データ処理パイプラインの一部として、中間テーブルに一時的にデータを保存することが求められています。パイプラインの最初のプロセスが中間テーブルの既存データをすべて削除して新しいデータをロードします。パイプライン内の複数の独立したプロセスが中間テーブルのデータを使用します。データストレージコストを最小化することが求められています。どのタイプのテーブルを作成しますか？
>
> A. Temporary
> B. Transient
> C. External
> D. Permanent

---

## 3-1. 解説文（英語）

> Based on the requirement, a transient table is a good choice. Transient tables don't have fail-safe storage and have only up to 1 day of Time Travel. A transient table provides a good solution because the data is deleted and reloaded daily in this scenario. Transient tables are also the best option because data must be available across different sessions. Transient tables are available across sessions; independent processes and sessions can access the data in a Transient table.

## 3-2. 解説文の文法解析

### 文1: "Based on the requirement, a transient table is a good choice."

- **分詞構文**: Based on the requirement（要件に基づいて）← `based on ~` = 「〜に基づいて」
- **主語 (S)**: a transient table
- **補語 (C)**: a good choice（良い選択）
- **注目ポイント**: `based on ~` = 「〜に基づいて・〜を踏まえて」。条件・根拠を示す冒頭表現

### 文2: "Transient tables are also the best option because data must be available across different sessions."

- **主語 (S)**: Transient tables
- **補語 (C)**: the best option（最良の選択肢）
- **理由節**: because data must be available across different sessions（データが異なるセッション間で利用可能でなければならないため）← `be available across ~` = 「〜をまたいで利用可能である」
- **注目ポイント**: `across different sessions` = 「異なるセッションをまたいで」。TransientとTemporaryの決定的な違いを示すキーフレーズ

### 文3: "Transient tables are available across sessions; independent processes and sessions can access the data in a Transient table."

- **主語 (S)**: Transient tables（トランジェントテーブルは）
- **動詞 (V)**: are available（利用可能である）
- **修飾語**: across sessions（セッションをまたいで）← セミコロンで補足説明を追加
- **補足**: independent processes and sessions can access the data（独立したプロセスやセッションがデータにアクセスできる）
- **注目ポイント**: `across sessions` = セッションの境界を越えて利用可能なことを示す。`Temporary` との違いを明確化する

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| based on ~ | 分詞句 | 〜に基づいて | Based on the requirement, Transient is best. |
| be available across ~ | 熟語 | 〜をまたいで利用可能である | Data is available across different sessions. |
| across sessions | 副詞句 | セッションをまたいで | Transient tables are available across sessions. |
| in this scenario | 副詞句 | このシナリオでは・この状況では | A transient table is good in this scenario. |

## 3-3. 解説文（日本語）

> 要件に基づくと、トランジェントテーブルが良い選択です。トランジェントテーブルはフェイルセーフストレージを持たず、Time Travelも最大1日のみです。このシナリオではデータが毎日削除・再ロードされるため、トランジェントテーブルは良い解決策を提供します。また、データが異なるセッション間で利用可能でなければならないため、トランジェントテーブルが最良の選択肢です。トランジェントテーブルはセッションをまたいで利用可能で、独立したプロセスやセッションがトランジェントテーブルのデータにアクセスできます。

---

## 復習メモ

- [ ] TransientとTemporaryの決定的な違い（セッションをまたげるか）を説明できる
- [ ] 「複数の独立したプロセス」が使うデータにはTransient（Temporaryでは不可）と判断できる
- [ ] Fail-Safeなし = コスト削減の観点でTransient/Temporaryが有利であることを確認した
- [ ] `based on ~`・`across sessions`・`be required to do` の英語パターンを確認した
- [ ] サンドボックスで `CREATE TRANSIENT TABLE` を試すことができる
