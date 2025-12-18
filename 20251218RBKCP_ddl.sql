
CREATE TABLE AI_PORTAL_system_parameter
(
    id          int IDENTITY (1,1) NOT NULL,
    service     varchar(50)        NOT NULL,
    [group]     varchar(50)        NOT NULL,
    [key]       varchar(50)        NOT NULL,
    [type]      varchar(10)        NOT NULL,
    [option]    varchar(300)       NULL,
    value       nvarchar(MAX)      NULL,
    description nvarchar(MAX)      NULL,
    enable      bit DEFAULT 1      NOT NULL,
    create_time datetime2          NOT NULL,
    creator     varchar(50)        NOT NULL,
    modify_time datetime2          NULL,
    modifier    varchar(50)        NULL,
    CONSTRAINT PK__AI_PORTA__3213E83F8FCACED2 PRIMARY KEY (id)
);
CREATE UNIQUE NONCLUSTERED INDEX idx_AI_PORTAL_system_parameter ON AI_PORTAL_system_parameter (service ASC, [group] ASC, [key] ASC)
    WITH ( PAD_INDEX = OFF ,FILLFACTOR = 100 ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON )
    ON [PRIMARY];

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)id@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'AI_PORTAL_system_parameter', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)服務@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'AI_PORTAL_system_parameter', @level2type=N'Column', @level2name=N'service';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)群組@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'AI_PORTAL_system_parameter', @level2type=N'Column', @level2name=N'group';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)參數@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'AI_PORTAL_system_parameter', @level2type=N'Column', @level2name=N'key';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)類型@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'AI_PORTAL_system_parameter', @level2type=N'Column', @level2name=N'type';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)選項@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'AI_PORTAL_system_parameter', @level2type=N'Column', @level2name=N'option';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)值@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'AI_PORTAL_system_parameter', @level2type=N'Column', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)說明@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'AI_PORTAL_system_parameter', @level2type=N'Column', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)啟用(true：是，false：否)@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'AI_PORTAL_system_parameter', @level2type=N'Column', @level2name=N'enable';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'AI_PORTAL_system_parameter', @level2type=N'Column', @level2name=N'create_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'AI_PORTAL_system_parameter', @level2type=N'Column', @level2name=N'creator';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後修改時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'AI_PORTAL_system_parameter', @level2type=N'Column', @level2name=N'modify_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後修改人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'AI_PORTAL_system_parameter', @level2type=N'Column', @level2name=N'modifier';






CREATE TABLE dbo.MAIL_SERVICE_SETTING (
	templateId int IDENTITY(1,1) NOT NULL,
	businessId varchar(32) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	title nvarchar(MAX) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	content nvarchar(MAX) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	mailTo varchar(MAX) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	creator varchar(10) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	processDate datetime NOT NULL,
	enable bit NOT NULL,
	CONSTRAINT PK__MAIL_SER__530F3800C6893388 PRIMARY KEY (templateId)
);



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)PK，樣板代號@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'MAIL_SERVICE_SETTING', @level2type=N'Column', @level2name=N'templateId';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)業務別@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'MAIL_SERVICE_SETTING', @level2type=N'Column', @level2name=N'businessId';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)郵件標題@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'MAIL_SERVICE_SETTING', @level2type=N'Column', @level2name=N'title';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)郵件內文@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'MAIL_SERVICE_SETTING', @level2type=N'Column', @level2name=N'content';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)收件人@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'MAIL_SERVICE_SETTING', @level2type=N'Column', @level2name=N'mailTo';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)新增人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'MAIL_SERVICE_SETTING', @level2type=N'Column', @level2name=N'creator';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)處理日期@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'MAIL_SERVICE_SETTING', @level2type=N'Column', @level2name=N'processDate';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)是否啟用@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'MAIL_SERVICE_SETTING', @level2type=N'Column', @level2name=N'enable';






CREATE TABLE dbo.PERMIFY_SERVICE_action_details (
	id bigint IDENTITY(1,1) NOT NULL,
	function_id bigint NOT NULL,
	code varchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	description nvarchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	enable bit DEFAULT 1 NOT NULL,
	create_time datetime2 NOT NULL,
	creator varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	modify_time datetime2 NULL,
	modifier varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	CONSTRAINT PK__PERMIFY___3213E83FAFA14A02 PRIMARY KEY (id)
);



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)id@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_action_details', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)功能@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_action_details', @level2type=N'Column', @level2name=N'function_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)操作代碼@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_action_details', @level2type=N'Column', @level2name=N'code';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)說明@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_action_details', @level2type=N'Column', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)啟用(0：停用，1：啟用)@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_action_details', @level2type=N'Column', @level2name=N'enable';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_action_details', @level2type=N'Column', @level2name=N'create_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_action_details', @level2type=N'Column', @level2name=N'creator';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後修改時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_action_details', @level2type=N'Column', @level2name=N'modify_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後修改人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_action_details', @level2type=N'Column', @level2name=N'modifier';






CREATE TABLE dbo.PERMIFY_SERVICE_department_details (
	id bigint IDENTITY(1,1) NOT NULL,
	code varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	name nvarchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	create_time datetime2 NOT NULL,
	creator varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	modify_time datetime2 NULL,
	modifier varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	parent_id bigint NULL,
	enable bit DEFAULT 1 NOT NULL,
	CONSTRAINT PK__PERMIFY___3213E83F06A961F5 PRIMARY KEY (id)
);
 CREATE  UNIQUE NONCLUSTERED INDEX idx_PERMIFY_SERVICE_department_details ON dbo.PERMIFY_SERVICE_department_details (  code ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)唯一識別碼@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_department_details', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)部門代碼@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_department_details', @level2type=N'Column', @level2name=N'code';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)部門名稱@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_department_details', @level2type=N'Column', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_department_details', @level2type=N'Column', @level2name=N'create_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_department_details', @level2type=N'Column', @level2name=N'creator';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後修改時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_department_details', @level2type=N'Column', @level2name=N'modify_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後修改人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_department_details', @level2type=N'Column', @level2name=N'modifier';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)父部門ID@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_department_details', @level2type=N'Column', @level2name=N'parent_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)啟用@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_department_details', @level2type=N'Column', @level2name=N'enable';






