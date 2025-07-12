### lab02: 파일 권한 실습

#### 실습 환경 준비

```bash
# [실습용 폴더 및 파일 생성]
mkdir -p deploy-project/{scripts,configs}
touch deploy-project/scripts/deploy.sh
echo "DB_HOST=localhost" > deploy-project/configs/db.conf
sudo useradd deployer
sudo groupadd sys-admin
```

#### 📝 문제 1: 권한 설정

1.  `scripts/deploy.sh` 파일은 소유자만 읽고, 쓰고, 실행할 수 있도록 권한을 변경하세요. (다른 사용자는 아무 권한 없음)
2.  `configs/db.conf` 파일은 소유자와 `sys-admin` 그룹 멤버만 읽을 수 있도록 권한을 변경하세요. (그 외 사용자는 아무 권한 없음)

#### 📝 문제 2: 소유권 변경

1.  `deploy-project` 디렉토리와 그 안의 모든 파일 및 하위 디렉토리의 소유자를 `deployer` 사용자로 변경하세요.
2.  `configs` 디렉토리의 소유 그룹을 `sys-admin` 그룹으로 변경하세요.

#### 📝 문제 3: 확인

`ls -lR deploy-project` 명령어를 사용하여 위에서 설정한 권한과 소유권이 올바르게 적용되었는지 확인하세요.

#### 📝 문제 4: 실습 정리

1.  `deploy-project` 디렉토리 전체를 삭제하세요.
2.  생성했던 `deployer` 사용자와 `sys-admin` 그룹을 삭제하세요.
