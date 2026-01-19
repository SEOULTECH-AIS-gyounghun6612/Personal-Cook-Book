# 표 (Tables)

LaTeX에서 표 작성은 까다로운 편이지만, 구조를 이해하면 정교한 표를 만들 수 있음. 복잡한 표는 [Table Generator](https://www.tablesgenerator.com/) 사용을 권장하지만, 미세 조정을 위해 아래 문법을 알아두는 것이 좋음.

> `필수 패키지 (Preamble)`
>
> ```latex
> \usepackage{multirow}  % 행 병합 시 필요
> \usepackage{booktabs}  % 출판 품질의 표 디자인 (권장)
> ```

## 1. 기본 구조 (`tabular`)

`table` 환경은 부동 객체(Float)로서 표의 위치(`[ht]`)와 캡션을 담당하고, 실제 표의 모양은 `tabular` 환경에서 정의함.

```latex
\begin{table}[ht]
    \centering
    \caption{표의 제목}
    \label{tab:example}
    \begin{tabular}{l c r} % 열 정렬 정의 (Left, Center, Right)
        \hline             % 가로줄 긋기
        이름 & 나이 & 점수 \ % '&'로 열 구분, '\'로 줄 바꿈
        \hline
        홍길동 & 20 & 95 \ 
        이순신 & 45 & 100 \ 
        \hline
    \end{tabular}
\end{table}
```

### 열(Column) 정렬 옵션

`\begin{tabular}{...}` 중괄호 안에 각 열의 정렬 방식을 문자로 지정함.

* `l`: 왼쪽 정렬 (Left)
* `c`: 가운데 정렬 (Center)
* `r`: 오른쪽 정렬 (Right)
* `|`: 세로줄 긋기 (예: `|c|c|`)

## 2. 셀 병합 (Merge Cells)

### 열 병합 (`\multicolumn`)

여러 열(Column)을 하나로 합칠 때 사용. 별도 패키지 없이 사용 가능.

* 문법: `\multicolumn{합칠 개수}{정렬}{내용}`

```latex
% 2개 열을 합치고 가운데 정렬
\multicolumn{2}{c}{통합된 헤더}
```

### 행 병합 (`\multirow`)

여러 행(Row)을 하나로 합칠 때 사용. `\usepackage{multirow}` 필요.

* 문법: `\multirow{합칠 개수}{너비}{내용}` (너비에 `*` 쓰면 자동 조절)

```latex
% 3개 행을 합침
\multirow{3}{*}{통합 셀}
```

## 3. 전문적인 표 작성 (Professional Tables)

논문 품질의 표를 만들기 위해 `booktabs`, `tabularx`, `xcolor` 등의 패키지를 조합하여 사용함.

### 1) 디자인 표준 (`booktabs`)

세로줄을 없애고, 굵기가 다른 가로줄을 사용하여 가독성을 높임.

* `\toprule`: 표 최상단 굵은 줄
* `\midrule`: 헤더와 데이터 구분 줄
* `\bottomrule`: 표 최하단 굵은 줄

### 2) 너비 자동 맞춤 (`tabularx`)

표의 너비를 문서 너비(`\linewidth`)에 딱 맞추고 싶을 때 사용. `X` 컬럼이 남은 공간을 채우며 자동 줄바꿈됨.

* `X`: 왼쪽 정렬 + 자동 너비
* `Y`: 가운데 정렬 + 자동 너비 (커스텀) -> `\newcolumntype{Y}{>{\centering\arraybackslash}X}`
* `Z`: 오른쪽 정렬 + 자동 너비 (커스텀) -> `\newcolumntype{Z}{>{\raggedleft\arraybackslash}X}`

```latex
\begin{table}[ht]
    \centering
    \caption{주요 모델 성능 비교 분석}
    \label{tab:performance_comparison}
    \begin{tabularx}{\linewidth}{l Y Z} % 전체 너비를 문서 너비에 맞춤
        \toprule
        \textbf{Model} & \textbf{Description} & \textbf{Accuracy} \\
        \midrule
        Baseline & 기본적인 합성곱 신경망 구조를 사용한 모델 & 85.2\% \\
        \rowcolor{gray!10} % xcolor 활용 행 강조
        Proposed & 본 연구에서 제안하는 Attention 기반 모델 & \textbf{94.8\%} \\
        Comparison & 기존 SOTA(State-of-the-art) 모델 & 92.5\% \\
        \bottomrule
    \end{tabularx}
\end{table}
```

### 3) 특수 기능 (색상, 회전)

#### 행 색상 강조 (`xcolor`)

특정 행의 배경색을 지정하여 가독성을 높이거나 강조할 때 사용함.

```latex
\begin{tabular}{lc}
    \toprule
    \rowcolor{gray!20} % 이 행의 배경색을 옅은 회색으로 지정
    항목 이름 & 데이터 값 \\
    \midrule
    기본 데이터 1 & 100 \\
    \rowcolor{yellow!30} % 특정 행 강조
    중요 데이터 2 & 500 \\
    \bottomrule
\end{tabular}
```

#### 표 회전 (`sidewaystable`)

표가 가로로 너무 길어 일반적인 방법으로 배치가 불가능할 때, 페이지를 90도 회전시켜 배치함.

```latex
\begin{sidewaystable}
    \centering
    \caption{가로로 매우 긴 성능 비교 분석표}
    \label{tab:long_table}
    \begin{tabularx}{\linewidth}{l X X X X X} % tabularx와 조합 가능
        \toprule
        Model & Feature 1 & Feature 2 & Feature 3 & Feature 4 & Feature 5 \\
        \midrule
        Very Long Data & ... & ... & ... & ... & ... \\
        \bottomrule
    \end{tabularx}
\end{sidewaystable}
```

## 4. 팁 (Tips)

### 1) 표 강제 크기 조절 (`\resizebox`)

`tabularx`로도 해결되지 않는 초대형 표를 페이지 안에 억지로 구겨 넣을 때 사용. 단, `글자 크기가 작아지거나 비율이 깨질 수 있으므로 주의`.

```latex
\resizebox{\linewidth}{!}{ % 너비 맞춤, 높이 비율 유지(!)
    \begin{tabular}{...} ... \end{tabular}
}
```
