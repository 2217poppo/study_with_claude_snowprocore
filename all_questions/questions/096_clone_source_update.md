# 096: Clone Independence — Source Updates Don't Propagate

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-06
**正答**: False

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Zero-Copy Cloning（ゼロコピークローン） | データをコピーせずにメタデータ（マイクロパーティションへの参照）のみでテーブルを即時複製する機能。クローン作成直後はストレージコストゼロ |
| Clone Independence（クローン独立性） | クローン作成後、ソースとクローンは**完全に独立**。ソーステーブルへのデータ変更（INSERT/UPDATE/DELETE）はクローンテーブルに影響しない。逆も同様 |
| Micro-partition（マイクロパーティション） | Snowflakeのストレージの最小単位。クローン作成時、クローンのメタデータは既存のマイクロパーティションを参照する。クローン後に変更が発生すると、変更されたパーティションのみコピーが作成される（Copy-on-Write方式） |
| Cloud Services Layer（クラウドサービス層） | Snowflakeアーキテクチャの上位層。メタデータ管理・認証・最適化を担当。Zero-Copy Cloningのメタデータもここで管理される |

## 1-2. 重要コンセプトまとめ

- **False = ソース更新はクローンに伝播しない**: クローン作成後、両者は完全に独立したテーブルとして機能する
- **なぜ伝播しないのか**: Snowflakeのクローンは「データのコピー」ではなく「メタデータ（ポインター）のコピー」。クローン後にどちらかを変更すると、そのデータ部分だけが物理的に分岐する（Copy-on-Write）
- **独立性の証明**: ソーステーブルを `DROP TABLE` しても、クローンテーブルは影響を受けない
- **Q030との関連**: Q030でも「クローンは独立」を学習済み。本問はさらに具体的に「ソース更新はクローンに反映されない」というFalse問題
- **Materialized Viewとの比較**: MVは元テーブルの変更を反映して更新されるが、Cloneは独立して更新されない

## 1-3. 公式ドキュメントURL

- [Cloning Tables](https://docs.snowflake.com/en/user-guide/tables-storage-considerations#label-cloning-tables)

---

## 2-1. 問題文（英語）

> True or False: After a table has been cloned, any updates to the data in the source table will automatically update the data in the cloned table.
>
> A. False
> B. True

## 2-2. 問題文の文法解析

### 文1: "After a table has been cloned, any updates to the data in the source table will automatically update the data in the cloned table."

- **主語 (S)**: any updates to the data in the source table
- **動詞 (V)**: will automatically update（未来形）
- **目的語 (O)**: the data in the cloned table
- **従属節**: After a table has been cloned（時間節・現在完了受動態）
- **修飾語 (M)**: automatically（副詞）
- **文型**: SVO
- **注目ポイント**:
  - **"After a table has been cloned"**: 「テーブルがクローンされた後」。現在完了受動態 `has been cloned`（クローンされてしまった状態）が時間節の基準。クローン完了後の状態を条件とする
  - **"any updates to the data in the source table"**: 「ソーステーブル内のデータへのいかなる更新も」。`any`（いかなる〜も）が肯定文で「すべての〜」を示す強調表現。仮定的な影響の全網羅を示す
  - **"will automatically update"**: 未来形 + 副詞 `automatically`（自動的に）。この自動伝播が「False（起こらない）」であることが問題の核心

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| cloned | 過去分詞 | クローンされた | After a table has been cloned, they become independent. |
| automatically | 副詞 | 自動的に | Changes do NOT automatically propagate to the cloned table. |
| source table | 名詞句 | ソーステーブル（元のテーブル） | Dropping the source table doesn't affect the clone. |

## 2-3. 問題文（日本語）

> 正誤問題：テーブルがクローンされた後、ソーステーブルのデータへの更新は、クローンされたテーブルのデータを自動的に更新する。
>
> A. False（誤り）
> B. True（正しい）

---

## 3-1. 解説文（英語）

> Micro-partitions and metadata in the cloud services layer enable rapid and efficient zero-copy cloning because the cloned table's metadata references the existing micro-partitions. The source and cloned items are independent; thus, modifying data in one will not affect the other. For example, the source table can be dropped altogether, which doesn't affect the cloned table.

## 3-2. 解説文の文法解析

### 文1: "Micro-partitions and metadata in the cloud services layer enable rapid and efficient zero-copy cloning because the cloned table's metadata references the existing micro-partitions."

- **主語 (S)**: Micro-partitions and metadata in the cloud services layer
- **動詞 (V)**: enable
- **目的語 (O)**: rapid and efficient zero-copy cloning
- **理由節**: because the cloned table's metadata references the existing micro-partitions
- **文型**: SVO
- **注目ポイント**:
  - **"enable rapid and efficient zero-copy cloning"**: `enable + 形容詞 + 名詞（動名詞）`。「迅速で効率的なゼロコピークローンを可能にする」。形容詞2つを `and` で並列して目的語の名詞句を修飾
  - **"the cloned table's metadata references"**: `'s` の所有格。「クローンされたテーブルのメタデータが参照する」。主語（metadata）+ 動詞（references）で「参照する」
  - **"references the existing micro-partitions"**: `reference`（参照する）は自動詞・他動詞両方使える。技術文書で「データが既存のパーティションを指し示す」を表す

### 文2: "The source and cloned items are independent; thus, modifying data in one will not affect the other."

- **前半の主語 (S)**: The source and cloned items
- **前半の動詞 (V)**: are
- **前半の補語 (C)**: independent
- **後半の主語 (S)**: modifying data in one（動名詞句）
- **後半の動詞 (V)**: will not affect
- **後半の目的語 (O)**: the other
- **文型**: SVC ; SVO（; thus で論理的帰結）
- **注目ポイント**:
  - **"; thus,"**: 「; したがって、」。前文の事実（独立性）から論理的帰結（影響しない）を導く
  - **"one ... the other"**: 「一方と他方」。2つのアイテム（ソースとクローン）を区別して指す代名詞パターン（Q030でも登場）

### 文3: "For example, the source table can be dropped altogether, which doesn't affect the cloned table."

- **主語 (S)**: the source table
- **動詞 (V)**: can be dropped（受動態）
- **修飾語 (M1)**: altogether（副詞「完全に・すっかり」）
- **非制限関係詞節**: which doesn't affect the cloned table
- **文型**: SV（受動態）
- **注目ポイント**:
  - **"dropped altogether"**: 「完全に削除される（DROPされる）」。`altogether`（完全に・まるごと）で「部分的ではなく全体を」を強調。`completely` や `entirely` と同義
  - **", which doesn't affect ~"**: 非制限関係詞節。先行詞は `the source table can be dropped altogether`（前文全体）。「（ソーステーブルが削除されても）それはクローンテーブルに影響しない」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| reference | 動詞 | 参照する、指し示す | The cloned metadata references existing micro-partitions. |
| altogether | 副詞 | 完全に、まるごと | The source table can be dropped altogether. |
| independent | 形容詞 | 独立した | The source and clone are completely independent. |

## 3-3. 解説文（日本語）

> クラウドサービス層のマイクロパーティションとメタデータにより、クローンされたテーブルのメタデータが既存のマイクロパーティションを参照するため、迅速で効率的なゼロコピークローンが可能になります。ソースとクローンのアイテムは独立しているため、一方のデータを変更しても他方には影響しません。例えば、ソーステーブルを完全に削除してもクローンテーブルには影響しません。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
