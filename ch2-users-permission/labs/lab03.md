### lab03.md: 사용자 및 권한 관리 실습

#### Scenario: 로그(Log) 파일 관리 시스템 구축

웹 애플리케이션이 생성하는 로그 파일을 관리하는 시스템을 구축해야 합니다.

  * `log-writer` 사용자는 로그 파일이 저장될 `/var/log/my-app` 디렉토리에 **파일을 생성하고 쓸 수 있어야** 합니다.
  * `log-reader` 그룹에 속한 사용자들은 해당 로그 파일을 **읽을 수만 있어야** 합니다.
  * 그 외의 사용자는 로그 디렉토리에 **접근조차 할 수 없어야** 합니다.

**📝 문제 1: 사용자 및 그룹 생성**

1.  `log-reader` 라는 이름의 새 그룹을 만드세요.
2.  `log-writer` 와 `dev-intern` 이라는 두 명의 사용자를 생성하세요.
3.  `dev-intern` 사용자를 `log-reader` 그룹에 추가하세요.

**📝 문제 2: 디렉토리 생성 및 소유권 설정**

1.  로그 파일이 저장될 `/var/log/my-app` 디렉토리를 생성하세요.
2.  해당 디렉토리의 소유자는 `log-writer` 사용자로, 소유 그룹은 `log-reader` 그룹으로 설정하세요.

**📝 문제 3: 권한 설정**

`/var/log/my-app` 디렉토리의 권한을 다음 조건에 맞게 `chmod` 명령어로 설정하세요.

  * **소유자 (`log-writer`)**: 디렉토리 내용을 읽고, 쓰고, 들어갈 수 있어야 합니다. (`rwx`)
  * **그룹 (`log-reader`)**: 디렉토리 내용을 읽고, 들어갈 수만 있어야 합니다. (`r-x`)
  * **그 외 사용자**: 아무런 권한도 없어야 합니다. (`---`)

**📝 문제 4: 권한 테스트 (가장 중요\!)**

1.  `su - log-writer` 명령어로 `log-writer` 사용자로 전환한 후, `/var/log/my-app` 디렉토리 안에서 `touch test.log` 명령어로 파일 생성이 가능한지 확인하고 `exit` 하세요.
2.  `su - dev-intern` 명령어로 `dev-intern` 사용자로 전환한 후, `/var/log/my-app` 디렉토리 안의 `test.log` 파일을 `cat` 명령어로 읽을 수 있는지 확인하세요.
3.  같은 `dev-intern` 사용자로 `/var/log/my-app` 디렉토리 안에 `touch denied.log` 파일 생성을 시도해보고 "Permission denied" 메시지가 뜨는지 확인한 후 `exit` 하세요.

**📝 문제 5: 실습 정리**

1.  생성했던 `log-writer`, `dev-intern` 사용자를 삭제하세요.
2.  생성했던 `log-reader` 그룹을 삭제하세요.
3.  생성했던 `/var/log/my-app` 디렉토리를 삭제하세요.