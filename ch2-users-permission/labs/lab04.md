### lab04.md: 고급 권한 관리 실습

#### Scenario: 협업을 위한 프로젝트 서버 권한 설정

여러 팀원이 함께 사용하는 개발 서버의 `project-X` 디렉토리를 관리해야 합니다. 보안과 효율성을 위해 다음과 같은 복잡한 권한 요구사항을 해결해야 합니다.

  * `src` 디렉토리는 `dev-team` 멤버들이 공동으로 작업하는 공간입니다. 누가 파일을 만들든 항상 그룹은 `dev-team`으로 지정되어야 합니다.
  * `config/secrets.conf` 파일은 오직 `lead-dev` 사용자만 수정할 수 있어야 합니다. 다른 `dev-team` 멤버들은 읽기만 가능해야 합니다.
  * 모든 팀원이 자유롭게 임시 파일을 생성하고 삭제할 수 있는 공용 `tmp` 디렉토리가 필요합니다. 단, 자신이 만든 파일 외에 다른 사람의 파일을 함부로 삭제해서는 안 됩니다.
  * 외부 감사팀(`auditor-group`)은 프로젝트의 모든 소스 코드를 읽을 수만 있어야 합니다.

#### 실습 환경 준비

```bash
# [실습용 그룹 및 사용자 생성]
sudo groupadd dev-team
sudo groupadd auditor-group
sudo useradd dev1 -m -G dev-team
sudo useradd dev2 -m -G dev-team
sudo useradd lead-dev -m -G dev-team
sudo useradd auditor1 -m -G auditor-group

# [프로젝트 디렉토리 구조 생성]
sudo mkdir -p /srv/project-X/{src,config,tmp}
sudo touch /srv/project-X/config/secrets.conf
sudo chown -R lead-dev:dev-team /srv/project-X
sudo chmod -R 770 /srv/project-X
```

**📝 문제 1: 협업 디렉토리 설정 (SetGID)**

`dev1`과 `dev2`가 `/srv/project-X/src` 디렉토리에서 파일을 생성할 때, 파일의 소유 그룹이 자동으로 `dev-team`이 되도록 설정하세요.

1.  `/srv/project-X/src` 디렉토리에 **SetGID** 권한을 부여하세요.
2.  `su - dev1` 명령어로 사용자를 전환한 뒤 `touch /srv/project-X/src/dev1.js` 파일을 생성하고, `ls -l` 명령어로 파일의 그룹이 `dev-team`으로 되었는지 확인하고 `exit` 하세요.
3.  `su - dev2` 명령어로 사용자를 전환한 뒤 `touch /srv/project-X/src/dev2.js` 파일을 생성하고, `ls -l` 명령어로 파일의 그룹이 역시 `dev-team`으로 되었는지 확인하고 `exit` 하세요.

**📝 문제 2: 특정 사용자에게만 쓰기 권한 부여 (ACL)**

`dev-team` 그룹 멤버는 기본적으로 `config/secrets.conf` 파일을 읽을 수만 있습니다. **ACL**을 사용하여 `lead-dev` 사용자에게만 이 파일에 대한 쓰기(`w`) 권한을 추가로 부여하세요.

1.  `setfacl` 명령어를 사용하여 `lead-dev` 사용자에게 `secrets.conf` 파일의 `rw-` 권한을 부여하세요.
2.  `getfacl /srv/project-X/config/secrets.conf` 명령어로 ACL 설정이 올바르게 적용되었는지 확인하세요.
3.  `su - dev1` 명령어로 전환하여 `echo "test" >> /srv/project-X/config/secrets.conf` 명령어를 실행했을 때 "Permission denied"가 발생하는지 확인하고 `exit` 하세요.
4.  `su - lead-dev` 명령어로 전환하여 위와 동일한 명령어를 실행했을 때 오류 없이 성공하는지 확인하고 `exit` 하세요.

**📝 문제 3: 공용 디렉토리 보안 설정 (Sticky Bit)**

모든 사용자가 파일을 생성할 수는 있지만, 오직 파일의 소유자만 삭제할 수 있도록 `/srv/project-X/tmp` 디렉토리에 **Sticky Bit** 권한을 설정하세요.

1.  모든 사용자가 읽고, 쓰고, 실행할 수 있도록 `tmp` 디렉토리의 권한을 `777`로 변경하세요.
2.  `tmp` 디렉토리에 Sticky Bit 권한을 추가하세요. (`ls -ld` 로 확인 시 `drwxrwxrwt` 처럼 보여야 합니다.)
3.  `su - dev1` 명령어로 `touch /srv/project-X/tmp/dev1.tmp` 파일을 생성하세요.
4.  `exit` 후 `su - dev2` 명령어로 전환하여 `rm /srv/project-X/tmp/dev1.tmp` 명령어로 남의 파일을 삭제하려고 할 때 "Operation not permitted" 오류가 발생하는지 확인하세요.

**📝 문제 4: 특정 그룹에 읽기 권한 부여 (ACL)**

**ACL**을 사용하여 `auditor-group` 그룹이 `/srv/project-X/src` 디렉토리와 그 안의 모든 파일들을 읽고 실행(`r-x`)할 수 있는 권한을 부여하세요. (하위 디렉토리까지 모두 적용)

1.  `setfacl` 명령어와 `-R` 옵션을 사용하여 `auditor-group`에게 `/srv/project-X/src` 디렉토리에 대한 `r-x` 권한을 부여하세요.
2.  `su - auditor1` 명령어로 전환하여 `ls -l /srv/project-X/src` 와 `cat /srv/project-X/src/dev1.js` 명령어가 성공적으로 실행되는지 확인하고 `exit` 하세요.

**📝 문제 5: 실습 정리**

실습을 위해 생성한 모든 사용자, 그룹, 디렉토리를 삭제하여 시스템을 깨끗하게 정리하세요.