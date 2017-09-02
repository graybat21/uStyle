# uStyle
    uStyle은 여성을 대상으로 한 쇼핑몰입니다.
    다양한 카테고리의 상품을 확인해볼 수 있으며, 상품의 색상, 사이즈를 선택하여 구매할 수 있습니다. 
    원하는 상품을 pin으로 등록하고, 등록된 상품을 다른 사용자에게 보여줌으로써, 
    그 상품의 구매를 유도할 수 있는 PinBoard 기능을 구현하였습니다.

- 통합개발환경(IDE)
  - Language : Java 1.8
  - Application Framework : Spring 4.1.7, Spring Security 4.0.4
  - Build tool : Apache Maven 3.3.9
  - DBMS : MySQL 5.7
  - WAS : Apache Tomcat 8.0
  - else : jQuery 1.11.3, Handlebars.js 3.0.1, Log4j 1.2.17, Tiles 3.0.5, MyBatis 3.2.8 ...
  
- Backend
  - github를 통한 소스공유(sourcetree 이용)
  - AWS EC2 이용 http://52.78.169.40 : 본 uStyle 홈페이지 주소
  - 3306포트 : mysql DB ,  8080포트 : jenkins ,  8089포트 : locust
  - docker 를 이용해 mysql DB 와 jenkins 를 각각 컨테이너로 세팅
  - jenkins 를 통해 CI/CD 구현. 빌드 및 배포 자동화. 지속적인 유지보수관리 가능.
  - github hook service와 jenkins내 플러그인 이용 소스 자동업데이트
  - locust 를 통해 서버 부하테스트

- Frontend
  - RESTful API 문서화 도구 Swagger 사용
  - tiles 를 이용한 template framework 이용
  - Ajax 를 이용 파일 업로드 
  -


<hr/>

### more details, https://graybat21.github.io/uStyle 
