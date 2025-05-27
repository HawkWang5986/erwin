
CREATE TYPE [standard_string]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [standard_number]
	FROM INTEGER NULL
go

CREATE TYPE [first_name]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [last_name]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [address]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [director]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [city]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [manager]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [state]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [title]
	FROM VARCHAR(20) NULL
go

CREATE TYPE [zip_code]
	FROM INTEGER NULL
go

CREATE TYPE [phone]
	FROM INTEGER NULL
go

CREATE TYPE [address_2]
	FROM VARCHAR(20) NULL
go

CREATE RULE [Movie_genre]
	AS @col IN ('AA', 'AN', 'CO', 'DO', 'DR', 'FA', 'CL', 'HO', 'MY', 'SF', 'WS')
go

CREATE TABLE [CUST]
( 
	[CSTM_ADR]           [address] ,
	[CSTM_CITY]          [city] ,
	[CSTM_FIRST_NM]      [first_name] ,
	[CSTM_LAST_NM]       [last_name] ,
	[CSTM_STATE]         [state] ,
	[CSTM_ZIP_CD]        [zip_code] ,
	[EMAIL]              varchar  NULL ,
	[CSTM_NBR]           integer  NOT NULL 
)
go

CREATE TABLE [CUST_CREDIT]
( 
	[CRDT_CRD]           integer  NULL ,
	[CRDT_CRD_EXP]       integer  NULL ,
	[STATUS_CD]          varchar(20)  NULL ,
	[CSTM_NBR]           integer  NOT NULL 
)
go

CREATE TABLE [EMP]
( 
	[EMP_FIRST_NM]       [first_name] ,
	[EMP_ADR]            [address] ,
	[EMP_PHONE]          [phone] ,
	[STR_NBR]            integer  NULL ,
	[EMP_ADR_2]          [address_2] ,
	[EMAIL]              varchar(20)  NULL ,
	[SALARY]             integer  NULL ,
	[HIRE_DT]            datetime  NULL ,
	[SOC_SEC_NBR]        integer  NULL ,
	[EMP_NBR]            varchar(20)  NOT NULL ,
	[SUPERVISOR]         varchar(20)  NOT NULL 
)
go

CREATE TABLE [MO_RENT_REC]
( 
	[RNTL_DT]            datetime  NULL ,
	[DUE_DT]             datetime  NULL ,
	[RNTL_STATUS]        varchar(20)  NULL ,
	[PYMT_TRANSACTION_NBR] integer  NULL ,
	[OVERDUE_CHARGE]     integer  NULL ,
	[RNTL_RATE]          integer  NULL ,
	[EMP_PHONE]          [phone]  NOT NULL ,
	[SOC_SEC_NBR]        integer  NOT NULL ,
	[RNTL_RECORD_DT]     datetime  NOT NULL ,
	[MV_COPY_NBR]        integer  NOT NULL ,
	[MV_NBR]             integer  NOT NULL ,
	[CSTM_NBR]           integer  NOT NULL 
)
go

CREATE TABLE [MOVIE]
( 
	[MV_TITLE]           [title] ,
	[MV_DIRECTOR]        [director] ,
	[DESCRIPTION]        varchar(20)  NULL ,
	[STAR_1_NM]          [first_name] ,
	[RATING]             varchar  NULL ,
	[STAR_2_NM]          [first_name] ,
	[MV_NBR]             integer  NOT NULL ,
	[GENRE]              varchar(2)  NULL ,
	[RNTL_RATE]          numeric  NULL ,
	[MV_URL]             varchar  NULL ,
	[MV_CLIP]            varbinary  NULL 
)
go

CREATE TABLE [MOVIE_COPY]
( 
	[GENERAL_CONDITION]  varchar(20)  NULL ,
	[MV_FORMAT]          varchar(20)  NULL ,
	[MV_COPY_NBR]        integer  NOT NULL ,
	[MV_NBR]             integer  NOT NULL 
)
go

CREATE TABLE [MOVIE_STORE]
( 
	[MV_NBR]             integer  NOT NULL ,
	[STR_NBR]            integer  NOT NULL 
)
go

CREATE TABLE [PAYMENT]
( 
	[PYMT_TRANSACTION_NBR] integer  NOT NULL ,
	[PYMT_TYPE]          char(18)  NULL ,
	[PYMT_AMOUNT]        numeric  NULL ,
	[PYMT_DT]            datetime  NULL ,
	[PYMT_STATUS]        varchar(1)  NULL ,
	[EMP_NBR]            varchar(20)  NOT NULL ,
	[CSTM_NBR]           integer  NULL ,
	[customer_no]        integer  NULL ,
	[CHK_BANK_NBR]       integer  NULL ,
	[CHK_NBR]            integer  NULL ,
	[EPAY_VENDOR_NBR]    integer  NULL ,
	[EPAY_ACCOUNT_NBR]   integer  NULL ,
	[CRDT_CRD_NBR]       char(18)  NULL ,
	[CRDT_CRD_EXP]       datetime  NULL ,
	[CRDT_CRD_TYPE]      char(18)  NULL 
)
go

