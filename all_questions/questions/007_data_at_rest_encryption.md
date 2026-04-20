# 007: Data at Rest Encryption

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-02
**正答**: A・C・D の3つ（複数選択）
- A. Snowflake manages encryption keys by default（正しい選択・未選択）
- B. Snowflake uses AES-128-bit encryption to encrypt data at rest（選択したが不正解）← **AES-256が正しい**
- C. Snowflake rekeys encrypted data after 1 year（正しい選択・未選択）
- D. Every 30 days, Snowflake rotates the keys used for encryption（選択済み・正解）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Data at Rest（保存データ） | ストレージに保存されている静止状態のデータ。転送中のデータ（Data in Transit）と対比される。Snowflakeはデフォルトで保存データを暗号化する。 |
| AES-256（Advanced Encryption Standard 256-bit） | Snowflakeが保存データの暗号化に使用する暗号化規格。256ビット鍵を使用する。128ビットより強度が高い。試験ではAES-128と混同させるひっかけが頻出。 |
| Encryption Key（暗号化キー） | データを暗号化・復号化するために使われる鍵。Snowflakeはデフォルトでこのキーを自動管理する。 |
| Key Rotation（キーローテーション） | 暗号化キーを定期的に新しいキーに切り替えること。Snowflakeは**30日ごと**に自動実行する。セキュリティのベストプラクティス。 |
| Rekeying（再暗号化） | 既存の暗号化データを新しいキーで再暗号化すること。Snowflakeは**1年ごと**に自動実行する。Key Rotationとは異なり、データ自体を新しいキーで暗号化し直す。 |
| Tri-Secret Secure | Snowflakeのオプション機能（Business Critical以上）。顧客がSnowflakeと鍵を共同管理することでさらに強固なセキュリティを実現する。デフォルトはSnowflakeが単独で鍵を管理。 |

## 1-2. 重要コンセプトまとめ

- **Snowflakeのデータ暗号化の4つのポイント（全て正答候補）**:
  1. **デフォルトでキーを自動管理**（顧客の操作不要）
  2. **AES-256-bit**暗号化（128ではなく256！）
  3. **30日ごと**にキーローテーション
  4. **1年ごと**に再暗号化（Rekeying）

- **Key Rotation と Rekeying の違い**（試験で混同しやすい）:

  | 操作 | 頻度 | 内容 |
  |------|------|------|
  | Key Rotation（キーローテーション） | **30日** | 新しいキーに切り替える |
  | Rekeying（再暗号化） | **1年** | データを新しいキーで暗号化し直す |

- **今回の解答の振り返り**:
  - B「AES-128」を選択 → **誤り。正しくはAES-256**
  - A「デフォルトでキー管理」とC「1年後に再暗号化」を見逃した
- 暗号化とキー管理はユーザーに透明（transparent）= 意識せず使える
- **試験ポイント**: 「AES-256」「30日ローテーション」「1年再暗号化」の3つの数字を確実に覚える

## 1-3. 公式ドキュメントURL

