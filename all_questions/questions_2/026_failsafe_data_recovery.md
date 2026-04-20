# 026: Fail-Safe Data Recovery — 92 Days After Deletion

**SnowPro Core Domain**: Domain 5 — Data Protection & Data Recovery
**作成日**: 2026-04-10
**正答**: C（Contact the Snowflake support team to facilitate the retrieval of this data.）
**ユーザー回答**: C — 正解

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Fail-Safe（フェイルセーフ） | Time Travel期間が終了した後に、Snowflakeが**内部的にデータを7日間**保持する障害回復機能。**ユーザーは直接アクセスできず**、Snowflakeサポートに依頼して復元する |
| Time Travel（タイムトラベル） | 過去の特定時点のデータを参照・復元できる機能。Enterprise版では**最大90日**。ユーザー自身がSQLで操作可能（AT / BEFORE句） |
| Permanent Table（永続テーブル） | Snowflakeの標準テーブル。Time Travel最大90日（Enterprise以上）+ Fail-Safe 7日 = **最大97日間**のデータ保護 |
| Enterprise Edition | Snowflakeの上位エディション。Time Travelを**最大90日**に設定可能（Standardは最大1日） |
| Snowflake Support（Snowflakeサポート） | Snowflakeの公式サポートチーム。Fail-Safeに入ったデータを復元できる**唯一の手段**。ユーザーはFail-Safeデータに直接アクセスできない |

## 1-2. 重要コンセプトまとめ

- **データ保護のタイムライン（Enterprise版・Permanent Table）**:
  ```
  削除 → [Time Travel: 最大90日] → [Fail-Safe: 7日] → データ完全消失
  合計: 最大97日間
  ```
- **92日後のシナリオ分析**:
  - Time Travel期間（90日）は**終了済み** → ユーザー自身ではSQLで復元不可
  - Fail-Safe期間（90日+7日=97日目まで）は**まだ有効** → Snowflakeサポートに依頼すれば復元可能
- **Time Travel vs Fail-Safe の復元方法の違い**:

| 期間 | 復元方法 | 実行者 |
|------|---------|--------|
| **Time Travel期間内**（0〜90日） | `SELECT ... AT / BEFORE`、`UNDROP` | **ユーザー自身** |
| **Fail-Safe期間内**（91〜97日） | Snowflakeサポートに依頼 | **Snowflakeサポートのみ** |
| **97日超** | ソースファイルから再ロード等 | ユーザー自身 |

- **誤答の整理**:
  - ❌ ソースファイルから再ロード → 可能だが「最善の方法」ではない（手間がかかる）。Fail-Safeにデータがある限りサポートに依頼が最善
  - ❌ Time Travelで自分で復元 → 90日を超えているためTime Travelは使えない
  - ❌ 手動バックアップから復元 → Fail-Safeが有効な限り、サポート依頼が最善
- **97日を超えた場合のみ**: ソースファイル再ロードや手動バックアップが唯一の手段になる
- **関連問題**: Q056（Fail-Safe Access）、Q058（Fail-Safe Disable）、Q015（Transient Table Time Travel）

## 1-3. 公式ドキュメントURL

