-- SQL dump generated using DBML (dbml.dbdiagram.io)
-- Database: SQL Server
-- Generated at: 2025-07-25T02:21:50.413Z

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

EXEC sp_addextendedproperty
@name= N'MS_Description',
@value = N'唯一識別碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'id';

EXEC sp_addextendedproperty
@name= N'MS_Description',
@value = N'請求方向: 1-別人呼叫RBKCP, 2-RBKCP呼叫別人',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'request_direction';

EXEC sp_addextendedproperty
@name= N'MS_Description',
@value = N'請求ID，可用於關聯請求與回應',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'request_id';

EXEC sp_addextendedproperty
@name= N'MS_Description',
@value = N'API端點URL',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'api_endpoint';

EXEC sp_addextendedproperty
@name= N'MS_Description',
@value = N'HTTP方法: GET, POST, PUT, DELETE等',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'http_method';

EXEC sp_addextendedproperty
@name= N'MS_Description',
@value = N'客戶端IP地址',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'client_ip';

EXEC sp_addextendedproperty
@name= N'MS_Description',
@value = N'客戶端User-Agent',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'user_agent';

EXEC sp_addextendedproperty
@name= N'MS_Description',
@value = N'請求標頭JSON格式',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'request_headers';

EXEC sp_addextendedproperty
@name= N'MS_Description',
@value = N'請求內容JSON格式',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'request_body';

EXEC sp_addextendedproperty
@name= N'MS_Description',
@value = N'回應狀態碼',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'response_status_code';

EXEC sp_addextendedproperty
@name= N'MS_Description',
@value = N'回應標頭JSON格式',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'response_headers';

EXEC sp_addextendedproperty
@name= N'MS_Description',
@value = N'回應內容JSON格式',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'response_body';

EXEC sp_addextendedproperty
@name= N'MS_Description',
@value = N'回應時間(毫秒)',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'response_time_ms';

EXEC sp_addextendedproperty
@name= N'MS_Description',
@value = N'錯誤訊息',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'error_message';

EXEC sp_addextendedproperty
@name= N'MS_Description',
@value = N'關聯用戶ID(如果有)',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'user_id';

EXEC sp_addextendedproperty
@name= N'MS_Description',
@value = N'關聯ID，可用於追蹤跨系統請求',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'correlation_id';

EXEC sp_addextendedproperty
@name= N'MS_Description',
@value = N'請求開始時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'request_time';

EXEC sp_addextendedproperty
@name= N'MS_Description',
@value = N'回應完成時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'response_time';

EXEC sp_addextendedproperty
@name= N'MS_Description',
@value = N'建立時間',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'request_log',
@level2type = N'Column', @level2name = 'create_time';
