# 103: Software Release Frequency — Weekly

**SnowPro Core Domain**: Domain 1 — Snowflake AI Data Cloud Features & Architecture
**作成日**: 2026-04-06
**正答**: Weekly

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Software Release（ソフトウェアリリース） | Snowflakeが新機能・バグ修正・改善を含む新バージョンをデプロイすること。**週次（Weekly）**で実施される |
| Weekly Release（週次リリース） | Snowflakeのソフトウェアアップデートの頻度。年次（Yearly）・隔週（Fortnightly）・日次（Daily）・月次（Monthly）ではなく**毎週（Weekly）** |
| Transparent Upgrade（透明なアップグレード） | Snowflakeのアップグレードはユーザーの操作なしに自動的に行われる。ダウンタイムなし・手動操作なしにサービスが継続する。SaaSの特性 |
| Phased Release Strategy（段階的リリース戦略） | 週次リリースをすべてのアカウントに一度にデプロイするのではなく、アーリーアクセスアカウントから段階的に展開する戦略（Q083参照） |

## 1-2. 重要コンセプトまとめ

- **正答: Weekly（毎週）** — Snowflakeのソフトウェアリリース頻度
- **選択肢の比較**（紛らわしい選択肢の意味を押さえる）:
  - Yearly（年次）→ 頻度が低すぎる
  - **Fortnightly（隔週・2週に1度）** → 「2週間ごと」。Weekly（毎週）と混同しやすい
  - Daily（日次）→ 頻度が高すぎる
  - Monthly（月次）→ 頻度が低すぎる
  - **Weekly（週次）** → ✅ 正解
- **SaaSの特性**: Snowflakeはクラウドサービスのため、ユーザーはアップグレード作業なしに常に最新機能を利用できる
- **Q083との関連**: 週次リリースがPhased Release Strategy（段階的展開）によってアカウントに順次適用される仕組み

## 1-3. 公式ドキュメントURL

- [Snowflake Architecture](https://docs.snowflake.com/en/user-guide/intro-key-concepts#snowflake-architecture)

---

## 2-1. 問題文（英語）

> How frequently does Snowflake release new software?
>
> A. Yearly
> B. Fortnightly
> C. Daily
> D. Monthly
> E. Weekly ✅

## 2-2. 問題文の文法解析

### 文1: "How frequently does Snowflake release new software?"

- **主語 (S)**: Snowflake
- **動詞 (V)**: does release（疑問文で倒置）
- **目的語 (O)**: new software
- **疑問詞**: How frequently（頻度を問う）
- **文型**: SVO（疑問文）
- **注目ポイント**:
  - **"How frequently"**: 「どのくらいの頻度で」。`how often`（どのくらい頻繁に）と同義だが、`how frequently` はより書き言葉的・フォーマル。頻度を問う疑問副詞句
  - **"does ~ release"**: 一般動詞の現在形疑問文では `does` を用いて倒置する。`releases`（3人称単数現在）の疑問形は `does ~ release`
  - **"new software"**: 「新しいソフトウェア」。`software` は不可算名詞（複数形なし）。`new softwares` とはしない

### 選択肢の語彙解説

| 英語 | 意味 | 補足 |
|------|------|------|
| Yearly | 年次・1年に1回 | `annually` と同義 |
| Fortnightly | 隔週・2週に1回 | `fortnight`（2週間）+ `-ly`。イギリス英語で頻出。アメリカ英語では `biweekly` |
| Daily | 日次・毎日 | `every day` と同義 |
| Monthly | 月次・毎月 | `every month` と同義 |
| Weekly | 週次・毎週 | ✅ 正解。`every week` と同義 |

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| frequently | 副詞 | 頻繁に | How frequently does Snowflake release updates? |
| fortnightly | 形容詞/副詞 | 2週に1回の | Fortnightly means once every two weeks. |
| release | 動詞 | リリースする・公開する | Snowflake releases new software weekly. |

## 2-3. 問題文（日本語）

> Snowflakeはどのくらいの頻度で新しいソフトウェアをリリースするか？
>
> A. 年次（1年に1回）
> B. 隔週（2週に1回）
> C. 日次（毎日）
> D. 月次（毎月）
> E. 週次（毎週）✅

---

## 3-1. 解説文（英語）

> （解説文なし — 選択問題の正答のみ提示）

## 3-2. 解説文の文法解析

解説文は提供されなかった。選択肢の語彙を中心に整理する。

### 頻度副詞の比較

- **Daily** < **Weekly** < **Fortnightly** < **Monthly** < **Yearly**（頻度の高い順）
- Snowflakeは **Weekly**（毎週）リリース。SaaSモデルにより自動的にアップデートされる

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| weekly | 形容詞/副詞 | 毎週の・週1回 | Snowflake deploys new software weekly. |
| fortnightly | 形容詞/副詞 | 2週に1回 | Biweekly can mean twice a week or once every two weeks. |
| transparent | 形容詞 | 透明な・ユーザーに見えない | Upgrades are transparent to Snowflake users. |

## 3-3. 解説文（日本語）

> Snowflakeは**毎週（Weekly）**新しいソフトウェアをリリースする。SaaSプラットフォームの特性上、アップグレードはユーザーの操作なしに透明な形で行われ、常に最新機能が利用可能な状態になる。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
