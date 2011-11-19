/* Code generated for Postgre_8_2_4 */

CREATE TABLE Schema.AbstractMeteorologicalObjectType(
) ;

CREATE TABLE Schema.UncertaintyArea(
id integer NOT NULL
) ;

ALTER TABLE Schema.UncertaintyArea ADD CONSTRAINT PK_UncertaintyArea PRIMARY KEY (id);

CREATE TABLE Schema.TimeInterpolation(
id boolean NOT NULL,
StandardObjectProperties integer,
method varchar(128) NOT NULL,
maxResolution integer
) ;

CREATE TABLE Schema.StandardObjectProperties(
Column1 interval (),
Column2 boolean
) ;

CREATE TABLE Schema.MeteorologicalObjectMetaDataPropertyType(
MeteorologicalObjectMetaData integer
) ;

CREATE TABLE Schema.maxResolution(
id integer NOT NULL,
unit varchar(16) NOT NULL,
radix integer,
factor integer,
decimal integer
) ;

ALTER TABLE Schema.maxResolution ADD CONSTRAINT PK_TimeIntervalLength PRIMARY KEY (id);

CREATE TABLE Schema.AssociationAttributeGroup(
DEPRECATED ???? 
char()
) ;

CREATE TABLE Schema.ApprovedMeteorologicalObjectCollection(
id_AMOC integer NOT NULL,
id_MOC integer
) ;

CREATE SEQUENCE SEQ_ApprovedMeteorologicalObjectCollection_id_AMOC»
	
	NO MINVALUE
	NO MAXVALUE
	START WITH 0
	NO CYCLE

	OWNED BY ApprovedMeteorologicalObjectCollection.id_AMOC;
ALTER TABLE ApprovedMeteorologicalObjectCollection ALTER COLUMN id_AMOC SET DEFAULT nextval('SEQ_ApprovedMeteorologicalObjectCollection_id_AMOC');

ALTER TABLE Schema.ApprovedMeteorologicalObjectCollection ADD CONSTRAINT PK_ApprovedMeteorologicalObjectCollection PRIMARY KEY (id_AMOC);

CREATE TABLE Schema.WeatherForecast(
id_WF float,
id_AMOC integer NOT NULL,
id_tR time() ,
forecastTime date NOT NULL
) ;

ALTER TABLE Schema.WeatherForecast ADD CONSTRAINT PK_WeatherForecast PRIMARY KEY (id_WF);

CREATE TABLE Schema.MeteorologicalObjectCollection(
id_MOC integer,
id_AF bytea,
id_members 
char(),
id_member float,
id_BOM date
) ;

ALTER TABLE Schema.MeteorologicalObjectCollection ADD CONSTRAINT PK_MeteorologicalObjectCollection PRIMARY KEY (id_MOC);

CREATE TABLE Schema.gml:validTime(
) ;

CREATE TABLE Schema.approval(
id_Ap interval (),
id varchar(128),
approvedBy varchar(1),
approvalTime date,
id_Signature varchar(128)
) ;

CREATE TABLE Schema.AbstractFeature(
id_AF date,
id_StandardObjectProperties 
char(),
id_AbstractGMLType interval ()
) ;

CREATE TABLE Schema.AbstractGMLType(
) ;

CREATE TABLE Schema.gml:boundedBy(
) ;

CREATE TABLE Schema.gml:location(
) ;

CREATE TABLE Schema.MeteorologicalAnalysis(
id_ApprovedMeteorologicalObjectCollection integer,
id_MA date,
id_AMOC integer NOT NULL,
analysisTime interval () NOT NULL
) ;

ALTER TABLE Schema.MeteorologicalAnalysis ADD CONSTRAINT PK_MeteorologicalAnalysis PRIMARY KEY (id_MA);

CREATE TABLE Schema.Authority(
id_Au integer,
authorityId varchar(256),
gml:id boolean
) ;