CREATE TABLE [STORE]
( 
	[STR_MANAGER]        [manager] ,
	[STR_ADR]            [address] ,
	[STR_ADR_2]          [address_2] ,
	[STR_PHONE]          [phone] ,
	[STR_CITY]           [city] ,
	[STR_STATE]          [state] ,
	[STR_ZIP_CD]         [zip_code] ,
	[STR_NBR]            integer  NOT NULL 
)
go

ALTER TABLE [CUST]
	ADD CONSTRAINT [XPKCUSTOMER] PRIMARY KEY  CLUSTERED ([CSTM_NBR] ASC)
go

ALTER TABLE [CUST]
	ADD CONSTRAINT [XAK1CUSTOMER] UNIQUE ([CSTM_ADR]  ASC)
go

CREATE NONCLUSTERED INDEX [XIE1CUSTOMER] ON [CUST]
( 
	[CSTM_LAST_NM]        ASC
)
go

ALTER TABLE [CUST_CREDIT]
	ADD CONSTRAINT [XPKCUSTOMER_CREDIT] PRIMARY KEY  CLUSTERED ([CSTM_NBR] ASC)
go

ALTER TABLE [EMP]
	ADD CONSTRAINT [XPKEMPLOYEE] PRIMARY KEY  CLUSTERED ([EMP_NBR] ASC)
go

ALTER TABLE [EMP]
	ADD CONSTRAINT [XAK1EMPLOYEE] UNIQUE ([SOC_SEC_NBR]  ASC,[EMP_PHONE]  ASC)
go

CREATE NONCLUSTERED INDEX [XIE1EMPLOYEE] ON [EMP]
( 
	[EMP_FIRST_NM]        ASC
)
go

ALTER TABLE [MO_RENT_REC]
	ADD CONSTRAINT [XPKMOVIE_RENTAL_RECORD] PRIMARY KEY  CLUSTERED ([RNTL_RECORD_DT] ASC,[MV_COPY_NBR] ASC,[MV_NBR] ASC,[SOC_SEC_NBR] ASC,[EMP_PHONE] ASC,[CSTM_NBR] ASC)
go

ALTER TABLE [MOVIE]
	ADD CONSTRAINT [XPKMOVIE] PRIMARY KEY  CLUSTERED ([MV_NBR] ASC)
go

ALTER TABLE [MOVIE]
	ADD CONSTRAINT [XAK1MOVIE] UNIQUE ([MV_TITLE]  ASC)
go

ALTER TABLE [MOVIE_COPY]
	ADD CONSTRAINT [XPKMOVIE_COPY] PRIMARY KEY  CLUSTERED ([MV_COPY_NBR] ASC,[MV_NBR] ASC)
go

ALTER TABLE [MOVIE_STORE]
	ADD CONSTRAINT [XPKMOVIE_STORE] PRIMARY KEY  CLUSTERED ([MV_NBR] ASC,[STR_NBR] ASC)
go

ALTER TABLE [PAYMENT]
	ADD CONSTRAINT [XPKPAYMENT] PRIMARY KEY  CLUSTERED ([PYMT_TRANSACTION_NBR] ASC)
go

ALTER TABLE [STORE]
	ADD CONSTRAINT [XPKSTORE] PRIMARY KEY  CLUSTERED ([STR_NBR] ASC)
go

CREATE NONCLUSTERED INDEX [XIE1STORE] ON [STORE]
( 
	[STR_MANAGER]         ASC
)
go

CREATE VIEW [CUSTOMER_INVOICE]([CRDT_CRD],[CRDT_CRD_EXP],[STATUS_CD],[CSTM_NBR],[CSTM_ADR],[EMAIL],[CSTM_CITY],[CSTM_FIRST_NM],[CSTM_LAST_NM],[CSTM_STATE],[CSTM_ZIP_CD],[RNTL_RECORD_DT],[MV_COPY_NBR],[MV_NBR],[RNTL_DT],[DUE_DT],[RNTL_STATUS],[OVERDUE_CHARGE],[RNTL_RATE],[MV_TITLE],[Overdue_Charge_Rate])
AS
SELECT ALL [CUST_CREDIT].[CRDT_CRD],[CUST_CREDIT].[CRDT_CRD_EXP],[CUST_CREDIT].[STATUS_CD],[CUST].[CSTM_NBR],[CUST].[CSTM_ADR],[CUST].[EMAIL],[CUST].[CSTM_CITY],[CUST].[CSTM_FIRST_NM],[CUST].[CSTM_LAST_NM],[CUST].[CSTM_STATE],[CUST].[CSTM_ZIP_CD],[MO_RENT_REC].[RNTL_RECORD_DT],[MO_RENT_REC].[MV_COPY_NBR],[MO_RENT_REC].[MV_NBR],[MO_RENT_REC].[RNTL_DT],[MO_RENT_REC].[DUE_DT],[MO_RENT_REC].[RNTL_STATUS],[MO_RENT_REC].[OVERDUE_CHARGE],[MO_RENT_REC].[RNTL_RATE],[MOVIE].[MV_TITLE],rental_rate * 1.5
	FROM [CUST_CREDIT],[CUST],[MO_RENT_REC],[MOVIE]
go

