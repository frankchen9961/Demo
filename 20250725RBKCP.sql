-- SQL dump generated using DBML (dbml.dbdiagram.io)
-- Database: SQL Server
-- Generated at: 2025-07-25T02:21:49.159Z

CREATE TABLE [domain] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(50) NOT NULL,
  [description] nvarchar(200),
  [enable] bit NOT NULL DEFAULT (1),
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL,
  [modify_time] datetime2 NOT NULL,
  [modifier] varchar(20) NOT NULL,
  [deleted] bit NOT NULL DEFAULT (0),
  [delete_time] datetime2,
  [deleter] varchar(20)
);

CREATE TABLE [subdomain] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [domain_id] int NOT NULL,
  [name] nvarchar(50) NOT NULL,
  [description] nvarchar(200),
  [enable] bit NOT NULL DEFAULT (1),
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL,
  [modify_time] datetime2 NOT NULL,
  [modifier] varchar(20) NOT NULL,
  [deleted] bit NOT NULL DEFAULT (0),
  [delete_time] datetime2,
  [deleter] varchar(20)
);

CREATE TABLE [subdomain_department_map] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [department_id] bigint,
  [subdomain_id] int NOT NULL,
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL
);

CREATE TABLE [category] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [subdomain_id] int NOT NULL,
  [parent_id] bigint,
  [name] nvarchar(50) NOT NULL,
  [description] nvarchar(200),
  [enable] bit NOT NULL DEFAULT (1),
  [enable_verify] bit NOT NULL DEFAULT (0),
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL,
  [deleted] bit NOT NULL DEFAULT (0),
  [delete_time] datetime2,
  [deleter] varchar(20)
);

CREATE TABLE [scenario] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [uuid] char(36) UNIQUE NOT NULL,
  [name] nvarchar(50) NOT NULL,
  [description] nvarchar(200),
  [embedding_model] nvarchar(100) NOT NULL,
  [vector_database] nvarchar(100) NOT NULL,
  [enable] bit NOT NULL DEFAULT (1),
  [llm_agent_id] varchar(100),
  [threshold] decimal(5,2),
  [retrieval_empty_response] nvarchar(1000),
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL,
  [modify_time] datetime2,
  [modifier] varchar(20),
  [deleted] bit NOT NULL DEFAULT (0),
  [delete_time] datetime2,
  [deleter] varchar(20)
);

CREATE TABLE [scenario_department_map] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [department_id] bigint,
  [scenario_id] bigint NOT NULL,
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL
);

CREATE TABLE [scenario_chunk_model] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [scenario_id] bigint NOT NULL,
  [model_name] nvarchar(100) NOT NULL,
  [model_type] nvarchar(50) NOT NULL,
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL
);

CREATE TABLE [attachment] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(100) NOT NULL,
  [uuid] char(36) UNIQUE NOT NULL,
  [extension] nvarchar(10) NOT NULL,
  [storage_path] nvarchar(200) NOT NULL,
  [file_size] decimal(18,2) NOT NULL,
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL,
  [deleted] bit NOT NULL DEFAULT (0),
  [delete_time] datetime2,
  [deleter] varchar(20)
);

CREATE TABLE [knowledge_base] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [uuid] char(36) UNIQUE NOT NULL,
  [scenario_id] bigint NOT NULL,
  [name] nvarchar(50) NOT NULL,
  [description] nvarchar(200),
  [current_version_id] bigint,
  [enable] bit NOT NULL,
  [test_collection_name] nvarchar(100),
  [prod_collection_name] nvarchar(100),
  [lock_status] tinyint NOT NULL DEFAULT (0),
  [allow_manual_tag] bit NOT NULL DEFAULT (1),
  [embedding_model] nvarchar(100) NOT NULL,
  [vector_database] nvarchar(100) NOT NULL,
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL,
  [modify_time] datetime2 NOT NULL,
  [modifier] varchar(20) NOT NULL,
  [deleted] bit NOT NULL DEFAULT (0),
  [delete_time] datetime2,
  [deleter] varchar(20)
);

