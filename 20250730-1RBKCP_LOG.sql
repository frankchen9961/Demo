-- SQL dump generated using DBML (dbml.dbdiagram.io)
-- Database: SQL Server
-- Generated at: 2025-07-30T07:07:48.219Z

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

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'請求方向: 1-別人呼叫RBKCP, 2-RBKCP呼叫別人',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'request_direction';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'請求ID，可用於關聯請求與回應',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'request_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'API端點URL',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'api_endpoint';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'HTTP方法: GET, POST, PUT, DELETE等',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'http_method';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'客戶端IP地址',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'client_ip';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'客戶端User-Agent',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'user_agent';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'請求標頭JSON格式',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'request_headers';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'請求內容JSON格式',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'request_body';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'回應狀態碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'response_status_code';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'回應標頭JSON格式',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'response_headers';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'回應內容JSON格式',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'response_body';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'回應時間(毫秒)',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'response_time_ms';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'錯誤訊息',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'error_message';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'關聯用戶ID(如果有)',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'user_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'關聯ID，可用於追蹤跨系統請求',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'correlation_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'請求開始時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'request_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'回應完成時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'response_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'create_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistory',
@level2type = N'Column', @level2name = 'id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'對話唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistory',
@level2type = N'Column', @level2name = 'conversation_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'主題',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistory',
@level2type = N'Column', @level2name = 'subject';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'員工編號',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistory',
@level2type = N'Column', @level2name = 'emp_no';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'通道',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistory',
@level2type = N'Column', @level2name = 'channel';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'IP位址',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistory',
@level2type = N'Column', @level2name = 'ip';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistory',
@level2type = N'Column', @level2name = 'create_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistoryMessage',
@level2type = N'Column', @level2name = 'id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'關聯ChatHistory唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistoryMessage',
@level2type = N'Column', @level2name = 'chat_history_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'對話唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistoryMessage',
@level2type = N'Column', @level2name = 'conversation_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'交易識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistoryMessage',
@level2type = N'Column', @level2name = 'transaction_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'使用者問題',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistoryMessage',
@level2type = N'Column', @level2name = 'question';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'場景ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistoryMessage',
@level2type = N'Column', @level2name = 'scenario_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'知識庫Collection names',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistoryMessage',
@level2type = N'Column', @level2name = 'knowledge_base_collections';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'LLM Agent ID',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistoryMessage',
@level2type = N'Column', @level2name = 'llm_agent_id';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'標籤',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistoryMessage',
@level2type = N'Column', @level2name = 'tags';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'Stream response',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistoryMessage',
@level2type = N'Column', @level2name = 'stream_response';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'是否傳送成功',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistoryMessage',
@level2type = N'Column', @level2name = 'success';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'錯誤代碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistoryMessage',
@level2type = N'Column', @level2name = 'error_code';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'傳送時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistoryMessage',
@level2type = N'Column', @level2name = 'send_date_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'回答時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistoryMessage',
@level2type = N'Column', @level2name = 'answer_date_time';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'LLM Model',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistoryMessage',
@level2type = N'Column', @level2name = 'llm_model';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'RAG API 回應狀態碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistoryMessage',
@level2type = N'Column', @level2name = 'rag_api_resp_code';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'RAG API 回應訊息',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistoryMessage',
@level2type = N'Column', @level2name = 'rag_api_resp_message';

EXEC sp_addextendedproperty
@name = N'MS_Description',
@value = N'LLM 答案',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'ChatHistoryMessage',
@level2type = N'Column', @level2name = 'content';

ALTER TABLE [ChatHistoryMessage] ADD FOREIGN KEY ([chat_history_id]) REFERENCES [ChatHistory] ([id]);
