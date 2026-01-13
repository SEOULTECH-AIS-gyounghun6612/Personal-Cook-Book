# 문서 작성 (Authoring) 가이드

분할 작성 -> 관리 효율을 위해 본문(`.tex`)과 스타일(`.sty`) 파일을 기능별로 분리하고 `main.tex`에서 통합 관리

## 1. 파일 구조 예시 및 역할

```text
root/
├── main.tex       (문서의 뼈대)
├── my_style.sty   (커스텀 스타일 정의)
├── references.bib (참고문헌 데이터베이스)
├── source/        (삽입 데이터)
│   └── model_image.png
└── sections/      (본문 내용 폴더)
    ├── 01_intro.tex
    ├── 02_method.tex
    └── 03_exp.tex
```

```latex
% main.tex

\documentclass{article}
\usepackage{my_style} % 분리된 스타일 파일 로드

\begin{document}
    % 각 파일은 preamble 없이 내용만 작성함
    \input{sections/01_intro}
    \input{sections/02_method}
    \input{sections/03_exp}
\end{document}
```

- `main.tex`: 문서의 최상위 파일. Preamble 설정(`.sty` 로드 등)과 챕터 파일(`sections/*.tex`) 통합을 담당.
- `.sty` (Style File): 반복되는 Preamble 설정이나 커스텀 명령어를 별도로 분리한 파일.
  - 예시: 교내 학위 논문 -> seoultech.sty, 학회별 포맷 -> ieee..sty, nips_2025.sty
- `.bib` (BibTeX): 참고문헌 데이터를 저장하는 데이터베이스 파일.
- `sections/*.tex`: 서론, 본론 등 실제 원고 내용을 담은 분할 파일.

## 2. 문서 정의 (Preamble)

문서의 뼈대를 구축하는 단계. Word의 '페이지 설정' 및 '스타일' 메뉴를 코드로 명시하는 과정.

- `범위` : 문서 시작(`\begin{document}`) 이전

- `역할`: 문서 종류(`\documentclass`) 선언 및 패키지(`\usepackage`) 로드.

  - [문서 정의 가이드](./01_preamble.md)

## 3. 본문 작성 (Authoring)

디자인(서식)보다 논리적 구조와 콘텐츠에 집중하여 내용을 작성하는 단계.

- `범위` : 문서 시작(`\begin{document}`) 이후

- `구조화`: `\section`, `\subsection` 등의 명령어로 문서의 목차와 구조를 형상화.

- `내용 관리`: `\input` 명령어를 활용한 챕터별 파일 분리 관리 권장.

- `요소 삽입`: 수식, 표, 그림 등을 해당 환경(`\begin{...}`) 내에 작성.

  - [본문 작성 가이드](./02_authoring.md)

## 4. 참고문헌 처리 (Bibliography)

인용 정보를 체계적으로 관리하고 본문에 삽입하는 단계.

- `데이터베이스`: `.bib` 파일에 서지 정보를 BibTeX 형식으로 저장.

- `자동화`: `\cite{key}` 인용 시 지정된 스타일에 맞춰 목록 자동 생성.

- `도구`: Biber 등의 처리기 활용.

  - [참고문헌 처리 가이드](./03_bibliography.md)