CREATE TABLE [knowledge_base_version] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [uuid] char(36) UNIQUE NOT NULL,
  [kb_id] bigint NOT NULL,
  [version_number] decimal(5,1) NOT NULL,
  [collection_name] nvarchar(100) NOT NULL,
  [description] nvarchar(200),
  [publish_status] tinyint NOT NULL,
  [verify_status] tinyint NOT NULL DEFAULT (0),
  [verify_level] int NOT NULL DEFAULT (1),
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL,
  [modify_time] datetime2 NOT NULL,
  [modifier] varchar(20) NOT NULL,
  [deleted] bit NOT NULL DEFAULT (0),
  [delete_time] datetime2,
  [deleter] varchar(20)
);

CREATE TABLE [knowledge_base_upload] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [knowledge_base_id] bigint NOT NULL,
  [upload_version_id] bigint,
  [upload_start_time] datetime2 NOT NULL,
  [upload_end_time] datetime2,
  [received_time] datetime2,
  [create_time] datetime2 NOT NULL
);

CREATE TABLE [knowledge_base_tag_library_map] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [knowledge_base_id] bigint NOT NULL,
  [tag_library_id] bigint NOT NULL,
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL
);

CREATE TABLE [tag_library] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(20) NOT NULL,
  [description] nvarchar(100),
  [enable] bit NOT NULL DEFAULT (1),
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL,
  [modify_time] datetime2 NOT NULL,
  [modifier] varchar(20) NOT NULL,
  [deleted] bit NOT NULL DEFAULT (0),
  [delete_time] datetime2,
  [deleter] varchar(20)
);

CREATE TABLE [tag] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [tag_key] nvarchar(20) NOT NULL,
  [tag_value] nvarchar(20) NOT NULL,
  [source] tinyint NOT NULL,
  [enable] bit NOT NULL DEFAULT (1),
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL,
  [deleted] bit NOT NULL DEFAULT (0),
  [delete_time] datetime2,
  [deleter] varchar(20)
);

CREATE TABLE [version_verify_log] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [target_type] tinyint NOT NULL,
  [target_version_id] bigint NOT NULL,
  [verify_by] nvarchar(50) NOT NULL,
  [verify_reason] nvarchar(500),
  [verify_action] tinyint NOT NULL,
  [level] tinyint NOT NULL DEFAULT (1),
  [create_time] datetime2 NOT NULL
);

CREATE TABLE [version_verify_level_role_map] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [target_type] tinyint NOT NULL,
  [target_version_id] bigint NOT NULL,
  [level] tinyint NOT NULL,
  [role_id] bigint NOT NULL,
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL
);

CREATE UNIQUE INDEX [UK_role_user] ON [PERMIFY_SERVICE_role_user] ("role_id", "user_id");

CREATE UNIQUE INDEX [idx_scenario_department] ON [scenario_department_map] ("scenario_id", "department_id");

CREATE UNIQUE INDEX [idx_scenario_model_name] ON [scenario_chunk_model] ("scenario_id", "model_name");

CREATE UNIQUE INDEX [idx_kb_version_unique] ON [knowledge_base_version] ("kb_id", "version_number");

CREATE INDEX [idx_kb_tag] ON [knowledge_base_tag_library_map] ("knowledge_base_id", "tag_library_id");

CREATE UNIQUE INDEX [idx_targetver_level_role] ON [version_verify_level_role_map] ("target_type", "target_version_id", "level", "role_id");

