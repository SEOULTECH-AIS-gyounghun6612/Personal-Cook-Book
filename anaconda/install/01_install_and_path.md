# Conda 설치 및 초기 설정

Ubuntu 환경(CLI) 기준 Anaconda/Miniconda 설치 및 시스템 경로 설정 가이드.

## 목차

1. [설치 파일 다운로드 (Download)](#1-설치-파일-다운로드-download)
2. [설치 실행 (Install)](#2-설치-실행-install)
3. [경로 설정 (Path Configuration)](#3-경로-설정-path-configuration)

## 1. 설치 파일 다운로드 (Download)

시스템 아키텍처에 맞는 설치 스크립트(`.sh`) 다운로드

* Miniconda: 최소 설치, 가벼움 (추천)
* Anaconda: 데이터 과학용 패키지 다수 포함, 무거움

### 다운로드 및 무결성 검사

`wget`을 사용하여 설치 파일을 다운로드하고, `shasum`으로 파일 무결성을 확인

```bash
# 예시: Miniconda3 (Linux x86_64) 다운로드
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

# 무결성 검사 (Optional)
shasum -a 256 Miniconda3-latest-Linux-x86_64.sh
```

## 2. 설치 실행 (Install)

다운로드한 스크립트를 실행하여 설치 진행 및 라이선스 동의

### 설치 스크립트 실행

```bash
bash Miniconda3-latest-Linux-x86_64.sh
# 약관 동의(yes), 설치 경로(Enter/기본값), 초기화(yes/no) 선택
```

### 문제 해결 (Troubleshooting)

* `Permission denied`: `chmod +x {filename}.sh`로 실행 권한 부여
* 다중 사용자 설치: 관리자 권한(`sudo`)으로 `/opt` 등 공용 경로에 설치 권장

## 3. 경로 설정 (Path Configuration)

`conda` 명령어를 어디서든 실행할 수 있도록 쉘 설정 파일(`~/.bashrc` 등) 수정

### 자동 설정 (Recommended)

설치 시 `init`을 선택했다면 자동 적용됨. 수동 실행 필요 시 아래 명령어로 적용

```bash
source ~/.bashrc  # 변경사항 즉시 적용
```

### 수동 설정 (Manual)

`~/.bashrc` 파일 하단에 아래 내용 추가 (설치 경로 확인 필수)

```bash
# Conda Path Setting
export PATH="/home/{username}/miniconda3/bin:$PATH"
```