CREATE TABLE dbo.PERMIFY_SERVICE_field_details (
	id bigint IDENTITY(1,1) NOT NULL,
	[type] varchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	[key] varchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	label nvarchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	enable bit DEFAULT 1 NOT NULL,
	create_time datetime2 NOT NULL,
	creator varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	modify_time datetime2 NULL,
	modifier varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	need_auth bit DEFAULT 1 NOT NULL,
	CONSTRAINT PK__PERMIFY___3213E83F75022CCD PRIMARY KEY (id)
);



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)id@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_field_details', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)元素類型(input、select、checkbox…)@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_field_details', @level2type=N'Column', @level2name=N'type';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)欄位代碼(前端比對及取用的關鍵 Key 值)@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_field_details', @level2type=N'Column', @level2name=N'key';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)欄位名稱@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_field_details', @level2type=N'Column', @level2name=N'label';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)啟用@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_field_details', @level2type=N'Column', @level2name=N'enable';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_field_details', @level2type=N'Column', @level2name=N'create_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_field_details', @level2type=N'Column', @level2name=N'creator';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後修改時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_field_details', @level2type=N'Column', @level2name=N'modify_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後修改人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_field_details', @level2type=N'Column', @level2name=N'modifier';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)need_auth@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_field_details', @level2type=N'Column', @level2name=N'need_auth';






CREATE TABLE dbo.PERMIFY_SERVICE_function_details (
	id bigint IDENTITY(1,1) NOT NULL,
	code varchar(30) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	name nvarchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	parent_id bigint NULL,
	sort tinyint DEFAULT 0 NOT NULL,
	enable bit DEFAULT 1 NOT NULL,
	project_name nvarchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	project_url nvarchar(300) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	module_name nvarchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	create_time datetime2 NOT NULL,
	creator varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	modify_time datetime2 NULL,
	modifier varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	need_auth bit DEFAULT 1 NOT NULL,
	CONSTRAINT PK__PERMIFY___3213E83FC6C5E3F9 PRIMARY KEY (id)
);
 CREATE  UNIQUE NONCLUSTERED INDEX idx_PERMIFY_SERVICE_function_details ON dbo.PERMIFY_SERVICE_function_details (  code ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)id@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_function_details', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)功能代碼@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_function_details', @level2type=N'Column', @level2name=N'code';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)功能名稱@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_function_details', @level2type=N'Column', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)父層選單@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_function_details', @level2type=N'Column', @level2name=N'parent_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)排序(小到大)@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_function_details', @level2type=N'Column', @level2name=N'sort';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)啟用(0：停用，1：啟用)@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_function_details', @level2type=N'Column', @level2name=N'enable';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)Remote 專案名稱@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_function_details', @level2type=N'Column', @level2name=N'project_name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)Remote 網址（remoteEntry.js 連結）@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_function_details', @level2type=N'Column', @level2name=N'project_url';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)Remote 模組名稱@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_function_details', @level2type=N'Column', @level2name=N'module_name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_function_details', @level2type=N'Column', @level2name=N'create_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_function_details', @level2type=N'Column', @level2name=N'creator';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後修改時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_function_details', @level2type=N'Column', @level2name=N'modify_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後修改人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_function_details', @level2type=N'Column', @level2name=N'modifier';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)need_auth@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_function_details', @level2type=N'Column', @level2name=N'need_auth';






CREATE TABLE dbo.PERMIFY_SERVICE_function_field (
	id bigint IDENTITY(1,1) NOT NULL,
	function_id bigint NOT NULL,
	field_id bigint NOT NULL,
	create_time datetime2 NOT NULL,
	creator varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	CONSTRAINT PK__PERMIFY___3213E83FF6FC3284 PRIMARY KEY (id)
);



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)id@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_function_field', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)功能@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_function_field', @level2type=N'Column', @level2name=N'function_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)欄位@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_function_field', @level2type=N'Column', @level2name=N'field_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_function_field', @level2type=N'Column', @level2name=N'create_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_function_field', @level2type=N'Column', @level2name=N'creator';






CREATE TABLE dbo.PERMIFY_SERVICE_option_details (
	id bigint IDENTITY(1,1) NOT NULL,
	field_id bigint NOT NULL,
	[key] varchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	value nvarchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	label nvarchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	sort tinyint DEFAULT 0 NOT NULL,
	enable bit DEFAULT 1 NOT NULL,
	create_time datetime2 NOT NULL,
	creator varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	modify_time datetime2 NULL,
	modifier varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	need_auth bit DEFAULT 1 NOT NULL,
	CONSTRAINT PK__PERMIFY___3213E83FEB47FF27 PRIMARY KEY (id)
);



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)id@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_option_details', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)欄位@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_option_details', @level2type=N'Column', @level2name=N'field_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)選項代碼(前端比對及取用的關鍵 Key 值)@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_option_details', @level2type=N'Column', @level2name=N'key';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)選項值@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_option_details', @level2type=N'Column', @level2name=N'value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)欄位名稱@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_option_details', @level2type=N'Column', @level2name=N'label';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)排序@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_option_details', @level2type=N'Column', @level2name=N'sort';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)啟用@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_option_details', @level2type=N'Column', @level2name=N'enable';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_option_details', @level2type=N'Column', @level2name=N'create_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_option_details', @level2type=N'Column', @level2name=N'creator';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後修改時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_option_details', @level2type=N'Column', @level2name=N'modify_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後修改人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_option_details', @level2type=N'Column', @level2name=N'modifier';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)need_auth@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_option_details', @level2type=N'Column', @level2name=N'need_auth';






CREATE TABLE dbo.PERMIFY_SERVICE_role_action (
	id bigint IDENTITY(1,1) NOT NULL,
	role_id bigint NOT NULL,
	action_id bigint NOT NULL,
	create_time datetime2 NOT NULL,
	creator varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	CONSTRAINT PK__PERMIFY___3213E83FF6B14413 PRIMARY KEY (id)
);
 CREATE  UNIQUE NONCLUSTERED INDEX idx_PERMIFY_SERVICE_role_action ON dbo.PERMIFY_SERVICE_role_action (  role_id ASC  , action_id ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)id@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_role_action', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)角色@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_role_action', @level2type=N'Column', @level2name=N'role_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)功能@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_role_action', @level2type=N'Column', @level2name=N'action_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_role_action', @level2type=N'Column', @level2name=N'create_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_role_action', @level2type=N'Column', @level2name=N'creator';






CREATE TABLE dbo.PERMIFY_SERVICE_role_details (
	id bigint IDENTITY(1,1) NOT NULL,
	code varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	name nvarchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	description nvarchar(300) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	enable bit DEFAULT 1 NOT NULL,
	create_time datetime2 NOT NULL,
	creator varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	modify_time datetime2 NULL,
	modifier varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	CONSTRAINT PK__PERMIFY___3213E83FE4052A51 PRIMARY KEY (id)
);



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)id@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_role_details', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)代碼@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_role_details', @level2type=N'Column', @level2name=N'code';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)名稱@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_role_details', @level2type=N'Column', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)說明@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_role_details', @level2type=N'Column', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)啟用(0：否，1：是)@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_role_details', @level2type=N'Column', @level2name=N'enable';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_role_details', @level2type=N'Column', @level2name=N'create_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_role_details', @level2type=N'Column', @level2name=N'creator';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後修改時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_role_details', @level2type=N'Column', @level2name=N'modify_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後修改人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_role_details', @level2type=N'Column', @level2name=N'modifier';






