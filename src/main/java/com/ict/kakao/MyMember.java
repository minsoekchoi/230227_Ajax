package com.ict.kakao;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MyMember {
	@RequestMapping(value = "member.do", produces = "text/html; charset=utf-8")
	@ResponseBody
	private String memberChk(HttpSession session) {
		String access_token = (String)session.getAttribute("access_token");
		// refresh_token은 필요할때 받아서 사용
		// 토큰을 이용해서 사용자 정보 가져오기
		String apiURL = "https://kapi.kakao.com/v2/user/me";
		String header = "Bearer "+access_token;
		
		Map<String, String> requestHeaders = new HashMap<String, String>();
		requestHeaders.put("Authorization", header);
		
		String responseBody = kakao_send(apiURL, requestHeaders);
		return responseBody;
	}
	private static String kakao_send(String apiURL, Map<String, String> requestHeaders) {
		HttpURLConnection conn = null;
		try {
			URL url = new URL(apiURL);
			conn = (HttpURLConnection)url.openConnection();
			
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
//			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			
			for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
				conn.setRequestProperty(header.getKey(), header.getValue());
			}
			// 결과 코드가 200이라면 성공
			int responseCode= conn.getResponseCode();
			if(responseCode == HttpURLConnection.HTTP_OK) {
				return readBody(conn.getInputStream());
			}else {
				return readBody(conn.getErrorStream());
			}
		} catch (Exception e) {
			System.out.println("연결 실패");
		}finally {
			try {
				conn.disconnect();
			} catch (Exception e2) {
			}
		}
		return null;
	}
	
	private static String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body);
		try {
			BufferedReader br = new BufferedReader(streamReader);
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = br.readLine()) != null) {
				sb.append(line);
			}
			return sb.toString();
		} catch (Exception e) {
			System.out.println("API 응답을 읽는데 실패");
		}
		return null;
	}
	
	
	
	
}