CREATE INDEX [idx_targetver_level] ON [version_verify_level_role_map] ("target_type", "target_version_id", "level");

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_department_details',
@level2type = N'Column', @level2name = 'id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'部門代碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_department_details',
@level2type = N'Column', @level2name = 'code';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'部門名稱',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_department_details',
@level2type = N'Column', @level2name = 'name';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'父部門ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_department_details',
@level2type = N'Column', @level2name = 'parent_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_role_details',
@level2type = N'Column', @level2name = 'id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'部門ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_role_details',
@level2type = N'Column', @level2name = 'department_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'角色代碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_role_details',
@level2type = N'Column', @level2name = 'code';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'角色名稱',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_role_details',
@level2type = N'Column', @level2name = 'name';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'角色描述',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_role_details',
@level2type = N'Column', @level2name = 'description';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_role_user',
@level2type = N'Column', @level2name = 'id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'角色ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_role_user',
@level2type = N'Column', @level2name = 'role_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'用戶ID/帳號',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_role_user',
@level2type = N'Column', @level2name = 'user_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'用戶姓名',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_role_user',
@level2type = N'Column', @level2name = 'user_name';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'用戶信箱',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_role_user',
@level2type = N'Column', @level2name = 'email';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_role_user',
@level2type = N'Column', @level2name = 'created_date';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_role_user',
@level2type = N'Column', @level2name = 'created_by';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'最後修改時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_role_user',
@level2type = N'Column', @level2name = 'updated_date';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'最後修改人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_role_user',
@level2type = N'Column', @level2name = 'updated_by';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'domain',
@level2type = N'Column', @level2name = 'id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'主館名稱',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'domain',
@level2type = N'Column', @level2name = 'name';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'主館說明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'domain',
@level2type = N'Column', @level2name = 'description';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'啟用狀態: 0-停用, 1-啟用',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'domain',
@level2type = N'Column', @level2name = 'enable';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'domain',
@level2type = N'Column', @level2name = 'create_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'domain',
@level2type = N'Column', @level2name = 'creator';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'最後修改時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'domain',
@level2type = N'Column', @level2name = 'modify_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'最後修改人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'domain',
@level2type = N'Column', @level2name = 'modifier';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'軟刪除標記: 0-未刪除, 1-已刪除',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'domain',
@level2type = N'Column', @level2name = 'deleted';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'刪除時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'domain',
@level2type = N'Column', @level2name = 'delete_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'刪除人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'domain',
@level2type = N'Column', @level2name = 'deleter';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'subdomain',
@level2type = N'Column', @level2name = 'id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'主館ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'subdomain',
@level2type = N'Column', @level2name = 'domain_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'分館名稱',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'subdomain',
@level2type = N'Column', @level2name = 'name';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'分館說明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'subdomain',
@level2type = N'Column', @level2name = 'description';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'啟用狀態: 0-停用, 1-啟用',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'subdomain',
@level2type = N'Column', @level2name = 'enable';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'subdomain',
@level2type = N'Column', @level2name = 'create_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'subdomain',
@level2type = N'Column', @level2name = 'creator';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'最後修改時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'subdomain',
@level2type = N'Column', @level2name = 'modify_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'最後修改人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'subdomain',
@level2type = N'Column', @level2name = 'modifier';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'軟刪除標記: 0-未刪除, 1-已刪除',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'subdomain',
@level2type = N'Column', @level2name = 'deleted';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'刪除時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'subdomain',
@level2type = N'Column', @level2name = 'delete_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'刪除人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'subdomain',
@level2type = N'Column', @level2name = 'deleter';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'subdomain_department_map',
@level2type = N'Column', @level2name = 'id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'管理部門ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'subdomain_department_map',
@level2type = N'Column', @level2name = 'department_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'分館ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'subdomain_department_map',
@level2type = N'Column', @level2name = 'subdomain_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'subdomain_department_map',
@level2type = N'Column', @level2name = 'create_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'subdomain_department_map',
@level2type = N'Column', @level2name = 'creator';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'category',
@level2type = N'Column', @level2name = 'id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'分館ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'category',
@level2type = N'Column', @level2name = 'subdomain_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'父分類ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'category',
@level2type = N'Column', @level2name = 'parent_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'分類名稱',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'category',
@level2type = N'Column', @level2name = 'name';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'分類說明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'category',
@level2type = N'Column', @level2name = 'description';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'啟用狀態: 0-停用, 1-啟用',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'category',
@level2type = N'Column', @level2name = 'enable';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'是否啟用審核機制: 0-否, 1-是',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'category',
@level2type = N'Column', @level2name = 'enable_verify';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'category',
@level2type = N'Column', @level2name = 'create_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'category',
@level2type = N'Column', @level2name = 'creator';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'軟刪除標記: 0-未刪除, 1-已刪除',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'category',
@level2type = N'Column', @level2name = 'deleted';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'刪除時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'category',
@level2type = N'Column', @level2name = 'delete_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'刪除人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'category',
@level2type = N'Column', @level2name = 'deleter';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'全域唯一識別碼(UUID)',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'uuid';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'場景名稱',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'name';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'場景描述',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'description';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'嵌入模型',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'embedding_model';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'向量資料庫',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'vector_database';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'啟用狀態: 0-停用, 1-啟用',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'enable';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'LLM代理ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'llm_agent_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'切片信心度閾值',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'threshold';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'檢索無結果回應',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'retrieval_empty_response';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'create_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'creator';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'最後修改時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'modify_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'最後修改人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'modifier';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'軟刪除標記: 0-未刪除, 1-已刪除',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'deleted';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'刪除時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'delete_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'刪除人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'deleter';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario_department_map',
@level2type = N'Column', @level2name = 'id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'管理部門ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario_department_map',
@level2type = N'Column', @level2name = 'department_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'場景ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario_department_map',
@level2type = N'Column', @level2name = 'scenario_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario_department_map',
@level2type = N'Column', @level2name = 'create_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario_department_map',
@level2type = N'Column', @level2name = 'creator';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario_chunk_model',
@level2type = N'Column', @level2name = 'id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'場景ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario_chunk_model',
@level2type = N'Column', @level2name = 'scenario_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'模型名稱',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario_chunk_model',
@level2type = N'Column', @level2name = 'model_name';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'模型類型 (e.g., embedding, completion, chat)',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario_chunk_model',
@level2type = N'Column', @level2name = 'model_type';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario_chunk_model',
@level2type = N'Column', @level2name = 'create_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario_chunk_model',
@level2type = N'Column', @level2name = 'creator';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachment',
@level2type = N'Column', @level2name = 'id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'附件檔案名稱',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachment',
@level2type = N'Column', @level2name = 'name';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'全域唯一識別碼(UUID)',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachment',
@level2type = N'Column', @level2name = 'uuid';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'檔案類型',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachment',
@level2type = N'Column', @level2name = 'extension';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'儲存路徑',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachment',
@level2type = N'Column', @level2name = 'storage_path';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'檔案大小',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachment',
@level2type = N'Column', @level2name = 'file_size';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachment',
@level2type = N'Column', @level2name = 'create_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachment',
@level2type = N'Column', @level2name = 'creator';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'軟刪除標記: 0-未刪除, 1-已刪除',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachment',
@level2type = N'Column', @level2name = 'deleted';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'刪除時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachment',
@level2type = N'Column', @level2name = 'delete_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'刪除人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachment',
@level2type = N'Column', @level2name = 'deleter';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'全域唯一識別碼(UUID)',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'uuid';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'場景ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'scenario_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'知識庫名稱',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'name';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'知識庫說明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'description';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'當前版本ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'current_version_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'啟用狀態: 0-停用, 1-啟用',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'enable';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'MongoDB知識庫測試區集合名稱',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'test_collection_name';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'MongoDB知識庫正式區集合名稱',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'prod_collection_name';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'鎖定狀態: 0-未鎖定, 1-手動鎖定, 2-自動鎖定(發布中)]',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'lock_status';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'是否允許手動標籤: 0-不允許, 1-允許',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'allow_manual_tag';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'嵌入模型',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'embedding_model';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'向量資料庫',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'vector_database';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'create_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'creator';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'最後修改時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'modify_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'最後修改人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'modifier';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'軟刪除標記: 0-未刪除, 1-已刪除',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'deleted';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'刪除時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'delete_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'刪除人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'deleter';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_version',
@level2type = N'Column', @level2name = 'id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'全域唯一識別碼(UUID)',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_version',
@level2type = N'Column', @level2name = 'uuid';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'知識庫ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_version',
@level2type = N'Column', @level2name = 'kb_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'版本號碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_version',
@level2type = N'Column', @level2name = 'version_number';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'MongoDB集合名稱',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_version',
@level2type = N'Column', @level2name = 'collection_name';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'版本描述',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_version',
@level2type = N'Column', @level2name = 'description';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'發布狀態: 0-未發布, 1-已發布, 2-歷史版本',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_version',
@level2type = N'Column', @level2name = 'publish_status';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'審核狀態: 0-未送審, 1-審核中, 2-審核完成',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_version',
@level2type = N'Column', @level2name = 'verify_status';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'審核關卡數，1=單關，2=兩關...，決定需幾人/幾階段審核',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_version',
@level2type = N'Column', @level2name = 'verify_level';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_version',
@level2type = N'Column', @level2name = 'create_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_version',
@level2type = N'Column', @level2name = 'creator';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'最後修改時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_version',
@level2type = N'Column', @level2name = 'modify_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'最後修改人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_version',
@level2type = N'Column', @level2name = 'modifier';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'軟刪除標記: 0-未刪除, 1-已刪除',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_version',
@level2type = N'Column', @level2name = 'deleted';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'刪除時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_version',
@level2type = N'Column', @level2name = 'delete_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'刪除人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_version',
@level2type = N'Column', @level2name = 'deleter';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_upload',
@level2type = N'Column', @level2name = 'id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'知識庫ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_upload',
@level2type = N'Column', @level2name = 'knowledge_base_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'已上傳版本ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_upload',
@level2type = N'Column', @level2name = 'upload_version_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'上傳開始時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_upload',
@level2type = N'Column', @level2name = 'upload_start_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'上傳結束時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_upload',
@level2type = N'Column', @level2name = 'upload_end_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'更新完成時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_upload',
@level2type = N'Column', @level2name = 'received_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_upload',
@level2type = N'Column', @level2name = 'create_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_tag_library_map',
@level2type = N'Column', @level2name = 'id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'知識庫ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_tag_library_map',
@level2type = N'Column', @level2name = 'knowledge_base_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'標籤庫ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_tag_library_map',
@level2type = N'Column', @level2name = 'tag_library_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_tag_library_map',
@level2type = N'Column', @level2name = 'create_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_tag_library_map',
@level2type = N'Column', @level2name = 'creator';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag_library',
@level2type = N'Column', @level2name = 'id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'標籤庫名稱',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag_library',
@level2type = N'Column', @level2name = 'name';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'標籤庫說明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag_library',
@level2type = N'Column', @level2name = 'description';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'啟用狀態: 0-停用, 1-啟用',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag_library',
@level2type = N'Column', @level2name = 'enable';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag_library',
@level2type = N'Column', @level2name = 'create_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag_library',
@level2type = N'Column', @level2name = 'creator';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'最後修改時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag_library',
@level2type = N'Column', @level2name = 'modify_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'最後修改人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag_library',
@level2type = N'Column', @level2name = 'modifier';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'軟刪除標記: 0-未刪除, 1-已刪除',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag_library',
@level2type = N'Column', @level2name = 'deleted';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'刪除時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag_library',
@level2type = N'Column', @level2name = 'delete_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'刪除人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag_library',
@level2type = N'Column', @level2name = 'deleter';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag',
@level2type = N'Column', @level2name = 'id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'標籤鍵',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag',
@level2type = N'Column', @level2name = 'tag_key';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'標籤值',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag',
@level2type = N'Column', @level2name = 'tag_value';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'來源: 1-其他, 2-標籤庫, 3-手動輸入',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag',
@level2type = N'Column', @level2name = 'source';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'啟用狀態: 0-停用, 1-啟用',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag',
@level2type = N'Column', @level2name = 'enable';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag',
@level2type = N'Column', @level2name = 'create_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag',
@level2type = N'Column', @level2name = 'creator';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'軟刪除標記: 0-未刪除, 1-已刪除',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag',
@level2type = N'Column', @level2name = 'deleted';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'刪除時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag',
@level2type = N'Column', @level2name = 'delete_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'刪除人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag',
@level2type = N'Column', @level2name = 'deleter';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'version_verify_log',
@level2type = N'Column', @level2name = 'id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'審核對象類型: 1-文件版本, 2-知識庫版本',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'version_verify_log',
@level2type = N'Column', @level2name = 'target_type';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'對象版本ID (document_version.id 或 knowledge_base_version.id)',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'version_verify_log',
@level2type = N'Column', @level2name = 'target_version_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'審核人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'version_verify_log',
@level2type = N'Column', @level2name = 'verify_by';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'審核意見',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'version_verify_log',
@level2type = N'Column', @level2name = 'verify_reason';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'審核動作: 0-退回, 1-通過',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'version_verify_log',
@level2type = N'Column', @level2name = 'verify_action';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'審核關卡，1=第一關，2=第二關...，對應審核階段',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'version_verify_log',
@level2type = N'Column', @level2name = 'level';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'version_verify_log',
@level2type = N'Column', @level2name = 'create_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'version_verify_level_role_map',
@level2type = N'Column', @level2name = 'id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'審核對象類型: 1-文件版本, 2-知識庫版本',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'version_verify_level_role_map',
@level2type = N'Column', @level2name = 'target_type';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'對象版本ID (document_version.id 或 knowledge_base_version.id)',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'version_verify_level_role_map',
@level2type = N'Column', @level2name = 'target_version_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'審核關卡，1=第一關，2=第二關...',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'version_verify_level_role_map',
@level2type = N'Column', @level2name = 'level';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'審核角色ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'version_verify_level_role_map',
@level2type = N'Column', @level2name = 'role_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'version_verify_level_role_map',
@level2type = N'Column', @level2name = 'create_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'version_verify_level_role_map',
@level2type = N'Column', @level2name = 'creator';

