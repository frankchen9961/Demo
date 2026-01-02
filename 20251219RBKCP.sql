-- SQL dump generated using DBML (dbml.dbdiagram.io)
-- Database: SQL Server
-- Generated at: 2026-01-02T03:56:59.105Z

CREATE TABLE [PERMIFY_SERVICE_department_details] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [code] varchar(50) UNIQUE NOT NULL,
  [name] nvarchar(100) NOT NULL,
  [parent_id] bigint
)
;

CREATE TABLE [PERMIFY_SERVICE_role_details] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [department_id] bigint NOT NULL,
  [code] varchar(50) NOT NULL,
  [name] nvarchar(50) NOT NULL,
  [description] nvarchar(300) NOT NULL
)
;

CREATE TABLE [PERMIFY_SERVICE_role_user] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [role_id] bigint NOT NULL,
  [user_id] varchar(50) NOT NULL,
  [user_name] nvarchar(100) NOT NULL,
  [email] varchar(100),
  [created_date] datetime2 NOT NULL DEFAULT (GETDATE()),
  [created_by] varchar(50) NOT NULL,
  [updated_date] datetime2 NOT NULL DEFAULT (GETDATE()),
  [updated_by] varchar(50) NOT NULL
)
;

CREATE TABLE [PERMIFY_SERVICE_department_role] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [department_id] bigint NOT NULL,
  [role_id] bigint NOT NULL,
  [enable] bit NOT NULL DEFAULT (1),
  [create_time] datetime2 NOT NULL,
  [creator] varchar(50) NOT NULL,
  [modify_time] datetime2,
  [modifier] varchar(50)
)
;

CREATE TABLE [domain] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(50) NOT NULL,
  [description] nvarchar(200),
  [enable] bit NOT NULL DEFAULT (1),
  [sequence] int NOT NULL DEFAULT (0),
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL,
  [modify_time] datetime2 NOT NULL,
  [modifier] varchar(20) NOT NULL,
  [deleted] bit NOT NULL DEFAULT (0),
  [delete_time] datetime2,
  [deleter] varchar(20)
)
;

CREATE TABLE [subdomain] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [domain_id] int NOT NULL,
  [name] nvarchar(50) NOT NULL,
  [description] nvarchar(200),
  [enable] bit NOT NULL DEFAULT (1),
  [sequence] int NOT NULL DEFAULT (0),
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL,
  [modify_time] datetime2 NOT NULL,
  [modifier] varchar(20) NOT NULL,
  [deleted] bit NOT NULL DEFAULT (0),
  [delete_time] datetime2,
  [deleter] varchar(20)
)
;

CREATE TABLE [subdomain_department_map] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [department_id] bigint,
  [subdomain_id] int NOT NULL,
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL
)
;

CREATE TABLE [cate;ry] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [subdomain_id] int NOT NULL,
  [parent_id] bigint,
  [name] nvarchar(50) NOT NULL,
  [description] nvarchar(200),
  [enable] bit NOT NULL DEFAULT (1),
  [enable_verify] bit NOT NULL DEFAULT (0),
  [sequence] int NOT NULL DEFAULT (0),
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL,
  [deleted] bit NOT NULL DEFAULT (0),
  [delete_time] datetime2,
  [deleter] varchar(20)
)
;

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
  [retrieval_empty_call_llm] bit NOT NULL DEFAULT (1),
  [retrieval_empty_response] nvarchar(1000),
  [rerank_model] nvarchar(100),
  [chat_history_llm_model] nvarchar(100),
  [topk] int NOT NULL DEFAULT (5),
  [ir_enable] bit NOT NULL DEFAULT (0),
  [ir_weight] decimal(5,2) NOT NULL DEFAULT (0),
  [vector_search_weight] decimal(5,2) NOT NULL DEFAULT (1),
  [classification] varchar(50) NOT NULL DEFAULT 'internal',
  [sequence] int NOT NULL DEFAULT (0),
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL,
  [modify_time] datetime2,
  [modifier] varchar(20),
  [deleted] bit NOT NULL DEFAULT (0),
  [delete_time] datetime2,
  [deleter] varchar(20)
)
;

CREATE TABLE [scenario_department_map] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [department_id] bigint,
  [scenario_id] bigint NOT NULL,
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL
)
;

CREATE TABLE [scenario_chunk_model] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [scenario_id] bigint NOT NULL,
  [model_name] nvarchar(100) NOT NULL,
  [model_type] nvarchar(50) NOT NULL,
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL
)
;

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
)
;

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
  [sequence] int NOT NULL DEFAULT (0),
  [type] varchar(20) NOT NULL DEFAULT 'general',
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL,
  [modify_time] datetime2 NOT NULL,
  [modifier] varchar(20) NOT NULL,
  [deleted] bit NOT NULL DEFAULT (0),
  [delete_time] datetime2,
  [deleter] varchar(20)
)
;

CREATE TABLE [knowledge_base_version] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [uuid] char(36) UNIQUE NOT NULL,
  [kb_id] bigint NOT NULL,
  [version_number] decimal(5,1) NOT NULL,
  [collection_name] nvarchar(100) NOT NULL,
  [description] nvarchar(200),
  [publish_status] tinyint NOT NULL,
  [verify_status] smallint NOT NULL DEFAULT (-1),
  [verify_user_id] varchar(30),
  [verify_time] datetime2,
  [current_verify_flow_id] bigint,
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL,
  [modify_time] datetime2 NOT NULL,
  [modifier] varchar(20) NOT NULL,
  [deleted] bit NOT NULL DEFAULT (0),
  [delete_time] datetime2,
  [deleter] varchar(20)
)
;

CREATE TABLE [knowledge_base_upload] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [knowledge_base_id] bigint NOT NULL,
  [upload_version_id] bigint,
  [upload_start_time] datetime2 NOT NULL,
  [upload_end_time] datetime2,
  [received_time] datetime2,
  [create_time] datetime2 NOT NULL
)
;

CREATE TABLE [knowledge_base_tag_library_map] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [knowledge_base_id] bigint NOT NULL,
  [tag_library_id] bigint NOT NULL,
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL
)
;

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
)
;

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
)
;

CREATE TABLE [verify_flow_template] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [target_type] tinyint NOT NULL,
  [level] tinyint NOT NULL DEFAULT (1),
  [role_id] bigint NOT NULL,
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL
)
;

CREATE TABLE [verify_flow] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [target_type] tinyint NOT NULL,
  [target_version_id] varchar(50) NOT NULL,
  [level] tinyint NOT NULL,
  [dept_role_id] bigint NOT NULL,
  [role_id] bigint NOT NULL,
  [action] smallint NOT NULL,
  [action_time] datetime2,
  [status] tinyint NOT NULL DEFAULT (0),
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL,
  [modify_time] datetime2 NOT NULL,
  [modifier] varchar(20) NOT NULL
)
;

