# Ubuntu Docker 설치 (Installation)

Ubuntu 환경에서 Docker Engine 및 Docker Desktop을 설치하고 구성하는 가이드

## 목차

1. [사전 준비 (Preparation)](#1-사전-준비-preparation)
2. [저장소 설정 (Repository)](#2-저장소-설정-repository)
3. [설치 (Install)](#3-설치-install)

## 1. 사전 준비 (Preparation)

기존에 설치된 비공식 또는 구형 Docker 패키지를 제거하고 필수 유틸리티를 설치

### 시스템 정리 및 도구 설치

```bash
# 충돌 방지를 위한 구버전 제거
sudo apt-get remove docker docker-engine docker.io containerd runc

# 필수 유틸리티 설치 (HTTPS 전송, 인증서 등)
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
```

## 2. 저장소 설정 (Repository)

공식 Docker 패키지를 다운로드하기 위한 GPG 키 인증 및 저장소 등록

### GPG 키 및 저장소 추가

```bash
# 1. Docker 공식 GPG 키 추가
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# 2. Apt 소스 리스트에 Docker 저장소 등록
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 3. 패키지 인덱스 업데이트
sudo apt-get update
```

## 3. 설치 (Install)

CLI 환경의 Docker Engine 또는 GUI 환경의 Docker Desktop 선택 설치

### A. Docker Engine (CLI 추천)

서버 환경이나 일반적인 개발 시 권장

```bash
# 최신 버전 설치
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# 설치 확인 (Hello World 실행)
sudo docker run hello-world
```

### B. Docker Desktop (GUI)

시각적인 관리 도구가 필요한 경우 ([공식 다운로드 링크](https://docs.docker.com/desktop/install/ubuntu/))

```bash
# .deb 파일 다운로드 후 실행
sudo apt-get update
sudo apt-get install ./docker-desktop-<version>-<arch>.deb
```
