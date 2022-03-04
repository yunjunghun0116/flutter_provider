# provider_01

provider : 위젯트리에 존재한다

-----단일provider-----

Provider<Type>으로 감싸준 후에 그 아래에 해당하는 모든 위젯은
Provider.of<Type>(context)로 접근할수 있게되는데 찾게되는 과정은
위젯트리를 타고 올라가는데 그때 Type을 통해서 해당 변수에 접근을 할 수 있게되는것 - Type이 있어야 접근이 가능하다!
- 그러면 같은 타입중에 여러개가 존재하게 된다면?? : 질문에 답이 있는데 말 그대로 위젯트리를 타고올라가기때문에 가장 가까운 Provider를 제공

Provider.of<Type>(context).Function() 할때 고려해야할점 1. listen
UI에서 변경되는 부분은 true
데이터만 변경하고 UI를 변경하지 않는곳에서는 listen : false

ChangeNotifier 를 extend 하거나 mixin해서 changeNotificationAPI를 사용할수 있는데,
이는 생성후 notifyListeners()를 통해 listen할수 있도록 한다 -> 변화

--ChangeNotifierProvider없이 ChangeNotifier만으로 사용할때--
+ 생성자로 Dog와 같이 Type객체를 넘겨주어야함(이후 Provider에서 해주는 역할)
ChangeNotifier를 상속받은 객체를 생성자로써 호출후에 addListener를 통해 void함수를 넣어주었을때, 이는 자동으로 dispose되지 않기 때문에
꼭 removeListener를 통해 dispose해주어야한다
즉 A.addListener(args) 는 A가 호출될때마다 args인 함수역시 호출한다

-----ChangeNotifierProvider-----

ChangeNotifier + Provider
1. ChangeNotifier 인스턴스를 만들고
 - 필요할때 만든다, 필요없어지면 메모리에서 dispose해준다
2. ChangeNotifier 에 쉽게 접근할수 있도록
 - 생성자를 통해 인자로 넘겨주지 않고, Provider.of를 통해 access한다
 - ChangeNotifier를 통해 변화를 찾고, 변화가 있을경우 UI를 rebuild한다 ( listen: false )-> 접근만 하고 변화는 감지하지않는다
