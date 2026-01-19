# Zotero 실전 가이드: 아이템 수집 및 관리

## 1. 아이템 생성 방법 (자료 수집)

* 아이템 (Item): 개별 논문 및 서지 정보 객체. (파일 시스템의 `파일`에 해당)

* 다양한 경로를 통한 신속하고 정확한 서지 정보 입력.

### 1.1 웹 커넥터 (Web Connector)

![웹 커넥터 사용 예시](./.source/function/items/add_from_web.png)

* 브라우저 확장을 통한 원클릭 수집 (가장 강력함).

* 사용법:

    1. 논문/자료 페이지 접속 (Google Scholar, arXiv 등).
    2. 주소창 옆 Zotero 아이콘 클릭.  
      -> 변환이 될 수 있는 데이터를 자동으로 감지, 아이콘이 자동으로 변환
      ![아이콘 변화 예시](./.source/function/items/icon_change.png)

### 1.2 식별자 추가 (ISBN/DOI)

* 마술봉 아이콘: 상단 도구 모음 위치.
* 기능: ISBN, DOI, PMID 입력 시 메타데이터 자동 완성.
* 장점: 수기 입력 대비 오타 없음 -> 비교적 정확함.

## 2. 아이템 관리 (분류 및 정리)

참조(Reference) 기반의 유연한 분류 시스템. -> 자세한 개념은 [해당 문서](./02_collection_structure.md) 참고

* 분류 (할당):

  * 아이템을 원하는 컬렉션으로 드래그 앤 드롭.

  * 원리: 복사가 아닌 `참조 추가`. (하나의 논문이 여러 컬렉션에 존재).

* 제거 (Remove):

  ![아이템 삭제](./.source/function/items/del_items.png)

  * Remove Item from ... : 해당 컬렉션에서만 제외. (= 아이템 객체 정보는 유지)
  
  * Move item to Trash: 해당 아이템의 완전한 삭제.

  * `Delete` 키: 해당 컬렉션에서만 제외 (= Remove Item from ...).

  * 가장 상단에 위치한 My Library에서 제거시 완전히 삭제.

* 부가 정보 관리:

  * 노트: 아이템 하위 노트 생성, 인용문 및 요약 정리.