CREATE TABLE dbo.PERMIFY_SERVICE_role_field (
	id bigint IDENTITY(1,1) NOT NULL,
	role_id bigint NOT NULL,
	field_id bigint NOT NULL,
	create_time datetime2 NOT NULL,
	creator varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	CONSTRAINT PK__PERMIFY___3213E83F14F2A5AD PRIMARY KEY (id)
);



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)id@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_role_field', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)角色@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_role_field', @level2type=N'Column', @level2name=N'role_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)欄位@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_role_field', @level2type=N'Column', @level2name=N'field_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_role_field', @level2type=N'Column', @level2name=N'create_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_role_field', @level2type=N'Column', @level2name=N'creator';






CREATE TABLE dbo.PERMIFY_SERVICE_role_function (
	id bigint IDENTITY(1,1) NOT NULL,
	role_id bigint NOT NULL,
	function_id bigint NOT NULL,
	enable bit DEFAULT 1 NOT NULL,
	create_time datetime2 NOT NULL,
	creator varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	modify_time datetime2 NULL,
	modifier varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	CONSTRAINT PK__PERMIFY___3213E83FD8407C82 PRIMARY KEY (id)
);
 CREATE  UNIQUE NONCLUSTERED INDEX idx_PERMIFY_SERVICE_role_function ON dbo.PERMIFY_SERVICE_role_function (  role_id ASC  , function_id ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)id@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_role_function', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)角色@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_role_function', @level2type=N'Column', @level2name=N'role_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)功能@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_role_function', @level2type=N'Column', @level2name=N'function_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)啟用(0：停用，1：啟用)@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_role_function', @level2type=N'Column', @level2name=N'enable';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_role_function', @level2type=N'Column', @level2name=N'create_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_role_function', @level2type=N'Column', @level2name=N'creator';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後修改時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_role_function', @level2type=N'Column', @level2name=N'modify_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後修改人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_role_function', @level2type=N'Column', @level2name=N'modifier';






CREATE TABLE dbo.PERMIFY_SERVICE_role_option (
	id bigint IDENTITY(1,1) NOT NULL,
	role_id bigint NOT NULL,
	option_id bigint NOT NULL,
	create_time datetime2 NOT NULL,
	creator varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	CONSTRAINT PK__PERMIFY___3213E83FE63FC158 PRIMARY KEY (id)
);



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)id@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_role_option', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)角色@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_role_option', @level2type=N'Column', @level2name=N'role_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)選項@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_role_option', @level2type=N'Column', @level2name=N'option_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_role_option', @level2type=N'Column', @level2name=N'create_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_role_option', @level2type=N'Column', @level2name=N'creator';






CREATE TABLE dbo.PERMIFY_SERVICE_role_user (
	id bigint IDENTITY(1,1) NOT NULL,
	role_id bigint NOT NULL,
	username varchar(30) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	create_time datetime2 DEFAULT getdate() NOT NULL,
	CONSTRAINT PK__PERMIFY___3213E83F73FE8933 PRIMARY KEY (id)
);
 CREATE  UNIQUE NONCLUSTERED INDEX idx_PERMIFY_SERVICE_role_user ON dbo.PERMIFY_SERVICE_role_user (  role_id ASC  , username ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)id@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_role_user', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)角色@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_role_user', @level2type=N'Column', @level2name=N'role_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)帳號@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_role_user', @level2type=N'Column', @level2name=N'username';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_role_user', @level2type=N'Column', @level2name=N'create_time';






CREATE TABLE dbo.PERMIFY_SERVICE_route_details (
	id bigint IDENTITY(1,1) NOT NULL,
	route_id varchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	uri varchar(300) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	predicates nvarchar(MAX) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	filters nvarchar(MAX) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	metadata nvarchar(MAX) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	sort int NOT NULL,
	enable bit DEFAULT 1 NOT NULL,
	create_time datetime2 DEFAULT getdate() NOT NULL,
	creator varchar(30) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	modify_time datetime2 NULL,
	modifier varchar(30) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	CONSTRAINT PK__PERMIFY___3213E83F2236C842 PRIMARY KEY (id),
	CONSTRAINT UQ__PERMIFY___28F706FF38E4E2B5 UNIQUE (route_id)
);



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)id@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_route_details', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)路由 ID@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_route_details', @level2type=N'Column', @level2name=N'route_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)目的@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_route_details', @level2type=N'Column', @level2name=N'uri';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)路由匹配規則@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_route_details', @level2type=N'Column', @level2name=N'predicates';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)過濾器邏輯@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_route_details', @level2type=N'Column', @level2name=N'filters';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)屬性@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_route_details', @level2type=N'Column', @level2name=N'metadata';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)權重(越小越重)@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_route_details', @level2type=N'Column', @level2name=N'sort';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)啟用@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_route_details', @level2type=N'Column', @level2name=N'enable';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_route_details', @level2type=N'Column', @level2name=N'create_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_route_details', @level2type=N'Column', @level2name=N'creator';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後修改時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_route_details', @level2type=N'Column', @level2name=N'modify_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後修改人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_route_details', @level2type=N'Column', @level2name=N'modifier';






CREATE TABLE dbo.PERMIFY_SERVICE_user_details (
	id varchar(30) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	name nvarchar(10) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	email varchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	status varchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	department_id bigint NOT NULL,
	last_login_ip varchar(15) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	last_login_time datetime2 NULL,
	create_time datetime2 NOT NULL,
	creator varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	modify_time datetime2 NULL,
	modifier varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	CONSTRAINT PK__PERMIFY___3213E83FDDFD8D5B PRIMARY KEY (id)
);



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)帳號@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_user_details', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)姓名@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_user_details', @level2type=N'Column', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)Email@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_user_details', @level2type=N'Column', @level2name=N'email';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)狀態@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_user_details', @level2type=N'Column', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)所屬單位@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_user_details', @level2type=N'Column', @level2name=N'department_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後登入ip@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_user_details', @level2type=N'Column', @level2name=N'last_login_ip';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後登入時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_user_details', @level2type=N'Column', @level2name=N'last_login_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_user_details', @level2type=N'Column', @level2name=N'create_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_user_details', @level2type=N'Column', @level2name=N'creator';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後修改時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_user_details', @level2type=N'Column', @level2name=N'modify_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後修改人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_user_details', @level2type=N'Column', @level2name=N'modifier';






