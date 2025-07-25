### lab04: 서비스 및 프로세스 제어 실습

#### 📝 문제 1: SSH 서비스 관리

1.  SSH 서버 데몬(`ssh.service` 또는 `sshd.service`)의 현재 상태를 확인하세요.
2.  SSH 서비스를 **재시작(restart)** 하세요.
3.  시스템 부팅 시 SSH 서비스가 자동으로 시작되도록 설정되어 있는지 확인하고, 만약 아니라면 자동 시작되도록 설정하세요.
4.  `journalctl`을 사용하여 SSH 서비스에서 발생한 로그 중 가장 최근 20줄만 확인하세요.

#### 📝 문제 2: 포그라운드/백그라운드 작업 제어

1.  `tail -f /var/log/syslog` 명령어를 **백그라운드**에서 실행하세요. (`syslog`가 없다면 `/var/log/dmesg`로 대체)
2.  `jobs` 명령어로 백그라운드에서 실행 중인 작업을 확인하세요.
3.  백그라운드에서 실행 중인 `tail` 작업을 **포그라운드**로 가져오세요.
4.  포그라운드로 가져온 `tail` 작업을 **Ctrl + C**를 눌러 완전히 종료하세요.

#### 📝 문제 3: 작업 일시 정지 및 재개

1.  `ping google.com` 명령어를 실행하세요.
2.  **Ctrl + Z**를 눌러 `ping` 작업을 **일시 정지**하고 백그라운드로 보내세요.
3.  `jobs` 명령어로 작업이 'Stopped' 상태인지 확인하세요.
4.  일시 정지된 `ping` 작업을 **백그라운드에서 다시 실행**시키세요 (`bg` 명령어 사용).
5.  `pkill` 명령어로 실행 중인 `ping` 프로세스를 종료하여 실습을 마무리하세요. 