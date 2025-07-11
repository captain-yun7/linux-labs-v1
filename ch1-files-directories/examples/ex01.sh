#ex01 : 파일 및 디렉토리 관련 기초 명령어 실습

# [현재 내 위치는 어디지?] - 현재 작업 디렉토리 경로를 출력합니다.
pwd

# /home/ubuntu  <-- (예시) 현재 위치가 출력됩니다.

# [프로젝트를 담을 메인 폴더 만들기] - 'my-app'이라는 이름의 디렉토리를 생성합니다.
mkdir my-app

# [만든 폴더로 이동하기] - 'my-app' 디렉토리 안으로 들어갑니다.
cd my-app

# [잘 들어왔나 확인] - 다시 현재 위치를 확인해봅니다.
pwd

# /home/ubuntu/my-app  <-- 경로 마지막에 my-app이 추가된 것을 확인!

# [어떤 파일이 있나?] - 현재 폴더(my-app)의 내용물을 목록으로 봅니다.
# -a: 숨김 파일까지 모두, -l: 자세한 정보(권한, 소유자, 용량, 날짜) 보기
ls -al

# total 8
# drwxr-xr-x 2 ubuntu ubuntu 4096 Jul 11 10:10 .  <-- '.'은 현재 폴더를 의미
# drwxr-xr-x 3 ubuntu ubuntu 4096 Jul 11 10:10 .. <-- '..'은 부모(상위) 폴더를 의미

# [소스코드, 문서, 설정 폴더 만들기] - 여러 개를 한 번에 만듭니다.
mkdir src docs config

# [폴더들이 잘 만들어졌나 확인]
ls -l

# drwxr-xr-x 2 ubuntu ubuntu 4096 Jul 11 10:12 config
# drwxr-xr-x 2 ubuntu ubuntu 4096 Jul 11 10:12 docs
# drwxr-xr-x 2 ubuntu ubuntu 4096 Jul 11 10:12 src

# [메인 파일과 서버 설정 파일 만들기] - 빈 파일을 생성합니다.
touch src/app.js config/server.conf

# [프로젝트 설명 파일 만들고 내용 넣기]
echo "My First Web Application" > README.md

# [README 파일 내용이 잘 들어갔나?] - 파일 내용을 화면에 출력합니다.
cat README.md

# My First Web Application  <-- 내용이 출력됩니다.

# [설명 파일을 문서 폴더에 백업하기] - README.md 파일을 docs 폴더 안으로 복사합니다.
cp README.md docs/

# [파일 이름 바꾸기] - 백업한 파일의 이름을 더 명확하게 변경합니다.
mv docs/README.md docs/README_backup.md

# [전체 구조 확인하기] - 현재 폴더와 하위 폴더의 모든 내용을 재귀적으로 보여줍니다.
ls -R

# .:
# config  docs  README.md  src
#
# ./config:
# server.conf
#
# ./docs:
# README_backup.md
#
# ./src:
# app.js

# [백업 파일은 이제 그만!] - 파일을 삭제합니다. (경고: 휴지통 없이 영구 삭제되니 주의!)
rm docs/README_backup.md

# [config 폴더가 더 이상 필요 없을 때]
# 먼저, 폴더 안의 파일을 지워야 폴더를 삭제할 수 있습니다.
rm config/server.conf

# [비어있는 폴더 삭제하기]
rmdir config

# 만약 폴더 안에 내용이 있어도 강제로 지우고 싶다면? (매우 주의!!)
mkdir temp && touch temp/temp.txt
rm -r temp  <-- '-r' 옵션은 폴더와 그 안의 내용까지 모두 삭제합니다.

# [최종 결과 확인]
ls -l

# drwxr-xr-x 2 ubuntu ubuntu 4096 Jul 11 10:15 docs
# -rw-r--r-- 1 ubuntu ubuntu   25 Jul 11 10:13 README.md
# drwxr-xr-x 2 ubuntu ubuntu 4096 Jul 11 10:12 src

# [프로젝트 떠나기] - 상위 폴더로 이동합니다.
cd ..

# [모든 흔적 지우기] - 프로젝트 전체를 삭제하고 싶을 때 사용합니다. (!!아주 아주 주의!!)
rm -r my-app