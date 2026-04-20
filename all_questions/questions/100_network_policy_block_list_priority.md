# 100: Network Policy — Block List Applied First

**SnowPro Core Domain**: Domain 2 — Account Management & Security
**作成日**: 2026-04-06
**正答**: True

---

## 1-1. Snowflake用語解説

| 用語 | 説明 |
|------|------|
| Network Policy（ネットワークポリシー） | IPアドレスに基づいてSnowflakeへのアクセスを制御するセキュリティ機能。許可リスト（Allowed List）とブロックリスト（Block List）を設定でき、ユーザー・アカウント・統合に適用できる |
| Allowed List（許可リスト） | Snowflakeへのアクセスを許可するIPアドレスの一覧。許可リストに含まれるIPからのみアクセスできる。**ブロックリストより後に適用される** |
| Block List（ブロックリスト） | SnowflakeへのアクセスをブロックするIPアドレスの一覧。ブロックリストに含まれるIPは、許可リストに含まれていてもアクセス不可。**許可リストより先に適用される**（本問のポイント） |
| IP Address（IPアドレス） | ネットワーク上のデバイスを識別する番号。ネットワークポリシーではIPv4アドレスまたはIPアドレス範囲（CIDR記法）で指定する |

## 1-2. 重要コンセプトまとめ

- **True = ブロックリストが先に適用される**: 両リストにIPが含まれる場合、Snowflakeはまずブロックリストを確認する
- **適用順序**:
  1. **Block List（ブロックリスト）を先に適用** ← 問題のポイント
  2. Allowed List（許可リスト）を後に適用
- **実際の動作**: IPがブロックリストに含まれていれば、許可リストに載っていても**アクセス拒否**される
- **both...and...（両方設定された場合）**: 両リストにIPが含まれる場合、ブロックリストが優先されてアクセスは拒否される
- **ネットワークポリシーの用途**: 特定のIPからのみアクセスを許可したり、既知の悪意あるIPをブロックしたりするセキュリティ制御
- **適用レベル**: アカウントレベル / ユーザーレベル / 統合（Integration）レベルに設定できる

## 1-3. 公式ドキュメントURL

- [Network Policies](https://docs.snowflake.com/en/user-guide/network-policies)

---

## 2-1. 問題文（英語）

> True or False: If an IP address is in a network policy's block list and the allowed list, Snowflake applies the blocked list first.
>
> A. True
> B. False

## 2-2. 問題文の文法解析

### 文1: "If an IP address is in a network policy's block list and the allowed list, Snowflake applies the blocked list first."

- **主節の主語 (S)**: Snowflake
- **主節の動詞 (V)**: applies
- **主節の目的語 (O)**: the blocked list
- **修飾語 (M)**: first（副詞）
- **条件節**: If an IP address is in a network policy's block list and the allowed list
- **文型**: SVO（条件文）
- **注目ポイント**:
  - **"If an IP address is in ~ and the allowed list"**: 「IPアドレスが〜と許可リストの両方に含まれている場合」。`be in A and B`（AとBの両方に含まれる）で「同時に両リストに載っている」という競合状態を設定する条件節
  - **"a network policy's block list"**: `'s` 所有格。「あるネットワークポリシーのブロックリスト」。`the network policy's` ではなく `a` で「特定のポリシー」を想定した不定の表現
  - **"applies the blocked list first"**: 「ブロックリストを最初に適用する」。`first`（副詞）が「どちらを先に処理するか」の順序を示す。これがTrueの核心

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| block list | 名詞句 | ブロックリスト・拒否リスト | The IP is in the block list and therefore access is denied. |
| allowed list | 名詞句 | 許可リスト・ホワイトリスト | Only IPs in the allowed list can access Snowflake. |
| apply | 動詞 | 適用する | Snowflake applies the block list before the allowed list. |
| first | 副詞 | 最初に・先に | The block list is applied first. |

## 2-3. 問題文（日本語）

> 正誤問題：IPアドレスがネットワークポリシーのブロックリストと許可リストの両方に含まれている場合、Snowflakeはブロックリストを先に適用する。
>
> A. True（正しい）
> B. False（誤り）

---

## 3-1. 解説文（英語）

> If both the allowed and blocked IP address lists are populated, Snowflake applies the block list first, followed by the allowed list.

## 3-2. 解説文の文法解析

### 文1: "If both the allowed and blocked IP address lists are populated, Snowflake applies the block list first, followed by the allowed list."

- **主節の主語 (S)**: Snowflake
- **主節の動詞 (V)**: applies
- **主節の目的語 (O)**: the block list
- **修飾語 (M1)**: first（副詞）
- **修飾語 (M2)**: followed by the allowed list（過去分詞句）
- **条件節**: If both the allowed and blocked IP address lists are populated
- **文型**: SVO（条件文）
- **注目ポイント**:
  - **"If both the allowed and blocked IP address lists are populated"**: 「許可とブロック両方のIPアドレスリストに値が設定されている場合」。`both A and B`（AとBの両方）で2種のリストが共存する条件を設定。`be populated`（値が設定されている・データが入っている）はリスト・テーブルにエントリが存在することを示す
  - **"applies the block list first"**: `first`（最初に）で適用順序を明示。この語順が問題の核心。動詞 `apply`（適用する）は `A before B` や `A first, then B` と組み合わせてよく使われる
  - **", followed by the allowed list"**: 「その後に許可リストが続く・次いで許可リストが適用される」。`followed by ~` は過去分詞の付帯状況で「〜が後に続く・〜が次に来る」。`first ~ followed by ~` の組み合わせで「まずA、次にB」の順序を効率的に示す定型表現

### 重要語彙

| 英語 | 品詞 | 意味 | 例文 |
|------|------|------|------|
| populated | 形容詞 | 値が設定された・エントリが存在する | If both lists are populated, the block list applies first. |
| followed by ~ | 過去分詞句 | 〜が後に続いて・次いで〜が | The block list is applied first, followed by the allowed list. |
| both A and B | 相関接続詞 | AとBの両方 | If both the allowed and blocked lists are populated. |

## 3-3. 解説文（日本語）

> 許可IPアドレスリストとブロックIPアドレスリストの両方に値が設定されている場合、Snowflakeはブロックリストを先に適用し、次いで許可リストを適用します。

---

## 復習メモ

- [ ] Snowflakeコンセプトを理解した
- [ ] 英語の文法ポイントを確認した
- [ ] サンドボックスで検証した（該当する場合）