CREATE TABLE dbo.SCHEDULE_SERVICE_job_details (
	code varchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	name nvarchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	description nvarchar(MAX) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	cron varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	url nvarchar(500) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	enable bit DEFAULT 0 NOT NULL,
	create_time datetime2 NOT NULL,
	creator varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	modify_time datetime2 NULL,
	modifier varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	notification nvarchar(MAX) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	[method] varchar(8) COLLATE Chinese_Taiwan_Stroke_CI_AS DEFAULT 'GET' NOT NULL,
	body nvarchar(MAX) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	header nvarchar(MAX) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	CONSTRAINT PK__SCHEDULE__357D4CF882696D60 PRIMARY KEY (code)
);
 CREATE  UNIQUE NONCLUSTERED INDEX idx_SCHEDULE_SERVICE_job_details ON dbo.SCHEDULE_SERVICE_job_details (  code ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
ALTER TABLE dbo.SCHEDULE_SERVICE_job_details WITH NOCHECK ADD CONSTRAINT CK__SCHEDULE___metho__4CC05EF3 CHECK (([method]='POST' OR [method]='GET'));



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)批次代碼@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_details', @level2type=N'Column', @level2name=N'code';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)批次名稱@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_details', @level2type=N'Column', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)作業說明@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_details', @level2type=N'Column', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)執行時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_details', @level2type=N'Column', @level2name=N'cron';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)API網址@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_details', @level2type=N'Column', @level2name=N'url';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)啟用(0：停用，1：啟用)@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_details', @level2type=N'Column', @level2name=N'enable';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_details', @level2type=N'Column', @level2name=N'create_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_details', @level2type=N'Column', @level2name=N'creator';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後修改時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_details', @level2type=N'Column', @level2name=N'modify_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後修改人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_details', @level2type=N'Column', @level2name=N'modifier';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)通知對象(輸入Email並以逗號分隔)@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_details', @level2type=N'Column', @level2name=N'notification';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)method@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_details', @level2type=N'Column', @level2name=N'method';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)body@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_details', @level2type=N'Column', @level2name=N'body';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)header@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_details', @level2type=N'Column', @level2name=N'header';






CREATE TABLE dbo.SCHEDULE_SERVICE_job_lock (
	job_code varchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	locked_by varchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	locked_at datetime2 DEFAULT getdate() NOT NULL,
	running bit NOT NULL,
	version int NOT NULL,
	CONSTRAINT PK__SCHEDULE__FBB86DB2F8ED53BF PRIMARY KEY (job_code)
);



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)排程代號@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_lock', @level2type=N'Column', @level2name=N'job_code';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)鎖定者@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_lock', @level2type=N'Column', @level2name=N'locked_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)鎖定時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_lock', @level2type=N'Column', @level2name=N'locked_at';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)正在執行(0：否，1：是)@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_lock', @level2type=N'Column', @level2name=N'running';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)版次@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_lock', @level2type=N'Column', @level2name=N'version';






CREATE TABLE dbo.SCHEDULE_SERVICE_job_step (
	id bigint IDENTITY(1,1) NOT NULL,
	job_code varchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	start_time datetime2 DEFAULT getdate() NOT NULL,
	end_time datetime2 NULL,
	status varchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	read_count int DEFAULT 0 NOT NULL,
	filter_count int DEFAULT 0 NOT NULL,
	write_count int DEFAULT 0 NOT NULL,
	remark nvarchar(MAX) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL
);
ALTER TABLE dbo.SCHEDULE_SERVICE_job_step WITH NOCHECK ADD CONSTRAINT CK__SCHEDULE___statu__6774552F CHECK (([status]='FAIL' OR [status]='COMPLETE' OR [status]='EXECUTE'));



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)id@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_step', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)排程代號@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_step', @level2type=N'Column', @level2name=N'job_code';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)開始時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_step', @level2type=N'Column', @level2name=N'start_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)結束時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_step', @level2type=N'Column', @level2name=N'end_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)狀態@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_step', @level2type=N'Column', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)讀取筆數@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_step', @level2type=N'Column', @level2name=N'read_count';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)過濾筆數@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_step', @level2type=N'Column', @level2name=N'filter_count';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)寫入筆數@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_step', @level2type=N'Column', @level2name=N'write_count';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)備註@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'SCHEDULE_SERVICE_job_step', @level2type=N'Column', @level2name=N'remark';






CREATE TABLE dbo.attachment (
	id bigint IDENTITY(1,1) NOT NULL,
	name nvarchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	uuid char(36) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	extension nvarchar(10) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	storage_path nvarchar(200) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	file_size decimal(18,2) NOT NULL,
	create_time datetime2 NOT NULL,
	creator varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	deleted bit DEFAULT 0 NOT NULL,
	delete_time datetime2 NULL,
	deleter varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	last_access_time datetime2 NULL,
	CONSTRAINT PK__attachme__3213E83F2B2D7C0F PRIMARY KEY (id),
	CONSTRAINT UQ__attachme__7F427931F28D973B UNIQUE (uuid)
);



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)ID@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'attachment', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)附件檔案名稱@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'attachment', @level2type=N'Column', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)全域唯一識別碼(UUID)@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'attachment', @level2type=N'Column', @level2name=N'uuid';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)檔案類型@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'attachment', @level2type=N'Column', @level2name=N'extension';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)儲存路徑@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'attachment', @level2type=N'Column', @level2name=N'storage_path';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)檔案大小@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'attachment', @level2type=N'Column', @level2name=N'file_size';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'attachment', @level2type=N'Column', @level2name=N'create_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'attachment', @level2type=N'Column', @level2name=N'creator';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)軟刪除標記: 0-未刪除, 1-已刪除@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'attachment', @level2type=N'Column', @level2name=N'deleted';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)刪除時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'attachment', @level2type=N'Column', @level2name=N'delete_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)刪除人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'attachment', @level2type=N'Column', @level2name=N'deleter';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)讀取時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'attachment', @level2type=N'Column', @level2name=N'last_access_time';






CREATE TABLE dbo.[domain] (
	id int IDENTITY(1,1) NOT NULL,
	name nvarchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	description nvarchar(200) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	enable bit DEFAULT 1 NOT NULL,
	create_time datetime2 NOT NULL,
	creator varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	modify_time datetime2 NOT NULL,
	modifier varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	deleted bit DEFAULT 0 NOT NULL,
	delete_time datetime2 NULL,
	deleter varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	[sequence] int DEFAULT 0 NOT NULL,
	CONSTRAINT PK__domain__3213E83F8FCEBA11 PRIMARY KEY (id)
);



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)ID@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'domain', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)主館名稱@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'domain', @level2type=N'Column', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)主館說明@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'domain', @level2type=N'Column', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)啟用狀態: 0-停用, 1-啟用@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'domain', @level2type=N'Column', @level2name=N'enable';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'domain', @level2type=N'Column', @level2name=N'create_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'domain', @level2type=N'Column', @level2name=N'creator';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後修改時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'domain', @level2type=N'Column', @level2name=N'modify_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後修改人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'domain', @level2type=N'Column', @level2name=N'modifier';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)軟刪除標記: 0-未刪除, 1-已刪除@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'domain', @level2type=N'Column', @level2name=N'deleted';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)刪除時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'domain', @level2type=N'Column', @level2name=N'delete_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)刪除人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'domain', @level2type=N'Column', @level2name=N'deleter';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)序號@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'domain', @level2type=N'Column', @level2name=N'sequence';






