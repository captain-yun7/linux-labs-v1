### lab02

#### 실습 환경 준비

```bash
# [실습용 프로젝트 폴더 및 파일 만들기]
mkdir -p server-project/{src,config,logs,data}
touch server-project/src/{auth.js,user.js,post.js}
touch server-project/config/{db.conf,network.conf}
touch server-project/logs/access.log
echo "PORT=8080" > server-project/config/network.conf
for i in {1..100}; do echo "INFO: user request $i" >> server-project/logs/access.log; done
echo "CRITICAL: memory leak detected" >> server-project/logs/access.log
```

#### 📝 문제 1: 파일 검색 (find)

1.  `server-project` 디렉토리 안에서, 확장자가 `.conf`인 설정 파일들을 모두 찾아 경로를 출력하세요.
2.  `src` 디렉토리 아래에서, 이름에 `user`가 포함된 파일을 찾아보세요.

#### 📝 문제 2: 내용 검색 (grep)

1.  `config` 디렉토리의 모든 파일에서 `PORT`라는 단어가 포함된 줄을 찾아 출력하세요.
2.  `logs` 디렉토리의 `access.log` 파일에서 "CRITICAL"이라는 단어가 포함된 치명적 에러 로그를 찾아보세요.

#### 📝 문제 3: 내용 확인 및 분석 (head, tail, wc)

1.  `access.log` 파일이 너무 깁니다. 가장 최근에 기록된 로그 10줄만 확인하세요.
2.  `access.log` 파일에 총 몇 개의 줄(line)이 있는지 `wc` 명령어로 세어보세요.

#### 📝 문제 4: 링크 활용 (ln)

1.  현재 위치가 `server-project` 디렉토리라고 가정합니다. `config/network.conf` 파일에 대한 심볼릭 링크를 `server.conf` 라는 이름으로 `server-project` 디렉토리 바로 아래에 만드세요.
2.  `ls -l` 명령어로 링크가 잘 생성되었는지, 그리고 원본 파일을 잘 가리키고 있는지 확인하세요.

#### 📝 문제 5: 압축 및 정리 (tar)

1.  `src` 디렉토리와 `config` 디렉토리를 `backup.tar.gz` 라는 이름의 하나의 압축 파일로 만드세요. (힌트: `tar -czvf [파일명] [폴더1] [폴더2]`)
2.  실습이 끝났으니, 처음에 만들었던 `server-project` 디렉토리 전체를 삭제하세요.