# 102: Reader Account — Share Data with Non-Snowflake Users

**SnowPro Core Domain**: Domain 5 — Data Sharing and Collaboration
**作成日**: 2026-04-06
**正答**: True
**ユーザー回答**: False（不正解）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Reader Account（リーダーアカウント） | データプロバイダーが**非Snowflakeユーザー・非Snowflake組織**とデータを共有するために作成する特別なSnowflakeアカウント。データを受け取る側はSnowflakeアカウントを持つ必要がなく、プロバイダーが管理する。**共有専用（solely for sharing purposes）**で作成される |
| Data Provider（データプロバイダー） | Snowflakeのデータ共有においてデータを提供する側。Reader Accountを作成し、コンシューマーにデータアクセスを提供する役割を持つ |
| Non-Snowflake User（非Snowflakeユーザー） | Snowflakeアカウントを持たないユーザーまたは組織。通常のSecure Data SharingはSnowflakeアカウント間でしか機能しないが、Reader Accountを使うことで非Snowflakeユーザーともデータ共有が可能になる |
| Secure Data Sharing（セキュアデータ共有） | Snowflakeのデータ共有機能。データをコピーせずに別のSnowflakeアカウントにリアルタイムでデータアクセスを提供する。通常はSnowflakeアカウント間が前提だが、Reader Accountで非Snowflakeユーザーにも拡張できる |

## 1-2. 重要コンセプトまとめ

- **True = Reader Accountで非Snowflakeユーザーとも共有可能**: 相手がSnowflakeアカウントを持っていなくても、Reader Accountを介してデータ共有できる
- **Reader Accountの目的**: **非Snowflakeユーザー/組織**とのデータ共有（これが本問のポイント）
- **作成者**: データプロバイダーが作成・管理する（ACCOUNTADMINが実行）
- **作成目的**: 共有専用（`solely for sharing purposes`）— 汎用アカウントではない
- **よくある誤解**: データ共有はSnowflakeアカウント間のみと思いがちだが、Reader Accountにより非Snowflake側にも拡張できる
- **Q018との関連**: Q018でReader Accountの基本を学習済み。本問は「非Snowflakeユーザーとの共有」というユースケースをより具体的に問う

## 1-3. 公式ドキュメントURL

- [Creating Reader Accounts](https://docs.snowflake.com/en/user-guide/data-sharing-reader-create)

---

## 2-1. 問題文（英語）

> True or False: A reader account can be used to share data with a non-Snowflake user or a non-Snowflake organization.
>
> A. True
> B. False

## 2-2. 問題文の文法解析

### 文1: "A reader account can be used to share data with a non-Snowflake user or a non-Snowflake organization."

- **主語 (S)**: A reader account
- **動詞 (V)**: can be used（受動態）
- **目的（to不定詞）**: to share data
- **修飾語 (M)**: with a non-Snowflake user or a non-Snowflake organization
- **文型**: SV（受動態）
- **注目ポイント**:
  - **"can be used to share data"**: `can be used to do`（〜するために使うことができる）。受動態 `be used` + 目的を示す `to不定詞`。「用途・目的」を述べる技術文書の定番パターン
  - **"a non-Snowflake user or a non-Snowflake organization"**: 「非Snowflakeユーザーまたは非Snowflake組織」。`non-` 接頭辞で「〜ではない・〜に属さない」を示す複合形容詞。`or` で個人（user）と組織（organization）の両方をカバー。これがTrueである核心

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| reader account | 名詞句 | リーダーアカウント | A reader account is created to share data with non-Snowflake users. |
| non-Snowflake | 形容詞 | 非Snowflake・Snowflakeアカウントを持たない | Share data with a non-Snowflake organization using a reader account. |
| organization | 名詞 | 組織・機関 | A non-Snowflake organization can access data via a reader account. |

## 2-3. 問題文（日本語）

> 正誤問題：リーダーアカウントは、非Snowflakeユーザーまたは非Snowflake組織とデータを共有するために使用できる。
>
> A. True（正しい）
> B. False（誤り）

---

## 3-1. 解説文（英語）

> Sharing data with a non-Snowflake user or organization is possible by creating a reader account. This reader account is created by the data provider solely for sharing purposes.

## 3-2. 解説文の文法解析

### 文1: "Sharing data with a non-Snowflake user or organization is possible by creating a reader account."

- **主語 (S)**: Sharing data with a non-Snowflake user or organization（動名詞句）
- **動詞 (V)**: is
- **補語 (C)**: possible
- **修飾語 (M)**: by creating a reader account（手段）
- **文型**: SVC
- **注目ポイント**:
  - **"Sharing ~ is possible by creating ~"**: 動名詞句が主語に立つ構文。`is possible by + 動名詞`（〜することによって可能になる）で「実現手段」を示す。`It is possible to share ~ by creating ~` の変形で書き言葉的な強調
  - **"is possible by creating ~"**: `possible`（可能な）+ `by + 動名詞`（〜することによって）。手段を示す `by` 句が補語 `possible` にかかる。`achievable by ~` や `done by ~` と同様のパターン

### 文2: "This reader account is created by the data provider solely for sharing purposes."

- **主語 (S)**: This reader account
- **動詞 (V)**: is created（受動態）
- **行為者 (A)**: by the data provider
- **修飾語 (M)**: solely for sharing purposes
- **文型**: SV（受動態）
- **注目ポイント**:
  - **"is created by the data provider"**: 受動態で作成者（data provider）を明示。`by + 行為者` で誰が作るかを強調
  - **"solely for sharing purposes"**: 「共有目的のみのために」。`solely`（専ら・のみ）が「それ以外の目的はない」を強調。`for ~ purposes`（〜の目的で）は行為の意図を示すフォーマルな表現。`solely for ~` は専用目的の強調定型句

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| is possible by + 動名詞 | 構文 | 〜することによって可能になる | Sharing data is possible by creating a reader account. |
| solely for ~ purposes | 副詞句 | 〜目的のみのために・専ら〜のために | The account is created solely for sharing purposes. |
| data provider | 名詞句 | データプロバイダー（データを提供する側） | The reader account is created by the data provider. |

## 3-3. 解説文（日本語）

> 非SnowflakeユーザーまたはSnowflake組織ではない組織とのデータ共有は、リーダーアカウントを作成することで可能になります。このリーダーアカウントはデータプロバイダーが共有目的のみのために作成します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