CREATE TABLE dbo.knowledge_base_upload (
	id bigint IDENTITY(1,1) NOT NULL,
	knowledge_base_id bigint NOT NULL,
	upload_version_id bigint NULL,
	upload_version_number decimal(5,1) NOT NULL,
	upload_start_time datetime2 NOT NULL,
	upload_end_time datetime2 NULL,
	received_time datetime2 NULL,
	create_time datetime2 NOT NULL,
	CONSTRAINT PK__knowledge_base_upload PRIMARY KEY (id)
);



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)ID@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base_upload', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)知識庫ID@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base_upload', @level2type=N'Column', @level2name=N'knowledge_base_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)知識庫版本ID@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base_upload', @level2type=N'Column', @level2name=N'upload_version_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)知識庫版本號碼@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base_upload', @level2type=N'Column', @level2name=N'upload_version_number';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)上傳開始時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base_upload', @level2type=N'Column', @level2name=N'upload_start_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)上傳結束時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base_upload', @level2type=N'Column', @level2name=N'upload_end_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)回傳時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base_upload', @level2type=N'Column', @level2name=N'received_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base_upload', @level2type=N'Column', @level2name=N'create_time';






CREATE TABLE dbo.scenario (
	id bigint IDENTITY(1,1) NOT NULL,
	uuid char(36) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	name nvarchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	description nvarchar(200) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	embedding_model nvarchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	vector_database nvarchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	create_time datetime2 NOT NULL,
	creator varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	modify_time datetime2 NULL,
	modifier varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	deleted bit DEFAULT 0 NOT NULL,
	delete_time datetime2 NULL,
	deleter varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	enable bit DEFAULT 1 NOT NULL,
	llm_agent_id varchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	retrieval_empty_response nvarchar(1000) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	threshold decimal(5,2) NULL,
	retrieval_empty_call_llm bit DEFAULT 1 NULL,
	[sequence] int DEFAULT 0 NOT NULL,
	CONSTRAINT PK__scenario__3213E83F8CC2FD1C PRIMARY KEY (id),
	CONSTRAINT UQ__scenario__7F42793108B93B27 UNIQUE (uuid)
);



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)唯一識別碼@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'scenario', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)全域唯一識別碼(UUID)@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'scenario', @level2type=N'Column', @level2name=N'uuid';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)場景名稱@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'scenario', @level2type=N'Column', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)場景描述@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'scenario', @level2type=N'Column', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)嵌入模型@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'scenario', @level2type=N'Column', @level2name=N'embedding_model';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)向量資料庫@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'scenario', @level2type=N'Column', @level2name=N'vector_database';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'scenario', @level2type=N'Column', @level2name=N'create_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'scenario', @level2type=N'Column', @level2name=N'creator';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後修改時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'scenario', @level2type=N'Column', @level2name=N'modify_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後修改人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'scenario', @level2type=N'Column', @level2name=N'modifier';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)軟刪除標記: 0-未刪除, 1-已刪除@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'scenario', @level2type=N'Column', @level2name=N'deleted';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)刪除時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'scenario', @level2type=N'Column', @level2name=N'delete_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)刪除人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'scenario', @level2type=N'Column', @level2name=N'deleter';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)啟用@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'scenario', @level2type=N'Column', @level2name=N'enable';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)LLM代理ID@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'scenario', @level2type=N'Column', @level2name=N'llm_agent_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)檢索無結果回應@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'scenario', @level2type=N'Column', @level2name=N'retrieval_empty_response';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)切片信心度閾值@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'scenario', @level2type=N'Column', @level2name=N'threshold';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)檢索無結果時是否呼叫LLM: 0-停用, 1-啟用@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'scenario', @level2type=N'Column', @level2name=N'retrieval_empty_call_llm';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)序號@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'scenario', @level2type=N'Column', @level2name=N'sequence';






CREATE TABLE dbo.tag (
	id bigint IDENTITY(1,1) NOT NULL,
	tag_key nvarchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	tag_value nvarchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	[source] tinyint NOT NULL,
	enable bit DEFAULT 1 NOT NULL,
	create_time datetime2 NOT NULL,
	creator varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	deleted bit DEFAULT 0 NOT NULL,
	delete_time datetime2 NULL,
	deleter varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	CONSTRAINT PK__tag__3213E83F4CEB6FA4 PRIMARY KEY (id)
);



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)ID@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'tag', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)標籤鍵@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'tag', @level2type=N'Column', @level2name=N'tag_key';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)標籤值@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'tag', @level2type=N'Column', @level2name=N'tag_value';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)來源: 1-其他, 2-標籤庫, 3-手動輸入@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'tag', @level2type=N'Column', @level2name=N'source';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)啟用狀態: 0-停用, 1-啟用@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'tag', @level2type=N'Column', @level2name=N'enable';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'tag', @level2type=N'Column', @level2name=N'create_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'tag', @level2type=N'Column', @level2name=N'creator';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)軟刪除標記: 0-未刪除, 1-已刪除@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'tag', @level2type=N'Column', @level2name=N'deleted';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)刪除時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'tag', @level2type=N'Column', @level2name=N'delete_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)刪除人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'tag', @level2type=N'Column', @level2name=N'deleter';






CREATE TABLE dbo.tag_library (
	id bigint IDENTITY(1,1) NOT NULL,
	name nvarchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	description nvarchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	enable bit DEFAULT 1 NOT NULL,
	create_time datetime2 NOT NULL,
	creator varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	modify_time datetime2 NOT NULL,
	modifier varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	deleted bit DEFAULT 0 NOT NULL,
	delete_time datetime2 NULL,
	deleter varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	CONSTRAINT PK__tag_libr__3213E83FA9951844 PRIMARY KEY (id)
);



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)ID@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'tag_library', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)標籤庫名稱@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'tag_library', @level2type=N'Column', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)標籤庫說明@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'tag_library', @level2type=N'Column', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)啟用狀態: 0-停用, 1-啟用@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'tag_library', @level2type=N'Column', @level2name=N'enable';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'tag_library', @level2type=N'Column', @level2name=N'create_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'tag_library', @level2type=N'Column', @level2name=N'creator';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後修改時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'tag_library', @level2type=N'Column', @level2name=N'modify_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後修改人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'tag_library', @level2type=N'Column', @level2name=N'modifier';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)軟刪除標記: 0-未刪除, 1-已刪除@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'tag_library', @level2type=N'Column', @level2name=N'deleted';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)刪除時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'tag_library', @level2type=N'Column', @level2name=N'delete_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)刪除人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'tag_library', @level2type=N'Column', @level2name=N'deleter';






