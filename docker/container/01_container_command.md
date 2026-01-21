# 컨테이너 기본 조작 (Basic Commands)

Docker 사용 시 가장 빈번하게 사용하는 핵심 명령어와 주요 옵션 정리

## 목차

1. [실행 및 시작 (Run & Start)](#1-실행-및-시작-run--start)
2. [상태 제어 (Control)](#2-상태-제어-control)
3. [조회 및 정리 (List & Clean)](#3-조회-및-정리-list--clean)

## 1. 실행 및 시작 (Run & Start)

이미지를 기반으로 새로운 컨테이너를 만들거나, 멈춘 컨테이너를 재가동

### 새로 실행 : `docker run [OPTIONS] IMAGE`

주요 옵션

| 옵션 | 설명 |
| :--- | :--- |
| `-d` | 백그라운드 실행 (Detached) |
| `-p` | 포트 연결 (`호스트:컨테이너`) |
| `-v` | 볼륨 마운트 (`호스트:컨테이너`) |
| `--rm` | 종료 시 컨테이너 자동 삭제 |
| `-it` | 터미널 접속 (Interactive TTY) |
| `--gpus all` | GPU 사용 활성화 (NVIDIA) |

```bash
# Nginx 웹 서버 실행 (8080포트 연결)
docker run -d --name web -p 8080:80 nginx

# GPU 사용 Pytorch 환경 접속
docker run --gpus all -it pytorch/pytorch:latest
```

### 다시 시작 : `docker start [CONTAINER]`

멈춰있는 기존 컨테이너를 다시 구동

```bash
docker start my-container
```

## 2. 상태 제어 (Control)

실행 중인 컨테이너를 멈추거나 내부 명령 실행

### 정지 및 재시작

```bash
# 컨테이너 정지
docker stop my-container

# 컨테이너 재부팅
docker restart my-container
```

### 내부 접속 : `docker exec -it [CONTAINER] [CMD]`

실행 중인 컨테이너 내부 쉘로 진입

```bash
# bash 쉘 접속
docker exec -it web-server bash
```

## 3. 조회 및 정리 (List & Clean)

컨테이너 목록을 확인하고 불필요한 리소스 삭제

### 목록 확인 : `docker ps [OPTIONS]`

```bash
# 실행 중인 컨테이너만 조회
docker ps

# 정지된 컨테이너 포함 전체 조회
docker ps -a
```

### 삭제 : `docker rm [OPTIONS] [CONTAINER]`

```bash
# 정지된 컨테이너 삭제
docker rm web-server

# 실행 중인 컨테이너 강제 삭제 (-f)
docker rm -f web-server
```