CREATE TABLE Schema.BasicObjectMetadata(
id_BOM integer NOT NULL,
id_MeteorologicalObjectCollection date,
integer,
id_metaData integer,
creationTime date NOT NULL,
latestModificationTime date,
shortInfo varchar(128),
longInfo varchar(2147483647),
Column1 date
) ;

ALTER TABLE Schema.BasicObjectMetadata ADD CONSTRAINT PK_BasicObjectMetadata PRIMARY KEY (id_BOM);

CREATE TABLE Schema.metaData(
id_metaData integer NOT NULL,
id_BasicObjectMetadata float,
title varchar(128),
creator varchar(128),
subject varchar(128),
description varchar(1024),
publisher varchar(128),
contributor varchar(128),
date varchar(128),
type varchar(128),
format varchar(128),
identifier varchar(128),
Language time() ,
language varchar(128),
float,
relation varchar(128),
coverage varchar(1024),
rights varchar(1024),
Column1 bytea,
keyword varchar(1024)
) ;

ALTER TABLE Schema.metaData ADD CONSTRAINT PK_MeteorologicalObjectMetaData PRIMARY KEY (id_metaData);

CREATE TABLE Schema.member(
id_m time() ,
date,
id_MeteorologicalObjectCollection bytea,
id_BOM integer,
UncertaintyArea integer
) ;

CREATE TABLE Schema.wf_ext_amoc(
id_WF boolean,
id_AMOC integer
) ;

CREATE TABLE Schema.Approvation(
id_AMOC time() ,
id_A bytea
) ;

ALTER TABLE Schema.Approvation ADD CONSTRAINT PK_Approvation PRIMARY KEY (id_AMOC,id_A);

CREATE TABLE Schema.ApprovedBy(
id_Ap date,
id_Au boolean
) ;

CREATE TABLE Schema.has(
id_MOC 
char(),
id_m integer
) ;

CREATE TABLE Schema.AbstractMeteorologicalObject(
id_AMO interval (),
id_BOM date
) ;

CREATE TABLE Schema.m_has_AMO(
id_m bytea,
id_AMO interval ()
) ;

CREATE TABLE Schema.targetRegion(
id_tR boolean
) ;

CREATE TABLE Schema.WF_has_tR(
id_WF integer,
id_tR interval ()
) ;

CREATE TABLE Schema.MA_has_tR(
id_MA bytea,
id_tR boolean
) ;