CREATE TABLE dbo.verify_flow_log (
	id bigint IDENTITY(1,1) NOT NULL,
	target_type tinyint NOT NULL,
	target_version_id varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	verify_by nvarchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	reason nvarchar(500) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	[action] tinyint NOT NULL,
	[level] tinyint DEFAULT 1 NOT NULL,
	[sequence] int NOT NULL,
	create_time datetime2 NOT NULL,
	creator varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	CONSTRAINT PK__verify_f__3213E83F8005CF33 PRIMARY KEY (id)
);

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)唯一識別碼@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'verify_flow_log', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)審核對象類型@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'verify_flow_log', @level2type=N'Column', @level2name=N'target_type';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)對象版本ID (knowledge_base_version.id)@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'verify_flow_log', @level2type=N'Column', @level2name=N'target_version_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)審核人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'verify_flow_log', @level2type=N'Column', @level2name=N'verify_by';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)審核意見@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'verify_flow_log', @level2type=N'Column', @level2name=N'reason';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)審核動作: 0-退回, 1-通過@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'verify_flow_log', @level2type=N'Column', @level2name=N'action';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)審核關卡，1=第一關，2=第二關...，對應審核階段@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'verify_flow_log', @level2type=N'Column', @level2name=N'level';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)審核順序，從1開始遞增@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'verify_flow_log', @level2type=N'Column', @level2name=N'sequence';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'verify_flow_log', @level2type=N'Column', @level2name=N'create_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'verify_flow_log', @level2type=N'Column', @level2name=N'creator';






CREATE TABLE dbo.PERMIFY_SERVICE_department_role (
	id bigint IDENTITY(1,1) NOT NULL,
	department_id bigint NOT NULL,
	enable bit DEFAULT 1 NOT NULL,
	create_time datetime2 NOT NULL,
	creator varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	modify_time datetime2 NULL,
	modifier varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	role_id bigint NOT NULL,
	CONSTRAINT PK__PERMIFY___3213E83F52C06EEB PRIMARY KEY (id),
	CONSTRAINT FK_PERMIFY_SERVICE_department_role_role_id FOREIGN KEY (role_id) REFERENCES dbo.PERMIFY_SERVICE_role_details(id),
	CONSTRAINT FK_PERMIFY_SERVICE_role_details_department_id FOREIGN KEY (department_id) REFERENCES dbo.PERMIFY_SERVICE_department_details(id),
	CONSTRAINT FK__PERMIFY_S__depar__18A19C6F FOREIGN KEY (department_id) REFERENCES dbo.PERMIFY_SERVICE_department_details(id),
	CONSTRAINT FK__PERMIFY_S__depar__4C8B54C9 FOREIGN KEY (department_id) REFERENCES dbo.PERMIFY_SERVICE_department_details(id)
);



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)id@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_department_role', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)部門ID@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_department_role', @level2type=N'Column', @level2name=N'department_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)啟用(0：否，1：是)@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_department_role', @level2type=N'Column', @level2name=N'enable';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_department_role', @level2type=N'Column', @level2name=N'create_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_department_role', @level2type=N'Column', @level2name=N'creator';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後修改時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_department_role', @level2type=N'Column', @level2name=N'modify_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後修改人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_department_role', @level2type=N'Column', @level2name=N'modifier';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)role_id@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'PERMIFY_SERVICE_department_role', @level2type=N'Column', @level2name=N'role_id';






CREATE TABLE dbo.knowledge_base (
	id bigint IDENTITY(1,1) NOT NULL,
	uuid char(36) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	scenario_id bigint NOT NULL,
	name nvarchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	description nvarchar(200) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	current_version_id bigint NULL,
	enable bit NOT NULL,
	test_collection_name nvarchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	prod_collection_name nvarchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	lock_status tinyint DEFAULT 0 NOT NULL,
	allow_manual_tag bit DEFAULT 1 NOT NULL,
	embedding_model nvarchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	vector_database nvarchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	create_time datetime2 NOT NULL,
	creator varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	modify_time datetime2 NOT NULL,
	modifier varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	deleted bit DEFAULT 0 NOT NULL,
	delete_time datetime2 NULL,
	deleter varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	[sequence] int DEFAULT 0 NOT NULL,
	CONSTRAINT PK__knowledg__3213E83F08E5D33A PRIMARY KEY (id),
	CONSTRAINT UQ__knowledg__7F4279317E97EE7C UNIQUE (uuid),
	CONSTRAINT FK__knowledge__scena__222B06A9 FOREIGN KEY (scenario_id) REFERENCES dbo.scenario(id)
);



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)ID@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)全域唯一識別碼(UUID)@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base', @level2type=N'Column', @level2name=N'uuid';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)場景ID@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base', @level2type=N'Column', @level2name=N'scenario_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)知識庫名稱@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base', @level2type=N'Column', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)知識庫說明@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base', @level2type=N'Column', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)當前版本ID@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base', @level2type=N'Column', @level2name=N'current_version_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)啟用狀態: 0-停用, 1-啟用@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base', @level2type=N'Column', @level2name=N'enable';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)MongoDB知識庫測試區集合名稱@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base', @level2type=N'Column', @level2name=N'test_collection_name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)MongoDB知識庫正式區集合名稱@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base', @level2type=N'Column', @level2name=N'prod_collection_name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)鎖定狀態: 0-未鎖定, 1-手動鎖定, 2-自動鎖定(發布中)@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base', @level2type=N'Column', @level2name=N'lock_status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)是否允許手動標籤: 0-不允許, 1-允許@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base', @level2type=N'Column', @level2name=N'allow_manual_tag';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)嵌入模型@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base', @level2type=N'Column', @level2name=N'embedding_model';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)向量資料庫@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base', @level2type=N'Column', @level2name=N'vector_database';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base', @level2type=N'Column', @level2name=N'create_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base', @level2type=N'Column', @level2name=N'creator';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後修改時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base', @level2type=N'Column', @level2name=N'modify_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後修改人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base', @level2type=N'Column', @level2name=N'modifier';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)軟刪除標記: 0-未刪除, 1-已刪除@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base', @level2type=N'Column', @level2name=N'deleted';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)刪除時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base', @level2type=N'Column', @level2name=N'delete_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)刪除人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base', @level2type=N'Column', @level2name=N'deleter';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)序號@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base', @level2type=N'Column', @level2name=N'sequence';






CREATE TABLE dbo.knowledge_base_tag_library_map (
	id bigint IDENTITY(1,1) NOT NULL,
	knowledge_base_id bigint NOT NULL,
	tag_library_id bigint NOT NULL,
	create_time datetime2 NOT NULL,
	creator varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	CONSTRAINT PK__knowledg__3213E83FDCB60A35 PRIMARY KEY (id),
	CONSTRAINT FK__knowledge__knowl__24134F1B FOREIGN KEY (knowledge_base_id) REFERENCES dbo.knowledge_base(id),
	CONSTRAINT FK__knowledge__tag_l__25077354 FOREIGN KEY (tag_library_id) REFERENCES dbo.tag_library(id)
);



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)唯一識別碼@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base_tag_library_map', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)知識庫ID@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base_tag_library_map', @level2type=N'Column', @level2name=N'knowledge_base_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)標籤庫ID@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base_tag_library_map', @level2type=N'Column', @level2name=N'tag_library_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base_tag_library_map', @level2type=N'Column', @level2name=N'create_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base_tag_library_map', @level2type=N'Column', @level2name=N'creator';






