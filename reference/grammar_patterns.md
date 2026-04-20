# 頻出英文法パターン

SnowPro Core の問題・解説文で繰り返し出現する英語の文法パターンを蓄積する。

## 試験問題でよく使われるパターン

| パターン | 説明 | 例文 |
|----------|------|------|
| is supported by ~ | 受動態で「～によってサポートされている」。技術仕様の対応状況を述べる定番表現 | SCIM is supported by Snowflake. |
| for the purpose of + 動名詞 | 「～する目的で」。目的を明示する formal な表現 | ...for the purpose of auto-provisioning users. |
| 過去分詞の後置修飾 (defined in ~) | 名詞の直後に過去分詞句を置いて修飾する。「～で定義された」 | groups defined in an identity provider |
| When + 受動態, 主節 | 条件的な時間関係を示す。「～されたとき、…する」 | When a new user is created, SCIM provisions the user. |
| be referred to as ~ | 受動態で「～と呼ばれる」。定義・名称の導入に使う定番表現 | The stored results are referred to as the Query Result Cache. |
| Assuming that + 節 | 「～と仮定すると」。試験問題で条件を設定するパターン | Assuming that the underlying data hasn't changed, ... |
| regardless of ~ | 「～にかかわらず」。例外なしの絶対条件を示す | The cache will be purged regardless of any other condition. |
| Once + 受動態, 主節 | 「一旦～されると」。起点となる出来事を示す | Once a cache is generated, it stays valid for 24 hours. |
| from that point onwards | 「その時点から先は」。時間的な起点と継続を示す副詞句 | The expiry is extended for 24 hours from that point onwards. |
| recommend that ~ should | 「～すべきと推奨する」。recommend の後の that節では should を使う | Snowflake recommends that roles should be assigned to SYSADMIN. |
| act as ~ | 「～として機能する」。役割・機能を説明する定番表現 | SYSADMIN can act as the owner of all securable objects. |
| with + O + 過去分詞 | 付帯状況を示す構文。「〜が〜された状態で」 | ...with the top custom role given to SYSADMIN. |
| let + O + 原形不定詞 | 使役構文「Oが～できるようにする」。機能・仕様の説明で頻出 | This page lets users view the history of queries. |
| in the last N days | 「過去N日間に」。期間の範囲を示す定番表現 | Queries executed in the last 14 days are visible. |
| also known as ~ | 「～とも呼ばれる」。別名・通称を紹介する挿入句パターン | CLI, also known as SnowSQL, is a command-line tool. |
| via ~ | 「～を経由して、～を通じて」。手段・経路を示す前置詞 | Connect to Snowflake via a command-line interface. |
| How does A differ from B? | 「AはBとどう異なるか」。2概念の違いを問う試験頻出パターン | How does a secure UDF differ from a typical UDF? |
| ensuring that ~ | 「～を確実にして」。結果・付帯状況を示す分詞構文 | Secure UDFs skip optimizations, ensuring data privacy. |
| i.e., | 「すなわち、つまり」。定義・言い換えを導く略語（ラテン語 id est） | Authorized users (i.e., those with the owner role) can view it. |
| by default | 「デフォルトでは」。初期設定・標準動作を示す表現 | By default, Snowflake manages encryption keys automatically. |
| transparent to ~ | 「～にとって透明な」= ユーザーが意識しなくてよい自動処理 | The key management process is transparent to the users. |
| at N-day intervals | 「N日間隔で」。定期的な頻度を示す前置詞句 | Keys are rotated at 30-day intervals. |
| without interfering with ~ | 「～を妨げることなく」。without + 動名詞で否定の付帯状況 | The update runs without interfering with the user's experience. |
| pre- 接頭辞 | 「あらかじめ、事前に」を意味する接頭辞。pre-compute, pre-built等 | MVs pre-compute results to speed up future queries. |
| in terms of ~ | 「～という観点から、～に関して」。比較・分類の基準を示す | Categorized in terms of the kind of result returned. |
| another name for ~ | 「～の別名」。同義語・別称を定義する定番表現 | UDTFs are another name for user-defined table functions. |
| with + O + 現在分詞 | 付帯状況構文「〜が〜している状態で」。with+過去分詞と対比 | ...with each row containing a single value. |
| even when ~ | 「たとえ〜のときでも」。予想される制約を打ち消す強調表現 | You can resize a warehouse even when running queries. |
| only when ~ | 「〜のときのみ」。条件を厳密に限定する | Node removal occurs only when all queries have finished. |
| What best describes ~? | 「〜を最もよく説明しているものは」。動作・挙動を問う試験頻出パターン | What best describes the resize operation? |
| it does not matter if ~ | 「～かどうかは関係ない」。条件の無関係性を示す形式主語構文 | It does not matter if the warehouse is not running a query. |
| charge for / charge on ~ | 「～に対して課金する」。課金対象を示す動詞句 | Snowflake charges for storage but not on data processed. |
| so that ~ can | 「～できるように」。目的を示す接続詞句 | Files are split so that Snowflake can use parallelism. |
| take advantage of ~ | 「～を活用する」。リソース・機能の利用を示す慣用句 | Multiple files take advantage of parallelism. |
| a separate ~ for each ~ | 「それぞれに対して別々の～」。1対1対応を示す定型表現 | Maintain a separate account for each region. |
| at least one for each ~ | 「～ごとに少なくとも1つ」。最小要件を示す表現 | You need at least one account for each region. |
| is hosted in ~ | 「～でホストされている」。物理的所在地を示す受動態 | Each account is hosted in a particular region. |
| encapsulate | 「包含する」。あるロールが別のロールの権限を内包することを示す技術用語 | ACCOUNTADMIN encapsulates SYSADMIN and SECURITYADMIN. |
| rigorously managed | 「厳格に管理される」。セキュリティ要件の厳しさを示す表現 | Access to ACCOUNTADMIN should be rigorously managed. |
| regarding ~ | 「～に関して」。concerning / about と同義のフォーマルな前置詞 | Which statement is correct regarding Snowflake billing? |
| fit ~ into memory | 「～をメモリに収める」。容量の上限を示す技術的な慣用表現 | Snowflake saves to disk if it can't fit data into memory. |
| even + 比較級 | 「さらに〜、一層〜」。比較級を強調する副詞 even | Remote storage is even slower than local disk. |
| slow down | 「〜を遅くする」。パフォーマンス低下を示す句動詞 | Data spilling slows down query performance. |
| 分詞構文 making ~ | 「その結果〜にする」。結果を示す付帯状況の分詞構文 | The spill occurs, making queries much slower. |
| either A or B（否定文） | 「AにもBにも（〜できない）」。否定文で「どちらにも収まらない」条件を示す | Data couldn't fit in either the memory or the temporary storage. |
| allow for ~ | 「〜を可能にする、〜に対応する」。`allow O to do` とは異なる句動詞 | COPY allows for casting and truncating. |
| ONLY after ~ | 「〜した後にのみ」。大文字ONLYで厳密な条件を強調 | Aggregations are supported ONLY after the data has been loaded. |
| as it is being loaded | 進行形の受動態「ロードされている最中に」。継続中の処理の同時性を示す | Transformations happen as it is being loaded. |
| such as ~ | 「〜などの」。具体例を列挙する表現 | Complex transformations such as joins and aggregations. |
| SVC but can be changed | 「〜だが変更できる」。主語省略でデフォルト値と変更可能性を対比する定型表現 | It is 16MB by default but can be changed using MAX_FILE_SIZE. |
| maximum allowed ~ | 「許容される最大の〜」。上限値を示す技術文書の定型表現 | The maximum allowed size per file is 5GB. |
| cannot be changed（ひっかけパターン） | 「変更できない」。試験問題でこの表現が出たら False の可能性を疑う | This configuration cannot be changed. → False, it can be changed. |
| can only have ~ / only one（ひっかけパターン） | 「〜しか持てない・1つだけ」。不必要な制限を主張する絶対表現。False の可能性を疑う | A share can only have one consumer. → False, zero/one/multiple are all valid. |
| zero, one, or multiple | 「0・1・複数（いずれも可）」。上限制限がないことを明示する列挙表現 | A share can have zero, one, or multiple consumers. |
| like other ~ | 「他の〜と同様に」。共通の特性を示す比較の前置詞句 | Like other ACCOUNT_USAGE views, data is kept for 365 days. |
| up to ~ | 「最大〜まで」。上限値を示す表現 | This view can have a latency of up to 3 hours. |
| separately | 「別途、別々に」。同じビュー内で異なる項目を区別して表示することを示す副詞 | Fail-safe bytes are shown separately from Time Travel bytes. |
| combines the best features of A and B | 「AとBの最良の特性を組み合わせる」。ハイブリッド設計を説明する定型表現 | The architecture combines the best features of shared-disk and shared-nothing. |
| each with its own ~ | 「それぞれが独自の〜を持つ」。並列する要素に独立した属性があることを示す付帯状況 | Several compute engines, each with its own memory and processing capabilities. |
| similarly to ~ | 「〜と同様に」。別のシステムや概念と挙動を比較する副詞句 | Snowflake stores data similarly to a shared-disk architecture. |
| the format using which ~ | 「〜がそれを用いてデータを保存するフォーマット」。`using which` が手段を示す難解な関係詞構文 | The format using which Snowflake stores the data is proprietary. |
| cannot + V1, V2, or V3 | 「V1もV2もV3もできない」。1つの否定助動詞で複数の動詞を並列否定する | Users cannot see, look at, or access the files directly. |
| behind the scenes | 「舞台裏で、内部で」。ユーザーから見えない部分での自動処理を示す慣用句 | Snowflake manages storage format behind the scenes. |
| in a ~ format | 「〜フォーマットで」。データの保存・出力形式を示す前置詞句 | Data is stored in a proprietary format on cloud storage. |
| from a ~ perspective | 「〜の観点から」。議論の切り口・前提条件を示す定型表現 | From a privilege perspective, only ACCOUNTADMIN can create it. |
| grant privileges to ~ | 「〜に権限を付与する」。Snowflakeの権限管理で頻出の動詞句 | Administrators can grant MONITOR privilege to other users. |
| only + 主語 + can ~ | 「〜だけが〜できる」。排他的な権限・能力を強調する構文 | Only Account Administrators can create new resource monitors. |
| that is, | 「すなわち」。i.e. と同義でセミコロン後に使う言い換え表現 | It's a metadata definition; that is, it contains no data. |
| instead, | 「代わりに」。前文の否定内容を受けて代替を提示する接続副詞 | It has no data. Instead, the metadata contains column definitions. |
| in turn | 「次に・順番に」。A → B → C という連鎖する参照関係を示す | The stage, in turn, points to cloud object storage. |
| note that ~ | 「〜に注意せよ」。重要な制約・例外を強調する命令形 | Note that external tables can only use external stages. |
| itself | 「〜自体は」。再帰代名詞で主語を強調し、他のものとの区別を明示 | The external table itself doesn't contain any data. |
| therefore ~ thus ~ | 「したがって〜そのため〜」。2つの因果副詞を連続使用して論理の連鎖を強調 | Therefore, it's empty. Thus, files can be loaded again. |
| would be + 形容詞 | 「〜になるだろう」。必然的な結果・論理的帰結を示す推量の助動詞 | The load metadata for a cloned table would be empty. |
| proceeds to do | 「次に〜することに進む」。前の行為に続く次のアクションを示す句動詞 | The administrator then proceeds to load new data. |
| one ~ the other | 「一方と他方」。2つの対象を指す代名詞の定型表現 | Modifying data in one will not affect the other. |
| show up | 「現れる、表示される」。データ・情報が画面上に表示されることを示す句動詞 | The new data does not show up in the Prospects table. |
| which means that ~ | 「それはつまり〜を意味する」。前文全体を先行詞にとる非制限関係詞節で定義・説明を付加 | Snowflake uses DAC, which means the creator owns the object. |
| while + 動名詞 | 「〜している間に」。同時進行の動作を示す分詞構文 | The role used while creating the object becomes the owner. |
| provide access to A to B | 「BにAへのアクセスを提供する」。2つの to 前置詞句を並列させる権限付与の表現 | Owners can provide access to the object to other roles. |
| requiring no additional maintenance | 「追加のメンテナンスを必要とせず」。否定の付帯状況分詞構文。自動処理であることを示す | It refreshes automatically, requiring no additional maintenance. |
| enable O to be + 過去分詞 | 「Oが〜されることを可能にする」。enable の受動態不定詞形 | Pre-computing answers, enabling queries to be answered faster. |
| boost | 「向上させる、強化する」。performanceやspeedの向上を示す技術文書頻出の動詞 | MVs are used to boost query performance. |
| keep track of ~ | 「〜を追跡する、把握する」。モニタリング・管理の文脈で頻出の慣用句 | Streams help you keep track of changes made to a table. |
| such as + 名詞 + being + 過去分詞 | 「〜されつつある〜のような」。動名詞の受動態で進行中の変化を例示する | such as new data being added (inserts) |
| help O (to) do | 「OがするのをOKにする、〜する助けをする」。help の後の to は省略可 | Streams help you keep track of any changes. |
| apply to ~ | 「〜に適用される、当てはまる」。主語が機能・ルール・制限などのとき頻出の句動詞 | The UNDROP functionality applies to tables, schemas, and databases. |
| That means (that) ~ | 「それはつまり〜を意味する」。前文全体を That で受けて論理的帰結を導く定型表現 | That means you can restore complete databases or schemas and their child objects. |
| after + S + have been + 過去分詞 | 「〜がされた後に」。現在完了受動態で動作の完了を条件にする時間節 | after they have been dropped |
| Select all that apply | 「当てはまるものをすべて選べ」。複数選択問題の定番指示文。that は関係代名詞で apply が動詞 | Select all that apply. |
| by + 動名詞（手段） | 「〜することによって」。手段・方法を示す前置詞 by + 動名詞の構文。技術文書で頻出 | Clustering optimizes queries by eliminating unnecessary partitions. |
| one ~ at a time | 「1つずつ、1度に1つ」。処理の単位を示す副詞句。クエリの処理範囲を説明するときに使われる | The daily report accesses one day at a time. |
| over time | 「時間の経過とともに」。徐々に変化するプロセスを示す副詞句 | Performance has degraded over time as data grew. |
| cost-effective | 形容詞 | 「費用対効果の高い」。ハイフンで繋いだ複合形容詞。試験で最適解を問う選択肢に頻出 | What is the most cost-effective solution? |
| grow to ~ | 句動詞 | 「〜に達する・成長する」。データ量や規模の増大を示す | The table has grown to 5TB. |
| through which ~ | 関係詞句 | 「〜を通じて（行われる）」。前置詞 + 関係代名詞で先行詞（場所・手段）を修飾する高度な構文 | The layer through which queries are executed. |
| a given ~ | 形容詞句 | 「特定の、所与の」。議論の前提となる対象を指す技術文書の定型表現 | For a given Snowflake instance, multiple clusters can run. |
| be known as ~ | 熟語 | 「〜として知られる」。別名・正式名称の紹介に使う受動態表現 | The compute engines are known as virtual warehouses. |
| be responsible for + 動名詞 | 熟語 | 「〜を担当する」。役割・責任を述べる定番表現。試験の選択肢に頻出 | The compute layer is responsible for executing queries. |
| what sort of ~ | 疑問詞句 | 「どのような種類の〜」。= what kind of ~。機能・種別を問う試験問題に頻出 | Dynamic Data Masking provides what sort of security? |
| be achieved by ~ | 熟語 | 「〜によって実現される」。実現手段を示す受動態の定番表現 | Column-level security is achieved by dynamic data masking. |
| enforce / be enforced at ~ | 動詞 | 「〜で強制する/強制される」。ポリシー・ルールの適用を示す技術文書頻出語 | Masking policies are enforced at the column level. |
| before being + 過去分詞 | 動名詞受動態 | 「〜される前に」。`before it is + 過去分詞` の省略形。データ処理の順序を示す | Data is encrypted before being transmitted to the stage. |
| Once S + V, 主節 | 接続詞 | 「一旦〜すると、〜したとたん」。起点となる状態変化を示す接続詞 | Once the data is in a stage, it is stored encrypted. |
| stored encrypted | 分詞の連続 | 「暗号化された状態で保存される」。`stored` + 形容詞 `encrypted` を連続させる自然な英語表現 | It is stored encrypted in the internal stage. |
| default to ~ | 句動詞 | 「〜をデフォルト値とする」。関数・設定のデフォルト動作を説明する定番表現 | The function defaults to -1 if no value is provided. |
| take A as B | 熟語 | 「AをBとして受け取る」。関数の引数説明の定番パターン | The function takes a number as the parameter. |
| the Nth most recent | 形容詞句 | 「N番目に最近の」。序数 + 最上級の組み合わせ。時系列の位置を表す試験頻出表現 | The 2nd most recent query in the session. |
| and so on | 副詞句 | 「などなど、以下同様」。数列・リストのパターンが続くことを示す | -1, -2, -3, and so on. |
| valid examples of ~ | 名詞句 | 「〜の有効な例」。すべての選択肢が正解であることを断言する解説文頻出パターン | All of these are valid examples of Snowflake drivers. |
| currently available | 形容詞句 | 「現在利用可能な」。製品・機能のリスト紹介に使う定型表現 | The following drivers are currently available. |
| let + O + 原形不定詞（関係詞節内） | 使役構文 | 「Oが〜できるようにする」。関係詞節の中でも使役動詞 let が使われる | Connectors that let different languages connect to Snowflake. |
| be meant to ~ | 熟語 | 「〜することを意図されている・〜のために設計されている」。製品・機能の設計目的を述べる受動態表現 | VPS is meant to provide isolation from other customers. |
| thus | 接続副詞 | 「したがって」。セミコロン後に置いて前文の論理的帰結を導く。therefore と同義 | Resources are dedicated; thus, no sharing occurs. |
| its own ~ | 所有代名詞句 | 「独自の〜・自分自身の〜」。shared ではなく専用であることを強調する表現 | Each VPS instance has its own metadata store. |
| minimum edition that ~ | 名詞句 | 「〜をサポートする最低のエディション」。ある機能が使える最も低いグレードを問う試験頻出パターン | What is the minimum edition that supports this feature? |
| the same A as B | 比較構文 | 「BのAと同じA」。2つの対象の同等性を示す定番表現 | Snowpipe supports the same transformations as the typical COPY. |
| as + 過去分詞（省略構文） | 分詞句 | 「〜によって提供される（ような）」。`as [it is] provided by ~` の省略形。比較対象を簡潔に示す | the same transformation as provided by the typical COPY command |
| available to ~ | 形容詞句 | 「〜で利用可能な」。`available for ~`（何かのため）と区別する。機能・オプションのアクセス可能性を示す | the same transformations available to the COPY command |
| highly selective | 形容詞句 | 「非常に高選択性の」。WHERE条件がごく少数の行にしかマッチしないことを示す。パフォーマンス文脈で頻出 | Point lookup queries use highly selective filters. |
| only one or a few ~ | 数量表現 | 「1つまたは少数のみ〜」。全体に対して極めて少ない件数を示す強調表現 | Point lookups return only one or a few rows. |
| greater than ~ | 比較表現 | 「〜より大きい」。= more than ~。数値・サイズ・閾値の比較に使う | Tables with greater than 1TB of data. |
| just like ~ | 前置詞句 | 「〜と全く同様に」。`like ~` より完全な同等性を強調する表現 | You can query an external table just like a regular table. |
| remove the need for ~ | 熟語 | 「〜の必要性をなくす」。機能のメリット説明に使う定番表現 | External tables remove the need for data to be loaded. |
| may be + 過去分詞 | 助動詞+受動態 | 「〜することができる」。`can be` と同義で技術文書・仕様書で使われる可能性・許可の may | External tables may be joined to other tables. |
| alternative approach | 名詞句 | 「代替手法・別のアプローチ」。標準とは異なる手法の紹介に使う | Snowflake offers an alternative approach called external tables. |
| in addition to ~ | 前置詞句 | 「〜に加えて、〜の他に」。既存機能に追加で提供される機能を紹介する定番表現。= besides ~ | Key pair auth is supported in addition to username/password login. |
| consist of ~ / comprise ~ | 動詞句 | 「〜で構成される」。構成要素を述べる。`consist of` は主語=全体+of+部分、`comprise` は主語=全体+目的語=部分 | This approach comprises private and public keys. |
| at any point in time | 副詞句 | 「いつでも」。`at any time` の強調版。制限なくいつでも実行可能なことを示す | Public keys can be rotated at any point in time. |
| with O + 過去分詞（並列） | 付帯状況 | 「OがそれぞれAされ、BされるStateで」。2つの役割を対比的に示す付帯状況構文の並列 | with the public key allocated to a user and the private key used for authentication |
| at any point in time | 副詞句 | 「任意の時点で・いつでも」。タイミングに制約がないことを示す | Keys can be rotated at any point in time. |
| be an alternative to ~ | 熟語 | 「〜の代替である」。2つの方法が同等に機能できることを示す | Key pair auth is an alternative to username/password auth. |
| with a lag of ~ | 前置詞句 | 「〜の遅延で・〜のラグで」。データ更新の遅延量を示す表現 | Data refreshes with a lag of 45 minutes to 3 hours. |
| depending on ~ | 分詞構文 | 「〜によって異なる」。条件によって値・結果が変わることを示す | The latency varies, depending on the view. |
| be retained for ~ | 熟語受動態 | 「〜の間保持される」。データの保存期間を述べる定番表現 | Data in ACCOUNT_USAGE views is retained for up to 365 days. |
| be required to ~ | 熟語受動態 | 「〜することが求められる・要求される」。要件・制約を示す定番表現 | You are required to share data across multiple databases. |
| suggest + 動名詞 | 熟語 | 「〜することを提案する・推奨する」。`recommend` と同様の使い方。`suggest to do` は不可 | Snowflake suggests creating secure views within a single database. |
| consolidate | 動詞 | 「集約する・統合する」。バラバラなデータ/機能を1か所にまとめる。データ共有・アーキテクチャ設計で頻出 | Secure views consolidate data from multiple databases. |
| must be met | 義務受動態 | 「満たされなければならない」。`meet conditions/criteria` の受動態。要件の充足を表す定番表現 | Several conditions must be met for cache reuse. |
| make no use of ~ | 熟語強調否定 | 「〜を一切使用しない」。`does not use ~` より強い否定。ゼロ使用を強調 | The query must make no use of runtime functions. |
| be eligible for ~ | 熟語 | 「〜の対象になる・〜の資格がある」。例外・適用対象を示す重要表現 | CURRENT_DATE queries are eligible for query result caching. |
| note that ~ | 命令句 | 「〜に注意せよ」。重要な例外・補足情報を読者に注意喚起する | Note that CURRENT_DATE is eligible for caching. |
| remain unchanged | 熟語 | 「変更されていない状態を保つ」。`has remained unchanged` = 現在完了で状態の継続を示す | The underlying data has remained unchanged. |
| just like any other ~ | 比較表現 | 「他のどの〜とも全く同じ」。制限や特別扱いなしの完全な同等性を示す。試験の解説文で「特殊ではない」ことを断言するときに使われる | A cloned table is just like any other table. |
| based on ~ | 分詞句（冒頭） | 「〜に基づいて・〜を踏まえて」。`Based on the requirement/analysis/results` のように冒頭で根拠・前提を示す定番パターン | Based on the requirement, a transient table is best. |
| be available across ~ | 熟語 | 「〜をまたいで利用可能である」。セッション・チーム・プラットフォーム間でのアクセス可能性を示す。`across sessions` が典型 | Transient tables are available across sessions. |
| be required to do | 受動態熟語 | 「〜することが要求される・〜しなければならない」。外部要件・制約条件を示す定番表現。`must do` よりフォーマル | You are required to minimize data storage costs. |
| does not have the privileges to do | 否定熟語 | 「〜する権限を持っていない」。`cannot do` より「権限の有無」を明示的に述べる表現。セキュリティ・アクセス制御の文脈で頻出 | SYSADMIN does not have the privileges to create users. |
| most ~（例外ありの限定詞） | 限定詞 | 「ほとんどの〜（例外あり）」。`all` ではなく `most` を使うことで制限があることを暗示する。解説文で例外の存在を示すときに使われる | SYSADMIN can manage most Snowflake objects. |
| regarding ~ | 前置詞 | 「〜に関して・〜について」。`about ~` より格式的。試験問題のタイトル的な問いかけ文で頻出 | Which is true regarding the SYSADMIN role? |
| much / far + 比較級 + than ~ | 比較表現 | 「〜よりはるかに〜」。比較級を `much` または `far` で強調して差の大きさを示す。どちらも「段違いに」のニュアンス。`even`（さらに一層）と使い分けること | Zero-copy cloning is far faster than the physical copying of data. |
| no + 名詞（完全否定） | 否定構文 | 「全く〜ない」。`not any ~` より強い完全否定。ゼロであることを明示 | No partition pruning happened. |
| should be + 過去分詞 | 受動態助動詞 | 「〜すべきである（改善・修正の推奨）」。`must` より穏やかな義務・推奨を示す受動態 | The clustering key should be improved. |
| including ~（挿入句） | 前置詞/挿入句 | 「〜を含む」。主語と動詞の間にコンマで挿入して具体例を列挙する。`such as ~` と同義だが including はより包括的な意味合い | All tools, including SnowSQL and JDBC, support MFA. |
| snowflake-managed（複合形容詞） | 複合形容詞 | 「Snowflakeが管理する」。`managed by Snowflake` をハイフンで形容詞化したパターン。`-managed` は技術文書で広く使われる | Snowpipe is a Snowflake-managed serverless service. |
| log into ~ | 動詞句 | 「〜にログインする」。`log in to ~` とも書く。サービス・システムへの認証アクセスを示す | Users cannot log into Snowpipe directly. |
| known as ~（後置修飾） | 後置修飾 | 「〜として知られる」。`be known as ~` の分詞構文。名詞の直後に置いて別名・定義を示す。`also known as ~` でも使われる | Small partitions known as micro-partitions. |
| be scattered across ~ | 受動態熟語 | 「〜全体に分散している」。データ・情報が広い範囲に広がっていることを示す | Column values are scattered across numerous micro-partitions. |
| in the order in which ~ | 関係詞句 | 「〜する順序で」。前置詞 + 関係代名詞の形式。`in the order that ~` と同義だがよりフォーマル | Partitions are added in the order in which data is received. |
| boosting + 名詞（分詞構文） | 結果の分詞構文 | 「その結果〜を向上させる」。直前の動作の結果・効果を付け加える分詞構文 | Pruning eliminates partitions, boosting performance. |
| point to ~ | 動詞句 | 「〜を参照する・〜を指す」。設定・オブジェクト間の参照関係を示す。`refer to ~` とほぼ同義だが、より直接的な参照先を示すときに使う | A Snowpipe that points to a Named Internal Stage. |
| be associated with ~ | 受動態熟語 | 「〜に関連付けられている・〜と紐づいている」。オブジェクト間の依存・所属関係を示す定番表現 | A table stage is associated with its table. |
| ~ either（否定文末） | 副詞 | 「〜もまた（できない）」。否定文の末尾に置いて追加の否定対象を示す。`neither` の代わりに単独で使う | External tables cannot be cloned either. |
| personally | 副詞 | 「自分自身で・個人的に」。本人実行・本人操作に限定することを強調する副詞。アクセス制御・プライバシーの文脈で頻出 | You can only view results you have personally executed. |
| A but not B（対比） | 対比構文 | 「AはするがBはしない」。2つの動作を肯定と否定で対比させ、境界を明確にする。解説文で制限を説明するときに頻出 | The page displays details but not the actual result. |
| for ~ reasons | 前置詞句 | 「〜の理由から」。行動・制限の理由を簡潔に示す。`for data privacy reasons` / `for security reasons` のように使う | This is not shown for data privacy reasons. |
| virtually | 副詞 | 「事実上・実質的に」。技術的な絶対ではないが実用上はそれに等しいことを示す。`virtually unlimited` は True/False問題でTrueになる表現 | The storage capacity is virtually unlimited. |
| A-based（複合形容詞） | 複合形容詞 | 「Aを基盤とした・Aベースの」。ハイフンで名詞と `based` を結んで形容詞化。技術文書で製品・技術の基盤を示す | A Snowflake-based / cloud-based data warehouse. |
| since | 接続詞 | 「〜なので・〜のため」。`because` と同義の理由節の接続詞。技術文書ではやや格式的 | Since Snowflake uses cloud storage, capacity is unlimited. |
| It is possible to do | 形式主語構文 | 「〜することが可能だ」。形式主語 `It` + `possible` + 真の主語（不定詞句）。True/False問題でこの構文が出たら実際に可能かを慎重に確認 | It is possible to disable failsafe. → False |
| entirely | 副詞 | 「完全に・すべて」。絶対的な無効化・無制限を主張する強調副詞。True/False問題で False のシグナルになりやすい | You cannot disable fail-safe entirely. |
| further | 形容詞/副詞 | 「さらなる・追加の」。既存の期間・保護に上乗せされる追加分を示す。`additional` と同義 | Data is kept for a further 7-day period. |
| address | 動詞 | 「〜に対処する・解決する」。技術文書で問題への対応策を説明するときの定番動詞。`solve` より広義 | Multi-cluster warehouses address the concurrency issue. |
| as needed | 副詞句 | 「必要に応じて」。自動調整・オンデマンドな処理を示す定番表現 | Clusters are added as needed. |
| be queued | 受動態 | 「キューに入れられる・待ち行列に並ぶ」。リソース上限到達時の動作を示す | New queries are queued when the warehouse is at capacity. |
| exceed | 動詞 | 「超える・上回る」。閾値・上限を超えることを示す技術文書頻出語 | When users exceed the warehouse capacity, clusters are added. |
| as ~ change | 接続詞句 | 「〜が変化するにつれて」。`as` が変化の連動性を示す。`when` より漸進的ニュアンス | Clusters are added or removed as demand changes. |
| not A but B（目的の対比） | 構文 | 「AではなくB（のために使われる）」。機能の誤解を正す解説文で頻出。`not used for A but for B` の形が多い | Fail-safe is not used by end users but to recover from accidental data loss. |
| security against ~ | 名詞句 | 「〜に対する保護・セキュリティ」。リスク・障害への対策を示す定番の前置詞句 | Fail-safe offers additional security against data loss. |
| an additional period of ~ | 名詞句 | 「さらに〜の期間」。既存の期間に上乗せされる追加期間を示す | Data is stored for an additional period of seven days. |
| once + 現在完了, 主節 | 時間節 | 「〜が完了したら」。`once S + have + 過去分詞` で動作の完了を起点にする | Once the retention period has ended, fail-safe begins. |
| only ~ has the privilege to do | 構文 | 「〜だけが〜する権限を持つ」。排他的な権限を強調する。`privilege to do` = 〜する権限 | Only ACCOUNTADMIN has the privilege to manage shares. |
| if required | 条件句 | 「必要であれば」。`if it is required` の省略形。条件節の主語+be動詞省略の慣用的なパターン | Privileges can be granted to other roles if required. |
| be granted to ~ | 受動態熟語 | 「〜に付与される」。権限・役割の委譲を表す定番受動態。`grant A to B` の受動態 | Privileges can be granted to other roles. |
| even if ~ | 接続詞 | 「たとえ〜でも」。予想される条件・障害があっても動作が変わらないことを強調。`even though`（事実として〜でも）と違い仮定的ニュアンスを含む | Queries continue to execute even if the worksheets are inactive. |
| continue to do | 熟語 | 「〜し続ける」。中断されずに処理が継続することを示す。バックグラウンド実行の文脈で頻出 | The queries continue to execute in the background. |
| each with ~ | 付帯状況句 | 「それぞれが〜を持つ」。`each [being] with ~` の省略形。複数要素のそれぞれに属性があることを示す簡潔な表現 | Multiple worksheets, each with a different query. |
| simultaneously | 副詞 | 「同時に」。複数の処理が並行して行われることを示す。`at the same time` と同義だが技術文書ではこちらが多い | Multiple queries can be executed simultaneously. |
| benefit from ~ | 動詞句 | 「〜から恩恵を受ける」。ある機能・処理の対象となる要素を限定する際に使う | Only those micro-partitions which benefit from re-clustering are adjusted. |
| those + 名詞 + which ~ | 限定構文 | 「〜であるところの（名詞）のみ」。`those` が特定の対象を指し、関係詞節でさらに限定する | Automatic Clustering only adjusts those micro-partitions which benefit from the process. |
| It has been N days since ~ | 経過時間構文 | 「〜からN日が経過した」。現在完了 + since で経過時間を示す。試験問題でTime Travel/Fail-Safe境界を判断させるシナリオ設定に頻出 | It has been 92 days since the deletion. |
| the best course of action | 名詞句 | 「最善の行動方針」。複数の手段が可能でも最も適切なものを選ばせる試験問題の定番表現 | What should be the best course of action to recover data? |
| contribute towards ~ / count towards ~ | 動詞句 | 「〜に寄与する / 〜に算入される」。コスト計算に含まれるかを問う問題で頻出。同義表現 | Time Travel storage contributes towards storage costs. |
| prove + 形容詞 | SVC構文 | 「〜であると判明する」。`prove beneficial`（有益であるとわかる）のように prove が連結動詞として機能する。試験問題で有効なシナリオを問う定番表現 | Creating a materialized view will prove beneficial for this scenario. |
| are not guaranteed to be ~ | 受動態構文 | 「〜であることが保証されない」。仕様上の非保証を述べる。True/False問題で重要な表現 | Similar values are not guaranteed to be in the same partition. |
| spin up | 句動詞 | 「起動する、立ち上げる」。クラウドインフラの文脈でインスタンスの起動を示す。`start` より口語的・技術的 | Snowflake can spin up compute instances in a different availability zone. |
| the easiest way to ~ is by doing | 補語構文 | 「〜する最も簡単な方法は…することだ」。最善解・推奨アプローチを示す定番文型。`is by + 動名詞` が補語 | The easiest way to add a key is by running ALTER TABLE. |
| more than ~ | 前置詞句 | 「〜超・〜より多い」。数値の下限（その値は含まない）を示す。試験問題のシナリオ設定でよく使われる | The table contains more than 5TB of data. |
| running + 固有名詞（現在分詞後置修飾） | 現在分詞後置修飾 | 「〜を使っている・〜を運用している」。企業・組織がシステムを稼働させていることを示す | a large retailer running Snowflake |
| are all + 過去分詞 | 副詞強調受動態 | 「すべて〜される（例外なく全員が対象）」。`all` が `be動詞` と `過去分詞` の間に挿入されて主語全体を強調する | Java, Scala & Python are all supported by Snowpark. |
| S + V + which of the following ~? | 埋め込み疑問 | 「〜のうちどれを〜しますか」。通常の疑問文より形式的な語順。試験問題で目的語位置に疑問詞を置く技術文書スタイル | Snowpark supports which of the following languages? |
| be supported in ~ | 受動態熟語 | 「〜でサポートされている」。機能・エディション・プラットフォームの対応状況を述べる定番の受動態表現 | Time Travel is supported in all Snowflake editions. |
| in all ~ | 前置詞句 | 「すべての〜において」。`all` で例外ゼロを強調する。試験の「全エディション対応」系の問いで頻出 | Time Travel is available in all editions. |
| support + 動名詞 | 熟語 | 「〜することをサポートする」。`support to do` は誤りで必ず動名詞をとる。`allow/enable + to do` と混同しないこと | Snowflake supports loading from external stages. |
| be made available | 受動態熟語 | 「利用可能な状態にされる」。`make ~ available` の受動態。データ準備・アクセス許可の文脈で頻出 | Data is first made available in a Snowflake stage. |
| allow O access to ~ | 熟語 | 「OがXにアクセスするのを可能にする」。`allow O to do` とは異なり名詞 access を使う語順 | The stage allows Snowflake access to the data. |
| indicate that ~ | 熟語 | 「〜であることを示す・〜を表示する」。システム・UI・結果が何かを視覚的・情報的に伝えているときの定番動詞 | The query profile indicates that results were reused. |
| fulfill a query | 熟語 | 「クエリの要求を満たす・クエリに応答する」。キャッシュやシステムがクエリへの回答を提供する文脈で使われる | The cache can fulfill future queries. |
| there have been no ~ | there構文+現在完了否定 | 「〜がなかった（変化が生じていない状態）」。現在完了の there 構文で変化のゼロを強調する | There have been no changes to the data in the tables. |
| underlying | 形容詞 | 「基礎となる・根底にある」。表面ではなく本質的な部分を指す技術文書頻出語 | The underlying data contributes to query results. |
| Assume ~（命令形） | 命令形 | 「〜と仮定せよ・〜とします」。試験問題でシナリオの前提条件を設定する定番の命令形。`Assuming that ~`（分詞構文）より断定的 | Assume a share has been granted to a consumer. |
| be identical to ~ | 形容詞句 | 「〜と全く同一である」。`the same as ~` より「完全一致」を強調する。否定形 `not identical to ~` で「同一ではない」を示す | Questions are not identical to the actual exam. |
| separate A from B | 動詞句 | 「AをBから分離する」。責務・役割の分離（separation of concerns）を説明するときの定番表現 | USERADMIN separates user management from grant management. |
| be dedicated to ~ (only/solely) | 熟語 | 「〜のみに特化している」。`only` や `solely` を加えて限定的な責務を強調する。`be meant for ~` より強い専念のニュアンス | USERADMIN is dedicated solely to user and role management. |
| solely | 副詞 | 「〜のみ・専ら」。`only` より強い限定を示す。`dedicated solely to ~` の形で特化・専念を強調する | USERADMIN is dedicated solely to user and role management. |
| which is the job of ~ | 関係詞節 | 「それは〜の仕事である」。前文全体を先行詞にとる非制限関係詞節で、別のロール・担当者の責任範囲を明確化する | USERADMIN cannot manage grants, which is the job of SECURITYADMIN. |
| rather than + 動名詞 | 接続詞句 | 「〜するのではなく」。2つの行動・方法を対比して一方を否定する。`rather than to do` の形もある | Test understanding rather than relying on memorization. |
| be designed to do | 受動態熟語 | 「〜するよう設計されている」。製品・コース・機能の設計目的を述べる定番受動態。`be meant to do` と同義 | The course is designed to help you understand. |
| be crafted to do | 受動態熟語 | 「〜するよう丁寧に作られている」。`be designed to do` より「工夫・配慮」のニュアンスが強い | Questions are crafted to test deep knowledge. |
| align with ~ | 熟語 | 「〜と整合している・〜に沿っている」。目標・方針・要件との一致を示す | These questions align with the exam's objectives. |
| grasp of ~ | 名詞句 | 「〜の把握・理解」。`understanding of ~` と同義だが「しっかりつかむ」能動的ニュアンス。`strengthen your grasp` の形で頻出 | Strengthen your grasp of the subject matter. |
| tackle ~ | 動詞 | 「〜に取り組む・挑む」。困難な問題や課題に積極的に向き合うことを示す。`address ~` より口語的 | Confidently tackle any question. |
| load ~ with JSON data | 動詞句 | 「〜にJSONデータをロードする」。`load` の目的語がテーブルで `with` がロードされる内容を示す。`load data into ~` と語順が逆の点に注意 | You have already loaded the table with JSON data. |
| to be loaded into ~ | 受動態不定詞 | 「〜にロードされるための」。`to be + 過去分詞` で目的・意図を示す受動態の不定詞。データ移行・変換の文脈で頻出 | Values to be loaded into a relational table. |
| perform queries on ~ | 動詞句 | 「〜に対してクエリを実行する」。`run/execute queries` より技術文書的・フォーマルな表現 | Performing queries on JSON data in VARIANT columns. |
| if desired | 条件句（省略形） | 「必要であれば・希望すれば」。`if it is desired` の省略形。オプション機能・任意の動作を示す定番表現 | A stored procedure can return tabular data if desired. |
| it is not a requirement that ~ | 形式主語構文 | 「〜は必須ではない・〜は要件ではない」。`it is` + 名詞 + `that節` で制約の非必須性を示す。`must not` ではなく「しなくてよい」という選択的な意味 | It is not a requirement that a stored procedure must return a value. |
| as many ~ as they like | 数量表現 | 「好きなだけ多くの〜・無制限に〜」。上限なし・無制限を示す慣用表現。`as many ~ as desired/needed` も同様のパターン | Customers can have as many accounts as they like. |
| one or more ~ | 数量表現 | 「1つ以上の〜」。最低数が1であることを明示する表現。技術仕様の最小要件を示すときに頻出 | Each database contains one or more schemas. |
| represent ~ | 動詞 | 「〜を表す・〜を示す」。図・記号・構造が何かを正しく表現しているかを問う動詞。`correctly represents` の形で試験問題の問いかけに頻出 | Which option correctly represents the hierarchy? |
| be contained in only one ~ | 受動態熟語 | 「1つの〜にのみ含まれる」。排他的な1対1の所属関係を示す。`only one` で多重所属の不可を明示 | An object can be contained in only one schema. |
| control access to ~ | 動詞句 | 「〜へのアクセスを制御する」。データ・リソースへのアクセス制限を設定する文脈で頻出。`restrict/limit access to ~` とほぼ同義 | Use the function to control access to data in a share. |
| allow A to B（allow A only to B） | 動詞句 | 「AをBに許可する・BのみにAを提供する」。`only` を加えて特定対象への限定を強調できる | Allow specific data only to paying customers. |
| paying ~ / paid ~ | 形容詞 | 「料金を支払っている〜」。`paying customer`（現在進行形で状態を示す）と `paid customer`（完了で既に支払い済みを示す）はほぼ同義で使われる | Show data only to paying/paid customers. |
| be visible to ~ | 熟語 | 「〜に見える・〜に表示される」。データ・情報がアクセス可能であることを示す。`accessible to ~` と同義 | Control which data is visible to paid customers. |
| which ~ and which ~ | 並列間接疑問 | 「どれが〜で、どれが〜か」。2つの間接疑問文を `and` で並列。後半の繰り返し部分は省略されることが多い | Control which is visible to paid and which to trial customers. |
| ensure that ~ | 熟語 | 「〜であることを確実にする・保証する」。`make sure that ~` と同義。誤答選択肢で「手動操作が必要」を示すパターンとして頻出。Snowflakeが自動処理している場合は誤りのシグナル | Run the command to ensure that the object appears. |
| create ~ on a Share（object） | 動詞句 | 「Shareを基にして〜を作成する」。`on ~` が「〜を土台に・〜から」の意味。Share上にDBを作成する定番表現 | Create a read-only database on a Share object. |
| well- + 過去分詞（複合形容詞） | 複合形容詞 | 「よく〜された・上手く〜された」。`well-` と過去分詞をハイフンで結んで状態の良好さを示す。`well-clustered`・`well-defined`・`well-structured` などが典型 | A well-clustered table has a depth of 1. |
| start at ~（最小値の指定） | 動詞句 | 「〜から始まる・〜が下限値」。数値の最小値・出発点を示す。`start at 1` = 「1が最小値」 | Clustering depth starts at 1 for a well-clustered table. |
| populated | 形容詞 | 「データが格納された・充填された」。本来「人口が多い」の意味だが技術文書ではテーブルにデータが存在する状態を示す | Clustering depth is measured for a populated table. |
| run into ~ | 句動詞 | 「〜の数に達する・〜に至る」。数量が大きな値に達することを示す。`reach ~` と同義だが技術文書・スケール説明で頻出 | The count can run into millions of micro-partitions. |
| depends mainly on ~ | 動詞句 | 「主に〜に依存する・〜によって主に決まる」。`mainly` で主要因を強調しつつ他の要因も完全否定しない。`primarily depends on ~` と同義 | The count depends mainly on the amount of data. |
| millions or hundreds of millions | 数量表現 | 「数百万または数億」。大規模データシステムのスケール感を示す定番表現。試験でこの規模感が正解として問われる | Large tables can have millions or hundreds of millions of micro-partitions. |
| enroll in ~ | 動詞句 | 「〜に登録する・〜に加入する」。サービス・プログラムへの参加登録を示す。MFAへの登録で頻出。`sign up for ~` よりフォーマル | You can enroll in MFA through the profile dialogue. |
| be configured for ~ | 受動態熟語 | 「〜に対して設定される・〜向けに構成される」。UI設定・システム設定の文脈で頻出。`configure A for B` の受動態 | Default Role can be configured for a user profile. |
| specify ~ | 動詞 | 「〜を指定する・〜を明示する」。設定値・オプションを明確に選択・定義することを示す。`set ~` より「明示的な選択」のニュアンスが強い | Specify your notification preferences in the profile. |
| as soon as ~ | 接続詞 | 「〜するとすぐに・〜するや否や」。即時性を強調する時間節の接続詞。データ共有・イベント処理で「遅延なし」を示す最重要表現 | Objects become accessible as soon as they are added. |
| become accessible to ~ | 熟語 | 「〜にアクセス可能になる」。`accessible` は形容詞で `become + 形容詞` の補語。データ共有・権限付与の文脈で頻出 | New objects become accessible to the consumer. |
| Through which of the following can ~? | 前置詞前置+倒置疑問文 | 「次のうちどれを通じて〜できるか」。前置詞 `through` を疑問詞 `which` とともに文頭に出し、助動詞 `can` を主語の前に倒置させる。試験問題で「手段・経路を問う」パターン | Through which of the following can users search for third-party datasets? |
| make O available (SVOC) | SVOC使役構文 | 「Oを利用可能な状態にする」。`available` が補語(C)として目的語(O)の状態を説明するSVOC構文。受動態 `be made available` でも頻出 | Different organizations have made their data available on the Marketplace. |
| without + 名詞（無条件の否定） | 前置詞句 | 「〜なしに・〜を必要とせずに」。`without + 動名詞`（without using）と違い、`without + 名詞`（without authorization）で「そのリソース・プロセス全体が不要」を示す。試験で「認証不要」のキーワードとして頻出 | Users can access files via a pre-signed URL without authorization. |
| is configurable and can be set to ~ | 並列述語 | 「設定可能で、〜に設定できる」。形容詞述語 `is configurable`（設定可能性）と受動態 `can be set to`（具体的な設定値）を `and` で並列させ、2段階の説明をする定型表現 | The expiry duration is configurable and can be set to the required duration. |
| for + 動名詞（用途・目的） | 前置詞句 | 「〜するための・〜に使われる」。名詞の直後に置いて用途・目的を示す。`to + 不定詞`（to access）と同義だが、機能・ツールの説明文で `for + 動名詞` が好まれる | A pre-signed URL is a simple HTTPS URL for accessing a file. |
| ; rather, ~ | 対比の接続副詞 | 「そうではなく、むしろ〜」。セミコロンで前節の否定（does not ~）を受け、`rather,` で正しい情報を提示する。Snowflakeの仕様説明でよく使われる対比パターン | Snowflake does not deploy instantly; rather, accounts are moved in a phased manner. |
| in a phased manner | 副詞句 | 「段階的な方法で」。`in a ~ manner` は「〜の方法で・〜のやり方で」を示す定型表現。`gradually` や `step by step` より書き言葉的でフォーマル | Customer accounts are moved into the new release in a phased manner. |
| enable O to do（active） | SVOC構文 | 「OがするのをOKにする・Oに〜する能力を与える」。`allow O to do` と同義だが、`enable` は「条件・能力を与えて可能にする」ニュアンス。`support + 動名詞` とは異なりto不定詞をとる | This strategy enables Snowflake to identify and address issues. |
| a minimum of N | 名詞句 | 「最低N〔単位〕」。下限値を示す。`at least N` と同義だが技術仕様の数値要件でよく使われる | A minimum of 24 hours must pass between deployments. |
| elect for ~ | 句動詞 | 「〜を選択する・〜を希望する」。`opt for ~` や `choose ~` より書き言葉的でフォーマル。登録・選択の意思表明を示す | Accounts that have elected for early access receive updates first. |
| opt into ~ | 句動詞 | 「〜にオプト・インする（自発的に参加登録する）」。デフォルトではない機能・プログラムに能動的に参加することを示す。`opt out of ~`（離脱する）の対義語。試験では選択的な機能登録の文脈で頻出 | Enterprise accounts which have opted into early access are updated on Day 1. |
| All ~, except X, can ~ | 例外挿入構文 | 「Xを除くすべての〜が〜できる」。コンマで `except X` を挿入して例外を明示する。先に全体ルールを述べ、次に例外を示す英語の典型的な論理構造 | All Snowflake accounts, except VPS accounts, can use the Marketplace. |
| and, therefore, | 因果の挿入副詞 | 「そして、したがって」。`therefore` をコンマで挟んで `and` の後に挿入し、前節の事実から論理的帰結を導く。`; therefore,`（セミコロン）より口語的な接続形式 | VPS has isolated metadata and, therefore, can't use the Marketplace. |
| built on ~ | 過去分詞の後置修飾 | 「〜の上に構築された・〜をベースにした」。名詞を後から修飾する過去分詞句。インフラ・アーキテクチャの依存関係を示す | Marketplace is built on the common cloud services provided by Snowflake. |
| Furthermore, | 接続副詞 | 「さらに・加えて」。前文に追加・補足情報を続ける。`Moreover` / `In addition` と同義だが、より形式的な書き言葉。列挙の最後や最も重要な追加点に使われることが多い | Furthermore, ACCOUNT_USAGE views include ID columns to differentiate objects. |
| because objects can be + 過去分詞 and 過去分詞 | 理由節 | 「オブジェクトが〜され、〜される可能性があるため」。`because` 節の中で受動態の助動詞 `can be` に2つの過去分詞を並列させる。システム設計の必要性・背景を説明するパターン | Because objects can be dropped and recreated with the same name, IDs are needed. |
| generated and assigned to ~ by the system | 複合過去分詞の後置修飾 | 「システムによって〜に生成・割り当てられた」。2つの受動態過去分詞を `and` で並列にして名詞を後置修飾する。`by the system` で行為者（システム）を明示 | The internal IDs generated and assigned to each object by the system. |
| differentiate amongst ~ | 動詞句 | 「〜を区別する・〜間で差別化する」。`amongst` は `among` のイギリス英語形。複数のレコードやオブジェクトを識別・区別する文脈で使われる | ID columns differentiate amongst object records with the same name. |
| , however | 対比の接続副詞 | 「しかしながら」。コンマで前節の内容を受け、対比する情報を続ける。`; however,`（セミコロン後）と違いコンマのみで前文に繋ぐ形。`but` より書き言葉的でフォーマル | It can be browsed by anyone, however they need an account to consume data. |
| in order to ~ | 目的の接続詞句 | 「〜するために」。`to + 不定詞` と同義だが、目的を明確に強調するフォーマルな表現。技術文書・試験の解説文で「必要条件を示す目的」の文脈で頻出 | Users need to sign up in order to consume data from the marketplace. |
| Do note that ~ | 強調命令文 | 「〜に注意せよ・〜を必ず覚えておくこと」。`note that ~` に助動詞 `do` を加えて命令を強調。試験問題で例外・重要事項を強調するときの定番フレーズ | Do note that VPS doesn't support Data Marketplace. |
| as well | 副詞句 | 「〜もまた・同様に」。文末または節末に置いて「前述のグループに加えてこのグループも」を示す。`too` や `also` と同義だが文末での使用が自然 | Non-Snowflake users can browse the Marketplace as well. |
| on a per-~ basis | 前置詞句 | 「〜単位で・〜ごとに」。課金・評価の基準・粒度を示す定型表現。`per-second`（秒単位）/ `per-minute`（分単位）/ `monthly`（月単位）などのバリエーションがある | Snowflake credits are billed on a per-second usage basis. |
| a minimum of N applies | 自動詞構文 | 「最低N〔単位〕が適用される」。`apply` の自動詞用法（当てはまる・適用される）。`applies to ~`（〜に適用される）とは異なり目的語なしで「最低条件が発動する」を示す | A minimum of 60 seconds of billing applies. |
| if ~ were + 過去分詞（仮定法過去） | 仮定法過去（受動） | 「もし〜されたとしたら」。実際の出来事を仮定法で一般化して説明するパターン。`were` で事実でなく仮定的な状況を示す | If a warehouse were started and shut down within the first minute, 60 seconds would apply. |
| within the first N minutes | 時間の前置詞句 | 「最初のN分以内に」。`within`（〜の範囲内）+ `the first`（最初の）で開始から一定時間内を示す。課金・タイムアウト・制限時間の文脈で頻出 | If shut down within the first minute, minimum billing applies. |
| be used to do（受動態） | 受動態熟語 | 「〜するために使われる」。`be used to doing`（〜することに慣れている）と形が似ているが意味が全く異なる。技術文書では「機能・ツールの用途」を述べるこちらが圧倒的に多い | Stored procedures are often used to perform recurring activities. |
| e.g., | 略語 | 「例えば」（for example）。ラテン語 exempli gratia の略。`i.e.,`（すなわち・言い換えると）と区別すること。具体例の列挙に使い、`etc.` と組み合わせることが多い | Administrative tasks, e.g., user creation, role assignment, etc. |
| whenever there is a requirement to ~ | 副詞節 | 「〜する必要があるときはいつでも」。`whenever`（〜するときはいつでも）+ `there is a requirement`（必要性がある）+ `to do`（〜するための）。繰り返し呼び出し・条件付き実行の文脈で頻出 | The procedure can be called whenever there is a requirement to create a new user. |
| Given + 名詞（分詞構文） | 分詞構文（条件） | 「〜が与えられたとき・〜を前提として」。`Given` は過去分詞の慣用的な分詞構文。`If ~ is/are given` の省略形で試験問題の条件設定によく使われる | Given two inputs, calculate the MAX of the two values. |
| With the ~ privilege（条件の前置詞句） | 前置詞句（条件） | 「〜権限があれば・〜権限を持つロールは」。`with` が「付帯状況・条件」を示す前置詞として文頭に置かれる。権限・役割の説明で頻出のパターン | With the OPERATE privilege, a role can suspend or resume tasks. |
| de- 接頭辞（反意語形成） | 接頭辞 | 「〜を逆にする・〜を解除する」。動詞に `de-` を付けて反対の動作を示す。`prioritize → deprioritize`（優先度を下げる）/ `activate → deactivate`（無効化する） | There is no option to deprioritize task execution in Snowflake. |
| on top of ~ | 前置詞句 | 「〜の上に・〜を基盤として」。単なる `on ~` より「重ねる・積み上げる」ニュアンスが強く、上位レイヤーへの作成・追加を示す。技術文書でアーキテクチャの階層関係を示すときに使われる | Create a stream on top of the stage object. |
| This is done by + 動名詞 | 受動態構文 | 「これは〜することで行われる・実現される」。前述の処理・機能の実現方法を説明する定番パターン。`by + 動名詞` が手段を示す | This is done by creating a stream on the stage object. |
| track which ~ have been + 過去分詞 | 間接疑問+完了受動態 | 「どれが〜されたかを追跡する」。`track`（追跡する）の目的語として間接疑問文 `which ~ have been pp` を置く。変更追跡・監査の文脈で頻出 | Track which files have been added, removed, or changed. |
| range between X and Y | 動詞句 | 「XからYの範囲にわたる」。`range` の自動詞用法。`range from X to Y` と同義。数値の範囲・幅を示す。Time Travel・保持期間の文脈で頻出 | The time travel can range between one and ninety days. |
| for an additional N days | 期間の副詞句 | 「さらにN日間追加で」。`additional`（追加の・さらなる）で前述の期間に続く追加期間を示す。`extra` より書き言葉的でフォーマル | Fail-Safe retains data for an additional seven days. |
| after ~ has expired | 時間節 | 「〜が失効した後」。`expire`（期限が切れる・失効する）の現在完了形 `has expired` で前の期間が終了した時点を条件として示す | Fail-Safe kicks in after the Time Travel duration has expired. |
| outweigh ~ | 動詞 | 「〜を上回る・〜より重い」。コスト・メリット比較の文脈で頻出。`the cost outweighs the benefit` で「コストが恩恵を上回る（→ 割に合わない）」を示す定番表現 | The resources required to keep the MV up-to-date will outweigh the benefit the view provides. |
| If it did + 動詞（強調仮定） | 直説法過去の仮定 | 「もし仮に〜したとすれば」。`did` で動詞を強調しつつ、現実には起きていない/望ましくない状況を仮定する。仮定法過去（`If it were`）より口語的で技術解説文によく現れる | If it did change frequently, the cost would outweigh the benefit. |
| adds another layer of protection against ~ | 動詞句 | 「〜に対する保護のレイヤーをもう一つ追加する」。多層防御（defense in depth）の概念を示す定番表現。セキュリティ・データ保護の文脈で頻出 | Fail-Safe adds another layer of protection against data loss. |
| be compatible with ~ | 形容詞句 | 「〜と互換性がある・〜と連携できる」。`support ~`（〜をサポートする）より「共存・接続できる」ニュアンスが強い。IdP連携・ドライバー・クライアントの文脈で頻出 | Snowflake is compatible with Okta and Azure Active Directory. |
| sync A with B | 動詞句 | 「AをBと同期させる」。A（同期元）をB（同期先）と一致させる操作。SCIM・データ連携の文脈で頻出。`synchronize` の短縮形 | SCIM can sync groups defined in an identity provider with Snowflake roles. |
| except for ~ | 前置詞句 | 「〜を除いて」。ルール・制限の例外を明示する。`except ~`（接続詞的）より限定的で名詞句を取る。`(except for ~)` の形で括弧内に例外条件を補足することが多い | Casts are not supported (except for fixed-point numbers cast to strings). |
| see + 名詞（恩恵・変化の受け取り） | 動詞の慣用用法 | 「（主語が）〜を得る・経験する」。`experience`/`achieve` の代わりに `see` を使う技術文書の慣用表現。`see a performance improvement`（性能向上が得られる）、`see benefits`（恩恵を受ける）など | Queries that use equality predicates will see a performance improvement. |
| defined with a ~ clause | 過去分詞後置修飾 | 「〜句で定義された」。SQL文法でカラムやオブジェクトの定義条件を説明するときの過去分詞後置修飾パターン | Columns defined with a COLLATE clause are not supported. |
| Select N answers | 指示文 | 「N個回答を選べ」。`Select all that apply` の数量限定版。問題で回答数が明示される場合に使用される | Select three answers from the following options. |
| without requiring O to be + 過去分詞 | 前置詞句（否定の条件） | 「Oが〜される必要なしに」。`without + 動名詞`（手段の否定）+ `require O to be done`（OがdoされることをWITHOUT要求せずに）の組み合わせ。ロード不要・認証不要など「前提条件の省略」を示す文脈で頻出 | External tables allow querying without requiring data to be loaded into Snowflake first. |
| like a standard table | 比較句 | 「通常のテーブルと同様に」。外部テーブル・ビューなどが既存テーブルと同じ操作感を持つことを示す。`as ~ as a standard table` より口語的で簡潔 | The functionality enables you to query external data like a standard table. |
| like + 動名詞（例示） | 前置詞句 | 「〜のような・例えば〜」。前置詞 `like` が動名詞句を取って具体例を列挙する。`such as` と同義だが口語的。技術仕様の説明で具体例を追加するときに使われる | Organization-specific tasks like listing all accounts and creating new ones. |
| organization-specific | 複合形容詞 | 「組織固有の・組織に特化した」。`specific to an organization` の圧縮形。`-specific` 接尾辞は「〜に特化した・〜専用の」を示す。`account-specific`・`task-specific` 等のバリエーションがある | ORGADMIN handles organization-specific tasks. |
| enrich ~ | 動詞 | 「〜を豊かにする・価値を高める」。データ文脈では外部データを加えて分析精度・付加価値を向上させること（Data Enrichment）。`enhance` より「質・内容を充実させる」ニュアンスが強い | Utilize third-party data via the Marketplace to enrich your data. |
| from outside ~ | 前置詞句 | 「〜の外部から」。`outside`（外部）を前置詞の目的語として使う慣用句。「自社外部から」`from outside your company` のように組織の境界を越えたデータ取得の文脈で頻出 | You may import data from outside your company into your Snowflake instance. |
| must be granted to A to allow A to do | 受動態+to不定詞の連鎖 | 「AにAが〜できるよう付与されなければならない」。`must be granted to`（付与されなければならない）+ `to allow them to do`（〜を許可するために）の2つのto不定詞が目的の連鎖を作る | Which role must be granted to a user to allow them to create accounts? |
| more ~ than ~ can handle | 比較節 | 「〜が処理できる以上の〜」。`more X than Y can handle` で「Yの処理能力を超えるX」を示す比較構文。`than` 以降が比較の基準節として機能する | When there are more queries than a warehouse can handle, queuing occurs. |
| If there aren't enough ~ to do | 条件節 | 「〜するのに十分な〜がない場合」。`enough ~ to do`（〜するのに十分な〜）の否定形。リソース・条件の不足を示す | If there aren't enough resources to run all the queries, they are queued. |
| until ~ are available again | 時間節 | 「〜が再び利用可能になるまで」。`until`（〜するまで）で継続の終点を示す。`again`（再び）で一時的な不足からの回復を示す | Snowflake queues extra queries until the resources are available again. |
| to overcome this issue | 目的のto不定詞 | 「この問題を克服するために」。`overcome`（問題・困難を乗り越える）は解決策を提示する技術文書・試験解説の定番動詞 | Snowflake provides multi-cluster warehouses to overcome this issue. |
| altogether | 副詞 | 「完全に・まるごと・すっかり」。`completely` / `entirely` と同義。動作の完全性・全体性を強調する。`can be dropped altogether`（完全に削除できる）のように肯定文で使われる | The source table can be dropped altogether without affecting the clone. |
| enable rapid and efficient ~ because ~ | SVOパターン | 「〜のため、迅速で効率的な〜を可能にする」。`enable + 形容詞 + 名詞` + `because節` で機能の仕組みを説明する。能力（enable）+ 特性（rapid, efficient）+ 理由（because）の3要素構成 | Micro-partitions enable rapid cloning because metadata references existing partitions. |
| , which doesn't affect ~ | 非制限関係詞節 | 「それは〜に影響しない」。先行詞が前文全体または節全体で、「その結果/それは〜に影響しない」という補足説明。影響の独立性を示すSnowflakeクローン・共有の説明で頻出 | The source table can be dropped altogether, which doesn't affect the cloned table. |
| It is crucial to ~ | 形式主語構文 | 「〜することが極めて重要である」。`It is + 形容詞 + to不定詞` の形式主語構文。`crucial`（= extremely important）は `important` の強調形でより緊急性・重要性を示す | It is crucial to choose a column with appropriate cardinality. |
| high enough ~ to do | 形容詞+enough+to不定詞 | 「〜するのに十分に高い〜」。`enough` が形容詞の後に置かれる語順（`high enough` ≠ `enough high`）に注意。`~ enough to do`（〜するのに十分）の構文 | Choose a column with a high enough cardinality to allow partition pruning. |
| while having ~ | while + 動名詞 | 「〜を持ちながら同時に」。前節と対比・並行する条件を示す分詞構文。同時に満たすべき2条件を提示するときに使われる | High cardinality to allow pruning while having low enough cardinality to group efficiently. |
| On the other hand | 接続表現 | 「一方で」。前段で述べた問題とは逆の問題を対比提示する。`In contrast` / `Conversely` と同義。2項対比の解説文で頻出 | Low cardinality causes minimal pruning. On the other hand, high cardinality causes overhead. |
| result in ~ | 句動詞 | 「〜という結果をもたらす・〜に終わる」。原因→結果の関係を示す。`lead to ~` と同義。パフォーマンス問題の帰結を説明するときに頻出 | Too many distinct values will result in too much overhead. |
| otherwise, ~ will be reduced | 否定帰結の構文 | 「さもなければ〜が低下する」。`otherwise`（そうしないと）が命令や推奨に従わなかった場合の悪影響を示す接続副詞。`; otherwise,`（セミコロン後）の形で技術文書に頻出 | Order from low to high cardinality; otherwise, the effectiveness will be reduced. |
| consider + 動名詞（推奨事項） | 動詞+動名詞 | 「〜することを検討する・考慮する」。`consider` の目的語は必ず動名詞（`consider using`）。`consider to do` は誤り。命令形 `consider using ~` で「〜を使うことを推奨する」のニュアンスを出す | When defining a clustering key, consider using columns frequently used in WHERE clauses. |
| like in ~（比喩・類似） | 前置詞句 | 「〜の場合のように・〜におけるように」。`like + 前置詞句` の形で比喩・類似を示す。`as in ~` と同義だが口語的でフォーマルな技術文書でも使われる。`like` の後に名詞が来る場合（`like shared-disk`）とは異なる | Snowflake stores data in a shared manner, like in shared-disk architecture. |
| independent of each other | 形容詞句 | 「互いに独立している」。`independent of ~`（〜から独立している）+ `each other`（互いに）で相互の完全な独立を強調。`independent` は後置前置詞 `of` をとる点に注意（`independent from ~` と混同しないこと） | The virtual warehouses are independent of each other. |
| primarily composed of ~ | 形容詞句 | 「主に〜で構成された」。`primarily`（主として）+ `composed of ~`（〜で構成された）。構成要素の主要部分を示す。`primarily` が「全部ではないが大半は」のニュアンスを加える | Query Processing is primarily composed of virtual warehouses. |
| the brain of ~ | 名詞句（比喩） | 「〜の頭脳・制御中枢」。比喩的表現で「意思決定・管理・制御を担う最も重要な部分」を示す。技術文書でシステムの制御層を指すときの定番フレーズ | Cloud Services is the brain of the whole operation. |
| three distinct layers | 名詞句 | 「3つの独立した層」。`distinct`（明確に区別された・独立した）で各層が完全に分離していることを強調。`separate layers` より境界の明確さを示す | Snowflake architecture has three distinct layers. |
| may be applied to do | 受動態熟語 | 「〜するために適用されうる」。`may be applied`（適用されうる）で「すべて必須ではなく状況に応じて選択する」という柔軟な推奨を示す。`should be used`（使うべき）より穏やかなトーン。パフォーマンス最適化戦略・ベストプラクティスの列挙に頻出 | These strategies may be applied to improve the performance of a virtual warehouse. |
| against a defined ~ | 前置詞句 | 「定義された〜に対して・〜と照らし合わせて」。`against ~`（〜に対して）が「基準・上限との比較・測定」を示す。`track ~ against a quota`（クォータに照らして追跡する）の形でリソース管理の文脈で頻出 | Resource monitors track credit usage against a defined quota. |
| Consider the following ~ | 命令文 | 「次の〜を考慮せよ・参照せよ」。図表・設定・シナリオを提示する試験問題の定番導入表現。`Look at the following ~` と同義 | Consider the following resource monitor configuration. |
| Although ~, ... | 譲歩接続詞 | 「〜にもかかわらず・〜であるが」。前節に事実を述べ、後節にそれと矛盾・対比する別の事実を提示する。`even though ~` とほぼ同義だが書き言葉的。「一般則→例外」の構造を示すときに技術文書で頻出 | Although MFA is enabled for all users, new users are not automatically enrolled. |
| ~ themselves（再帰代名詞の強調） | 強調用法 | 「他人でなく自分自身で」。主語と同じ人物を再帰代名詞で受けて「本人が行う・本人にしかできない」を強調する。`by themselves`（独力で）とは異なり、動詞の直後または文末に置く。管理者委任ではなくユーザー自身の操作を区別するときに頻出 | A user must initiate and complete the MFA enrolment process themselves. |
| a variety of ~ | 名詞句 | 「様々な〜・多様な〜」。`various` より文語的・フォーマル。列挙の前置きとして使われ、後続のリストが網羅的でないことを示す。`including` で具体例を続けることが多い | The cloud services layer manages a variety of metadata. |
| and so forth | 結び表現 | 「〜など・等々」。`etc.`（et cetera）の書き言葉的表現。列挙の最後に置いて「この他にも同様のものがある」を示す。試験の解説文でメタデータ・機能の列挙に頻出 | Users, roles, security, and so forth are managed by cloud services. |
| is appropriate for ~ | 形容詞句 | 「〜に適した・〜に向いている」。`appropriate for ~`（〜に適切な）は `suitable for ~` と同義だがより書き言葉的。機能・ツールの用途適性を述べる技術文書で頻出。`input and querying`（入力とクエリ）のように用途を複数並列することが多い | VARIANT is appropriate for semi-structured data input and querying. |
| once it has been + 過去分詞 | 時間節 | 「一度〜されると・〜が完了すると」。`Once + 現在完了受動態`（`once it has been pp`）で「ロード・作成等の完了後」を起点とした条件を示す。`Once created`（省略形）の展開形。以降の操作が可能になる条件を示す | SQL may be used to navigate JSON data once it has been loaded into a VARIANT column. |
| be compliant with ~ | 形容詞句 | 「〜に準拠している・〜に適合している」。`compliant`（準拠している）は形容詞で `be compliant with ~` の形。動詞形 `comply with ~`（〜に準拠する）と区別する。セキュリティ・規制準拠の文脈で頻出 | Snowflake is compliant with HIPAA, FedRAMP, and PCI-DSS. |
| Unlike ~ in many other databases | 対比の前置詞句 | 「他の多くのDBの〜とは異なり」。`unlike`（〜とは異なり）で先行技術・他システムとの対比を示す前置詞。Snowflakeの独自特性を強調するときの定番パターン | Unlike partitioning in many other databases, in Snowflake, values can overlap. |
| another ~ or possibly many ~ | 数量表現 | 「1つ、またはおそらく多数の〜」。`another`（もう1つ）+ `or possibly many`（またはおそらく多数）で「状況に応じて柔軟に拡張される」ことを示す。`possibly`（おそらく・場合によっては）が不確実性を示す | Another micro-partition or possibly many micro-partitions are created. |
| as per ~ requirement | 前置詞句 | 「〜要件に従って・〜に応じて」。`as per ~`（〜に従って）はフォーマルなビジネス英語。`according to ~` と同義。データロード要件・ビジネス要件に合わせてシステムが動作することを示す | Snowflake scales Snowpipe as per the data load requirement. |
| charged separately from ~ | 受動態+副詞 | 「〜とは別途請求される」。`charge`（課金する）の受動態 + `separately from ~`（〜とは分離して）でコストの独立性を示す。Snowpipeの料金体系でウェアハウスとの分離を説明する定番表現 | Snowpipe costs are charged separately from virtual warehousing fees. |
| does not rely on ~ for doing | 否定句動詞 | 「〜するために〜に依存しない」。`rely on ~`（〜に依存する）の否定 + `for + 動名詞`（〜するために）。サーバーレスサービスがウェアハウスに依存しないことを示す文脈で頻出 | Snowpipe does not rely on virtual warehouses for processing. |
| there is no way to do | there is 構文 | 「〜する方法がない・どうやっても〜できない」。`there is no way to + 動詞原形` で「手段そのものが存在しない」完全不可能を示す。`cannot be done` より「方法・手段がゼロ」のニュアンスが強い。データ復元不可・回避不可能の文脈で頻出 | There is no way to recover historical data once the Time Travel period ends. |
| goes through N days of ~ | 句動詞 | 「〜のN日間を経る」。`go through`（経験する・通過する）+ 期間で「一定期間の保持フェーズを経る」ことを示す。`zero days`（ゼロ日）と組み合わせると「実質的にフェーズが存在しない」を意味する | Data in transient tables goes through zero days of fail-safe storage. |
| once ~ is complete | 時間節 | 「〜が完了すると」。`complete`（完了した）を形容詞述語として使う。`once ~ has ended` / `once ~ is finished` と同義。期間・プロセスの終了を起点とした恒久的な状態変化を示す | Once the Time Travel period is complete, there is no way to recover data. |
| is suitable for + 動名詞 | 形容詞句 | 「〜するのに適している」。`suitable for`（〜に適した）+ 動名詞で用途・適用場面を示す。`good for` の書き言葉形。試験で「どのシナリオに適するか」を問う問題で頻出 | Scaling up is suitable for improving performance of complex queries. |
| is ineffective when dealing with ~ | 形容詞句+時間節 | 「〜を扱うときは効果がない・無効」。`ineffective`（= `not effective`）で有効でないことを明示。`when + 動名詞`（〜するとき）で無効条件を追加する。スケールアップ/スケールアウトの使い分けで頻出 | Scaling up is ineffective when dealing with a high number of concurrent users. |
| is utilized to accommodate ~ | 受動態熟語 | 「〜を収容・対応するために利用される」。`utilize`（活用する）の受動態 + `to accommodate`（〜を収容/対応する）で目的を示す。`accommodate`は「要求・増加に対応する」文脈で頻出 | A multi-cluster warehouse is utilized to accommodate an increased number of users. |
| could be used as ~（潜在的用途） | 受動態+as | 「〜として使われ得る・〜として使うことができる」。`could`（過去形のcan）が「確定的な can より穏やかな可能性」を示す。`as ~` が役割・機能を明示。試験で「どれが〜として使えるか」を問う選択問題で頻出 | AWS Lambda could be used as a remote service for an external function. |
| examples of how ~ could be implemented | 名詞句 | 「〜がどのように実装されうるかの例」。`how + S + could be + 過去分詞` で実装の多様性・可能性を示す間接疑問の受動態構文 | All of these are valid examples of how an external function could be implemented. |
| Once + 過去分詞, S + V（分詞構文） | 分詞構文（時間・条件） | 「〜されたとたんに・一度〜されると」。`Once they are created` の省略形。時間的起点と恒久性を同時に示す。技術文書でオブジェクトの状態変化後の恒久的特性を述べるときに使われる | Once created, micro-partitions are immutable and cannot be modified. |
| immutable（イミュータブル） | 形容詞 | 「変更不可能な・不変の」。`im-`（否定接頭辞）+ `mutable`（変更可能な）。データ管理・プログラミングで「作成後に変更できない」オブジェクトを指す技術用語。`cannot be changed/modified` と同義 | Snowflake partitions are immutable, which means they cannot be changed once created. |
| be fulfilled directly from ~ | 受動態熟語 | 「〜から直接充足される・〜だけで処理できる」。`fulfill`（要求を満たす・実行する）の受動態。`directly from metadata`（メタデータから直接）で、データスキャンなしにクエリが完結することを示す。Metadata Cacheの説明で頻出 | Queries fulfilled directly from metadata don't require a warehouse. |
| have been executed already | 現在完了受動態 | 「すでに実行された」。`have been + 過去分詞`（現在完了受動態）+ `already`（すでに）。Query Result Cacheの利用条件（「過去の実行」）を示す定型表現。`have already been pp` の語順とどちらも可 | Query Result Caching is for queries that have been executed already. |
| How frequently does ~ ? | 頻度の疑問文 | 「どのくらいの頻度で〜するか」。`How often` と同義だが `How frequently` はよりフォーマル。頻度を問う疑問副詞句で試験の選択肢に頻度副詞（daily / weekly / monthly）が並ぶ問題で頻出 | How frequently does Snowflake release new software? |
| Fortnightly（隔週） | 副詞/形容詞 | 「2週に1回・隔週」。`fortnight`（2週間 = 14 nights）+ `-ly`。イギリス英語で一般的。アメリカ英語では `biweekly`（ただし「週2回」とも解釈されるため曖昧）。Weeklyと混同しないこと | Fortnightly means once every two weeks, not once a week. |
| ~ is possible by + 動名詞 | 動名詞主語+SVC構文 | 「〜することによって可能になる」。動名詞句が主語に立ち `is possible` が補語。`by + 動名詞` が実現手段を示す。`It is possible to ~ by doing` の変形でより書き言葉的・強調的 | Sharing data with a non-Snowflake user is possible by creating a reader account. |
| solely for ~ purposes | 副詞句 | 「〜目的のみのために・専ら〜のために」。`solely`（専ら・のみ）で単一目的を強調し、他の目的がないことを示す。`for ~ purposes`（〜の目的で）のフォーマルな強調形 | The reader account is created solely for sharing purposes. |
| not A but B（対比の定義構文） | 相関接続詞 | 「AではなくBである」。`not ~ but ~` で誤解を訂正し正しい定義を示す。技術文書で「〜ではなく〜だ」と概念を明確化するときの定番構造 | A directory table is not a separate object but is an implicit object. |
| available with ~（付随して利用可能） | 形容詞句 | 「〜とともに利用可能・〜に付随して使える」。`available for ~`（〜のために利用可能）と異なり「付随・セット」のニュアンス。オプション機能・暗黙オブジェクトが別のオブジェクトとセットで存在することを示す | A directory table is an implicit object available with a stage. |
| Since ~, you cannot ~ | 理由節+否定 | 「〜なので〜できない」。`Since`（〜なので）は `because` より書き言葉的でフォーマルな理由接続詞。文頭に置いて理由→帰結の順で述べる | Since directory tables are not separate objects, you cannot provide privileges to them. |
| A first, followed by B | 順序の副詞句 | 「まずAを、次いでBが続く」。`first`（最初に）で処理順序を示し、`, followed by ~`（過去分詞の付帯状況）で「〜が後に続く」を追加する。2ステップの処理順序を簡潔に示す定型表現。セキュリティ・処理フローの説明で頻出 | Snowflake applies the block list first, followed by the allowed list. |
| If both A and B are populated | 条件節 | 「AとBの両方にデータが設定されている場合」。`both A and B`（両方）で2条件の共存を示す。`populated`（値が設定された・データが存在する）はリスト・テーブルにエントリがあることを示す技術文書の定番語。本来は「人口が多い」の意味 | If both the allowed and blocked lists are populated, apply the block list first. |
| Additionally, ~ can also be considered | 接続副詞+受動態 | 「さらに・加えて、〜も候補として考えることができる」。`Additionally`（追加情報を導く接続副詞）+ `can also be considered`（受動態で「候補になり得る」）。`Furthermore` と同義だが、追加候補の提示に特化した組み合わせ | Additionally, columns used for joining can also be considered. |
| the best way for ~ to do | 名詞句（関係詞+不定詞） | 「〜が〜するための最善の方法」。`the best way`（最善の方法）+ `for A to do`（AがするためのBest way）。`for + 名詞 + to不定詞` が `way` の内容を意味論的に限定する。試験問題では「最善のアプローチは何か」と問う際の定番構文 | What is the best way for a system administrator to determine the initial size? |
| Experiment with ~ against ~ | 動詞句（句動詞+前置詞句） | 「〜を〜に対して実験する・試す」。`experiment with ~`（〜で実験する）は計画的・科学的な試行錯誤を示す。`Try ~` より系統的なニュアンス。`against ~`（〜と照らし合わせて・〜に対して）で比較基準を示す | Experiment with a defined set of queries against various warehouse sizes. |
| a defined set of ~ | 名詞句 | 「定義された一群の〜」。`a defined set of`（定義された一群の）は「ランダムではなく計画的に選んだ代表的なサンプル群」を示す。システム管理・テスト計画の文脈で、恣意的でない標準的なサンプルを指す | Use a defined set of queries to test warehouse performance. |
| ranging from ~ to ~ | 分詞句（後置修飾） | 「〜から〜の範囲にわたる」。`range from A to B`（AからBの範囲）の現在分詞形で名詞を後置修飾する。数値・期間・機能の幅を示す際の定番表現。`from`（最小値）と `to`（最大値）で範囲の両端を明示する | These views have retention ranging from 7 days to a maximum of 6 months. |
| If + 比較級, ... 比較級（比較級条件文） | 条件節+比較級 | 「もし〜がより小さければ、〜はより良い」。条件節と主節の両方に比較級を用いて、一方の変化が他方に影響する因果関係を示す。`the + 比較級, the + 比較級`（〜すればするほど〜）の変形。技術文書でメトリクスの解釈説明に頻出 | If the average depth is smaller, the data is better clustered. |
| Due to ~（理由の前置詞句） | 前置詞句 | 「〜のために・〜が原因で」。`because of ~` と同義だがよりフォーマル。文頭に置いて理由→帰結の順で述べる。`Due to` の後には名詞句が来る（節は不可。節なら `because` を使う） | Due to the role hierarchy, ACCOUNTADMIN inherits all privileges. |
| sit at the top of ~（階層の最上位） | 動詞句 | 「〜の最上位に位置する」。組織・ロール・ツリー構造の頂点を示す定型表現。`sits at the top of the hierarchy`（階層のトップにいる）が典型 | ACCOUNTADMIN sits at the top of the role hierarchy. |
| Whether or not ~ doesn't matter（無関係表現） | 接続詞+動詞句 | 「〜かどうかは関係ない」。ある条件が結果に影響しないことを明示する定型表現。ひっかけ選択肢を排除する根拠として解説に頻出 | Whether or not a warehouse is running a query doesn't matter. |
| a minimum of ~（最低値の指定） | 名詞句 | 「最低〜・少なくとも〜」。下限値を明示する表現。`at least ~` と同義。`a minimum of 60 seconds` = 「最低60秒」。課金・要件の説明で頻出 | A minimum of 60 seconds of billing applies. |
| ~ per second / per hour（単位あたり） | 前置詞句 | 「〜あたり・〜単位で」。`per` + 時間/単位で課金・処理の単位を示す。`billed per second`（秒単位課金）が典型 | Credits are billed per second with a 60-second minimum. |
| Doing so will ~（前述行為の帰結） | 動名詞句+未来形 | 「そうすると〜になる」。直前の行為を `Doing so` で受けて帰結を述べる定型表現。エラーメッセージの説明で頻出 | Doing so will typically show the following error. |
| ~ instead（代替案の提示） | 副詞 | 「代わりに〜する」。文末に置いて代替行動を示す。エラーメッセージ内で「〜してください」の代替案提示に使われる | Clone to a transient table instead. |
| No matter ~（譲歩・無条件） | 接続詞句 | 「〜に関係なく」。`Regardless of ~` と同義。条件に関わらず同じ結果になることを示す。`No matter your Edition`（エディションに関係なく）のように名詞句を直接続けることも可能 | No matter your Snowflake Edition, the extension applies. |
| prevent ~ from becoming（防止構文） | 動詞+前置詞 | 「〜が〜になることを防ぐ」。`prevent O from doing` で望ましくない状態への遷移を阻止する定型構文。`stop ~ from`・`keep ~ from` と同義 | This parameter prevents the stream from becoming stale. |
| granted as default（デフォルト付与） | 過去分詞句 | 「デフォルトとして付与された」。`as default` が「デフォルトとして」の資格・性質を示す。`privileges granted as default`（デフォルト付与された権限）の形で、取り消し可否の議論に頻出 | The privileges granted as default to the built-in roles cannot be revoked. |
| What is the minimum ~ that ~?（最小要件を問う疑問文） | 疑問文 | 「～を満たす最小の～は何か？」。エディション・バージョン・条件の最小要件を問う試験頻出パターン。`minimum` は `the` を伴い、`that` 関係詞節で条件を限定する | What is the minimum Snowflake edition that supports multi-cluster warehouses? |
| What is meant by ~?（定義を問う受動態疑問文） | 受動態疑問文 | 「～とはどういう意味か？」。`mean` の受動態で概念・用語の定義を問う定番パターン。`by` の後に動名詞句が来ることが多い | What is meant by scaling down a virtual warehouse? |
| These include ~（列挙導入） | SVO | 「それらには～が含まれる」。前文の総称的な内容を `These` で受けて具体項目を列挙する定型表現。解説文で頻出 | These include multi-cluster warehouses, materialized views, and search optimization. |
| in reaction to ~（対応・反応） | 前置詞句 | 「～への反応として・～に対応して」。`as a response to ~` と同義。行動の動機・理由を示す | Scaling down is done in reaction to reduced query complexity. |
| for up to a maximum of ~（上限値表現） | 前置詞句 | 「最大～まで」。`up to`（最大で）+ `a maximum of N`（Nの上限）を組み合わせた強調的な上限表現。期間・数値の制限を示す技術文書の定番 | The extension can continue for up to a maximum of 31 days. |
| ~ is purged altogether（完全削除） | 受動態+副詞 | 「～は完全にパージされる」。`altogether`（完全に・全面的に）が受動態を強調し、例外なしの削除を示す | After 31 days, the cache is purged altogether. |
| can not be disabled or configured（無効化・設定不可） | 受動態+並列否定 | 「無効化も設定変更もできない」。`or` で2つの否定動作を並列。Fail-SafeやSystem-defined Roleなど変更不可の仕様を述べるパターン | This fail-safe can not be disabled or configured. |
| allow O to eliminate ~（O が～を除外することを可能にする） | SVOC構文 | `allow + O + to不定詞` で「Oが～することを可能にする」。`enable O to do` と同義。機能・仕組みが何を実現するかを述べる技術文書の定番 | Metadata allows the query engine to eliminate partitions. |
| partitions NOT containing ~（否定分詞の後置修飾） | 分詞否定+後置修飾 | 「～を含まないパーティション」。`NOT + 現在分詞` が名詞を後置修飾する構造。否定が分詞に直接かかる。プルーニング動作の説明で頻出 | Partitions NOT containing the matching value will NOT be scanned. |
| it is only after ~ that ~（強調構文 + only after） | 強調構文 | 「～した後に**初めて**～される」。`It is ... that ...` の強調構文に `only after` を組み込んだ形。遅延実行（lazy execution）の説明で核心となるパターン。`only after` が強調の焦点 | It is only after they perform an execute operation that the code is converted to SQL. |
| cannot ~ from any ~ other than ~（排他的制限） | 否定+any+other than | 「～以外のいかなる～からも～できない」。`any` が否定文中で「いかなる」を強調し、`other than` で唯一の例外を提示する。アクセス制限・権限制約の説明で頻出 | A reader account cannot consume data from any provider other than the creator. |
| the stored size is smaller as ~（理由のas節） | 比較級+理由節 | 「～なので保存サイズはより小さい」。`as` が「～なので」の理由を示す接続詞。前文の数値とのギャップを説明するパターン | The stored size is smaller as data is always stored with compression. |
| directly proportional to ~（正比例関係） | 形容詞句 | 「～に正比例する」。数学的・定量的な関係を述べる定番表現。コスト・パフォーマンスの説明で頻出 | The cost incurred is directly proportional to the size of the warehouse. |
| according to the need, up to ~（需要に応じて最大～まで） | 副詞句+上限 | 「需要に応じて、最大～まで」。`according to ~`（～に応じて）と `up to ~`（最大～まで）の組み合わせ。Auto-Scale動作の説明で定番 | Snowflake spins up warehouses according to the need, up to the maximum count. |
| as ~ lowers until ~（推移+終了条件） | 接続詞+接続詞 | 「～が下がるにつれて、～になるまで」。`as`（推移）と `until`（終了条件）の二重条件構造。段階的な変化の説明に使用 | Shuts down warehouses as demand lowers until the number equals the minimum. |
| Unless ~, S will not provide any ~（例外条件+否定） | 条件節+否定文 | 「～でない限り、いかなる～も提供しない」。`Unless`（～でない限り）で唯一の例外条件を提示し、主節で否定する。`any` が「いかなる」を強調 | Unless loading many files in parallel, a larger size will not provide any benefits. |
| should suffice for ~（十分性の表現） | 助動詞+動詞 | 「～には十分であるはず」。`suffice`（足りる・十分である）はフォーマルな表現。推奨サイズ・スペックの説明で使われる | A Small warehouse should suffice for small files. |
| much smaller than ~（大幅な差の比較級） | 比較級+強調 | 「～よりはるかに小さい」。`much` が比較級を強調し大幅な差を示す。Partition Pruningの効果判定で「Scanned << Total」を表現する定番 | Partitions scanned is much smaller than Partitions total. |
| This applies to all ~, including ~（全適用+具体例列挙） | SVO+including | 「これはすべての～に適用される、～を含めて」。`applies to all` で対象範囲を全体に広げ、`including` で具体例を補足列挙する。仕様の適用範囲を明示するパターン | This applies to all connections, including JDBC, ODBC, and the Python connector. |
| features that SQL does not typically provide（SQL非標準機能） | 関係詞節+否定 | 「SQLが通常は提供しない機能」。ストアドプロシージャの存在意義を説明する定番表現。`typically` で「通常は」と例外の余地を残す | If-else logic and looping are features that SQL does not typically provide. |
| ~ are an exception because ~（例外理由の提示） | SVC+because | 「～は例外である、なぜなら～」。一般原則に対する例外とその理由を1文で述べる。VPSの共有制約など、試験で重要な例外事項の説明に使われる | VPS accounts are an exception because they have isolated metadata. |
| Note that ~ are case sensitive（大文字小文字区別の注意喚起） | 注意喚起構文 | 「～は大文字小文字を区別することに注意」。`Note that` で重要な注意事項を導入。JSON要素名のcase sensitivityの説明で頻出 | Note that element names are case sensitive. |
| prioritize A over B（優先順位の明示） | 動詞+前置詞 | 「BよりAを優先する」。`over` が比較対象を示し優先順位を明確にする。Standard(パフォーマンス over コスト) vs Economy(コスト over パフォーマンス)の対比で使われる | Standard prioritizes performance over cost. |
| has gotten worse over time（時間経過による悪化） | 現在完了+比較級 | 「時間とともに悪化してきた」。`has gotten worse`（現在完了 + 比較級）で継続的な劣化を示す。`over time`（時間とともに）がクラスタリング不良の兆候を示す定番表現 | Query performance has gotten worse over time. |
| unlike ~, S does not ~; instead, S ~（対比+代替動作） | 対比構文 | 「～とは異なり、Sは～しない。代わりに～する」。`unlike`（対比）+ 否定文 + `; instead,`（代替）の3段構成で既存概念との違いを明確にする。External Functionの説明で使われる定番パターン | Unlike other UDFs, it does not include code; instead, it invokes external code. |
| the only thing that is kept inside ~ is ~（唯一保持される情報） | 限定+SVC | 「～の中に保持される唯一のものは～である」。`the only thing that ~` で排他的に限定し、内部に保持される情報が最小限であることを強調する | The only thing kept inside Snowflake is invocation information. |
| ensures that it will not reprocess ~（再処理防止の保証） | SVO+that節 | 「～を再処理しないことを保証する」。`ensures that ~` で仕組みによる保証を述べる。Snowpipeの重複ロード防止やFail-Safeのデータ保護説明で使われる | Snowflake ensures that it will not reprocess a file already loaded. |
| does not ~ until ...（完了待ちの否定） | 否定+until | 「...するまで～しない」=「...してはじめて～する」。時間的な限度・条件を示す。ウェアハウスサスペンドやクローンストレージの発生条件など、動作の前提条件を述べるのに頻出 | It does not enter a suspended state until all active queries have been completed. |
| is in charge of + 動名詞（責任の所在） | SVC+前置詞 | 「～する責任がある・担当している」。ロール・オーナーの権限範囲を説明する表現。Data Exchangeのオーナー権限やロールの責務説明で使われる | The owner is in charge of inviting members and specifying permissions. |
| is requested to be + 過去分詞（要求の受動態） | 二重受動態 | 「～するよう要求される」。`request` の受動態 + to不定詞の受動態が組み合わさった構文。サスペンド要求など、外部からの指示による動作を説明する | When a warehouse is requested to be suspended, it waits for queries to complete. |
| can only ~ but cannot ~（許可と禁止の対比） | 対比構文 | 「～のみできるが～はできない」。共有データベースのコンシューマー制限など、許可と禁止を1文で対比する。`only` が許可範囲を限定し `but cannot` で禁止事項を列挙する | Consumer accounts can only access and query data but cannot add, modify, or create objects. |
| is meant for + 動名詞（設計目的の提示） | 受動態+目的 | 「～するために設計されている」。ロールやツールの本来の目的を説明するパターン。`meant for` は `designed for` の同義。`typically` と組み合わせて標準的な用途を示す | The USERADMIN role is typically meant for creating and managing users. |
| effectively hides ~（事実上の隠蔽） | SVO+副詞 | 「事実上～を隠す」。`effectively` で物理的な削除ではなく論理的な隠蔽を示す。一時テーブルの名前競合の説明で使われる。実質的な影響があることを強調する | The temporary table effectively hides the permanent table in that session. |
| doubles for each increase in ~（段階的2倍増） | SV+前置詞句 | 「～が1段階上がるごとに2倍になる」。WHサイズとクレジット消費の関係を説明する核心パターン。`for each` で各段階ごとを示す | Credit usage per hour doubles for each increase in size. |
| for ~ to be used（目的条件の提示） | for+不定詞 | 「～が使われるためには」。条件や要件を述べるfor + to不定詞の構文。キャッシュの利用条件やクローン権限の条件説明で使われる | The data must not change for the query result cache to be used. |
| does not inherit ~ ; however, ~（原則+例外の対比） | 否定+however | 「～を継承しない。しかし～」。セミコロン + `However` で原則と例外を対比。クローンの権限継承ルール（本体は非継承だが子オブジェクトは継承）など重要な例外事項で頻出 | A cloned object does not inherit privileges; however, child objects do inherit. |
| any ~ except ...（除外リストの提示） | 限定+除外 | 「...を除くすべての～」。`any` で全範囲を示し `except` で除外項目を列挙する。データ型制限や機能制限の説明で使われる。除外リストの暗記を求める試験問題の定番表現 | Clustering keys can be of any data type except GEOGRAPHY, VARIANT, OBJECT, or ARRAY. |
| can only be granted to ~（付与対象の限定） | 受動態+only | 「～にのみ付与可能」。`only` で付与先を限定する。Snowflakeのアクセス制御の原則（権限はロールにのみ付与、ユーザーには直接不可）を説明するパターン | Privileges can only be granted to roles; they cannot be granted directly to individual users. |
| nor + 倒置（二重否定の等位接続） | 等位接続詞+倒置 | 「〜もまたない」。否定文を受けて `nor` で追加の否定を加える。`nor` の後は `助動詞 + 主語 + 動詞` の倒置語順。`Data is not copied, nor are new partitions created.` のように「Aもなく、Bもない」と連続して否定する。技術文書でZero-Copy Cloningの説明でよく使われる | Data is not physically copied, nor are new micro-partitions created. |
| out of the box（成句） | 慣用表現 | 「すぐに使える・箱から出してすぐ使える・デフォルトで」。`available out of the box`（デフォルトで利用可能）の形で、追加設定・インストール不要ですぐ使えることを示す。`by default` より「メーカー標準」のニュアンスが強い | These roles are available out of the box in Snowflake. |
| thus + 現在分詞（結果の分詞構文） | 分詞構文+接続副詞 | 「その結果〜することになる」。`thus`（したがって）+ 現在分詞で前節の行為の論理的帰結を述べる。`thereby + 動名詞` と同義。単なる付帯状況ではなく「因果的な結果」を示す。クラスタリングやスピル対策の説明で頻出 | Clustering allows Snowflake to read only the necessary subset of the data, thus reducing the memory requirement. |
| treating A as B（分詞構文+様態） | 分詞構文 | 「AをBとして扱いながら・AをBと見なして」。`treat A as B`（AをBとして扱う）の現在分詞形が文末に置かれ、付帯状況・同時進行を示す。Insert-only StreamでUpdateを「新規Insert」として扱うことを説明するパターン | Insert-only streams capture inserts and updates as new rows, treating updates as new inserts. |
| have been configured to do（現在完了受動態+不定詞） | 現在完了受動態+不定詞 | 「〜するように設定されている」。`have been configured`（現在完了受動態）で「現時点の設定状態」を示し、`to do`（不定詞）で設定内容を述べる。ストアドプロシージャのOwner's/Caller's Rightsなど、明示的に構成された設定の説明で頻出 | A stored procedure has been configured to run under the owner's rights. |
| beyond the allowed ~（許容範囲外） | 前置詞句 | 「許容される〜の外側に・〜の範囲を超えて」。`beyond`（〜を超えて）+ `the allowed ~`（許容された〜）で「設定された上限・範囲を超えた状態」を示す。Time Travelの保持期間外・ネットワークポリシーの制限範囲外を説明する際に頻出 | The requested time is beyond the allowed time travel period. |
| Neither A nor B（相関否定接続詞） | 相関接続詞 | 「AもBも〜でない」。2つの対象を同時に否定する相関接続詞。`not A and not B` の簡潔な書き言葉形。選択肢で「両方とも該当しない」を示すときに頻出。動詞はBに一致させる（`Neither the provider nor the consumer owns ~`） | The reader account belongs to neither the data provider nor the data consumer. |
| may be interchangeably used to refer to ~（互換的な言い換え） | 受動態+副詞+不定詞 | 「〜を指す用語として互換的に使用されることがある」。`may`（可能性）+ `be interchangeably used`（互換的に使われる受動態）+ `to refer to`（〜を指すために）。異なる名称が同一の概念・層を指すことを説明するSnowflakeアーキテクチャの解説で頻出 | These terms may be interchangeably used to refer to the query processing layer. |
| are to be + 過去分詞（be to構文の受動態） | be to 構文 | 「〜される予定・計画・必要がある」。`be to + 動詞原形` の計画・予定・義務を示す`be to構文`に受動態が組み合わさった形。`for which the features are to be configured`（機能が設定される対象のアカウントに対して）のように関係詞節内で使われる。フォーマルで計画的な文脈に頻出 | Call this function once for each account for which the features are to be configured. |
| allowing for ~（結果・実現の分詞構文） | 現在分詞（結果） | 「〜を可能にする」。`allow for ~`（〜を許容する・可能にする）の現在分詞形が文末に置かれ、前節の論理的な結果・効果を示す。`enabling ~` / `thus enabling ~` と同義。機能の効果を説明する解説文で頻出 | Snowflake supports federated authentication, allowing for single sign-on. |
| Once + 過去分詞（完了を起点とした条件分詞構文） | 分詞構文（時間・条件） | 「一度〜されると（その後ずっと）」。`Once + 主語 + be + pp` の省略形。完了した状態を起点として「以降ずっと」を示す。`Once authenticated`（一度認証されると）のように認証・ロード・作成などの完了後の継続的な状態を示す技術文書の定番 | Once authenticated with an IdP, a user is not required to log in to Snowflake. |
| require the creation of ~（名詞化で表す必要性） | SVO構文 | 「〜の作成を必要とする」。`require ~` の目的語に動名詞（`creating`）ではなく名詞句（`the creation of`）を置くフォーマルな表現。`requires creating ~` より書き言葉的・格調ある技術文書に頻出 | Sharing with a non-Snowflake user requires the creation of a reader account. |
| provide O1 with O2（二重目的語のprovide） | SVOO構文 | 「O1にO2を提供する」。`provide + 人 + with + 物` の語順。`give O1 O2` と異なり前置詞 `with` を使う。`provide A with B`（AにBを提供する）は技術文書でユーザーへの機能提供・アクセス付与の説明に頻出 | The reader account provides the user with a Snowflake account. |
| can't be used again until ~（再利用不可の時間的制限） | 否定+時間節 | 「〜まで再び使用できない」。`can't be used again`（再使用不可の受動態）+ `until`（〜まで）で、特定条件が満たされるまで機能が利用できないことを示す。リソースモニターのサスペンドや保留状態の説明で頻出 | Warehouses can't be used again until the next interval starts. |
| free of charge（無料で） | 副詞句 | 「無料で・料金なしで」。`charge`（料金）+ `free of`（〜がない）の組み合わせ。True/False問題で「有料か無料か」を問う文脈で頻出。`at no cost` / `at no charge` と同義 | Time Travel storage is NOT stored free of charge. |
| keep + 動名詞（継続の動詞句） | 動詞+動名詞 | 「〜し続ける」。`keep` の後に動名詞（V-ing）を置き、動作の継続を示す。`keep getting used`（使われ続ける）のように `keep + getting + 過去分詞` の形で受け身的な継続も表現できる。`continue + 動名詞` と同義だがよりカジュアル | If the result cache keeps getting used, it will stay valid for up to 31 days. |
| be in a ~ state（状態にある） | SVC構文 | 「〜の状態にある」。`be in a state of ~` の短縮形。`running state`（実行状態）・`suspended state`（停止状態）など、ウェアハウスやサービスの現在状態を説明するのに頻出。`is running` より「状態」を明示的に強調する | A virtual warehouse is in a running state and is executing a complex query. |
