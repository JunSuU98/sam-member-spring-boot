package su.boot.begin.service;

import java.math.BigInteger;
import java.security.SecureRandom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import lombok.RequiredArgsConstructor;
import su.boot.begin.config.NaverApiKeys;
import su.boot.begin.vo.NaverAPIVO;
import su.boot.begin.vo.NaverResponseVO;
import su.boot.begin.vo.NaverVO;

@Service
@RequiredArgsConstructor
public class SocialLoginService {
	
	@Autowired
	private RestTemplate restTemplate;
	
	@Autowired
	private final NaverApiKeys naverApiKeys;
	
	// 0. 네이버 로그인 api 사용
	public String getNaverLogin() {
		SecureRandom random = new SecureRandom();
	    String state = new BigInteger(130, random).toString();
		
		String url = "https://nid.naver.com/oauth2.0/authorize?response_type=code"
		        + "&client_id=" + naverApiKeys.getNaverClientId()
		        + "&redirect_uri=" + naverApiKeys.getNaverRedirectURL() 
		        + "&state=" + state;	
		
		return url;
	}

	
	// 1. access token 발급 요청 
	public NaverVO getNaverAccessToken(String code) {
		
		String url = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code"
				+ "&client_id=" + naverApiKeys.getNaverClientId()
				+ "&client_secret=" + naverApiKeys.getNaverClientSecret() 
				+ "&code=" + code;
		
		ResponseEntity<NaverVO> response = restTemplate.getForEntity(url, NaverVO.class);	
		
		if(response.getStatusCode() == HttpStatus.OK) {
			return response.getBody();
			
		} else {

			return null;
		}
	}
	
	// 2. access token 으로 접근해 사용자의 정보 요청
	public NaverResponseVO getNaverProfile(String accessToken) {
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "Bearer " + accessToken);
		
		HttpEntity<String> entity = new HttpEntity<>(headers);

		String apiURL = "https://openapi.naver.com/v1/nid/me";
		
		ResponseEntity<NaverAPIVO> response2 = restTemplate.exchange(apiURL, HttpMethod.GET, entity, NaverAPIVO.class);
		
		if(response2.getStatusCode() == HttpStatus.OK) {
			return response2.getBody().getNaverResponseVO();
			
		}
		
		return null;
	}
	
	
	// 3. 네이버 로그아웃
	public String naverLogout(String accessToken, String refreshToken) {
		
		// 3-1. 네이버 access token 삭제 요청
		String deleteUrl = "https://nid.naver.com/oauth2.0/token?grant_type=delete"
				+ "&client_id=" + naverApiKeys.getNaverClientId()
				+ "&client_secret=" + naverApiKeys.getNaverClientSecret() 
				+ "&accessToken=" + accessToken
				+ "&service_provider=NAVER";
		
		ResponseEntity<String> response = restTemplate.getForEntity(deleteUrl, String.class);	
		
		if(response.getStatusCode() == HttpStatus.OK) { // 기존의 access token 삭제 성공
			
		} else {

		}
		
		// 3-2. 기존 refresh token 을 써서 더 이상 token refresh 할 수 없는지 확인
		String refreshUrl = "https://nid.naver.com/oauth2.0/token?grant_type=refresh_token"
				+ "&client_id=" + naverApiKeys.getNaverClientId()
				+ "&client_secret=" + naverApiKeys.getNaverClientSecret() 
				+ "&refresh_token=" + refreshToken;
		
		ResponseEntity<String> refreshResponse = restTemplate.getForEntity(refreshUrl, String.class);	
		
		if(refreshResponse.getStatusCode() == HttpStatus.OK) { // refresh token 을 할수 없기 때문에 로그아웃 성공
			System.out.println("로그아웃 성공!!");
			return "delete success";
		} else {
			System.out.println("로그아웃 실패!!!!!");
			return "delete fail";
		}
		
	}
	
}