CREATE TABLE dbo.knowledge_base_version (
	id bigint IDENTITY(1,1) NOT NULL,
	uuid char(36) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	kb_id bigint NOT NULL,
	version_number decimal(5,1) NOT NULL,
	collection_name nvarchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	description nvarchar(200) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	publish_status tinyint NOT NULL,
	verify_status smallint NOT NULL,
	verify_level int DEFAULT 1 NOT NULL,
	create_time datetime2 NOT NULL,
	creator varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	modify_time datetime2 NOT NULL,
	modifier varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	deleted bit DEFAULT 0 NOT NULL,
	delete_time datetime2 NULL,
	deleter varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	verify_user_id varchar(30) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	verify_time datetime2 NULL,
	current_verify_flow_id bigint NULL,
	CONSTRAINT PK__knowledg__3213E83FCF2ABAC6 PRIMARY KEY (id),
	CONSTRAINT UQ__knowledg__7F42793154DF7FDE UNIQUE (uuid),
	CONSTRAINT FK__knowledge__kb_id__231F2AE2 FOREIGN KEY (kb_id) REFERENCES dbo.knowledge_base(id)
);



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)ID@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base_version', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)全域唯一識別碼(UUID)@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base_version', @level2type=N'Column', @level2name=N'uuid';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)知識庫ID@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base_version', @level2type=N'Column', @level2name=N'kb_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)版本號碼@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base_version', @level2type=N'Column', @level2name=N'version_number';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)MongoDB集合名稱@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base_version', @level2type=N'Column', @level2name=N'collection_name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)版本描述@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base_version', @level2type=N'Column', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)發布狀態: 0-未發布, 1-已發布, 2-歷史版本@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base_version', @level2type=N'Column', @level2name=N'publish_status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)審核狀態: 0-未送審, 1-審核中, 2-審核完成@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base_version', @level2type=N'Column', @level2name=N'verify_status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)審核關卡數，1=單關，2=兩關...，決定需幾人/幾階段審核@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base_version', @level2type=N'Column', @level2name=N'verify_level';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base_version', @level2type=N'Column', @level2name=N'create_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base_version', @level2type=N'Column', @level2name=N'creator';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後修改時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base_version', @level2type=N'Column', @level2name=N'modify_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後修改人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base_version', @level2type=N'Column', @level2name=N'modifier';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)軟刪除標記: 0-未刪除, 1-已刪除@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base_version', @level2type=N'Column', @level2name=N'deleted';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)刪除時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base_version', @level2type=N'Column', @level2name=N'delete_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)刪除人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base_version', @level2type=N'Column', @level2name=N'deleter';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)送審人員ID@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base_version', @level2type=N'Column', @level2name=N'verify_user_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)送審時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'knowledge_base_version', @level2type=N'Column', @level2name=N'verify_time';






CREATE TABLE dbo.scenario_chunk_model (
	id bigint IDENTITY(1,1) NOT NULL,
	scenario_id bigint NOT NULL,
	model_name nvarchar(100) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	model_type nvarchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	create_time datetime2 NOT NULL,
	creator varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	CONSTRAINT PK__scenario__3213E83FE4F3C052 PRIMARY KEY (id),
	CONSTRAINT FK__scenario___scena__2136E270 FOREIGN KEY (scenario_id) REFERENCES dbo.scenario(id)
);



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)唯一識別碼@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'scenario_chunk_model', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)場景ID@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'scenario_chunk_model', @level2type=N'Column', @level2name=N'scenario_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)模型名稱@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'scenario_chunk_model', @level2type=N'Column', @level2name=N'model_name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)模型類型 (e.g., embedding, completion, chat)@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'scenario_chunk_model', @level2type=N'Column', @level2name=N'model_type';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'scenario_chunk_model', @level2type=N'Column', @level2name=N'create_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'scenario_chunk_model', @level2type=N'Column', @level2name=N'creator';






CREATE TABLE dbo.scenario_department_map (
	id bigint IDENTITY(1,1) NOT NULL,
	department_id bigint NULL,
	scenario_id bigint NOT NULL,
	create_time datetime2 NOT NULL,
	creator varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	CONSTRAINT PK__scenario__3213E83FFC575BE5 PRIMARY KEY (id),
	CONSTRAINT FK__scenario___depar__1F4E99FE FOREIGN KEY (department_id) REFERENCES dbo.PERMIFY_SERVICE_department_details(id),
	CONSTRAINT FK__scenario___scena__2042BE37 FOREIGN KEY (scenario_id) REFERENCES dbo.scenario(id)
);



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)唯一識別碼@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'scenario_department_map', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)管理部門ID@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'scenario_department_map', @level2type=N'Column', @level2name=N'department_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)場景ID@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'scenario_department_map', @level2type=N'Column', @level2name=N'scenario_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'scenario_department_map', @level2type=N'Column', @level2name=N'create_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'scenario_department_map', @level2type=N'Column', @level2name=N'creator';






CREATE TABLE dbo.subdomain (
	id int IDENTITY(1,1) NOT NULL,
	domain_id int NOT NULL,
	name nvarchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	description nvarchar(200) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	enable bit DEFAULT 1 NOT NULL,
	create_time datetime2 NOT NULL,
	creator varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	modify_time datetime2 NOT NULL,
	modifier varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	deleted bit DEFAULT 0 NOT NULL,
	delete_time datetime2 NULL,
	deleter varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	[sequence] int DEFAULT 0 NOT NULL,
	CONSTRAINT PK__subdomai__3213E83F8650E12B PRIMARY KEY (id),
	CONSTRAINT FK__subdomain__domai__1A89E4E1 FOREIGN KEY (domain_id) REFERENCES dbo.[domain](id)
);



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)ID@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'subdomain', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)主館ID@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'subdomain', @level2type=N'Column', @level2name=N'domain_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)分館名稱@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'subdomain', @level2type=N'Column', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)分館說明@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'subdomain', @level2type=N'Column', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)啟用狀態: 0-停用, 1-啟用@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'subdomain', @level2type=N'Column', @level2name=N'enable';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'subdomain', @level2type=N'Column', @level2name=N'create_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'subdomain', @level2type=N'Column', @level2name=N'creator';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後修改時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'subdomain', @level2type=N'Column', @level2name=N'modify_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後修改人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'subdomain', @level2type=N'Column', @level2name=N'modifier';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)軟刪除標記: 0-未刪除, 1-已刪除@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'subdomain', @level2type=N'Column', @level2name=N'deleted';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)刪除時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'subdomain', @level2type=N'Column', @level2name=N'delete_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)刪除人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'subdomain', @level2type=N'Column', @level2name=N'deleter';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)序號@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'subdomain', @level2type=N'Column', @level2name=N'sequence';






