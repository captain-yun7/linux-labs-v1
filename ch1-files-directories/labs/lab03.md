### lab03

```bash
# [실습용 프로젝트 폴더 만들기]
mkdir pipe-lab && cd pipe-lab

# [여러 종류의 파일 생성]
touch app.js server.py config.json
echo "ERROR: RUNTIME exception" > server.log
echo "ERROR: Null pointer exception" > server.log
echo "INFO: User logged in" >> server.log
echo "INFO: Data processed" >> server.log
mkdir a b c
```

#### 📝 문제 1: 리디렉션(`>`) 활용

`find . -type f` 명령어를 사용하여 현재 폴더에 있는 모든 파일의 목록을 `file_paths.txt` 라는 이름의 파일에 저장하세요.

#### 📝 문제 2: 파이프(`|`) 활용

`ls -l` 명령어의 결과물 중에서, 파일 종류가 디렉토리(`d`로 시작)인 것들만 화면에 출력하세요.
(힌트: `grep "^d"`)

#### 📝 문제 3: 파이프와 리디렉션 조합

현재 실행 중인 모든 프로세스 목록(`ps -ef`) 중에서 'bash' 라는 단어가 포함된 라인만 찾아 `bash_processes.txt` 파일에 저장하세요.

#### 📝 문제 4: 파이프 체이닝

`server.log` 파일에서 "ERROR" 라는 단어가 포함된 줄을 찾은 뒤, 그 결과에서 `pointer` 라는 단어가 포함된 줄을 다시 찾아 화면에 출력하세요.
