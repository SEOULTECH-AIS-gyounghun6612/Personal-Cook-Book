# Dockerfile 작성 가이드

이미지 생성 절차를 기록한 명세서로, 인프라를 코드로 관리(IaC)하는 핵심 도구

## 목차

1. [주요 명령어 (Commands)](#1-주요-명령어-commands)
2. [작성 예시 (Example)](#2-작성-예시-example)

## 1. 주요 명령어 (Commands) 

Dockerfile을 구성하는 핵심 지시어

| 명령어 | 역할 | 설명 |
| :--- | :--- | :--- |
| `FROM` | 베이스 이미지 | 빌드의 시작점 (OS 또는 런타임) |
| `WORKDIR` | 작업 디렉토리 | `cd`와 유사. 이후 명령어의 실행 경로 지정 |
| `COPY` | 파일 복사 | 호스트의 파일을 이미지 내부로 복사 |
| `RUN` | 명령 실행 | 패키지 설치 등 빌드 과정에서 실행할 쉘 커맨드 |
| `ENV` | 환경 변수 | 지속적으로 유지될 환경 변수 설정 |
| `CMD` | 시작 명령 | 컨테이너 실행 시 기본적으로 수행할 명령어 |

## 2. 작성 예시 (Example)

딥러닝 연구를 위한 Python + CUDA 환경 구축 예제

### Dockerfile

```dockerfile
# 1. 베이스 이미지 (CUDA 12.8 + Ubuntu 22.04)
FROM nvidia/cuda:12.8.1-cudnn-devel-ubuntu22.04

# 2. 필수 시스템 패키지 설치
# 캐시 삭제(rm -rf)를 통해 이미지 크기 최적화
RUN apt-get update && apt-get install -y \
    git \
    wget \
    && rm -rf /var/lib/apt/lists/*

# 3. 작업 경로 설정
WORKDIR /workspace

# 4. 소스 코드 복사
COPY requirements.txt .

# 5. Python 패키지 설치
RUN pip install -r requirements.txt

# 6. 기본 실행 명령 (bash 쉘 진입)
CMD ["/bin/bash"]
```

### 빌드 및 실행

```bash
# 이미지 빌드
docker build -t my-dl-env .

# GPU 활성화하여 실행
docker run --gpus all -it my-dl-env
```