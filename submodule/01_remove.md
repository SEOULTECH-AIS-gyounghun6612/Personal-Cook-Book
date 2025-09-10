# Git Submodule 제거

Git Submodule을 제거하는 과정은 추가하는 것보다 다소 복잡하며, 여러 단계를 거쳐야 합니다. 단순히 서브모듈 디렉터리를 삭제하는 것만으로는 충분하지 않습니다.

## Submodule 제거 절차

다음은 서브모듈을 완전히 제거하는 표준 절차입니다.

1.  **`deinit` 명령 실행**

    `git submodule deinit` 명령은 `.git/config` 파일에서 해당 서브모듈 관련 항목을 삭제하고, 서브모듈 디렉터리의 내용을 비웁니다.

    ```bash
    # -f 옵션은 서브모듈 내에 로컬 변경사항이 있어도 강제로 진행합니다.
    git submodule deinit -f <서브모듈_경로>
    ```

2.  **`git rm` 명령 실행**

    `git rm` 명령을 사용하여 `.gitmodules` 파일에서 해당 서브모듈 정보를 삭제하고, 작업 트리에서 서브모듈 디렉터리를 제거합니다.

    ```bash
    git rm --cached <서브모듈_경로>
    ```

    또는

    ```bash
    git rm <서브모odil_경로>
    ```

3.  **`.git/modules` 디렉터리 정리**

    위 단계들을 거쳐도 `.git/modules` 디렉터리에는 서브모듈의 Git 데이터가 남아있을 수 있습니다. 이 디렉터리로 이동하여 해당 서브모듈의 디렉터리를 수동으로 삭제합니다.

    ```bash
    # .git 디렉터리 내의 서브모듈 데이터 삭제
    rm -rf .git/modules/<서브모듈_경로>
    ```

4.  **변경사항 커밋**

    마지막으로, 서브모듈이 제거된 변경사항을 커밋하여 작업을 완료합니다.

    ```bash
    git commit -m "Removed submodule <서브모듈_이름>"
    ```

### 요약

```bash
# 1. 서브모듈 등록 해제
git submodule deinit -f path/to/submodule

# 2. .gitmodules 파일과 작업 트리에서 서브모듈 제거
git rm --cached path/to/submodule
# 또는 git rm path/to/submodule

# 3. .git/modules 내의 서브모듈 데이터 삭제
rm -rf .git/modules/path/to/submodule

# 4. 변경사항 커밋
git commit -m "Removed submodule <submodule_name>"
```