CREATE TABLE [verify_flow_log] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [target_type] tinyint NOT NULL,
  [target_version_id] varchar(50) NOT NULL,
  [verify_by] varchar(30) NOT NULL,
  [reason] nvarchar(500),
  [action] smallint NOT NULL,
  [level] tinyint NOT NULL DEFAULT (1),
  [sequence] int NOT NULL,
  [creator] varchar(20) NOT NULL,
  [create_time] datetime2 NOT NULL
)
;

CREATE TABLE [dictionary] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(50) NOT NULL,
  [description] nvarchar(500),
  [enable] bit NOT NULL DEFAULT (1),
  [sequence] int NOT NULL DEFAULT (0),
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL,
  [modify_time] datetime2 NOT NULL,
  [modifier] varchar(20) NOT NULL
)
;

CREATE TABLE [dictionary_term] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [dictionary_id] bigint NOT NULL,
  [term] nvarchar(50) NOT NULL,
  [term_type] varchar(20) NOT NULL,
  [master_term_id] bigint,
  [enable] bit NOT NULL DEFAULT (1),
  [sequence] int NOT NULL DEFAULT (0),
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL,
  [modify_time] datetime2 NOT NULL,
  [modifier] varchar(20) NOT NULL
)
;

CREATE TABLE [dictionary_scenario_map] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [dictionary_id] bigint NOT NULL,
  [scenario_id] bigint NOT NULL,
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL
)
;

CREATE TABLE [attachedfiles] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(100) NOT NULL,
  [uuid] char(36) UNIQUE NOT NULL,
  [content_type] nvarchar(10) NOT NULL,
  [enable] bit NOT NULL DEFAULT (0),
  [deleted] bit NOT NULL DEFAULT (0),
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL,
  [modify_time] datetime2,
  [modifier] varchar(20),
  [delete_time] datetime2,
  [deleter] varchar(20),
  [last_access_time] datetime2
)
;

CREATE TABLE [attachedfiles_version] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(100) NOT NULL,
  [uuid] char(36) UNIQUE NOT NULL,
  [attachedfiles_id] bigint NOT NULL,
  [version_number] decimal(5,1) NOT NULL,
  [content_type] nvarchar(10) NOT NULL,
  [file_name] nvarchar(100) NOT NULL,
  [extension] nvarchar(10),
  [storage_path] nvarchar(200),
  [file_size] decimal(18,2) NOT NULL,
  [effect_time] datetime2 NOT NULL,
  [export_type] nvarchar(10),
  [memo] nvarchar(200),
  [checksum] nvarchar(32),
  [enable] bit NOT NULL DEFAULT (0),
  [deleted] bit NOT NULL DEFAULT (0),
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL,
  [modify_time] datetime2,
  [modifier] varchar(20),
  [delete_time] datetime2,
  [deleter] varchar(20),
  [last_access_time] datetime2
)
;

CREATE TABLE [attachedfiles_group] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [group_version_id] bigint NOT NULL,
  [attachedfiles_id] bigint NOT NULL,
  [seq_no] bigint NOT NULL,
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL
)
;

CREATE TABLE [attachedfiles_tag] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [attachedfiles_version_id] bigint NOT NULL,
  [tag_id] bigint NOT NULL,
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL
)
;

CREATE TABLE [directory] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [subdomain_id] int NOT NULL,
  [parent_id] bigint,
  [name] nvarchar(50) NOT NULL,
  [enable] bit NOT NULL DEFAULT (1),
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL,
  [deleted] bit NOT NULL DEFAULT (0),
  [delete_time] datetime2,
  [deleter] varchar(20),
  [sequence] int NOT NULL DEFAULT (0)
)
;

CREATE TABLE [directory_department_map] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [department_id] bigint NOT NULL,
  [directory_id] bigint NOT NULL,
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL
)
;

CREATE TABLE [qa_cate;ry] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [subdomain_id] int NOT NULL,
  [parent_id] bigint,
  [name] nvarchar(50) NOT NULL,
  [description] nvarchar(200),
  [enable] bit NOT NULL DEFAULT (1),
  [sequence] int NOT NULL DEFAULT (0),
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL,
  [modify_time] datetime2,
  [modifier] varchar(20)
)
;

CREATE TABLE [qa_main] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [qa_cate;ry_id] bigint NOT NULL,
  [title] nvarchar(100) NOT NULL,
  [current_version_id] bigint,
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL,
  [modify_time] datetime2,
  [modifier] varchar(20),
  [deleted] bit NOT NULL DEFAULT (0),
  [delete_time] datetime2,
  [deleter] varchar(20)
)
;

CREATE TABLE [qa_main_version] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [qa_main_id] bigint NOT NULL,
  [title] nvarchar(100) NOT NULL,
  [version_number] decimal(5,1) NOT NULL,
  [enable] bit NOT NULL DEFAULT (1),
  [description] nvarchar(500),
  [start_time] datetime2 NOT NULL,
  [end_time] datetime2 NOT NULL,
  [sequence] int NOT NULL DEFAULT (0),
  [draft] bit NOT NULL DEFAULT (1),
  [current_verify_flow_id] bigint,
  [verify_status] smallint NOT NULL DEFAULT (-1),
  [verify_user_id] varchar(30),
  [verify_time] datetime2,
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL,
  [modify_time] datetime2,
  [modifier] varchar(20),
  [deleted] bit NOT NULL DEFAULT (0),
  [delete_time] datetime2,
  [deleter] varchar(20)
)
;

CREATE TABLE [qa_main_version_tag_map] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [qa_main_version_id] bigint NOT NULL,
  [tag_id] bigint NOT NULL,
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL
)
;

CREATE TABLE [qa_question] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [qa_main_version_id] bigint NOT NULL,
  [question_text] nvarchar(1000) NOT NULL,
  [source_type] tinyint NOT NULL,
  [sequence] int NOT NULL DEFAULT (0),
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL,
  [modify_time] datetime2,
  [modifier] varchar(20)
)
;

CREATE TABLE [qa_answer] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [qa_main_version_id] bigint NOT NULL,
  [channel] nvarchar(10) NOT NULL,
  [answer_text] nvarchar(max) NOT NULL,
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL,
  [modify_time] datetime2,
  [modifier] varchar(20)
)
;

CREATE TABLE [qa_version_knowledge_base_version_map] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [qa_main_version_id] bigint NOT NULL,
  [knowledge_base_version_id] bigint NOT NULL,
  [enabled] bit NOT NULL DEFAULT (1),
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL,
  [modify_time] datetime2,
  [modifier] varchar(20)
)
;

CREATE TABLE [dictionary_department_map] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [department_id] bigint NOT NULL,
  [dictionary_id] bigint NOT NULL,
  [create_time] datetime2 NOT NULL,
  [creator] varchar(20) NOT NULL
);

CREATE UNIQUE INDEX [UK_role_user] ON [PERMIFY_SERVICE_role_user] ("role_id", "user_id")
;

