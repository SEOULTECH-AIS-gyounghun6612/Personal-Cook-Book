# 그림 (Figures)

`figure` 환경은 페이지 내에서 위치가 유동적인 '부동 개체(Float)'임. `[ht]` 옵션 등으로 위치 힌트를 줌.

## 단일 그림

```latex
\begin{figure}[ht] % h: here, t: top
    \centering
    \includegraphics[width=0.8\linewidth]{fig/graph.png}
    \caption{제안하는 알고리즘 성능 비교}
    \label{fig:performance}
\end{figure}
```

## 다중 그림 배열 (Minipage)

별도의 패키지(`subcaption` 등) 설치 없이 가장 호환성이 높은 방법은 `minipage` 환경을 사용하여 가로 공간을 분할하는 것임. 학회 템플릿 등과의 충돌 걱정 없이 사용할 수 있음.

### 1) 각 그림에 별도 번호 매기기

각 `minipage` 안에 `\caption`을 넣으면 "그림 1", "그림 2"와 같이 개별 번호가 부여됨.

```latex
\begin{figure}[ht]
    \centering
    \begin{minipage}{0.45\textwidth}
        \centering
        \includegraphics[width=\textwidth]{fig/image1.png}
        \caption{첫 번째 그림의 캡션}
        \label{fig:image1}
    \end{minipage}
    \hfill % 이미지 사이 간격 최대화
    \begin{minipage}{0.45\textwidth}
        \centering
        \includegraphics[width=\textwidth]{fig/image2.png}
        \caption{두 번째 그림의 캡션}
        \label{fig:image2}
    \end{minipage}
\end{figure}
```

### 2) 이미지와 하위 캡션 줄(Row) 분리하기 (Grid Layout)

이미지와 텍스트((a), (b)...)를 같은 `minipage`에 넣지 않고, `이미지 줄`과 `텍스트 줄`을 별도의 `minipage` 그룹으로 나누어 작성하면 정렬이 훨씬 깔끔함.

```latex
\begin{figure}[htbp]
    \centering
   
    % [첫 번째 줄] 이미지 배열
    \begin{minipage}[b]{0.3\textwidth}
        \centering
        \includegraphics[width=\linewidth]{fig/step_1.png}
    \end{minipage}
    \hspace{0.03\textwidth} % 간격 조절
    \begin{minipage}[b]{0.3\textwidth}
        \centering
        \includegraphics[width=\linewidth]{fig/step_2.png}
    \end{minipage}
    \hspace{0.03\textwidth}
    \begin{minipage}[b]{0.3\textwidth}
        \centering
        \includegraphics[width=\linewidth]{fig/step_3.png}
    \end{minipage}

    \vspace{5pt} % 이미지와 텍스트 사이 간격

    % [두 번째 줄] 하위 캡션((a), (b)...) 배열
    \begin{minipage}[t]{0.3\textwidth}
        \centerline{(a) 초기 단계}
    \end{minipage}
    \hspace{0.03\textwidth}
    \begin{minipage}[t]{0.3\textwidth}
        \centerline{(b) 중간 단계}
    \end{minipage}
    \hspace{0.03\textwidth}
    \begin{minipage}[t]{0.3\textwidth}
        \centerline{(c) 최종 결과}
    \end{minipage}

    \caption{단계별 처리 과정: (a) 초기 (b) 중간 (c) 완료}
    \label{fig:process_steps}
\end{figure}
```
