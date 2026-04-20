# Snowflake 用語集

問題を解くたびに蓄積される用語集。試験直前の総復習に活用する。

| 用語 | 説明 | 初出問題 |
|------|------|----------|
| SCIM (System for Cross-domain Identity Management) | 異なるシステム間でユーザーIDを自動プロビジョニングするためのオープン標準プロトコル（v2.0対応）。対応IdP: **Okta, Azure Active Directory**。機能: 自動ユーザープロビジョニング + グループ/ロール同期 | 001, Q2:003 |
| Availability Zone (AZ) | クラウドプロバイダーが提供する物理的に分離されたデータセンター群。Snowflakeは**Cloud Services Layer**と**Storage Layer**を少なくとも3つのAZにレプリケーションして高可用性を確保。Compute Layerはレプリケーションされない | Q2:032 |
| Identity Provider (IdP) | ユーザーの認証情報を一元管理するサービス（例: Okta, Azure AD）。SCIMと連携してSnowflakeのユーザー/ロールを自動管理できる | 001, Q2:003 |
| Auto-provisioning | IdPでのユーザー作成を検知して連携先に自動的にアカウントを作成する仕組み | 001, Q2:003 |
| Role Synchronization（ロール同期） | IdPで定義されたグループをSnowflakeのロールと同期させるSCIMの機能。グループのメンバーシップ変更が自動的にSnowflakeロールに反映される | Q2:003 |
| DAC (Discretionary Access Control) | オブジェクト所有者が任意にアクセス権を付与できるアクセス制御モデル | 001 |
| RBAC (Role-Based Access Control) | ロールに基づいてアクセス権を管理するモデル。Snowflakeの主要なアクセス制御方式 | 001 |
| ABAC (Attribute-Based Access Control) | ユーザー属性に基づくアクセス制御モデル。Snowflakeでは直接サポートされていない | 001 |
| Query Result Cache（クエリ結果キャッシュ） | Snowflakeがクエリ結果を保存しておく仕組み。同一クエリ・データ未変更の条件下で再利用される。24時間有効、最大31日延長可 | 002 |
| Metadata Cache（メタデータキャッシュ） | テーブル・マイクロパーティション・列ごとの統計情報をCloud Servicesレイヤーが保持するキャッシュ。`SELECT COUNT(*)` はメタデータから返せるため**ウェアハウス不要**。`USE`・`SHOW`・`DESCRIBE`も同様にWH不要。Query Result Cacheとは別物 | 002, Q2:020 |
| Cache Expiry（キャッシュ有効期限） | キャッシュが無効化されるタイミング。Query Result Cacheは24時間基本で再利用のたびに延長、31日経過後は無条件削除 | 002 |
| SYSADMIN | Snowflakeの事前定義済みシステムロール。DB・WH・テーブル・ビュー等**ほとんどのデータオブジェクトを作成・管理できる**。ただし**ユーザー・ロールの作成は不可**（USERADMINの担当）。カスタムロール階層のトップに配置することがSnowflakeの推奨 | 003, 066, Q2:012 |
| ACCOUNTADMIN | Snowflakeで最も強力なシステムロール。ロール階層の最上位に位置し、SYSADMIN・SECURITYADMINの全権限を継承。アカウント全体の管理・請求情報へのアクセスが可能。日常的な操作への使用は非推奨 | 003, Q2:012 |
| SECURITYADMIN | オブジェクトへのアクセス権（GRANT/REVOKE）を管理する事前定義済みシステムロール。**グラント管理の専門ロール**。USERADMINの権限も継承する | 003, Q2:012 |
| Privileges Inheritance（権限継承） | ロール階層において、下位ロールに付与された権限が上位ロールに自動的に引き継がれる仕組み。ACCOUNTADMINが最上位のため、全システム定義ロールの権限を持つ | Q2:012 |
| USERADMIN | ユーザーとロールの作成・管理に**特化**した事前定義済みシステムロール。`CREATE USER` と `CREATE ROLE` の権限を持つ。**グラントの管理は不可**（SECURITYADMINの担当） | 003, 071 |
| Built-in Role（ビルトインロール） | Snowflakeがあらかじめ定義しているシステムロール。ACCOUNTADMIN・SYSADMIN・USERADMIN・SECURITYADMIN・PUBLIC・ORGADMIN の6種類。**削除不可・デフォルト権限の取り消し不可**（誰にもできない）。ユーザーが作成するCustom Roleとは区別される | 071, Q2:019 |
| Grant（グラント） | オブジェクトへのアクセス権限を付与すること。`GRANT privilege ON object TO role` の形式。グラントの管理はSECURITYADMINが担当。USERADMINは管理不可 | 071 |
| Custom Role（カスタムロール） | ユーザーが独自に作成したロール。SYSADMINの配下に置くことがSnowflakeの推奨 | 003 |
| Snowsight | SnowflakeのWebUIインターフェース。ブラウザからSnowflakeの操作・監視・クエリ実行が可能な現在の標準UI。**複数ワークシートを同時に開け、非アクティブなワークシートでもクエリはバックグラウンドで継続実行される**（同時複数クエリ実行が可能） | 004, 054 |
| Query History（クエリ履歴） | Snowflakeで実行されたクエリの記録。SnowsightのUIでは過去14日間、ACCOUNT_USAGE.QUERY_HISTORYビューでは365日間参照可能。ACCOUNTADMINは他ユーザーの履歴メタデータは見られるが、**実際のクエリ結果（データ）は見られない** | 004, 060 |
| ACCOUNT_USAGE.QUERY_HISTORY | クエリ履歴を最大365日間保持するSnowflakeのシステムビュー。SnowsightのUI（14日）とは保持期間が異なる | 004 |
| SnowSQL | SnowflakeのコマンドラインCLIツール。正式名称は「Command Line Client (CLI)」。ターミナルからSQL実行・データロード/アンロードが可能 | 005 |
| Snowpipe | Snowflakeのサーバーレスな継続的データロードサービス。ステージにデータが到着すると自動的に**マイクロバッチ**でロードを開始する。**仮想ウェアハウスに依存しない**（独自コンピュート）。コストはウェアハウス費用とは**別途請求**。CLIツールではない | 005, 109 |
| Micro-Batch Loading（マイクロバッチロード） | 少量のデータを頻繁・継続的にロードする方式。Snowpipeの動作方式。大量データの一括バッチ処理（COPY INTO）との対比で重要。トランザクション・イベントデータなど「流れ続けるデータ」に適している | 109 |
| UDF (User-Defined Function) | ユーザーが独自に定義した関数。SQL/JavaScript/Python等で記述しクエリ内で呼び出せる | 006 |
| Secure UDF（セキュアUDF） | ①SQL最適化を無効化してデータの間接アクセスを防ぐ、②UDF定義を所有者ロール以外から隠す、という2つの特性を持つUDF | 006 |
| AES-256 | Snowflakeが保存データの暗号化に使用する規格。256ビット鍵。AES-128ではないことに注意 | 007 |
| Key Rotation（キーローテーション） | 暗号化キーを定期的に新しいキーへ切り替えること。Snowflakeは30日ごとに自動実行 | 007 |
| Rekeying（再暗号化） | 既存の暗号化データを新しいキーで暗号化し直すこと。Snowflakeは1年ごとに自動実行。Key Rotationとは異なる | 007 |
| Data at Rest（保存データ） | ストレージに保存されている静止状態のデータ。転送中のデータ（Data in Transit）と対比。Snowflakeはデフォルトで暗号化 | 007 |
| Materialized View（マテリアライズドビュー） | SELECTクエリ結果を事前計算して物理保存するビュー。ベーステーブル更新時に自動リフレッシュ。特定クエリのパフォーマンス向上が目的。JOINは含められない。有益な条件: データ変更が少ない + クエリコストが高い | 008, Q2:001 |
| Scalar UDF | 入力行1行に対して1行（1値）を返すUDF。最も一般的なUDFの形式 | 009 |
| Table UDF / UDTF (User-Defined Table Function) | 入力行1行に対して0〜複数行（複数列）を返すUDF。UDTFはTable UDFの別名 | 009 |
| USE_CACHED_RESULT | Query Result Cacheの有効/無効を制御するパラメータ。Session・User・Accountの3レベルで設定可能。デフォルトTRUE | 010 |
| Warehouse Resize（ウェアハウスリサイズ） | クエリ実行中でもいつでも可能。スケールダウン時はノード削除がアクティブクエリ終了まで遅延される | 011 |
| Multi-Cluster Virtual Warehouse（マルチクラスターWH） | 同時接続ユーザー数や処理需要に応じてクラスター数を自動追加・削除できるウェアハウス。Enterprise以上のエディションで利用可能。スケールアウト（横方向拡張）でコンカレンシー問題を解消する。クエリキューを解消するための公式の解決策 | 057, 095 |
| Query Queuing（クエリキューイング） | ウェアハウスのリソースが不足した際に余分なクエリを待機行列に入れる動作。リソースが再び利用可能になるまで待機する。解決策はMulti-Cluster Virtual Warehouse | 095 |
| Scale-Out（スケールアウト） | クラスター数を増やして処理能力を横に拡張する方法。マルチクラスターWHで実現。コンカレンシー（同時実行数）の増加に対応する | 057 |
| Scale-Up（スケールアップ） | ウェアハウスサイズを大きくして処理能力を縦に拡張する方法。重いクエリの高速化に対応する。スケールアウトとは対照的 | 057 |
| Compute Cost（コンピュートコスト） | ウェアハウスの稼働（resumed）時間に対して発生する費用。クエリ実行中かどうかは無関係。suspended中は発生しない | 012 |
| Storage Cost（ストレージコスト） | 実際に使用したストレージ量に対する費用。テーブル・内部ステージ・Time Travel・Fail-safeが対象 | 012 |
| ACCOUNT_USAGE.COPY_HISTORY | COPY INTOおよびSnowpipeによるデータロード履歴を365日間保持するビュー | 013 |
| ACCOUNT_USAGE.PIPE_USAGE_HISTORY | Snowpipeのパイプ使用状況（クレジット消費・バイト数）の履歴を365日間保持するビュー | 013 |
| ACCOUNT_USAGE スキーマ | アカウント全体の使用状況・履歴を365日間保持するシステムスキーマ。最大45分の遅延あり。**削除済みオブジェクトの情報も含む**（DELETEDカラム・IDカラムあり）。INFORMATION_SCHEMAとの最大の差異 | 013, 085 |
| INFORMATION_SCHEMA | 各データベース内に自動的に存在するシステムスキーマ。保持期間: **7日（特定ビュー最短）〜14日（標準）〜6ヶ月（使用履歴ビュー最長）**。ほぼリアルタイム更新。削除済みオブジェクトは含まない。ロール・WH・DBなどアカウントレベルオブジェクトも参照可能 | 013, 031, 085, 120 |
| Data Unload デフォルト動作 | ①gzip圧縮あり ②複数ファイル出力 ③1ファイル16MB。それぞれCOMPRESSION/SINGLE/MAX_FILE_SIZEパラメータで変更可 | 014 |
| MAX_FILE_SIZE | データアンロード時の出力ファイルサイズを指定するパラメータ。デフォルト16MB、最大5GB | 014 |
| SINGLE パラメータ | データアンロード時に単一ファイル出力にするパラメータ。デフォルトFALSE（複数ファイル） | 014 |
| Time Travel（タイムトラベル） | 過去の任意の時点のデータをクエリ・復元できるSnowflakeの機能。`AT(TIMESTAMP => ...)` や `BEFORE(STATEMENT => ...)` で時点指定。**全エディション**対応。Standard=最大1日、Enterprise以上=最大90日 | 015, 051 |
| Permanent Table（永続テーブル） | Time Travel最大90日・Fail-safe 7日を持つ標準テーブル | 015 |
| Transient Table（トランジェントテーブル） | セッションをまたいで存在するテーブル。**Fail-Safeなし（0日）・Time Travel最大1日**。Time Travel期間終了後は**Snowflakeサポートでも復元不可**。Permanentへのクローン不可（Transient・Temporaryへは可能） | 015, 108, Q2:015 |
| Temporary Table（テンポラリテーブル） | セッション内のみ存在するテーブル。Fail-Safeなし（0日）・Time Travel最大1日はTransientと同じ。**Permanent テーブルへのクローン不可**（Transient・Temporaryへは可能） | 015, 108, Q2:015 |
| Fail-Safe（フェイルセーフ） | Time Travel後にSnowflakeが内部保持する障害回復機能。**Permanent Tableのみ7日間**。エンドユーザーはアクセス・操作不可。Snowflakeサポートチームのみが復元可能。**Transient/Temp Tableには適用されない（0日）** | 015, 056, 108 |
| Directory Table（ディレクトリテーブル） | ステージのファイルメタデータを保持する仮想テーブル。`SELECT * FROM DIRECTORY(@stage)` でクエリ。LISTとは出力列が異なる。**StreamはSTAGEオブジェクト上に作成**することでファイル変更を追跡できる。**独立したデータベースオブジェクトではなくステージのimplicit object**のため、直接権限を付与できない | 016, 091, 101 |
| Implicit Object（暗黙的オブジェクト） | 明示的に作成せず、別のオブジェクト（ステージ）に付随して自動的に利用可能になるオブジェクト。Directory Tableはステージのimplicit object。**独立したオブジェクトではないため権限を直接付与できない** | 101 |
| External Function（外部関数） | Snowflake外部のリモートサービスを呼び出すユーザー定義関数。SQLから外部API・サービスを実行できる。**AWS Lambda / Azure Function / EC2上のサーバーなどHTTPエンドポイントを提供するものはすべてリモートサービスとして使える**。API Integrationと組み合わせて実装する | 106 |
| Remote Service（リモートサービス） | External Functionが呼び出す外部処理サービス。クラウドFaaS（AWS Lambda、Azure Function）やサーバー（EC2上のNode.js）など様々な形式が使える | 106 |
| AWS Lambda（AWSラムダ） | AWSのサーバーレス関数実行サービス（FaaS）。External Functionのリモートサービスとして利用可能。Azure Function（Microsoft）が同等の競合サービス | 106 |
| Scale Up（スケールアップ） | 仮想ウェアハウスのサイズを大きくすること（例: X-Small→Large）。**複雑なクエリ・CPU集約的なクエリ・大量データ処理**のパフォーマンス向上に有効。同時ユーザー/クエリ数増加には無効 | 107, Q2:016 |
| Scale Out（スケールアウト） | Multi-Cluster Virtual Warehouseでクラスター数を増やすこと。**同時ユーザー数・同時クエリ数が多い場合**に有効。スケールアップでは解決できないコンカレンシー問題の解決策 | 107, Q2:016 |
| CPU-Intensive Query（CPU集約的クエリ） | 大量データスキャン・複雑な集計・JOINなど、多くのCPUリソースを必要とするクエリ。**スケールアップ（サイズ拡大）で恩恵を受ける**クエリ種別 | 107 |
| LIST コマンド | ステージ内のファイル一覧を表示するコマンド。`LIST @stage;` で実行。Directory Tableとは出力列が異なる | 016 |
| Snowflake Region（リージョン） | Snowflakeアカウントがホストされる地理的場所。1アカウント = 1リージョン。複数リージョン利用には複数アカウントが必要 | 017 |
| Organization（組織） | 複数のSnowflakeアカウントを一元管理するための上位概念。ORGADMINロールで管理する | 017 |
| ORGADMIN（Organization Admin） | 組織（Organization）レベルのSnowflakeロール。**新規アカウントの作成**・全アカウントの一覧表示などの組織固有タスクを担当。アカウント内最高権限のACCOUNTADMINとは異なる上位概念 | 094 |
| Resource Monitor（リソースモニタ） | 仮想ウェアハウスのクレジット消費を定義されたクォータ（上限）に対して追跡・管理する機能。**ACCOUNTADMINのみが作成・管理できる**。①1対1（単一WH）②1対多（複数WHを合計で追跡）③アカウントレベル（全WH合計）の3方式がある | 018, 114 |
| Reader Account（リーダーアカウント） | データプロバイダーが作成するデータ共有専用の特別なSnowflakeアカウント。**非Snowflakeユーザー/組織**とデータを共有するために使用。共有目的のみ（solely for sharing purposes）で作成され、ACCOUNTADMINが実行する。**コンピュートコストはすべてプロバイダーに請求**される | 018, 102, Q2:031 |
| Role Hierarchy（ロール階層） | ロールに別のロールを付与することで形成される親子関係。子ロールの権限は親ロールに継承される | 003 |
| Securable Object（セキュアオブジェクト） | Snowflakeでアクセス制御の対象となるオブジェクト。データベース、スキーマ、テーブル、ウェアハウスなど | 003 |
| Query Profile（クエリプロファイル） | Snowflakeでクエリの実行詳細を視覚化する機能。**3ペイン構成**: Operator Tree（左）・Operator Details（中央）・**Statistics**（右: IO/Pruning/Spilling/Network/Processing）。`Partitions Scanned ≈ Partitions Total` のときクラスタリング不良の兆候。Most Expensive NodesはOverviewタブ | 019, 064, Q2:018 |
| Partitions Scanned / Partitions Total | Query Profileに表示されるパーティション統計。`Scanned << Total` = Pruning効果大（良好）。`Scanned ≈ Total` = フルスキャン = クラスタリング不良のサイン | 064 |
| COPY INTO（COPYコマンド） | ステージからSnowflakeテーブルへデータをロードするコマンド。ロード中にシンプルな変換（型キャスト・列省略・Truncate等）が可能 | 020, Q2:014 |
| Stream（ストリーム） | テーブルへのDML変更（INSERT/UPDATE/DELETE）を追跡するオブジェクト。最後のオフセット以降の変更差分のみをクエリできる。長期間消費されないと**stale（陳腐化）** する。CDCの実装 | 022, Q2:017 |
| Stale Stream（陳腐化したストリーム） | データ保持期間を超えてストリームが消費されなかった場合に発生する状態。staleになるとデータ読み取り不可。再作成が必要 | Q2:017 |
| MAX_DATA_EXTENSION_TIME_IN_DAYS | ストリームがstaleになることを防ぐために、ソーステーブルのデータ保持期間を**自動延長できる最大日数**を制御するパラメータ。デフォルト14日。ストレージコスト管理のために制限可能 | Q2:017 |
| Clone Independence（クローン独立性） | クローン作成後、ソースとクローンは完全に独立。一方への変更（INSERT/UPDATE/DELETE/DROP）は他方に影響しない | 030 |
| Zero-Copy Cloning（ゼロコピークローン） | Snowflakeのクローン機能の別名。データを物理コピーせずメタデータ（マイクロパーティション参照）のみで即時作成。追加ストレージ不要。物理コピーより**はるかに高速**（far faster） | 030, Q2:002 |
| Clone（クローン） | `CREATE TABLE/SCHEMA/DATABASE ... CLONE` でオブジェクトのスキーマ＋マイクロパーティション参照をコピーする機能。即時・追加ストレージゼロ。変更時のみ新パーティション作成（Copy-on-Write）。ロードメタデータはコピーされない | 029, Q2:002 |
| Load Metadata（ロードメタデータ） | COPY INTOでロード済みファイルを追跡する内部情報。重複ロードを防ぐ。クローンには引き継がれない（空になる） | 029 |
| External Table（外部テーブル） | クラウドストレージ上のファイルをテーブルとして参照するメタデータ定義。実データを持たず読み取り専用（INSERT/UPDATE/DELETE不可）。外部ステージのみ使用可能。**JOIN可・VIEW作成可** | 028, Q2:006 |
| External Stage（外部ステージ） | ユーザー管理のクラウドストレージ（S3・Azure Blob・GCS等）への参照。外部テーブルはこれのみ使用可能 | 028 |
| Internal Stage（内部ステージ） | Snowflakeが管理するステージ（Table/User/Named Stage）。外部テーブルには使用不可。**Named Internal Stageはクローン不可**（Named External Stageはクローン可能） | 028, 061 |
| MONITOR 権限 | リソースモニタの設定を閲覧できる権限。ACCOUNTADMINが他ユーザーに付与可能。新規作成はできない | 027 |
| MODIFY 権限 | リソースモニタの設定を変更できる権限。ACCOUNTADMINが他ユーザーに付与可能。新規作成はできない | 027 |
| Proprietary Format（独自フォーマット） | Snowflakeがテーブルデータを内部保存する非公開ファイル形式。ユーザーは参照・変更・直接アクセス不可。暗号化・圧縮・列指向で最適化されている | 026 |
| Hybrid Architecture（ハイブリッドアーキテクチャ） | Snowflakeが採用する独自アーキテクチャ。Shared-Disk（ストレージ共有）とShared-Nothing（コンピュート独立）の両方の特性を組み合わせる | 025 |
| Shared-Nothing Architecture | 各ノードがストレージ・メモリ・CPUを独立して持つアーキテクチャ。Teradata・Greenplum・Hadoopが採用。Snowflakeは純粋なShared-Nothingではない | 025 |
| Shared-Disk Architecture | 複数のコンピュートが共通ストレージを共有するアーキテクチャ。Snowflakeのストレージ層（S3等）はこれに相当 | 025 |
| DATABASE_STORAGE_USAGE_HISTORY | ACCOUNT_USAGEスキーマのビュー。データベースごとの通常・Time Travel・Fail-safeストレージ使用量を365日間保持。最大3時間の遅延あり・削除済みDB含む | 024 |
| Share（シェア） | データプロバイダーがコンシューマーと共有するオブジェクト。コンシューマーは0・1・複数追加可能。データのコピーを作らずにアクセスを提供。**作成・管理はデフォルトでACCOUNTADMINのみ**（他ロールへ権限付与は可能） | 023, 055 |
| Data Exchange（データエクスチェンジ） | 複数の組織・アカウント間でデータを共有・発見・交換するSnowflakeのプラットフォーム。Snowflake Data Marketplaceもこれに含まれる | 055 |
| Secure Data Sharing（セキュアデータ共有） | データのコピーなしにコンシューマーがプロバイダーのデータにリアルタイムアクセスできるSnowflakeの共有機能 | 023 |
| Data Provider（データプロバイダー） | Shareを作成してデータを提供するSnowflakeアカウント | 023 |
| Consumer Account（コンシューマーアカウント） | Shareを受け取ってデータにアクセスするアカウント。1つのShareに対して複数追加可能 | 023 |
| Offset（オフセット） | Streamが「どこまで変更を読み取ったか」を示す位置マーカー。Streamを消費するたびに進む | 022 |
| Task（タスク） | SQL文やストアドプロシージャを定期的・自動実行するオブジェクト。Streamと組み合わせて差分処理パイプラインを構築 | 022 |
| OPERATE権限（タスク） | タスクをサスペンド（停止）またはレジューム（再開）する権限。実行状態の制御のみ。閲覧はMONITOR、定義変更はMODIFY/CREATE TASKが必要 | 090 |
| MONITOR権限（タスク） | タスクのステータスと実行履歴を閲覧・管理する権限。OPERATE（状態制御）とは異なり実行状態の変更は不可 | 090 |
| Stored Procedure（ストアドプロシージャ） | 複雑な手続き的ロジック（制御フロー・ループ・エラーハンドリング等）をデータベース側で実行するオブジェクト。戻り値は**必須ではない**が、Single ValueまたはTabular Dataを返すことができる。CALLで呼び出す（SQLクエリ内では直接使えない）。**主なユースケース**: 動的SQLの実行・繰り返し管理業務の自動化 | 022, 073, 089 |
| Dynamic SQL（動的SQL） | 実行時に文字列として組み立てられるSQL文。テーブル名・条件をプログラム的に変化させる。`EXECUTE IMMEDIATE` で実行。Stored Procedureの主要ユースケース | 089 |
| CDC (Change Data Capture) | データの変更差分を追跡・取得する手法。SnowflakeではStreamがCDCを実装している | 022 |
| Simple Transformation（シンプルな変換） | COPYロード中に可能な変換。**列の順序変更（Reorder）・列の省略（Omit）・型キャスト（Cast）・値の切り詰め（Truncate）** の4種類のみ。Pivot・Transpose・Join・Filter・Aggregation・FLATTENは不可 | 020, Q2:014 |
| Complex Transformation（複雑な変換） | COPYロード中にはできない変換。JOIN・GROUP BY・集計関数（SUM等）・FLATTENが対象。ロード後のSELECTで実行可能 | 020 |
| Data Spilling（データスピリング） | 処理データがメモリに収まらず、ローカルディスクやリモートストレージへ書き出される現象。クエリパフォーマンスが低下する | 019 |
| Bytes Spilled to Local Storage | クエリ処理がメモリ不足でウェアハウスのローカルディスクに書き出されたデータ量。メモリより遅い | 019 |
| Bytes Spilled to Remote Storage | ローカルディスクも満杯になり、クラウドストレージ（S3/Azure Blob/GCS）にまで書き出されたデータ量。ローカルよりさらに遅い | 019 |
| UNDROP | DROPされたオブジェクトを復元するSQL DDLコマンド。対象はTABLE・SCHEMA・DATABASEの3種類のみ。ROLEやUSERには使用不可 | 034 |
| Micro-Partition（マイクロパーティション） | Snowflakeがテーブルデータを内部的に分割して保存する固定サイズのファイル単位（50〜500MB非圧縮）。各パーティションは列ごとに列指向で保存され、最大/最小値・行数などのメタデータがCloud Services Layerで管理される。クラスタリングや統合（consolidation）でパーティションが再配置されるとQuery Result Cacheが無効化される。**一度作成されたら変更不可（immutable）** | 048, 105 |
| Immutable（イミュータブル・不変） | 「一度作成したら変更できない」性質。Snowflakeのマイクロパーティションはimmutable。データ更新時は既存パーティションを変更せず新しいパーティションを作成する（Copy-on-Write）。Time Travelが実現できるのもこの特性による | 105 |
| Memory Spillage（メモリスピレージ） | クエリ実行に必要なメモリがウェアハウスのRAMを超えると一時的にローカルディスクに書き出す現象。パフォーマンス低下の原因。**解決策: ウェアハウスサイズを大きくする（Resolve memory spillage）** | 115 |
| Query Acceleration Service（クエリ加速サービス） | 特定の重いクエリを自動的に加速するSnowflakeのサービス。クエリの一部をオフロードして並列実行する。仮想ウェアハウスのパフォーマンス最適化6戦略の1つ | 115 |
| Snowpark | Python・Scala・JavaのコードをSnowflake内部で直接実行できる開発フレームワーク。DataFrame APIでSQLを書かずにデータ処理ができる。処理がSnowflake内で完結するためデータ移動が不要 | 052 |
| DataFrame API（Snowpark） | Snowparkのメインインターフェース。テーブルデータをDataFrameとして扱い、メソッドチェーンで変換・集計・フィルタリングを行う。Apache SparkのDataFrameに類似 | 052 |
| Oracle Cloud Storage | OracleのOCI（Oracle Cloud Infrastructure）のオブジェクトストレージ。SnowflakeはAWS・Azure・GCSのビッグ3のみ外部ステージとして対応しており、Oracle Cloudは**非対応**（試験の引っかけ選択肢） | 050 |
| VMware Storage | VMwareの仮想化ストレージ。Snowflakeはクラウド専業でオブジェクトストレージとしては**非対応**（試験の引っかけ選択肢） | 050 |
| Virtual Warehouse Cache（ウェアハウスキャッシュ） | 仮想ウェアハウス内のローカルSSDに保存されるデータキャッシュ。ウェアハウスが稼働中の間、スキャンしたデータブロックを保持し再スキャンを省く。**ウェアハウスが必要（稼働中）**。Query Result Cache（Cloud Services Layer、WH不要）やMetadata Cache（行数/集計、WH不要）とは別物 | 049 |
| Query Result Cache再利用条件（全5条件） | ①同一クエリ ②データ未変更 ③マイクロパーティション未変更（再クラスタリング/統合なし） ④ランタイム関数不使用 ⑤UDF・外部関数不使用。例外: CURRENT_DATEは対象になる | 048 |
| Runtime Function（ランタイム関数） | クエリ実行のたびに異なる値を返す関数（RANDOM(), UUID_STRING(), SYSDATE()等）。Query Result Cacheの再利用を無効化する。CURRENT_DATEは例外でキャッシュ対象 | 048 |
| Share（複数DB共有の制約） | 1つのShareに追加できるデータベースは**1つのみ**。複数DBのデータを共有するには、1つのDBにセキュアビューを作成してクロスDB参照で集約してからShareする | 047 |
| Cross-Database Reference（クロスDB参照） | `database.schema.table` 形式で別DBのオブジェクトを参照する方法。セキュアビューの定義内でこれを使い、複数DBのデータを1つのビューに集約してShareできる | 047 |
| ACCOUNT_USAGE スキーマ（レイテンシ） | ACCOUNT_USAGEビューはリアルタイムではなく、**45分〜最大3時間**のラグがある。データ保持期間は最大365日。INFORMATION_SCHEMA（ほぼリアルタイム・7〜14日保持）と対比して覚える | 046 |
| MFA（Multi-Factor Authentication / 多要素認証） | パスワードに加えて第2の認証要素を要求する認証方式。全エディション・全アカウントでデフォルト有効。WebUI・SnowSQL・JDBC等すべてのクライアントツールが対応。**Snowpipeはサーバーレスでログイン概念がないため対象外**。**新規ユーザーの自動登録はなし** — ユーザーが自分でenrollment processを開始・完了する必要がある | 063, Q2:010 |
| Key Pair Authentication（キーペア認証） | 秘密鍵×1 + 公開鍵×最大2つで構成されるパスワード不要の認証方式。SSOとは別物。全エディション・全ドライバー対応。公開鍵が2つ持てるのはキーローテーション時のダウンタイムゼロのため | 045 |
| External Table Capabilities | 外部テーブルは通常テーブルと同様にSELECTクエリ・JOINが可能。読み取り専用（INSERT/UPDATE/DELETE不可）。ビューも作成可能。テーブル定義のみSnowflakeのメタデータに保存される | 044 |
| Search Optimization Service（検索最適化サービス） | ポイントルックアップ・LIKE/正規表現・VARIANT列・地理空間クエリを高速化するSnowflakeのサービス。テーブルにサーチアクセスパスを追加で構築し、追加ストレージコストが発生する。**有効**: equality predicate（=）・IN predicate。**非サポート**: External Tables, Materialized Views, COLLATE列, カラム連結, 分析式, カラムキャスト（固定小数点→文字列除く）、テーブル全体スキャン、ウィンドウ関数 | 043, 093, Q2:004 |
| Point Lookup Query（ポイントルックアップクエリ） | 高選択性フィルターで1〜数行のみを返すクエリ。`WHERE id = 12345` のような特定値の検索。Search Optimization Serviceの主な対象 | 043, Q2:004 |
| Equality Predicate（等値述語） | `=` 演算子を使ったWHERE条件式。`WHERE col = value` の形。Search Optimization Serviceが最も効果的に機能する条件。 | Q2:004 |
| IN Predicate（IN述語） | `IN (val1, val2, ...)` を使ったWHERE条件式。複数の等値比較の集合版。Search Optimization Serviceの対象。 | Q2:004 |
| Snowpipe定義（Pipe Definition） | `CREATE PIPE` 文の中に含まれるCOPY INTO文。ステージのファイルを自動的にロードする設定。通常のCOPY INTOと同じ変換機能をサポートする | 042 |
| Virtual Private Snowflake (VPS) | Snowflakeの最上位エディション。他のすべての顧客から完全に分離された専用のメタデータストアとコンピュートリソースを持つ唯一のエディション。共通クラウドサービスを使わないため**Snowflake Marketplaceは利用不可** | 041, 084, Q2:022 |
| Snowflake Editions | Snowflakeの製品グレード。Standard → Enterprise → Business Critical → Virtual Private Snowflake (VPS) の順で機能・分離性が強化される | 041 |
| Business Critical Edition | EnterpriseとVPSの間のエディション。HIPAA/PCI DSS準拠・Tri-Secret Secure対応。専用メタデータストアはなく、VPSとは異なる | 041 |
| HIPAA（医療情報保護法） | Health Insurance Portability and Accountability Act。米国の医療情報（PHI）保護法。Snowflakeは**HITRUST/HIPAA**として準拠（HITRUST CSFを通じた認証） | 111 |
| FedRAMP（連邦クラウド認証） | Federal Risk and Authorization Management Program。米国連邦政府のクラウドサービス認証。Snowflakeは**FedRAMP Moderate**レベルで認定 | 111 |
| PCI-DSS（決済カードセキュリティ基準） | Payment Card Industry Data Security Standard。クレジットカード決済情報保護の国際基準。Snowflakeが準拠 | 111 |
| IRAP – Protected（オーストラリア政府セキュリティ） | Information Security Registered Assessors Program – Protected level。オーストラリア政府の機密データセキュリティ評価。Snowflakeが認定 | 111 |
| SOC 1 / SOC 2 Type II | Service Organization Control。SOC 1は財務コントロール監査、SOC 2はセキュリティ・可用性等を評価。**Type II**は一定期間（通常6〜12ヶ月）の運用有効性を評価（Type Iは特定時点のみ） | 111 |
| ISO/IEC 27001 | 情報セキュリティ管理システム（ISMS）の国際標準規格。SnowflakeはISO/IEC 27001認証を取得 | 111 |
| JDBC Driver | Java Database Connectivity。Javaアプリケーションからデータベースに接続するための標準インターフェース。Snowflakeはこのドライバーを提供している | 040 |
| ODBC Driver | Open Database Connectivity。Windows/Linuxアプリ・BIツール（Excel, PowerBI等）からSQLデータベースに接続するための標準インターフェース | 040 |
| Snowflake Connector for Python | PythonアプリケーションからSnowflakeに接続するためのコネクタ。データサイエンス・機械学習ワークフローで広く使用される | 040 |
| Snowflake Connector for Spark | Apache SparkとSnowflakeを連携させるコネクタ。大規模な分散処理パイプラインで使用 | 040 |
| Snowflake Connector for Kafka | Apache KafkaからSnowflakeにリアルタイムでデータをストリーミングするコネクタ | 040 |
| LAST_QUERY_ID() | 現在のセッションで実行されたクエリのQuery IDを返す関数。負の引数 = 最新から数える（-1: 最新、-2: 2番目に新しい）、正の引数 = 古いほうから数える（1: 最初）。デフォルトは -1 | 039 |
| Query ID（クエリID） | Snowflakeが各クエリに割り当てる一意の識別子。クエリの追跡・デバッグ・キャンセルなどに使用される | 039 |
| PUT コマンド | SnowSQL CLIを使ってローカルファイルをSnowflakeの内部ステージにアップロードするコマンド。クライアントマシンで自動的に暗号化してから送信し、ステージにも暗号化して保存する | 038 |
| End-to-End Encryption（エンドツーエンド暗号化） | クライアントマシンからSnowflakeのストレージまで、データが常に暗号化された状態で移動・保存されること。PUTコマンドはこれを自動で実現する | 038 |
| Client-side Encryption（クライアントサイド暗号化） | データがネットワークを通じて送信される前にクライアントマシン上で暗号化されること。PUTコマンドはこれを自動で行う | 038 |
| Dynamic Data Masking（動的データマスキング） | 列に適用するマスキングポリシーで、ロールに応じてデータを隠す/変換して表示するセキュリティ機能。**列レベルセキュリティ（Column-level Security）**の実現手段 | 037 |
| Column-level Security（列レベルセキュリティ） | テーブルの特定列へのアクセスを制御するセキュリティ手法。Dynamic Data MaskingまたはExternal Tokenizationで実現。行レベルセキュリティ（Row Access Policy）と混同しないこと | 037 |
| Row Access Policy（行アクセスポリシー） | テーブルの特定行へのアクセスを制御するポリシー。行レベルセキュリティ（Row-level Security）を実現する。列制御のDynamic Data Maskingとは別物 | 037 |
| External Tokenization（外部トークン化） | サードパーティのトークン化ツールと連携して列データをトークンに置き換える列レベルセキュリティの実現手段。Dynamic Data Maskingと並ぶ2つの方法の1つ | 037 |
| Masking Policy（マスキングポリシー） | 列に適用するポリシーオブジェクト。クエリ実行者のロールに基づいてデータをそのまま/マスク/一部表示するかを定義する | 037 |
| Database Storage Layer（データベースストレージレイヤー） | Snowflake 3層アーキテクチャの最下層。AWS/Azure/GCP上の安価なクラウドストレージ（S3等）にマイクロパーティション形式でデータを保存。コンピュートから完全に分離されている | Q2:008 |
| Query Processing Layer（クエリ処理レイヤー） | Snowflake 3層アーキテクチャの中間層。**主に仮想ウェアハウスで構成**（primarily composed of virtual warehouses）。クエリ・データ処理ジョブを実行する。クエリプランの生成・最適化はしない | 036, Q2:008 |
| Cloud Services Layer（クラウドサービスレイヤー） | Snowflake 3層アーキテクチャの最上層。**Snowflake全体の「頭脳（brain）」**。メタデータ管理・認証・アクセス制御・クエリプラン生成・最適化・トランザクション管理を担当 | 036, 113, Q2:008 |
| Query Plan（クエリプラン） | SQLクエリを最も効率的に実行するための実行計画。Cloud Services Layerが生成・最適化し、Query Processing Layerが実行する | 036 |
| Clustering Key（クラスタリングキー） | テーブルのデータをマイクロパーティション内でどのように整理するかを定義するキー。特定列でのクエリ絞り込み時に不要パーティションを除外し性能を向上させる。既存テーブルへの追加は `ALTER TABLE ... CLUSTER BY` で可能 | 035, 053 |
| Cardinality（カーディナリティ） | 列の重複しない値（distinct values）の数。クラスタリングキー選択の重要指標。**低すぎ（例: gender）→ pruning最小限、高すぎ（例: customer_id）→ 管理オーバーヘッド増大**。適切なバランスが必要 | 097 |
| Multi-Column Clustering Key（複合クラスタリングキー） | 複数列を組み合わせたクラスタリングキー。**低カーディナリティ→高カーディナリティの順**に列を配置すること（逆順では効果が低下） | 097 |
| Micro-Partition（マイクロパーティション） | Snowflakeがデータを内部的に分割する単位。各パーティションは50〜500MBの非圧縮データを含み、最大/最小値などのメタデータで管理される。大規模テーブルでは**数百万〜数億個**になる | 035, 079 |
| Partition Pruning（パーティションプルーニング） | クエリ実行時にWHERE条件に合致しないマイクロパーティションをスキャン対象から除外する最適化技術。Snowflakeが各パーティションの列最大/最小値のメタデータを管理することで実現。クラスタリングキーによって効果が最大化される | 035, 062 |
| Re-clustering（再クラスタリング） | テーブルデータを新たに定義したクラスタリングキーに基づいて再配置するプロセス。大量データへの変更でクラスタリング状態が崩れた際に有効 | 035 |
| Automatic Clustering（自動クラスタリング） | クラスタリングキーが定義されたテーブルに対して、Snowflakeが自動的に再クラスタリングを管理するサーバーレスサービス。恩恵を受けるマイクロパーティションのみを対象に再編成。WHは不要だがSnowflake管理のCPU/RAMを使用し**サーバーレスコスト**が発生。再クラスタリングで新パーティション作成+元パーティションはTT/FS用に保持→**ストレージコストも増加** | Q2:021, Q3:001 |
| Child Object（子オブジェクト） | 親オブジェクト（スキーマやデータベース）に含まれるオブジェクト。UNDROPでDB/Schemaを復元すると子オブジェクトもすべて復元される | 034 |
| Clustering Depth（クラスタリング深度） | テーブルのクラスタリング状態を示す指標。**1が最良（最小値）** で、値が大きいほどマイクロパーティションの重なりが多くクラスタリングが悪い。「深度が小さい＝よくクラスタリングされている」 | 077, Q2:011 |
| Overlapping Micro-Partitions（重なりあうマイクロパーティション） | 同じ値の範囲を複数のパーティションが含んでいる状態。重なりが多いとパーティションプルーニングの効果が下がりクエリが遅くなる。**Snowflakeでは異なるパーティション間で値の重複は仕様上あり得る**（他のDBとの相違点） | 077, 110, Q2:011 |
| Populated Table（データが格納されたテーブル） | 実際にデータが挿入されているテーブル。クラスタリング深度はデータが存在するテーブルに対してのみ計測可能。技術文書で「populated」はテーブルにレコードがある状態を意味する | Q2:011 |
| Columnar Storage（列指向ストレージ） | データを列単位で保存する形式。Snowflakeの各マイクロパーティション内で採用。圧縮効率が高く分析クエリに有利。行指向（Row Storage）を採用する従来のRDB（MySQL等）とは逆 | 110 |
| Storage Hierarchy（ストレージ階層） | Snowflakeのオブジェクトが入れ子になっている構造。**Account → Database → Schema → Object（Table/View/UDF等）** の順。1オブジェクトは1スキーマにのみ所属する | 074 |
| Schema（スキーマ） | データベース内のオブジェクト（テーブル・ビュー・ファイルフォーマット・シーケンス・UDF・ストアドプロシージャ等）をグループ化する論理的なコンテナ。1DBに複数スキーマを持てる | 074 |
| VARIANT（バリアント型） | JSONやXMLなどの半構造化データを格納できるSnowflakeの特殊なデータ型。1つのセルにオブジェクト・配列・スカラー値などを格納できる。最大16MB | 072 |
| Semi-structured Data（半構造化データ） | JSON・Avro・ORC・Parquet・XMLなど、固定スキーマを持たないデータ形式。Snowflakeは`VARIANT`型でネイティブサポートする | 072 |
| Snowsight Profile（スノーサイト・プロファイル） | Snowsightのユーザー設定画面。**Default Role・Default Warehouse**・名前・パスワード・言語・メール・MFA登録・通知設定を構成できる。Default SchemaとDefault DatabaseはUIでは設定不可（`ALTER USER` で設定） | 080 |
| Colon Notation（コロン記法） | VARIANTカラムのJSONフィールドにアクセスするSnowflake固有の構文。`column_name:field_name` の形式。ネストは `.` で続ける（例: `json_data:organizations[0]:Company`） | 072 |
| IMPORT SHARE（権限） | コンシューマーアカウントで、Shareからデータベースを作成することを許可する権限。ACCOUNTADMINがなくてもこの権限があればShareからDBを作成できる | 078 |
| SYSTEM$IS_LISTING_PURCHASED | Snowflakeのシステム関数。Shareのリスティングが購入済みか否かを確認し、**有料顧客とトライアル顧客で見えるデータを制御する**ために使用する | 075 |
| Listing（リスティング） | Snowflake Marketplaceでデータプロバイダーが公開するデータ製品のパッケージ。無料・有料（paid）・プライベートの形態がある | 075 |
| SYSTEM$ALLOWLIST | Snowflakeのネットワークポリシー設定でホワイトリストに使用するシステム関数。IPアドレス制御用であり、データアクセス制御（支払い）には使わない | 075 |
| Snowflake Marketplace（スノーフレーク・マーケットプレイス） | サードパーティのデータセットを検索・購入・利用できるSnowflakeのオンラインデータマーケットプレイス。Secure Data Sharingの仕組みを基盤とし、データをコピーせずリアルタイムでアクセスできる。無料・有料・プライベートの3形態がある。**VPS不可** | 081, Q2:007 |
| Data Enrichment（データエンリッチメント） | 自社データに外部（サードパーティ）データを組み合わせて価値を高めること。Snowflake Marketplaceから取り込んだデータを活用するユースケースの代表例 | Q2:007 |
| GET_PRESIGNED_URL | SnowflakeのSQL関数。Snowflakeステージ上のファイルへの一時的なHTTPS URL（プリサインドURL）を生成する。**認証不要**でany userがアクセスできる点が最大の特徴。有効期限（expiry）を設定可能 | 082 |
| BUILD_SCOPED_FILE_URL | SnowflakeのURL生成関数。特定ユーザー/ロールにスコープを限定したファイルURLを生成する。**Snowflakeの認証が必要**。GET_PRESIGNED_URLと混同しないこと | 082 |
| BUILD_STAGE_FILE_URL | SnowflakeのURL生成関数。ステージ上のファイルを参照するURLを生成する。**Snowflakeの認証が必要**。外部ユーザーへの共有には不向き | 082 |
| Pre-signed URL（プリサインドURL） | プリサインドアクセストークンを埋め込んだ一時的なHTTPS URL。認証なしにWebブラウザからファイルをダウンロードできる。GET_PRESIGNED_URL関数で生成され、有効期限は設定可能 | 082 |
| Unstructured Data（非構造化データ） | PDF・画像・動画・音声ファイルなど、行・列形式でないデータ。Snowflakeはステージを通じて非構造化データを管理・処理できる。アクセス用URLはGET_PRESIGNED_URL / BUILD_SCOPED_FILE_URL / BUILD_STAGE_FILE_URLで生成 | 082 |
| Phased Release Strategy（段階的リリース戦略） | Snowflakeの新バージョン展開方式。全アカウントに一度にデプロイせず、エディション・アーリーアクセス有無に応じて段階的に展開する。Day1(EA登録Enterprise+) → Day1〜2(Standard全) → Day2(残りEnterprise+)。最低24時間ルール | 083, Q2:005 |
| Weekly Release（週次リリース） | Snowflakeのソフトウェアリリース頻度。**毎週（Weekly）**新機能・改善・バグ修正がデプロイされる。SaaSの特性によりユーザーの操作なしに自動的に適用される。Phased Release Strategyにより段階的に展開される | 103, Q2:005 |
| Early Access（アーリーアクセス） | Snowflakeの新バージョンを他アカウントより先にDay 1に受け取るオプト・イン制度。**Enterprise以上のエディション**が対象で、Snowflakeサポートへの連絡で登録（enroll）できる。デフォルトではなく自発的登録が必要 | 083, Q2:005 |
| Per-Second Billing（秒単位課金） | Snowflakeのウェアハウス課金単位。起動から停止までの秒数に応じてクレジットを消費。**最低60秒の課金**が適用される（60秒未満で停止しても60秒分課金）。クエリの有無に関わらず起動中は課金される | 088, Q2:013 |
| 60-Second Minimum（最低60秒課金） | Snowflakeウェアハウスの課金最低単位。1分以内にシャットダウンしても最低60秒分のクレジットが消費される。1分以上の使用は秒単位で正確に課金 | 088 |
| Snowflake Credits（クレジット） | Snowflakeのコンピュートリソース消費の課金単位。ウェアハウスのサイズ（X-Small〜6X-Large）と稼働時間（秒単位）に応じて消費される | 088, Q2:013 |
| Data Integration Partner（データ統合パートナー） | SnowflakeエコシステムのパートナーカテゴリのひとつでETL/ELTツール提供ベンダー。代表例: IBM DataStage, Matillion, AbInitio, Talend, Informatica | 087 |
| Matillion | クラウドネイティブなETL/ELTツール。Snowflake向けに最適化。Snowflake Data Integrationパートナー | 087 |
| Informatica | エンタープライズデータ管理の大手ベンダー。PowerCenter・IICSでSnowflakeと統合。Data Integrationパートナー | 087 |
| Talend | オープンソースのデータ統合プラットフォーム。ETL・データ品質・クラウド統合を提供。Snowflake Data Integrationパートナー | 087 |
| Shared-Disk Architecture（共有ディスクアーキテクチャ） | 複数のコンピュートノードが単一の共有ストレージにアクセスするアーキテクチャ。Snowflakeはデータの保存部分にこれを採用。すべての仮想ウェアハウスが同じストレージにアクセスできる | 099, Q2:009 |
| Shared-Nothing Architecture（共有なしアーキテクチャ） | 各ノードが独自のストレージ・CPU・メモリを持ち、リソースを共有しないアーキテクチャ。Snowflakeはコンピュート部分にこれを採用。各仮想ウェアハウスが独自のメモリ・CPUを持つ | 099, Q2:009 |
| Hybrid Architecture（ハイブリッドアーキテクチャ） | Snowflakeのアーキテクチャ。**Shared-Disk**（共有ストレージ）と**Shared-Nothing**（独立コンピュート）の両方の長所を組み合わせた設計。「データは共有、コンピュートは独立」 | 099 |
| Network Policy（ネットワークポリシー） | IPアドレスに基づいてSnowflakeへのアクセスを制御するセキュリティ機能。許可リスト（Allowed List）とブロックリスト（Block List）を設定できる。**ブロックリストが先に適用される**。アカウント・ユーザー・統合レベルに設定可能 | 100 |
| Block List（ブロックリスト） | ネットワークポリシーでアクセスを拒否するIPアドレスのリスト。許可リストより**先に適用される**。両リストに同じIPが含まれる場合、ブロックリストが優先されアクセスは拒否される | 100 |
| Allowed List（許可リスト） | ネットワークポリシーでアクセスを許可するIPアドレスのリスト。ブロックリストの**後に適用される**。ブロックリストに同じIPが含まれている場合は、許可リストに載っていてもアクセス不可 | 100 |
| Optimum Fit（最適な適合） | 特定のクエリ要件とワークロードに対して最も適したウェアハウスサイズ・構成の組み合わせ。`optimum`（最適な）は `optimal` と同義。試行錯誤によって見つけるもので、一律に決まるものではない | 116 |
| Workload（ワークロード） | ウェアハウスが処理するクエリ・ジョブの総体。クエリの種類・複雑さ・同時実行数などによって最適なウェアハウスサイズが変わる。組織・業務によって固有のため、一概に最適サイズは決められない | 116 |
| Initial Warehouse Size（初期ウェアハウスサイズ） | 新しい仮想ウェアハウスを作成する際の最初のサイズ選択。**正しいアプローチは実験（試行錯誤）**であり、コスト最小化（X-Small固定）や最大パフォーマンス保証（5X-Large固定）ではない | 116 |
| Database Failover（データベースフェイルオーバー） | プライマリSnowflakeアカウントに障害が発生した際、別のアカウントに処理を引き継ぐ機能。**Business Critical以上**（Business Critical / VPS）のエディションでのみ利用可能 | 118 |
| Database Failback（データベースフェイルバック） | フェイルオーバー後、障害から復旧したプライマリアカウントに処理を戻す機能。フェイルオーバーとセットで提供される。**Business Critical以上**のエディションでのみ利用可能 | 118 |
| Business Continuity（事業継続性） | 障害・災害発生時もビジネス運用を継続できる能力。Snowflakeではフェイルオーバー/フェイルバック機能が支える。**Business Critical以上**のエディションで対応 | 118 |
| Disaster Recovery（障害復旧・DR） | 自然災害・システム障害・データ消失などから業務システムを復旧させる計画・仕組み。Snowflakeではフェイルオーバー/フェイルバックが中心機能。`Business Continuity`（事業継続性）とセットで語られる | 118 |
| Enterprise Edition（エンタープライズエディション） | Standardの全機能に加え、Multi-Cluster WH・Column-level Masking・Row Access Policy・Materialized Views・Search Optimizationが利用可能になるエディション。「minimum edition」系の問題で頻出 | Q2:036 |
| Scale Down（スケールダウン） | ウェアハウスサイズを小さくすること（例: Large → Medium）。ノードがデプロビジョニングされる。クエリ複雑度の低下に対応してコスト削減するために行う。Scale Up（大きくする）の逆 | Q2:037 |
| De-provision（デプロビジョニング） | コンピュートリソース（ノード）を解放・削除すること。スケールダウン時にノードが取り除かれる。実行中のクエリが完了してから削除される | Q2:037 |
| Purge（パージ） | キャッシュを完全に削除・無効化すること。Query Result Cacheは24時間再利用されないとパージされ、最大31日でどんな場合もパージされる | Q2:038 |
| Validity Period（有効期間） | キャッシュなどが有効な期間。Query Result Cacheは初期24時間で、再利用のたびに24時間延長、最大31日 | Q2:038 |
| Multi-Column Cluster Key（マルチカラムクラスターキー） | 複数列を組み合わせたクラスタリングキー。列の順序が重要で、**低カーディナリティから高カーディナリティの順**に並べる。順序を間違えるとクラスタリングの効果が低下する | Q2:040 |
| Lazy Execution（遅延実行） | Snowparkの実行方式。DataFrame操作を記述しても即座には実行されず、明示的な実行操作（collect, show等）を行ったときに初めてSQLに変換・実行される。不要な中間処理を省き最適化されたSQLを生成する | Q2:042 |
| Push Down（プッシュダウン） | クライアント側ではなくサーバー側（Snowflake）にコードを送り込んで実行させるアプローチ。Snowparkがプログラミング構造をSQLに変換してSnowflakeで実行する仕組み。データの移動が不要でSnowflakeの並列処理を活用可能 | Q2:042 |
| Reader Account Data Restriction（リーダーアカウントのデータ制約） | Reader Accountは**作成元のプロバイダーからのデータのみ**消費可能。他のプロバイダーやMarketplaceからのデータは利用不可 | Q2:043 |
| MINS_TO_BYPASS_NETWORK_POLICY | ユーザーがネットワークポリシーを一時的にバイパスできる分数を指定するプロパティ。**Snowflakeサポートのみが設定可能**。どのロール（ACCOUNTADMIN含む）でも変更不可。管理者がロックアウトされた場合の緊急手段 | Q2:046 |
| SnowCD（Snowflake Connectivity Diagnostics） | Snowflakeへのネットワーク接続を診断するCLIツール。接続テスト用であり、操作インターフェースではない。SnowSQL（CLI）やSnowsight（Web UI）とは役割が異なる | Q2:049 |
| Auto-Scale Mode（オートスケールモード） | Multi-Cluster WHのスケーリングモード。最小≠最大クラスター数に設定すると有効化。ワークロードに応じてクラスター数を**動的に増減**。起動時は最小数、需要に応じて最大数まで増加、需要低下で最小数まで減少 | Q2:050 |
| Maximized Mode（マキシマイズドモード） | Multi-Cluster WHのスケーリングモード。最小=最大クラスター数に設定。起動時に常に**全クラスターが稼働**する。動的な増減なし。安定した高負荷ワークロードに適する | Q2:050 |
| Warehouse Node Count（ウェアハウスノード数） | サイズごとのノード数: X-Small=1, Small=2, Medium=4, Large=8, XL=16, 2XL=32, 3XL=64, 4XL=128, 5XL=256, **6XL=512**。1段階上がるとノード数が2倍。Large(8) × 2^N = NX-Largeのノード数 | Q2:048 |
| Auto-Suspend（自動サスペンド） | ウェアハウスがアイドル状態になった後、指定時間で自動停止する機能。クレジット節約に有効。データロード用WHでは必須設定 | Q2:055 |
| Auto-Resume（自動レジューム） | サスペンド中のウェアハウスにクエリが来た際に自動再開する機能。Auto-Suspendとセットで設定する | Q2:055 |
| TLS 1.2 (Transport Layer Security) | Snowflakeが転送中データの暗号化に使用するプロトコル。**すべてのSnowflake接続**（Web UI・JDBC・ODBC・Python Connector等）に適用。Data at Rest（AES-256）と対をなす | Q2:058 |
| Data in Transit（転送中のデータ） | ネットワーク上を移動中のデータ。SnowflakeはTLS 1.2でエンドツーエンド暗号化。Data at Rest（保存データ・AES-256）と対比 | Q2:058 |
| Search Access Path（検索アクセスパス） | Search Optimization Serviceが作成する永続的データ構造。ポイントルックアップに必要なデータを保持し検索を高速化。バックグラウンドのメンテナンスサービスが更新する | Q2:061 |
| Scoped URL（スコープドURL） | 認証済みユーザーのみがアクセスできるURL。ロール権限に基づくアクセス制御あり。有効期限は24時間。Pre-signed URL（認証不要）やFile URL（永続参照）とは異なる | Q2:060 |
| File URL（ファイルURL） | ステージ内ファイルへの永続的な参照URL。ファイルの場所を指すがアクセスには認証が必要。Pre-signed URL・Scoped URLとの違いを理解する | Q2:060 |
| Double Colon Cast（`::`キャスト） | Snowflakeの型変換構文。`value::datatype` の形式。CAST関数の簡潔な代替。VARIANT列では `col:key::type` の形でフィールドアクセスと型変換を1文で行う | Q2:067 |
| Dot Notation（ドット記法） | VARIANTカラムのJSON階層をたどる構文。`column:level1.level2` の形式。1階層目はコロン(`:`)、2階層目以降はドット(`.`)で区切る。**要素名は大文字小文字を区別する** | Q2:068 |
| VPS Sharing Restriction（VPS共有制約） | Virtual Private Snowflakeアカウントはメタデータとコンピュートが分離されているため、**Data Sharing機能に制限がある**。通常のアカウントはすべてプロバイダー/コンシューマーの両方になれる | Q2:065 |
| Standard Scaling Policy（スタンダードスケーリングポリシー） | Multi-Cluster WHのスケーリングポリシー。**パフォーマンス優先**。クエリキューを検出するとほぼ即座に追加クラスターを起動。キューイングの防止・最小化が目的 | Q2:069 |
| Economy Scaling Policy（エコノミースケーリングポリシー） | Multi-Cluster WHのスケーリングポリシー。**コスト優先**。キュー発生後も即座には追加せず、追加基準を検証してから起動。クレジット節約が目的 | Q2:069 |
| Clustering Key Indicators（クラスタリングキーの必要性指標） | クラスタリングキーが必要な兆候: ①テーブルが数TB規模 ②クエリが予想より遅い ③パフォーマンスが時間とともに悪化 ④クラスタリング深度が大きい。**列数の多さは無関係** | Q2:070 |
| Serverless Task（サーバーレスタスク） | Snowflakeが自動的にコンピュートリソースを管理するタスク実行モデル。WHの手動管理不要。最大コンピュートサイズは**2X-Large相当**。過去の類似タスク統計を分析して動的にサイジング | Q2:072 |
| Named Internal Stage クローン不可 | 名前付き内部ステージはDB/スキーマクローン時に**クローンされない**。関連するSnowpipeもクローン対象外。Named External Stage（クローン可）、Table Stage（テーブルと一緒にクローン可）とは異なる | Q2:073 |
| Partner Connect | Snowflakeのビジネスパートナーとのトライアルアカウント作成を簡単にする機能。Snowsight内から直接アクセス。サードパーティツールのテストが容易になる | Q2:074 |
| External Function（外部関数） | コード自体はSnowflake**外部**のリモートサービス（AWS Lambda等）で保存・実行されるUDFの一種。Snowflake内部にはリモートサービス呼び出し情報のみ保持。通常のUDF（コード内蔵）とは異なる | Q2:075 |
| ORGADMIN | 組織（Organization）レベルのシステムロール。アカウントの作成・一覧・削除・使用情報閲覧が可能。**アカウント内のデータ（テーブル）にはアクセス不可**（SELECT/UPDATE不可） | Q2:076 |
| Load Metadata（ロードメタデータ） | ロード済みファイルの情報（ファイル名・タイムスタンプ）を記録するメタデータ。同名ファイルの**重複ロードを防止**。ファイルが修正されても同名なら再ロードしない。**64日後に期限切れ** — 期限切れ後のファイルはステータス不明でスキップされる | Q2:080, Q3:003 |
| Table Stage COPY変換制限 | テーブルステージ（`@%table_name`）はCOPYロード時の**基本変換（列順序変更・列省略・型キャスト等）が不可**。Named Internal Stage・External Stage・User Stageでは変換可能 | Q3:002 |
| METERING_HISTORY | ACCOUNT_USAGEスキーマのビュー。**時間単位**のクレジット使用データを提供。開始/終了時刻+サービス別（WH・Snowpipe・Automatic Clustering等）の内訳。METERING_DAILY_HISTORY（日単位）とは異なる | Q3:011 |
| Shared Data（共有データ） | Snowflakeのアーキテクチャを表す正確な用語。データは共有されるが**ディスクは共有されない**。「Shared Disk」ではなく「Shared Data」が正しい表現 | Q3:012 |
| SHARE（共有オブジェクト） | Snowflakeのデータ共有設定オブジェクト。作成・管理にはデフォルトで**ACCOUNTADMINが必要**（アカウントレベル活動のため）。ACCOUNTADMINから他ロールへの権限委任は可能 | Q2:082 |
| Shareable Objects（共有可能オブジェクト） | Direct Data Sharingで共有可能なオブジェクト5種: **Tables, External Tables, Secure Views, Secure Materialized Views, Secure UDFs**。通常（非Secure）のビュー/UDFは共有不可。1 SHAREに1 DBのみ追加可能 | Q2:083 |
| ELT (Extract, Load, Transform) | Snowflakeが推奨するデータパイプラインアプローチ。データを先にSnowflakeにロードし、Snowflakeの処理能力で変換する。ETL（外部変換→ロード）とは逆の順序 | Q2:084 |
| Directory Table File URL（ディレクトリテーブルのFile URL） | Directory Tableが提供するファイルへの参照URL。**長期URLで有効期限なし**（doesn't expire）。Pre-signed URL（短期・設定可能）やScoped URL（24時間）とは異なる | Q2:086 |
| Economy Scaling 6-Minute Rule | Economy policyのスケールアップ条件。新WHが**最低6分間ビジー状態**を維持できるだけの十分なクエリ負荷がある場合のみ追加。スケールダウンは5-6回の連続チェック（1分間隔）で判断 | Q2:091 |
| Caller's Rights / Owner's Rights（呼び出し者権限/所有者権限） | Stored Procedureの実行権限モード。**Caller's Rights**: 呼び出しユーザーの権限で実行。**Owner's Rights**: 作成・所有ロールの権限で実行 | Q2:092 |
| ACCOUNT_USAGE.LOAD_HISTORY | COPYコマンドによるデータロード履歴を365日間保持するビュー。COPY_HISTORYと同様にCOPYロード専用。PIPE_USAGE_HISTORY（Snowpipe用）とは異なる | Q2:093 |
| Clone Privilege Inheritance（クローン権限継承） | クローンされたオブジェクト自体はソースの権限を**継承しない**。ただしDB/スキーマクローン時、**子オブジェクト**（テーブル・スキーマ・ビュー）はソースの権限を**継承する** | Q2:100 |
| File Loading Order（ファイルロード順序） | Snowflakeはファイルが到着順にロードされることを**保証しない**。ロードメタデータで重複防止はするが、順序は非保証 | Q2:098 |
| Database Replication（データベースレプリケーション） | 組織内のSnowflakeアカウント間でDBを複製する機能。**全エディション対応**（最小Standard）。Failover/Failback（Business Critical以上）とは別機能 | Q2:101 |
| External Tokenization（外部トークン化） | 機密データをトークンに置き換えて保護する手法。**列レベルセキュリティ**を実現。Dynamic Data Maskingと同カテゴリ。Row Access Policy（行レベル）とは異なる | Q2:104 |
| Snowpipe Internal Stage Trigger | Internal StageからのSnowpipeは**REST APIでのみ**トリガー可能。クラウド通知ベースのトリガーは不可。External Stageでは通知+REST API両方可 | Q2:106 |
| Proprietary Format（独自フォーマット） | Snowflake独自のデータ保存形式。Parquet/CSV/JSONではない。列指向で圧縮。クラウドオブジェクトストレージ（S3/Azure Blob/GCS）上に保存 | Q2:103 |
| PUT Command | オンプレミスから**内部ステージ**へファイルをアップロードするコマンド。外部ステージには使用不可。GETコマンド（ダウンロード）と対。外部ステージにはクラウドプロバイダーのツールを使用 | Q2:110 |
| GET Command | 内部ステージからオンプレミスへファイルをダウンロードするコマンド。PUTの逆方向。外部ステージには使用不可 | Q2:110 |
| Shared Database Read-Only（共有DB読み取り専用） | Data Sharingでコンシューマーが作成する共有DBは**読み取り専用**。コンシューマーはテーブル/ビューの追加・変更・削除不可。プロバイダーが追加したオブジェクトのみ含まれる | Q2:114 |
| View/Secure Viewストレージ | ViewとSecure ViewはSQL文の定義のみ保持し、**ストレージコストなし**。実行時にクエリが実行される。Materialized View（結果を物理保存）はストレージコストあり | Q3:044 |
| Shared Object Operations（共有オブジェクト操作） | 共有オブジェクトに対してコンシューマーが実行可能な操作は**SELECTのみ**。ALTER/DELETE/DROP/UPDATEは不可。オブジェクト追加も不可 | Q3:042 |
| Snowflake Scripting | SnowflakeのSQL拡張スクリプト言語。構造: **DECLARE**（変数宣言）→ **BEGIN**（ロジック開始）→ **EXCEPTION**（例外処理、オプション）→ **END**（終了）。NOTIFY/PARALLELは存在しない | Q3:048 |
| MV Maintenance Cost Factors（MVメンテナンスコスト要因） | MVのメンテナンスコストに影響する3要素: ①MVの数 ②ベーステーブルのデータ変更頻度・量 ③MVにクラスタリングキーが定義されているか。クエリ頻度は**影響しない** | Q3:047 |
| Suspend Immediately（即時サスペンド） | リソースモニタがクレジット上限到達時に実行する仮想ウェアハウスの強制停止アクション。**実行中のクエリもすべて即座に停止**される。通常のサスペンド（全クエリ完了まで待機）とは動作が異なる | Q3:058 |
| FILES パラメータ | COPY INTOコマンドでロード対象を特定のファイル名で直接指定するパラメータ。`FILES = ('file1.csv', 'file2.csv')` の形式。PATTERN（正規表現）やパス指定とは別のファイル選択方法 | Q3:060 |
| PATTERN パラメータ | COPY INTOコマンドでロード対象を正規表現パターンで指定するパラメータ。`PATTERN = '.*data.*[.]csv'` の形式。FILES（個別指定）やパス指定とは別のファイル選択方法 | Q3:060 |
| Compute Instance（コンピュートインスタンス） | 仮想ウェアハウスを構成する個々のサーバーノード。障害時にSnowflakeが**自動的かつ透過的に交換**し、クエリの中断は発生しない。VWは通常単一AZで動作するが、AZ障害時にはCloud Services Layerが別AZに再プロビジョニング可能 | Q3:062 |
| CURRENT_TASK_GRAPHS | 現在実行中または**今後8日以内に実行予定**のタスクグラフ情報を返すテーブル関数。TASK_HISTORY（過去の履歴）やSHOW TASKS（全タスク定義）やCOMPLETE_TASK_GRAPHS（完了した実行履歴）とは異なる。「現在+未来を見る」関数 | Q3:068 |
| Temporary Table Name Hiding（一時テーブルの名前隠蔽） | 永続/一時的テーブルと同名の一時テーブルを作成すると、そのセッション内で一時テーブルが永続テーブルを**事実上隠す（effectively hides）**。SELECTは一時テーブルに対して実行される。エラーにはならない。セッション終了後に永続テーブルが再び見える | Q3:073 |
| Clonable Objects（クローン可能オブジェクト） | Snowflakeでクローン可能なオブジェクト一覧: **Table, Schema, Database, Stage, File Format, Task, Sequence, Stream**。クローン不可: Virtual Warehouse, Share | Q3:074 |
| Serverless Cost（サーバーレスコスト） | Snowflakeが自動的にバックグラウンドで実行する処理のコスト。MVのメンテナンス、Automatic Clustering、Search Optimization、Snowpipeなどが該当。ユーザーのVWではなくSnowflakeのコンピュートリソースを使用 | Q3:071 |
| S3 Unload Permissions（S3アンロード権限） | SnowflakeからS3へデータをアンロードする際に必要なIAM権限は**s3:PutObject**（書き込み）と**s3:DeleteObject**（一時ファイル削除）の2つのみ。s3:GetObjectとs3:ListBucketはロード（読み込み）時に必要でありアンロードには不要 | Q3:079 |
| Query Result Cache条件 | キャッシュが使用される条件: ①クエリが**構文的に同一**（syntactically identical） ②**マイクロパーティションが未変更** ③実行ロールがテーブル権限を持つ ④キャッシュが24時間以内に生成/使用。**同一ユーザーである必要はない**。新MPが追加されるとキャッシュ無効 | Q3:081 |
| Cross-Region/Cross-Cloud Sharing | リージョンやクラウドプラットフォームをまたいだデータ共有。レプリケーションを通じて実現。**すべてのSnowflakeエディション**（Standard以上）でサポートされるため、最小エディションはStandard | Q3:076 |
| Clustering Key除外データ型 | クラスタリングキーに使用**不可**なデータ型は4つ: **GEOGRAPHY, VARIANT, OBJECT, ARRAY**。GEOMETRYやBINARYを含む他のデータ型は使用可能。GEOGRAPHYは不可だがGEOMETRYは可という紛らわしいポイント | Q3:086 |
| Share Object Contents（シェアオブジェクトの構成要素） | Shareに含まれるもの: ①DB・スキーマへのUSAGE権限 ②共有オブジェクト（テーブル/セキュアビュー等）への権限 ③コンシューマーアカウント。**仮想ウェアハウスは含まれない**。コンシューマーは自分のWHを使用 | Q3:090 |
| Directory Table AUTO_REFRESH | 外部ステージのディレクトリテーブルメタデータを自動更新する設定。`AUTO_REFRESH = TRUE` + クラウドイベント通知で実現。手動更新は`ALTER STAGE REFRESH`。内部ステージは手動更新のみ | Q3:091 |
| MFA Disable（MFA無効化） | ユーザーのMFA登録を管理者が無効化できる。**SECURITYADMIN以上**のロールが必要。無効化後、ユーザーはMFA機能を使うために**再登録が必要**。SYSADMINやUSERADMINでは無効化不可 | Q3:092 |
| AT \| BEFORE clause（AT/BEFORE句） | Time TravelクエリでSnowflakeの過去時点を指定する句。`AT(TIMESTAMP => ...)` / `AT(OFFSET => ...)` / `AT(STATEMENT => ...)` の3オプション。保持期間外またはオブジェクト作成前の時点を指定するとエラーになる | Q3:096 |
| Time Travel Retention Period（タイムトラベル保持期間） | Time Travelデータが保持される期間。Standard版は最大1日、Enterprise版以上は最大90日。デフォルトは1日。保持期間外のTIMESTAMP/OFFSET/STATEMENTを指定するとエラー | Q3:096 |
| EXECUTE AS OWNER | ストアドプロシージャをOwner's Rightsで実行するためのDDLオプション。**デフォルト動作**（省略した場合もOwner's Rightsになる）。作成・所有ロールの権限で実行 | Q3:101 |
| EXECUTE AS CALLER | ストアドプロシージャをCaller's Rightsで実行するためのDDLオプション。明示的に指定した場合のみ有効。呼び出しユーザーのロール権限で実行 | Q3:101 |
| GRANTS_TO_ROLES | ACCOUNT_USAGEスキーマのビュー。ロールに付与されたアクセス権限の情報を提供。過去365日間の付与・取り消し履歴も含む。「ロールへの権限」を追跡する | Q3:103 |
| GRANTS_TO_USERS | ACCOUNT_USAGEスキーマのビュー。ユーザーに付与されたロールの情報を提供。GRANTS_TO_ROLES（ロールへの権限）とは異なり「ユーザーへのロール付与」を追跡する | Q3:103 |
| ACCESS_HISTORY | ACCOUNT_USAGEスキーマのビュー。クエリによるオブジェクトへのアクセス履歴を提供。誰がいつどのオブジェクトにアクセスしたかを追跡する | Q3:103 |
| OBJECT_DEPENDENCIES | ACCOUNT_USAGEスキーマのビュー。Snowflakeオブジェクト間の依存関係を提供。特定オブジェクトを参照しているビュー・タスク等を調べるのに使用 | Q3:103 |
| LOGIN_HISTORY()（テーブル関数） | INFORMATION_SCHEMAのテーブル関数。ユーザーのログイン履歴をほぼリアルタイムで取得できる。ACCOUNT_USAGE（最大3時間遅延）と異なり直近のログイン情報を即時確認可能。`SELECT * FROM TABLE(INFORMATION_SCHEMA.LOGIN_HISTORY(...))` で呼び出す | Q3:104 |
| Standard Stream（スタンダードストリーム） | INSERT・UPDATE・DELETEすべての変更を追跡するストリームタイプ。**外部テーブルには使用不可**（Snowflake内部ストレージの変更を追跡するため） | Q3:105 |
| Append-only Stream（追記専用ストリーム） | 行の追加（INSERT）のみを追跡するストリームタイプ。Snowflake内部テーブル向け。**外部テーブルには使用不可** | Q3:105 |
| Insert-only Stream（挿入専用ストリーム） | INSERTとUPDATE（新行として）を追跡するストリームタイプ。DELETEは無視。**外部テーブルに使用できる唯一のストリームタイプ**。外部テーブルへのファイル追加を追跡するのに使用 | Q3:105 |
| Dedicated Virtual Warehouse（専用仮想ウェアハウス） | 特定のユーザーグループや部門のみが使用するウェアハウス。他の部門の負荷に影響されず最大パフォーマンスを確保できる。**Workload Isolation**の実現手段として重要 | Q3:108 |
| Workload Isolation（ワークロード分離） | 異なるユーザーグループのクエリ処理を独立した仮想ウェアハウスで実行することで、互いの負荷に影響されないようにする設計パターン。複数部門が同一ウェアハウスを共有する問題の解決策 | Q3:108 |
| Natural Clustering（ナチュラルクラスタリング） | 明示的なクラスタリングキーを定義しない場合に、データが**テーブルへの挿入順序**でマイクロパーティションに格納される状態。Snowflakeが自動的にキーを決定するわけではない。日付順でデータが追加されるトランザクションテーブルでは十分機能することが多い | Q3:112 |
| SYSTEM$GLOBAL_ACCOUNT_SET_PARAMETER | ORGADMINロールのみが呼び出せるシステム関数。**ReplicationとFailover/Failback（Client Redirectを含む）を特定アカウントで有効化**するために使用。Automatic Clustering・Data Sharing・Time Travelの有効化には使用しない。アカウントごとに1回呼び出す必要がある | Q3:117 |
| Client Redirect（クライアントリダイレクト） | フェイルオーバー時にクライアントの接続先を別のSnowflakeアカウントに自動的に切り替える機能。SYSTEM$GLOBAL_ACCOUNT_SET_PARAMETERで有効化（Replication/Failoverのサブ機能） | Q3:117 |
| Federated Authentication（フェデレーション認証） | 外部のIdP（IDプロバイダー）でのシングル認証によってSnowflakeにアクセスできる仕組み。**SSO（Single Sign-On）**を実現する。SAML 2.0準拠のIdPと連携。Okta・ADFS・OneLogin・Ping Identity PingOneをネイティブサポート。IdP認証後はSnowflake個別のユーザー名・パスワード入力が不要 | Q3:123 |
| SAML 2.0 (Security Assertion Markup Language) | フェデレーション認証の業界標準プロトコル（バージョン2.0）。Snowflakeはこれに準拠したほぼすべてのIdPと互換性がある。SnowflakeのSSOはSAML 2.0を使用して実装される | Q3:123 |
| MV Column Change/Drop Behavior（列変更・削除時のMV動作） | ベーステーブルの列が**変更または削除**された場合、MVはサスペンドされ**Resume不可**。必ず再作成が必要。※新列「追加」の場合はサスペンドされず継続使用可能（Q3:109と対比） | Q3:119 |
| Resource Monitor Resume Conditions（リソースモニター再開条件） | リソースモニターによるサスペンドは通常のResume操作（管理者手動・SnowSQL等）では解除できない。解除条件: ①次のインターバル開始 ②クレジットクォータ増加 ③サスペンドしきい値増加 ④ウェアハウスをモニターから取り外す（アカウントレベル除く） ⑤モニター自体をDROPする | Q3:125 |
| Put on Hold（保留状態） | リソースモニターがウェアハウスをサスペンドした際の特殊な状態。通常のAUTO_RESUMEやRESUMEコマンドでは解除できない。解除には特定の条件（クォータ変更・インターバル更新等）が必要 | Q3:125 |
| CDP Storage Cost（CDPストレージコスト） | Continuous Data Protection（CDP）の一環として発生するストレージコスト。Time Travel期間中の保持データとFail-safe（7日間）の両方に対して課金される。24時間ごとに保持日数・最終変更日時に基づいて計算される | Q3:128 |
| Time Travel Storage Cost（タイムトラベルストレージコスト） | Time Travel期間中のデータ保持に発生するストレージコスト。無料ではない（True/False問題の頻出トピック）。Transientテーブルはファイルセーフなし・Time Travel 0〜1日でコスト削減可能 | Q3:128 |
| Micro-Partition Metadata Types（マイクロパーティションメタデータの種類） | 各マイクロパーティションに記録されるメタデータ: ①**Range of column values**（列値の範囲=最大値・最小値）②**Count of distinct values**（各列の個別値の数）。これらがPartition Pruningとクエリ最適化に使用される。Mean・Median・Modeは記録されない | Q4:004 |
| Force Reload（強制再ロード） | COPY INTOでロードメタデータが記録された（ロード済みの）ファイルを再ロードする方法。`COPY INTO ... FORCE = TRUE` で指定する。通常はロード済みファイルを自動的にスキップするため、同じファイルを再ロードしたい場合に必要 | Q4:002 |