CREATE UNIQUE INDEX [UK_department_role] ON [PERMIFY_SERVICE_department_role] ("department_id", "role_id")
;

CREATE UNIQUE INDEX [idx_scenario_department] ON [scenario_department_map] ("scenario_id", "department_id")
;

CREATE UNIQUE INDEX [idx_scenario_model_name] ON [scenario_chunk_model] ("scenario_id", "model_name")
;

CREATE UNIQUE INDEX [idx_kb_version_unique] ON [knowledge_base_version] ("kb_id", "version_number")
;

CREATE INDEX [idx_kb_tag] ON [knowledge_base_tag_library_map] ("knowledge_base_id", "tag_library_id")
;

CREATE UNIQUE INDEX [idx_targetver_level_role] ON [verify_flow] ("target_type", "target_version_id", "level", "role_id")
;

CREATE INDEX [idx_targetver_level] ON [verify_flow] ("target_type", "target_version_id", "level")
;

CREATE UNIQUE INDEX [idx_dict_term_master_id_unique] ON [dictionary_term] ("dictionary_id", "term", "master_term_id")
;

CREATE INDEX [idx_dict_term_type] ON [dictionary_term] ("dictionary_id", "term_type")
;

CREATE INDEX [idx_master_term] ON [dictionary_term] ("master_term_id")
;

CREATE UNIQUE INDEX [idx_dict_scenario_unique] ON [dictionary_scenario_map] ("dictionary_id", "scenario_id")
;

CREATE INDEX [idx_qa_cate;ry_subdomain] ON [qa_cate;ry] ("subdomain_id")
;

CREATE INDEX [idx_qa_cate;ry_parent] ON [qa_cate;ry] ("parent_id")
;

CREATE INDEX [idx_qa_main_cate;ry] ON [qa_main] ("qa_cate;ry_id")
;

CREATE INDEX [idx_qa_main_deleted] ON [qa_main] ("deleted")
;

CREATE INDEX [idx_qa_main_version_main] ON [qa_main_version] ("qa_main_id")
;

CREATE INDEX [idx_qa_main_version_status] ON [qa_main_version] ("qa_main_id", "draft", "verify_status")
;

CREATE INDEX [idx_qa_main_version_deleted] ON [qa_main_version] ("deleted")
;

CREATE UNIQUE INDEX [idx_qa_mainver_tag] ON [qa_main_version_tag_map] ("qa_main_version_id", "tag_id")
;

CREATE INDEX [idx_qa_question_version] ON [qa_question] ("qa_main_version_id")
;

CREATE INDEX [idx_qa_answer_version] ON [qa_answer] ("qa_main_version_id")
;

CREATE INDEX [idx_qa_answer_version_channel] ON [qa_answer] ("qa_main_version_id", "channel")
;

CREATE UNIQUE INDEX [idx_qa_ver_kb] ON [qa_version_knowledge_base_version_map] ("qa_main_version_id", "knowledge_base_version_id")
;