ALTER TABLE ApprovedMeteorologicalObjectCollection ADD CONSTRAINT MeteorologicalObjectCollection FOREIGN KEY (id_MOC) REFERENCES MeteorologicalObjectCollection(id_MOC) NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE ApprovedMeteorologicalObjectCollection ADD CONSTRAINT ForeignKey1 FOREIGN KEY (id_AMOC) REFERENCES Approvation(id_AMOC) NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE WeatherForecast ADD CONSTRAINT ForeignKey1 FOREIGN KEY (id_WF) REFERENCES wf_ext_amoc(id_WF) NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE WeatherForecast ADD CONSTRAINT ForeignKey2 FOREIGN KEY (id_AMOC) REFERENCES ApprovedMeteorologicalObjectCollection(id_AMOC) NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE WeatherForecast ADD CONSTRAINT ForeignKey3 FOREIGN KEY (id_WF) REFERENCES WF_has_tR(id_WF) NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE Schema.MeteorologicalObjectCollection ADD CONSTRAINT ForeignKey1 FOREIGN KEY (id_member)
 REFERENCES Schema.member(id_m) MATCH SIMPLE ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE Schema.MeteorologicalObjectCollection ADD CONSTRAINT ForeignKey2 FOREIGN KEY (id_BOM)
 REFERENCES Schema.BasicObjectMetadata(id_BOM) MATCH SIMPLE ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE Schema.MeteorologicalObjectCollection ADD CONSTRAINT ForeignKey3 FOREIGN KEY (id_MOC)
 REFERENCES Schema.has(id_MOC) MATCH SIMPLE ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE Schema.approval ADD CONSTRAINT ApprovedMeteorologicalObjectCollection FOREIGN KEY (id_Ap)
 REFERENCES .(id_AMOC) MATCH SIMPLE ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE Schema.approval ADD CONSTRAINT ForeignKey1 FOREIGN KEY (id_Ap)
 REFERENCES Schema.ApprovedBy(id_Ap) MATCH SIMPLE ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE MeteorologicalAnalysis ADD CONSTRAINT ApprovedMeteorologicalObjectCollection FOREIGN KEY (id_ApprovedMeteorologicalObjectCollection) REFERENCES (id_AMOC) NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE MeteorologicalAnalysis ADD CONSTRAINT ForeignKey1 FOREIGN KEY (id_AMOC) REFERENCES ApprovedMeteorologicalObjectCollection(id_AMOC) NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE MeteorologicalAnalysis ADD CONSTRAINT ForeignKey2 FOREIGN KEY (id_MA) REFERENCES MA_has_tR(id_MA) NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE Schema.Authority ADD CONSTRAINT approval FOREIGN KEY (id_Au)
 REFERENCES Schema.approval(id) MATCH SIMPLE ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE Schema.BasicObjectMetadata ADD CONSTRAINT ForeignKey2 FOREIGN KEY ()
 REFERENCES Schema.metaData(id_metaData) MATCH SIMPLE ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE Schema.BasicObjectMetadata ADD CONSTRAINT ForeignKey1 FOREIGN KEY (id_MeteorologicalObjectCollection)
 REFERENCES Schema.MeteorologicalObjectCollection(id_MOC) MATCH SIMPLE ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE Schema.BasicObjectMetadata ADD CONSTRAINT ForeignKey3 FOREIGN KEY (id_metaData)
 REFERENCES Schema.metaData(id_metaData) MATCH SIMPLE ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE Schema.metaData ADD CONSTRAINT ForeignKey1 FOREIGN KEY (id_BasicObjectMetadata)
 REFERENCES Schema.BasicObjectMetadata(id_BOM) MATCH SIMPLE ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE member ADD CONSTRAINT ForeignKey1 FOREIGN KEY () REFERENCES MeteorologicalObjectCollection(id_MOC) NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE member ADD CONSTRAINT ForeignKey2 FOREIGN KEY (id_MeteorologicalObjectCollection) REFERENCES MeteorologicalObjectCollection(id_MOC) NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE member ADD CONSTRAINT ForeignKey3 FOREIGN KEY (id_BOM) REFERENCES BasicObjectMetadata(id_BOM) NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE member ADD CONSTRAINT ForeignKey4 FOREIGN KEY (id_BOM) REFERENCES BasicObjectMetadata(id_BOM) NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE member ADD CONSTRAINT ForeignKey5 FOREIGN KEY (id_m) REFERENCES m_has_AMO(id_m) NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE Approvation ADD CONSTRAINT ForeignKey1 FOREIGN KEY (id_A) REFERENCES approval(id_Ap) NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE Schema.ApprovedBy ADD CONSTRAINT ForeignKey1 FOREIGN KEY (id_Au)
 REFERENCES Schema.Authority(id_Au) MATCH SIMPLE ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE Schema.has ADD CONSTRAINT ForeignKey1 FOREIGN KEY (id_m)
 REFERENCES Schema.member(id_m) MATCH SIMPLE ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE Schema.AbstractMeteorologicalObject ADD CONSTRAINT ForeignKey1 FOREIGN KEY (id_BOM)
 REFERENCES Schema.BasicObjectMetadata(id_BOM) MATCH SIMPLE ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE m_has_AMO ADD CONSTRAINT ForeignKey1 FOREIGN KEY (id_AMO) REFERENCES AbstractMeteorologicalObject(id_AMO) NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE WF_has_tR ADD CONSTRAINT ForeignKey1 FOREIGN KEY (id_tR) REFERENCES targetRegion(id_tR) NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE Schema.MA_has_tR ADD CONSTRAINT ForeignKey1 FOREIGN KEY (id_tR)
 REFERENCES Schema.targetRegion(id_tR) MATCH SIMPLE ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;





	

	





























































	
	

	

	
	
	
	

	





