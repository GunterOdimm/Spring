package study.spring.SpringHelper.service;

import retrofit2.Call;
import retrofit2.Retrofit;
import retrofit2.http.GET;
import retrofit2.http.Query;
import study.spring.SpringHelper.Helper.RetrofitHelper;
import study.spring.SpringHelper.model.SearchDailyBoxOfficeList;

public interface kobisService {
	public static final Retrofit retrofit = RetrofitHelper.getInstance().getRetrofit("http://www.kobis.or.kr");
	
	@GET("http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=6d2cf4aa96725383235c717f2e569f1e")
	Call<SearchDailyBoxOfficeList> getSearchDailyBoxOfficeList(@Query("targetDt") String targetDt);
}