- [Encryption Key Management](https://docs.snowflake.com/en/user-guide/security-encryption-manage)

---

## 2-1. 問題文（英語）

> Which of the following statements accurately describes Snowflake's encryption for data at rest? Select all that apply.
>
> A. Snowflake manages encryption keys by default
> B. Snowflake uses AES-128-bit encryption to encrypt data at rest
> C. Snowflake rekeys encrypted data after 1 year
> D. Every 30 days, Snowflake rotates the keys used for encryption

## 2-2. 問題文の文法解析

### 文1: "Which of the following statements accurately describes Snowflake's encryption for data at rest?"

- **主語 (S)**: Which of the following statements
- **副詞 (M)**: accurately（「正確に」）
- **動詞 (V)**: describes（三人称単数現在）
- **目的語 (O)**: Snowflake's encryption for data at rest
- **文型**: SVO
- **注目ポイント**:
  - 「accurately describes」は「正確に説明している」。正しい記述を選ぶ問題であることを示す
  - 「data at rest」は「保存データ」。「at rest」は「静止した」状態。「data in transit（転送中のデータ）」と対比

### 文2（指示文）: "Select all that apply."

- **動詞 (V)**: Select（命令形）
- **目的語 (O)**: all that apply（関係詞節：「該当するもの全て」）
- **注目ポイント**: 複数選択問題の指示文として試験で頻出。「当てはまるものをすべて選べ」

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| accurately | adverb | 正確に | Which statement accurately describes the feature? |
| data at rest | noun phrase | 保存データ（静止状態のデータ） | AES-256 is used to encrypt data at rest. |
| select all that apply | 慣用句 | 該当するものをすべて選べ | Select all that apply — multiple answers may be correct. |
| rekey | verb | 再暗号化する（新しいキーで暗号化し直す） | Snowflake rekeys data annually. |
| rotate | verb | （鍵を）ローテーションする、切り替える | Keys are rotated every 30 days. |

## 2-3. 問題文（日本語）

> 次のうち、保存データに対するSnowflakeの暗号化を正確に説明しているものはどれですか？該当するものをすべて選びなさい。
>
> A. Snowflakeはデフォルトで暗号化キーを管理する
> B. Snowflakeは保存データの暗号化にAES-128ビット暗号化を使用する
> C. Snowflakeは暗号化データを1年後に再暗号化する
> D. Snowflakeは30日ごとに暗号化に使用するキーをローテーションする

---

## 3-1. 解説文（英語）

> By default, Snowflake manages encryption keys automatically, requiring no customer intervention. Snowflake-managed keys are rotated regularly (at 30-day intervals), and an annual rekeying process re-encrypts data with new keys. The data encryption and key management processes are entirely transparent to the users. Snowflake uses AES 256-bit encryption to encrypt data at rest.

## 3-2. 解説文の文法解析

### 文1: "By default, Snowflake manages encryption keys automatically, requiring no customer intervention."

- **修飾語 (M)**: By default（「デフォルトでは」）
- **主語 (S)**: Snowflake
- **動詞 (V)**: manages
- **目的語 (O)**: encryption keys
- **副詞 (M)**: automatically
- **分詞構文**: requiring no customer intervention（「顧客の介入を必要とせずに」）
- **文型**: M + SVO + M + 分詞構文
- **注目ポイント**:
  - 「By default」は「デフォルトでは（設定変更なしの初期状態では）」。試験頻出の表現
  - 「requiring no ~」は否定の動名詞分詞構文。「～を必要とすることなく」

### 文2: "Snowflake-managed keys are rotated regularly (at 30-day intervals), and an annual rekeying process re-encrypts data with new keys."

- **主語1 (S1)**: Snowflake-managed keys（複合形容詞 Snowflake-managed が修飾）
- **動詞1 (V1)**: are rotated（受動態）
- **修飾語**: regularly（定期的に）/ at 30-day intervals（30日間隔で）
- **主語2 (S2)**: an annual rekeying process
- **動詞2 (V2)**: re-encrypts
- **目的語 (O)**: data
- **修飾語**: with new keys
- **文型**: S1 + V1（受動態）+ M, and S2 + V2 + O + M
- **注目ポイント**:
  - 「at 30-day intervals」は「30日間隔で」。「at intervals of ~」は頻度を示す表現
  - 「annual」は「年1回の」。rekeying の頻度（1年）を示す重要な形容詞

### 文3: "The data encryption and key management processes are entirely transparent to the users."

- **主語 (S)**: The data encryption and key management processes
- **動詞 (V)**: are
- **補語 (C)**: entirely transparent to the users
- **文型**: SVC
- **注目ポイント**:
  - 「transparent to ~」は「～にとって透明な」= ユーザーが意識しなくてよい、裏で自動処理される
  - 技術文書で「transparent」は「見えない（意識しなくていい）」という意味で頻用される

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| by default | phrase | デフォルトでは、初期設定では | By default, Snowflake manages encryption keys. |
| intervention | noun | 介入、干渉 | No customer intervention is required. |
| at N-day intervals | phrase | N日間隔で | Keys are rotated at 30-day intervals. |
| annual | adjective | 年1回の、年次の | An annual rekeying process re-encrypts all data. |
| transparent to | adjective + prep | ～にとって透明な（意識しなくてよい） | The process is transparent to the users. |

## 3-3. 解説文（日本語）

> デフォルトでは、Snowflakeは暗号化キーを自動的に管理し、顧客による操作は一切不要です。Snowflakeが管理するキーは定期的に（30日間隔で）ローテーションされ、年1回の再暗号化プロセスにより、データは新しいキーで再暗号化されます。データの暗号化とキー管理のプロセスは、ユーザーにとって完全に透明（意識する必要がない）です。Snowflakeは保存データの暗号化にAES 256ビット暗号化を使用しています。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
