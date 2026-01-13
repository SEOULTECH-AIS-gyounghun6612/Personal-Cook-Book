# 본문 작성 (Authoring) 가이드

이 문서는 `\begin{document}`와 `\end{document}` 사이에서 실제 논문의 내용을 작성하는 방법과 논리적 구조화 기법을 설명함.

## 1. 문서 구조화 (Structure)

LaTeX는 위지윅(WYSIWYG) 방식이 아닌 논리적 구조 기반 작성을 지향함.

### 섹션 명령
문서의 목차(Hierarchy)를 구성함. 자동으로 번호가 매겨짐.

```latex
\section{서론}       % 1. 서론
\subsection{연구 배경} % 1.1 연구 배경
\subsubsection{기존 연구} % 1.1.1 기존 연구 (클래스에 따라 지원 여부 다름)
```

### 상호 참조 (Cross-referencing)
"그림 1을 참조하시오"와 같이 특정 요소를 가리킬 때, 하드코딩하지 않고 `label`과 `ref`를 사용함. 번호가 바뀌어도 자동 갱신됨.

```latex
\section{실험 결과} \label{sec:result}

... 앞서 \ref{sec:result}절에서 언급한 바와 같이 ...
```

## 2. 주요 요소 작성 (Elements)

### 수식 (Mathematics)
*   `인라인 수식`: 문장 중간에 삽입 (`$ ... $`).
*   `독립 수식`: 별도 줄에 작성 및 번호 매기기 (`equation` 환경).

```latex
피타고라스 정리는 $a^2 + b^2 = c^2$이다.

\begin{equation}
    E = mc^2 \label{eq:energy}
\end{equation}
```

### 그림 (Figures)
`figure` 환경은 페이지 내에서 위치가 유동적인 '부동 개체(Float)'임. `[ht]` 옵션 등으로 위치 힌트를 줌.

```latex
\begin{figure}[ht] % h: here, t: top
    \centering
    \includegraphics[width=0.8\linewidth]{fig/graph.png}
    \caption{제안하는 알고리즘 성능 비교}
    \label{fig:performance}
\end{figure}
```

### 표 (Tables)
기본적인 표 작성은 복잡하므로, [Table Generator](https://www.tablesgenerator.com/) 같은 도구를 활용하여 코드를 생성한 후 붙여넣는 것을 권장함.
