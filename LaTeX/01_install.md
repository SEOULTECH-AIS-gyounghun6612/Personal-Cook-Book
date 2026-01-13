# LaTeX 설치 및 환경 설정

* `TeX Live 공식 홈페이지`: [https://www.tug.org/texlive/](https://www.tug.org/texlive/)

논문 작성을 위한 고품질 조판 시스템인 LaTeX의 설치 및 편집 환경 설정 가이드

## 0. 각 프로그램의 역할

LaTeX 환경은 워드프로세서와 달리 `문서 생성 엔진`과 `편집 도구`가 분리되어 있음. 따라서 아래 두 가지를 모두 설치

1. `TeX Live`: 문서를 해석하고 PDF를 생성하는 핵심 엔진 (컴파일러, 패키지, 폰트 포함).

2. `편집 도구 (VS Code)`: 코드를 작성하고 엔진을 제어하는 작업 도구.

---

## 1. TeX Live 설치

OS별로 가장 안정적이고 널리 쓰이는 TeX Live 설치를 권장함.

### Ubuntu (Linux)

터미널에서 전체 패키지 설치 진행.

```bash
# 패키지 리스트 업데이트
sudo apt update

# TeX Live 전체 설치 (약 5GB+ 소요)
sudo apt install texlive-full
```

### Windows

네트워크 설치 프로그램을 이용한 설치 진행.

1. [다운로드 페이지](https://www.tug.org/texlive/acquire-netinstall.html)에서 `install-tl-windows.exe` 다운로드.

2. 파일 실행 후 'Install' 선택 (모든 사용자를 위해 관리자 권한으로 실행 권장).

3. 설치 경로 확인 후 'Install' 클릭 (시간이 다소 소요됨).

### macOS

* 준비 중 (MacTeX 설치 가이드 추가 예정).

## 2. 편집 환경 설정 (VS Code)

효율적인 작성을 위해 VS Code와 `LaTeX Workshop` 확장 프로그램 사용을 권장함.

### 필수 확장 프로그램

* `설치`: VS Code 마켓플레이스에서 `LaTeX Workshop` 검색 후 설치.

* `기능`: 자동 빌드(Save on build), PDF 미리보기, 인텔리센스 지원.
