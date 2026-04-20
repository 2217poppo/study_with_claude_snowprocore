# 038: PUT Command & Internal Stage Encryption — End-to-End Encryption

**SnowPro Core Domain**: Domain 3 — Data Loading and Unloading
**作成日**: 2026-04-02
**正答**: C・D（ステージでの暗号化保存 / クライアントでの自動暗号化）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| PUT コマンド | SnowSQL CLIを使ってローカルファイルをSnowflakeの内部ステージにアップロードするコマンド。自動的に暗号化を行う |
| Internal Stage（内部ステージ） | Snowflakeが管理するステージ。Table Stage・User Stage・Named Stageの3種類がある。データはSnowflakeが保存・管理 |
| End-to-End Encryption（エンドツーエンド暗号化） | クライアントマシンからSnowflakeのストレージまで、データが常に暗号化された状態で移動・保存されること。PUTコマンドで実現される |
| Client-side Encryption（クライアントサイド暗号化） | データがネットワークを通じて送信される**前に**クライアントマシン上で暗号化されること。PUTコマンドはこれを自動で行う |
| Data at Rest Encryption（保存データの暗号化） | ストレージに保存されているデータが暗号化されること。内部ステージに保存されたデータはSnowflakeが自動で暗号化する |
| Data in Transit Encryption（転送中データの暗号化） | ネットワーク経由でデータが移動する際の暗号化。PUTコマンドではクライアントで暗号化後に送信するため、転送中も暗号化状態 |

## 1-2. 重要コンセプトまとめ

- **PUTコマンドの暗号化は2段階**:
  1. **送信前**: クライアントマシン上で**自動的に**暗号化（Client-side Encryption）
  2. **保存時**: 内部ステージに暗号化した状態で保存（Data at Rest Encryption）

- **「自動」がポイント**: ユーザーが設定・操作する必要はない。Snowflakeが透過的に管理する

- **誤りの選択肢のパターン（試験の引っかけ）**:
  - "internal stages do not support encryption" → **False**。内部ステージは暗号化をサポートしている
  - "PUT command does not support encryption" → **False**。PUTは暗号化を自動でサポートする

- **Data Loading/Unloadingのセキュリティ**: PUT（内部ステージへのアップロード）のエンドツーエンド暗号化はSnowflakeの基本セキュリティ機能

## 1-3. 公式ドキュメントURL

