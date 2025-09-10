# Conda 설치 및 초기 설정

본 메뉴얼의 내용은 [공식 conda user guide](https://conda.io/projects/conda/en/latest/user-guide/index.html)에 나온 내용을 기반으로 작성되어 있음.  
따라서 본 내용은 공식 문서에도 대부분 서술되어 있으며, 상충되는 내용의 경우 별도의 서술이 없는 경우 공식 문서를 우선함.  

## Conda 설치

해당 내용은 Ubuntu 환경의 CLI 기반의 설치를 서술하고 있음. Window 환경의 GUI 기반의 설치 방법의 경우
[공식 문서](https://conda.io/projects/conda/en/latest/user-guide/install/windows.html)의 내용으로 대체함.  

### 설치 파일 다운로드

conda의 경우 다양한 환경을 대상으로 작동 가능하도록 많은 수의 배포판이 존재 함.  
이 중 현재 사용 환경에 맞추어 설치 파일 목록(
[Anaconda](https://repo.anaconda.com/archive) /
[Miniconda](https://repo.anaconda.com/miniconda)
) 중에서 선택하여 다운로드 받아야 함.  
연구실에서 사용하는 환경의 경우 일반적으로 `amd64 아키텍처 기반 Ubuntu 배포판`으로 `Linux-x86_64.sh`로 끝나는 파일을 사용.  

이후 명령어는 예시로 자신의 상황에 맞추어 변형하여 진행 필요. (주석의 경우 에시)

```bash
wget ${site_address}/${install_file_in_index}

# wget https://repo.anaconda.com/miniconda/Miniconda3-py312_24.5.0-0-Linux-x86_64.sh  # miniconda
# wget https://repo.anaconda.com/archive/Anaconda3-2024.06-1-Linux-x86_64.sh  # anaconda
```

다운로드 받은 설치 파일의 무결성의 확인하기 위하여 아래 명령어를 통해 hash index와 비교가 필요함.  
이때 비교되는 hash code의 경우 설치 파일 목록에 병기되어 있음.  

```bash
shasum -a 256 ${intall_file_name}

# shasum -a 256 Miniconda3-py312_24.5.0-0-Linux-x86_64.sh  # miniconda
# => 4b3b3b1b99215e85fd73fb2c2d7ebf318ac942a457072de62d885056556eb83e
# shasum -a 256 Anaconda3-2024.06-1-Linux-x86_64.sh  # anaconda
# => 539bb43d9a52d758d0fdfa1b1b049920ec6f8c6d15ee9fe4a423355fe551a8f7
```

### 설치 파일 실행

무결성 검사를 통과한 설치 파일의 경우 아래 명령어를 통해 실행.  
설치 과정에서 주요 옵션은 배포처에서 설정한 기본 설정을 유지하는 것이 가장 무난함.

```bash
bash ${intall_file_name}
# bash Miniconda3-py312_24.5.0-0-Linux-x86_64.sh  # miniconda
# bash Anaconda3-2024.06-1-Linux-x86_64.sh  # anaconda
```

### 설치 과정 중 발생 가능한 문제와 그에 따른 해결책

- **bash 명령어를 통해 설치 파일을 실행하였으나, 프로그램이 작동 되지 않은 경우**  

    일반적으로 해당 문제의 원인은 설치 파일의 실행(execute)을 권한을 가지 않은 경우.  
    파일의 권한을 확인 하여 파일의 권한을 추가하면 해결됨.

- **여러 사용자의 사용을 위하여 설치 하는 경우 설치 파일의 경로 문제**

    일반적으로 root가 아닌, 관리자 계정으로 접속 하여 해당 계정에 설치하고,  
    소유권과 권한을 조정하여 사용하는 것이 일반적인 해결 방법임.

## Conda 경로 설정

conda 설치 후 해당 기능 사용을 위하여, 해당 소프트웨어의 path 설정이 필요.  
이때 해당 설정은 bash가 실행 될 때마다 설정이 필요함.  
따라서 상황에 맞추어 아래 명령어에서 선택하여, 내용을 삽입 할 필요가 있음.  

``` bash
sudo nano /etc/bash.bashrc/  # 단말기 내 사용자 전체 설정이 필요한 경우 (ex 서버)
nano ~/.bashrc/  # 특정 사용자만 적용하는 경우 (ex 개인 연구 컴퓨터)
```

해당 내용을 설정하려는 상황에 맞추어 bash 초기 실행 사항에 삽입.

``` bash
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('{codna 설치 경로}/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "{codna 설치 경로}/etc/profile.d/conda.sh" ]; then
        . "{codna 설치 경로}/etc/profile.d/conda.sh"
    else
        export PATH="{codna 설치 경로}/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
```

## 설치 확인
