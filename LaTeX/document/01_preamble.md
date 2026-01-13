# 문서 정의 (Preamble) 가이드

이 문서는 문서의 성격을 규정하고 필요한 기능을 불러오는 전언(Preamble) 단계의 핵심 요소를 설명함.

## 0. 전언(Preamble)의 역할

HTML의 `<head>` 태그와 유사하게, 문서의 전반적인 스타일, 사용할 폰트, 추가 기능(패키지) 등을 정의하는 공간임. `\documentclass`부터 `\begin{document}` 직전까지가 이에 해당함.

---

## 1. 문서 클래스 선언 (Document Class)

문서의 가장 첫 줄에 위치하며, 문서의 종류(논문, 책, 보고서 등)를 결정함.

```latex
% 기본 문법
\documentclass[옵션]{클래스이름}

% 예시: A4 용지, 10pt 글자 크기의 article 클래스 사용
\documentclass[a4paper, 10pt]{article}
```

* `주요 클래스`:
  * `article`: 논문, 짧은 보고서용 (가장 보편적).
  * `report`: 챕터(Chapter) 구분이 있는 긴 보고서나 학위 논문용.
  * `book`: 출판을 목적으로 하는 서적용.
  * `beamer`: 프레젠테이션 슬라이드용.

## 2. 패키지 로드 (Package)

기본 LaTeX 기능 외에 수식, 이미지, 표, 한글 지원 등의 확장 기능을 사용하기 위해 라이브러리를 불러옴.

```latex
% 기본 문법
\usepackage[옵션]{패키지이름}

% 필수/자주 사용되는 패키지 예시
\usepackage{kotex}     % 한글 사용 지원
\usepackage{graphicx}  % 이미지 삽입 기능
\usepackage{amsmath}   % 고급 수식 기능
\usepackage{geometry}  % 여백 설정
```

## 3. 커스텀 스타일 파일 (.sty)

반복되는 전언 설정이나 사용자 정의 명령어를 별도의 파일로 분리하여 관리함. `main.tex`를 간결하게 유지하고 설정을 재사용하기 위해 사용함.

```latex
% main.tex에서의 호출
\usepackage{my_style}  % my_style.sty 파일을 불러옴 (확장자 생략)
```

* `장점`:
  * **가독성**: `main.tex`에 수십 줄의 패키지 설정이 나열되는 것을 방지.
  * **일관성**: 팀 프로젝트나 여러 문서에서 동일한 스타일을 쉽게 공유.
  * **표준화**: 학회 포맷(예: `IEEEtran.sty`)이나 학위 논문 양식 적용이 용이함.

### 스타일 파일 작성 예시 (my_style.sty)

스타일 파일은 일반적인 TeX 명령어들을 모아둔 텍스트 파일임. 파일의 시작 부분에 패키지 이름을 선언해야 함.

```latex
% 1. 패키지 선언 (파일 이름과 동일해야 함)
\ProvidesPackage{my_style}

% 2. 공통 패키지 로드 -> 스타일 파일 내에서는 `\usepackage` 대신 `\RequirePackage`를 사용하는 것이 관례임.
\RequirePackage{kotex}
\RequirePackage{geometry}
\RequirePackage{xcolor}

% 3. 전역 설정 (예: 여백)
\geometry{
  left=20mm, right=20mm, top=25mm, bottom=25mm
}

% 4. 사용자 정의 명령어 추가
% 사용법: \important{강조할 내용} -> 빨간색 볼드체로 출력
\newcommand{\important}[1]{\textcolor{red}{\textbf{#1}}}
```
