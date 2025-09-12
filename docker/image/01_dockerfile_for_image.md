# Dockerfile을 이용한 이미지 생성

`Dockerfile`은 Docker 이미지를 어떻게 빌드할지를 명시하는 텍스트 파일입니다. 여기에는 운영 체제, 종속성, 파일, 환경 변수, 실행할 명령어 등 이미지를 구성하는 데 필요한 모든 단계가 순서대로 기록됩니다.

Docker는 이 `Dockerfile`을 읽어 순차적으로 명령을 실행함으로써 재현 가능하고 자동화된 방식으로 이미지를 생성합니다.

## 예제 시나리오

간단한 Python 애플리케이션을 위한 이미지를 생성하는 예제입니다.

### 1. 프로젝트 구조

```
.
├── Dockerfile
└── app.py
```

### 2. `app.py` (예제 Python 애플리케이션)

```python
# app.py
print("Hello from inside the Docker container!")
```

### 3. `Dockerfile`

이 파일은 이미지를 빌드하기 위한 설계도입니다.

```dockerfile
# 베이스 이미지 지정 (Python 3.9 slim 버전)
FROM python:3.9-slim-buster

# 작업 디렉토리 설정
WORKDIR /app

# 현재 디렉토리의 app.py를 컨테이너의 /app 디렉토리로 복사
COPY app.py .

# 컨테이너가 시작될 때 실행할 기본 명령어
CMD ["python", "app.py"]
```

### 4. 이미지 빌드 명령어

터미널에서 다음 명령을 실행하여 `Dockerfile`로부터 이미지를 빌드할 수 있습니다.

```bash
# -t 옵션으로 이미지에 이름(my-python-app)과 태그(latest)를 부여합니다.
# '.'은 현재 디렉토리에서 Dockerfile을 찾으라는 의미입니다.
docker build -t my-python-app .
```

빌드가 완료되면 `docker images` 명령으로 생성된 `my-python-app` 이미지를 확인할 수 있습니다.
