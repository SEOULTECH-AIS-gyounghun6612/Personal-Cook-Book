# 원격 저장소 연동을 위한 사전 준비

로컬 저장소와 GitHub 원격 저장소를 연동하기 전에, 안전한 인증을 위한 몇 가지 사전 준비가 필요합니다.

## GitHub 개인용 액세스 토큰 (Personal Access Token) 사용

2021년 8월부터 GitHub는 비밀번호를 이용한 Git 인증을 더 이상 지원하지 않습니다. 대신 개인용 액세스 토큰(PAT)을 사용해야 합니다.

### 토큰 생성 방법

1.  **GitHub 설정 접속**: GitHub 웹사이트 우측 상단의 프로필 사진을 클릭하고 `Settings`로 이동합니다.
2.  **Developer settings**: 왼쪽 메뉴 하단의 `Developer settings`를 클릭합니다.
3.  **Personal access tokens**: `Personal access tokens` > `Tokens (classic)`으로 이동하여 `Generate new token` 버튼을 클릭합니다.
4.  **토큰 설정**:
    *   **Note**: 토큰의 용도를 식별할 수 있는 이름을 입력합니다. (예: `My-Laptop-CLI`)
    *   **Expiration**: 토큰의 유효 기간을 설정합니다. (보안을 위해 주기적으로 갱신하는 것이 좋습니다.)
    *   **Scopes**: 토큰에 부여할 권한을 선택합니다. Git 작업을 위해서는 최소한 `repo` 스코프를 선택해야 합니다.
5.  **토큰 생성 및 저장**: `Generate token` 버튼을 클릭하면 토큰이 생성됩니다. **이 토큰은 다시 볼 수 없으므로, 즉시 안전한 곳에 복사하여 보관해야 합니다.**

### Git 작업 시 토큰 사용

`git push`, `git pull` 등 원격 저장소와 통신하는 명령어를 실행할 때, 비밀번호를 묻는 프롬프트가 나타나면 생성한 개인용 액세스 토큰을 입력합니다.

## Git `config` 파일을 이용한 사용자 정보 설정

Git은 커밋을 할 때마다 해당 변경사항을 누가 만들었는지 기록합니다. 따라서 Git을 사용하기 전에 사용자 이름과 이메일 주소를 설정해야 합니다.

```bash
# Git 사용자 이름 설정
git config --global user.name "Your Name"

# Git 사용자 이메일 설정
git config --global user.email "your.email@example.com"
```

*   `--global` 옵션: 현재 시스템의 모든 Git 저장소에 해당 설정을 적용합니다.
*   특정 프로젝트에만 다른 정보를 사용하고 싶다면, 해당 프로젝트 디렉터리에서 `--global` 옵션을 빼고 명령을 실행하면 됩니다.

설정된 정보는 다음 명령어로 확인할 수 있습니다.

```bash
# 설정된 사용자 이름 확인
git config user.name

# 설정된 사용자 이메일 확인
git config user.email
```
