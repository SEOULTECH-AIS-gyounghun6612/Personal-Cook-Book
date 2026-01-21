# 가상환경 가이드 (Virtual Environment)

이 문서는 연구 및 프로젝트 진행 시 필요한 가상환경의 개념과 주요 도구인 Anaconda와 Docker의 사용법을 제시함.

## 1. 개발 환경과 가상화 (Environment & Virtualization)

소프트웨어 개발 시 '환경'의 의미와 발생 가능한 문제, 그리고 이를 해결하기 위한 가상환경의 도입 배경.

### 개발 환경의 이해

* `정의 (Definition)`: 코드 실행을 위해 필요한 OS, 언어 런타임, 라이브러리 버전, 환경 변수 등 모든 의존성(Dependencies)의 집합.
* `문제점 (Issues)`:

  * 의존성 충돌 (Dependency Conflict): 프로젝트 A는 라이브러리 v1.0을, 프로젝트 B는 v2.0을 필요로 할 때 단일 시스템에서는 공존 불가.

  * 환경 오염 (Pollution): 전역(System) 공간에 패키지를 무분별하게 설치할 경우 시스템 불안정 및 관리 불가능 상태 초래.

### 가상환경 (Virtual Environment)

* `해결책 (Solution)`: 프로젝트별로 물리적/논리적으로 완벽히 격리된 독립 공간(Sandbox)을 생성하여 운용.
* `효과 (Benefits)`:

  * 격리성 (Isolation): 각 프로젝트가 서로 간섭 없이 독립적인 패키지 버전을 유지.

  * 재현성 (Reproducibility): 언제 어디서든 동일한 환경을 똑같이 구축하여 "내 컴퓨터에서는 되는데..." 문제 해결.

---

## 2. Python 가상환경: Conda (Anaconda)

Python 데이터 과학 및 머신러닝 분야에서 표준적으로 사용되는 패키지 매니저 겸 가상환경 도구. 연구 환경 구성에 최적화됨.

### Conda 설치 및 기본 사용

* [Conda 설치](./anaconda/install/01_install_and_path.md): Anaconda/Miniconda 설치 및 경로(`PATH`) 설정

* [가상환경 관리](./anaconda/environment/01_env_management.md): 가상환경 생성(`create`), 활성화(`activate`) 및 삭제(`remove`)

* [패키지 관리](./anaconda/environment/03.package_management.md): 패키지 설치(`install`), 조회(`list`) 및 관리

### 심화 기능

* [환경 변수 관리](./anaconda/environment/02_variable_management.md): Conda 자동화 스크립트를 활용한 환경 변수 설정 및 관리

---

## 3. 컨테이너 가상화: Docker

애플리케이션을 컨테이너라는 격리된 환경에서 패키징하고 실행하는 플랫폼. 엄격한 환경 구분과 배포에 유리함.

### Docker 가이드

* [Docker 사용 가이드 바로가기](./docker/README.md)
  * Docker의 개념 및 설치
  * 이미지(Image) 빌드 및 관리
  * 컨테이너(Container) 운용 및 워크플로우
