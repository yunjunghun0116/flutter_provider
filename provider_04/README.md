# provider_04

**Consumer**
Consumer<T>는 T의 변화를 감지하고, 변화가 나타날때마다 rebuild해주는데
이는 Provider.of(context)<T>.watch()와 비슷하다
하지만 개인적으로는 Provider.of(context)<T>를 주로 사용하고,
위젯트리상에서 찾기 힘든경우처럼 현재위젯에서 Provider를 생성,사용 동시에 할때만 Consumer를 사용할것같다

**ProviderNotFoundException**
앞으로 자주보게될것같은 에러
말 그대로 Provider를 찾지 못할경우 발생하는 에러이다
1. Provider를 추가후 hot-reload만 하고, hot-restart를 안했을경우

2. Provider가 다른 route에서 사용을 시도했을때
 - 이경우 최상단에서 감싸주지 않고 도중에 Provider를 생성한 후에 다른 페이지와 연결지어 위젯을 만들경우에 발생하는 에러이다
   이럴경우에 앱은 위젯트리를 올라가면서 객체를 찾기때문에 찾지 못하게된다.
   이유는 MaterialApp-Provider-A-B-C에서 PageD를 호출하고, D가 Provider의 객체를 사용하려고 할경우
   이 PageD는 Provider와 동등한 위치에 있지 C 밑에 추가되는게 아니기때문이다
   즉 Navigator.push는 child로 추가가 아닌 새로운 위젯트리에 생성으로 보아야 맞다
 - 해결법 : .value constructor를 사용한다 -> push-MaterialPageRoute에서 return할때 ChangeNotifierProvider.value
          이방법은 Page를 넘겨줄때 여기서 접근 가능한 Provider객체를 value로써 넘겨줌으로 해당 페이지가 접근할 수 있도록 해준다

3. Provider안에 child를 넣어주고, 해당 Provider의 create에서 해당 child에서 사용할 객체를 생성했을때(자주 접할듯)
 - 이경우 child가 아닌 builder를 사용해줌으로써 Provider와 child사이에 위젯이 생긴것과 같은 효과를 주어
   위젯트리에서 해당 Provider를 찾을수있게 해준다.(builder는 인자로 (BuildContext context,Widget? child)를 받는다
 - 혹은 Consumer를 사용한다 - 위에서 적은것과 같은 이유