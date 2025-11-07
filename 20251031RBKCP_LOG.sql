-- SQL dump generated using DBML (dbml.dbdiagram.io)
-- Database: SQL Server
-- Generated at: 2025-10-31T09:23:10.344Z

CREATE TABLE [request_log] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [request_direction] tinyint NOT NULL,
  [request_id] nvarchar(100),
  [api_endpoint] nvarchar(500) NOT NULL,
  [http_method] nvarchar(10) NOT NULL,
  [client_ip] nvarchar(45),
  [user_agent] nvarchar(1000),
  [request_headers] nvarchar(max),
  [request_body] nvarchar(max),
  [response_status_code] int,
  [response_headers] nvarchar(max),
  [response_body] nvarchar(max),
  [response_time_ms] int,
  [error_message] nvarchar(1000),
  [user_id] nvarchar(50),
  [correlation_id] nvarchar(100),
  [request_time] datetime2 NOT NULL,
  [response_time] datetime2,
  [create_time] datetime2 NOT NULL DEFAULT (GETDATE())
);

CREATE TABLE [ChatHistory] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [conversation_id] varchar(255) NOT NULL,
  [subject] nvarchar(500) NOT NULL,
  [emp_no] varchar(10) NOT NULL,
  [channel] varchar(100) NOT NULL,
  [ip] varchar(100) NOT NULL,
  [create_time] datetime NOT NULL
);

CREATE TABLE [ChatHistoryMessage] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [chat_history_id] bigint NOT NULL,
  [conversation_id] varchar(50) NOT NULL,
  [transaction_id] varchar(50) NOT NULL,
  [question] nvarchar(max),
  [scenario_id] varchar(36) NOT NULL,
  [knowledge_base_collections] varchar(1000),
  [llm_agent_id] int NOT NULL,
  [tags] nvarchar(1000),
  [stream_response] boolean NOT NULL,
  [success] boolean NOT NULL,
  [error_code] varchar(255),
  [send_date_time] datetime NOT NULL,
  [answer_date_time] datetime,
  [llm_model] varchar(255),
  [rag_api_resp_code] varchar(4),
  [rag_api_resp_message] text,
  [content] nvarchar(max)
);

CREATE TABLE [attachedfiles_history] (
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
  [attachedfiles] nvarchar(max),
  [tags] nvarchar(max),
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
);

CREATE TABLE [doc_view_log] (
  [id] bigint PRIMARY KEY IDENTITY(1, 1),
  [doc_id] varchar(24) NOT NULL,
  [doc_vid] varchar(24) NOT NULL,
  [user_id] nvarchar(20) NOT NULL,
  [view_success] bit NOT NULL,
  [from_page] nvarchar(100),
  [device_type] nvarchar(20),
  [view_time] datetime2 NOT NULL,
  [ip_address] nvarchar(45) NOT NULL,
  [user_agent] nvarchar(500)
);

CREATE INDEX [idx_doc_view_time] ON [doc_view_log] ("doc_id", "view_time");

CREATE INDEX [idx_doc_vid_view_time] ON [doc_view_log] ("doc_vid", "view_time");

CREATE INDEX [idx_user_id] ON [doc_view_log] ("user_id");

CREATE INDEX [idx_view_time] ON [doc_view_log] ("view_time");

CREATE INDEX [idx_doc_user_view] ON [doc_view_log] ("doc_id", "user_id", "view_time");

