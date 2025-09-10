# 원격 저장소(Remote Repository) 연결

로컬 저장소에서 작업한 내용을 GitHub와 같은 원격 서버에 공유하거나, 다른 사람들과 협업하기 위해서는 로컬 저장소와 원격 저장소를 연결해야 합니다.

## 원격 저장소 주소 추가

`git remote add` 명령어를 사용하여 로컬 저장소에 원격 저장소의 주소를 등록할 수 있습니다. 일반적으로 원격 저장소의 기본 이름은 `origin`을 사용합니다.

1.  **GitHub에서 원격 저장소 생성**: 먼저 GitHub에서 새로운 저장소를 생성합니다.
2.  **원격 저장소 주소 복사**: 생성된 저장소 페이지에서 HTTPS 또는 SSH 주소를 복사합니다.
3.  **로컬 저장소에 원격 주소 추가**:

    ```bash
    # git remote add <원격_저장소_이름> <원격_저장소_URL>

    # 예시 (HTTPS 방식)
    git remote add origin https://github.com/user/my-project.git
    ```

## 연결된 원격 저장소 확인

`git remote -v` 명령어를 사용하면 현재 로컬 저장소에 연결된 모든 원격 저장소의 목록과 주소를 확인할 수 있습니다.

```bash
# 연결된 원격 저장소 목록 확인
git remote -v

# 출력 예시
# origin  https://github.com/user/my-project.git (fetch)
# origin  https://github.com/user/my-project.git (push)
```

## 원격 저장소 주소 변경 및 삭제

### 주소 변경

원격 저장소의 URL이 변경되었을 경우, `set-url` 명령어를 사용하여 주소를 업데이트할 수 있습니다.

```bash
# git remote set-url <원격_저장소_이름> <새_URL>

git remote set-url origin https://github.com/new-user/my-project.git
```

### 연결 삭제

더 이상 필요 없는 원격 저장소 연결은 `remove` (또는 `rm`) 명령어로 삭제할 수 있습니다.

```bash
# git remote remove <원격_저장소_이름>

git remote remove origin
```
