# 컨테이너 기본 조작

Docker 사용 시 가장 빈번하게 사용하는 핵심 명령어와 주요 옵션 정리.

## 0.요약 비교

| 작업          | 명령어 | 대상 | 비고 |
| :-----------: | :--- | :--- | :--- |
| **상태 확인** | [`ps`](#목록-확인--docker-ps-options)                       | -        | 현재 상태 확인 |
| **신규 실행** | [`run`](#새로-실행--docker-run-options-image-command)       | 이미지   | 새 환경 생성   |
| **재가동**    | [`start`](#다시-시작--docker-start-options-container)       | 컨테이너 | 기존 환경 유지 |
| **종료**      | [`stop`](#정지--docker-stop-container)                      | 컨테이너 | 데이터 유지    |
| **삭제**      | [`rm`](#삭제--docker-rm-options-container)                  | 컨테이너 | 데이터 소멸    |
| **접속**      | [`exec`](#명령-실행--docker-exec-options-container-command) | 컨테이너 | 디버깅/조작    |

## 1. 실행 및 시작

### 새로 실행 : `docker run [OPTIONS] IMAGE [COMMAND]`

**주요 옵션**:

* `-d`: 백그라운드에서 실행 (Detached mode).
* `-p <호스트>:<컨테이너>`: 포트 연결 (Publish).
* `-v <호스트>:<컨테이너>`: 저장소 공유 (Volume).
* `--name <이름>`: 컨테이너 이름 지정.
* `--rm`: 종료 시 자동 삭제.
* `-it`: 터미널 입출력 활성화 (Interactive + TTY).
* `--gpus all`: GPU 사용 활성화 (NVIDIA).

**사용 예시**:

```bash
# Nginx 웹 서버를 백그라운드로 실행하고 8080포트 연결
docker run -d --name web-server -p 8080:80 nginx

# Python 환경에 접속하여 작업 후 종료 시 삭제
docker run -it --rm python:3.9 bash

# GPU를 사용하는 딥러닝 컨테이너 실행
docker run --gpus all -it pytorch/pytorch:latest
```

### 다시 시작 : `docker start [OPTIONS] CONTAINER`

**주요 옵션**:

* `-a`: 실행 화면(Output)을 현재 터미널에 표시 (Attach).

**사용 예시**:

```bash
# 멈춰있는 'web-server' 다시 시작
docker start web-server
```

## 2. 상태 제어

### 정지 : `docker stop CONTAINER`

**사용 예시**:

```bash
# 특정 컨테이너 정지
docker stop web-server
```

### 재시작 : `docker restart CONTAINER`

**사용 예시**:

```bash
docker restart web-server
```

### 명령 실행 : `docker exec [OPTIONS] CONTAINER COMMAND`

**주요 옵션**:

* `-it`: 대화형 셸 접속 시 필수.
* `-u <user>`: 특정 사용자로 실행.
* `-w <dir>`: 명령을 실행할 작업 디렉토리 지정.

**사용 예시**:

```bash
# 실행 중인 컨테이너의 bash 셸 접속
docker exec -it web-server bash

# 컨테이너 내부의 파일 리스트 확인
docker exec web-server ls -l /app
```

## 3. 조회 및 정리

### 목록 확인 : `docker ps [OPTIONS]`

**주요 옵션**:

* `-a`: 중지된 컨테이너 포함 전체 조회.
* `-q`: 컨테이너 ID만 출력 (스크립트용).

**사용 예시**:

```bash
# 모든 컨테이너 목록 확인
docker ps -a
```

### 삭제 : `docker rm [OPTIONS] CONTAINER`

**주요 옵션**:

* `-f`: 실행 중인 컨테이너 강제 삭제 (Force).

**사용 예시**:

```bash
# 중지된 컨테이너 삭제
docker rm web-server

# 실행 중인 컨테이너 강제 삭제
docker rm -f web-server

# 중지된 모든 컨테이너 일괄 삭제
docker rm $(docker ps -a -q)
```