- [End-to-End Encryption](https://docs.snowflake.com/en/user-guide/security-encryption-end-to-end)
- [PUT Command](https://docs.snowflake.com/en/sql-reference/sql/put)
- [Internal Stage Overview](https://docs.snowflake.com/en/user-guide/data-load-local-file-system-stage)

---

## 2-1. 問題文（英語）

> Which of the following is true regarding data encryption when using PUT to upload data to a Snowflake internal stage? Select two.
>
> A. Snowflake's internal stages do not support encryption.
> B. The PUT command does not support encryption.
> C. Data is stored encrypted in the Snowflake internal stage.
> D. Data is encrypted automatically at the client machine before being transmitted to the Snowflake internal stage.

## 2-2. 問題文の文法解析

### 文1: "Which of the following is true regarding data encryption when using PUT to upload data to a Snowflake internal stage?"

- **主語 (S)**: Which of the following（以下のうちどれが）
- **動詞 (V)**: is（〜である）
- **補語 (C)**: true（正しい）
- **修飾語 (M1)**: regarding data encryption（データ暗号化に関して）← `regarding ~` = 前置詞
- **修飾語 (M2)**: when using PUT（PUTを使用する際）← 時間を示す副詞節（主語省略の分詞構文）
- **修飾語 (M3)**: to upload data to a Snowflake internal stage（Snowflakeの内部ステージにデータをアップロードするために）← 目的の to 不定詞
- **文型**: SVC（倒置）
- **注目ポイント**: `when using ~` = `when you are using ~` の省略形。主節と同じ主語を省略できる

### 選択肢C: "Data is stored encrypted in the Snowflake internal stage."

- **主語 (S)**: Data（データは）
- **動詞 (V)**: is stored（保存される）← 受動態
- **補語/状態**: encrypted（暗号化された状態で）← 形容詞的補語
- **修飾語 (M)**: in the Snowflake internal stage（Snowflakeの内部ステージに）
- **文型**: SV（受動態）
- **注目ポイント**: `stored encrypted` = 「暗号化された状態で保存される」。`stored` + `encrypted` の2つの過去分詞が連続する自然な英語表現

### 選択肢D: "Data is encrypted automatically at the client machine before being transmitted to the Snowflake internal stage."

- **主語 (S)**: Data（データは）
- **動詞 (V)**: is encrypted（暗号化される）← 受動態
- **修飾語 (M1)**: automatically（自動的に）← 副詞
- **修飾語 (M2)**: at the client machine（クライアントマシンで）← 場所の前置詞句
- **修飾語 (M3)**: before being transmitted（送信される前に）← `before + 動名詞の受動態`
- **修飾語 (M4)**: to the Snowflake internal stage（Snowflakeの内部ステージへ）
- **文型**: SV（受動態）
- **注目ポイント**: `before being transmitted` = `before + being + 過去分詞` → 「送信される前に」。動名詞の受動態形

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| encrypt | 動詞 | 暗号化する | Data is encrypted before it leaves the client. |
| transmit | 動詞 | 送信する、伝送する | Data is transmitted to the internal stage over a secure channel. |
| automatically | 副詞 | 自動的に | Encryption happens automatically with no user action needed. |
| internal stage | 名詞句 | 内部ステージ（Snowflake管理のステージ） | PUT uploads files to an internal stage. |

## 2-3. 問題文（日本語）

> PUTコマンドを使用してSnowflakeの内部ステージにデータをアップロードする際のデータ暗号化について、次のうち正しいものはどれですか？2つ選択してください。
>
> A. Snowflakeの内部ステージは暗号化をサポートしていない。
> B. PUTコマンドは暗号化をサポートしていない。
> C. データはSnowflakeの内部ステージに暗号化された状態で保存される。
> D. データはSnowflakeの内部ステージに送信される前に、クライアントマシンで自動的に暗号化される。

---

## 3-1. 解説文（英語）

> Data is encrypted automatically at the client machine before being transmitted to the Snowflake internal stage. Once the data is in an internal stage, it is stored encrypted. This is part of the end-to-end encryption managed by Snowflake.

## 3-2. 解説文の文法解析

### 文1: "Data is encrypted automatically at the client machine before being transmitted to the Snowflake internal stage."

- **主語 (S)**: Data（データは）
- **動詞 (V)**: is encrypted（暗号化される）← 受動態
- **修飾語 (M1)**: automatically（自動的に）
- **修飾語 (M2)**: at the client machine（クライアントマシンで）
- **修飾語 (M3)**: before being transmitted（送信される前に）← 動名詞受動態
- **文型**: SV（受動態）
- **注目ポイント**: `before being + 過去分詞` は「〜される前に」。`before it is transmitted` の省略形

### 文2: "Once the data is in an internal stage, it is stored encrypted."

- **主語 (S1)**: the data（データが）← 従属節の主語
- **動詞 (V1)**: is in（〜にある）← 従属節
- **接続詞**: Once（一旦〜すると）← `Once + S + V` = 「〜したとたんに・〜すれば」
- **主語 (S2)**: it（それは）← 主節の主語
- **動詞 (V2)**: is stored（保存される）← 受動態
- **補語/状態**: encrypted（暗号化された状態で）
- **文型**: (従属節) SV → (主節) SV
- **注目ポイント**: `Once + S + V, 主節` = 起点となる状態への変化を示す接続詞。`stored encrypted` = 「暗号化された状態で保存される」

### 文3: "This is part of the end-to-end encryption managed by Snowflake."

- **主語 (S)**: This（これは）← 前の2文の内容全体を指す
- **動詞 (V)**: is（〜である）
- **補語 (C)**: part of the end-to-end encryption（エンドツーエンド暗号化の一部）
- **修飾語 (M)**: managed by Snowflake（Snowflakeによって管理される）← 過去分詞の後置修飾
- **文型**: SVC
- **注目ポイント**: `be part of ~` = 「〜の一部である」。ある機能が大きな仕組みに含まれることを示す

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| once | 接続詞 | 一旦〜すると、〜したら | Once the data is uploaded, it is stored encrypted. |
| end-to-end encryption | 名詞句 | エンドツーエンド暗号化 | PUT uses end-to-end encryption for secure uploads. |
| be part of ~ | 熟語 | 〜の一部である | This behavior is part of Snowflake's security model. |
| manage | 動詞 | 管理する | Snowflake manages encryption transparently. |

## 3-3. 解説文（日本語）

> データはSnowflakeの内部ステージに送信される前に、クライアントマシンで自動的に暗号化されます。データが内部ステージに入ると、暗号化された状態で保存されます。これはSnowflakeが管理するエンドツーエンド暗号化の一部です。

---

## 復習メモ

- [ ] PUTコマンドの暗号化の2段階（クライアントでの暗号化 → 暗号化して保存）を説明できる
- [ ] 「暗号化をサポートしない」という誤り選択肢を見抜けるようにした
- [ ] 英語の文法ポイント（before being transmitted / Once S V, ... / stored encrypted）を確認した
- [ ] この問題は暗号化の動作理論のためサンドボックス検証は不要
