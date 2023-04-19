package main;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/*
 * 1.학생테이블에 등록된 레코드의 건수를 출력하기
 * 2.학생테이블에 등록된 레코드의 정보를 출력하기
 * 3.학생테이블에 등록된 레코드의 1학년 학생의 정보를 출력하기
 * 4.학생테이블에 등록된 레코드의 성이 김씨인 학생의 정보를 출력하기
 * 5.학생테이블에 등록된 레코드의 3학년 학생 중 주민번호를 기준으로 여학생의 정보를 출력하기
 */
public class Exam1 {
	public static void main(String[] args) {
		SqlSessionFactory sqlMap = null;
		Reader reader = null;
		try {
			// mapper 폴더에 존재하는 mybatis-config.xml 파일을 읽기
			reader = Resources.getResourceAsReader("mapper/mybatis-config.xml");
			//sqlMap : sql 구문들을 id 속성값으로 저장하는 객체.
			sqlMap = new SqlSessionFactoryBuilder().build(reader);
		} catch(IOException e) {
			e.printStackTrace();
		}
		SqlSession session = sqlMap.openSession();
		int cnt = (Integer)session.selectOne("student.count");
		System.out.println("1.학생테이블에 등록된 레코드의 건수를 출력하기 : " + cnt);
		System.out.println("==============================================");
		//다수 = list 사용
		List<Student> list = session.selectList("student.list");
		System.out.println("2.학생테이블에 등록된 레코드의 정보를 출력하기");
		for(Student s : list) System.out.println(s);
		System.out.println("==============================================");
		System.out.println("3.학생테이블에 등록된 레코드의 1학년 학생의 정보를 출력하기");
		list = session.selectList("student.selectgrade1",1 );
		for(Student s : list) System.out.println(s);
		System.out.println("==============================================");
		System.out.println("4.학생테이블에 등록된 레코드의 성이 김씨인 학생의 정보를 출력하기");
		list = session.selectList("student.selectkim","김%");
		for(Student s : list) System.out.println(s);
		System.out.println("==============================================");
		System.out.println("5.학생테이블에 등록된 레코드의 3학년 학생 중 주민번호를 기준으로 여학생의 정보를 출력하기");
		Map<String, Object> map = new HashMap<>();
		map.put("grade", 3);
		map.put("gender", 2);
		list = session.selectList("student.selectgradegender",map);
		for(Student s : list) System.out.println(s);
	}
}
