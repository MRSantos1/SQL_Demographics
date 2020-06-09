 -- Insert statements for procedure here
	DECLARE @EndYr smallint = 2020
	--DROP table if exists dbo.aaSEISStudents_Export
	--DROP table aaSEISStudents_Export
	INSERT INTO [dbo].[aaSEISStudents_Export](
	personid,LocalID,SSID,SSN,LastName,FirstName,MiddleName,Ethnicity,Race1,Race2,Race3,Gender,Birthdate,Migrant,ELL,GradeLevelCode,ParentGuardian1LastName,ParentGuardian1FirstName,ParentGuardian1Line1,ParentGuardian1City,ParentGuardian1StateProvince,ParentGuardian1PostalCode,ParentGuardian1MailingAddress,ParentGuardian1MailingCity,ParentGuardian1MailingStateProvince,ParentGuardian1MailingPostalCode,ParentGuardian2LastName,ParentGuardian2FirstName,ParentGuardian2Line1,ParentGuardian2City,ParentGuardian2StateProvince,ParentGuardian2PostalCode,ParentGuardian1HomePhone,ParentGuardian1CellPhone,ParentGuardian1OtherPhone,ParentGuardian1EmailAddress,ParentGuardian1FatherWorkPhone,ParentGuardian1MotherWorkPhone,ParentGuardian2HomePhone,ParentGuardian2CellPhone,ParentGuardian2OtherPhone,ParentGuardian2EmailAddress,ParentGuardian2WorkPhone,Value1,Value2,Value3,Value4,Value5,Value6,Value7,Value8,Value9,Value10,Value11,Value12,Value13,Value14,Value15)

