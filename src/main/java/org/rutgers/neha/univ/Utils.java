package org.rutgers.neha.univ;

import java.sql.*;
import java.util.ArrayList;

public class Utils {
	
	private Connection cn = null;

	public Utils() {
			ApplicationDB db = new ApplicationDB();
			cn = db.getConnection();
	}
	
	private ResultSet executeQuery (String str) throws SQLException {
		Statement s = cn.createStatement();
		return s.executeQuery(str);
		
	}
	
	private void executeUpdate (String str) throws SQLException {
		Statement s = cn.createStatement();
		s.executeUpdate(str);
		return;
		
	}
	
	public void closeConnection() {
		try {
			if (cn != null)
				cn.close();
		}
		catch (SQLException e) {
			
		}
	}
	

	
	private boolean checkInteger (String str) {
		try {
			int p= Integer.parseInt(str);
			if (p > 0) 
				return true;
		}
		catch (NumberFormatException e) {
			
		}
		return false;
	}
	
	public User checkAdminUser (String id, String pwd) {
		try {
			
			String qry = "select * from administrator where aid="+ id  + " and password='"+pwd+"'";
			ResultSet r1 = executeQuery(qry);
			if (r1 != null && r1.next() ) {
				User u = new User();
				u.name = r1.getString("name");
				u.id = r1.getInt("aid");
				u.dept = r1.getString("dname");
				return u;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();			
		}
		return null;
	}

	
	public String checkProfessor (String id, String pwd) {
		try {
			
			String qry = "select * from professor where pid="+ id  + " and password='"+pwd+"'";
			ResultSet r1 = executeQuery(qry);
			if (r1 != null && r1.next() ) 
				return r1.getString("name");
		}
		catch (SQLException e) {
			e.printStackTrace();			
		}
		return null;
	}
	
	
	public void updateGrade(int sid, int cid, int snum, String grade ) {		
		try {
			String qry = "update enrolls set grade='" + grade + "' where  sid=" + sid + " and cid=" + cid + " and snum = " + snum;
			executeUpdate(qry);
			
		}
		catch (SQLException e) {
			e.printStackTrace();			
		}

	}
	
	public String registerCourse(String sid, String cid, String snum ) {		
		try {
			String qry = "insert into  enrolls values (" +  sid + "," + snum + "," + cid + ",null)";
			executeUpdate(qry);
			return "Success!";
			
		}
		catch (SQLException e) {
			e.printStackTrace();			
		}
		return "Unknown Error";

	}
	
	public String addProfessor (String pid, String name, String phone, String password, String onum) {
		try {
			String qry1 = "select * from professor where pid="+ pid;
			ResultSet r1 = executeQuery(qry1);
			if (r1 != null && r1.next()  ) {
				return "Failed: Professor with Id: " + pid + " Already Exists";
			}
			boolean cpid = checkInteger(pid), conum= checkInteger(onum);
			if (!cpid  || !conum)
				return "Failed: User Id & Office Num should be positive integers";
			String qry2 = "insert into professor values (" + pid + ",'" + name + "','" + phone + "'," + onum + ",'" +  password + "')";
			executeUpdate(qry2);
			String qry3 = "select * from professor where pid="+ pid;
			ResultSet r3 = executeQuery(qry3);
			if (r3 != null && r3.next()  ) {
				return "Success! Professor Added";				
			}

		}
		catch (SQLException e) {
			e.printStackTrace();			
		}
		return "Unknown Error! Try Again";
	}
			
		

	public ArrayList<Course>  getCourseList (String dept)  {
		ArrayList<Course> crList = new ArrayList<>();
		try {

			String qry = "select * from course where dname ='" + dept +"'";
			ResultSet r1 = executeQuery(qry);
			while (r1 != null && r1.next() ) {
				Course c = new Course();
				c.cid =  r1.getInt("cid");
				c.cname =  r1.getString("name");
				c.dname =  r1.getString("dname");
				c.credits =  r1.getInt("credits");
				crList.add(c);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();			
		}
		return crList;
	}

	public ArrayList<User>  getStudentList ()  {
		ArrayList<User> studentList = new ArrayList<>();
		try {

			String qry = "select * from student";
			ResultSet r1 = executeQuery(qry);
			while (r1 != null && r1.next() ) {
				User s = new User();
				s.id =  r1.getInt("sid");
				s.name =  r1.getString("name");
				s.phone =  r1.getString("phone");
				s.birthday = r1.getDate("birthday");
				studentList.add(s);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();			
		}
		return studentList;
	}
	
	public ArrayList<User>  getAdminList ()  {
		ArrayList<User> studentList = new ArrayList<>();
		try {

			String qry = "select * from administrator";
			ResultSet r1 = executeQuery(qry);
			while (r1 != null && r1.next() ) {
				User s = new User();
				s.id =  r1.getInt("aid");
				s.name =  r1.getString("name");
				s.dept =  r1.getString("dname");
				studentList.add(s);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();			
		}
		return studentList;
	}
	
	public ArrayList<User>  getProfList ()  {
		ArrayList<User> profList = new ArrayList<>();
		try {

			String qry = "select * from professor";
			ResultSet r1 = executeQuery(qry);
			while (r1 != null && r1.next() ) {
				User s = new User();
				s.id =  r1.getInt("pid");
				s.name =  r1.getString("name");
				s.phone =  r1.getString("phone");
				s.officeNum = r1.getInt("office_num");
				profList.add(s);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();			
		}
		return profList;
	}
	
	public Course  getCourse  (String cid)  {
		try {

			String qry = "select * from course where cid =" + cid;			
			ResultSet r1 = executeQuery(qry);
			if  (r1 != null && r1.next() ) {
				Course c = new Course();
				c.cid =  r1.getInt("cid");
				c.cname =  r1.getString("name");
				c.dname =  r1.getString("dname");
				c.credits =  r1.getInt("credits");
				return c;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();			
		}
		return null;
	}

	public String checkStudent (String id, String pwd) {
		try {
			
			String qry = "select * from student where sid="+ id  + " and password='"+pwd+"'";
			ResultSet r1 = executeQuery(qry);
			if (r1 != null && r1.next() ) 
				return r1.getString("name");
		}
		catch (SQLException e) {
			e.printStackTrace();			
		}
		return null;
	}

	
	

	public ArrayList<Course>  getPrereqs  (String cid)  {
		ArrayList<Course> courses = new ArrayList<Course>();			
		try {
			String qry = "select * from course where cid in (select prereqid from prereqs where cid=" + cid + ")";			
			ResultSet r1 = executeQuery(qry);
			while  (r1 != null && r1.next() ) {
				Course c = new Course();
				c.cid =  r1.getInt("cid");
				c.cname =  r1.getString("name");
				c.dname =  r1.getString("dname");
				c.credits =  r1.getInt("credits");
				courses.add(c);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();			
		}
		return courses;
	}


	public ArrayList<Enroll>  getEnrolledCourses  (String qry)  {
		ArrayList<Enroll> enrolls = new ArrayList<>();			
		try {
			ResultSet r1 = executeQuery(qry);
			while  (r1 != null && r1.next() ) {
				Enroll e = new Enroll();
				e.cid =  r1.getInt("cid");
				e.cname =  r1.getString("name");
				e.dname =  r1.getString("dname");
				e.credits =  r1.getInt("credits");
				e.grade = r1.getString ("grade");
				if (e.grade==null)
					e.grade="";
				e.snum = r1.getInt ("snum");
				e.sid = r1.getInt("sid");
				e.sname = r1.getString ("sname");
				enrolls.add(e);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();			
		}
		return enrolls;
	}


	public ArrayList<Enroll>  getAllEnrolledCourses  (String sid)  {
			String qry = 	" select c.cid, c.name, c.dname,  c.credits, e.snum, e.grade, s.sid, s.name as sname  from  enrolls e, course c, student s " +
				    " where c.cid = e.cid and e.sid=s.sid and  e.sid= " + sid;
			return getEnrolledCourses(qry);
	}
	
	public ArrayList<Enroll>  getEnrolledCoursesBySection  (String cid, String snum)  {
		String qry = 	" select c.cid, c.name, c.dname,  c.credits, e.snum, e.grade, s.sid, s.name as sname  from  enrolls e, course c, student s " +
			    " where c.cid = e.cid and e.sid=s.sid  and e.cid= " + cid + " and e.snum=" + snum;
		return getEnrolledCourses(qry);
}
	
	
	public ArrayList<Course>  getCoursesForEnrollment  (String sid)  {
		ArrayList<Course> courses = new ArrayList<Course>();			
		try {
			
			
			String qry = "select * from course c " +
					" where not exists (select * from enrolls e where e.sid=" + sid + "  and e.cid=c.cid and ( e.grade in ('A','B','C','') or e.grade is null))";  
			ResultSet r1 = executeQuery(qry);
			while  (r1 != null && r1.next() ) {
				Course c = new Course();
				c.cid =  r1.getInt("cid");
				c.cname =  r1.getString("name");
				c.dname =  r1.getString("dname");
				c.credits =  r1.getInt("credits");
				courses.add(c);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();			
		}
		return courses;
	}
	
	
	public ArrayList<Course>  getPreReqsNotCompleted  (String sid, String cid)  {
		ArrayList<Course> courses = new ArrayList<Course>();			
		try {
			String qry = 
					"select * from course c " +
					" where c.cid in (select prereqid from  prereqs p where p.cid=" + cid + ")" + 
					" and not exists (select * from  enrolls e where e.cid=c.cid and e.grade in ('A','B','C') and e.sid=" + sid + ")";					

			ResultSet r1 = executeQuery(qry);
			while  (r1 != null && r1.next() ) {
				Course c = new Course();
				c.cid =  r1.getInt("cid");
				c.cname =  r1.getString("name");
				c.dname =  r1.getString("dname");
				c.credits =  r1.getInt("credits");
				courses.add(c);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();			
		}
		return courses;
	}
	
	
	public ArrayList<Section>  getProfSections (String pid)  {
		String qry = "select sec.cid, sec.snum, sec.pid, sch.scheduleid, sch.dayofweek, sch.starttime, sch.endtime, p.name as pname from section sec " +
				" left join schedule sch on sec.cid = sch.cid and sec.snum = sch.snum " +
				" left join professor p on sec.pid = p.pid" +
				" where sec.pid="+ pid +
				" order by  sec.cid, sec.snum, sch.scheduleid";
		return getSections (qry);
	}
	
	public ArrayList<Section> getSections(String qry) {
	
		ArrayList<Section> sList = new ArrayList<>();
		try {

			int snumprev=-1, cidprev=-1;		
			ResultSet r1 = executeQuery(qry);
			Section sec= null;
			while (r1 != null && r1.next() ) {
				int snum = r1.getInt("snum");
				int cid=r1.getInt("cid");
				if (snumprev != snum || cidprev != cid) {
					sec = new Section();
					sec.snum=snum;
					sec.cid=cid;
					sec.pid=r1.getInt("pid");
					sec.pname=r1.getString("pname");
					sList.add(sec);
					snumprev=snum;
					cidprev=cid;
				}
				int schId = r1.getInt("scheduleid");
				if (schId != 0) {
					Schedule sched = new Schedule();				
					sched.dayofweek=r1.getString("dayofweek");
					sched.startTime=r1.getTime("starttime");
					sched.endTime=r1.getTime("endtime");
					sched.scheduleid = schId;
					sec.sList.add(sched);
				}
			}
		}
		catch (SQLException e) {
			e.printStackTrace();			
		}
		return sList;
	}
	
	public ArrayList<Section>  getCourseSections (String cid)  {
		String qry = "select sec.cid, sec.snum, sec.pid, sch.scheduleid, sch.dayofweek, sch.starttime, sch.endtime, p.name as pname from section sec " +
				" left join schedule sch on sec.cid = sch.cid and sec.snum = sch.snum" + 
				" left join professor p on sec.pid = p.pid" +
			    " where sec.cid="+ cid + " order by   sec.snum, sch.scheduleid";
		return getSections (qry);
	}
	
	public String addSection (String cid, String snum, String pid ) {
		try {
			if (!checkInteger(snum)  || !checkInteger(pid))
				return "Failed: Section Num & Professor Id should be positive integers";

			
			String qry1 = "select * from section where cid="+ cid + " and snum="+ snum;
			ResultSet r1 = executeQuery(qry1);
			if (r1 != null && r1.next()  ) {
				return "Failed: Section with Course Id: " + cid + " Section Num: " + snum + "  Already Exists";
			}
			String qry2 = "insert into section values (" + snum + "," + cid + "," + pid + ")";
			executeUpdate(qry2);
			ResultSet r3 = executeQuery(qry1);
			if (r3 != null && r3.next()  ) {
				return "Success! Section Added";				
			}

		}
		catch (SQLException e) {
			e.printStackTrace();			
		}
		return "Unknown Error! Try Again";
	}
		
	
	
	public String addPreReq (String cid, String prid ) {
		try {
			if (!checkInteger(cid)  || !checkInteger(prid))
				return "Failed: Course Num & Pre Req Num  should be positive integers";

			
			String qry1 = "select * from course where cid="+ prid;
			ResultSet r1 = executeQuery(qry1);
			if (r1 == null || !r1.next()   ) {
				return "Failed: Pre Req with  Id: " +  prid +  "  Does Not  Exists";
			}
			
			String qry2 = "select * from prereqs where cid="+ cid + " and prereqid=" + prid;
			ResultSet r2 = executeQuery(qry2);
			if (r2 != null && r2.next()  ) {
				return "Failed: Pre Req with  Id: " +  prid +  "  Already Exists";
			}

			
			String qry3 = "insert into prereqs values (" + cid + "," + prid + ")";
			executeUpdate(qry3);
			ResultSet r3 = executeQuery(qry2);
			if (r3 != null && r3.next()  ) {
				return "Success! Pre Req Added";				
			}

		}
		catch (SQLException e) {
			e.printStackTrace();			
		}
		return "Unknown Error! Try Again";
	}
	
	public String addCourse (String cid, String name, String dept, String credits)  {
		try {
			
			if (!checkInteger(cid)  || !checkInteger(credits))
				return "Failed: Course Id & Credits should be positive integers";
			String qry1 = "select * from course where cid="+ cid;
			ResultSet r1 = executeQuery(qry1);
			if (r1 != null && r1.next()  ) {
				return "Failed: Course with Id: " + cid + " Already Exists";
			}
			String qry2 = "insert into course values (" + cid + ","+credits+",'" + name + "','" + dept + "')";
			executeUpdate(qry2);
			String qry3 = "select * from course where cid="+ cid;
			ResultSet r3 = executeQuery(qry3);
			if (r3 != null && r3.next()  ) {
				return "Success! Course Added";				
			}

		}
		catch (SQLException e) {
			e.printStackTrace();			
		}
		return "Unknown Error! Try Again";
	}
	
	
	public String addSchedule (String cid, String snum, String scheduleId, String dow, String startTime, String endTime)  {
		try {
			
			if (!checkInteger(cid)  || !checkInteger(snum) ||  !checkInteger(scheduleId) )
				return "Failed: Course Id & Section Num & Schedule Id  should be positive integers";
			String qry1 = "select * from schedule where cid="+ cid +  " and snum=" + snum + " and scheduleid="+scheduleId ;
		
			ResultSet r1 = executeQuery(qry1);
			if (r1 != null && r1.next()  ) {
				return "Failed: Schedule with Schedule Id: " + scheduleId + " Already Exists";
			}
			String qry2 = "insert into schedule values (" + snum + ","+cid+","+scheduleId + ",'" + dow + "','" + startTime + "','" + endTime + "')";
			executeUpdate(qry2);
			ResultSet r3 = executeQuery(qry1);
			if (r3 != null && r3.next()  ) {
				return "Success! Schedule Added";				
			}

		}
		catch (SQLException e) {
			e.printStackTrace();			
		}
		return "Unknown Error! Try Again";
	}
	
	public String addStudent(String sid, String name, String phone, String password, String bdate) {


		try {
			if (!checkInteger(sid))
				return "Failed: Student Id should be a positive integer";

			String qry1 = "select * from student where sid="+ sid;
			ResultSet r1 = executeQuery(qry1);
			if (r1 != null && r1.next()  ) {
				return "Failed: Student with Id: " + sid + " Already Exists";
			}
			String qry2 = "insert into student values (" + sid + ",'" + name + "','" + phone + "','" + bdate + "','" +  password + "')";
			executeUpdate(qry2);
			String qry3 = "select * from student where sid="+ sid;
			ResultSet r3 = executeQuery(qry3);
			if (r3 != null && r3.next()  ) {
				return "Success! Student Added";				
			}

		}
		catch (SQLException e) {
			e.printStackTrace();			
		}
		return "Unknown Error! Try Again";
	}
	
	public String addAdmin (String aid, String name, String dept, String password ) {
		try {
			if (!checkInteger(aid))
				return "Failed: Admin Id should be a positive integer";
			String qry1 = "select * from administrator where aid="+ aid;
			ResultSet r1 = executeQuery(qry1);
			if (r1 != null && r1.next()  ) {
				return "Failed: Administrator with Id: " + aid + " Already Exists";
			}
			boolean caid = false;
			try {
				int p= Integer.parseInt(aid);
				if (p > 0)
					caid=true;								
			}
			catch (NumberFormatException e) {
				
			}
			if (!caid ) {
				return "Failed: Admin Id should be a positive integer";

			}
			String qry2 = "insert into administrator values (" + aid + ",'" + name + "','" + dept + "','" +  password + "')";
			executeUpdate(qry2);
			String qry3 = "select * from administrator where aid="+ aid;
			ResultSet r3 = executeQuery(qry3);
			if (r3 != null && r3.next()  ) {
				return "Success! Admin Added";				
			}

		}
		catch (SQLException e) {
			e.printStackTrace();			
		}
		return "Unknown Error! Try Again";
	}
	
	public static  void main (String [] args ) {
		Utils u = new Utils();
		ArrayList<Course> courses2 = u.getPreReqsNotCompleted("1","5");
		System.out.println(courses2);

		ArrayList<Enroll> e =  u.getAllEnrolledCourses ("1");
		System.out.println(e);
		
		ArrayList<Course> courses = u.getCoursesForEnrollment("1");
		System.out.println(courses);
		
	}


}
