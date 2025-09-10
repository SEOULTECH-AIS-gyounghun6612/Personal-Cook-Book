# Git Submodule 등록 및 갱신

## Git Submodule이란?

Git Submodule은 하나의 Git 저장소 안에 다른 Git 저장소를 포함시킬 수 있는 기능입니다. 이를 통해 여러 프로젝트에서 공통으로 사용되는 라이브러리나 모듈을 효율적으로 관리할 수 있습니다.

## Submodule 등록

`git submodule add` 명령어를 사용하여 특정 저장소를 현재 프로젝트의 서브모듈로 추가합니다. 서브모듈은 지정된 하위 디렉터리에 위치하게 됩니다.

```bash
# 서브모듈 추가
# git submodule add <저장소_URL> <경로>

git submodule add https://github.com/example/my-library.git libs/my-library
```

이 명령을 실행하면 다음과 같은 변경사항이 발생합니다.

1.  `.gitmodules` 파일이 생성되거나 업데이트됩니다. 이 파일은 서브모듈의 정보를 담고 있습니다.
2.  지정된 경로에 서브모듈 저장소가 클론됩니다.
3.  상위 프로젝트의 `staging area`에 서브모듈 정보가 추가됩니다.

## Submodule 초기화 및 업데이트

상위 프로젝트를 클론했을 때, 기본적으로 서브모듈 디렉터리는 비어있습니다. 다음 명령어를 통해 서브모듈을 초기화하고 코드를 가져와야 합니다.

```bash
# 1. 서브모듈 초기화 ( .gitmodules 파일을 기반으로 로컬 설정 초기화 )
git submodule init

# 2. 서브모듈의 코드를 가져오고 특정 커밋으로 체크아웃
git submodule update
```

`--init`과 `--recursive` 옵션을 사용하면 상위 프로젝트 클론 시 한 번에 서브모듈까지 가져올 수 있습니다.

```bash
# 프로젝트 클론 시 모든 서브모듈을 재귀적으로 초기화하고 업데이트
git clone --recursive <상위_프로젝트_URL>
```

## Submodule 업데이트

서브모듈 자체의 내용이 원격 저장소에서 변경되었을 때, 이를 로컬 서브모듈에 반영하려면 다음 단계를 따릅니다.

1.  **서브모듈 디렉터리로 이동**

    ```bash
    cd <서브모듈_경로>
    ```

2.  **서브모듈 내에서 `git pull` 실행**

    ```bash
    # 서브모듈의 최신 변경사항 가져오기
    git pull origin master  # 또는 main
    ```

3.  **상위 프로젝트로 돌아와 변경사항 커밋**

    ```bash
    cd ..
    git add <서브모듈_경로>
    git commit -m "Update submodule to latest version"
    ```

또는 상위 프로젝트에서 `submodule update` 명령에 `--remote` 옵션을 사용하여 한 번에 업데이트할 수도 있습니다.

```bash
# 각 서브모듈의 원격 저장소 최신 버전을 가져오도록 업데이트
git submodule update --remote
```

## 특정 브랜치를 서브모듈로 추가하기 (활용)

기본적으로 서브모듈은 원격 저장소의 `master` 또는 `main` 브랜치를 추적합니다. 하지만 `-b` (또는 `--branch`) 옵션을 사용하면, 라이브러리의 특정 기능 브랜치(feature branch)만을 가져와서 현재 프로젝트에서 테스트하거나 통합할 수 있습니다.

```bash
# 'my-library' 저장소의 'feature/new-api' 브랜치를 서브모듈로 추가
git submodule add -b feature/new-api https://github.com/example/my-library.git libs/new-api-feature
```

이렇게 추가된 서브모듈은 `.gitmodules` 파일에 `branch` 정보가 기록되며, `git submodule update --remote` 명령 실행 시 지정된 브랜치의 최신 커밋을 추적하게 됩니다. 이는 아직 메인 브랜치에 병합되지 않은 새로운 기능을 미리 테스트하는 등 유연한 의존성 관리를 가능하게 합니다.
