# Git & GitHub 사용 가이드

이 문서는 Git과 GitHub의 핵심 개념부터 기본 명령어, 원격 저장소 연동, 그리고 서브모듈 활용까지 전반적인 사용법을 다룹니다.

## 1. Git 기본 (Basics)

Git은 파일의 변경 이력을 '스냅샷' 형태로 저장하여 추적하는 분산 버전 관리 시스템(DVCS)입니다.

### 핵심 개념 (작업 순서)

1. `Repository (저장소)`: 프로젝트의 모든 파일과 변경 이력이 담긴 작업 공간입니다. (`.git` 폴더)
    * [저장소(Repository) 관리 가이드](./basics/00_repository.md): 저장소 생성(`init`), 파일 추적 상태 관리 및 무시 설정(`ignore`).

2. `Change (변경)`: 파일을 생성, 수정, 삭제하는 실제 코딩 작업입니다. (Modified 상태)

3. `Stage (스테이지)`: 수많은 변경 사항 중, 커밋으로 남길 파일만 골라 담는 임시 전송 영역입니다. (Staged 상태, `git add`)

4. `Commit (커밋)`: 스테이지에 담긴 내용을 확정하여 영구적인 버전으로 저장하는 행위입니다. (`git commit`)
    * [스테이지 작업과 커밋(Commit) 관리 가이드](./basics/01_commit.md): 변경사항 스테이징(`add`), 커밋(`commit`) 및 이력 수정(`rebase`).

5. `Branch (브랜치)`: 메인 코드에 영향을 주지 않고 안전하게 작업하기 위해 작업 공간을 분리하는 기능입니다.
    * [브랜치(Branch) 관리 가이드](./basics/02_branch.md): 브랜치 생성 및 병합 전략.

---

## 2. GitHub 연동 (Remote)

GitHub는 Git 저장소를 클라우드에 호스팅하여 협업을 돕는 웹 플랫폼입니다.

### 핵심 개념

* Remote Repository (원격 저장소): GitHub 서버에 위치한 공유 저장소입니다. 팀원 간의 협업 중심축 역할을 합니다.

* Push & Pull: 로컬 저장소의 변경사항을 원격으로 업로드(`push`)하거나, 원격의 내용을 로컬로 가져오는(`pull`) 동기화 작업입니다.

* [사전 준비 (Token & Config)](./github/00_preparation.md): GitHub 액세스 토큰(PAT) 발급 및 Git 사용자 정보 설정.

* [원격 저장소 관리](./github/01_remote.md): 저장소 연결(`remote`), 업로드(`push`), 내려받기(`pull`) 및 정리(`fetch`/`prune`) 방법.

---

## 3. Git Submodule (Advanced)

하나의 Git 프로젝트 하위에 또 다른 Git 프로젝트를 디렉터리 형태로 포함시켜 관리하는 기능입니다. 라이브러리나 공통 모듈 관리에 유용합니다.

* [Git Submodule 관리](./advanced/00_submodule.md): 서브모듈 추가, 갱신 및 제거.
