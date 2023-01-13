# 프로젝트 설명
- flutter와 pixabay API를 활용한 이미지 검색 프로그

# 사용기술
- 언어 : dart
- 프레임워크 : flutter
- 라이브러리 : http.dart , Provider(상태관리)

# 느낀점
- flutter입문과 mvvm 디자인 패턴에 대해 공부할 수 있어서 좋았다.
- 프로젝트를 공부하면서 생각한 내가 본 mvvm패턴이다.
- view : 화면
- viewModel :
여러가지 모델중 담당하는 화면에 필요한 모델들만 가져와서 선언, view에 필요한 추가적인 state를 저장함, 재사용 불가능 -> 화면에 한개씩 필요하므로
추가적인 화면단의 단계적으로 보여주는 화면을 컨트롤
- model :
화면에 필요한 데이터들을 각각의 성질따라 나눠놓은것. 재사용이 가능 -> 여러 viewModel에서 사용이 가능하므로
