# Dockerfile을 이용한 이미지 생성

이미지 빌드 절차 명세서. 텍스트 파일 형식. 운영 체제, 종속성, 환경 변수 등 설정 기록. 재현 가능하고 자동화된 이미지 생성 지원.

## Dockerfile 주요 명령어

핵심 명령어 및 역할 정리.

### 0. 요약 비교

| 명령어 | 역할 | 실행 시점 | 비고 |
| :---: | :--- | :---: | :--- |
| **베이스** | [`FROM`](#베이스-이미지--from-imagetag) | 빌드 | 필수 항목 |
| **디렉토리** | [`WORKDIR`](#작업-디렉토리--workdir-pathtoworkdir) | 빌드 | 작업 경로 이동 |
| **복사** | [`COPY`](#파일-복사--copy-src-dest) | 빌드 | 호스트 -> 이미지 |
| **실행** | [`RUN`](#명령-실행-빌드--run-command) | 빌드 | 패키지 설치 |
| **시작** | [`CMD`](#기본-명령-런타임--cmd-executableparam1param2) | 런타임 | 기본 실행값 |
| **변수** | [`ENV`](#환경-변수--env-key-value) | 빌드/런타임 | 영구 설정 |
| **포트** | [`EXPOSE`](#포트-노출--expose-port) | 메타데이터 | 사용 포트 명시 |

### 1. 베이스 및 환경 설정

#### 베이스 이미지 : `FROM <image>:<tag>`

**설명**: 빌드 시작점 지정. 필수 항목. 기반 OS 또는 런타임 이미지 선택.

**사용 예시**:

```dockerfile
FROM python:3.9
FROM ubuntu:20.04
```

#### 작업 디렉토리 : `WORKDIR /path/to/workdir`

**설명**: 컨테이너 내부 작업 경로 설정. 미존재 시 자동 생성. 이후 명령어의 실행 기준점.

**사용 예시**:

```dockerfile
WORKDIR /app
```

#### 환경 변수 : `ENV <key> <value>`

**설명**: 빌드 및 런타임 환경 변수 설정. 영구적으로 유지.

**사용 예시**:

```dockerfile
ENV APP_VERSION=1.0.0
ENV PYTHONUNBUFFERED=1
```

### 2. 파일 및 명령어 제어

#### 파일 복사 : `COPY <src> <dest>`

**설명**: 호스트 파일/디렉토리를 컨테이너 내부로 복사.

**사용 예시**:

```dockerfile
COPY . .
COPY requirements.txt /app/
```

#### 명령 실행 (빌드) : `RUN <command>`

**설명**: 이미지 빌드 시점 명령어 실행. 패키지 설치 및 환경 구성. 레이어 생성 및 저장.

**사용 예시**:

```dockerfile
RUN pip install -r requirements.txt
RUN apt-get update && apt-get install -y curl
```

### 3. 컨테이너 실행 설정

#### 기본 명령 (런타임) : `CMD ["executable","param1","param2"]`

**설명**: 컨테이너 시작 시 실행할 기본 명령어. `docker run` 인자로 덮어쓰기 가능.

**사용 예시**:

```dockerfile
CMD ["python", "app.py"]
```

#### 포트 노출 : `EXPOSE <port>`

**설명**: 사용 포트 명시. 문서화 목적. 실제 연결은 `docker run -p` 옵션 필요.

**사용 예시**:

```dockerfile
EXPOSE 80
```

## 예제 시나리오

NVIDIA GPU 및 Anaconda 기반 딥러닝 학습 환경 구축.

### 1. 목표 환경

- **Base**: `nvidia/cuda:12.8.1-cudnn-devel-ubuntu22.04`
- **Tools**: git, nano, wget, unzip 설치.
- **Python**: Anaconda3 환경 구성.

### 2. Dockerfile

```dockerfile
# CUDA 베이스 이미지 지정 (Ubuntu 22.04)
FROM nvidia/cuda:12.8.1-cudnn-devel-ubuntu22.04

# 시스템 업데이트 및 필수 도구 설치
# -y: 자동 승인. rm: 캐시 삭제로 이미지 최적화.
RUN apt-get update && apt-get install -y \
    git \
    nano \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Anaconda 설치 스크립트 다운로드 및 무인 설치
RUN wget https://repo.anaconda.com/archive/Anaconda3-2024.10-1-Linux-x86_64.sh -O /tmp/anaconda.sh && \
    bash /tmp/anaconda.sh -b -p /opt/anaconda3 && \
    rm /tmp/anaconda.sh

# PATH 환경 변수 등록 (conda 실행 환경 구성)
ENV PATH=/opt/anaconda3/bin:$PATH

# 작업 경로 설정
WORKDIR /workspace

# 기본 셸 실행
CMD ["/bin/bash"]
```

### 3. 이미지 빌드 및 실행

```bash
# 이미지 빌드 (-t: 이름 지정)
docker build -t dl-env .

# 컨테이너 실행 (GPU 활성화 및 터미널 접속)
# --gpus all: 호스트 GPU 전체 사용
docker run --gpus all -it --name my-lab dl-env
```

정상 여부 확인: `python --version` 또는 `nvidia-smi` 실행.
