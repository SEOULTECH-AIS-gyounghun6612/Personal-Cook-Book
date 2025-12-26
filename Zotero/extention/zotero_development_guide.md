# Zotero 확장 기능 개발 가이드

이 가이드는 제공된 템플릿을 사용하여 Zotero 7용 확장 기능을 개발하는 전체 과정을 안내합니다.

---

## 1단계: 준비 (Prerequisites)

개발을 시작하기 전에 다음 요구 사항을 충족해야 합니다.

1. **Zotero 설치**:
    * [Zotero Beta 7.0](https://www.zotero.org/download/)에서 최신 버전을 설치합니다.
    * [Zotero Beta Builds](https://www.zotero.org/support/beta_builds)에서 최신 베타 버전을 설치합니다.

2. **Node.js 및 Git 설치**:
    * [Node.js](https://nodejs.org/en/) 최신 LTS 버전을 설치합니다.
    * [Git](https.git-scm.com/)을 설치합니다.

---

## 2단계: 초기 설정 (Initial Setup)

1. **템플릿으로 새 저장소 생성**:
    * GitHub의 템플릿 페이지에서 `Use this template` 버튼을 클릭하여 새 저장소(Repository)를 생성합니다.
    * 사용된 template은 windingwind이 게시한 [zotero-plugin-template](https://github.com/windingwind/zotero-plugin-template.git)을 사용합니다.
    * 생성된 저장소를 로컬 컴퓨터에 `git clone` 합니다.

2. **프로젝트 설정 (`package.json`)**:
    * `package.json` 파일을 열고 다음 항목들을 자신의 프로젝트에 맞게 수정합니다. 이 단계는 플러그인의 고유성을 결정하므로 매우 중요합니다.

    ```jsonc
    {
      "version": "0.0.0",
      "description": "플러그인에 대한 간략한 설명",
      "config": {
        "addonName": "플러그인 이름", // Zotero 부가 기능 관리자에 표시될 이름
        "addonID": "your-addon-id@example.com", // 다른 플러그인과 충돌하지 않을 고유 ID
        "addonRef": "your-addon-ref", // ID 접두사 등으로 사용될 참조 이름
        "addonInstance": "YourAddonInstance", // Zotero.${addonInstance} 형태로 접근될 루트 인스턴스
        "prefsPrefix": "extensions.zotero.your-addon-ref", // 환경설정(prefs) 접두사
      },
      "repository": {
        "url": "git+https://github.com/your-github-name/repo-name.git", // 자신의 저장소 URL
      },
      "author": "Your Name", // 제작자 이름
      "bugs": {
        "url": "https://github.com/your-github-name/repo-name/issues", // 버그 리포트 URL
      },
      "homepage": "https://github.com/your-github-name/repo-name#readme", // 홈페이지 URL
    }
    ```

    > **[주의]** `addonID`와 `addonRef`는 다른 플러그인과 절대 겹치지 않는 고유한 값으로 설정해야 합니다.

3. **개발 환경 설정 (`.env`)**:
    * `.env.example` 파일을 복사하여 `.env` 파일을 생성합니다.
    * `.env` 파일을 열어 자신의 Zotero Beta 실행 파일 경로와 개발용 프로필 경로를 설정합니다.

    ```sh
    # .env.example 파일을 .env로 복사
    cp .env.example .env
    # .env 파일 수정
    nano .env
    ```

4. **의존성 설치**:
    * 프로젝트 폴더에서 다음 명령어를 실행하여 필요한 라이브러리들을 설치합니다.

    ```sh
    npm install
    ```

---

## 3단계: 개발 (Coding)

1. **개발 서버 시작**:
    * 다음 명령어를 실행하면 개발 서버가 시작됩니다.

    ```sh
    npm start
    ```

    * 이 명령어는 다음 작업을 자동으로 수행합니다:
        * 개발 모드로 플러그인을 빌드합니다.
        * 빌드된 플러그인을 적용하여 Zotero를 실행합니다.
        * `src/` 또는 `addon/` 폴더의 소스 코드가 변경될 때마다 플러그인을 다시 빌드하고 Zotero에 자동으로 새로고침(Hot Reload)합니다.

2. **코드 작성 및 디버깅**:
    * **핵심 로직**: `src/` 폴더 내의 TypeScript(`*.ts`) 파일에 플러그인의 주요 기능을 작성합니다.
    * **예제 코드**: `src/modules/examples.ts` 파일에 UI 생성, 단축키 등록 등 다양한 API 사용 예제가 포함되어 있습니다. `@example` 키워드로 검색하여 활용할 수 있습니다.
    * **디버깅**:
        * `Zotero.debug()` 함수를 사용하여 로그를 출력할 수 있습니다. (Zotero 메뉴: `도움말` -> `디버그 출력 기록` -> `출력 보기`)
        * Zotero 메뉴의 `도구` -> `개발자` -> `자바스크립트 실행`에서 코드 조각을 테스트할 수 있습니다.

---

## 4단계: 빌드 및 배포 (Build & Release)

1. **프로덕션 빌드**:
    * 플러그인 배포를 위해 다음 명령어를 실행하여 프로덕션 버전으로 빌드합니다.

    ```sh
    npm run build
    ```

    * 빌드 결과물(`*.xpi` 파일)은 `.scaffold/build/` 디렉토리에 생성됩니다.

2. **배포 (Release)**:
    * 다음 명령어를 사용하여 버전을 올리고, Git에 커밋 및 태그를 생성한 후, 원격 저장소에 푸시합니다.

    ```sh
    npm run release
    ```

    * 이후 GitHub Actions가 자동으로 실행되어 빌드를 진행하고, GitHub Release에 `*.xpi` 파일을 게시합니다.

---

## 템플릿의 주요 구조 및 개념

* **훅 (Hooks)**: `src/hooks.ts` 파일은 플러그인의 생명주기(시작, 종료 등)에 맞춰 코드를 실행하는 중심점입니다.
* **전역 변수**: 템플릿은 `Zotero`, `window`, `document` 등 Zotero 플러그인 개발에 필수적인 객체들을 전역 변수로 제공하여 쉽게 접근할 수 있도록 합니다.
* **디렉토리 구조**:
  * `src/`: 플러그인의 핵심 로직이 담긴 TypeScript 소스 코드 폴더.
  * `addon/`: `manifest.json`, UI(`*.xhtml`), 언어 파일(`*.ftl`) 등 정적 파일 폴더.
  * `typings/`: Zotero API에 대한 TypeScript 타입 정의 파일 폴더. IDE의 자동 완성을 도와줍니다.
