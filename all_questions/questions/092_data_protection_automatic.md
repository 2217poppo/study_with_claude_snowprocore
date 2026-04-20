# 092: Automatic Data Protection — Time Travel & Fail-Safe

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-06
**正答**: C・E（2つ選択）
- C: Time Travel
- E: Fail-Safe

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Time Travel（タイムトラベル） | Snowflakeが**自動的に**提供するデータ保護機能。過去のデータへのアクセス・取得・復元が可能。保持期間はStandard=最大1日、Enterprise以上=最大90日 |
| Fail-Safe（フェイルセーフ） | Snowflakeが**自動的に**提供するデータ保護機能。Time Travel期間終了後、さらに7日間データを保持する追加の保護層。**ユーザーはアクセス不可**。Snowflakeサポートのみが復元可能 |
| Tape Backups（テープバックアップ） | 磁気テープへのバックアップ（従来のオンプレミス手法）。Snowflakeでは提供されない |
| Backups to on-premises（オンプレミスへのバックアップ） | データをオンプレミス環境にバックアップする手法。Snowflakeではクラウドネイティブな設計のため提供されない |
| Incremental Backups（増分バックアップ） | 前回バックアップ以降の差分のみを保存する手法。Snowflakeではこの名称の機能は提供されない（Time TravelとFail-Safeが代替機能に相当） |

## 1-2. 重要コンセプトまとめ

- **Snowflakeが自動提供するデータ保護機能 = Time Travel + Fail-Safe のみ**
- **Time Travel と Fail-Safe の保護期間**:
  ```
  通常データ → [Time Travel: 1〜90日] → [Fail-Safe: +7日] → 完全削除
  ```
- **Fail-Safeの重要ポイント**: Time Travel期間が「expired（失効）」した後に7日間追加保護。ユーザーアクセス不可、Snowflakeサポートのみ復元可能
- **誤りの選択肢がすべて「従来型バックアップ」**: Tape・On-premises・Incrementalはすべてオンプレミス時代の概念。クラウドネイティブなSnowflakeは独自の保護機能で代替している
- **"automatically" がキーワード**: Snowflakeは設定不要でTime TravelとFail-Safeを自動的に提供する（オプトアウトは一部可能だが、デフォルトは自動）

## 1-3. 公式ドキュメントURL