CREATE INDEX [idx_doc_vid_user_view] ON [doc_view_log] ("doc_id", "doc_vid", "view_time");

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)唯一識別碼@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)請求方向: 1-別人呼叫RBKCP, 2-RBKCP呼叫別人@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'request_direction';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)請求ID，可用於關聯請求與回應@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'request_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)API端點URL@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'api_endpoint';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)HTTP方法: GET, POST, PUT, DELETE等@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'http_method';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)客戶端IP地址@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'client_ip';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)客戶端User-Agent@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'user_agent';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)請求標頭JSON格式@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'request_headers';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)請求內容JSON格式@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'request_body';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)回應狀態碼@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'response_status_code';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)回應標頭JSON格式@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'response_headers';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)回應內容JSON格式@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'response_body';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)回應時間(毫秒)@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'response_time_ms';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)錯誤訊息@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'error_message';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)關聯用戶ID(如果有)@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'user_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)關聯ID，可用於追蹤跨系統請求@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'correlation_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)請求開始時間@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'request_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)回應完成時間@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'response_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)建立時間@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'create_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)唯一識別碼@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistory',
@level2type = N'Column', @level2name = 'id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)對話唯一識別碼@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistory',
@level2type = N'Column', @level2name = 'conversation_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)主題@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistory',
@level2type = N'Column', @level2name = 'subject';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)員工編號@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistory',
@level2type = N'Column', @level2name = 'emp_no';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)通道@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistory',
@level2type = N'Column', @level2name = 'channel';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)IP位址@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistory',
@level2type = N'Column', @level2name = 'ip';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)建立時間@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistory',
@level2type = N'Column', @level2name = 'create_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)唯一識別碼@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistoryMessage',
@level2type = N'Column', @level2name = 'id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)關聯ChatHistory唯一識別碼@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistoryMessage',
@level2type = N'Column', @level2name = 'chat_history_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)對話唯一識別碼@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistoryMessage',
@level2type = N'Column', @level2name = 'conversation_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)交易識別碼@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistoryMessage',
@level2type = N'Column', @level2name = 'transaction_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)使用者問題@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistoryMessage',
@level2type = N'Column', @level2name = 'question';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)場景ID@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistoryMessage',
@level2type = N'Column', @level2name = 'scenario_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)知識庫Collection names@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistoryMessage',
@level2type = N'Column', @level2name = 'knowledge_base_collections';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)LLM Agent ID@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistoryMessage',
@level2type = N'Column', @level2name = 'llm_agent_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)標籤@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistoryMessage',
@level2type = N'Column', @level2name = 'tags';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)Stream response@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistoryMessage',
@level2type = N'Column', @level2name = 'stream_response';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)是否傳送成功@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistoryMessage',
@level2type = N'Column', @level2name = 'success';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)錯誤代碼@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistoryMessage',
@level2type = N'Column', @level2name = 'error_code';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)傳送時間@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistoryMessage',
@level2type = N'Column', @level2name = 'send_date_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)回答時間@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistoryMessage',
@level2type = N'Column', @level2name = 'answer_date_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)LLM Model@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistoryMessage',
@level2type = N'Column', @level2name = 'llm_model';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)RAG API 回應狀態碼@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistoryMessage',
@level2type = N'Column', @level2name = 'rag_api_resp_code';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)RAG API 回應訊息@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistoryMessage',
@level2type = N'Column', @level2name = 'rag_api_resp_message';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)LLM 答案@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistoryMessage',
@level2type = N'Column', @level2name = 'content';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)ID@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_history',
@level2type = N'Column', @level2name = 'id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)附件文件名稱@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_history',
@level2type = N'Column', @level2name = 'name';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)全域唯一識別碼(UUID)@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_history',
@level2type = N'Column', @level2name = 'uuid';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)附件文件ID@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_history',
@level2type = N'Column', @level2name = 'attachedfiles_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)版本號碼@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_history',
@level2type = N'Column', @level2name = 'version_number';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)附件內容類型: 0-一般檔案, 1-組合檔案@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_history',
@level2type = N'Column', @level2name = 'content_type';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)附件檔名@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_history',
@level2type = N'Column', @level2name = 'file_name';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)附件副檔名@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_history',
@level2type = N'Column', @level2name = 'extension';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)儲存路徑@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_history',
@level2type = N'Column', @level2name = 'storage_path';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)檔案大小@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_history',
@level2type = N'Column', @level2name = 'file_size';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)生效時間@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_history',
@level2type = N'Column', @level2name = 'effect_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)檔案匯出類型@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_history',
@level2type = N'Column', @level2name = 'export_type';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)備註說明@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_history',
@level2type = N'Column', @level2name = 'memo';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)檔案組合@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_history',
@level2type = N'Column', @level2name = 'attachedfiles';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)標籤@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_history',
@level2type = N'Column', @level2name = 'tags';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)附件檔案校驗碼@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_history',
@level2type = N'Column', @level2name = 'checksum';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)啟用狀態: 0-停用, 1-啟用@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_history',
@level2type = N'Column', @level2name = 'enable';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)軟刪除標記: 0-未刪除, 1-已刪除@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_history',
@level2type = N'Column', @level2name = 'deleted';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)建立時間@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_history',
@level2type = N'Column', @level2name = 'create_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)建立人員@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_history',
@level2type = N'Column', @level2name = 'creator';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)修改時間@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_history',
@level2type = N'Column', @level2name = 'modify_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)修改人員@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_history',
@level2type = N'Column', @level2name = 'modifier';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)刪除時間@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_history',
@level2type = N'Column', @level2name = 'delete_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)刪除人員@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_history',
@level2type = N'Column', @level2name = 'deleter';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)讀取時間@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'attachedfiles_history',
@level2type = N'Column', @level2name = 'last_access_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)唯一識別碼@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'doc_view_log',
@level2type = N'Column', @level2name = 'id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)文件ID@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'doc_view_log',
@level2type = N'Column', @level2name = 'doc_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)文件版本ID@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'doc_view_log',
@level2type = N'Column', @level2name = 'doc_vid';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)使用者ID@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'doc_view_log',
@level2type = N'Column', @level2name = 'user_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)查看是否成功(1-成功, 0-失敗)@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'doc_view_log',
@level2type = N'Column', @level2name = 'view_success';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)來源頁面@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'doc_view_log',
@level2type = N'Column', @level2name = 'from_page';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)裝置類型: PC, Mobile, Tablet@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'doc_view_log',
@level2type = N'Column', @level2name = 'device_type';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)查看時間@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'doc_view_log',
@level2type = N'Column', @level2name = 'view_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)IP位址@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'doc_view_log',
@level2type = N'Column', @level2name = 'ip_address';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'(REVIEWED)使用者瀏覽器資訊@@N',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'doc_view_log',
@level2type = N'Column', @level2name = 'user_agent';

ALTER TABLE [ChatHistoryMessage] ADD FOREIGN KEY ([chat_history_id]) REFERENCES [ChatHistory] ([id]);
