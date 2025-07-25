### lab01 : UFW 방화벽(Firewall) 설정 실습

#### 실습 환경 준비

```bash
# [실습용 폴더 생성 및 이동]
mkdir -p ufw-lab
cd ufw-lab
```

#### 📝 문제 1: 방화벽(UFW) 상태 확인 및 활성화

1. 현재 방화벽(UFW) 활성 상태를 확인하세요.
2. 비활성 상태라면 UFW를 활성화하세요.
3. 상태가 “active”로 나오는지 확인하세요.

#### 📝 문제 2: SSH(22번 포트) 허용

1. SSH(22번 포트)를 허용하는 규칙을 설정하세요.
2. 설정 후 규칙이 추가됐는지 상태 명령어로 결과를 확인하세요.

#### 📝 문제 3: 웹/서비스(80, 443) 포트 허용

1. HTTP(80), HTTPS(443) 포트를 각각 허용하세요.
2. 명령의 결과를 통해 규칙이 정상 추가됐는지 확인하세요.

#### 📝 문제 4: 특정 포트(예: 3306) 외부 차단

1. 3306(MySQL) 포트를 외부에서 접근 못하도록 차단하는 규칙을 추가하세요.
2. 규칙이 적용되었는지 다시 한 번 상태를 확인하세요.

#### 📝 문제 5: 전체 규칙 현황 및 규칙 삭제

1. 현재 추가한 모든 방화벽 규칙을 번호와 함께 확인하세요.
2. 3306 포트 차단 규칙을 삭제하세요.
3. 삭제가 반영됐는지 다시 확인하세요.

#### 📝 문제 6: 특정 IP만 SSH 허용

1. 예시 IP(192.168.1.100)에서만 22번 포트(SSH) 접근을 허용하세요.
2. 규칙이 추가돼 적용됐는지 상태를 확인하세요.

#### 📝 문제 7: 방화벽 비활성화 및 초기화

1. 방화벽(UFW) 자체를 비활성화하세요.
2. 모든 규칙을 완전히 초기화(리셋)하세요.
3. 상태를 확인하여 완전히 비워진 것을 확인하세요.
