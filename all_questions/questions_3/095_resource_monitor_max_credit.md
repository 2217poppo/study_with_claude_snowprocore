# 095: Resource Monitor Max Credit

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-16
**正答**: E (500)

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Resource Monitor（リソースモニタ） | ウェアハウスのクレジット消費を監視・制限する機能。ACCOUNTADMINのみが作成可能 |
| Credit Quota（クレジットクォータ） | リソースモニタに設定するクレジット上限値 |
| Account-Level Monitor | アカウント全体のクレジット使用量を監視するリソースモニタ |
| Warehouse-Level Monitor | 個別または複数のウェアハウスのクレジット使用量を監視するリソースモニタ |

## 1-2. 重要コンセプトまとめ

- リソースモニタの3つの適用レベル:
  1. **個別WH監視**: 1つのWHに対して定義されたクォータで追跡
  2. **複数WH合計監視**: 複数のWHのクレジット使用量を合計で追跡
  3. **アカウントレベル監視**: 全WHの合計クレジットを追跡
- 重要: 複数のリソースモニタが同じWHに適用される場合、**最も厳しい制限**が適用される
- WH単体のクォータとアカウントレベルのクォータの両方が設定されている場合、WHが使用可能な最大クレジットは**小さい方のクォータ値**
- この問題では画像内の設定を読み取る必要がある（WH1に対するモニタのクォータが500）

## 1-3. 公式ドキュメントURL

- [Assignment of Resource Monitors](https://docs.snowflake.com/en/user-guide/resource-monitors#assignment-of-resource-monitors)

---

## 2-1. 問題文（英語）

> Consider the following resource monitor configuration.
>
> What is the maximum credit that Warehouse 1 can use?
>
> A. 5000
> B. 1000
> C. 2500
> D. 2000
> E. 500

## 2-2. 問題文の文法解析

### 文1: "Consider the following resource monitor configuration."

- **主語 (S)**: （命令文 = You）
- **動詞 (V)**: Consider
- **目的語 (O)**: the following resource monitor configuration
- **文型**: SVO（命令文）

### 文2: "What is the maximum credit that Warehouse 1 can use?"

- **主語 (S)**: the maximum credit that Warehouse 1 can use
- **動詞 (V)**: is
- **補語 (C)**: What
- **文型**: SVC
- **注目ポイント**: 「the maximum credit that ~ can use」で使用可能な最大クレジットを問う。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| maximum credit | 名詞句 | 最大クレジット | The maximum credit a warehouse can use. |
| resource monitor configuration | 名詞句 | リソースモニタの設定 | Consider the resource monitor configuration. |
| quota | 名詞 | クォータ（上限） | A defined quota for credit usage. |

## 2-3. 問題文（日本語）

> 以下のリソースモニタの設定について考えてください。
>
> Warehouse 1が使用できる最大クレジットはいくらですか？
>
> A. 5000
> B. 1000
> C. 2500
> D. 2000
> E. 500

---

## 3-1. 解説文（英語）

> Resource monitors can track & manage a single virtual warehouse against a defined quota. Resource monitors can be created to track the credit usage of multiple virtual warehouses together.
>
> Resource Monitors can also be created at the account level, which means that such resource monitors track credit usage at the account level, considering the credit usage of all virtual warehouses.

## 3-2. 解説文の文法解析

### 文1: "Resource monitors can track & manage a single virtual warehouse against a defined quota."

- **主語 (S)**: Resource monitors
- **動詞 (V)**: can track & manage
- **目的語 (O)**: a single virtual warehouse
- **修飾語 (M)**: against a defined quota（基準）
- **文型**: SVO
- **注目ポイント**: 「against a defined quota」で「定義されたクォータに対して」。

### 文2: "Resource Monitors can also be created at the account level, which means that such resource monitors track credit usage at the account level, considering the credit usage of all virtual warehouses."

- **主語 (S)**: Resource Monitors / such resource monitors
- **動詞 (V)**: can be created / track
- **修飾語 (M)**: at the account level / which means that ...（非制限関係詞節）/ considering the credit usage of all virtual warehouses
- **文型**: SV（受動態）; SVO
- **注目ポイント**: 「which means that ~」で意味を補足。アカウントレベルでは全WHの合計を追跡。

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| against | 前置詞 | ～に対して | Track against a defined quota. |
| at the account level | 前置詞句 | アカウントレベルで | Created at the account level. |
| considering | 前置詞/分詞 | ～を考慮して | Considering the credit usage of all warehouses. |

## 3-3. 解説文（日本語）

> リソースモニタは定義されたクォータに対して単一の仮想ウェアハウスを追跡・管理できます。複数の仮想ウェアハウスのクレジット使用量をまとめて追跡するリソースモニタも作成できます。
>
> リソースモニタはアカウントレベルでも作成でき、この場合はすべての仮想ウェアハウスのクレジット使用量を考慮してアカウントレベルでクレジット使用量を追跡します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