CREATE UNIQUE INDEX [idx_dictionary_department] ON [dictionary_department_map] ("dictionary_id", "department_id")
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_department_details',
@level2type = N'Column', @level2name = 'id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '部門代碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_department_details',
@level2type = N'Column', @level2name = 'code';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '部門名稱',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_department_details',
@level2type = N'Column', @level2name = 'name';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '父部門ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_department_details',
@level2type = N'Column', @level2name = 'parent_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_role_details',
@level2type = N'Column', @level2name = 'id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '部門ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_role_details',
@level2type = N'Column', @level2name = 'department_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '角色代碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_role_details',
@level2type = N'Column', @level2name = 'code';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '角色名稱',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_role_details',
@level2type = N'Column', @level2name = 'name';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '角色描述',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_role_details',
@level2type = N'Column', @level2name = 'description';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_role_user',
@level2type = N'Column', @level2name = 'id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '角色ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_role_user',
@level2type = N'Column', @level2name = 'role_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '用戶ID/帳號',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_role_user',
@level2type = N'Column', @level2name = 'user_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '用戶姓名',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_role_user',
@level2type = N'Column', @level2name = 'user_name';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '用戶信箱',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_role_user',
@level2type = N'Column', @level2name = 'email';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_role_user',
@level2type = N'Column', @level2name = 'created_date';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_role_user',
@level2type = N'Column', @level2name = 'created_by';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '最後修改時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_role_user',
@level2type = N'Column', @level2name = 'updated_date';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '最後修改人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_role_user',
@level2type = N'Column', @level2name = 'updated_by';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_department_role',
@level2type = N'Column', @level2name = 'id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '部門ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_department_role',
@level2type = N'Column', @level2name = 'department_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '角色ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_department_role',
@level2type = N'Column', @level2name = 'role_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '啟用狀態: 0-停用, 1-啟用',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_department_role',
@level2type = N'Column', @level2name = 'enable';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_department_role',
@level2type = N'Column', @level2name = 'create_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_department_role',
@level2type = N'Column', @level2name = 'creator';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '最後修改時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_department_role',
@level2type = N'Column', @level2name = 'modify_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '最後修改人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'PERMIFY_SERVICE_department_role',
@level2type = N'Column', @level2name = 'modifier';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'domain',
@level2type = N'Column', @level2name = 'id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '主館名稱',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'domain',
@level2type = N'Column', @level2name = 'name';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '主館說明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'domain',
@level2type = N'Column', @level2name = 'description';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '啟用狀態: 0-停用, 1-啟用',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'domain',
@level2type = N'Column', @level2name = 'enable';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '序號',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'domain',
@level2type = N'Column', @level2name = 'sequence';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'domain',
@level2type = N'Column', @level2name = 'create_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'domain',
@level2type = N'Column', @level2name = 'creator';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '最後修改時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'domain',
@level2type = N'Column', @level2name = 'modify_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '最後修改人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'domain',
@level2type = N'Column', @level2name = 'modifier';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '軟刪除標記: 0-未刪除, 1-已刪除',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'domain',
@level2type = N'Column', @level2name = 'deleted';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '刪除時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'domain',
@level2type = N'Column', @level2name = 'delete_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '刪除人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'domain',
@level2type = N'Column', @level2name = 'deleter';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'subdomain',
@level2type = N'Column', @level2name = 'id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '主館ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'subdomain',
@level2type = N'Column', @level2name = 'domain_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '分館名稱',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'subdomain',
@level2type = N'Column', @level2name = 'name';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '分館說明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'subdomain',
@level2type = N'Column', @level2name = 'description';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '啟用狀態: 0-停用, 1-啟用',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'subdomain',
@level2type = N'Column', @level2name = 'enable';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '序號',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'subdomain',
@level2type = N'Column', @level2name = 'sequence';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'subdomain',
@level2type = N'Column', @level2name = 'create_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'subdomain',
@level2type = N'Column', @level2name = 'creator';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '最後修改時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'subdomain',
@level2type = N'Column', @level2name = 'modify_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '最後修改人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'subdomain',
@level2type = N'Column', @level2name = 'modifier';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '軟刪除標記: 0-未刪除, 1-已刪除',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'subdomain',
@level2type = N'Column', @level2name = 'deleted';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '刪除時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'subdomain',
@level2type = N'Column', @level2name = 'delete_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '刪除人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'subdomain',
@level2type = N'Column', @level2name = 'deleter';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'subdomain_department_map',
@level2type = N'Column', @level2name = 'id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '管理部門ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'subdomain_department_map',
@level2type = N'Column', @level2name = 'department_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '分館ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'subdomain_department_map',
@level2type = N'Column', @level2name = 'subdomain_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'subdomain_department_map',
@level2type = N'Column', @level2name = 'create_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'subdomain_department_map',
@level2type = N'Column', @level2name = 'creator';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'cate;ry',
@level2type = N'Column', @level2name = 'id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '分館ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'cate;ry',
@level2type = N'Column', @level2name = 'subdomain_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '父分類ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'cate;ry',
@level2type = N'Column', @level2name = 'parent_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '分類名稱',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'cate;ry',
@level2type = N'Column', @level2name = 'name';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '分類說明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'cate;ry',
@level2type = N'Column', @level2name = 'description';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '啟用狀態: 0-停用, 1-啟用',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'cate;ry',
@level2type = N'Column', @level2name = 'enable';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '是否啟用審核機制: 0-否, 1-是',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'cate;ry',
@level2type = N'Column', @level2name = 'enable_verify';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '序號',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'cate;ry',
@level2type = N'Column', @level2name = 'sequence';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'cate;ry',
@level2type = N'Column', @level2name = 'create_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'cate;ry',
@level2type = N'Column', @level2name = 'creator';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '軟刪除標記: 0-未刪除, 1-已刪除',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'cate;ry',
@level2type = N'Column', @level2name = 'deleted';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '刪除時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'cate;ry',
@level2type = N'Column', @level2name = 'delete_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '刪除人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'cate;ry',
@level2type = N'Column', @level2name = 'deleter';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '全域唯一識別碼(UUID)',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'uuid';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '場景名稱',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'name';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '場景描述',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'description';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '嵌入模型',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'embedding_model';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '向量資料庫',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'vector_database';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '啟用狀態: 0-停用, 1-啟用',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'enable';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = 'LLM代理ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'llm_agent_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '切片信心度閾值',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'threshold';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '檢索無結果時是否呼叫LLM: 0-停用, 1-啟用',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'retrieval_empty_call_llm';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '檢索無結果回應',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'retrieval_empty_response';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '重排序模型',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'rerank_model';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '聊天歷史上下文模型',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'chat_history_llm_model';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '檢索結果數量',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'topk';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = 'IR啟用狀態: 0-停用, 1-啟用',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'ir_enable';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = 'IR權重',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'ir_weight';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = 'Vector Search權重',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'vector_search_weight';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '資訊分級',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'classification';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '序號',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'sequence';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'create_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'creator';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '最後修改時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'modify_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '最後修改人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'modifier';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '軟刪除標記: 0-未刪除, 1-已刪除',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'deleted';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '刪除時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'delete_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '刪除人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario',
@level2type = N'Column', @level2name = 'deleter';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario_department_map',
@level2type = N'Column', @level2name = 'id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '管理部門ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario_department_map',
@level2type = N'Column', @level2name = 'department_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '場景ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario_department_map',
@level2type = N'Column', @level2name = 'scenario_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario_department_map',
@level2type = N'Column', @level2name = 'create_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario_department_map',
@level2type = N'Column', @level2name = 'creator';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario_chunk_model',
@level2type = N'Column', @level2name = 'id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '場景ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario_chunk_model',
@level2type = N'Column', @level2name = 'scenario_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '模型名稱',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario_chunk_model',
@level2type = N'Column', @level2name = 'model_name';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '模型類型 (e.g., embedding, completion, chat)',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario_chunk_model',
@level2type = N'Column', @level2name = 'model_type';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario_chunk_model',
@level2type = N'Column', @level2name = 'create_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'scenario_chunk_model',
@level2type = N'Column', @level2name = 'creator';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachment',
@level2type = N'Column', @level2name = 'id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '附件檔案名稱',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachment',
@level2type = N'Column', @level2name = 'name';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '全域唯一識別碼(UUID)',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachment',
@level2type = N'Column', @level2name = 'uuid';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '檔案類型',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachment',
@level2type = N'Column', @level2name = 'extension';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '儲存路徑',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachment',
@level2type = N'Column', @level2name = 'storage_path';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '檔案大小',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachment',
@level2type = N'Column', @level2name = 'file_size';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachment',
@level2type = N'Column', @level2name = 'create_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachment',
@level2type = N'Column', @level2name = 'creator';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '軟刪除標記: 0-未刪除, 1-已刪除',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachment',
@level2type = N'Column', @level2name = 'deleted';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '刪除時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachment',
@level2type = N'Column', @level2name = 'delete_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '刪除人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachment',
@level2type = N'Column', @level2name = 'deleter';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '全域唯一識別碼(UUID)',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'uuid';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '場景ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'scenario_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '知識庫名稱',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'name';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '知識庫說明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'description';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '當前版本ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'current_version_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '啟用狀態: 0-停用, 1-啟用',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'enable';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = 'Mon;DB知識庫測試區集合名稱',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'test_collection_name';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = 'Mon;DB知識庫正式區集合名稱',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'prod_collection_name';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '鎖定狀態: 0-未鎖定, 1-手動鎖定, 2-自動鎖定(發布中)',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'lock_status';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '是否允許手動標籤: 0-不允許, 1-允許',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'allow_manual_tag';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '嵌入模型',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'embedding_model';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '向量資料庫',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'vector_database';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '序號',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'sequence';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '知識庫類型: General(一般知識庫), QA(QA知識庫)',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'type';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'create_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'creator';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '最後修改時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'modify_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '最後修改人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'modifier';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '軟刪除標記: 0-未刪除, 1-已刪除',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'deleted';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '刪除時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'delete_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '刪除人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base',
@level2type = N'Column', @level2name = 'deleter';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_version',
@level2type = N'Column', @level2name = 'id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '全域唯一識別碼(UUID)',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_version',
@level2type = N'Column', @level2name = 'uuid';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '知識庫ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_version',
@level2type = N'Column', @level2name = 'kb_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '版本號碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_version',
@level2type = N'Column', @level2name = 'version_number';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = 'Mon;DB集合名稱',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_version',
@level2type = N'Column', @level2name = 'collection_name';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '版本描述',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_version',
@level2type = N'Column', @level2name = 'description';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '發布狀態: 0-未發布, 1-已發布, 2-歷史版本',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_version',
@level2type = N'Column', @level2name = 'publish_status';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '審核狀態: -1-未送審,0-審核退回, 1-審核中, 2-審核完成',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_version',
@level2type = N'Column', @level2name = 'verify_status';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '送審人員ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_version',
@level2type = N'Column', @level2name = 'verify_user_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '送審時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_version',
@level2type = N'Column', @level2name = 'verify_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '當前審核流程ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_version',
@level2type = N'Column', @level2name = 'current_verify_flow_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_version',
@level2type = N'Column', @level2name = 'create_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_version',
@level2type = N'Column', @level2name = 'creator';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '最後修改時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_version',
@level2type = N'Column', @level2name = 'modify_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '最後修改人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_version',
@level2type = N'Column', @level2name = 'modifier';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '軟刪除標記: 0-未刪除, 1-已刪除',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_version',
@level2type = N'Column', @level2name = 'deleted';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '刪除時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_version',
@level2type = N'Column', @level2name = 'delete_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '刪除人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_version',
@level2type = N'Column', @level2name = 'deleter';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_upload',
@level2type = N'Column', @level2name = 'id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '知識庫ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_upload',
@level2type = N'Column', @level2name = 'knowledge_base_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '已上傳版本ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_upload',
@level2type = N'Column', @level2name = 'upload_version_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '上傳開始時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_upload',
@level2type = N'Column', @level2name = 'upload_start_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '上傳結束時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_upload',
@level2type = N'Column', @level2name = 'upload_end_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '更新完成時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_upload',
@level2type = N'Column', @level2name = 'received_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_upload',
@level2type = N'Column', @level2name = 'create_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_tag_library_map',
@level2type = N'Column', @level2name = 'id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '知識庫ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_tag_library_map',
@level2type = N'Column', @level2name = 'knowledge_base_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '標籤庫ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_tag_library_map',
@level2type = N'Column', @level2name = 'tag_library_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_tag_library_map',
@level2type = N'Column', @level2name = 'create_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'knowledge_base_tag_library_map',
@level2type = N'Column', @level2name = 'creator';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag_library',
@level2type = N'Column', @level2name = 'id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '標籤庫名稱',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag_library',
@level2type = N'Column', @level2name = 'name';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '標籤庫說明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag_library',
@level2type = N'Column', @level2name = 'description';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '啟用狀態: 0-停用, 1-啟用',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag_library',
@level2type = N'Column', @level2name = 'enable';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag_library',
@level2type = N'Column', @level2name = 'create_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag_library',
@level2type = N'Column', @level2name = 'creator';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '最後修改時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag_library',
@level2type = N'Column', @level2name = 'modify_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '最後修改人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag_library',
@level2type = N'Column', @level2name = 'modifier';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '軟刪除標記: 0-未刪除, 1-已刪除',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag_library',
@level2type = N'Column', @level2name = 'deleted';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '刪除時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag_library',
@level2type = N'Column', @level2name = 'delete_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '刪除人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag_library',
@level2type = N'Column', @level2name = 'deleter';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag',
@level2type = N'Column', @level2name = 'id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '標籤鍵',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag',
@level2type = N'Column', @level2name = 'tag_key';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '標籤值',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag',
@level2type = N'Column', @level2name = 'tag_value';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '來源: 1-其他, 2-標籤庫, 3-手動輸入',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag',
@level2type = N'Column', @level2name = 'source';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '啟用狀態: 0-停用, 1-啟用',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag',
@level2type = N'Column', @level2name = 'enable';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag',
@level2type = N'Column', @level2name = 'create_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag',
@level2type = N'Column', @level2name = 'creator';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '軟刪除標記: 0-未刪除, 1-已刪除',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag',
@level2type = N'Column', @level2name = 'deleted';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '刪除時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag',
@level2type = N'Column', @level2name = 'delete_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '刪除人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'tag',
@level2type = N'Column', @level2name = 'deleter';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'verify_flow_template',
@level2type = N'Column', @level2name = 'id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '審核對象類型: 1-文件版本, 2-知識庫版本,3-QA版本',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'verify_flow_template',
@level2type = N'Column', @level2name = 'target_type';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '審核關卡，1=第一關，2=第二關...，對應審核階段',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'verify_flow_template',
@level2type = N'Column', @level2name = 'level';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '審核角色ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'verify_flow_template',
@level2type = N'Column', @level2name = 'role_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'verify_flow_template',
@level2type = N'Column', @level2name = 'create_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'verify_flow_template',
@level2type = N'Column', @level2name = 'creator';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'verify_flow',
@level2type = N'Column', @level2name = 'id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '審核對象類型: 1-文件版本, 2-知識庫版本,3-QA版本',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'verify_flow',
@level2type = N'Column', @level2name = 'target_type';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '對象版本ID (document_version.id 或 knowledge_base_version.id)',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'verify_flow',
@level2type = N'Column', @level2name = 'target_version_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '審核關卡，1=第一關，2=第二關...',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'verify_flow',
@level2type = N'Column', @level2name = 'level';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '審核角色ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'verify_flow',
@level2type = N'Column', @level2name = 'dept_role_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '審核角色ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'verify_flow',
@level2type = N'Column', @level2name = 'role_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '審核動作: -1-待審核, 0-退回, 1-通過',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'verify_flow',
@level2type = N'Column', @level2name = 'action';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '動作時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'verify_flow',
@level2type = N'Column', @level2name = 'action_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '狀態: 0-未完成, 1-已完成',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'verify_flow',
@level2type = N'Column', @level2name = 'status';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'verify_flow',
@level2type = N'Column', @level2name = 'create_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'verify_flow',
@level2type = N'Column', @level2name = 'creator';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '最後修改時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'verify_flow',
@level2type = N'Column', @level2name = 'modify_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '最後修改人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'verify_flow',
@level2type = N'Column', @level2name = 'modifier';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'verify_flow_log',
@level2type = N'Column', @level2name = 'id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '審核對象類型: 1-文件版本, 2-知識庫版本, 3-QA版本',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'verify_flow_log',
@level2type = N'Column', @level2name = 'target_type';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '對象版本ID (knowledge_base_version.id)',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'verify_flow_log',
@level2type = N'Column', @level2name = 'target_version_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '審核人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'verify_flow_log',
@level2type = N'Column', @level2name = 'verify_by';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '審核意見',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'verify_flow_log',
@level2type = N'Column', @level2name = 'reason';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '審核動作: 0-退回, 1-通過',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'verify_flow_log',
@level2type = N'Column', @level2name = 'action';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '審核關卡，1=第一關，2=第二關...，對應審核階段',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'verify_flow_log',
@level2type = N'Column', @level2name = 'level';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '審核順序，從1開始遞增',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'verify_flow_log',
@level2type = N'Column', @level2name = 'sequence';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'verify_flow_log',
@level2type = N'Column', @level2name = 'creator';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'verify_flow_log',
@level2type = N'Column', @level2name = 'create_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'dictionary',
@level2type = N'Column', @level2name = 'id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '辭典名稱',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'dictionary',
@level2type = N'Column', @level2name = 'name';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '辭典描述',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'dictionary',
@level2type = N'Column', @level2name = 'description';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '啟用狀態: 0-停用, 1-啟用',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'dictionary',
@level2type = N'Column', @level2name = 'enable';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '序號',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'dictionary',
@level2type = N'Column', @level2name = 'sequence';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'dictionary',
@level2type = N'Column', @level2name = 'create_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'dictionary',
@level2type = N'Column', @level2name = 'creator';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '最後修改時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'dictionary',
@level2type = N'Column', @level2name = 'modify_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '最後修改人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'dictionary',
@level2type = N'Column', @level2name = 'modifier';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'dictionary_term',
@level2type = N'Column', @level2name = 'id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '辭典ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'dictionary_term',
@level2type = N'Column', @level2name = 'dictionary_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '詞條內容',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'dictionary_term',
@level2type = N'Column', @level2name = 'term';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '詞條類型: synonym(同義詞)',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'dictionary_term',
@level2type = N'Column', @level2name = 'term_type';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '主詞ID (主從關係)',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'dictionary_term',
@level2type = N'Column', @level2name = 'master_term_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '啟用狀態: 0-停用, 1-啟用',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'dictionary_term',
@level2type = N'Column', @level2name = 'enable';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '序號',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'dictionary_term',
@level2type = N'Column', @level2name = 'sequence';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'dictionary_term',
@level2type = N'Column', @level2name = 'create_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'dictionary_term',
@level2type = N'Column', @level2name = 'creator';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '最後修改時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'dictionary_term',
@level2type = N'Column', @level2name = 'modify_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '最後修改人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'dictionary_term',
@level2type = N'Column', @level2name = 'modifier';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'dictionary_scenario_map',
@level2type = N'Column', @level2name = 'id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '辭典ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'dictionary_scenario_map',
@level2type = N'Column', @level2name = 'dictionary_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '場景ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'dictionary_scenario_map',
@level2type = N'Column', @level2name = 'scenario_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'dictionary_scenario_map',
@level2type = N'Column', @level2name = 'create_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'dictionary_scenario_map',
@level2type = N'Column', @level2name = 'creator';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles',
@level2type = N'Column', @level2name = 'id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '附件文件名稱',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles',
@level2type = N'Column', @level2name = 'name';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '全域唯一識別碼(UUID)',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles',
@level2type = N'Column', @level2name = 'uuid';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '附件內容類型: 0-一般檔案, 1-組合檔案',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles',
@level2type = N'Column', @level2name = 'content_type';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '啟用狀態: 0-停用, 1-啟用',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles',
@level2type = N'Column', @level2name = 'enable';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '軟刪除標記: 0-未刪除, 1-已刪除',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles',
@level2type = N'Column', @level2name = 'deleted';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles',
@level2type = N'Column', @level2name = 'create_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles',
@level2type = N'Column', @level2name = 'creator';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '修改時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles',
@level2type = N'Column', @level2name = 'modify_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '修改人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles',
@level2type = N'Column', @level2name = 'modifier';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '刪除時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles',
@level2type = N'Column', @level2name = 'delete_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '刪除人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles',
@level2type = N'Column', @level2name = 'deleter';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '最後存取時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles',
@level2type = N'Column', @level2name = 'last_access_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_version',
@level2type = N'Column', @level2name = 'id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '附件文件名稱',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_version',
@level2type = N'Column', @level2name = 'name';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '全域唯一識別碼(UUID)',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_version',
@level2type = N'Column', @level2name = 'uuid';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '附件文件ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_version',
@level2type = N'Column', @level2name = 'attachedfiles_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '版本號碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_version',
@level2type = N'Column', @level2name = 'version_number';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '附件內容類型: 0-一般檔案, 1-組合檔案',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_version',
@level2type = N'Column', @level2name = 'content_type';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '附件檔名',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_version',
@level2type = N'Column', @level2name = 'file_name';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '附件副檔名',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_version',
@level2type = N'Column', @level2name = 'extension';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '儲存路徑',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_version',
@level2type = N'Column', @level2name = 'storage_path';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '檔案大小',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_version',
@level2type = N'Column', @level2name = 'file_size';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '生效時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_version',
@level2type = N'Column', @level2name = 'effect_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '檔案匯出類型',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_version',
@level2type = N'Column', @level2name = 'export_type';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '備註說明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_version',
@level2type = N'Column', @level2name = 'memo';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '附件檔案校驗碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_version',
@level2type = N'Column', @level2name = 'checksum';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '啟用狀態: 0-停用, 1-啟用',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_version',
@level2type = N'Column', @level2name = 'enable';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '軟刪除標記: 0-未刪除, 1-已刪除',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_version',
@level2type = N'Column', @level2name = 'deleted';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_version',
@level2type = N'Column', @level2name = 'create_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_version',
@level2type = N'Column', @level2name = 'creator';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '修改時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_version',
@level2type = N'Column', @level2name = 'modify_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '修改人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_version',
@level2type = N'Column', @level2name = 'modifier';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '刪除時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_version',
@level2type = N'Column', @level2name = 'delete_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '刪除人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_version',
@level2type = N'Column', @level2name = 'deleter';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '讀取時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_version',
@level2type = N'Column', @level2name = 'last_access_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_group',
@level2type = N'Column', @level2name = 'id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '組合文件版本ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_group',
@level2type = N'Column', @level2name = 'group_version_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '文件ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_group',
@level2type = N'Column', @level2name = 'attachedfiles_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '順序',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_group',
@level2type = N'Column', @level2name = 'seq_no';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_group',
@level2type = N'Column', @level2name = 'create_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_group',
@level2type = N'Column', @level2name = 'creator';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_tag',
@level2type = N'Column', @level2name = 'id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '附件文件版本ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_tag',
@level2type = N'Column', @level2name = 'attachedfiles_version_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '標籤ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_tag',
@level2type = N'Column', @level2name = 'tag_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_tag',
@level2type = N'Column', @level2name = 'create_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_tag',
@level2type = N'Column', @level2name = 'creator';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = 'ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'directory',
@level2type = N'Column', @level2name = 'id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '分館ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'directory',
@level2type = N'Column', @level2name = 'subdomain_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '父階層ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'directory',
@level2type = N'Column', @level2name = 'parent_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '階層名稱',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'directory',
@level2type = N'Column', @level2name = 'name';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '啟用狀態: 0-停用, 1-啟用',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'directory',
@level2type = N'Column', @level2name = 'enable';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'directory',
@level2type = N'Column', @level2name = 'create_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'directory',
@level2type = N'Column', @level2name = 'creator';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '軟刪除標記: 0-未刪除, 1-已刪除',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'directory',
@level2type = N'Column', @level2name = 'deleted';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '刪除時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'directory',
@level2type = N'Column', @level2name = 'delete_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '刪除人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'directory',
@level2type = N'Column', @level2name = 'deleter';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '序號',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'directory',
@level2type = N'Column', @level2name = 'sequence';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'directory_department_map',
@level2type = N'Column', @level2name = 'id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '管理部門ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'directory_department_map',
@level2type = N'Column', @level2name = 'department_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '階層ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'directory_department_map',
@level2type = N'Column', @level2name = 'directory_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'directory_department_map',
@level2type = N'Column', @level2name = 'create_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'directory_department_map',
@level2type = N'Column', @level2name = 'creator';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_cate;ry',
@level2type = N'Column', @level2name = 'id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '分館ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_cate;ry',
@level2type = N'Column', @level2name = 'subdomain_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '父分類ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_cate;ry',
@level2type = N'Column', @level2name = 'parent_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '分類名稱',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_cate;ry',
@level2type = N'Column', @level2name = 'name';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '分類說明',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_cate;ry',
@level2type = N'Column', @level2name = 'description';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '啟用狀態: 0-停用, 1-啟用',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_cate;ry',
@level2type = N'Column', @level2name = 'enable';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '序號',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_cate;ry',
@level2type = N'Column', @level2name = 'sequence';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_cate;ry',
@level2type = N'Column', @level2name = 'create_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_cate;ry',
@level2type = N'Column', @level2name = 'creator';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '修改時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_cate;ry',
@level2type = N'Column', @level2name = 'modify_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '修改人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_cate;ry',
@level2type = N'Column', @level2name = 'modifier';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_main',
@level2type = N'Column', @level2name = 'id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = 'QA分類ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_main',
@level2type = N'Column', @level2name = 'qa_cate;ry_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '問題標題',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_main',
@level2type = N'Column', @level2name = 'title';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '當前版本ID (參照 qa_main_version.id，因循環依賴不加外鍵約束)',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_main',
@level2type = N'Column', @level2name = 'current_version_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_main',
@level2type = N'Column', @level2name = 'create_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_main',
@level2type = N'Column', @level2name = 'creator';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '修改時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_main',
@level2type = N'Column', @level2name = 'modify_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '修改人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_main',
@level2type = N'Column', @level2name = 'modifier';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '軟刪除標記: 0-未刪除, 1-已刪除',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_main',
@level2type = N'Column', @level2name = 'deleted';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '刪除時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_main',
@level2type = N'Column', @level2name = 'delete_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '刪除人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_main',
@level2type = N'Column', @level2name = 'deleter';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_main_version',
@level2type = N'Column', @level2name = 'id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = 'QA主表ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_main_version',
@level2type = N'Column', @level2name = 'qa_main_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = 'QA標題',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_main_version',
@level2type = N'Column', @level2name = 'title';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '版本號碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_main_version',
@level2type = N'Column', @level2name = 'version_number';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '啟用狀態: 0-停用, 1-啟用',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_main_version',
@level2type = N'Column', @level2name = 'enable';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = 'QA描述',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_main_version',
@level2type = N'Column', @level2name = 'description';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '上架時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_main_version',
@level2type = N'Column', @level2name = 'start_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '下架時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_main_version',
@level2type = N'Column', @level2name = 'end_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '序號',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_main_version',
@level2type = N'Column', @level2name = 'sequence';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '草稿狀態: 0-正式版, 1-草稿',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_main_version',
@level2type = N'Column', @level2name = 'draft';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '當前審核流程ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_main_version',
@level2type = N'Column', @level2name = 'current_verify_flow_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '審核狀態: -1-未送審,0-審核退回, 1-審核中, 2-審核完成',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_main_version',
@level2type = N'Column', @level2name = 'verify_status';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '送審人員ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_main_version',
@level2type = N'Column', @level2name = 'verify_user_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '送審時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_main_version',
@level2type = N'Column', @level2name = 'verify_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_main_version',
@level2type = N'Column', @level2name = 'create_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_main_version',
@level2type = N'Column', @level2name = 'creator';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '修改時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_main_version',
@level2type = N'Column', @level2name = 'modify_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '修改人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_main_version',
@level2type = N'Column', @level2name = 'modifier';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '軟刪除標記: 0-未刪除, 1-已刪除',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_main_version',
@level2type = N'Column', @level2name = 'deleted';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '刪除時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_main_version',
@level2type = N'Column', @level2name = 'delete_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '刪除人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_main_version',
@level2type = N'Column', @level2name = 'deleter';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_main_version_tag_map',
@level2type = N'Column', @level2name = 'id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = 'QA主表版本ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_main_version_tag_map',
@level2type = N'Column', @level2name = 'qa_main_version_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '標籤ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_main_version_tag_map',
@level2type = N'Column', @level2name = 'tag_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_main_version_tag_map',
@level2type = N'Column', @level2name = 'create_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_main_version_tag_map',
@level2type = N'Column', @level2name = 'creator';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_question',
@level2type = N'Column', @level2name = 'id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = 'QA主表版本ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_question',
@level2type = N'Column', @level2name = 'qa_main_version_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '問題內容',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_question',
@level2type = N'Column', @level2name = 'question_text';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '來源類型: 1-手動(manual), 2-自動(auto)',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_question',
@level2type = N'Column', @level2name = 'source_type';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '序號',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_question',
@level2type = N'Column', @level2name = 'sequence';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_question',
@level2type = N'Column', @level2name = 'create_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_question',
@level2type = N'Column', @level2name = 'creator';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '修改時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_question',
@level2type = N'Column', @level2name = 'modify_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '修改人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_question',
@level2type = N'Column', @level2name = 'modifier';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_answer',
@level2type = N'Column', @level2name = 'id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = 'QA主表版本ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_answer',
@level2type = N'Column', @level2name = 'qa_main_version_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '渠道類型',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_answer',
@level2type = N'Column', @level2name = 'channel';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '答案內容',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_answer',
@level2type = N'Column', @level2name = 'answer_text';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_answer',
@level2type = N'Column', @level2name = 'create_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_answer',
@level2type = N'Column', @level2name = 'creator';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '修改時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_answer',
@level2type = N'Column', @level2name = 'modify_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '修改人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_answer',
@level2type = N'Column', @level2name = 'modifier';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_version_knowledge_base_version_map',
@level2type = N'Column', @level2name = 'id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = 'QA主表版本ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_version_knowledge_base_version_map',
@level2type = N'Column', @level2name = 'qa_main_version_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '知識庫版本ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_version_knowledge_base_version_map',
@level2type = N'Column', @level2name = 'knowledge_base_version_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '啟用狀態: 0-停用, 1-啟用',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_version_knowledge_base_version_map',
@level2type = N'Column', @level2name = 'enabled';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_version_knowledge_base_version_map',
@level2type = N'Column', @level2name = 'create_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_version_knowledge_base_version_map',
@level2type = N'Column', @level2name = 'creator';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '修改時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_version_knowledge_base_version_map',
@level2type = N'Column', @level2name = 'modify_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '修改人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'qa_version_knowledge_base_version_map',
@level2type = N'Column', @level2name = 'modifier';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'dictionary_department_map',
@level2type = N'Column', @level2name = 'id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '管理部門ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'dictionary_department_map',
@level2type = N'Column', @level2name = 'department_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '辭典ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'dictionary_department_map',
@level2type = N'Column', @level2name = 'dictionary_id';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'dictionary_department_map',
@level2type = N'Column', @level2name = 'create_time';
;

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = '建立人員',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'dictionary_department_map',
@level2type = N'Column', @level2name = 'creator';
;

