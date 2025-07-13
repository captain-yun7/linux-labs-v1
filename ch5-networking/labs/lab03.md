### lab03

#### 📝 문제 1: 데이터 조회 및 다운로드

1.  `https://api.github.com/users/octocat` 주소로 GET 요청을 보내 사용자 정보를 JSON 형태로 받아오세요.
2.  위 요청의 HTTP 응답 헤더(header)만 별도로 확인하세요.
3.  `https://via.placeholder.com/150` 주소에서 이미지를 다운로드하여 `placeholder.png` 라는 이름으로 저장하세요. (진행 상황 표시줄이 보이도록)

#### 📝 문제 2: API 데이터 전송 및 활용

1.  `https://httpbin.org/post` 주소로 `name=John` 그리고 `project=linux-lab` 라는 데이터를 담아 POST 요청을 보내고, 서버의 응답을 확인하세요.
2.  `https://api.github.com/users/octocat`에서 받은 JSON 데이터에서 "name" 필드의 값만 추출하여 출력하세요. (`jq`가 설치되어 있다고 가정합니다.) 