# 참고문헌 처리 (Bibliography) 가이드

이 문서는 LaTeX에서 인용(Citation)과 참고문헌(References) 목록을 체계적으로 관리하는 방법을 설명함.

## 1. 데이터베이스 구축 (.bib 파일)

참고문헌 정보를 `.bib`라는 별도의 텍스트 파일에 BibTeX 형식으로 저장함. 직접 작성하기보다는 Google Scholar나 Zotero 등에서 `BibTeX` 내보내기 기능을 사용하는 것이 효율적임.

### BibTeX 항목 예시
```bibtex
@article{vaswani2017attention,
  title={Attention is all you need},
  author={Vaswani, Ashish and Shazeer, Noam and Parmar, Niki and Uszkoreit, Jakob and Jones, Llion and Gomez, Aidan N and Kaiser, {\L}ukasz and Polosukhin, Illia},
  journal={Advances in neural information processing systems},
  volume={30},
  year={2017}
}
```

*   `@article`: 자료 유형 (article, book, inproceedings 등).
*   `vaswani2017attention`: 인용 키(Citation Key). 본문에서 이 논문을 가리킬 때 사용하는 고유 식별자.

## 2. 본문 인용 (Citing)

본문 작성 중 해당 문헌을 언급해야 할 위치에 `\cite` 명령어를 사용함.

```latex
Transformer 모델은 자연어 처리 분야에 혁신을 가져왔다 \cite{vaswani2017attention}.
```

*   컴파일 시 `[1]` 또는 `(Vaswani et al., 2017)` 등으로 스타일에 맞춰 자동 변환됨.

## 3. 스타일 적용 및 출력

문서의 끝부분(주로 `\end{document}` 직전)에 참고문헌 리스트를 출력하도록 설정함.

### 기본 BibTeX 방식
```latex
\bibliographystyle{IEEEtran} % 스타일 지정 (예: IEEEtran, plain, acm 등)
\bibliography{ref}           % .bib 파일 이름 (확장자 제외)
```

### BibLaTeX 방식 (권장)
최신 방식인 BibLaTeX 패키지를 사용하면 더 다양한 커스터마이징이 가능함.

**Preamble 영역:**
```latex
\usepackage[style=ieee, backend=biber]{biblatex}
\addbibresource{ref.bib} % .bib 파일 경로 (확장자 포함)
```

**본문 영역 (출력 위치):**
```latex
\printbibliography
```

## 4. 컴파일 과정

참고문헌 처리는 상호 참조(Cross-referencing) 업데이트를 위해 여러 번의 컴파일이 필요함. `latexmk`를 사용하면 이 과정을 자동으로 처리해 줌.

1.  `LaTeX` 실행 (본문 처리, 인용 키 확인)
2.  `Biber` 또는 `BibTeX` 실행 (.bib 파일에서 정보 추출 및 정렬)
3.  `LaTeX` 실행 (참고문헌 목록 생성)
4.  `LaTeX` 실행 (본문의 인용 번호/연도 최종 확정)
