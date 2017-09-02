# uStyle
## - Shop sites that store your favorite styles in pin and try to coordinate
<hr/>

- backend
  - github를 통한 소스공유(sourcetree 이용)
  - AWS EC2 이용 http://52.78.169.40 : 본 uStyle 홈페이지 주소
  - 3306포트 : mysql DB ,  8080포트 : jenkins ,  8089포트 : locust
  - docker 를 이용해 mysql DB 와 jenkins 를 각각 컨테이너로 세팅
  - jenkins 를 통해 CI/CD 구현. 빌드 및 배포 자동화. 지속적인 유지보수관리 가능.
  - github hook service와 jenkins내 플러그인 이용 소스 자동업데이트
  - locust 를 통해 서버 부하테스트
  - API 문서화 도구 Swagger 사용
  
- frontend 
  
  - tiles 를 이용한 template framework 이용
  - Spring Security 를 통한 보안
  - mail send 
 
### more detail, https://graybat21.github.io/uStyle 
