package study.spring.json.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.json.model.Student;
import study.spring.json.service.StudentService;

@Slf4j
@Service
public class StudentServiceImpl implements StudentService {

	/** MyBatis */
	// --> import org.apache.ibatis.session.SqlSession
	@Autowired
	SqlSession sqlSession;

	/** 생성자를 통한 객체 생성 */

	/**
	 * OO 데이터 상세 조회
	 * 
	 * @param Student 조회할 학과의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public Student getStudentItem(Student input) throws Exception {
		Student result = null;

		try {
			result = sqlSession.selectOne("StudentMapper.selectItem", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");

		}
		return result;
	}

	/**
	 * OO 데이터 목록 조회
	 * 
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Student> getStudentList(Student input) throws Exception {
		List<Student> result = null;

		try {
			result = sqlSession.selectList("StudentMapper.selectList", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/**
	 * OO 데이터가 저장되어 있는 갯수 조회
	 * 
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getStudentCount(Student input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("StudentMapper.selectCount", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/**
	 * OO 데이터 등록하기
	 * 
	 * @param Student 저장할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public int addStudent(Student input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("StudentMapper.insertItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}

		return result;
	}

	/**
	 * OO 데이터 수정하기
	 * 
	 * @param Student 수정할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public int editStudent(Student input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("StudentMapper.updateItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("수정된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 수정에 실패했습니다.");
		}

		return result;
	}

	/**
	 * OO 데이터 삭제하기
	 * 
	 * @param Student 삭제할 학과의 일련번호를 담고 있는 Beans
	 * @throws Exception
	 */
	@Override
	public int deleteStudent(Student input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.delete("StudentMapper.deleteItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삭제된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 삭제에 실패했습니다.");
		}
		return result;
	}

}
