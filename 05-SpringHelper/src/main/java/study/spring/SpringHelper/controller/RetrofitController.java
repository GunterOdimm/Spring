package study.spring.SpringHelper.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import retrofit2.Call;
import study.spring.SpringHelper.Helper.WebHelper;
import study.spring.SpringHelper.model.SearchDailyBoxOfficeList;
import study.spring.SpringHelper.model.SearchDailyBoxOfficeList.BoxOfficeResult.DailyBoxOfficeList;
import study.spring.SpringHelper.service.kobisService;

@Controller
public class RetrofitController {

	@Autowired
	WebHelper webHelper;

	@RequestMapping(value = "retrofit/daily_box_office_graph.do", method = RequestMethod.GET)
	public ModelAndView dailyBoxOfficeGraph(Model model) {

		// ----------------------------------

		// 검색일 파라미터(yyyy-mm-dd 형식)
		String date = webHelper.getString("date");

		// 검색어가 없다면 Calendar 클래스를 사용하여 하루 전 날짜 값을 yyyy-mm-dd 형식으로 생성
		if (date == null) {
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.DATE, -1);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			date = sdf.format(cal.getTime());

			// 정석적인 처리 방식(심플데이트포멧 사용하지 않은 경우)
			// cal.add(Calendar.DAY_OF_MONTH, -1);
			// date = String.format("%04d-%02d-%02d", cal.get(Calendar.YEAR),
			// cal.get(Calendar.MONTH) + 1, cal.get(Calendar.DAY_OF_MONTH));
		}

		// 영화진흥원 API에 전달할 날짜 형식은 yyyymmdd 이므로 준비된 날짜 문자열에서 "-"을 제거한다.
		String targetDt = date.replace("-", "");

		// 영화진흥원 openapi를 통해 검색결과 받아오기
		kobisService service = kobisService.retrofit.create(kobisService.class);
		Call<SearchDailyBoxOfficeList> call = service.getSearchDailyBoxOfficeList(targetDt);
		SearchDailyBoxOfficeList daily_office = null;

		
		try {
			daily_office = call.execute().body();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		List<DailyBoxOfficeList> list = null;
		
		if(daily_office != null) {
			list = daily_office.getBoxOfficeResult().getDailyBoxOfficeList();
		}
		
		/** 그래프 출력을 위한 JS 코드에서 사용할 문자열 만들기 */
		int size = list.size(); // 리스트 길이 저장
		String[] audiCnt = new String[size]; // 해당일 관람객 수를 저장할 배열
		String[] movieNm = new String[size]; // 영화 제목을 저장할 배열
		String[] audiAcc = new String[size]; // 누적 관람객

		for (int i = 0; i < size; i++) { // 길이만큼 반복
			DailyBoxOfficeList item = list.get(i); // List에서 i번째 항목을 추출
			movieNm[i] = "'" + item.getMovieNm() + "'"; // 영화제목을 배열에 원소로 저장
			audiCnt[i] = String.valueOf(item.getAudiCnt()); // 해당일 관람객수를 배열에 원소로 저장
			audiAcc[i] = String.valueOf(item.getAudiAcc()); // 누적 관람객
		}

		String movieNmStr = String.join(", ", movieNm); // 영화제목 배열을 콤마(,)를 기준으로 문자열로 연결
		String audiCntStr = String.join(", ", audiCnt); // 해당일 관람객수 배열을 콤마(,)를 기준으로 문자열로 연결
		String audiAccStr = String.join(", ", audiAcc); // 누적 관람객

		model.addAttribute("date", date);
		model.addAttribute("targetDt", targetDt);
		model.addAttribute("movieNmStr", movieNmStr);
		model.addAttribute("audiCntStr", audiCntStr);
		model.addAttribute("audiAccStr", audiAccStr);

		String viewPath = "retrofit/daily_box_office_graph";
		return new ModelAndView(viewPath);
	}

}
