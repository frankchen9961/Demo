

CREATE TABLE ChatHistory (
	id bigint IDENTITY(1,1) NOT NULL,
	conversation_id varchar(255) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	subject nvarchar(500) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	emp_no varchar(10) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	channel varchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	ip varchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	create_time datetime NOT NULL,
	CONSTRAINT PK__ChatHist__3213E83F72EAE598 PRIMARY KEY (id)
);


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)唯一識別碼@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'ChatHistory', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)對話唯一識別碼@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'ChatHistory', @level2type=N'Column', @level2name=N'conversation_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)對話主題@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'ChatHistory', @level2type=N'Column', @level2name=N'subject';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)員工編號@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'ChatHistory', @level2type=N'Column', @level2name=N'emp_no';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)通道@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'ChatHistory', @level2type=N'Column', @level2name=N'channel';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)IP位址@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'ChatHistory', @level2type=N'Column', @level2name=N'ip';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'ChatHistory', @level2type=N'Column', @level2name=N'create_time';



CREATE TABLE MAIL_SERVICE_HISTORY (
	transId varchar(64) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	businessId varchar(32) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	templateId int NULL,
	title nvarchar(MAX) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	content nvarchar(MAX) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	mailTo varchar(MAX) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	sendTime datetime NOT NULL,
	status varchar(10) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	CONSTRAINT PK__MAIL_SER__DB107FA7C53885FA PRIMARY KEY (transId)
);



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)PK，紀錄編號@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'MAIL_SERVICE_HISTORY', @level2type=N'Column', @level2name=N'transId';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)業務別@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'MAIL_SERVICE_HISTORY', @level2type=N'Column', @level2name=N'businessId';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)樣板代號@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'MAIL_SERVICE_HISTORY', @level2type=N'Column', @level2name=N'templateId';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)郵件標題@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'MAIL_SERVICE_HISTORY', @level2type=N'Column', @level2name=N'title';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)郵件內文@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'MAIL_SERVICE_HISTORY', @level2type=N'Column', @level2name=N'content';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)收件人@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'MAIL_SERVICE_HISTORY', @level2type=N'Column', @level2name=N'mailTo';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)發送時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'MAIL_SERVICE_HISTORY', @level2type=N'Column', @level2name=N'sendTime';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)發送結果@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'MAIL_SERVICE_HISTORY', @level2type=N'Column', @level2name=N'status';



CREATE TABLE SCHEDULE_SERVICE_job_step (
	id bigint IDENTITY(1,1) NOT NULL,
	job_code varchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	start_time datetime2 DEFAULT getdate() NOT NULL,
	end_time datetime2 NULL,
	status varchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	read_count int DEFAULT 0 NOT NULL,
	filter_count int DEFAULT 0 NOT NULL,
	write_count int DEFAULT 0 NOT NULL,
	remark nvarchar(MAX) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	trans_id varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	machine varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	service_name varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL
);
ALTER TABLE dbo.SCHEDULE_SERVICE_job_step WITH NOCHECK ADD CONSTRAINT CK_SCHEDULE_SERVICE_job_step_status CHECK (([status]='TIMEOUT' OR [status]='EXCEPTION' OR [status]='FAIL' OR [status]='COMPLETE' OR [status]='EXECUTE'));


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)ID@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_step', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)批次代號@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_step', @level2type=N'Column', @level2name=N'job_code';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)開始時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_step', @level2type=N'Column', @level2name=N'start_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)結束時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_step', @level2type=N'Column', @level2name=N'end_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)狀態@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_step', @level2type=N'Column', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)讀取筆數@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_step', @level2type=N'Column', @level2name=N'read_count';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)過濾筆數@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_step', @level2type=N'Column', @level2name=N'filter_count';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)寫入筆數@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_step', @level2type=N'Column', @level2name=N'write_count';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)備註@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_step', @level2type=N'Column', @level2name=N'remark';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)交易序號@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_step', @level2type=N'Column', @level2name=N'trans_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)HostName@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_step', @level2type=N'Column', @level2name=N'machine';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)Service名稱@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_step', @level2type=N'Column', @level2name=N'service_name';


