# 사전 준비 (Preparation)

GitHub 원격 저장소 사용에 필요한 인증 수단(Token) 및 사용자 정보(Config)를 설정

## 목차

1. [인증 설정 (Token)](#1-인증-설정-token)
2. [사용자 설정 (Config)](#2-사용자-설정-config)

## 1. 인증 설정 (Token)

GitHub 보안 정책에 따라 비밀번호 대신 개인용 액세스 토큰(PAT, Personal Access Token)을 사용

### 토큰 생성

1. 메뉴 이동: GitHub `Settings` > `Developer settings` > `Personal access tokens` > `Tokens (classic)`.

2. 생성: `Generate new token` 클릭.
    * Note: 용도 입력 (예: `CLI-Token`)
    * Expiration: 유효 기간 설정 (보안상 주기적 갱신 권장)
    * Scopes: `repo` 체크 (필수 권한)

3. 보관: 생성된 토큰 값은 재확인이 불가능하므로 즉시 안전한 곳에 저장

### 토큰 사용

Git 명령어(`push`, `pull` 등) 실행 시 비밀번호 입력창에 저장해둔 **토큰 값**을 입력

> `VS Code 기반 개발 환경 사용자라면?`  
> 에디터 자체 GitHub 인증 기능을 활용하면 토큰 관리 없이 간편하게 작업 가능함 상세 방법은 [VS Code 설정 가이드](./) 참고

## 2. 사용자 설정 (Config)

Git 커밋 기록에 남을 작성자 이름 및 이메일 정보를 등록

### 사용자 등록 : `git config --global [KEY] "[VALUE]"`

시스템 전역(`--global`)에 적용될 사용자 정보를 설정

```bash
# 사용자 이름 설정
git config --global user.name "Your Name"

# 사용자 이메일 설정 (GitHub 계정과 동일하게 설정 권장)
git config --global user.email "your.email@example.com"
```

### 설정 확인 : `git config [KEY]`

현재 적용된 설정값을 확인

```bash
# 설정된 이름 및 이메일 확인
git config user.name
git config user.email
```
