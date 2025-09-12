# Make를 이용한 Docker 워크플로우 자동화

## `make`란 무엇인가?

`make`는 소프트웨어 빌드 과정을 자동화하는 데 사용되는 유틸리티입니다. `make`는 `Makefile`이라는 파일에 정의된 규칙(rule)을 따릅니다. 각 규칙은 특정 작업을 수행하는 셸 명령어들의 집합입니다.

`make`는 Docker에 포함된 도구가 아니며, Unix 기반 시스템에서 오랫동안 사용되어 온 독립적인 빌드 자동화 도구입니다. 개발자는 `Makefile`에 `build`, `run`, `clean` 등과 같은 작업(target)을 정의하고, `make build`와 같은 간단한 명령으로 해당 작업을 실행할 수 있습니다.

## 왜 Docker와 함께 `make`를 사용하는가?

Docker 명령어는 길고 복잡해지기 쉽습니다. 특히 여러 옵션, 포트 매핑, 볼륨 마운트가 포함될 경우 더욱 그렇습니다. `Makefile`을 사용하면 이러한 복잡한 Docker 명령어들을 추상화하고 단순화할 수 있습니다.

*   **자동화:** 이미지 빌드, 컨테이너 실행, 정리 등 반복적인 작업을 `make <target>` 명령 하나로 자동화합니다.
*   **일관성:** 모든 팀 구성원이 동일한 `Makefile`을 공유함으로써 동일한 명령과 옵션으로 Docker를 사용하도록 보장합니다.
*   **단순성:** `docker run -d --rm --name ...`과 같은 긴 명령을 `make run-detached`와 같이 기억하기 쉬운 명령으로 대체합니다.
*   **의존성 관리:** `run` 타겟이 `build` 타겟에 의존하도록 설정하여, 컨테이너를 실행하기 전에 항상 최신 이미지를 빌드하도록 강제할 수 있습니다.

## 예제 시나리오

다음은 Docker 이미지 빌드부터 컨테이너 실행 및 관리까지 전체 워크플로우를 `Makefile`로 자동화하는 예제입니다.

### 1. 프로젝트 구조

```
.
├── Dockerfile
├── app.py
└── Makefile
```

### 2. `Dockerfile` 및 `app.py`

`Dockerfile`은 이미지를 정의하고 `app.py`는 애플리케이션 코드입니다. (자세한 내용은 `../image/01_dockerfile_for_image.md` 참고)

**`app.py`**

``` python
# app.py
print("Hello from inside the Docker container!")
```

**`Dockerfile`**

``` dockerfile
# Dockerfile
FROM python:3.9-slim-buster
WORKDIR /app
COPY app.py .
CMD ["python", "app.py"]
```

### 3. `Makefile`

이 `Makefile`은 전체 Docker 작업을 관리합니다.

```makefile
# Makefile

# 변수 정의
IMAGE_NAME := my-python-app
CONTAINER_NAME := my-python-container
PORT := 8000

# .PHONY: 가짜 타겟을 정의. 파일 이름과 혼동하지 않도록 함.
.PHONY: build run run-detached stop clean shell logs

# Docker 이미지 빌드
build:
	@echo "[INFO] Building Docker image: $(IMAGE_NAME)"
	docker build -t $(IMAGE_NAME) .
	@echo "[OK] Docker image built successfully."

# Docker 컨테이너 실행 (포그라운드)
run: build
	@echo "[INFO] Running Docker container: $(CONTAINER_NAME)"
	docker run --rm --name $(CONTAINER_NAME) $(IMAGE_NAME)
	@echo "[OK] Docker container started."

# Docker 컨테이너 실행 (백그라운드)
run-detached: build
	@echo "[INFO] Running Docker container in detached mode: $(CONTAINER_NAME)"
	docker run -d --rm --name $(CONTAINER_NAME) -p $(PORT):$(PORT) $(IMAGE_NAME)
	@echo "[OK] Docker container started in detached mode on port $(PORT)."

# 실행 중인 컨테이너 중지
stop:
	@echo "[INFO] Stopping Docker container: $(CONTAINER_NAME)"
	docker stop $(CONTAINER_NAME) || true
	@echo "[OK] Docker container stopped."

# 리소스 정리 (컨테이너 중지 및 이미지 제거)
clean: stop
	@echo "[INFO] Cleaning up Docker resources..."
	docker rmi $(IMAGE_NAME) || true
	@echo "[OK] Docker resources cleaned."

# 실행 중인 컨테이너의 셸에 접속
shell:
	@echo "[INFO] Attaching to shell in container: $(CONTAINER_NAME)"
	docker exec -it $(CONTAINER_NAME) /bin/bash

# 컨테이너 로그 확인
logs:
	@echo "[INFO] Displaying logs for container: $(CONTAINER_NAME)"
	docker logs -f $(CONTAINER_NAME)
```

### 4. 사용 방법

```bash
# 이미지 빌드
make build

# 컨테이너 실행
make run

# 컨테이너 백그라운드 실행
make run-detached

# 컨테이너 중지
make stop

# 컨테이너 셸 접속
make shell

# 리소스 모두 정리
make clean
```