CREATE TABLE TRACK_SERVICE_operation_record (
	id bigint IDENTITY(1,1) NOT NULL,
	username varchar(30) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	ip varchar(30) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	url varchar(300) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	[method] varchar(10) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	request_time datetime2 NOT NULL,
	request_body nvarchar(MAX) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	response_time datetime2 NULL,
	response_status tinyint NULL,
	response_body nvarchar(MAX) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	token varchar(MAX) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	function_type varchar(30) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	function_code varchar(30) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	soc_flag bit DEFAULT 0 NOT NULL,
	[security] bit DEFAULT 0 NOT NULL,
	CONSTRAINT PK__TRACK_SE__3213E83FF287714A PRIMARY KEY (id)
);
 CREATE NONCLUSTERED INDEX idx_TRACK_SERVICE_operation_record ON dbo.TRACK_SERVICE_operation_record (  username ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)ID@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'TRACK_SERVICE_operation_record', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)使用者帳號@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'TRACK_SERVICE_operation_record', @level2type=N'Column', @level2name=N'username';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)使用者IP@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'TRACK_SERVICE_operation_record', @level2type=N'Column', @level2name=N'ip';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)API URL@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'TRACK_SERVICE_operation_record', @level2type=N'Column', @level2name=N'url';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)API method@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'TRACK_SERVICE_operation_record', @level2type=N'Column', @level2name=N'method';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)請求時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'TRACK_SERVICE_operation_record', @level2type=N'Column', @level2name=N'request_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)請求內容@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'TRACK_SERVICE_operation_record', @level2type=N'Column', @level2name=N'request_body';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)回傳時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'TRACK_SERVICE_operation_record', @level2type=N'Column', @level2name=N'response_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)回傳狀態@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'TRACK_SERVICE_operation_record', @level2type=N'Column', @level2name=N'response_status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)回傳內容@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'TRACK_SERVICE_operation_record', @level2type=N'Column', @level2name=N'response_body';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)Bearer Token@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'TRACK_SERVICE_operation_record', @level2type=N'Column', @level2name=N'token';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)功能代碼@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'TRACK_SERVICE_operation_record', @level2type=N'Column', @level2name=N'function_type';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)操作代碼@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'TRACK_SERVICE_operation_record', @level2type=N'Column', @level2name=N'function_code';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)機敏註記@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'TRACK_SERVICE_operation_record', @level2type=N'Column', @level2name=N'soc_flag';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)已轉檔(0：否，1：是)@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'TRACK_SERVICE_operation_record', @level2type=N'Column', @level2name=N'security';


CREATE TABLE request_log (
	id bigint IDENTITY(1,1) NOT NULL,
	request_direction tinyint NOT NULL,
	request_id nvarchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	api_endpoint nvarchar(500) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	http_method nvarchar(10) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	client_ip nvarchar(45) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	user_agent nvarchar(1000) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	request_headers nvarchar(MAX) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	request_body nvarchar(MAX) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	response_status_code int NULL,
	response_headers nvarchar(MAX) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	response_body nvarchar(MAX) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	response_time_ms int NULL,
	error_message nvarchar(1000) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	user_id nvarchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	correlation_id nvarchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	request_time datetime2 NOT NULL,
	response_time datetime2 NULL,
	create_time datetime2 DEFAULT getdate() NOT NULL,
	CONSTRAINT PK__request___3213E83F49797850 PRIMARY KEY (id)
);


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)唯一識別碼@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'request_log', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)請求方向: 1-別人呼叫RBKCP, 2-RBKCP呼叫別人@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'request_log', @level2type=N'Column', @level2name=N'request_direction';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)請求ID，可用於關聯請求與回應@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'request_log', @level2type=N'Column', @level2name=N'request_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)API端點URL@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'request_log', @level2type=N'Column', @level2name=N'api_endpoint';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)HTTP方法: GET, POST, PUT, DELETE等@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'request_log', @level2type=N'Column', @level2name=N'http_method';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)客戶端IP地址@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'request_log', @level2type=N'Column', @level2name=N'client_ip';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)客戶端User-Agent@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'request_log', @level2type=N'Column', @level2name=N'user_agent';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)請求標頭JSON格式@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'request_log', @level2type=N'Column', @level2name=N'request_headers';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)請求內容JSON格式@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'request_log', @level2type=N'Column', @level2name=N'request_body';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)回應狀態碼@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'request_log', @level2type=N'Column', @level2name=N'response_status_code';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)回應標頭JSON格式@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'request_log', @level2type=N'Column', @level2name=N'response_headers';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)回應內容JSON格式@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'request_log', @level2type=N'Column', @level2name=N'response_body';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)回應時間(毫秒)@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'request_log', @level2type=N'Column', @level2name=N'response_time_ms';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)錯誤訊息@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'request_log', @level2type=N'Column', @level2name=N'error_message';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)關聯用戶ID(如果有)@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'request_log', @level2type=N'Column', @level2name=N'user_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)關聯ID，可用於追蹤跨系統請求@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'request_log', @level2type=N'Column', @level2name=N'correlation_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)請求開始時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'request_log', @level2type=N'Column', @level2name=N'request_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)回應完成時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'request_log', @level2type=N'Column', @level2name=N'response_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'request_log', @level2type=N'Column', @level2name=N'create_time';


