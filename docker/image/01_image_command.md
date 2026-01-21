# 이미지 기본 조작 (Basic Commands)

Docker 이미지 관리와 레지스트리(Hub) 상호작용을 위한 핵심 명령어

## 목차

1. [조회 및 다운로드 (List & Pull)](#1-조회-및-다운로드-list--pull)
2. [생성 및 업로드 (Build & Push)](#2-생성-및-업로드-build--push)
3. [삭제 및 정리 (Remove)](#3-삭제-및-정리-remove)

## 1. 조회 및 다운로드 (List & Pull)

로컬 이미지를 확인하거나 원격 저장소에서 이미지를 받아옴

### 목록 확인 : `docker images`

```bash
docker images
```

### 다운로드 : `docker pull [NAME]:[TAG]`

```bash
# 최신 우분투 이미지
docker pull ubuntu:latest

# 특정 버전의 Python 이미지
docker pull python:3.9-slim
```

## 2. 생성 및 업로드 (Build & Push)

새로운 이미지를 만들거나 원격 저장소에 공유

### 이미지 빌드 : `docker build`

Dockerfile이 있는 경로에서 실행

```bash
# 현재 디렉토리(.)를 빌드 컨텍스트로 하여 'my-app' 이미지 생성
docker build -t my-app:v1 .
```

### 태그 지정 및 업로드

원격 저장소(Docker Hub 등) 업로드를 위해선 적절한 태그 필요

```bash
# 1. 로그인
docker login

# 2. 태그 생성 (ID/이미지명:태그)
docker tag my-app:v1 my-username/my-app:v1

# 3. 업로드
docker push my-username/my-app:v1
```

## 3. 삭제 및 정리 (Remove)

사용하지 않는 이미지 삭제로 디스크 공간 확보

### 삭제 : `docker rmi [IMAGE]`

```bash
# 특정 이미지 삭제
docker rmi python:3.9-slim

# 사용하지 않는(Dangling) 이미지 일괄 정리
docker image prune
```