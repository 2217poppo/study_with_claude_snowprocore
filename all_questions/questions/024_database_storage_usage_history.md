# 024: DATABASE_STORAGE_USAGE_HISTORY View

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-02
**正答**: A, B, C, F（4つ・部分正解）
- A. This view shows the number of bytes of fail-safe storage used.（**正解・未選択**）
- B. This view shows the number of bytes of database storage used, including Time Travel storage.（**正解・未選択**）
- C. This view shows information for all databases, including deleted databases.（**正解・未選択**）
- D. This view contains real-time information.（誤り・未選択）
- E. This view does not show information for deleted databases.（誤り・未選択）
- F. This view contains information for the last 365 days.（**選択済み・正解**）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| DATABASE_STORAGE_USAGE_HISTORY | ACCOUNT_USAGEスキーマのビュー。データベースごとのストレージ使用量（通常・Time Travel・Fail-safe）を最大365日間記録する |
| ACCOUNT_USAGE スキーマ | アカウント全体の使用状況・履歴を保持するシステムスキーマ。最大45分〜3時間の遅延あり（リアルタイムではない） |
| Latency（レイテンシ・遅延） | データが実際の変更からビューに反映されるまでの時間差。ACCOUNT_USAGEビューは最大数時間の遅延がある |
| Deleted Database（削除済みデータベース） | DROP DATABASE で削除されたデータベース。ACCOUNT_USAGEビューは削除済みオブジェクトの履歴も保持する |
| Fail-safe Storage | Time Travel後にSnowflakeが内部保持する障害回復用ストレージ。DATABASE_STORAGE_USAGE_HISTORYで別途バイト数が表示される |

## 1-2. 重要コンセプトまとめ

- **DATABASE_STORAGE_USAGE_HISTORY の4つの特性**（全問正解に必要）:
  1. ✅ **Fail-safeのバイト数を表示** — Time Travelとは別に記録
  2. ✅ **Time Travelを含むデータベースストレージのバイト数を表示**
  3. ✅ **削除済みデータベースを含む全データベースの情報を表示**
  4. ✅ **過去365日間のデータを保持**

- **誤りの選択肢（試験ひっかけ）**:
  - ❌「リアルタイム情報を含む」→ **最大3時間の遅延あり**（ACCOUNT_USAGEビュー共通の特性）
  - ❌「削除済みDBの情報を表示しない」→ **表示する**（ACCOUNT_USAGEは削除済みオブジェクトも含む）

- **ACCOUNT_USAGE スキーマの共通特性**（試験頻出）:
  | 特性 | 値 |
  |------|-----|
  | 保持期間 | **365日** |
  | 遅延 | **最大45分〜数時間**（ビューによる）。DATABASE_STORAGE_USAGE_HISTORYは最大**3時間** |
  | 削除済みオブジェクト | **含む** |
  | リアルタイム | **非対応** |

- **INFORMATION_SCHEMA との比較**（Q013 の復習）:
  | 項目 | ACCOUNT_USAGE | INFORMATION_SCHEMA |
  |------|-------------|------------------|
  | 保持期間 | 365日 | 7〜14日 |
  | 遅延 | あり（数時間） | ほぼリアルタイム |
  | 削除済みオブジェクト | 含む | 含まない |

- **今回の失点ポイント**: 4択問題で1つしか選べなかった。ACCOUNT_USAGEビューの共通特性（365日・遅延あり・削除済み含む）と、このビュー固有の特性（Fail-safe・Time Travel両方のストレージを表示）を組み合わせて覚える必要がある

## 1-3. 公式ドキュメントURL

