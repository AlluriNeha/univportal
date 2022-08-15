package org.rutgers.neha.univ;

import java.util.HashMap;

public class Course {
		public int cid;
		public String cname;
		public int credits;
		public String dname;		
		public HashMap<Integer, Course> preReqs;
		
}
