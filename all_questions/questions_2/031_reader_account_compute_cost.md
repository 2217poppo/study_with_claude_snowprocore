# 031: Reader Account — Compute Cost Responsibility

**SnowPro Core Domain**: Domain 5 — Data Sharing and Collaboration
**作成日**: 2026-04-12
**正答**: B（The data provider is charged for the compute charges for queries the data consumer runs.）
**ユーザー回答**: A（The data consumer is charged）— 不正解

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Reader Account（リーダーアカウント） | データプロバイダーが非Snowflakeユーザーとデータを共有するために作成する特別なアカウント。**プロバイダーが作成・管理**するため、リーダーアカウントのすべてのコンピュートコストは**プロバイダーに請求**される |
| Data Provider（データプロバイダー） | データを共有する側のSnowflakeアカウント。Reader Accountを作成・管理し、そのコンピュートコストを負担する |
| Data Consumer（データコンシューマー） | データを利用する側。Reader Account経由でデータにアクセスする非Snowflakeユーザー/組織 |
| Compute Charges（コンピュート料金） | 仮想ウェアハウスの使用に対して発生する料金。Reader Accountのウェアハウス使用分はプロバイダーアカウントに加算される |
| Non-Snowflake User（非Snowflakeユーザー） | Snowflakeアカウントを持たないユーザーまたは組織。通常のSecure Data Sharingでは利用できないため、Reader Accountが必要 |

## 1-2. 重要コンセプトまとめ

- **Reader Accountのコスト負担は100%プロバイダー**: プロバイダーがReader Accountを作成・管理するため、コンシューマーが実行するクエリのコンピュート料金はすべてプロバイダーに請求される
- **通常のData Sharing（Snowflake間）との違い**:

| 共有方法 | コンピュートコスト負担者 |
|---------|----------------------|
| **通常のSecure Data Sharing**（Snowflake間） | **コンシューマー**が自分のWHを使う → コンシューマー負担 |
| **Reader Account**（非Snowflake向け） | **プロバイダー**が負担（Reader AccountのWH費用） |

- **なぜプロバイダー負担か**: Reader Accountはプロバイダーが「solely for sharing purposes（共有目的のみ）」で作成・管理する。コンシューマーはSnowflakeアカウントを持たないため、課金先がプロバイダーしかない
- **ユーザーの誤り**: 「コンシューマーが負担」と回答 → これは通常のSecure Data Sharing（Snowflakeアカウント間）の場合。Reader Accountでは逆
- **試験ポイント**: 「non-Snowflake user」「reader account」というキーワードが出たら → **プロバイダー負担**
- **関連問題**: Q102（Reader Account Non-Snowflake）

## 1-3. 公式ドキュメントURL

