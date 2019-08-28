package study.spring.springDB.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import study.spring.springDB.helper.DownloadHelper;
import study.spring.springDB.helper.UploadItem;
import study.spring.springDB.helper.WebHelper;

@Controller
public class UploadController {
	@Autowired
	WebHelper webHelper;
	
	@Autowired
	DownloadHelper downloadHelper;
	
	@RequestMapping(value = "/upload/upload.do",method = RequestMethod.GET)
	public String uplod(Model model) {
		return "upload/upload";
	}
	
	@RequestMapping(value = "/upload/upload_ok.do", method = RequestMethod.POST)
	public ModelAndView uploadOk(Model model) {
		// 업로드를 수행
		try {
			webHelper.upload();
		} catch (Exception e) {
			e.printStackTrace();
			return webHelper.redirect(null,"업로드에 실패했습니다.");
		}

		// 업로드 된 정보 추출하기
		// 파일 정보 추출
		List<UploadItem> fileList = webHelper.getFileList();
		// 그 밖의 일반 데이터를 저장하기 위한 컬렉션
		Map<String, String> paramMap = webHelper.getParamMap();
		
		//텍스트 데이터에서 입력값을 추출한다.
		String subject = paramMap.get("subject");

		model.addAttribute("fileList",fileList);
		model.addAttribute("subject",subject);
		
		String viewPath = "/upload/upload_ok";
		return new ModelAndView(viewPath);
	}
	
	@RequestMapping(value = "/upload/download.do", method = RequestMethod.GET)
	public ModelAndView download(Model model) {
		
		// 서버상에 저장되어 있는 파일 경로(필수)
		String filePath = webHelper.getString("file");
		System.out.println(filePath);
		
		// 원본 파일이름(미필수)
		String orginName = webHelper.getString("origin");

		System.out.println(orginName);
		// 축소될 이미지 해상도 --> 320x320
		String size = webHelper.getString("size");
		
		// 이미지 크롭 여부 --> 값이 없을 경우 기본값 false
		String crop = webHelper.getString("crop", "false");
		
		// 다운로드 스트림 출력하기.
		if(filePath != null) {
			try {
				if(size != null) {
					// x를 기준으로 나눠서 숫자로 변환
					String[] temp = size.split("x");
					int width = Integer.parseInt(temp[0]);
					int height = Integer.parseInt(temp[1]);
					
					// 크롭 여부를 boolean으로 설정
					boolean is_crop = false;
					if(crop.equals("true")) {
						is_crop = true;
					}
				// 썸네일 생성 후 다운로드 처리
				downloadHelper.download(filePath, width, height, is_crop);
				} else {
					// 원본에 대한 다운로드 처리
					downloadHelper.download(filePath, orginName);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}

}
