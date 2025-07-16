## VM 리눅스에서 Spring Boot 서버에 데이터베이스 연동 실습

### 목표

Spring Boot + PostgreSQL 환경에서 /greeting?lang=kr 또는 /greeting?lang=en 요청 시,
언어 코드에 따라 DB에 저장된 인삿말을 조회하여 응답하는 REST API 서버를 구현한다.

#### 1. 데이터베이스 설계 및 구성

PostgreSQL에 다음 테이블을 생성하고, 최소 2개 이상의 인삿말 데이터를 등록한다.

```sql
CREATE TABLE greetings (
    id SERIAL PRIMARY KEY,
    lang_code VARCHAR(10) UNIQUE NOT NULL,  -- 예: en, kr, jp
    message TEXT NOT NULL                   -- 예: Hello, 안녕하세요, こんにちは
);
```

#### 2. 서버와 데이터베이스 연동 배포

- 위 요구사항에 맞게 Spring Boot 프로젝트를 수정하여 API를 구현한다.
- PostgreSQL과 연결하도록 설정하고, 서버를 리눅스 VM에 배포한다.

#### 3.브라우저 테스트

- API 서버가 정상적으로 동작하는지 다음 요청으로 확인한다.

```bash
  "/greeting?lang=kr"  # → 안녕하세요
  "/greeting?lang=en"  # → Hello
  "/greeting?lang=jp"  # → こんにちは
```
