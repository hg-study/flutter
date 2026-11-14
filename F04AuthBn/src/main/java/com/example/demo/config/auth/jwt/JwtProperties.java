package com.example.demo.config.auth.jwt;

/**
 * JWT 기본 설정값 (단위: 밀리초)
 *
 * 참고: 수업 중 "토큰 만료 → 자동 갱신" 과정을 시연하고 싶으면
 *       아래 값을 짧게(예: ACCESS 30초, REFRESH 2분) 줄여서 테스트하세요.
 */
public class JwtProperties {
    public static final int ACCESS_TOKEN_EXPIRATION_TIME = 1000*60*30;        // 30분
    public static final int REFRESH_TOKEN_EXPIRATION_TIME = 1000*60*60*24;    // 24시간
    public static final String ACCESS_TOKEN_COOKIE_NAME = "access-token";
    public static final String REFRESH_TOKEN_COOKIE_NAME = "refresh-token";
}