- [Understanding Snowflake Table Storage](https://docs.snowflake.com/en/user-guide/data-storage)
- [Time Travel](https://docs.snowflake.com/en/user-guide/data-time-travel)
- [Understanding & Viewing Fail-safe](https://docs.snowflake.com/en/user-guide/data-failsafe)

---

## 2-1. 問題文（英語）

> Snowflake provides which of the following data protection features automatically? Select all that apply.
>
> A. Tape Backups
> B. Backups to on-premises
> C. Time Travel
> D. Incremental Backups
> E. Fail-Safe

## 2-2. 問題文の文法解析

### 文1: "Snowflake provides which of the following data protection features automatically?"

- **主語 (S)**: Snowflake
- **動詞 (V)**: provides
- **目的語 (O)**: which of the following data protection features（疑問詞句が目的語）
- **修飾語 (M)**: automatically（副詞）
- **文型**: SVO（疑問文）
- **注目ポイント**:
  - **"Snowflake provides ~ automatically"**: 主語（Snowflake）が目的語（機能）を提供する。`automatically`（自動的に）が文末に置かれ「ユーザーが設定しなくても」を強調
  - **"data protection features"**: 「データ保護機能」。`protection`（保護）の形容詞的用法で `features`（機能）を修飾する複合名詞
  - 通常の疑問文は `Which of the following does Snowflake provide?` だが、本問は `Snowflake provides which of the following ~?` という語順で、疑問詞が目的語位置に残る形

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| automatically | 副詞 | 自動的に | Snowflake automatically provides Time Travel and Fail-Safe. |
| data protection | 名詞句 | データ保護 | Data protection features prevent accidental data loss. |
| on-premises | 形容詞 | オンプレミスの | Backups to on-premises are not provided by Snowflake. |

## 2-3. 問題文（日本語）

> Snowflakeが自動的に提供するデータ保護機能はどれですか？当てはまるものをすべて選んでください。
>
> A. テープバックアップ
> B. オンプレミスへのバックアップ
> C. Time Travel
> D. 増分バックアップ
> E. Fail-Safe

---

## 3-1. 解説文（英語）

> Snowflake provides Time Travel & Fail-Safe. Time Travel enables accessing, retrieving, and recovering past data stored in tables. The time travel can range between one and ninety days.
>
> Failsafe storage retains data for an additional seven days after the time travel duration has expired. Failsafe adds another layer of protection against data loss; however, only Snowflake support can recover data from failsafe storage.

## 3-2. 解説文の文法解析

### 文1: "Time Travel enables accessing, retrieving, and recovering past data stored in tables."

- **主語 (S)**: Time Travel
- **動詞 (V)**: enables
- **目的語 (O)**: accessing, retrieving, and recovering past data stored in tables（動名詞3つの並列）
- **文型**: SVO
- **注目ポイント**:
  - **"enables + 動名詞"**: `enable + O + to do`（SVOCの使役構文）とは異なり、`enable + 動名詞` で「〜することを可能にする」。主語が機能（Time Travel）で目的語が動名詞のパターン
  - **"accessing, retrieving, and recovering"**: 3つの動名詞を並列。`accessing`（アクセス）・`retrieving`（取得）・`recovering`（復元）の3段階の操作
  - **"past data stored in tables"**: `stored in tables`（過去分詞）が `past data` を後置修飾

### 文2: "The time travel can range between one and ninety days."

- **主語 (S)**: The time travel
- **動詞 (V)**: can range
- **修飾語 (M)**: between one and ninety days（範囲を示す前置詞句）
- **文型**: SV
- **注目ポイント**:
  - **"range between X and Y"**: 「XからYの範囲にわたる」。`range from X to Y` と同義。範囲・幅を示す自動詞 `range` の慣用表現

### 文3: "Failsafe storage retains data for an additional seven days after the time travel duration has expired."

- **主語 (S)**: Failsafe storage
- **動詞 (V)**: retains
- **目的語 (O)**: data
- **修飾語 (M1)**: for an additional seven days（期間）
- **修飾語 (M2)**: after the time travel duration has expired（時間節）
- **文型**: SVO
- **注目ポイント**:
  - **"for an additional seven days"**: 「さらに7日間追加で」。`an additional` = 「追加の・さらなる」。`extra` と同義だがよりフォーマル
  - **"after ~ has expired"**: 「〜が失効した後」。`expire`（期限が切れる）の現在完了形 `has expired` で「Time Travelの保持期間が終わった状態」を示す時間節

### 文4: "Failsafe adds another layer of protection against data loss; however, only Snowflake support can recover data from failsafe storage."

- **前半の主語 (S)**: Failsafe
- **前半の動詞 (V)**: adds
- **前半の目的語 (O)**: another layer of protection against data loss
- **後半の主語 (S)**: only Snowflake support
- **後半の動詞 (V)**: can recover
- **後半の目的語 (O)**: data
- **文型**: SVO ; SVO（; however で対比）
- **注目ポイント**:
  - **"adds another layer of protection against ~"**: 「〜に対する保護のレイヤーをもう一つ追加する」。`layer of protection`（保護の層）は多層防御の概念を示すセキュリティ文書の定番表現
  - **"; however,"**: セミコロン + however でFail-Safeの制限（ユーザーアクセス不可）を対比する
  - **"only Snowflake support can recover"**: `only` が `Snowflake support`（行為者）を限定。「Snowflakeサポートだけが復元できる」= エンドユーザーはできない

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| range between X and Y | 動詞句 | X〜Yの範囲にわたる | Time Travel can range between 1 and 90 days. |
| an additional ~ | 形容詞句 | さらに〜、追加の | Fail-Safe retains data for an additional 7 days. |
| expire | 動詞 | 失効する、期限が切れる | The Time Travel duration has expired after 90 days. |
| layer of protection | 名詞句 | 保護の層 | Fail-Safe adds another layer of protection against data loss. |
| retain | 動詞 | 保持する、保留する | Fail-Safe retains data for 7 days after Time Travel expires. |

## 3-3. 解説文（日本語）

> SnowflakeはTime TravelとFail-Safeを提供しています。Time Travelはテーブルに保存された過去のデータへのアクセス・取得・復元を可能にします。Time Travelの保持期間は1日から90日の範囲で設定できます。
>
> Fail-Safeストレージは、Time Travelの保持期間が失効した後、さらに7日間データを保持します。Fail-Safeはデータ損失に対するもう一つの保護層を追加しますが、Fail-Safeストレージからデータを復元できるのはSnowflakeサポートのみです。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
