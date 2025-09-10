# Conda 자동화를 이용한 가상환경 변수 관리

가상환경에서 사용하고자 하는 환경 변수를 미리 설정하여, conda 명령어에 동기화되어 자동으로 처리하는 기능을 제공함.  

이때 명령어에 따라 실행되는 스크립트 파일 위치는 다음과 같음.  

| 명령어               | 디렉토리                               |
| -------------------- | -------------------------------------- |
| `conda activate`     | `$CONDA_PREFIX`/etc/conda/activate.d   |
| `conda deactivate`   | `$CONDA_PREFIX`/etc/conda/deactivate.d |

## 예시 - CUDA 경로 설정 자동화

Linux 시스템에 구성된 가상환경 `learning_base`에서 사용하려는 cuda의 경로를 환경변수 PATH에 추가하는 자동화 스크립트를 사용하는 상황.  

그 결과 환경의 활성화 또는 비활성화 과정에서 자동으로 환경변수 PATH에 cuda 경로를 설정하게 됨.  

각 명령어 마다 실행하고자 하는 스크립트 파일은 다음과 같음.  

| 명령어               | 스크립트 파일                                       |
| -------------------- | --------------------------------------------------- |
| `conda activate`     | [`set_cuda_path.sh`](./../script/set_cuda_path.sh)     |
| `conda deactivate`   | [`unset_cuda_path.sh`](./../script/unset_cuda_path.sh) |

### Bash script

```bash
conda activate learning_base
mkdir -p $CONDA_PREFIX/etc/conda/activate.d  # $CONDA_PREFIX = 가상환경 디렉토리
mkdir -p $CONDA_PREFIX/etc/conda/deactivate.d

cd ./script
cp set_cuda_path.sh $CONDA_PREFIX/etc/conda/activate.d/set_cuda_path.sh
cp unset_cuda_path.sh $CONDA_PREFIX/etc/conda/deactivate.d/unset_cuda_path.sh
```

### 적용 결과

![결과_이미지](./../../_img_source/saving_environment_variable_000.png)

------------------------------------------------------------------------------------------------------------
첫 페이지 / [목차](./../../README.md) / 마지막 페이지
