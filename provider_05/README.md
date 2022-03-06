# provider_05

**Selector**
Selector<T,R>(
    selector:(context,T)=>R,
    builder:(context,R,Widget?){
        return Widget;
    }
)
처럼 입력(T)을 받았을때 이 객체의 어떤 부분의 변화를 감지할것인지 고려하는게 리턴타입에 해당하는 부분이다
selector에서 리턴된 값은 builder로 넘어간 후에 이 값을 감지하며 변화할때마다 rebuild해준다.

Navigation의 방법
1. Anonymous route access
   MaterialPage에서 넘겨줄때 Provider.value를 통해 접근해야할 value를 같이 넘겨줌으로써 서로 관계없는 위젯트리에 있다 하더라도
   필요한 Provider객체에 접근할수 있다
2. Named route access
   routes에서 필요한 route에 접근할 수 있도록 해주는데, 이때 main.dart에서 모두 Provider로 감싸주어야한다.
   그래야 동등한 위치에 screen을 할당하고, 이 screen이 Provider객체에 접근할 수 있기때문이다
3. Generated route access
   Named와 유사한데 이는 routes에서 만들어주지 않더라도 route를 만들고 screen을 할당해주는 구조이며
   이는 onGenerateRoute에서 직접 봐줄수있다

+@ Global access
   최상단에 Provider를 할당하는것이지만 모든 Provider를 최상단에 할당하는것은 매우 부적절한 일
   그렇기때문에 필요한 context에 알맞게 할당하는것이 중요하다

**ProxyProvider**

ProviderA의 데이터가 필요한 ProviderB가 필요한경우, 즉 두 Provider를 연결해주는것이라고 생각하면된다.
즉 다른 provider의 value가 변할경우 호출하기때문에 create는 중요하지않지만 update가 required이다
이또한 ChangeNotifierProxyProvider와 같은 provider가 존재한다
예를들어 Todo요소가 1000개가 있을때, 이중 내가 한것들이 300개정도 되면 이 두개의 provider(TodoList,successTodoList)를 연결시켜주는것이 맞다.
즉 successTodoList는 proxyProvider로 해놓고, 연결을 TodoList와 연결지어주면 된다

update가 호출될때
 - ProxyProvider가 의존하는 값을 호출할때
 - ProxyProvider가 의존하는 값이 변경될떄
 - ProxyProvider가 rebuild될때

 ProxyProviderN : N개의 의존하는 Provider의 update를 감지하기 위한 사용

 **ChangeNotifireProxyProvider**

 외부 ChangeNotifier와 값을 synchronize한다
 절대 update내부에서 create하지 말것 - state가 lost될 수 있다
 asyncOperation이 작동중일때, 끝나기 전에 update가 불러질수 있기때문이다
 ChangeNotifireProxyProvider<T,R>(
    update:(_,T t,R r)=> r(ex)ChagneNotifier를 상속받은 객체)
 )
 그런데 여기 update안에서 create가 필요한 객체를 불러올경우, 변할때마다 생성한다는게 말이 안됨(무한루프)
 또한 가능하면 ProxyProvider를 사용하는게 더 좋음

