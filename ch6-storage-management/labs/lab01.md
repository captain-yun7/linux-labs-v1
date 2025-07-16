### lab01 : 파티션, 파일 시스템, 마운트/언마운트

#### 실습 환경 준비

```bash
# [실습용 폴더 생성 및 이동]
mkdir -p vdisk-lab
cd vdisk-lab
```

#### 📝 문제 1: 가상 디스크 이미지 생성 및 연결

1. `500M` 크기의 빈 가상 디스크 파일을 `mydisk.img`로 생성하세요.
2. 이미지 파일을 루프 디바이스(`/dev/loop0` 등)로 연결하세요.
3. `sudo losetup -a`와 `lsblk` 명령으로 루프 디바이스가 정상적으로 연결됐는지 확인하세요.

#### 📝 문제 2: 파티션 분할

1. `fdisk`를 사용해 가상 디스크를 400MB/100MB 두 파티션으로 나누세요.
   - 첫 번째 파티션: 400MB (`+400M`)
   - 두 번째 파티션: 남은 전체 용량
2. `lsblk` 명령으로 파티션 목록이 잘 생성됐는지 확인하세요.

#### 📝 문제 3: 파일 시스템 생성

> ⚠️ XFS 파일 시스템을 생성하려면 xfsprogs 패키지가 필요합니다. 설치가 안 되어 있다면 아래 명령으로 먼저 설치하세요.
>
> ```bash
> sudo apt update
> sudo apt install xfsprogs
> ```

1. `/dev/loop0p1`에는 XFS 파일 시스템을 생성하세요.
2. `/dev/loop0p2`에는 ext4 파일 시스템을 생성하세요.
3. `lsblk -f`로 파일 시스템 타입이 제대로 지정됐는지 확인하세요.

#### 📝 문제 4: 마운트 및 확인

1. `/mnt/loop0p1`, `/mnt/loop0p2` 디렉토리를 생성하세요.
2. 각 파티션을 해당 디렉토리에 마운트하세요.
3. `df -hT | grep loop0`, 그리고 (선택적으로) `mount | grep loop0` 명령으로 정상적으로 마운트됐는지 확인하세요.

#### 📝 문제 5: 입출력 실습

1. `/mnt/loop0p1`에 `xfs.txt`, `/mnt/loop0p2`에 `ext4.txt` 파일을 각각 작성하세요.
2. 각 마운트 디렉토리에서 `ls`로 파일이 정상 생성됐는지 확인하세요.

#### 📝 문제 6: 실습 정리(마운트 해제 및 자원 반환)

1. 각 마운트 디렉토리에서 언마운트하세요.
   ```bash
   sudo umount /mnt/loop0p1
   sudo umount /mnt/loop0p2
   ```
2. 루프 디바이스 연결을 해제하세요.
   ```bash
   sudo losetup -d /dev/loop0
   ```
3. 실습에 사용한 디렉토리와 이미지 파일을 모두 삭제하세요.
   ```bash
   sudo rm -r /mnt/loop0p1 /mnt/loop0p2
   rm ~/mydisk.img
   ```
