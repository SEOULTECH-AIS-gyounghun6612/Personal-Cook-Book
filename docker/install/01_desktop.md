# Ubuntu에 Docker Desktop 설치

이 문서는 Ubuntu Desktop 환경에 Docker Desktop을 설치하는 단계를 요약합니다.

## 사전 요구 사항

- 64비트 커널 및 가상화를 위한 CPU 지원
- KVM 가상화 지원
- QEMU 버전 5.2 이상
- `systemd` 초기화 시스템
- GNOME, KDE 또는 MATE 데스크톱 환경
- 4GB 이상의 RAM

## 설치 단계

1.  **Docker의 패키지 저장소 설정 (한 번만 수행):**

    ```bash
    sudo apt-get update
    sudo apt-get install ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
      $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    ```

2.  **최신 DEB 패키지 다운로드:**

    [Docker 웹사이트](https://docs.docker.com/desktop/install/ubuntu/)에서 최신 `.deb` 패키지를 다운로드합니다.

3.  **`apt`를 사용하여 패키지 설치:**

    ```bash
    sudo apt-get update
    sudo apt-get install ./docker-desktop-<version>-<arch>.deb
    ```
    `<version>`과 `<arch>`를 다운로드한 파일 이름으로 바꾸십시오.

## Docker Desktop 시작

설치 후 Gnome/KDE 데스크톱의 응용 프로그램 메뉴에서 Docker Desktop을 찾아 실행합니다. Docker 구독 서비스 계약이 표시되며, 계속하려면 동의해야 합니다.

## Docker Desktop과 Docker Engine

Docker Desktop for Linux와 Docker Engine은 동일한 시스템에 함께 설치할 수 있습니다. Docker Desktop은 컨테이너와 이미지를 VM 내의 격리된 저장소 위치에 저장하여 Docker Engine 설치에 영향을 주지 않습니다. `docker context ls` 명령을 사용하여 사용 가능한 컨텍스트를 보고 전환할 수 있습니다.
