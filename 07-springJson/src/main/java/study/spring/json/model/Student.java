package study.spring.json.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @AllArgsConstructor
@ToString(includeFieldNames = true)
@Getter @Setter
public class Student {
	private int studno;
	private String name;
	private String userid;
	private int grade;
	private String idnum;
	private String birthdate;
	private String tel;
	private int height;
	private int weight;
	private int deptno;
	private int profno;


	// 페이지 구현이 필요한 경우 아래 속성도 추가한다.
	private static int offset;
	private static int listCount;
	
	public static int getOffset() {
		return offset;
	}
	
	public static void setOffset(int offset) {
		Student.offset = offset;
	}
	
	public static int getListCount() {
		return listCount;
	}
	
	public static void setListCount(int listCount) {
		Student.listCount = listCount;
	}

}
