# LaTeX 논문 작성 가이드

이 문서는 LaTeX 작업의 전체 흐름을 3단계로 나누어 설명함.

## 1. 환경 구축 (Setup)

LaTeX 작업을 시작하기 위해 로컬 컴퓨터에 필요한 도구를 설치함.

- `편집기`: 코드를 작성하고 편리하게 관리할 도구 (VS Code).

- `컴파일러`: 소스 코드를 읽어 실제 문서로 변환할 엔진 (TeX Live).

  - [저작 도구 설치 가이드](./01_install.md)

## 2. 문서 작성 (Authoring)

문서 구조화, 정의(Preamble), 본문 작성, 참고문헌 처리에 대한 상세 가이드.

- [문서 작성 가이드](./document/README.md)

## 3. 컴파일 및 확인 (Build & Review)

작성한 소스 코드를 최종 결과물(PDF)로 변환하고 검토하는 단계.

- `컴파일`: `latexmk`를 사용하여 참조 연결 및 PDF 생성 자동화.

- `디버깅`: 로그(`.log`) 확인을 통한 문법 에러 및 레이아웃 수정.

  - [컴파일 및 확인 가이드](./03_build_review.md)

---

### [심화] 연구실 표준 템플릿 (LATTE)

기초 과정을 바탕으로 연구실 표준 템플릿을 활용하여 실전 논문을 작성함.

- [LATTE 템플릿 가이드](https://github.com/SEOULTECH-AIS/LaTeX_Assistant_Template_for_Thesis_Efficiency)
