# 125: Resource Monitor — Conditions to Resume Suspended Warehouse

**SnowPro Core Domain**: Domain 2 — Account Management and Security
**作成日**: 2026-04-17
**正答**: A, B, E（クォータ増加 / しきい値増加 / 次のインターバル開始）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Resource Monitor（リソースモニター） | 仮想ウェアハウスのクレジット消費を追跡・制限する機能。しきい値超過時にウェアハウスをサスペンドできる |
| Credit Quota（クレジットクォータ） | リソースモニターが定義する期間内のクレジット消費上限値。この値が増加するとサスペンドが解除される場合がある |
| Credit Threshold（クレジットしきい値） | サスペンドアクションが発動するクレジット消費量の閾値。しきい値を引き上げると再びウェアハウスが使用可能になる |
| Suspend Action（サスペンドアクション） | リソースモニターのアクション設定。`Suspend`（実行中クエリ完了後に停止）と `Suspend Immediately`（即時停止）の2種類がある |
| Put on Hold（保留状態） | リソースモニターによってサスペンドされたウェアハウスの状態。通常のResume操作では解除できない |
| Monitor Interval（モニターインターバル） | リソースモニターが動作するサイクル（日・月など）。インターバルが更新されるとクレジットカウントがリセットされる |
| Account-Level Monitor（アカウントレベルモニター） | アカウント全体を監視するリソースモニター。ウェアハウスの個別削除で解除はできない（ウェアハウス個別モニターとは挙動が異なる） |

## 1-2. 重要コンセプトまとめ

- **リソースモニターによるサスペンドは通常のResume操作で解除できない**
  - ACCOUNTADMIN がSnowsight/SnowSQLから手動でResumeしようとしても解除されない
  - これは試験の重要な罠選択肢
- **サスペンドを解除できる条件（正解の3つ）**
  1. **次のインターバルが開始する**（クレジットカウントがリセットされる）
  2. **クレジットクォータを増やす**（上限を引き上げる）
  3. **サスペンドのクレジットしきい値を引き上げる**（トリガー条件を変更する）
- **解説文に記載されているが選択肢にない解除条件**
  4. ウェアハウスをモニターの設定から取り外す（アカウントレベルモニターには適用外）
  5. モニター自体を削除する（DROP）
- **誤答の確認**
  - ❌ ACCOUNTADMINがResumeする → できない（モニターの保留状態は解除されない）
  - ❌ SnowSQLでResumeする → できない（ツールに関わらず同じ）
- **Suspend vs Suspend Immediately の違い**
  - Suspend: 実行中クエリが完了してからウェアハウスを停止
  - Suspend Immediately: クエリを中断して即時停止

## 1-3. 公式ドキュメントURL

