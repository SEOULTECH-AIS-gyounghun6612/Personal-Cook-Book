# Git & GitHub 사용법

이 문서는 Git과 GitHub의 핵심 개념부터 기본 명령어, 원격 저장소 연동, 그리고 서브모듈 활용까지 전반적인 사용법을 다룹니다.

## 목차

### 1. Git 기본 사용법

Git을 로컬 환경에서 사용하는 기본적인 방법을 안내합니다.

*   [[Git/GitHub 기본 개념]](./base/00_definition.md): Git과 GitHub, 저장소(Repository), 브랜치(Branch)의 기본 개념을 설명합니다.
*   [[브랜치(Branch) 관리]](./base/01_branch.md): 브랜치를 생성, 확인, 이동하는 방법을 다룹니다.
*   [[커밋(Commit) 관리]](./base/02_commit.md): 저장소 초기화, 변경사항 커밋, 커밋 취소 및 기록 확인 방법을 안내합니다.

### 2. GitHub 연동

로컬 저장소의 작업을 GitHub 원격 저장소와 동기화하고 협업하는 방법을 설명합니다.

*   [[원격 저장소 연동을 위한 사전 준비]](./github/00_preparation.md): GitHub 개인용 액세스 토큰(PAT) 발급 및 Git 사용자 정보 설정 방법을 안내합니다.
*   [[원격 저장소(Remote Repository) 연결]](./github/01_remote_connection.md): 로컬 저장소에 원격 저장소 주소를 추가, 확인, 변경, 삭제하는 방법을 다룹니다.
*   [[Push & Pull 명령어]](./github/02_push_and_pull.md): 로컬과 원격 저장소 간의 변경사항을 `push`하고 `pull`하는 방법을 설명합니다.

### 3. Git Submodule 활용

하나의 Git 프로젝트 내에서 다른 프로젝트를 효율적으로 관리하는 서브모듈 기능에 대해 설명합니다.

*   [[Git Submodule 등록 및 갱신]](./submodule/00_add_and_update.md): 서브모듈을 추가하고 최신 상태로 업데이트하는 방법을 안내합니다.
*   [[Git Submodule 제거]](./submodule/01_remove.md): 프로젝트에서 서브모듈을 완전히 제거하는 절차를 설명합니다.