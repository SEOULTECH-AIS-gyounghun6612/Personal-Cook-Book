# Conda 자동화: 환경 변수 관리

가상환경 활성화(`activate`) 및 비활성화(`deactivate`) 시점에 특정 스크립트를 자동으로 실행하여 환경 변수(PATH 등)를 동적으로 제어

## 목차

1. [동작 원리 (Mechanism)](#1-동작-원리-mechanism)
2. [설정 예시: CUDA 경로 자동화](#2-설정-예시-cuda-경로-자동화)

## 1. 동작 원리 (Mechanism)

Conda 환경 내부의 특정 디렉토리에 스크립트를 위치시키면 상태 변경 시 자동 실행됨

### 스크립트 실행 경로

* 활성화 시: `$CONDA_PREFIX/etc/conda/activate.d/*.sh` 실행
* 비활성화 시: `$CONDA_PREFIX/etc/conda/deactivate.d/*.sh` 실행

## 2. 설정 예시: CUDA 경로 자동화

특정 환경(`learning_base`) 진입 시에만 시스템 CUDA 경로를 변경하고, 나올 때 복원하는 설정

### 디렉토리 생성

```bash
conda activate learning_base
mkdir -p $CONDA_PREFIX/etc/conda/activate.d
mkdir -p $CONDA_PREFIX/etc/conda/deactivate.d
```

### 스크립트 작성 및 배치

활성화 스크립트 (`set_cuda_path.sh`)와 비활성화 스크립트 (`unset_cuda_path.sh`)를 작성하여 각각의 디렉토리에 배치

```bash
# 스크립트 복사 예시
cp ./script/set_cuda_path.sh $CONDA_PREFIX/etc/conda/activate.d/
cp ./script/unset_cuda_path.sh $CONDA_PREFIX/etc/conda/deactivate.d/
```

### 스크립트 내용 (Reference)

[set_cuda_path.sh](./../script/set_cuda_path.sh)

```bash
#!/bin/bash
export OLD_PATH=$PATH
export PATH="/usr/local/cuda-12.5/bin:$PATH"
```

[unset_cuda_path.sh](./../script/unset_cuda_path.sh)

```bash
#!/bin/bash
export PATH=$OLD_PATH
unset OLD_PATH
```
