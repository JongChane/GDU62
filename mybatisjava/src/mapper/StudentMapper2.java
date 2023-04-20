package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import main.Student;

public interface StudentMapper2 {
	@Select({"<script>",
		"select * from student",
		"<where>",
		"<if test = 'grade != null '> grade=#{grade} </if>",
		"<if test = 'height != null '> height>=#{height} </if>",
		"</where>",
		"</script>"})
	List<Student> select(Map<String, Object> map);
	
	/*
	 * @Select({"<script>", "select * from student",
	 * "<choose>",
	 * "<when test = 'grade != null and height != null'>" +
	 * " where grade=#{grade} and height >= #{height} </when>",
	 * "<when test = 'grade != null'> where grade=#{grade} </when>",
	 * "<when test = 'studno != null'> where studno=#{studno} </when>",
	 * "<when test = 'height != null'> where height>=#{height} </when>",
	 * "</choose>", "</script>"})
	 */
	@Select({
		"<script>",
		"select *from student",
		"<trim prefix = 'where' prefixOverrides='AND || OR'>",
		"<if test='grade != null'>and grade = #{grade}</if>",
		"<if test='height != null'>and height >= #{height}</if>",
		"</trim>",
		"</script>"	
	})
	List<Student> select2(Map<String, Object> map);
	

	
}