Select distinct s.personid, s.studentnumber as 'LocalID',  s.stateid as 'SSID', ' ' as 'SSN', s.lastname as 'LastName', s.firstname as 'FirstName', ' ' as 'MiddleName',
CASE WHEN  s.hispanicEthnicity ='Y' THEN '500' ELSE '501' END Ethnicity,
CASE WHEN  s.raceethnicity = '500' then '700' when s.raceethnicity = '999' then '900'else s.raceethnicity end as 'Race1',
' ' as 'Race2',
' ' as 'Race3',
s.gender as 'Gender',
convert(varchar(10),s.birthdate, 101) as 'Birthdate',
CASE WHEN e.migrant = 1 then 'Y'   else 'N' end as 'Migrant',
MAX(CASE WHEN lep.programStatus ='lep' THEN 'Y' ELSE 'N' END)  ELL,
CASE WHEN s.grade = '00' then '18' else s.grade END 'GradeLevelCode',
MAX(CASE WHEN ccs.Guardian = 1 AND (ccs.secondary <>1 OR ccs.secondary IS NULL) AND ccs.Gender = 'f' AND ccs.relationship <> 'self' AND ccs.relatedBy = 'Household'
THEN ccs.lastname ELSE '' END) 'ParentGuardian1LastName',
MAX(CASE WHEN ccs.Guardian = 1 AND (ccs.secondary <>1 OR ccs.secondary IS NULL) AND ccs.Gender = 'f' AND ccs.relationship <> 'self' AND ccs.relatedBy = 'Household'
THEN ccs.firstname ELSE '' END)'ParentGuardian1FirstName',
MAX(CASE WHEN hl.enddate IS NULL AND ccs.guardian = 1 AND (ccs.secondary <>1 OR ccs.secondary IS NULL) AND ccs.Gender = 'f' AND ccs.relatedBy = 'Household' THEN ccs.addressline1 END)'ParentGuardian1Line1',
MAX(CASE WHEN hl.enddate IS NULL AND ccs.guardian = 1 AND (ccs.secondary <>1 OR ccs.secondary IS NULL) AND ccs.Gender = 'f' AND ccs.relatedBy = 'Household' THEN ccs.city ELSE '' END)'ParentGuardian1City',
MAX(CASE WHEN hl.enddate IS NULL AND ccs.guardian = 1 AND (ccs.secondary <>1 OR ccs.secondary IS NULL) AND ccs.Gender = 'f' AND ccs.relatedBy = 'Household' THEN ccs.state  ELSE ''END)'ParentGuardian1StateProvince',
MAX(CASE WHEN hl.enddate IS NULL AND ccs.guardian = 1 AND (ccs.secondary <>1 OR ccs.secondary IS NULL) AND ccs.Gender = 'f' AND ccs.relatedBy = 'Household' THEN ccs.zip ELSE '' END)'ParentGuardian1PostalCode',
MAX(CASE WHEN hl.enddate IS NULL AND ccs.guardian = 1 AND (ccs.secondary <>1 OR ccs.secondary IS NULL) AND ccs.Gender = 'f' AND ccs.mailing = 1 AND ccs.relatedBy = 'Household' THEN ccs.addressline1 ELSE '' END)'ParentGuardian1MailingAddress',
MAX(CASE WHEN hl.enddate IS NULL AND ccs.guardian = 1 AND (ccs.secondary <>1 OR ccs.secondary IS NULL) AND ccs.Gender = 'f' AND ccs.mailing = 1 AND ccs.relatedBy = 'Household' THEN ccs.city ELSE '' END)'ParentGuardian1MailingCity',
MAX(CASE WHEN hl.enddate IS NULL AND ccs.guardian = 1 AND (ccs.secondary <>1 OR ccs.secondary IS NULL) AND ccs.Gender = 'f' AND ccs.mailing = 1 AND ccs.relatedBy = 'Household' THEN ccs.state  ELSE '' END)'ParentGuardian1MailingStateProvince',
MAX(CASE WHEN hl.enddate IS NULL AND ccs.guardian = 1 AND (ccs.secondary <>1 OR ccs.secondary IS NULL) AND ccs.Gender = 'f' AND ccs.mailing = 1 AND ccs.relatedBy = 'Household' THEN ccs.zip ELSE '' END)'ParentGuardian1MailingPostalCode',
MAX(CASE WHEN ccs.Guardian = 1 AND (ccs.secondary <>1 OR ccs.secondary IS NULL) AND ccs.Gender = 'm' AND ccs.relationship <> 'self' AND ccs.relatedBy = 'Household' THEN ccs.lastname ELSE '' END) 'ParentGuardian2LastName',
MAX(CASE WHEN ccs.Guardian = 1 AND (ccs.secondary <>1 OR ccs.secondary IS NULL) AND ccs.Gender = 'm' AND ccs.relationship <> 'self' AND ccs.relatedBy = 'Household' THEN ccs.firstname ELSE '' END)'ParentGuardian2FirstName',
MAX(CASE WHEN hl.enddate IS NULL AND ccs.guardian = 1 AND (ccs.secondary <>1 OR ccs.secondary IS NULL) AND ccs.Gender = 'm' AND ccs.relatedBy = 'Household' THEN ccs.addressline1 ELSE '' END)'ParentGuardian2Line1',
MAX(CASE WHEN hl.enddate IS NULL AND ccs.guardian = 1 AND (ccs.secondary <>1 OR ccs.secondary IS NULL) AND ccs.Gender = 'm' AND ccs.relatedBy = 'Household' THEN ccs.city ELSE '' END)'ParentGuardian2City',
MAX(CASE WHEN hl.enddate IS NULL AND ccs.guardian = 1 AND (ccs.secondary <>1 OR ccs.secondary IS NULL) AND ccs.Gender = 'm' AND ccs.relatedBy = 'Household' THEN ccs.state ELSE '' END)'ParentGuardian2StateProvince',
MAX(CASE WHEN hl.enddate IS NULL AND ccs.guardian = 1 AND (ccs.secondary <>1 OR ccs.secondary IS NULL) AND ccs.Gender = 'm' AND ccs.relatedBy = 'Household' THEN ccs.zip ELSE '' END)'ParentGuardian2PostalCode',
MAX(CASE WHEN ccs.Guardian = 1 AND (ccs.secondary <>1 OR ccs.secondary IS NULL) AND ccs.Gender = 'f' AND ccs.relationship <> 'self' AND ccs.relatedBy = 'Household' THEN ccs.homephone ELSE '' END)'ParentGuardian1HomePhone',
MAX(CASE WHEN ccs.Guardian = 1 AND (ccs.secondary <>1 OR ccs.secondary IS NULL) AND ccs.Gender = 'f' AND ccs.relationship <> 'self' AND ccs.relatedBy = 'Household' THEN ccs.cellphone ELSE '' END)'ParentGuardian1CellPhone',
MAX(CASE WHEN ccs.Guardian = 1 AND (ccs.secondary <>1 OR ccs.secondary IS NULL) AND ccs.Gender = 'f' AND ccs.relationship <> 'self' AND ccs.relatedBy = 'Household' THEN ccs.householdphone ELSE '' END)'ParentGuardian1OtherPhone',
MAX(CASE WHEN ccs.Guardian = 1 AND (ccs.secondary <>1 OR ccs.secondary IS NULL) AND ccs.Gender = 'f' AND ccs.relationship <> 'self' AND ccs.relatedBy = 'Household' THEN ccs.email ELSE '' END)'ParentGuardian1EmailAddress',
MAX(CASE WHEN ccs.Guardian = 1 AND (ccs.secondary <>1 OR ccs.secondary IS NULL) AND ccs.Gender = 'm' AND ccs.relationship <> 'father' AND ccs.relatedBy = 'Household' THEN ccs.workphone ELSE '' END)'ParentGuardian1FatherWorkPhone',
MAX(CASE WHEN ccs.Guardian = 1 AND (ccs.secondary <>1 OR ccs.secondary IS NULL) AND ccs.Gender = 'f' AND ccs.relationship <> 'mother' AND ccs.relatedBy = 'Household' THEN ccs.workphone ELSE '' END)'ParentGuardian1MotherWorkPhone',
MAX(CASE WHEN hl.enddate IS NULL AND ccs.guardian = 1 AND (ccs.secondary <>1 OR ccs.secondary IS NULL) AND ccs.Gender = 'm' AND ccs.relatedBy = 'Household' THEN ccs.homephone ELSE '' END)	'ParentGuardian2HomePhone',
MAX(CASE WHEN hl.enddate IS NULL AND ccs.guardian = 1 AND (ccs.secondary <>1 OR ccs.secondary IS NULL) AND ccs.Gender = 'm' AND ccs.relatedBy = 'Household' THEN ccs.cellphone ELSE '' END)	'ParentGuardian2CellPhone',
MAX(CASE WHEN hl.enddate IS NULL AND ccs.guardian = 1 AND (ccs.secondary <>1 OR ccs.secondary IS NULL) AND ccs.Gender = 'm' AND ccs.relatedBy = 'Household' THEN ccs.householdphone ELSE '' END)'ParentGuardian2OtherPhone',
MAX(CASE WHEN hl.enddate IS NULL AND ccs.guardian = 1 AND (ccs.secondary <>1 OR ccs.secondary IS NULL) AND ccs.Gender = 'm' AND ccs.relatedBy = 'Household' THEN ccs.email ELSE '' END)'ParentGuardian2EmailAddress',
MAX(CASE WHEN hl.enddate IS NULL AND ccs.guardian = 1 AND (ccs.secondary <>1 OR ccs.secondary IS NULL) AND ccs.Gender = 'm' AND ccs.relatedBy = 'Household' THEN ccs.workphone ELSE '' END)'ParentGuardian2WorkPhone',
' ' as 'Value1',
' ' as 'Value2',
' ' as 'Value3',
' ' as 'Value4',
' ' as 'Value5',
' ' as 'Value6',
' ' as 'Value7',
' ' as 'Value8',
' ' as 'Value9',
' ' as 'Value10',
' ' as 'Value11',
' ' as 'Value12',
' ' as 'Value13',
' ' as 'Value14',
' ' as 'Value15'

