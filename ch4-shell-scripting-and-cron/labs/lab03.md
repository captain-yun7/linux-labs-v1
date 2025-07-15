### lab03: 크론탭 자동화 실습

#### 실습 환경 준비

```bash
# [백업 대상 및 스크립트 생성]
mkdir -p cron-lab/data
echo "테스트 데이터" > cron-lab/data/test.txt
vim cron-lab/backup.sh
```

- `backup.sh` 내용 예시:
  ```bash
  #!/bin/bash
  tar -czf "$HOME/cron-lab/data_backup_$(date +%Y%m%d_%H%M%S).tar.gz" "$HOME/cron-lab/data"
  echo "[$(date)] 백업 완료" >> "$HOME/cron-lab/backup.log"
  ```

#### 📝 문제 1: 실행 권한 부여

1. `backup.sh`에 실행 권한을 부여하세요.

#### 📝 문제 2: 크론탭 등록

1. 매일 오전 2시에 `backup.sh`가 자동 실행되도록 크론탭에 등록하세요.

#### 📝 문제 3: 동작 확인

1. 크론탭이 정상적으로 동작하는지, 일정 시간 후 `backup.log`와 압축 파일이 생성되는지 확인하세요.