ALTER TABLE [PERMIFY_SERVICE_department_details] ADD FOREIGN KEY ([parent_id]) REFERENCES [PERMIFY_SERVICE_department_details] ([id])
;

ALTER TABLE [PERMIFY_SERVICE_role_details] ADD FOREIGN KEY ([department_id]) REFERENCES [PERMIFY_SERVICE_department_details] ([id])
;

ALTER TABLE [PERMIFY_SERVICE_role_user] ADD FOREIGN KEY ([role_id]) REFERENCES [PERMIFY_SERVICE_role_details] ([id])
;

ALTER TABLE [PERMIFY_SERVICE_department_role] ADD FOREIGN KEY ([department_id]) REFERENCES [PERMIFY_SERVICE_department_details] ([id])
;

ALTER TABLE [PERMIFY_SERVICE_department_role] ADD FOREIGN KEY ([role_id]) REFERENCES [PERMIFY_SERVICE_role_details] ([id])
;

ALTER TABLE [subdomain] ADD FOREIGN KEY ([domain_id]) REFERENCES [domain] ([id])
;

ALTER TABLE [subdomain_department_map] ADD FOREIGN KEY ([department_id]) REFERENCES [PERMIFY_SERVICE_department_details] ([id])
;

ALTER TABLE [subdomain_department_map] ADD FOREIGN KEY ([subdomain_id]) REFERENCES [subdomain] ([id])
;

