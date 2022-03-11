# to_do_app

todoapp with provider

Independent States - ChangeNotifierProvider
Computed States - ChangeNotifierProxyProvider, ChangeNotifierProxyProvider

State - 논리적으로 분리가능할경우 분리하도록
State - 주로 클래스형태로 관리 ex) Model

ProxyProvider : 다른 Provider에 의존
create, update를 통해 데이터변화를 감지

결국 providerA의 변화에 따라 값이 변하는 providerB의 경우 ProxyProvider로 구현해주는게 좋다
두개,세개 그 이상의 provider에 한번에 의존한다고 하더라도 이 방식을 사용해서 구현이 가능하다