FROM student s
JOIN v_CensusContactSummary ccs ON ccs.personid = s.personid
JOIN enrollment e ON e.enrollmentid =s.enrollmentid and e.serviceType ='p'
LEFT JOIN householdlocation hl ON hl.householdid = ccs.householdid
LEFT JOIN Address a on hl.addressID = a.addressID and ccs.addressID = a.addressID
LEFT JOIN lep ON lep.personid =s.personid
	where s.stateid is not null and s.activeYear = '1' and s.endYear = @EndYr and s.endDate is null AND hl.endDate IS NULL
	GROUP BY s.personid, s.studentnumber,s.lastname, s.firstname, s.birthdate, s.gender,s.hispanicEthnicity,s.raceEthnicity,
s.grade, s.stateid,e.migrant
	order by lastName,firstname

	UPDATE aa
	SET parentguardian1firstname = ccs.firstname, parentguardian1lastname =ccs.lastname,ParentGuardian1Line1 =ccs.addressline1, ParentGuardian1City = ccs.city, ParentGuardian1StateProvince= ccs.state,
 ParentGuardian1PostalCode = ccs.zip, ParentGuardian1MailingAddress = ma.addressline1, ParentGuardian1MailingCity = ma.city, ParentGuardian1MailingStateProvince = ma.state,
 ParentGuardian1MailingPostalCode = ma.zip
 FROM aaSEISStudents_Export aa
 JOIN v_censuscontactsummary ccs ON ccs.personid = aa.personid and guardian = 1
 JOIN v_MailingAddress ma ON ma.personid = aa.personid
 WHERE aa.parentguardian1firstname = ''


	SELECT 		LocalID, SSID, SSN, LastName, FirstName, MiddleName, Ethnicity, Race1, Race2, Race3, Gender, Birthdate, Migrant,
				ELL, GradeLevelCode, ParentGuardian1LastName, ParentGuardian1FirstName, ParentGuardian1Line1, ParentGuardian1City, ParentGuardian1StateProvince,
				ParentGuardian1PostalCode, ParentGuardian1MailingAddress, ParentGuardian1MailingCity, ParentGuardian1MailingStateProvince,
				ParentGuardian1MailingPostalCode, ParentGuardian2LastName, ParentGuardian2FirstName, ParentGuardian2Line1, ParentGuardian2City,
				ParentGuardian2StateProvince, ParentGuardian2PostalCode, ParentGuardian1HomePhone, ParentGuardian1CellPhone, ParentGuardian1OtherPhone,
				ParentGuardian1EmailAddress, ParentGuardian1FatherWorkPhone, ParentGuardian1MotherWorkPhone, ParentGuardian2HomePhone, ParentGuardian2CellPhone,
				ParentGuardian2OtherPhone, ParentGuardian2EmailAddress, ParentGuardian2WorkPhone, Value1, Value2, Value3, Value4, Value5, Value6, Value7, Value8,
				Value9, Value10, Value11, Value12, Value13, Value14, Value15
				from aaSEISStudents_Export

SELECT * from aaSEISStudents_Export