ALTER TABLE [cate;ry] ADD FOREIGN KEY ([subdomain_id]) REFERENCES [subdomain] ([id])
;

ALTER TABLE [cate;ry] ADD FOREIGN KEY ([parent_id]) REFERENCES [cate;ry] ([id])
;

ALTER TABLE [scenario_department_map] ADD FOREIGN KEY ([department_id]) REFERENCES [PERMIFY_SERVICE_department_details] ([id])
;

ALTER TABLE [scenario_department_map] ADD FOREIGN KEY ([scenario_id]) REFERENCES [scenario] ([id])
;

ALTER TABLE [scenario_chunk_model] ADD FOREIGN KEY ([scenario_id]) REFERENCES [scenario] ([id])
;

ALTER TABLE [knowledge_base] ADD FOREIGN KEY ([scenario_id]) REFERENCES [scenario] ([id])
;

ALTER TABLE [knowledge_base_version] ADD FOREIGN KEY ([kb_id]) REFERENCES [knowledge_base] ([id])
;

ALTER TABLE [knowledge_base_upload] ADD FOREIGN KEY ([knowledge_base_id]) REFERENCES [knowledge_base] ([id])
;

ALTER TABLE [knowledge_base_tag_library_map] ADD FOREIGN KEY ([knowledge_base_id]) REFERENCES [knowledge_base] ([id])
;

