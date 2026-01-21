# Docker란 무엇인가 (What is Docker)

애플리케이션의 개발, 배포, 실행을 위한 오픈 소스 플랫폼으로, '컨테이너' 기술을 기반으로 함

## 목차

1. [개요 (Overview)](#1-개요-overview)
2. [핵심 개념 (Core Concepts)](#2-핵심-개념-core-concepts)

## 1. 개요 (Overview)

개발 환경과 운영 환경의 불일치를 해소하고, 어디서나 동일하게 실행되는 환경("Build Once, Run Anywhere")을 제공

### 주요 특징

* 일관성: 개발 시점과 배포 시점의 환경 차이로 인한 오류 제거
* 경량성: 가상머신(VM)과 달리 OS 커널을 공유하여 빠르고 가벼움
* 확장성: 컨테이너 단위로 쉬운 복제 및 배포 가능

## 2. 핵심 개념 (Core Concepts)

Docker를 구성하는 3대 요소

### 1. Docker Engine

* 역할: 컨테이너를 생성하고 구동하는 주체 (서버-클라이언트 구조)
* 구성: 사용자의 명령을 받는 `Client`와 실제 작업을 수행하는 `Daemon`

### 2. [Container (컨테이너)](./container/00_what_is_container.md)

* 정의: 애플리케이션과 모든 종속성(Library, Runtime 등)을 격리된 공간에 패키징한 실행 인스턴스
* 특징: 독립된 파일 시스템과 네트워크 환경 보유

### 3. [Image (이미지)](./image/00_what_is_image.md)

* 정의: 컨테이너를 생성하기 위한 읽기 전용(Read-only) 설계도
* 특징: 여러 레이어(Layer)로 구성되며, 불변성(Immutability)을 가짐
