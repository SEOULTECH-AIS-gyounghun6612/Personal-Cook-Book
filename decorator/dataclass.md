# 데이터 처리 class 생성을 위한 dataclasses 모듈

python 프로그래밍에서 보다 효율적인 data class 처리를 위한 `dataclasses 모듈` 정리 및 실제 적용 예시를 (ex, config class) 정리한 문서.  
해당 모듈은 `dataclass` 데코레이터와 해당 데코레이터에서 사용가능한 `feild`, `asdict`와 같은 다양한 함수에 대하여 정의 됨.  

상세한 설명 또는 추가적인 기능은 [공식 문서](https://docs.python.org/ko/3.11/library/dataclasses.html)를 참조.

## dataclass 데코레이터

python과 같은 프로그램 언어에서는 어떠한 목적, 또는 효율성을 위해 여러 데이터를 묶어 data class를 구성하는 것을 자주 사용함.  
이 과정에서 묶은 데이터를 대상으로 비교, 처리하기 위하여, `__eq__`와 같이 해당 기능을 함수로 구현하여 사용하게 됨.  
이러한 data class를 보다 쉽게 구현 할 수 있도록 하는 dataclass 데코레이터 다음과 같은 특성을 가지고 있음.

### 초기화 함수 자동 생성  

프로그래밍에서 사용되는 모든 객체는 생성을 위한 초기화 함수와 그에 따른 초기 입력 값이 존재함.  
따라서 여러 데이터를 묶어 관리 하기 위한 data class의 경우 입력 데이터를 class의 attributes에 할당만 하는 단순한 초기화 과정을 가짐.  
아래 코드와 같이 구현되는 해당 과정에서  **단순 오타와 같은 사람에 의한 실수가 발생하기 쉬움.**  

``` python
# 일반적인 data class 초기화 구성
class Worker():
    def __init__(self, name: str, old: int, sexual: bool, mail_add: str):
        self.name = name
        self.old = old
        self.sexual = sexual
        self.mail_add = mail_add

worker_01 = Worker("kim", 27, True, "kims_mail@company.com")
print(worker_01)

worker_02 = Worker("lee", 27, True, "lees_mail@company.com")
print(worker_01 == worker_02)
```

아래 코드와 같이 dataclass 데코레이터를 이용한 data class 구현에서는 `__init__` 함수의 구현을 생략할 수 있음.  
따라서 **오타와 같은 사람에 의한 실수 문제 방지되며, 새로운 인자의 추가가 보다 쉽게 가능하고, 보다 직관적인 형태의 데이터 구성이 가능 함.**  

```python
from dataclasses import dataclass

# dataclass 데코레이터를 이용한 보다 단순한 data class 초기화 구성
@dataclass
class Worker():
    name: str
    old: int
    sexual: bool
    mail_add: str

worker_01 = Worker("kim", 27, True, "kims_mail@company.com")
print(worker_01)

worker_02 = Worker("lee", 27, True, "lees_mail@company.com")
print(worker_01 == worker_02)
```

### 효율적인 class 내부 데이터 사용

기존의 data class에서 내부의 데이터를 이용한 과정은 전부
