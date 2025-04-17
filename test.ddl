
CREATE TABLE CUST
( 
	CSTM_ADR             address ,
	CSTM_CITY            city ,
	CSTM_FIRST_NM        first_name ,
	CSTM_LAST_NM         last_name ,
	CSTM_STATE           state ,
	CSTM_ZIP_CD          zip_code ,
	EMAIL                varchar  NULL ,
	CSTM_NBR             integer  NOT NULL 
)
go

CREATE TABLE CUST_CREDIT
( 
	CRDT_CRD             integer  NULL ,
	CRDT_CRD_EXP         integer  NULL ,
	STATUS_CD            varchar(20)  NULL ,
	CSTM_NBR             integer  NOT NULL 
)
go

CREATE TABLE EMP
( 
	EMP_FIRST_NM         first_name ,
	EMP_ADR              address ,
	EMP_PHONE            phone ,
	STR_NBR              integer  NULL ,
	EMP_ADR_2            address_2 ,
	EMAIL                varchar(20)  NULL ,
	SALARY               integer  NULL ,
	HIRE_DT              datetime  NULL ,
	SOC_SEC_NBR          integer  NULL ,
	EMP_NBR              varchar(20)  NOT NULL ,
	SUPERVISOR           varchar(20)  NOT NULL 
)
go

CREATE TABLE MO_RENT_REC
( 
	RNTL_DT              datetime  NULL ,
	DUE_DT               datetime  NULL ,
	RNTL_STATUS          varchar(20)  NULL ,
	PYMT_TRANSACTION_NBR integer  NULL ,
	OVERDUE_CHARGE       integer  NULL ,
	RNTL_RATE            integer  NULL ,
	EMP_PHONE            phone  NOT NULL ,
	SOC_SEC_NBR          integer  NOT NULL ,
	RNTL_RECORD_DT       datetime  NOT NULL ,
	MV_COPY_NBR          integer  NOT NULL ,
	MV_NBR               integer  NOT NULL ,
	CSTM_NBR             integer  NOT NULL 
)
go

CREATE TABLE MOVIE
( 
	MV_TITLE             title ,
	MV_DIRECTOR          director ,
	DESCRIPTION          varchar(20)  NULL ,
	STAR_1_NM            first_name ,
	RATING               varchar  NULL ,
	STAR_2_NM            first_name ,
	MV_NBR               integer  NOT NULL ,
	GENRE                varchar(2)  NULL ,
	RNTL_RATE            numeric  NULL ,
	MV_URL               varchar  NULL ,
	MV_CLIP              varbinary  NULL 
)
go

CREATE TABLE MOVIE_COPY
( 
	GENERAL_CONDITION    varchar(20)  NULL ,
	MV_FORMAT            varchar(20)  NULL ,
	MV_COPY_NBR          integer  NOT NULL ,
	MV_NBR               integer  NOT NULL 
)
go

CREATE TABLE MOVIE_STORE
( 
	MV_NBR               integer  NOT NULL ,
	STR_NBR              integer  NOT NULL 
)
go

CREATE TABLE PAYMENT
( 
	PYMT_TRANSACTION_NBR integer  NOT NULL ,
	PYMT_TYPE            char(18)  NULL ,
	PYMT_AMOUNT          numeric  NULL ,
	PYMT_DT              datetime  NULL ,
	PYMT_STATUS          varchar(1)  NULL ,
	EMP_NBR              varchar(20)  NOT NULL ,
	CSTM_NBR             integer  NULL ,
	customer_no          integer  NULL ,
	CHK_BANK_NBR         integer  NULL ,
	CHK_NBR              integer  NULL ,
	EPAY_VENDOR_NBR      integer  NULL ,
	EPAY_ACCOUNT_NBR     integer  NULL ,
	CRDT_CRD_NBR         char(18)  NULL ,
	CRDT_CRD_EXP         datetime  NULL ,
	CRDT_CRD_TYPE        char(18)  NULL 
)
go

CREATE TABLE STORE
( 
	STR_MANAGER          manager ,
	STR_ADR              address ,
	STR_ADR_2            address_2 ,
	STR_PHONE            phone ,
	STR_CITY             city ,
	STR_STATE            state ,
	STR_ZIP_CD           zip_code ,
	STR_NBR              integer  NOT NULL 
)
go

CREATE VIEW CUSTOMER_INVOICE(CRDT_CRD,CRDT_CRD_EXP,STATUS_CD,CSTM_NBR,CSTM_ADR,EMAIL,CSTM_CITY,CSTM_FIRST_NM,CSTM_LAST_NM,CSTM_STATE,CSTM_ZIP_CD,RNTL_RECORD_DT,MV_COPY_NBR,MV_NBR,RNTL_DT,DUE_DT,RNTL_STATUS,OVERDUE_CHARGE,RNTL_RATE,MV_TITLE,Overdue_Charge_Rate)
AS
SELECT ALL CUST_CREDIT.CRDT_CRD,CUST_CREDIT.CRDT_CRD_EXP,CUST_CREDIT.STATUS_CD,CUST.CSTM_NBR,CUST.CSTM_ADR,CUST.EMAIL,CUST.CSTM_CITY,CUST.CSTM_FIRST_NM,CUST.CSTM_LAST_NM,CUST.CSTM_STATE,CUST.CSTM_ZIP_CD,MO_RENT_REC.RNTL_RECORD_DT,MO_RENT_REC.MV_COPY_NBR,MO_RENT_REC.MV_NBR,MO_RENT_REC.RNTL_DT,MO_RENT_REC.DUE_DT,MO_RENT_REC.RNTL_STATUS,MO_RENT_REC.OVERDUE_CHARGE,MO_RENT_REC.RNTL_RATE,MOVIE.MV_TITLE,rental_rate * 1.5
	FROM CUST_CREDIT,CUST,MO_RENT_REC,MOVIE
go

CREATE VIEW OVERDUE_NOTICE(CRDT_CRD,CRDT_CRD_EXP,STATUS_CD,Overdue_Charge_Rate,CSTM_NBR,CSTM_ADR,EMAIL,CSTM_CITY,CSTM_FIRST_NM,CSTM_LAST_NM,CSTM_STATE,CSTM_ZIP_CD,RNTL_RECORD_DT,MV_COPY_NBR,MV_NBR,RNTL_DT,DUE_DT,RNTL_STATUS,OVERDUE_CHARGE,RNTL_RATE)
AS
SELECT ALL CUST_CREDIT.CRDT_CRD,CUST_CREDIT.CRDT_CRD_EXP,CUST_CREDIT.STATUS_CD,rental_rate * 1.5,CUST.CSTM_NBR,CUST.CSTM_ADR,CUST.EMAIL,CUST.CSTM_CITY,CUST.CSTM_FIRST_NM,CUST.CSTM_LAST_NM,CUST.CSTM_STATE,CUST.CSTM_ZIP_CD,MO_RENT_REC.RNTL_RECORD_DT,MO_RENT_REC.MV_COPY_NBR,MO_RENT_REC.MV_NBR,MO_RENT_REC.RNTL_DT,MO_RENT_REC.DUE_DT,MO_RENT_REC.RNTL_STATUS,MO_RENT_REC.OVERDUE_CHARGE,MO_RENT_REC.RNTL_RATE
	FROM CUST_CREDIT,CUST,MO_RENT_REC
go


exec sp_bindrule 'Movie_genre', 'MOVIE.GENRE'
go
