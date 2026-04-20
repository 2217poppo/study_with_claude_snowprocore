# 021: Unload File Size Configuration

**SnowPro Core Domain**: Domain 3 — Data Loading, Unloading, and Connectivity
**作成日**: 2026-04-02
**正答**: A (False)
- A. False（**選択済み・正解**）
- B. True（誤り・未選択）

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Data Unload（データアンロード） | Snowflakeテーブルからファイルにデータを書き出す操作。COPY INTO @stage で実行 |
| MAX_FILE_SIZE | アンロード時の出力ファイルサイズを指定するパラメータ。デフォルト16MB、最大5GB（クラウドストレージ向け） |
| Export（エクスポート） | データをファイルとして外部に書き出すこと。アンロードと同義で使われる |

## 1-2. 重要コンセプトまとめ

- **アンロードのデフォルト動作**（Q014 の復習）:
  - ① gzip 圧縮あり
  - ② 複数ファイルに分割出力
  - ③ **1ファイルあたり 16MB**

- **MAX_FILE_SIZE の仕様**:
  - デフォルト: 16 MB
  - 最大: **5 GB**（クラウドストレージへのエクスポート時）
  - 変更方法: `COPY INTO @stage ... MAX_FILE_SIZE = <bytes>`

- **この問題のポイント**: 「16MB で固定・変更不可」という記述が False
  - 16MB はあくまでデフォルト値。パラメータで変更可能

- **試験ポイント**: True/False 問題で「cannot be changed」「is always ~」などの絶対表現が含まれる場合は False を疑う

- **Q014 との違い**:
  - Q014: アンロードの3つのデフォルト動作（圧縮・分割・16MB）を包括的に扱った
  - Q021: 16MB が変更可能か（MAX_FILE_SIZEの上限 5GB）にフォーカス

## 1-3. 公式ドキュメントURL

- [Unloading to a Single File](https://docs.snowflake.com/en/user-guide/data-unload-considerations#unloading-to-a-single-file)

---

## 2-1. 問題文（英語）

> True or False: When unloading data, each exported file is 16MB, and this configuration cannot be changed.
>
> A. False
> B. True

## 2-2. 問題文の文法解析

### 文1: "When unloading data, each exported file is 16MB, and this configuration cannot be changed."

- **時間の副詞節**: When unloading data（分詞構文 = When you are unloading data）
- **主節1 (S1V1C1)**: each exported file is 16MB
- **主節2 (S2V2)**: this configuration cannot be changed（受動態の否定）
- **文型**: M（when節）+ SVC + and + SV（受動態否定）
- **注目ポイント**:
  - 「each exported file」の exported は過去分詞の前置修飾。「エクスポートされた各ファイル」
  - 「cannot be changed」は受動態の否定形。「変更することができない」
  - この「cannot be changed」が False の根拠になる — 実際には変更できる

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| unload | verb | アンロードする（データを書き出す） | Use COPY INTO to unload data to a stage. |
| exported | adjective（過去分詞） | エクスポートされた | Each exported file is 16MB by default. |
| configuration | noun | 設定、構成 | This configuration can be changed using MAX_FILE_SIZE. |
| cannot be changed | 受動態否定 | 変更できない | False — it can be changed using MAX_FILE_SIZE. |

## 2-3. 問題文（日本語）

> 正誤問題：データをアンロードする際、各エクスポートファイルは 16MB であり、この設定は変更できない。
>
> A. False（誤り）
> B. True（正しい）

---

## 3-1. 解説文（英語）

> The default size of each output file is 16 MB but can be changed using the MAX_FILE_SIZE parameter. The maximum allowed size per file is 5GB if you export data to cloud storage.

## 3-2. 解説文の文法解析

### 文1: "The default size of each output file is 16 MB but can be changed using the MAX_FILE_SIZE parameter."

- **主語 (S)**: The default size of each output file
- **動詞1 (V1)**: is
- **補語 (C)**: 16 MB
- **接続詞**: but（対比）
- **動詞2 (V2)**: can be changed（受動態）
- **修飾語 (M)**: using the MAX_FILE_SIZE parameter（分詞構文）
- **文型**: SVC but SV（受動態）+ M
- **注目ポイント**:
  - 「but can be changed」で前半の「16MB」を認めつつ、「でも変更できる」と対比
  - 主語の省略: 「but [it] can be changed」— 同じ主語を繰り返さない省略
  - 「using ~」は手段を示す分詞構文。「〜を使うことで」

### 文2: "The maximum allowed size per file is 5GB if you export data to cloud storage."

- **主語 (S)**: The maximum allowed size per file
- **動詞 (V)**: is
- **補語 (C)**: 5GB
- **条件節**: if you export data to cloud storage
- **文型**: SVC + 条件節
- **注目ポイント**:
  - 「maximum allowed size」= 「許容される最大サイズ」。maximum（最大）+ allowed（許可された）の2重修飾
  - 「per file」は「ファイルあたり」。単位を示す前置詞句

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| default size | noun phrase | デフォルトサイズ、初期サイズ | The default size of each file is 16 MB. |
| but can be changed | 対比句 | しかし変更できる | It is 16MB by default but can be changed. |
| maximum allowed | adjective | 許容される最大の | The maximum allowed size per file is 5GB. |
| per file | prepositional phrase | ファイルあたり | The limit is 5GB per file. |

## 3-3. 解説文（日本語）

> 各出力ファイルのデフォルトサイズは 16MB ですが、MAX_FILE_SIZE パラメータを使って変更できます。クラウドストレージにデータをエクスポートする場合、ファイルあたりの最大許容サイズは 5GB です。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
