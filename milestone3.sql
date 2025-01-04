SQL> select xmlroot(xmlelement("studentlist",xmlagg(xmlelement("Faculty",xmlattr                                                           ibutes(s.foid.faculty_id as "code"),xmlelement("name",s.foid.faculty_name),xmlag                                                           g(xmlelement("student",xmlattributes(s.soid.sid as "sn"),xmlelement("Sname",s.so                                                           id.sname),xmlelement("Surname",s.soid.slname)))))), version '1.0') as doc from s                                                           ection_table s where s.coid.cid = 'ITEC1001' group by s.foid.faculty_id, s.foid.                                                           faculty_name;

DOC
--------------------------------------------------------------------------------
<?xml version="1.0"?>
<studentlist>
  <Faculty code="F001">
    <name>Liberal Ar


SQL>
SQL> select xmlelement("Transcript",xmlattributes(t.transcript_id as "TID"),xmlf                                                           orest(t.csid.coid.cname as "program", t.csid.foid.faculty_name as "faculty",t.so                                                           id.sid as "sn")) from transcript_table t;

XMLELEMENT("TRANSCRIPT",XMLATTRIBUTES(T.TRANSCRIPT_IDAS"TID"),XMLFOREST(T.CSID.C
--------------------------------------------------------------------------------
<Transcript TID="T001"><program>Intro Info Techn</program><faculty>Liberal Arts
<Transcript TID="T002"><program>Intro Computer Science</program><faculty>Enginee
<Transcript TID="T003"><program>Intro Nursing</program><faculty>Health</faculty>
<Transcript TID="T004"><program>Advance Economy Theories</program><faculty>Gradu
<Transcript TID="T005"><program>Intro Info Techn</program><faculty>Liberal Arts

SQL>
SQL>
SQL> select xmlroot(xmlelement("StudentList",xmlagg(xmlelement("Department",xmla                                                           ttributes(g.doid.dep_id as "ID"),xmlagg(xmlelement("Student",xmlattributes(g.sid                                                            as "sn"),xmlelement("Name",g.fullname()),xmlelement("Degree",g.degree)))))),ver                                                           sion '1.0') as doc from graduate_table g where g.gpa > 2.5 group by g.doid.dep_i                                                           d;

DOC
--------------------------------------------------------------------------------
<?xml version="1.0"?>
<StudentList>
  <Department ID="D002">
    <Student sn="S0


SQL> select xmlelement("Student",xmlelement("sn",s.soid.sid),xmlelement("Fname",                                                           s.soid.sname),xmlelement("Surname",s.soid.slname),xmlelement("GPA",s.soid.gpa),x                                                           mlelement("Department",s.foid.doid.dep_name)) as doc from section_table s where                                                            s.location = 'DB001';

DOC
--------------------------------------------------------------------------------
<Student><sn>S001</sn><Fname>Deniz</Fname><Surname>Kaylu</Surname><GPA>2.75</GPA
<Student><sn>S003</sn><Fname>Daniel</Fname><Surname>Witsell</Surname><GPA>3.88</

SQL> select xmlelement("Section",xmlattributes(s.section_id as "SCID"),xmlelemen                                                           t("name",s.foid.doid.dep_name),xmlelement("Faculty",s.foid.faculty_name),xmlelem                                                           ent("Day",s.day)) as doc from csection s where s.soid.sname = 'Brad' and s.soid.                                                           slname = 'Pitt';

DOC
--------------------------------------------------------------------------------
<Section SCID="I006 "><name>Computer Science</name><Faculty>Engineering</Faculty
<Section SCID="I008 "><name>Computer Science</name><Faculty>Engineering</Faculty

SQL>
SQL>
SQL> select xmlelement("Student",xmlattributes(s.soid.sid as "ID"),xmlelement("S                                                           name",s.soid.sname),xmlelement("Surname",s.soid.slname),xmlelement("Section",s.s                                                           ection_id)) as doc from csection s where s.day = 'Wednesday';

DOC
--------------------------------------------------------------------------------
<Student ID="S001"><Sname>Deniz</Sname><Surname>Kaylu</Surname><Section>I003 </S
<Student ID="S003"><Sname>Steph</Sname><Surname>Kulong</Surname><Section>I004 </
<Student ID="S004"><Sname>Adriana</Sname><Surname>Christian</Surname><Section>I0

SQL>
SQL>
SQL> select xmlroot(xmlelement("Courselist",xmlagg(xmlelement("DepartmentID",xml                                                           attributes(c.doid.dep_id as "ID"),xmlagg(xmlelement("CourseID",xmlattributes(c.c                                                           id as "ID"),xmlelement("Name",c.cname),xmlelement("AdminID",c.doid.adid.admin_id                                                           )))))),version '1.0') as doc from course_table c where c.credit = 3 group by c.d                                                           oid.dep_id;

DOC
--------------------------------------------------------------------------------
<?xml version="1.0"?>
<Courselist>
  <DepartmentID ID="D001">
    <CourseID ID="


SQL>
SQL>
SQL> select xmlelement("Student",xmlattributes(s.sid as "ID"),xmlelement("Sname"                                                           ,s.sname),xmlelement("Surname",s.slname),xmlelement("Department",s.doid.dep_name                                                           ),xmlelement("Email",s.semail)) as doc from student_table s where s.gpa >3;

DOC
--------------------------------------------------------------------------------
<Student ID="S002"><Sname>Tom</Sname><Surname>Mills</Surname><Department>Compute
<Student ID="S003"><Sname>Daniel</Sname><Surname>Witsell</Surname><Department>Nu
<Student ID="S007"><Sname>Zey</Sname><Surname>Tan</Surname><Department>Graduate
<Student ID="S008"><Sname>Adrian</Sname><Surname>Joy</Surname><Department>Commun

SQL>
SQL>
SQL> select xmlroot(xmlelement("Receipt",xmlagg(xmlelement("Payment",xmlattribut                                                           es(p.pay_id AS "ID"),(select xmlagg(xmlelement("Transcript",xmlattributes(p2.ts.                                                           transcript_id AS "ID"),xmlagg(xmlelement("Student",xmlattributes(p2.ts.soid.sid                                                            AS "ID"),xmlelement("FirstName", p2.ts.soid.sname),xmlelement("LastName", p2.ts.                                                           soid.slname)))))from payment_table p2 where p2.pay_id = p.pay_id group by p2.ts.                                                           transcript_id)))), version '1.0') as doc from payment_table p where p.amount = 5                                                           00 group by p.pay_id;

DOC
--------------------------------------------------------------------------------
<?xml version="1.0"?>
<Receipt>
  <Payment ID="P002">
    <Transcript ID="T002">


SQL>
SQL>
SQL>
SQL> xquery
  2  /
ERROR:
ORA-19102: XQuery string literal expected


SQL> SQL> query
SP2-0042: unknown command "SQL> query" - rest of line ignored.
SQL> SP2-0042: unknown command "query" - rest of line ignored.
SP2-0734: unknown command beginning "SP2-0042: ..." - rest of line ignored.
SQL> SQL> xquery
SP2-0734: unknown command beginning "SQL> xquer..." - rest of line ignored.
SQL>   2  let $s :=doc ('/public/mil3/student.xml')
SQL>   3  return $s
SQL>   4  /
SQL>
SQL> xquery
  2    2  let $s :=doc ('/public/mil3/student.xml')
  3    3  return $s
  4    4  /
  5
  6  /
ERROR:
ORA-19114: XPST0003 - error during parsing the XQuery expression:
LPX-00801: XQuery syntax error at 'let'
1   2  let $s :=doc ('/public/mil3/student.xml')
-     ^


SQL> xquery
  2  let $s:=doc('/public/mil3/student.xml')
  3  return $s
  4  /

Result Sequence
--------------------------------------------------------------------------------
<?xml version="1.0"?>
<Student>
  <StudentID ID="S001">
    <Sname>Deniz</Sname>


SQL> set page size 60
SP2-0158: unknown SET option "page"
SQL> set pagesize 60
SQL> set long 32000
SQL> xquery
  2    2  let $s :=doc ('/public/mil3/student.xml')
  3    3  return $s
  4    4  /
  5  /
ERROR:
ORA-19114: XPST0003 - error during parsing the XQuery expression:
LPX-00801: XQuery syntax error at 'let'
1   2  let $s :=doc ('/public/mil3/student.xml')
-     ^


SQL> xquery
  2   let $s :=doc ('/public/mil3/student.xml')
  3   return $s
  4  /

Result Sequence
--------------------------------------------------------------------------------
<?xml version="1.0"?>
<Student>
  <StudentID ID="S001">
    <Sname>Deniz</Sname>
    <Surname>Kaylu</Surname>
    <Email>demiz.kaylu@yorku.ca</Email>
    <GPA>2.75</GPA>
  </StudentID>
  <StudentID ID="S002">
    <Sname>Tom</Sname>
    <Surname>Mills</Surname>
    <Email>tom.mills@yorku.ca</Email>
    <GPA>3.18</GPA>
  </StudentID>
  <StudentID ID="S003">
    <Sname>Daniel</Sname>
    <Surname>Witsell</Surname>
    <Email>daniel.witsell@yorku.ca</Email>
    <GPA>3.88</GPA>
  </StudentID>
  <StudentID ID="S004">
    <Sname>Regan</Sname>
    <Surname>Corn</Surname>
    <Email>regan.corn@yorku.ca</Email>
    <GPA>1.65</GPA>
  </StudentID>
  <StudentID ID="S005">
    <Sname>Elly</Sname>
    <Surname>Mars</Surname>
    <Email>elly.mars@yorku.ca</Email>
    <GPA>1.49</GPA>
  </StudentID>
  <StudentID ID="S006">
    <Sname>Kim</Sname>
    <Surname>Hawk</Surname>
    <Email>ki.hawk@yorku.ca</Email>
    <GPA>2.34</GPA>
  </StudentID>
  <StudentID ID="S007">
    <Sname>Zey</Sname>
    <Surname>Tan</Surname>
    <Email>zey.tan@yorku.ca</Email>
    <GPA>3.97</GPA>
  </StudentID>
  <StudentID ID="S008">
    <Sname>Adrian</Sname>
    <Surname>Joy</Surname>
    <Email>adrian.joy@yorku.ca</Email>
    <GPA>3.18</GPA>
  </StudentID>
  <StudentID ID="S009">
    <Sname>Mesut</Sname>
    <Surname>Dag</Surname>
    <Email>mesut.dag@yorku.ca</Email>
    <GPA>2.94</GPA>
  </StudentID>
  <StudentID ID="S010">

Result Sequence
--------------------------------------------------------------------------------
    <Sname>Tengri</Sname>
    <Surname>Ay</Surname>
    <Email>tengri.ay@yorku.ca</Email>
    <GPA>2.17</GPA>
  </StudentID>
</Student>


SQL> xquery
  2   let $s := doc('/public/mil3/student.xml')
  3  return $s//StudentID[GPA > 2.5]/(Sname, Email)
  4  /

Result Sequence
--------------------------------------------------------------------------------
<Sname>Deniz</Sname>
<Email>demiz.kaylu@yorku.ca</Email>
<Sname>Tom</Sname>
<Email>tom.mills@yorku.ca</Email>
<Sname>Daniel</Sname>
<Email>daniel.witsell@yorku.ca</Email>
<Sname>Zey</Sname>
<Email>zey.tan@yorku.ca</Email>
<Sname>Adrian</Sname>
<Email>adrian.joy@yorku.ca</Email>
<Sname>Mesut</Sname>
<Email>mesut.dag@yorku.ca</Email>

12 item(s) selected.

SQL> xquery
  2  let $s := doc('/public/mil3/student.xml')
  3  return $s//StudentID[GPA < 2]/(@ID, Email)
  4  /

Result Sequence
--------------------------------------------------------------------------------
S004
<Email>regan.corn@yorku.ca</Email>
S005
<Email>elly.mars@yorku.ca</Email>

SQL> xquery
  2  let $s := doc('/public/mil3/student.xml')
  3  return $s//StudentID[@ID=('S005', 'S006', 'S007')]/(Sname, Surname, Email)
  4  /

Result Sequence
--------------------------------------------------------------------------------
<Sname>Elly</Sname>
<Surname>Mars</Surname>
<Email>elly.mars@yorku.ca</Email>
<Sname>Kim</Sname>
<Surname>Hawk</Surname>
<Email>ki.hawk@yorku.ca</Email>
<Sname>Zey</Sname>
<Surname>Tan</Surname>
<Email>zey.tan@yorku.ca</Email>

9 item(s) selected.

SQL> xquery
  2  for $s in doc('/public/mil3/student.xml')/Student/StudentID
  3  where $s/GPA > 2.5
  4  return
  5  <Student>
  6   <Sname>{$s/Sname/text()}</Sname>
  7   <Surname>{$s/Surname/text()}</Surname>
  8   <Email>{$s/Email/text()}</Email>
  9   </Student>
 10  /

Result Sequence
--------------------------------------------------------------------------------
<Student><Sname>Deniz</Sname><Surname>Kaylu</Surname><Email>demiz.kaylu@yorku.ca
</Email></Student>

<Student><Sname>Tom</Sname><Surname>Mills</Surname><Email>tom.mills@yorku.ca</Em
ail></Student>

<Student><Sname>Daniel</Sname><Surname>Witsell</Surname><Email>daniel.witsell@yo
rku.ca</Email></Student>

<Student><Sname>Zey</Sname><Surname>Tan</Surname><Email>zey.tan@yorku.ca</Email>
</Student>

<Student><Sname>Adrian</Sname><Surname>Joy</Surname><Email>adrian.joy@yorku.ca</
Email></Student>

<Student><Sname>Mesut</Sname><Surname>Dag</Surname><Email>mesut.dag@yorku.ca</Em
ail></Student>


6 item(s) selected.

SQL> xquery
  2  for $student in doc('/public/mil3/student.xml')/Student/StudentID
  3  where $student/@ID = 'S005' or $student/@ID = 'S006' or $student/@ID = 'S00                                                           7'
  4  return
  5   <Student>
  6    <Sname>{$student/Sname/text()}</Sname>
  7    <Surname>{$student/Surname/text()}</Surname>
  8    <Email>{$student/Email/text()}</Email>
  9   </Student>
 10  /

Result Sequence
--------------------------------------------------------------------------------
<Student><Sname>Elly</Sname><Surname>Mars</Surname><Email>elly.mars@yorku.ca</Em
ail></Student>

<Student><Sname>Kim</Sname><Surname>Hawk</Surname><Email>ki.hawk@yorku.ca</Email
></Student>

<Student><Sname>Zey</Sname><Surname>Tan</Surname><Email>zey.tan@yorku.ca</Email>
</Student>


SQL> xquery
  2  for $student in doc('/public/mil3/student.xml')/Student/StudentID
  3  where xs:double($student/GPA) < 2.0
  4  return
  5  <Student>
  6   <StudentID>{$student/@ID}</StudentID>
  7   <Email>{$student/Email/text()}</Email>
  8   </Student>
  9  /

Result Sequence
--------------------------------------------------------------------------------
<Student><StudentID ID="S004"></StudentID><Email>regan.corn@yorku.ca</Email></St
udent>

<Student><StudentID ID="S005"></StudentID><Email>elly.mars@yorku.ca</Email></Stu
dent>


SQL> xquery
  2  for $student in doc('/public/mil3/student.xml')/Student/StudentID
  3  where $student/Sname = "Deniz" and $student/GPA > 2.5
  4  return
  5  <Student>
  6      <StudentID>{$student/@ID}</StudentID>
  7      <Sname>{$student/Sname/text()}</Sname>
  8      <Email>{$student/Email/text()}</Email>
  9    </Student>
 10  /

Result Sequence
--------------------------------------------------------------------------------
<Student><StudentID ID="S001"></StudentID><Sname>Deniz</Sname><Email>demiz.kaylu
@yorku.ca</Email></Student>


SQL> xquery
  2  let $b :=doc('/public/mil3/query9.xml')
  3  return $b
  4  /

Result Sequence
--------------------------------------------------------------------------------
<?xml version="1.0"?>
<Receipt>
  <Payment ID="P001">
    <Transcript ID="T001">
      <Student ID="S001">
        <FirstName>Deniz</FirstName>
        <LastName>Kaylu</LastName>
      </Student>
    </Transcript>
  </Payment>
  <Payment ID="P002">
    <Transcript ID="T002">
      <Student ID="S002">
        <FirstName>Tom</FirstName>
        <LastName>Mills</LastName>
      </Student>
    </Transcript>
  </Payment>
  <Payment ID="P003">
    <Transcript ID="T003">
      <Student ID="S003">
        <FirstName>Daniel</FirstName>
        <LastName>Witsell</LastName>
      </Student>
    </Transcript>
  </Payment>
</Receipt>


SQL> xquery
  2  for $payment in doc('/public/mil3/query9.xml')//Payment
  3    where $payment/Transcript/Student[@ID = 'S001']/FirstName
  4    return $payment/@ID
  5  /

Result Sequence
--------------------------------------------------------------------------------
P001

SQL> xquery
  2  for $payment in doc('/public/mil3/query9.xml')//Payment
  3    where $payment/Transcript/Student[@ID = 'S001']/FirstName
  4    return $payment/@ID
  5  /

Result Sequence
--------------------------------------------------------------------------------
P001

SQL> xquery
  2  let $f :=doc('/public/mil3/faculty.xml')
  3   return $f
  4  /

Result Sequence
--------------------------------------------------------------------------------
<?xml version="1.0"?>
<Faculty>
  <FacultyID FID="F001">
    <FNAME>Liberal Arts and Prof. Study</FNAME>
    <FEmail>lapds@yorku.ca</FEmail>
  </FacultyID>
  <FacultyID FID="F002">
    <FNAME>Liberal Arts and Prof. Study</FNAME>
    <FEmail>lapds@yorku.ca</FEmail>
  </FacultyID>
  <FacultyID FID="F003">
    <FNAME>Engineering</FNAME>
    <FEmail>enginnering@yorku.ca</FEmail>
  </FacultyID>
  <FacultyID FID="F004">
    <FNAME>Engineering</FNAME>
    <FEmail>enginnering@yorku.ca</FEmail>
  </FacultyID>
  <FacultyID FID="F005">
    <FNAME>Law</FNAME>
    <FEmail>enginnering@yorku.ca</FEmail>
  </FacultyID>
  <FacultyID FID="F006">
    <FNAME>Health</FNAME>
    <FEmail>health@yorku.ca</FEmail>
  </FacultyID>
  <FacultyID FID="F007">
    <FNAME>Education</FNAME>
    <FEmail>education@yorku.ca</FEmail>
  </FacultyID>
  <FacultyID FID="F008">
    <FNAME>Graduate Studies</FNAME>
    <FEmail>graduatestudies@yorku.ca</FEmail>
  </FacultyID>
</Faculty>


SQL> xquery
  2  for $faculty in doc('/public/mil3/faculty.xml')//FacultyID
  3    where $faculty/FNAME = 'Engineering'
  4    return $faculty/@FID, $faculty/FNAME
  5  /
ERROR:
ORA-19228: XPST0008 - undeclared identifier: prefix 'faculty' local-name ''


SQL> xquery
  2  for $faculty in doc('/public/mil3/faculty.xml')//FacultyID
  3    where $faculty/FNAME = 'Engineering'
  4    return
  5      <Faculty>
  6        <FacultyID>{$faculty/@FID}</FacultyID>
  7        <FNAME>{$faculty/FNAME/text()}</FNAME>
  8  </Faculty>
  9  /

Result Sequence
--------------------------------------------------------------------------------
<Faculty><FacultyID FID="F003"></FacultyID><FNAME>Engineering</FNAME></Faculty>
<Faculty><FacultyID FID="F004"></FacultyID><FNAME>Engineering</FNAME></Faculty>

SQL> xquery
  2  for $faculty in doc('/public/mil3/faculty.xml')//FacultyID
  3    where $faculty/@FID = 'F003' or $faculty/@FID = 'F007'
  4    return
  5      <Faculty>
  6        <FNAME>{$faculty/FNAME/text()}</FNAME>
  7        <FEmail>{$faculty/FEmail/text()}</FEmail>
  8    3    4    5    6    7    8      </Faculty>
  9  /

Result Sequence
--------------------------------------------------------------------------------
<Faculty><FNAME>Engineering</FNAME><FEmail>enginnering@yorku.ca</FEmail>
  3    4    5    6    7    8      </Faculty>

<Faculty><FNAME>Education</FNAME><FEmail>education@yorku.ca</FEmail>
  3    4    5    6    7    8      </Faculty>


SQL> xquery
  2  for $faculty in doc('/public/mil3/faculty.xml')//FacultyID
  3    where $faculty/FNAME = 'Law'
  4    return
  5      <Faculty>
  6        <FacultyID>{$faculty/@FID}</FacultyID>
  7        <FNAME>{$faculty/FNAME/text()}</FNAME>
  8        <FEmail>{$faculty/FEmail/text()}</FEmail>
  9  </Faculty>
 10  /

Result Sequence
--------------------------------------------------------------------------------
<Faculty><FacultyID FID="F005"></FacultyID><FNAME>Law</FNAME><FEmail>enginnering
@yorku.ca</FEmail></Faculty>


SQL> xquery
  2  for $faculty in doc('/public/mil3/faculty.xml')//FacultyID
  3    return
  4      <Faculty>
  5        <FNAME>{$faculty/FNAME/text()}</FNAME>
  6        <FEmail>{$faculty/FEmail/text()}</FEmail>
  7    2    3    4    5    6    7      </Faculty>
  8  /

Result Sequence
--------------------------------------------------------------------------------
<Faculty><FNAME>Liberal Arts and Prof. Study</FNAME><FEmail>lapds@yorku.ca</FEma
il>
  2    3    4    5    6    7      </Faculty>

<Faculty><FNAME>Liberal Arts and Prof. Study</FNAME><FEmail>lapds@yorku.ca</FEma
il>
  2    3    4    5    6    7      </Faculty>

<Faculty><FNAME>Engineering</FNAME><FEmail>enginnering@yorku.ca</FEmail>
  2    3    4    5    6    7      </Faculty>

<Faculty><FNAME>Engineering</FNAME><FEmail>enginnering@yorku.ca</FEmail>
  2    3    4    5    6    7      </Faculty>

<Faculty><FNAME>Law</FNAME><FEmail>enginnering@yorku.ca</FEmail>
  2    3    4    5    6    7      </Faculty>

<Faculty><FNAME>Health</FNAME><FEmail>health@yorku.ca</FEmail>
  2    3    4    5    6    7      </Faculty>

<Faculty><FNAME>Education</FNAME><FEmail>education@yorku.ca</FEmail>
  2    3    4    5    6    7      </Faculty>

<Faculty><FNAME>Graduate Studies</FNAME><FEmail>graduatestudies@yorku.ca</FEmail
>
  2    3    4    5    6    7      </Faculty>


8 item(s) selected.

SQL> xquery
  2   for $faculty in doc('/public/mil3/faculty.xml')//FacultyID
  3    where $faculty/@FID = 'F003' or $faculty/@FID = 'F007'
  4    return
  5      ($faculty/FNAME/text(), $faculty/FEmail/text())
  6  /

Result Sequence
--------------------------------------------------------------------------------
Engineering
enginnering@yorku.ca
Education
education@yorku.ca

SQL> xquery
  2   for $student in doc('/public/mil3/student.xml')//StudentID
  3    where $student/@ID = 'S005' or $student/@ID = 'S006' or $student/@ID = 'S                                                           007'
  4    return
  5      ($student/Sname/text(), $student/Email/text())
  6  /

Result Sequence
--------------------------------------------------------------------------------
Elly
elly.mars@yorku.ca
Kim
ki.hawk@yorku.ca
Zey
zey.tan@yorku.ca

6 item(s) selected.

SQL> xquery
  2  let $students := doc('/public/mil3/student.xml')//StudentID
  3    let $faculty := doc('/public/mil3/faculty.xml')//FacultyID
  4    where $students/@ID = 'S005' or $students/@ID = 'S006' or $students/@ID =                                                            'S007'
  5       and ($faculty/@FID = 'F003' or $faculty/@FID = 'F007')
  6    return
  7      ($students/Sname/text(), $students/Email/text(), $faculty/FNAME/text(),                                                            $faculty/FEmail/text())
  8  /

Result Sequence
--------------------------------------------------------------------------------
Deniz
Tom
Daniel
Regan
Elly
Kim
Zey
Adrian
Mesut
Tengri
demiz.kaylu@yorku.ca
tom.mills@yorku.ca
daniel.witsell@yorku.ca
regan.corn@yorku.ca
elly.mars@yorku.ca
ki.hawk@yorku.ca
zey.tan@yorku.ca
adrian.joy@yorku.ca
mesut.dag@yorku.ca
tengri.ay@yorku.ca
Liberal Arts and Prof. Study
Liberal Arts and Prof. Study
Engineering
Engineering
Law
Health
Education
Graduate Studies
lapds@yorku.ca
lapds@yorku.ca
enginnering@yorku.ca
enginnering@yorku.ca
enginnering@yorku.ca
health@yorku.ca
education@yorku.ca
graduatestudies@yorku.ca

36 item(s) selected.

SQL> xquery
  2  let $students := doc('/public/mil3/student.xml')//StudentID[GPA > 3.5]
  3    let $faculty := doc('/public/mil3/faculty.xml')//FacultyID[FNAME = 'Engin                                                           eering']
  4    return
  5      ($students/Sname/text(), $students/Email/text(), $faculty/FNAME/text(),                                                            $faculty/FEmail/text())
  6  /

Result Sequence
--------------------------------------------------------------------------------
Daniel
Zey
daniel.witsell@yorku.ca
zey.tan@yorku.ca
Engineering
Engineering
enginnering@yorku.ca
enginnering@yorku.ca

8 item(s) selected.

SQL> xquery
  2  let $students := doc('/public/mil3/student.xml')//StudentID[GPA < 2]
  3    let $faculty := doc('/public/mil3/faculty.xml')//FacultyID[FNAME = 'Healt                                                           h']
  4    return
  5    2    3    4    5      ($students/Sname/text(), $students/Email/text(), $f                                                           aculty/FNAME/text())
  6  /
ERROR:
ORA-19114: XPST0003 - error during parsing the XQuery expression:
LPX-00801: XQuery syntax error at '3'
4     2    3    4    5      ($students/Sname/text(), $students/Email/text(), $f
-          ^


SQL> spool off