ALTER TABLE [knowledge_base_tag_library_map] ADD FOREIGN KEY ([tag_library_id]) REFERENCES [tag_library] ([id])
;

ALTER TABLE [verify_flow_template] ADD FOREIGN KEY ([role_id]) REFERENCES [PERMIFY_SERVICE_role_details] ([id])
;

ALTER TABLE [verify_flow] ADD FOREIGN KEY ([dept_role_id]) REFERENCES [PERMIFY_SERVICE_department_role] ([id])
;

ALTER TABLE [verify_flow] ADD FOREIGN KEY ([role_id]) REFERENCES [PERMIFY_SERVICE_role_details] ([id])
;

ALTER TABLE [dictionary_term] ADD FOREIGN KEY ([dictionary_id]) REFERENCES [dictionary] ([id])
;

ALTER TABLE [dictionary_term] ADD FOREIGN KEY ([master_term_id]) REFERENCES [dictionary_term] ([id])
;

ALTER TABLE [dictionary_scenario_map] ADD FOREIGN KEY ([dictionary_id]) REFERENCES [dictionary] ([id])
;

ALTER TABLE [dictionary_scenario_map] ADD FOREIGN KEY ([scenario_id]) REFERENCES [scenario] ([id])
;

ALTER TABLE [attachedfiles_version] ADD FOREIGN KEY ([attachedfiles_id]) REFERENCES [attachedfiles] ([id])
;

