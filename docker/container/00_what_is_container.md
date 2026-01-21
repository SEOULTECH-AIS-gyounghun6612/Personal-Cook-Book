# 컨테이너란 (What is Container)

리눅스 커널의 격리 기술을 기반으로 애플리케이션과 모든 종속성을 묶은 경량의 독립 패키지

## 목차

1. [개요 및 특징 (Overview)](#1-개요-및-특징-overview)
2. [가상화 비교 (Comparison)](#2-가상화-비교-comparison)
3. [활용 사례 (Use Cases)](#3-활용-사례-use-cases)

## 1. 개요 및 특징 (Overview)

운영체제 수준의 가상화를 통해 프로세스 격리 환경 제공

### 핵심 요약

* 격리성 (Isolation): 호스트 및 타 컨테이너와 분리되어 독립성 보장
* 이식성 (Portability): "Write Once, Run Anywhere" 실현
* 경량성 (Lightweight): 별도의 OS 설치 없이 커널을 공유하여 오버헤드 최소화

## 2. 가상화 비교 (Comparison)

기존 기술(VM, venv)과의 차이점

### vs 가상 머신 (Virtual Machine)

| 구분 | 컨테이너 (Docker) | 가상 머신 (VM) |
| :--- | :--- | :--- |
| 구조 | Host OS 커널 공유 | 하드웨어 가상화 + Guest OS |
| 속도 | 초 단위 부팅 (빠름) | 분 단위 부팅 (느림) |
| 용량 | 수십 MB ~ 수 GB | 수 GB ~ 수십 GB |

### vs 언어 가상 환경 (Virtualenv)

| 구분 | 컨테이너 (Docker) | 언어 가상 환경 (venv/conda) |
| :--- | :--- | :--- |
| 범위 | OS 전체 (시스템 라이브러리 포함) | 언어 런타임 한정 |
| 해결 | 시스템 의존성 충돌 해결 가능 | OS 레벨 충돌 해결 불가 |

## 3. 활용 사례 (Use Cases)

연구 및 개발 환경에서의 주요 이점

### Deep Learning 연구 환경

* Dependency Hell 해결: CUDA, cuDNN 등 복잡한 드라이버 버전을 이미지 하나로 일치
* 재현성 (Reproducibility): 논문 구현 시 저자와 완벽히 동일한 실험 환경 즉시 구축
* 배포 유연성: 학습된 모델과 환경을 그대로 서버로 이동하여 서빙(Serving)