CREATE VIEW [OVERDUE_NOTICE]([CRDT_CRD],[CRDT_CRD_EXP],[STATUS_CD],[Overdue_Charge_Rate],[CSTM_NBR],[CSTM_ADR],[EMAIL],[CSTM_CITY],[CSTM_FIRST_NM],[CSTM_LAST_NM],[CSTM_STATE],[CSTM_ZIP_CD],[RNTL_RECORD_DT],[MV_COPY_NBR],[MV_NBR],[RNTL_DT],[DUE_DT],[RNTL_STATUS],[OVERDUE_CHARGE],[RNTL_RATE])
AS
SELECT ALL [CUST_CREDIT].[CRDT_CRD],[CUST_CREDIT].[CRDT_CRD_EXP],[CUST_CREDIT].[STATUS_CD],rental_rate * 1.5,[CUST].[CSTM_NBR],[CUST].[CSTM_ADR],[CUST].[EMAIL],[CUST].[CSTM_CITY],[CUST].[CSTM_FIRST_NM],[CUST].[CSTM_LAST_NM],[CUST].[CSTM_STATE],[CUST].[CSTM_ZIP_CD],[MO_RENT_REC].[RNTL_RECORD_DT],[MO_RENT_REC].[MV_COPY_NBR],[MO_RENT_REC].[MV_NBR],[MO_RENT_REC].[RNTL_DT],[MO_RENT_REC].[DUE_DT],[MO_RENT_REC].[RNTL_STATUS],[MO_RENT_REC].[OVERDUE_CHARGE],[MO_RENT_REC].[RNTL_RATE]
	FROM [CUST_CREDIT],[CUST],[MO_RENT_REC]
go


ALTER TABLE [EMP]
	ADD CONSTRAINT [employs_is] FOREIGN KEY ([STR_NBR]) REFERENCES [STORE]([STR_NBR])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [EMP]
	ADD CONSTRAINT [reports_to] FOREIGN KEY ([SUPERVISOR]) REFERENCES [EMP]([EMP_NBR])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [MO_RENT_REC]
	ADD CONSTRAINT [completes] FOREIGN KEY ([SOC_SEC_NBR],[EMP_PHONE]) REFERENCES [EMP]([SOC_SEC_NBR],[EMP_PHONE])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MO_RENT_REC]
	ADD CONSTRAINT [is_rented_under] FOREIGN KEY ([MV_COPY_NBR],[MV_NBR]) REFERENCES [MOVIE_COPY]([MV_COPY_NBR],[MV_NBR])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MO_RENT_REC]
	ADD CONSTRAINT [R_8_1] FOREIGN KEY ([CSTM_NBR]) REFERENCES [CUST]([CSTM_NBR])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MO_RENT_REC]
	ADD CONSTRAINT [R_8_2] FOREIGN KEY ([CSTM_NBR]) REFERENCES [CUST_CREDIT]([CSTM_NBR])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MO_RENT_REC]
	ADD CONSTRAINT [is_made_on] FOREIGN KEY ([PYMT_TRANSACTION_NBR]) REFERENCES [PAYMENT]([PYMT_TRANSACTION_NBR])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


exec sp_bindrule '[Movie_genre]', '[MOVIE].[GENRE]'
go


ALTER TABLE [MOVIE_COPY]
	ADD CONSTRAINT [is_rented_as] FOREIGN KEY ([MV_NBR]) REFERENCES [MOVIE]([MV_NBR])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [MOVIE_STORE]
	ADD CONSTRAINT [rents] FOREIGN KEY ([MV_NBR]) REFERENCES [MOVIE]([MV_NBR])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [MOVIE_STORE]
	ADD CONSTRAINT [is_in] FOREIGN KEY ([STR_NBR]) REFERENCES [STORE]([STR_NBR])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [PAYMENT]
	ADD CONSTRAINT [receives] FOREIGN KEY ([EMP_NBR]) REFERENCES [EMP]([EMP_NBR])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [PAYMENT]
	ADD CONSTRAINT [R_7_1] FOREIGN KEY ([customer_no]) REFERENCES [CUST]([CSTM_NBR])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [PAYMENT]
	ADD CONSTRAINT [R_7_2] FOREIGN KEY ([CSTM_NBR]) REFERENCES [CUST_CREDIT]([CSTM_NBR])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


