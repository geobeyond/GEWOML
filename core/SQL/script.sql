/* Code generated for Postgre_8_2_4 with PostGis extension */

CREATE TABLE LineObject(	
id_LO integer
	,
creationTime date
	,
latestModificationTime date
	,
shortInfo varchar(128)
	,
longInfo varchar(4096)
	,
creator varchar(128)
	,
publisher varchar(128)
	,
date varchar(128)
	,
format varchar(128)
	,
gml:id varchar(128)
); 



CREATE TABLE LO_has_cC(	
id_LO integer
	,
id_cC integer
); 



CREATE TABLE controlCurve(	
id_cC integer
	,
xlink:href varchar(32)
); 



CREATE TABLE cC_has_CSC(	
id_cC integer
	,
id_CSC integer
); 



CREATE TABLE CombinedSegmentedCurve(	
id_CSC integer
	,
gml:id varchar(32)
	,
srsName varchar(32)
); 



CREATE TABLE CSC_has_cS(	
id_CSC integer
	,
id_cS integer
); 



CREATE TABLE curveSegment(	
id_cS integer
	,
xlink:href varchar(32)
); 



CREATE TABLE cS_has_CBS(	
id_cS integer
	,
id_CBS integer
); 



CREATE TABLE CubicBSpline(	
id_CBS integer
	,
numDerivativesAtStart integer
	,
numDerivativesInterior integer
	,
numDerivativesAtEnd integer
); 



CREATE TABLE CBS_has_b(	
id_CBS integer
	,
id_b integer
); 



CREATE TABLE bezier(	
id_b integer
	,
xlink:href varchar(32)
); 



CREATE TABLE CubicBezierSegment(	
id_CBS integer
	,
	,
	,
	,
); 



CREATE TABLE b_has_CBS(	
id_b integer
	,
id_CBS integer
); 



CREATE TABLE keyword(	
id_k integer
	,
keyword varchar(128)
); 



CREATE TABLE LO_has_k(	
id_LO integer
	,
id_k integer
); 



CREATE TABLE LO_has_vT(	
id_LO integer
	,
gml:id varchar(128)
); 



CREATE TABLE validTime(	
beginPosition date
	,
endPosition date
	,
gml:id varchar(128)
); 



CREATE TABLE gml:boundedBy(	
id_bB integer
	,
srsName varchar(32)
	,
	,
); 



CREATE TABLE LO_has_bB(	
id_LO integer
	,
id_bB integer
); 