- [DATABASE_STORAGE_USAGE_HISTORY View](https://docs.snowflake.com/en/sql-reference/account-usage/database_storage_usage_history)

---

## 2-1. 問題文（英語）

> Which of the following is true for the DATABASE_STORAGE_USAGE_HISTORY view in the ACCOUNT_USAGE schema?
>
> Select four answers.
>
> A. This view shows the number of bytes of fail-safe storage used.
> B. This view shows the number of bytes of database storage used, including Time Travel storage.
> C. This view shows information for all databases, including deleted databases.
> D. This view contains real-time information.
> E. This view does not show information for deleted databases.
> F. This view contains information for the last 365 days.

## 2-2. 問題文の文法解析

### 文1: "Which of the following is true for the DATABASE_STORAGE_USAGE_HISTORY view in the ACCOUNT_USAGE schema?"

- **主語 (S)**: Which of the following（単数扱い → is）
- **動詞 (V)**: is
- **補語 (C)**: true
- **修飾語 (M)**: for the DATABASE_STORAGE_USAGE_HISTORY view in the ACCOUNT_USAGE schema
- **文型**: SVC + M
- **注目ポイント**:
  - 「for ~」は「〜について、〜に関して」。対象のビューを指定する
  - 「in the ACCOUNT_USAGE schema」で所属スキーマを明示

### 選択肢の文法注目点

- **A**: 「the number of bytes of fail-safe storage used」— `of + 名詞 + of + 名詞` の連鎖で「使用されたFail-safeストレージのバイト数」
- **B**: 「including Time Travel storage」— 分詞構文（付帯状況）。「Time Travelストレージを含めて」
- **C**: 「including deleted databases」— B同様の分詞構文。「削除済みDBを含む」
- **D**: 「real-time information」— 「リアルタイム情報」。これが **False** のひっかけ
- **E**: 「does not show information for deleted databases」— 否定形の主張。これも **False** のひっかけ

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| fail-safe storage | noun phrase | フェイルセーフストレージ（障害回復用） | This view shows bytes of fail-safe storage separately. |
| including ~ | 分詞（前置詞的） | 〜を含む | All databases, including deleted ones, are shown. |
| real-time | adjective | リアルタイムの、即時の | ACCOUNT_USAGE views are not real-time (latency exists). |
| latency | noun | 遅延（時間差） | This view has a latency of up to 3 hours. |

## 2-3. 問題文（日本語）

> ACCOUNT_USAGEスキーマのDATABASE_STORAGE_USAGE_HISTORYビューについて正しい記述はどれですか？
>
> 4つ選びなさい。
>
> A. このビューはFail-safeストレージの使用バイト数を表示する。
> B. このビューは、Time Travelストレージを含むデータベースストレージの使用バイト数を表示する。
> C. このビューは、削除済みデータベースを含む全データベースの情報を表示する。
> D. このビューはリアルタイム情報を含む。
> E. このビューは削除済みデータベースの情報を表示しない。
> F. このビューは過去365日間の情報を含む。

---

## 3-1. 解説文（英語）

> The DATABASE_STORAGE_USAGE_HISTORY view in the ACCOUNT_USAGE schema shows the number of bytes of database storage used by each database, including information for data that is in Time Travel. The view also separately shows the number of bytes in fail-safe storage. Like other ACCOUNT_USAGE views, the data for the last 365 days is shown; this view can have a latency of up to 3 hours (not real-time) and includes deleted objects.

## 3-2. 解説文の文法解析

### 文1: "The DATABASE_STORAGE_USAGE_HISTORY view in the ACCOUNT_USAGE schema shows the number of bytes of database storage used by each database, including information for data that is in Time Travel."

- **主語 (S)**: The DATABASE_STORAGE_USAGE_HISTORY view in the ACCOUNT_USAGE schema
- **動詞 (V)**: shows
- **目的語 (O)**: the number of bytes of database storage used by each database
- **分詞構文**: including information for data that is in Time Travel
- **文型**: SVO + 分詞構文
- **注目ポイント**:
  - 「used by each database」は過去分詞の後置修飾。「各データベースによって使用された（バイト数）」
  - 「including information for data that is in Time Travel」の that は関係代名詞。「Time Travel中のデータに関する情報を含む」

### 文2: "Like other ACCOUNT_USAGE views, the data for the last 365 days is shown; this view can have a latency of up to 3 hours (not real-time) and includes deleted objects."

- **比較の前置詞句**: Like other ACCOUNT_USAGE views（「他のACCOUNT_USAGEビューと同様に」）
- **主節1**: the data for the last 365 days is shown（受動態）
- **セミコロン（;）**: 密接に関連した2つの節をつなぐ
- **主節2**: this view can have a latency of up to 3 hours and includes deleted objects
- **注目ポイント**:
  - 「Like other ~」の Like は「〜と同様に」を示す前置詞。他のビューとの共通性を示す
  - 「up to 3 hours」は「最大3時間」。上限を示す表現
  - セミコロン（;）は関連する2文をピリオドより緩やかにつなぐ記号

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| separately | adverb | 別々に、別途 | Fail-safe bytes are shown separately from Time Travel bytes. |
| like other ~ | 前置詞句 | 他の〜と同様に | Like other ACCOUNT_USAGE views, data is kept for 365 days. |
| up to ~ | phrase | 最大〜まで | This view can have a latency of up to 3 hours. |
| latency | noun | 遅延 | A latency of up to 3 hours means it is not real-time. |

## 3-3. 解説文（日本語）

> ACCOUNT_USAGEスキーマのDATABASE_STORAGE_USAGE_HISTORYビューは、各データベースが使用しているデータベースストレージのバイト数を表示します（Time Travel中のデータに関する情報も含みます）。また、Fail-safeストレージのバイト数も別途表示されます。他のACCOUNT_USAGEビューと同様に、過去365日間のデータが表示されます。このビューは最大3時間の遅延が発生することがあり（リアルタイムではない）、削除済みオブジェクトも含まれます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
