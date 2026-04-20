# 080: Snowsight — User Profile Configuration Settings

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture (Tools & Interfaces)
**作成日**: 2026-04-03
**正答**: A・C（Default Role と Default Warehouse）

> 関連問題: 004（Query History Retention）・054（Snowsight Multiple Queries）・063（MFA Supported Clients）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Snowsight Profile（スノーサイト・プロファイル） | Snowsightのユーザー設定画面。右上のユーザー名からアクセス。**Default Role・Default Warehouse・名前・パスワード・言語・メールアドレス・MFA登録・通知設定**などを構成できる |
| Default Role（デフォルトロール） | Snowsightにログイン時に自動的に使用されるロール。プロファイル画面から変更可能 |
| Default Warehouse（デフォルトウェアハウス） | クエリ実行時にデフォルトで使用されるウェアハウス。プロファイル画面から変更可能 |
| Notification Preferences（通知設定） | クエリ完了・エラー等の通知をどのように受け取るかの設定。プロファイル画面から構成可能 |

## 1-2. 重要コンセプトまとめ

- **Snowsightプロファイルで設定できるもの**（試験頻出）:
  - ✓ **Default Role**（デフォルトロール）
  - ✓ **Default Warehouse**（デフォルトウェアハウス）
  - ✓ 名前・パスワード・言語・メールアドレス
  - ✓ MFA（多要素認証）への登録（enroll in MFA）
  - ✓ 通知設定（notification preferences）

- **Snowsightプロファイルで設定できないもの**:
  - ✗ **Default Schema**（デフォルトスキーマ）← プロファイルのUIには存在しない
  - ✗ **Default Database**（デフォルトデータベース）← プロファイルのUIには存在しない

- **引っかけのポイント**: Default SchemaとDefault Databaseはユーザー設定として存在するが、**Snowsightのプロファイルダイアログ（UI）では直接設定できない**。SQL（`ALTER USER`）で設定する

- **試験の判断基準**: 「Snowsightプロファイル画面で設定できるもの」を問う問題では Role と Warehouse の2つが正解

## 1-3. 公式ドキュメントURL

- [Snowsight User Profile](https://docs.snowflake.com/en/user-guide/ui-snowsight-profile)

---

## 2-1. 問題文（英語）

> Which of the following can be configured for a user profile in Snowsight?
>
> Select two answers.
>
> A. Default Role
> B. Default schema
> C. Default Warehouse
> D. Default database

## 2-2. 問題文の文法解析

### 文1: "Which of the following can be configured for a user profile in Snowsight?"

- **疑問詞**: Which of the following（以下のうちどれが）
- **動詞 (V)**: can be configured（設定できる）← 受動態
- **修飾語1**: for a user profile（ユーザープロファイルに対して）← `for ~` = 「〜のために・〜の範囲内で」
- **修飾語2**: in Snowsight（Snowsightにおいて）
- **注目ポイント**: `be configured for ~` = 「〜に対して設定される」。`configure` は「設定する・構成する」の技術文書頻出動詞

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| be configured for ~ | 受動態熟語 | 〜に対して設定される・〜向けに構成される | Default Role can be configured for a user profile. |
| user profile | 名詞句 | ユーザープロファイル・ユーザー設定 | Manage your settings in the user profile in Snowsight. |
| configure | 動詞 | 設定する・構成する | You can configure your default role in Snowsight. |

## 2-3. 問題文（日本語）

> Snowsightのユーザープロファイルで設定できるものはどれですか？
>
> 2つ選択してください。
>
> A. デフォルトロール
> B. デフォルトスキーマ
> C. デフォルトウェアハウス
> D. デフォルトデータベース

---

## 3-1. 解説文（英語）

> Using the profile dialogue in Snowsight, you can enroll in MFA, specify your notification preferences, set your email address, and configure your profile's default role and default warehouse. Other things can also be configured such as name, password, language, etc.

## 3-2. 解説文の文法解析

### 文1: "Using the profile dialogue in Snowsight, you can enroll in MFA, specify your notification preferences, set your email address, and configure your profile's default role and default warehouse."

- **分詞構文**: Using the profile dialogue in Snowsight（Snowsightのプロファイルダイアログを使って）← 手段を示す分詞構文
- **主語 (S)**: you
- **動詞の並列**: enroll in MFA / specify your notification preferences / set your email address / configure your profile's default role and default warehouse（4つの動詞が `and` で並列）
- **注目ポイント**: `enroll in ~` = 「〜に登録する・〜に加入する」。MFAへの登録に使う定番表現

### 文2: "Other things can also be configured such as name, password, language, etc."

- **主語 (S)**: Other things（その他のものも）
- **動詞 (V)**: can also be configured（設定できる）← 受動態
- **例示**: such as name, password, language, etc.（名前・パスワード・言語など）
- **注目ポイント**: `etc.`（et cetera）= 「〜など」。リストが完全でないことを示すラテン語由来の略語

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| enroll in ~ | 動詞句 | 〜に登録する・〜に加入する | You can enroll in MFA through the profile dialogue. |
| specify ~ | 動詞 | 〜を指定する・〜を明示する | Specify your notification preferences in the profile. |
| notification preferences | 名詞句 | 通知設定・通知の好み | Set your notification preferences in Snowsight. |
| profile dialogue | 名詞句 | プロファイルダイアログ・設定画面 | Access settings via the profile dialogue in Snowsight. |
| etc. | 略語 | 〜など（et cetera） | Name, password, language, etc. can be configured. |

## 3-3. 解説文（日本語）

> Snowsightのプロファイルダイアログを使って、MFAに登録したり、通知設定を指定したり、メールアドレスを設定したり、プロファイルのデフォルトロールとデフォルトウェアハウスを設定したりすることができます。名前・パスワード・言語など、その他のものも設定できます。

---

## 復習メモ

- [ ] Snowsightプロファイルで設定できるのは Default Role と Default Warehouse（スキーマ・DBは不可）を覚えた
- [ ] プロファイルでMFA登録・通知設定・メールアドレスなども変更できることを確認した
- [ ] Default Schema・Default Databaseは `ALTER USER` で設定（UIでは不可）を区別できた
- [ ] `enroll in ~`・`be configured for ~`・`specify ~` の英語パターンを確認した
- [ ] この問題は理論問題のためサンドボックス検証は不要