ALTER TABLE [PERMIFY_SERVICE_department_details] ADD FOREIGN KEY ([parent_id]) REFERENCES [PERMIFY_SERVICE_department_details] ([id]);

ALTER TABLE [PERMIFY_SERVICE_role_details] ADD FOREIGN KEY ([department_id]) REFERENCES [PERMIFY_SERVICE_department_details] ([id]);

ALTER TABLE [PERMIFY_SERVICE_role_user] ADD FOREIGN KEY ([role_id]) REFERENCES [PERMIFY_SERVICE_role_details] ([id]);

ALTER TABLE [subdomain] ADD FOREIGN KEY ([domain_id]) REFERENCES [domain] ([id]);

ALTER TABLE [subdomain_department_map] ADD FOREIGN KEY ([department_id]) REFERENCES [PERMIFY_SERVICE_department_details] ([id]);

ALTER TABLE [subdomain_department_map] ADD FOREIGN KEY ([subdomain_id]) REFERENCES [subdomain] ([id]);

ALTER TABLE [category] ADD FOREIGN KEY ([subdomain_id]) REFERENCES [subdomain] ([id]);

ALTER TABLE [category] ADD FOREIGN KEY ([parent_id]) REFERENCES [category] ([id]);

ALTER TABLE [scenario_department_map] ADD FOREIGN KEY ([department_id]) REFERENCES [PERMIFY_SERVICE_department_details] ([id]);

ALTER TABLE [scenario_department_map] ADD FOREIGN KEY ([scenario_id]) REFERENCES [scenario] ([id]);

ALTER TABLE [scenario_chunk_model] ADD FOREIGN KEY ([scenario_id]) REFERENCES [scenario] ([id]);

ALTER TABLE [knowledge_base] ADD FOREIGN KEY ([scenario_id]) REFERENCES [scenario] ([id]);

ALTER TABLE [knowledge_base_version] ADD FOREIGN KEY ([kb_id]) REFERENCES [knowledge_base] ([id]);

ALTER TABLE [knowledge_base_upload] ADD FOREIGN KEY ([knowledge_base_id]) REFERENCES [knowledge_base] ([id]);

ALTER TABLE [knowledge_base_tag_library_map] ADD FOREIGN KEY ([knowledge_base_id]) REFERENCES [knowledge_base] ([id]);

ALTER TABLE [knowledge_base_tag_library_map] ADD FOREIGN KEY ([tag_library_id]) REFERENCES [tag_library] ([id]);

ALTER TABLE [version_verify_level_role_map] ADD FOREIGN KEY ([role_id]) REFERENCES [PERMIFY_SERVICE_role_details] ([id]);
