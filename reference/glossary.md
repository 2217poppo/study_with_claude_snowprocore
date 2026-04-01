# Snowflake 用語集

問題を解くたびに蓄積される用語集。試験直前の総復習に活用する。

| 用語 | 説明 | 初出問題 |
|------|------|----------|
| SCIM (System for Cross-domain Identity Management) | 異なるシステム間でユーザーIDを自動プロビジョニングするためのオープン標準プロトコル（v2.0対応） | 001 |
| Identity Provider (IdP) | ユーザーの認証情報を一元管理するサービス（例: Okta, Azure AD） | 001 |
| Auto-provisioning | IdPでのユーザー作成を検知して連携先に自動的にアカウントを作成する仕組み | 001 |
| DAC (Discretionary Access Control) | オブジェクト所有者が任意にアクセス権を付与できるアクセス制御モデル | 001 |
| RBAC (Role-Based Access Control) | ロールに基づいてアクセス権を管理するモデル。Snowflakeの主要なアクセス制御方式 | 001 |
| ABAC (Attribute-Based Access Control) | ユーザー属性に基づくアクセス制御モデル。Snowflakeでは直接サポートされていない | 001 |
