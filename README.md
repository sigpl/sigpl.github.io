# sigpl.github.io

## 계절학교 추가

- _data/schools.yml 내용에 계절학교 정보를 추가
  + 날짜, 장소, 제목, 시기, 기타 정보를 입력할 수 있음
- school/ 안에 계절학교 시기(예: 2019w)를 이름으로 한 폴더를 생성
- 생성된 폴더 안에 index.md 또는 index.html을 이름으로 페이지를 생성
  + .md 파일을 이용하면 markdown 문법으로 페이지를 생성할 수 있음

## localhost에서 실행하기

** Linux 환경에서 테스트하였음

- ruby, jekyll 등 dependency 설치 (TODO: 상세 정보 추가)
- sigpl.github.io 안에서 `jekyll serve` 명령 실행
- 웹 브라우저를 실행한 후 주소 `localhost:4000` 로 이동하여 확인
- 서버 실행 중에 페이지를 수정하면 jekyll이 자동으로 감지하여 페이지를 새로 생성하므로, 변화가 즉시 반영됨.
