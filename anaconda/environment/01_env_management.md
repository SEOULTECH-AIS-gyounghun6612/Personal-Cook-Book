# Conda 가상환경 생성과 관리

프로젝트별 독립된 실행 환경을 생성하고 제어하는 핵심 명령어

## 목차

1. [가상환경 생성 (Create)](#1-가상환경-생성-create)
2. [기본 관리 (Manage)](#2-기본-관리-manage)
3. [환경 복제 및 추출 (Export)](#3-환경-복제-및-추출-export)

## 1. 가상환경 생성 (Create)

새로운 독립 공간 생성

### 기본 생성 명령어

```bash
conda create -n {env_name} python={version} [packages]
```

* `-n {name}`: 가상환경 이름 지정
* `python={version}`: 특정 Python 버전 지정 (권장)
* `[packages]`: 생성 시 함께 설치할 패키지 목록

### 활용 예시

```bash
# 'my_project'라는 이름으로 python 3.9 환경 생성
conda create -n my_project python=3.9

# 생성 시 numpy, pandas 함께 설치
conda create -n data_analysis python=3.8 numpy pandas
```

## 2. 기본 관리 (Manage)

생성된 환경의 상태 확인 및 진입/이탈

### 주요 명령어

| 동작 | 명령어 | 설명 |
| :--- | :--- | :--- |
| 조회 | `conda env list` | 생성된 모든 가상환경 목록 및 경로 확인 |
| 활성화 | `conda activate {env_name}` | 해당 가상환경으로 진입 |
| 비활성화 | `conda deactivate` | 현재 가상환경에서 이탈 (Base로 복귀) |
| 삭제 | `conda env remove -n {env_name}` | 해당 가상환경 및 내부 패키지 영구 삭제 |

## 3. 환경 복제 및 추출 (Export)

환경 구성을 파일로 저장하거나 복제하여 재현성 확보

### 환경 내보내기 및 불러오기

* 내보내기 (Export): 현재 환경 설정을 YAML 파일로 저장

    ```bash
    conda env export > environment.yaml
    ```

* 불러오기 (Import): YAML 파일을 기반으로 동일한 환경 생성

    ```bash
    conda env create -f environment.yaml
    ```

### 환경 복제 (Clone)

기존 환경을 그대로 복사하여 새로운 이름의 환경 생성

```bash
conda create --name {new_env} --clone {old_env}
```
