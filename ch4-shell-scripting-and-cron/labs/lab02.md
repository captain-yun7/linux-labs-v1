### lab02: Cron을 이용한 서비스 자동 재시작 시스템 구축

#### 📝 문제

웹 서버(`nginx`)가 예기치 않게 중단되었을 경우, 이를 자동으로 감지하여 5분마다 상태를 점검하고, 중단되었다면 자동으로 재시작하는 시스템을 구축하세요.

#### 요구사항

1.  **자동 재시작 스크립트 작성 (`auto_restart_nginx.sh`)**
    *   `#!/bin/bash` 로 시작하세요.
    *   `nginx` 서비스가 현재 실행 중(`active`)인지 확인하세요.
        *   힌트: `systemctl is-active nginx` 명령어는 서비스가 실행 중이면 "active"를 출력하고, 아니면 "inactive"를 출력합니다.
    *   만약 실행 중(`active`)이 아니라면, 아래 두 가지 동작을 수행하세요.
        1.  "Nginx is down. Restarting..." 이라는 메시지를 `syslog`에 기록하세요.
            *   힌트: `logger "메시지"` 명령어를 사용하면 시스템 로그에 메시지를 남길 수 있습니다.
        2.  `systemctl start nginx` 명령어로 서비스를 재시작하세요.
    *   스크립트에 실행 권한을 부여하세요.

2.  **Cron 작업 등록**
    *   `crontab -e` 명령어를 사용하여 crontab 편집기를 여세요.
    *   위에서 작성한 `auto_restart_nginx.sh` 스크립트가 **5분마다** 실행되도록 등록하세요.
        *   **주의:** Cron에서 실행되는 스크립트는 전체 경로 (`/home/ubuntu/auto_restart_nginx.sh` 등)로 지정해야 합니다.
    *   Cron 작업이 정상적으로 등록되었는지 `crontab -l` 명령어로 확인하세요.

3.  **테스트 (선택 사항)**
    *   `sudo systemctl stop nginx`로 일부러 서비스를 중단시키세요.
    *   5분 정도 기다린 후, `systemctl status nginx`로 서비스가 다시 살아났는지 확인하세요.
    *   `journalctl | grep "Nginx is down"` 명령어로 `logger`로 남긴 로그가 기록되었는지 확인하세요. 