CREATE TRIGGER tD_CUST ON CUST FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CUST */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* CUST makes PAYMENT on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001fe1c", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="R_7_1", FK_COLUMNS="customer_no" */
    IF EXISTS (
      SELECT * FROM deleted,PAYMENT
      WHERE
        /*  %JoinFKPK(PAYMENT,deleted," = "," AND") */
        PAYMENT.customer_no = deleted.CSTM_NBR
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CUST because PAYMENT exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUST rents under MO_RENT_REC on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_1", 
    FK_CONSTRAINT="R_8_1", FK_COLUMNS="CSTM_NBR" */
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.CSTM_NBR = deleted.CSTM_NBR
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CUST because MO_RENT_REC exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_CUST ON CUST FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CUST */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCSTM_NBR integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* CUST makes PAYMENT on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00023ee9", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="R_7_1", FK_COLUMNS="customer_no" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CSTM_NBR)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,PAYMENT
      WHERE
        /*  %JoinFKPK(PAYMENT,deleted," = "," AND") */
        PAYMENT.customer_no = deleted.CSTM_NBR
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CUST because PAYMENT exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUST rents under MO_RENT_REC on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_1", 
    FK_CONSTRAINT="R_8_1", FK_COLUMNS="CSTM_NBR" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CSTM_NBR)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.CSTM_NBR = deleted.CSTM_NBR
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CUST because MO_RENT_REC exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_CUST_CREDIT ON CUST_CREDIT FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on CUST_CREDIT */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* CUST_CREDIT makes PAYMENT on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000206f5", PARENT_OWNER="", PARENT_TABLE="CUST_CREDIT"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="R_7_2", FK_COLUMNS="CSTM_NBR" */
    IF EXISTS (
      SELECT * FROM deleted,PAYMENT
      WHERE
        /*  %JoinFKPK(PAYMENT,deleted," = "," AND") */
        PAYMENT.CSTM_NBR = deleted.CSTM_NBR
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CUST_CREDIT because PAYMENT exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUST_CREDIT rents under MO_RENT_REC on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST_CREDIT"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_2", 
    FK_CONSTRAINT="R_8_2", FK_COLUMNS="CSTM_NBR" */
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.CSTM_NBR = deleted.CSTM_NBR
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete CUST_CREDIT because MO_RENT_REC exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_CUST_CREDIT ON CUST_CREDIT FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on CUST_CREDIT */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCSTM_NBR integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* CUST_CREDIT makes PAYMENT on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00023a41", PARENT_OWNER="", PARENT_TABLE="CUST_CREDIT"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="R_7_2", FK_COLUMNS="CSTM_NBR" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CSTM_NBR)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,PAYMENT
      WHERE
        /*  %JoinFKPK(PAYMENT,deleted," = "," AND") */
        PAYMENT.CSTM_NBR = deleted.CSTM_NBR
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CUST_CREDIT because PAYMENT exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUST_CREDIT rents under MO_RENT_REC on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST_CREDIT"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_2", 
    FK_CONSTRAINT="R_8_2", FK_COLUMNS="CSTM_NBR" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CSTM_NBR)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.CSTM_NBR = deleted.CSTM_NBR
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update CUST_CREDIT because MO_RENT_REC exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_EMP ON EMP FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on EMP */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* EMP receives PAYMENT on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00053e0d", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="receives", FK_COLUMNS="EMP_NBR" */
    IF EXISTS (
      SELECT * FROM deleted,PAYMENT
      WHERE
        /*  %JoinFKPK(PAYMENT,deleted," = "," AND") */
        PAYMENT.EMP_NBR = deleted.EMP_NBR
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete EMP because PAYMENT exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* EMP reports to EMP on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="EMP"
    P2C_VERB_PHRASE="reports to", C2P_VERB_PHRASE="supervises", 
    FK_CONSTRAINT="reports_to", FK_COLUMNS="SUPERVISOR" */
    IF EXISTS (
      SELECT * FROM deleted,EMP
      WHERE
        /*  %JoinFKPK(EMP,deleted," = "," AND") */
        EMP.SUPERVISOR = deleted.EMP_NBR
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete EMP because EMP exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* EMP completes MO_RENT_REC on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="completes", C2P_VERB_PHRASE="is completed by", 
    FK_CONSTRAINT="completes", FK_COLUMNS="SOC_SEC_NBR""EMP_PHONE" */
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.EMP_PHONE = deleted.EMP_PHONE AND
        MO_RENT_REC.SOC_SEC_NBR = deleted.SOC_SEC_NBR
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete EMP because MO_RENT_REC exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* EMP reports to EMP on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="EMP"
    P2C_VERB_PHRASE="reports to", C2P_VERB_PHRASE="supervises", 
    FK_CONSTRAINT="reports_to", FK_COLUMNS="SUPERVISOR" */
    IF EXISTS (SELECT * FROM deleted,EMP
      WHERE
        /* %JoinFKPK(deleted,EMP," = "," AND") */
        deleted.SUPERVISOR = EMP.EMP_NBR AND
        NOT EXISTS (
          SELECT * FROM EMP
          WHERE
            /* %JoinFKPK(EMP,EMP," = "," AND") */
            EMP.SUPERVISOR = EMP.EMP_NBR
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last EMP because EMP exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* STORE employs is EMP on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="EMP"
    P2C_VERB_PHRASE="employs is", C2P_VERB_PHRASE="is employed by", 
    FK_CONSTRAINT="employs_is", FK_COLUMNS="STR_NBR" */
    IF EXISTS (SELECT * FROM deleted,STORE
      WHERE
        /* %JoinFKPK(deleted,STORE," = "," AND") */
        deleted.STR_NBR = STORE.STR_NBR AND
        NOT EXISTS (
          SELECT * FROM EMP
          WHERE
            /* %JoinFKPK(EMP,STORE," = "," AND") */
            EMP.STR_NBR = STORE.STR_NBR
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last EMP because STORE exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_EMP ON EMP FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on EMP */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insEMP_NBR varchar(20),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* EMP receives PAYMENT on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000636d6", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="receives", FK_COLUMNS="EMP_NBR" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EMP_NBR)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,PAYMENT
      WHERE
        /*  %JoinFKPK(PAYMENT,deleted," = "," AND") */
        PAYMENT.EMP_NBR = deleted.EMP_NBR
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update EMP because PAYMENT exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* EMP reports to EMP on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="EMP"
    P2C_VERB_PHRASE="reports to", C2P_VERB_PHRASE="supervises", 
    FK_CONSTRAINT="reports_to", FK_COLUMNS="SUPERVISOR" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EMP_NBR)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,EMP
      WHERE
        /*  %JoinFKPK(EMP,deleted," = "," AND") */
        EMP.SUPERVISOR = deleted.EMP_NBR
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update EMP because EMP exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* EMP completes MO_RENT_REC on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="completes", C2P_VERB_PHRASE="is completed by", 
    FK_CONSTRAINT="completes", FK_COLUMNS="SOC_SEC_NBR""EMP_PHONE" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(EMP_NBR)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.EMP_PHONE = deleted.EMP_PHONE AND
        MO_RENT_REC.SOC_SEC_NBR = deleted.SOC_SEC_NBR
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update EMP because MO_RENT_REC exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* EMP reports to EMP on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="EMP"
    P2C_VERB_PHRASE="reports to", C2P_VERB_PHRASE="supervises", 
    FK_CONSTRAINT="reports_to", FK_COLUMNS="SUPERVISOR" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(SUPERVISOR)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,EMP
        WHERE
          /* %JoinFKPK(inserted,EMP) */
          inserted.SUPERVISOR = EMP.EMP_NBR
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.SUPERVISOR IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update EMP because EMP does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* STORE employs is EMP on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="EMP"
    P2C_VERB_PHRASE="employs is", C2P_VERB_PHRASE="is employed by", 
    FK_CONSTRAINT="employs_is", FK_COLUMNS="STR_NBR" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(STR_NBR)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,STORE
        WHERE
          /* %JoinFKPK(inserted,STORE) */
          inserted.STR_NBR = STORE.STR_NBR
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.STR_NBR IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update EMP because STORE does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_MO_RENT_REC ON MO_RENT_REC FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MO_RENT_REC */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* PAYMENT is made on MO_RENT_REC on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0006d4d4", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="is_made_on", FK_COLUMNS="PYMT_TRANSACTION_NBR" */
    IF EXISTS (SELECT * FROM deleted,PAYMENT
      WHERE
        /* %JoinFKPK(deleted,PAYMENT," = "," AND") */
        deleted.PYMT_TRANSACTION_NBR = PAYMENT.PYMT_TRANSACTION_NBR AND
        NOT EXISTS (
          SELECT * FROM MO_RENT_REC
          WHERE
            /* %JoinFKPK(MO_RENT_REC,PAYMENT," = "," AND") */
            MO_RENT_REC.PYMT_TRANSACTION_NBR = PAYMENT.PYMT_TRANSACTION_NBR
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MO_RENT_REC because PAYMENT exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUST_CREDIT rents under MO_RENT_REC on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST_CREDIT"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_2", 
    FK_CONSTRAINT="R_8_2", FK_COLUMNS="CSTM_NBR" */
    IF EXISTS (SELECT * FROM deleted,CUST_CREDIT
      WHERE
        /* %JoinFKPK(deleted,CUST_CREDIT," = "," AND") */
        deleted.CSTM_NBR = CUST_CREDIT.CSTM_NBR AND
        NOT EXISTS (
          SELECT * FROM MO_RENT_REC
          WHERE
            /* %JoinFKPK(MO_RENT_REC,CUST_CREDIT," = "," AND") */
            MO_RENT_REC.CSTM_NBR = CUST_CREDIT.CSTM_NBR
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MO_RENT_REC because CUST_CREDIT exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUST rents under MO_RENT_REC on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_1", 
    FK_CONSTRAINT="R_8_1", FK_COLUMNS="CSTM_NBR" */
    IF EXISTS (SELECT * FROM deleted,CUST
      WHERE
        /* %JoinFKPK(deleted,CUST," = "," AND") */
        deleted.CSTM_NBR = CUST.CSTM_NBR AND
        NOT EXISTS (
          SELECT * FROM MO_RENT_REC
          WHERE
            /* %JoinFKPK(MO_RENT_REC,CUST," = "," AND") */
            MO_RENT_REC.CSTM_NBR = CUST.CSTM_NBR
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MO_RENT_REC because CUST exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MOVIE_COPY is rented under MO_RENT_REC on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE_COPY"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="records rental of a", 
    FK_CONSTRAINT="is_rented_under", FK_COLUMNS="MV_COPY_NBR""MV_NBR" */
    IF EXISTS (SELECT * FROM deleted,MOVIE_COPY
      WHERE
        /* %JoinFKPK(deleted,MOVIE_COPY," = "," AND") */
        deleted.MV_COPY_NBR = MOVIE_COPY.MV_COPY_NBR AND
        deleted.MV_NBR = MOVIE_COPY.MV_NBR AND
        NOT EXISTS (
          SELECT * FROM MO_RENT_REC
          WHERE
            /* %JoinFKPK(MO_RENT_REC,MOVIE_COPY," = "," AND") */
            MO_RENT_REC.MV_COPY_NBR = MOVIE_COPY.MV_COPY_NBR AND
            MO_RENT_REC.MV_NBR = MOVIE_COPY.MV_NBR
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MO_RENT_REC because MOVIE_COPY exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* EMP completes MO_RENT_REC on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="completes", C2P_VERB_PHRASE="is completed by", 
    FK_CONSTRAINT="completes", FK_COLUMNS="SOC_SEC_NBR""EMP_PHONE" */
    IF EXISTS (SELECT * FROM deleted,EMP
      WHERE
        /* %JoinFKPK(deleted,EMP," = "," AND") */
        deleted.EMP_PHONE = EMP.EMP_PHONE AND
        deleted.SOC_SEC_NBR = EMP.SOC_SEC_NBR AND
        NOT EXISTS (
          SELECT * FROM MO_RENT_REC
          WHERE
            /* %JoinFKPK(MO_RENT_REC,EMP," = "," AND") */
            MO_RENT_REC.EMP_PHONE = EMP.EMP_PHONE AND
            MO_RENT_REC.SOC_SEC_NBR = EMP.SOC_SEC_NBR
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MO_RENT_REC because EMP exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_MO_RENT_REC ON MO_RENT_REC FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MO_RENT_REC */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insEMP_PHONE phone, 
           @insSOC_SEC_NBR integer, 
           @insRNTL_RECORD_DT datetime, 
           @insMV_COPY_NBR integer, 
           @insMV_NBR integer, 
           @insCSTM_NBR integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* PAYMENT is made on MO_RENT_REC on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00075f63", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="is_made_on", FK_COLUMNS="PYMT_TRANSACTION_NBR" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(PYMT_TRANSACTION_NBR)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,PAYMENT
        WHERE
          /* %JoinFKPK(inserted,PAYMENT) */
          inserted.PYMT_TRANSACTION_NBR = PAYMENT.PYMT_TRANSACTION_NBR
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.PYMT_TRANSACTION_NBR IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MO_RENT_REC because PAYMENT does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUST_CREDIT rents under MO_RENT_REC on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST_CREDIT"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_2", 
    FK_CONSTRAINT="R_8_2", FK_COLUMNS="CSTM_NBR" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CSTM_NBR)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CUST_CREDIT
        WHERE
          /* %JoinFKPK(inserted,CUST_CREDIT) */
          inserted.CSTM_NBR = CUST_CREDIT.CSTM_NBR
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MO_RENT_REC because CUST_CREDIT does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUST rents under MO_RENT_REC on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_1", 
    FK_CONSTRAINT="R_8_1", FK_COLUMNS="CSTM_NBR" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CSTM_NBR)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CUST
        WHERE
          /* %JoinFKPK(inserted,CUST) */
          inserted.CSTM_NBR = CUST.CSTM_NBR
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MO_RENT_REC because CUST does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MOVIE_COPY is rented under MO_RENT_REC on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE_COPY"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="records rental of a", 
    FK_CONSTRAINT="is_rented_under", FK_COLUMNS="MV_COPY_NBR""MV_NBR" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MV_COPY_NBR) OR
    UPDATE(MV_NBR)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,MOVIE_COPY
        WHERE
          /* %JoinFKPK(inserted,MOVIE_COPY) */
          inserted.MV_COPY_NBR = MOVIE_COPY.MV_COPY_NBR and
          inserted.MV_NBR = MOVIE_COPY.MV_NBR
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MO_RENT_REC because MOVIE_COPY does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* EMP completes MO_RENT_REC on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="completes", C2P_VERB_PHRASE="is completed by", 
    FK_CONSTRAINT="completes", FK_COLUMNS="SOC_SEC_NBR""EMP_PHONE" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(EMP_PHONE) OR
    UPDATE(SOC_SEC_NBR)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,EMP
        WHERE
          /* %JoinFKPK(inserted,EMP) */
          inserted.EMP_PHONE = EMP.EMP_PHONE and
          inserted.SOC_SEC_NBR = EMP.SOC_SEC_NBR
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MO_RENT_REC because EMP does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_MOVIE ON MOVIE FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MOVIE */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* MOVIE rents MOVIE_STORE on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000204df", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="rents", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rents", FK_COLUMNS="MV_NBR" */
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_STORE
      WHERE
        /*  %JoinFKPK(MOVIE_STORE,deleted," = "," AND") */
        MOVIE_STORE.MV_NBR = deleted.MV_NBR
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete MOVIE because MOVIE_STORE exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MOVIE is rented as MOVIE_COPY on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_COPY"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="is_rented_as", FK_COLUMNS="MV_NBR" */
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_COPY
      WHERE
        /*  %JoinFKPK(MOVIE_COPY,deleted," = "," AND") */
        MOVIE_COPY.MV_NBR = deleted.MV_NBR
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete MOVIE because MOVIE_COPY exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_MOVIE ON MOVIE FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MOVIE */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMV_NBR integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* MOVIE rents MOVIE_STORE on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00024881", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="rents", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rents", FK_COLUMNS="MV_NBR" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MV_NBR)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_STORE
      WHERE
        /*  %JoinFKPK(MOVIE_STORE,deleted," = "," AND") */
        MOVIE_STORE.MV_NBR = deleted.MV_NBR
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update MOVIE because MOVIE_STORE exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MOVIE is rented as MOVIE_COPY on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_COPY"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="is_rented_as", FK_COLUMNS="MV_NBR" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MV_NBR)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_COPY
      WHERE
        /*  %JoinFKPK(MOVIE_COPY,deleted," = "," AND") */
        MOVIE_COPY.MV_NBR = deleted.MV_NBR
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update MOVIE because MOVIE_COPY exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_MOVIE_COPY ON MOVIE_COPY FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MOVIE_COPY */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* MOVIE_COPY is rented under MO_RENT_REC on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00026141", PARENT_OWNER="", PARENT_TABLE="MOVIE_COPY"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="records rental of a", 
    FK_CONSTRAINT="is_rented_under", FK_COLUMNS="MV_COPY_NBR""MV_NBR" */
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.MV_COPY_NBR = deleted.MV_COPY_NBR AND
        MO_RENT_REC.MV_NBR = deleted.MV_NBR
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete MOVIE_COPY because MO_RENT_REC exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MOVIE is rented as MOVIE_COPY on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_COPY"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="is_rented_as", FK_COLUMNS="MV_NBR" */
    IF EXISTS (SELECT * FROM deleted,MOVIE
      WHERE
        /* %JoinFKPK(deleted,MOVIE," = "," AND") */
        deleted.MV_NBR = MOVIE.MV_NBR AND
        NOT EXISTS (
          SELECT * FROM MOVIE_COPY
          WHERE
            /* %JoinFKPK(MOVIE_COPY,MOVIE," = "," AND") */
            MOVIE_COPY.MV_NBR = MOVIE.MV_NBR
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MOVIE_COPY because MOVIE exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_MOVIE_COPY ON MOVIE_COPY FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MOVIE_COPY */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMV_COPY_NBR integer, 
           @insMV_NBR integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* MOVIE_COPY is rented under MO_RENT_REC on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0002b9c6", PARENT_OWNER="", PARENT_TABLE="MOVIE_COPY"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="records rental of a", 
    FK_CONSTRAINT="is_rented_under", FK_COLUMNS="MV_COPY_NBR""MV_NBR" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(MV_COPY_NBR) OR
    UPDATE(MV_NBR)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.MV_COPY_NBR = deleted.MV_COPY_NBR AND
        MO_RENT_REC.MV_NBR = deleted.MV_NBR
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update MOVIE_COPY because MO_RENT_REC exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MOVIE is rented as MOVIE_COPY on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_COPY"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="is_rented_as", FK_COLUMNS="MV_NBR" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MV_NBR)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,MOVIE
        WHERE
          /* %JoinFKPK(inserted,MOVIE) */
          inserted.MV_NBR = MOVIE.MV_NBR
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MOVIE_COPY because MOVIE does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_MOVIE_STORE ON MOVIE_STORE FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on MOVIE_STORE */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* STORE is in MOVIE_STORE on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00026470", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="is in", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_in", FK_COLUMNS="STR_NBR" */
    IF EXISTS (SELECT * FROM deleted,STORE
      WHERE
        /* %JoinFKPK(deleted,STORE," = "," AND") */
        deleted.STR_NBR = STORE.STR_NBR AND
        NOT EXISTS (
          SELECT * FROM MOVIE_STORE
          WHERE
            /* %JoinFKPK(MOVIE_STORE,STORE," = "," AND") */
            MOVIE_STORE.STR_NBR = STORE.STR_NBR
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MOVIE_STORE because STORE exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* MOVIE rents MOVIE_STORE on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="rents", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rents", FK_COLUMNS="MV_NBR" */
    IF EXISTS (SELECT * FROM deleted,MOVIE
      WHERE
        /* %JoinFKPK(deleted,MOVIE," = "," AND") */
        deleted.MV_NBR = MOVIE.MV_NBR AND
        NOT EXISTS (
          SELECT * FROM MOVIE_STORE
          WHERE
            /* %JoinFKPK(MOVIE_STORE,MOVIE," = "," AND") */
            MOVIE_STORE.MV_NBR = MOVIE.MV_NBR
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last MOVIE_STORE because MOVIE exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_MOVIE_STORE ON MOVIE_STORE FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on MOVIE_STORE */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMV_NBR integer, 
           @insSTR_NBR integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* STORE is in MOVIE_STORE on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00029d66", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="is in", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_in", FK_COLUMNS="STR_NBR" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(STR_NBR)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,STORE
        WHERE
          /* %JoinFKPK(inserted,STORE) */
          inserted.STR_NBR = STORE.STR_NBR
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MOVIE_STORE because STORE does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* MOVIE rents MOVIE_STORE on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="rents", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rents", FK_COLUMNS="MV_NBR" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(MV_NBR)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,MOVIE
        WHERE
          /* %JoinFKPK(inserted,MOVIE) */
          inserted.MV_NBR = MOVIE.MV_NBR
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update MOVIE_STORE because MOVIE does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_PAYMENT ON PAYMENT FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on PAYMENT */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* PAYMENT is made on MO_RENT_REC on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00049e5d", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="is_made_on", FK_COLUMNS="PYMT_TRANSACTION_NBR" */
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.PYMT_TRANSACTION_NBR = deleted.PYMT_TRANSACTION_NBR
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete PAYMENT because MO_RENT_REC exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUST_CREDIT makes PAYMENT on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST_CREDIT"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="R_7_2", FK_COLUMNS="CSTM_NBR" */
    IF EXISTS (SELECT * FROM deleted,CUST_CREDIT
      WHERE
        /* %JoinFKPK(deleted,CUST_CREDIT," = "," AND") */
        deleted.CSTM_NBR = CUST_CREDIT.CSTM_NBR AND
        NOT EXISTS (
          SELECT * FROM PAYMENT
          WHERE
            /* %JoinFKPK(PAYMENT,CUST_CREDIT," = "," AND") */
            PAYMENT.CSTM_NBR = CUST_CREDIT.CSTM_NBR
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last PAYMENT because CUST_CREDIT exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* CUST makes PAYMENT on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="R_7_1", FK_COLUMNS="customer_no" */
    IF EXISTS (SELECT * FROM deleted,CUST
      WHERE
        /* %JoinFKPK(deleted,CUST," = "," AND") */
        deleted.customer_no = CUST.CSTM_NBR AND
        NOT EXISTS (
          SELECT * FROM PAYMENT
          WHERE
            /* %JoinFKPK(PAYMENT,CUST," = "," AND") */
            PAYMENT.customer_no = CUST.CSTM_NBR
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last PAYMENT because CUST exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* EMP receives PAYMENT on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="receives", FK_COLUMNS="EMP_NBR" */
    IF EXISTS (SELECT * FROM deleted,EMP
      WHERE
        /* %JoinFKPK(deleted,EMP," = "," AND") */
        deleted.EMP_NBR = EMP.EMP_NBR AND
        NOT EXISTS (
          SELECT * FROM PAYMENT
          WHERE
            /* %JoinFKPK(PAYMENT,EMP," = "," AND") */
            PAYMENT.EMP_NBR = EMP.EMP_NBR
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last PAYMENT because EMP exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_PAYMENT ON PAYMENT FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on PAYMENT */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insPYMT_TRANSACTION_NBR integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* PAYMENT is made on MO_RENT_REC on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000579f6", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="is_made_on", FK_COLUMNS="PYMT_TRANSACTION_NBR" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(PYMT_TRANSACTION_NBR)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,deleted," = "," AND") */
        MO_RENT_REC.PYMT_TRANSACTION_NBR = deleted.PYMT_TRANSACTION_NBR
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update PAYMENT because MO_RENT_REC exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUST_CREDIT makes PAYMENT on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST_CREDIT"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="R_7_2", FK_COLUMNS="CSTM_NBR" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CSTM_NBR)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CUST_CREDIT
        WHERE
          /* %JoinFKPK(inserted,CUST_CREDIT) */
          inserted.CSTM_NBR = CUST_CREDIT.CSTM_NBR
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CSTM_NBR IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update PAYMENT because CUST_CREDIT does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* CUST makes PAYMENT on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="R_7_1", FK_COLUMNS="customer_no" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(customer_no)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,CUST
        WHERE
          /* %JoinFKPK(inserted,CUST) */
          inserted.customer_no = CUST.CSTM_NBR
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.customer_no IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update PAYMENT because CUST does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* EMP receives PAYMENT on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="receives", FK_COLUMNS="EMP_NBR" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(EMP_NBR)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,EMP
        WHERE
          /* %JoinFKPK(inserted,EMP) */
          inserted.EMP_NBR = EMP.EMP_NBR
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.EMP_NBR IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update PAYMENT because EMP does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER tD_STORE ON STORE FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on STORE */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* STORE is in MOVIE_STORE on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001fc2e", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="is in", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_in", FK_COLUMNS="STR_NBR" */
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_STORE
      WHERE
        /*  %JoinFKPK(MOVIE_STORE,deleted," = "," AND") */
        MOVIE_STORE.STR_NBR = deleted.STR_NBR
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete STORE because MOVIE_STORE exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* STORE employs is EMP on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="EMP"
    P2C_VERB_PHRASE="employs is", C2P_VERB_PHRASE="is employed by", 
    FK_CONSTRAINT="employs_is", FK_COLUMNS="STR_NBR" */
    IF EXISTS (
      SELECT * FROM deleted,EMP
      WHERE
        /*  %JoinFKPK(EMP,deleted," = "," AND") */
        EMP.STR_NBR = deleted.STR_NBR
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete STORE because EMP exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go


CREATE TRIGGER tU_STORE ON STORE FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on STORE */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insSTR_NBR integer,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* STORE is in MOVIE_STORE on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00023622", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="is in", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_in", FK_COLUMNS="STR_NBR" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(STR_NBR)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,MOVIE_STORE
      WHERE
        /*  %JoinFKPK(MOVIE_STORE,deleted," = "," AND") */
        MOVIE_STORE.STR_NBR = deleted.STR_NBR
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update STORE because MOVIE_STORE exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* STORE employs is EMP on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="EMP"
    P2C_VERB_PHRASE="employs is", C2P_VERB_PHRASE="is employed by", 
    FK_CONSTRAINT="employs_is", FK_COLUMNS="STR_NBR" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(STR_NBR)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,EMP
      WHERE
        /*  %JoinFKPK(EMP,deleted," = "," AND") */
        EMP.STR_NBR = deleted.STR_NBR
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update STORE because EMP exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




ALTER TABLE [MOVIE]
ADD [Movie_UDT]  date  NULL
go
