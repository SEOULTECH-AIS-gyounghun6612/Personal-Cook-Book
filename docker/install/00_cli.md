# Ubuntu에 Docker Engine 설치 (CLI)

이 문서는 Ubuntu CLI 환경에 Docker Engine을 설치하는 단계를 요약합니다.

## 사전 요구 사항

- 지원되는 버전의 Ubuntu 운영 체제
- 오래되거나 비공식적인 Docker 패키지 제거

## 설치 단계

1.  **Docker의 `apt` 저장소 설정:**

    ```bash
    # Docker의 공식 GPG 키 추가:
    sudo apt-get update
    sudo apt-get install ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Apt 소스에 저장소 추가:
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
      $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    ```

2.  **Docker 패키지 설치:**

    ```bash
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    ```

3.  **설치 확인:**

    ```bash
    sudo docker run hello-world
    ```

이 명령어는 테스트 이미지를 다운로드하고 컨테이너에서 실행합니다. 컨테이너가 성공적으로 실행되면 Docker Engine이 성공적으로 설치된 것입니다.