ALTER TABLE [attachedfiles_group] ADD FOREIGN KEY ([attachedfiles_id]) REFERENCES [attachedfiles] ([id])
;

ALTER TABLE [attachedfiles_tag] ADD FOREIGN KEY ([attachedfiles_version_id]) REFERENCES [attachedfiles_version] ([id])
;

ALTER TABLE [directory] ADD FOREIGN KEY ([parent_id]) REFERENCES [directory] ([id])
;

ALTER TABLE [directory_department_map] ADD FOREIGN KEY ([directory_id]) REFERENCES [directory] ([id])
;

ALTER TABLE [qa_cate;ry] ADD FOREIGN KEY ([subdomain_id]) REFERENCES [subdomain] ([id])
;

ALTER TABLE [qa_cate;ry] ADD FOREIGN KEY ([parent_id]) REFERENCES [qa_cate;ry] ([id])
;

ALTER TABLE [qa_main] ADD FOREIGN KEY ([qa_cate;ry_id]) REFERENCES [qa_cate;ry] ([id])
;

ALTER TABLE [qa_main_version] ADD FOREIGN KEY ([qa_main_id]) REFERENCES [qa_main] ([id])
;

ALTER TABLE [qa_main_version_tag_map] ADD FOREIGN KEY ([qa_main_version_id]) REFERENCES [qa_main_version] ([id])
;

ALTER TABLE [qa_main_version_tag_map] ADD FOREIGN KEY ([tag_id]) REFERENCES [tag] ([id])
;

ALTER TABLE [qa_question] ADD FOREIGN KEY ([qa_main_version_id]) REFERENCES [qa_main_version] ([id])
;

ALTER TABLE [qa_answer] ADD FOREIGN KEY ([qa_main_version_id]) REFERENCES [qa_main_version] ([id])
;

ALTER TABLE [qa_version_knowledge_base_version_map] ADD FOREIGN KEY ([qa_main_version_id]) REFERENCES [qa_main_version] ([id])
;

ALTER TABLE [qa_version_knowledge_base_version_map] ADD FOREIGN KEY ([knowledge_base_version_id]) REFERENCES [knowledge_base_version] ([id])
;

ALTER TABLE [dictionary_department_map] ADD FOREIGN KEY ([department_id]) REFERENCES [PERMIFY_SERVICE_department_details] ([id])
;

ALTER TABLE [dictionary_department_map] ADD FOREIGN KEY ([dictionary_id]) REFERENCES [dictionary] ([id])
;
