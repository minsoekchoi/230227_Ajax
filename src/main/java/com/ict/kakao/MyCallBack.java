package com.ict.kakao;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyCallBack {
	@RequestMapping("login.do")
	public ModelAndView myCallBack(HttpServletRequest request) {
		// 1. 인증 코드 받기
		String code = request.getParameter("code");
//		System.out.println("code : " + code);

		// 2. 토큰 받기
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST 요청을 위해 conn.setDoOutput(true) 지정
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

			// 필요로 요구하는 파라미터를 스트링을 통해서 전송하자
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=1f0754fda7f116a7b27b1064a61e507a");
			sb.append("&redirect_uri=http://localhost:8090/login.do");
			sb.append("&code=" + code);
			bw.write(sb.toString());
			bw.flush();

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			// 요청을 통해 얻은 JSON 타입의 메세지를 읽자
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			br.close();
			bw.close();

			JSONParser parser = new JSONParser();
			Object obj = parser.parse(result.toString());
			JSONObject j_obj = (JSONObject) obj;
			String access_token = (String) j_obj.get("access_token");
			String refresh_token = (String) j_obj.get("refresh_token");

			request.getSession().setAttribute("access_token", access_token);
			request.getSession().setAttribute("refresh_token", refresh_token);

		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("result");
	}
}