CREATE TABLE dbo.subdomain_department_map (
	id bigint IDENTITY(1,1) NOT NULL,
	department_id bigint NULL,
	subdomain_id int NOT NULL,
	create_time datetime2 NOT NULL,
	creator varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	CONSTRAINT PK__subdomai__3213E83F65AD42E2 PRIMARY KEY (id),
	CONSTRAINT FK__subdomain__depar__1B7E091A FOREIGN KEY (department_id) REFERENCES dbo.PERMIFY_SERVICE_department_details(id),
	CONSTRAINT FK__subdomain__subdo__1C722D53 FOREIGN KEY (subdomain_id) REFERENCES dbo.subdomain(id)
);



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)唯一識別碼@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'subdomain_department_map', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)管理部門ID@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'subdomain_department_map', @level2type=N'Column', @level2name=N'department_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)分館ID@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'subdomain_department_map', @level2type=N'Column', @level2name=N'subdomain_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'subdomain_department_map', @level2type=N'Column', @level2name=N'create_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'subdomain_department_map', @level2type=N'Column', @level2name=N'creator';






CREATE TABLE dbo.verify_flow (
	id bigint IDENTITY(1,1) NOT NULL,
	target_type tinyint NOT NULL,
	target_version_id varchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	[level] tinyint NOT NULL,
	role_id bigint NOT NULL,
	[action] smallint NOT NULL,
	status tinyint DEFAULT 0 NOT NULL,
	create_time datetime2 NOT NULL,
	creator varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	modify_time datetime2 NOT NULL,
	modifier varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	action_time datetime2 NULL,
	CONSTRAINT PK__verify_f__3213E83F1DD943A0 PRIMARY KEY (id),
	CONSTRAINT FK__verify_fl__role___73C51D7B FOREIGN KEY (role_id) REFERENCES dbo.PERMIFY_SERVICE_department_role(id)
);



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)唯一識別碼@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'verify_flow', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)審核對象類型: 1-文件版本, 2-知識庫版本@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'verify_flow', @level2type=N'Column', @level2name=N'target_type';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)對象版本ID (document_version.id 或 knowledge_base_version.id)@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'verify_flow', @level2type=N'Column', @level2name=N'target_version_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)審核關卡，1=第一關，2=第二關...@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'verify_flow', @level2type=N'Column', @level2name=N'level';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)審核角色ID@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'verify_flow', @level2type=N'Column', @level2name=N'role_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)審核動作: 0-退回, 1-通過@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'verify_flow', @level2type=N'Column', @level2name=N'action';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)狀態: 0-未完成, 1-已完成@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'verify_flow', @level2type=N'Column', @level2name=N'status';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'verify_flow', @level2type=N'Column', @level2name=N'create_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'verify_flow', @level2type=N'Column', @level2name=N'creator';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後修改時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'verify_flow', @level2type=N'Column', @level2name=N'modify_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)最後修改人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'verify_flow', @level2type=N'Column', @level2name=N'modifier';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)動作時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'verify_flow', @level2type=N'Column', @level2name=N'action_time';






CREATE TABLE dbo.verify_flow_template (
	id bigint IDENTITY(1,1) NOT NULL,
	target_type tinyint NOT NULL,
	[level] tinyint DEFAULT 1 NOT NULL,
	role_id bigint NOT NULL,
	create_time datetime2 NOT NULL,
	creator varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	CONSTRAINT PK__verify_f__3213E83FF822F37C PRIMARY KEY (id),
	CONSTRAINT FK__verify_fl__role___6D181FEC FOREIGN KEY (role_id) REFERENCES dbo.PERMIFY_SERVICE_department_role(id),
	CONSTRAINT FK__verify_fl__role___74B941B4 FOREIGN KEY (role_id) REFERENCES dbo.PERMIFY_SERVICE_department_role(id)
);



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)唯一識別碼@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'verify_flow_template', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)審核對象類型@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'verify_flow_template', @level2type=N'Column', @level2name=N'target_type';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)審核關卡，1=第一關，2=第二關...，對應審核階段@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'verify_flow_template', @level2type=N'Column', @level2name=N'level';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)審核角色ID@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'verify_flow_template', @level2type=N'Column', @level2name=N'role_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'verify_flow_template', @level2type=N'Column', @level2name=N'create_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'verify_flow_template', @level2type=N'Column', @level2name=N'creator';






CREATE TABLE dbo.category (
	id bigint IDENTITY(1,1) NOT NULL,
	subdomain_id int NOT NULL,
	parent_id bigint NULL,
	name nvarchar(50) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	description nvarchar(200) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	enable bit DEFAULT 1 NOT NULL,
	enable_verify bit DEFAULT 0 NOT NULL,
	create_time datetime2 NOT NULL,
	creator varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NOT NULL,
	deleted bit DEFAULT 0 NOT NULL,
	delete_time datetime2 NULL,
	deleter varchar(20) COLLATE Chinese_Taiwan_Stroke_CI_AS NULL,
	[sequence] int DEFAULT 0 NOT NULL,
	CONSTRAINT PK__category__3213E83F9E1C6EA4 PRIMARY KEY (id),
	CONSTRAINT FK__category__parent__1E5A75C5 FOREIGN KEY (parent_id) REFERENCES dbo.category(id),
	CONSTRAINT FK__category__subdom__1D66518C FOREIGN KEY (subdomain_id) REFERENCES dbo.subdomain(id)
);



EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)ID@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'category', @level2type=N'Column', @level2name=N'id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)分館ID@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'category', @level2type=N'Column', @level2name=N'subdomain_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)父分類ID@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'category', @level2type=N'Column', @level2name=N'parent_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)分類名稱@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'category', @level2type=N'Column', @level2name=N'name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)分類說明@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'category', @level2type=N'Column', @level2name=N'description';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)啟用狀態: 0-停用, 1-啟用@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'category', @level2type=N'Column', @level2name=N'enable';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)是否啟用審核機制: 0-否, 1-是@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'category', @level2type=N'Column', @level2name=N'enable_verify';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'category', @level2type=N'Column', @level2name=N'create_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)建立人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'category', @level2type=N'Column', @level2name=N'creator';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)軟刪除標記: 0-未刪除, 1-已刪除@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'category', @level2type=N'Column', @level2name=N'deleted';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)刪除時間@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'category', @level2type=N'Column', @level2name=N'delete_time';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)刪除人員@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'category', @level2type=N'Column', @level2name=N'deleter';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(REVIEWED)序號@@N', @level0type=N'Schema', @level0name=N'dbo', @level1type=N'Table', @level1name=N'category', @level2type=N'Column', @level2name=N'sequence';
