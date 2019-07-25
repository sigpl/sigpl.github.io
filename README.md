# sigpl.github.io

## 구성

- `_data` 폴더 : `.yml` 파일에 이 웹사이트의 구성 정보가 저장되어있음
  + `section.yml`: 웹사이트 전체 구성
  + `members.yml`: 운영위원 정보가 존재하는 연도
  + `journals.yml`: 연도별 학술논문지 정보
  + `confs.yml`: 연도별 학술대회 정보
  + `schools.yml`: 연도별 계절학교 정보
- `member`, `journal`, `conf`, `school` 폴더 안에 각각의 페이지가 존재
- 기타 페이지는 `pages` 폴더 안에 존재
- 전체 페이지가 공유하는 html 코드는 `_include`, `_layouts`에 존재

## 계절학교 추가

- `_data/schools.yml` 파일 내용에 계절학교 정보를 추가
  + 날짜, 장소, 제목, 시기, 기타 정보를 입력할 수 있음
- `school/` 안에 계절학교 시기(예: 2019w)를 이름으로 한 폴더를 생성
- 생성된 폴더 안에 `index.md` 또는 `index.html`을 이름으로 페이지를 생성
  + `.md` 파일을 이용하면 markdown 문법으로 페이지를 생성할 수 있음

## localhost에서 실행하기

** Linux 환경에서 테스트하였음

- ruby, jekyll 설치
  ubuntu의 경우는 다음과 같았다.
  `https://jekyllrb-ko.github.io/docs/installation/#ubuntu`
  1. `sudo apt-get install ruby ruby-dev build-essential`
  2. 아래의 명령을 shell에서 실행:
  ```
  echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
  echo 'export GEM_HOME=$HOME/gems' >> ~/.bashrc
  echo 'export PATH=$HOME/gems/bin:$PATH' >> ~/.bashrc
  source ~/.bashrc
  ```
  3. `gem install jekyll bundler jekyll-redirect-from`
- sigpl.github.io 안에서 `jekyll serve` 명령 실행
- 웹 브라우저를 실행한 후 주소 `localhost:4000` 로 이동하여 확인
- 서버 실행 중에 페이지를 수정하면 jekyll이 자동으로 감지하여 페이지를 새로 생성하므로, 변화가 즉시 반영됨.


## HTML Table 자동생성

markdown 문법으로 테이블을 작성하는 것이 편리하지만, 테이블 형식을 자유롭게 사용하기 어려움

school/tablegen 의 자동 생성 도구를 통해 markdown 문법의 테이블을 html 문법의 테이블로 자동 생성할 수 있음 (school/tablegen/README 참고)
