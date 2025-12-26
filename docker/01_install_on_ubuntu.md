# Ubuntu Docker 설치

**개요**: Ubuntu 환경 Docker Engine 및 Docker Desktop 설치 가이드.

## 1. 사전 준비

* **OS**: Ubuntu 지원 버전 확인.
* **클린 설치**: 기존 비공식/구형 Docker 패키지 제거 권장.
* **Docker Desktop 요구사항**:
  * 64-bit 커널 및 가상화 지원 CPU.
  * KVM 가상화 지원.
  * QEMU 5.2 이상.
  * 4GB 이상 RAM.

## 2. 저장소 설정 (공통)

**GPG 키 및 저장소 추가**:

```bash
# 필수 패키지 설치 및 GPG 키 추가
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Apt 소스 리스트에 Docker 저장소 추가
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 패키지 인덱스 업데이트
sudo apt-get update
```

## 3. 설치 유형 선택

### A. Docker Engine (CLI 중심)

**Engine 설치**:

```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

**설치 검증**:

```bash
# 테스트 이미지 실행
sudo docker run hello-world
```

### B. Docker Desktop (GUI 환경)

**Desktop 설치**:

1. **패키지 다운로드**: [Docker 웹사이트](https://docs.docker.com/desktop/install/ubuntu/)에서 최신 `.deb` 파일 다운로드.
2. **설치 실행**:

    ```bash
    sudo apt-get update
    # 다운로드 경로로 이동 후 실행 (<version> 등 파일명 일치 필요)
    sudo apt-get install ./docker-desktop-<version>-<arch>.deb
    ```

**실행 및 확인**:

* **실행**: 어플리케이션 메뉴 > Docker Desktop.
* **동의**: 서비스 계약 동의 필요.
* **공존**: Engine과 Desktop 동시 설치 가능 (Context 분리됨).
