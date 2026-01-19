# 알고리즘 (Algorithms)

논문에서 의사코드(Pseudocode)를 작성할 때 사용함. 가장 널리 쓰이는 `algorithm`과 `algpseudocode` 패키지 조합을 기준으로 설명함.

> `필수 패키지 (Preamble)`
>
> ```latex
> \usepackage{algorithm}
> \usepackage{algpseudocode}
> ```

## 1. 기본 구조

`algorithm` 환경은 그림/표와 같은 `부동 객체(Float)` 역할을 하며, `algorithmic` 환경 내부에 실제 코드를 작성함.

```latex
\begin{algorithm}[ht]
\caption{제안하는 알고리즘의 이름}
\label{alg:proposed_method}
\begin{algorithmic}[1] % [1]은 줄 번호를 표시함
    \Procedure{MyProcedure}{$x, y$}
        \State $z \gets x + y$ \Comment{변수 초기화}
        \If{$z > 0$}
            \State \Return $z$
        \Else
            \State \Return $0$
        \EndIf
    \EndProcedure
\end{algorithmic}
\end{algorithm}
```

## 2. 주요 명령어

| 명령어 | 설명 |
| :--- | :--- |
| `\State` | 알고리즘의 한 줄(문장)을 시작 |
| `\Comment{...}` | 코드 우측에 주석 추가 |
| `\If{...} \Else \EndIf` | 조건문 |
| `\For{... \To ...} \EndFor` | 반복문 (For) |
| `\While{...} \EndWhile` | 반복문 (While) |
| `\Inputs`, `\Outputs` | 입력/출력 정의 (사용자 정의 필요할 수 있음) |

## 3. 팁 (Tips)

### 1) 들여쓰기 가이드라인

LaTeX 알고리즘은 수동으로 들여쓰기를 조절할 필요 없이 `\If`, `\For` 등의 블록 구조에 따라 자동으로 들여쓰기가 적용됨.

### 2) 수식 및 기호 입력

알고리즘의 변수 할당, 비교, 수학 연산 등은 모두 `수식 모드(`$ ... $`)`를 사용함. 의사코드에서 자주 쓰이는 전용 기호들이 있음.

* `할당(Assignment):` `\gets` ($\gets$)를 주로 사용함.
* `비교:` `\le` ($\le$), `\ge` ($\ge$), `\neq` ($\neq$) 등.
* `수학 함수:` `\exp`, `\log`, `\sqrt{...}` 등 일반 수식 명령어 그대로 사용 가능.

> 예: `\State $v_{i} \gets \sqrt{x^2 + y^2}$ \Comment{L2 Norm 계산}`

### 3) 텍스트 입력

알고리즘 내부(`\State` 등)에서 한글이나 영문 설명을 직접 적고 싶다면 `\text{...}`를 사용하여 수식 폰트가 적용되지 않게 함.
> 예: `\State $x \gets \text{입력 이미지의 너비}$`
