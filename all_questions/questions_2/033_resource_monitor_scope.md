# 033: Resource Monitor — Management Scope

**SnowPro Core Domain**: Domain 2 — Account Management and Data Governance
**作成日**: 2026-04-12
**正答**: A（True）
**ユーザー回答**: A — 正解

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Resource Monitor（リソースモニタ） | ウェアハウスのクレジット消費を監視・制限するオブジェクト。定義したクォータ（上限）に対してクレジット使用量を追跡する。作成は**ACCOUNTADMINのみ**可能 |
| Credit Quota（クレジットクォータ） | リソースモニタに設定するクレジット消費の上限値。クォータに到達すると通知の送信やウェアハウスのサスペンドなどのアクションを実行できる |
| Account-Level Resource Monitor（アカウントレベルリソースモニタ） | アカウント全体のクレジット使用量を追跡するリソースモニタ。すべてのウェアハウスの合計使用量を監視する |
| Warehouse-Level Resource Monitor（ウェアハウスレベルリソースモニタ） | 特定の1つまたは複数のウェアハウスのクレジット使用量を追跡するリソースモニタ |

## 1-2. 重要コンセプトまとめ

- **リソースモニタの3つの管理スコープ**（本問の核心）:
  1. **単一のウェアハウス** — 1つのWHのクレジット使用量を追跡
  2. **複数のウェアハウス（コレクション）** — 複数のWHをまとめて追跡
  3. **アカウント全体** — すべてのWHの合計クレジット使用量を追跡

- **リソースモニタの重要仕様**:
  - 作成は **ACCOUNTADMINのみ**（Q027で学習済み）
  - クォータ到達時のアクション: **通知（Notify）/ サスペンド（Suspend）/ 即時サスペンド（Suspend Immediately）**
  - MONITOR/MODIFY権限を他ロールに付与可能（ただし作成はACCOUNTADMINのみ）

- **関連問題**: Q027（Resource Monitor Creation）、Q114（Resource Monitor Quota）

## 1-3. 公式ドキュメントURL

- [Assignment of Resource Monitors](https://docs.snowflake.com/en/user-guide/resource-monitors#assignment-of-resource-monitors)
- [Resource Monitors Overview](https://docs.snowflake.com/en/user-guide/resource-monitors)

---

## 2-1. 問題文（英語）

> True or False: Resource monitors can manage a single virtual warehouse, a collection of virtual warehouses, or the entire Snowflake account.
>
> A. True
> B. False

## 2-2. 問題文の文法解析

### 文1: "Resource monitors can manage a single virtual warehouse, a collection of virtual warehouses, or the entire Snowflake account."

- **主語 (S)**: Resource monitors（リソースモニタは）
- **動詞 (V)**: can manage（管理できる）
- **目的語 (O)**: a single virtual warehouse, a collection of virtual warehouses, or the entire Snowflake account（単一のWH、WHのコレクション、またはSnowflakeアカウント全体を）
- **文型**: SVO
- **注目ポイント**:
  - `A, B, or C` — 3つの選択肢を列挙する並列構造
  - `a collection of ~` — 「〜のコレクション（集まり）」。複数のWHをグループとして扱う
  - `the entire ~` — 「〜全体」。アカウントレベルの監視を示す

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| a collection of ~ | noun phrase | 〜のコレクション、集まり | Monitor a collection of virtual warehouses. |
| the entire ~ | adj + noun | 〜全体 | Track credit usage for the entire account. |
| track | verb | 追跡する、監視する | Resource monitors track credit usage. |
| against a defined quota | prep phrase | 定義されたクォータに対して | Track usage against a defined quota. |

## 2-3. 問題文（日本語）

> True/False: リソースモニタは、単一の仮想ウェアハウス、仮想ウェアハウスのコレクション、またはSnowflakeアカウント全体を管理できる。
>
> A. True（正しい）
> B. False（誤り）

---

## 3-1. 解説文（英語）

> Resource monitors can track & manage a single virtual warehouse against a defined quota. Resource monitors can be created to track the credit usage of multiple virtual warehouses together. Resource Monitors can also be created at the account level, which means that such resource monitors track credit usage at the account level, considering the credit usage of all virtual warehouses.

## 3-2. 解説文の文法解析

### 文1: "Resource monitors can track & manage a single virtual warehouse against a defined quota."

- **主語 (S)**: Resource monitors（リソースモニタは）
- **動詞 (V)**: can track & manage（追跡・管理できる）
- **目的語 (O)**: a single virtual warehouse（単一の仮想ウェアハウスを）
- **修飾語 (M)**: against a defined quota（定義されたクォータに対して）
- **文型**: SVO

### 文2: "Resource monitors can be created to track the credit usage of multiple virtual warehouses together."

- **主語 (S)**: Resource monitors（リソースモニタは）
- **動詞 (V)**: can be created（作成できる）— 受動態
- **目的 (M)**: to track the credit usage of multiple virtual warehouses together（複数のWHのクレジット使用量をまとめて追跡するために）
- **文型**: SV（受動態）+ to不定詞

### 文3: "Resource Monitors can also be created at the account level, which means that such resource monitors track credit usage at the account level, considering the credit usage of all virtual warehouses."

- **主語 (S)**: Resource Monitors（リソースモニタは）
- **動詞 (V)**: can also be created（〜でも作成できる）— 受動態
- **修飾語 (M1)**: at the account level（アカウントレベルで）
- **非制限関係詞節**: which means that such resource monitors track credit usage at the account level（つまりそのようなリソースモニタはアカウントレベルでクレジット使用量を追跡する）
- **分詞構文 (M2)**: considering the credit usage of all virtual warehouses（すべてのWHのクレジット使用量を考慮して）
- **文型**: SV（受動態）+ which means構文
- **注目ポイント**: `which means that ~` — 「つまり〜ということ」。定義・説明を補足する非制限関係詞節

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| against a defined quota | prep phrase | 定義されたクォータに対して | Track usage against a defined quota. |
| together | adv | まとめて、一緒に | Track multiple warehouses together. |
| which means that ~ | rel clause | つまり〜ということ | Created at account level, which means it tracks all WHs. |
| considering ~ | prep/conj | 〜を考慮して | Considering the credit usage of all warehouses. |

## 3-3. 解説文（日本語）

> リソースモニタは、定義されたクォータに対して単一の仮想ウェアハウスのクレジット使用量を追跡・管理できます。複数の仮想ウェアハウスのクレジット使用量をまとめて追跡するリソースモニタを作成することも可能です。リソースモニタはアカウントレベルでも作成でき、その場合はすべての仮想ウェアハウスのクレジット使用量を考慮してアカウントレベルでクレジット使用量を追跡します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