- [Resource Monitors](https://docs.snowflake.com/en/user-guide/resource-monitors)
- [Resource Monitor Actions](https://docs.snowflake.com/en/user-guide/resource-monitors#resource-monitor-actions)

---

## 2-1. 問題文（英語）

> After a virtual warehouse has been suspended by a resource monitor, which of the following will allow the virtual warehouse to be resumed? Select all that apply.
>
> A. The monitor's credit quota is increased.
> B. The credit threshold for the suspend action is increased.
> C. An account administrator resumes the virtual warehouse.
> D. The virtual warehouse is resumed using SnowSQL.
> E. The next interval for the resource monitor starts.

## 2-2. 問題文の文法解析

### 文1: "After a virtual warehouse has been suspended by a resource monitor, which of the following will allow the virtual warehouse to be resumed?"

- **時間節**: After a virtual warehouse has been suspended by a resource monitor（現在完了受動態）
- **主語 (S)**: which of the following
- **動詞 (V)**: will allow
- **目的語 (O)**: the virtual warehouse to be resumed（SVOC構文：allow O to do の受動態）
- **文型**: SVO（疑問文）
- **注目ポイント**: 
  - `has been suspended`（現在完了受動態）で「すでにサスペンドされた後」を明確に示す
  - `allow ~ to be resumed`（〜が再開されることを可能にする）= `allow + O + to + 受動態不定詞`

### 各選択肢の文法:

- A: "The monitor's credit quota **is increased**."（現在受動態：状態変化）
- B: "The credit threshold for the suspend action **is increased**."（同形式）
- C: "An account administrator **resumes** the virtual warehouse."（能動態）
- D: "The virtual warehouse **is resumed** using SnowSQL."（受動態 + 手段）
- E: "The next interval for the resource monitor **starts**."（自動詞）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| credit quota | 名詞句 | クレジットクォータ（使用上限） | Increase the credit quota to allow the warehouse to resume. |
| threshold | 名詞 | しきい値 | The credit threshold for the suspend action must be increased. |
| interval | 名詞 | インターバル、周期 | The next interval resets the credit count. |
| allow ~ to be resumed | 構文 | 〜が再開されることを可能にする | Only specific actions allow the warehouse to be resumed. |

## 2-3. 問題文（日本語）

> リソースモニターによって仮想ウェアハウスがサスペンドされた後、次のうち仮想ウェアハウスの再開を可能にするものはどれですか？該当するものをすべて選んでください。
>
> A. モニターのクレジットクォータが増加する。
> B. サスペンドアクションのクレジットしきい値が増加する。
> C. アカウント管理者が仮想ウェアハウスをResumeする。
> D. SnowSQLを使用して仮想ウェアハウスをResumeする。
> E. リソースモニターの次のインターバルが開始する。

---

## 3-1. 解説文（英語）

> If a monitor has a Suspend or Suspend Immediately action, and its used credits hit the threshold for the action, any warehouses assigned to the monitor are put on hold and can't be used again until one of the following happens:
>
> • The next interval starts as per the monitor configuration. A monitor credit limit is applicable within a defined time interval (days, months, etc.)
>
> • The credit quota for the monitor is increased.
>
> • The credit threshold needed to suspend is increased.
>
> • The virtual warehouse is removed from the monitor configuration (does not apply to account-level monitors)
>
> • The monitor is dropped altogether.
>
> https://docs.snowflake.com/en/user-guide/resource-monitors

## 3-2. 解説文の文法解析

### 文1: "If a monitor has a Suspend or Suspend Immediately action, and its used credits hit the threshold for the action, any warehouses assigned to the monitor are put on hold and can't be used again until one of the following happens:"

- **条件節1**: If a monitor has a Suspend or Suspend Immediately action
- **条件節2（並列）**: and its used credits hit the threshold for the action
- **主節主語 (S)**: any warehouses assigned to the monitor（過去分詞後置修飾）
- **主節動詞並列 (V)**: are put on hold / can't be used again
- **時間節**: until one of the following happens
- **文型**: 複文（条件節 + 主節）
- **注目ポイント**: 
  - `any warehouses assigned to ~` = 〜に割り当てられたすべてのウェアハウス（anyで全称）
  - `are put on hold` = 保留状態に置かれる（put on hold = 保留にする）
  - `until one of the following happens` = 以下のうちの一つが起きるまで

### 箇条書きの文法分析:

- `as per the monitor configuration` = モニターの設定通りに（`as per ~` = 〜に従って）
- `is applicable within a defined time interval` = 定義された時間インターバル内で適用される
- `does not apply to account-level monitors` = アカウントレベルのモニターには適用されない
- `is dropped altogether` = 完全に削除される（`altogether` = 完全に）

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| put on hold | 句動詞 | 保留状態にする | Warehouses are put on hold when credits are exceeded. |
| as per ~ | 前置詞句 | 〜に従って | The interval resets as per the monitor configuration. |
| applicable | 形容詞 | 適用される | The credit limit is applicable within the defined interval. |
| drop altogether | 句動詞+副詞 | 完全に削除する | Dropping the monitor altogether removes the restriction. |

## 3-3. 解説文（日本語）

> モニターにSuspendまたはSuspend Immediatelyアクションがあり、使用済みクレジットがアクションのしきい値に達した場合、モニターに割り当てられたウェアハウスはすべて保留状態になり、以下のいずれかが発生するまで再使用できなくなります：
>
> • モニターの設定に従い次のインターバルが開始する（モニターのクレジット上限は定義された時間インターバル内で適用される）
>
> • モニターのクレジットクォータが増加する。
>
> • サスペンドに必要なクレジットしきい値が増加する。
>
> • 仮想ウェアハウスがモニターの設定から取り外される（アカウントレベルモニターには適用されない）
>
> • モニターが完全に削除される。

---

## 復習メモ

- [ ] リソースモニターのサスペンドは通常のResume操作（管理者手動/SnowSQL）では解除できないことを覚えた
- [ ] 解除条件（インターバル更新/クォータ増加/しきい値増加/モニター設定から削除/DROP）を把握した
- [ ] `are put on hold`（保留状態にされる）と `until one of the following happens`（以下のいずれかが起きるまで）を確認した