- [Creating Reader Accounts — Overview](https://docs.snowflake.com/en/user-guide/data-sharing-reader-create#overview)

---

## 2-1. 問題文（英語）

> Which statement is true regarding costs when a Snowflake account shares data with a non-Snowflake user or a non-Snowflake organization?
>
> A. The data consumer is charged for the compute charges for queries they run.
> B. The data provider is charged for the compute charges for queries the data consumer runs.
> C. Both the data provider and the data consumer are charged for the compute costs.

## 2-2. 問題文の文法解析

### 文1: "Which statement is true regarding costs when a Snowflake account shares data with a non-Snowflake user or a non-Snowflake organization?"

- **疑問詞+主語 (S)**: Which statement（どの文が）
- **動詞 (V)**: is true（正しいか）
- **修飾語 (M1)**: regarding costs（コストに関して）
- **時間節 (M2)**: when a Snowflake account shares data with a non-Snowflake user or a non-Snowflake organization（Snowflakeアカウントが非Snowflakeユーザー/組織とデータを共有する場合）
- **文型**: SVC（疑問文）
- **注目ポイント**:
  - `regarding ~` — 「〜に関して」。試験問題の定番前置詞
  - `non-Snowflake user` — 「非Snowflakeユーザー」。Reader Accountが必要であることを示すキーワード

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| be charged for ~ | verb phrase | 〜を請求される | The provider is charged for compute costs. |
| solely for ~ purposes | adv phrase | 〜の目的のためだけに | Reader accounts are created solely for sharing purposes. |
| invoice | verb | 請求書を送る、請求する | Compute expenses are invoiced to the provider account. |

## 2-3. 問題文（日本語）

> Snowflakeアカウントが非Snowflakeユーザーまたは非Snowflake組織とデータを共有する場合のコストについて、正しい文はどれですか？
>
> A. データコンシューマーが、自分が実行したクエリのコンピュート料金を請求される
> B. データプロバイダーが、データコンシューマーが実行したクエリのコンピュート料金を請求される
> C. データプロバイダーとデータコンシューマーの両方がコンピュートコストを請求される

---

## 3-1. 解説文（英語）

> Sharing data with a non-Snowflake user or organization is possible by creating a reader account. This reader account is created by the data provider solely for sharing purposes. Since the data provider creates and administers the reader account, all the reader account's compute expenses are invoiced to the provider account. Therefore, the reader account's use of the virtual warehouse compute is added to the provider account compute charges.

## 3-2. 解説文の文法解析

### 文1: "Sharing data with a non-Snowflake user or organization is possible by creating a reader account."

- **主語 (S)**: Sharing data with a non-Snowflake user or organization（非Snowflakeユーザー/組織とのデータ共有は）— 動名詞句
- **動詞 (V)**: is（〜である）
- **補語 (C)**: possible（可能である）
- **手段 (M)**: by creating a reader account（リーダーアカウントを作成することによって）
- **文型**: SVC

### 文2: "This reader account is created by the data provider solely for sharing purposes."

- **主語 (S)**: This reader account（このリーダーアカウントは）
- **動詞 (V)**: is created（作成される）— 受動態
- **動作主 (M1)**: by the data provider（データプロバイダーによって）
- **目的 (M2)**: solely for sharing purposes（共有目的のためだけに）
- **文型**: SV（受動態）
- **注目ポイント**: `solely for ~ purposes` — 「〜の目的のためだけに」。Reader Accountの限定的な性質を強調

### 文3: "Since the data provider creates and administers the reader account, all the reader account's compute expenses are invoiced to the provider account."

- **理由節 (M)**: Since the data provider creates and administers the reader account（プロバイダーがリーダーアカウントを作成・管理するため）
- **主語 (S)**: all the reader account's compute expenses（リーダーアカウントのすべてのコンピュート費用は）
- **動詞 (V)**: are invoiced to（〜に請求される）— 受動態
- **修飾語 (M)**: the provider account（プロバイダーアカウントに）
- **文型**: Since SVO, SV（受動態）
- **注目ポイント**: `Since ~` が理由を示し、コスト負担の論理を説明

### 文4: "Therefore, the reader account's use of the virtual warehouse compute is added to the provider account compute charges."

- **接続副詞**: Therefore（したがって）
- **主語 (S)**: the reader account's use of the virtual warehouse compute（リーダーアカウントのウェアハウス使用は）
- **動詞 (V)**: is added to（〜に加算される）— 受動態
- **修飾語 (M)**: the provider account compute charges（プロバイダーアカウントのコンピュート料金に）
- **文型**: SV（受動態）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| administer | verb | 管理する | The provider creates and administers the reader account. |
| compute expenses | noun phrase | コンピュート費用 | All compute expenses are invoiced to the provider. |
| is added to ~ | verb phrase | 〜に加算される | Warehouse compute is added to provider charges. |

## 3-3. 解説文（日本語）

> 非Snowflakeユーザーや組織とのデータ共有は、リーダーアカウントを作成することで可能になります。このリーダーアカウントはデータプロバイダーが共有目的のためだけに作成します。データプロバイダーがリーダーアカウントを作成・管理するため、リーダーアカウントのすべてのコンピュート費用はプロバイダーアカウントに請求されます。したがって、リーダーアカウントの仮想ウェアハウスのコンピュート使用量はプロバイダーアカウントのコンピュート料金に加算されます。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