CREATE TABLE ChatHistoryMessage (
	id bigint IDENTITY(1,1) NOT NULL,
	chat_history_id bigint NOT NULL,
	conversation_id varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	transaction_id varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	question nvarchar(MAX) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	scenario_id varchar(36) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	knowledge_base_collections varchar(1000) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	llm_agent_id int NOT NULL,
	tags nvarchar(1000) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	stream_response bit NOT NULL,
	success bit NOT NULL,
	error_code varchar(255) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	send_date_time datetime NOT NULL,
	answer_date_time datetime NULL,
	llm_model varchar(255) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	rag_api_resp_code varchar(4) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	rag_api_resp_message text COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	content nvarchar(MAX) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	CONSTRAINT PK__ChatHist__3213E83FFD0B312E PRIMARY KEY (id),
	CONSTRAINT FK_ChatHistoryMessage_ChatHistory FOREIGN KEY (chat_history_id) REFERENCES ChatHistory(id)
);


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)唯一識別碼@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'ChatHistoryMessage', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)關聯ChatHistory唯一識別碼@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'ChatHistoryMessage', @level2type=N'Column', @level2name=N'chat_history_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)對話唯一識別碼@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'ChatHistoryMessage', @level2type=N'Column', @level2name=N'conversation_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)交易識別碼@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'ChatHistoryMessage', @level2type=N'Column', @level2name=N'transaction_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)使用者問題@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'ChatHistoryMessage', @level2type=N'Column', @level2name=N'question';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)場景ID@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'ChatHistoryMessage', @level2type=N'Column', @level2name=N'scenario_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)知識庫Collection names@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'ChatHistoryMessage', @level2type=N'Column', @level2name=N'knowledge_base_collections';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)LLM Agent ID@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'ChatHistoryMessage', @level2type=N'Column', @level2name=N'llm_agent_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)標籤@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'ChatHistoryMessage', @level2type=N'Column', @level2name=N'tags';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)Stream response@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'ChatHistoryMessage', @level2type=N'Column', @level2name=N'stream_response';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)是否傳送成功@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'ChatHistoryMessage', @level2type=N'Column', @level2name=N'success';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)錯誤代碼@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'ChatHistoryMessage', @level2type=N'Column', @level2name=N'error_code';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)傳送時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'ChatHistoryMessage', @level2type=N'Column', @level2name=N'send_date_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)回答時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'ChatHistoryMessage', @level2type=N'Column', @level2name=N'answer_date_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)LLM Model@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'ChatHistoryMessage', @level2type=N'Column', @level2name=N'llm_model';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)RAG API 回應狀態碼@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'ChatHistoryMessage', @level2type=N'Column', @level2name=N'rag_api_resp_code';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)RAG API 回應訊息@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'ChatHistoryMessage', @level2type=N'Column', @level2name=N'rag_api_resp_message';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)LLM 答案@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'ChatHistoryMessage', @level2type=N'Column', @level2name=N'content';