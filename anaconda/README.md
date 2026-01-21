# Anaconda 사용 가이드

이 문서는 Python 기반 데이터 과학 및 머신러닝 연구를 위한 Anaconda(Conda)의 설치, 가상환경 운용, 그리고 패키지 관리 방법을 제시함.

## 1. 설치 및 설정 (Installation & Setup)

Conda 환경을 구축하기 위한 초기 단계.

* [설치 및 경로 설정](./install/01_install_and_path.md): Anaconda/Miniconda 다운로드, 설치 및 시스템 경로(`PATH`) 설정

---

## 2. 가상환경 관리 (Environment)

프로젝트별로 격리된 작업 공간을 생성하고 관리하는 방법.

### 기본 운용

* [가상환경 생성과 관리](./environment/01_env_management.md): 환경 생성(`create`), 조회(`info`), 활성화(`activate`) 및 삭제(`remove`)

### 심화 운용

* [환경 변수 자동화](./environment/02_variable_management.md): 가상환경 활성화/비활성화 시 특정 스크립트(환경 변수 등) 자동 실행 설정

---

## 3. 패키지 관리 (Package)

가상환경 내부의 라이브러리 및 의존성 관리.

* [패키지 설치와 관리](./environment/03.package_management.md): 패키지 검색(`search`), 설치(`install`), 갱신(`update`) 및 삭제(`remove`)