- [Fail-Safe](https://docs.snowflake.com/en/user-guide/data-failsafe)
- [Time Travel](https://docs.snowflake.com/en/user-guide/data-time-travel)

---

## 2-1. 問題文（英語）

> You are using the Enterprise edition of Snowflake. You inadvertently deleted some crucial data from a permanent table. It has been 92 days since the deletion, and you have just realized your mistake. What should be the best course of action to recover that data?
>
> A. Reload the data from the source files again.
> B. Use SQL & Time Travel extensions to retrieve the data yourself.
> C. Contact the Snowflake support team to facilitate the retrieval of this data.
> D. Restore the data from a manual backup into a new table.

## 2-2. 問題文の文法解析

### 文1: "You are using the Enterprise edition of Snowflake."

- **主語 (S)**: You（あなたは）
- **動詞 (V)**: are using（使用している）— 現在進行形
- **目的語 (O)**: the Enterprise edition of Snowflake（SnowflakeのEnterprise版を）
- **文型**: SVO
- **注目ポイント**: 問題の前提条件を設定する文。Enterprise版 = Time Travel最大90日が可能

### 文2: "You inadvertently deleted some crucial data from a permanent table."

- **主語 (S)**: You（あなたは）
- **副詞 (M)**: inadvertently（うっかり）
- **動詞 (V)**: deleted（削除した）
- **目的語 (O)**: some crucial data（重要なデータを）
- **修飾語 (M)**: from a permanent table（永続テーブルから）
- **文型**: SVO
- **注目ポイント**: `inadvertently` は「うっかり、不注意に」。試験問題でよくある誤操作シナリオの導入

### 文3: "It has been 92 days since the deletion, and you have just realized your mistake."

- **主語1 (S1)**: It（形式主語）
- **動詞1 (V1)**: has been（経過した）— 現在完了
- **補語1 (C1)**: 92 days since the deletion（削除から92日）
- **主語2 (S2)**: you
- **動詞2 (V2)**: have just realized（今まさに気づいた）— 現在完了
- **目的語2 (O2)**: your mistake（自分のミスに）
- **文型**: SVC and SVO
- **注目ポイント**: `It has been N days since ~` は「〜からN日が経過した」の定型表現。92日という具体的な数字がTime Travel（90日）を超えていることがポイント

### 文4: "What should be the best course of action to recover that data?"

- **疑問詞 (S)**: What（何が）
- **動詞 (V)**: should be（〜であるべきか）
- **補語 (C)**: the best course of action（最善の行動方針）
- **目的 (M)**: to recover that data（そのデータを復元するために）
- **文型**: SVC（疑問文）
- **注目ポイント**: `the best course of action` は「最善の行動方針」。試験では「最善の方法」を問うため、可能な選択肢が複数あっても最も適切なものを選ぶ

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| inadvertently | adv | うっかり、不注意に | Data was inadvertently deleted from the table. |
| crucial | adj | 極めて重要な | Some crucial data was lost. |
| course of action | noun phrase | 行動方針、対処法 | What is the best course of action? |
| facilitate | verb | 促進する、容易にする | Contact support to facilitate data retrieval. |

## 2-3. 問題文（日本語）

> あなたはSnowflakeのEnterprise版を使用しています。永続テーブルから重要なデータをうっかり削除してしまいました。削除から92日が経過し、今になってミスに気づきました。そのデータを復元するための最善の行動方針は何ですか？
>
> A. ソースファイルからデータを再度ロードする
> B. SQLとTime Travel拡張を使って自分でデータを取得する
> C. Snowflakeサポートチームに連絡してデータの取得を依頼する
> D. 手動バックアップからデータを新しいテーブルに復元する

---

## 3-1. 解説文（英語）

> Assuming the table has 90 days of Time Travel, the most straightforward resolution is to contact Snowflake support, which can recover the data from the fail-safe storage. Once the data is in fail-safe storage, only Snowflake support can help retrieve the data. Restoring data from a manual backup or reloading from a source file is a cumbersome process and should only be undertaken if even the fail-safe storage does not have the data (i.e., it has been more than 97 (90 for Time Travel & 7 for fail-safe storage) days, and the data is removed from both Time Travel and fail-safe.

## 3-2. 解説文の文法解析

### 文1: "Assuming the table has 90 days of Time Travel, the most straightforward resolution is to contact Snowflake support, which can recover the data from the fail-safe storage."

- **分詞構文 (M)**: Assuming the table has 90 days of Time Travel（テーブルのTime Travelが90日であると仮定すると）
- **主語 (S)**: the most straightforward resolution（最も単純明快な解決策は）
- **動詞 (V)**: is（〜である）
- **補語 (C)**: to contact Snowflake support（Snowflakeサポートに連絡すること）
- **関係詞節 (M)**: which can recover the data from the fail-safe storage（Fail-Safeストレージからデータを復元できる）
- **文型**: SVC + 非制限関係詞節
- **注目ポイント**: `Assuming ~` は「〜と仮定すると」の分詞構文（既出パターン）

### 文2: "Once the data is in fail-safe storage, only Snowflake support can help retrieve the data."

- **時間節 (M)**: Once the data is in fail-safe storage（一度データがFail-Safeに入ると）
- **主語 (S)**: only Snowflake support（Snowflakeサポートだけが）
- **動詞 (V)**: can help retrieve（取得を助けることができる）
- **目的語 (O)**: the data（データを）
- **文型**: SVO
- **注目ポイント**: `only ~ can` — 排他的な権限を示す。Fail-Safeデータは**サポートのみ**がアクセス可能

### 文3: "Restoring data from a manual backup or reloading from a source file is a cumbersome process and should only be undertaken if even the fail-safe storage does not have the data."

- **主語 (S)**: Restoring data from a manual backup or reloading from a source file（手動バックアップからの復元やソースファイルからの再ロードは）— 動名詞句
- **動詞 (V)**: is（〜である）
- **補語 (C)**: a cumbersome process（面倒なプロセスである）
- **追加 (V2)**: should only be undertaken（〜の場合にのみ実行されるべきである）
- **条件 (M)**: if even the fail-safe storage does not have the data（Fail-Safeストレージにもデータがない場合にのみ）
- **文型**: SVC and SV（受動態）+ if条件節
- **注目ポイント**: `cumbersome` は「面倒な、厄介な」。Fail-Safe復元より劣る手段であることを示す

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| straightforward | adj | 単純明快な、わかりやすい | The most straightforward resolution is to contact support. |
| cumbersome | adj | 面倒な、厄介な | Manual backup restoration is a cumbersome process. |
| undertake | verb | 引き受ける、実行する | This should only be undertaken as a last resort. |
| retrieve | verb | 取得する、復元する | Snowflake support can retrieve the data. |

## 3-3. 解説文（日本語）

> テーブルのTime Travelが90日であると仮定すると、最も単純明快な解決策はSnowflakeサポートに連絡することです。サポートはFail-Safeストレージからデータを復元できます。一度データがFail-Safeストレージに入ると、Snowflakeサポートだけがデータの取得を支援できます。手動バックアップからの復元やソースファイルからの再ロードは面倒なプロセスであり、Fail-Safeストレージにもデータがない場合（つまり、97日（Time Travel 90日 + Fail-Safe 7日）を超えて、Time TravelとFail-Safeの両方からデータが削除されている場合）にのみ実行すべきです。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
