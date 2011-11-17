/* Code generated for Postgre_8_2_4 */

CREATE TABLE Schema.AbstractMeteorologicalObjectType(
) ;

CREATE TABLE Schema.UncertaintyArea(
id integer NOT NULL
) ;

ALTER TABLE Schema.UncertaintyArea ADD CONSTRAINT PK_UncertaintyArea PRIMARY KEY (id);

CREATE TABLE Schema.TimeInterpolation(
id float NOT NULL,
StandardObjectProperties integer,
method varchar(128) NOT NULL,
maxResolution integer
) ;

CREATE TABLE Schema.StandardObjectProperties(
Column1 
char(),
Column2 interval ()
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
DEPRECATED ???? bytea
) ;

CREATE TABLE Schema.ApprovedMeteorologicalObjectCollection(
id_AMOC integer,
MeteorologicalObjectCollection integer
) ;

ALTER TABLE Schema.ApprovedMeteorologicalObjectCollection ADD CONSTRAINT PK_ApprovedMeteorologicalObjectCollection PRIMARY KEY (id_AMOC);

CREATE TABLE Schema.WeatherForecast(
id_WF float
) ;

ALTER TABLE Schema.WeatherForecast ADD CONSTRAINT PK_WeatherForecast PRIMARY KEY (id_WF);

CREATE TABLE Schema.MeteorologicalObjectCollection(
id integer,
id_AbstractFeature bytea,
id_members interval (),
id_member bytea
) ;

ALTER TABLE Schema.MeteorologicalObjectCollection ADD CONSTRAINT PK_MeteorologicalObjectCollection PRIMARY KEY (id);

CREATE TABLE Schema.gml:validTime(
) ;

CREATE TABLE Schema.approval(
id_ApprovedMeteorologicalObjectCollection float,
id varchar(128),
approvedBy varchar(1),
approvalTime date
) ;

CREATE TABLE Schema.AbstractFeature(
id float,
id_StandardObjectProperties integer,
id_AbstractGMLType float
) ;

CREATE TABLE Schema.AbstractGMLType(
) ;

CREATE TABLE Schema.gml:boundedBy(
) ;

CREATE TABLE Schema.gml:location(
) ;

CREATE TABLE Schema.MeteorologicalAnalysis(
id_ApprovedMeteorologicalObjectCollection integer,
id_MA boolean
) ;

ALTER TABLE Schema.MeteorologicalAnalysis ADD CONSTRAINT PK_MeteorologicalAnalysis PRIMARY KEY (id_MA);

CREATE TABLE Schema.Authority(
authorityId varchar(256),
approvalId varchar(128)
) ;

CREATE TABLE Schema.BasicObjectMetadata(
id integer NOT NULL,
id_MeteorologicalObjectCollection time() ,
integer,
id_metaData boolean,
creationTime date NOT NULL,
latestModificationTime date,
shortInfo varchar(128),
longInfo varchar(2147483647),
Column1 bytea
) ;

ALTER TABLE Schema.BasicObjectMetadata ADD CONSTRAINT PK_BasicObjectMetadata PRIMARY KEY (id);

CREATE TABLE Schema.metaData(
id integer NOT NULL,
id_BasicObjectMetadata time() ,
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
Language boolean,
language varchar(128),

char(),
relation varchar(128),
coverage varchar(1024),
rights varchar(1024),
Column1 integer,
keyword varchar(1024)
) ;

ALTER TABLE Schema.metaData ADD CONSTRAINT PK_MeteorologicalObjectMetaData PRIMARY KEY (id);

CREATE TABLE Schema.member(
id boolean,
integer,
id_MeteorologicalObjectCollection boolean,
id_BasicObjectMetadata integer,
UncertaintyArea integer
) ;

CREATE TABLE Schema.wf_ext_amoc(
id_WF date,
id_AMOC date
) ;

ALTER TABLE ApprovedMeteorologicalObjectCollection ADD CONSTRAINT MeteorologicalObjectCollection FOREIGN KEY (MeteorologicalObjectCollection) REFERENCES MeteorologicalObjectCollection(id) NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE Schema.WeatherForecast ADD CONSTRAINT ForeignKey1 FOREIGN KEY (id_WF)
 REFERENCES Schema.wf_ext_amoc(id_WF) MATCH SIMPLE ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE MeteorologicalObjectCollection ADD CONSTRAINT ForeignKey1 FOREIGN KEY (id_member) REFERENCES member(id) NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE Schema.approval ADD CONSTRAINT ApprovedMeteorologicalObjectCollection FOREIGN KEY (id_ApprovedMeteorologicalObjectCollection)
 REFERENCES .(id_AMOC) MATCH SIMPLE ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE Schema.MeteorologicalAnalysis ADD CONSTRAINT ApprovedMeteorologicalObjectCollection FOREIGN KEY (id_ApprovedMeteorologicalObjectCollection)
 REFERENCES .(id_AMOC) MATCH SIMPLE ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE Schema.Authority ADD CONSTRAINT approval FOREIGN KEY (approvalId)
 REFERENCES Schema.approval(id) MATCH SIMPLE ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE Schema.BasicObjectMetadata ADD CONSTRAINT ForeignKey2 FOREIGN KEY ()
 REFERENCES Schema.metaData(id) MATCH SIMPLE ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE Schema.BasicObjectMetadata ADD CONSTRAINT ForeignKey1 FOREIGN KEY (id_MeteorologicalObjectCollection)
 REFERENCES Schema.MeteorologicalObjectCollection(id) MATCH SIMPLE ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE Schema.BasicObjectMetadata ADD CONSTRAINT ForeignKey3 FOREIGN KEY (id_metaData)
 REFERENCES Schema.metaData(id) MATCH SIMPLE ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE Schema.metaData ADD CONSTRAINT ForeignKey1 FOREIGN KEY (id_BasicObjectMetadata)
 REFERENCES Schema.BasicObjectMetadata(id) MATCH SIMPLE ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE Schema.member ADD CONSTRAINT ForeignKey1 FOREIGN KEY ()
 REFERENCES Schema.MeteorologicalObjectCollection(id) MATCH SIMPLE ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE Schema.member ADD CONSTRAINT ForeignKey2 FOREIGN KEY (id_MeteorologicalObjectCollection)
 REFERENCES Schema.MeteorologicalObjectCollection(id) MATCH SIMPLE ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE Schema.member ADD CONSTRAINT ForeignKey3 FOREIGN KEY (id_BasicObjectMetadata)
 REFERENCES Schema.BasicObjectMetadata(id) MATCH SIMPLE ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;





	

	













































	
	

	

	
	
	
	

	





