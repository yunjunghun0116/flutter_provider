# provider_01

provider : 위젯트리에 존재한다
Provider<Type>으로 감싸준 후에 그 아래에 해당하는 모든 위젯은
Provider.of<Type>(context)로 접근할수 있게되는데 찾게되는 과정은
위젯트리를 타고 올라가는데 그때 Type을 통해서 해당 변수에 접근을 할 수 있게되는것 - Type이 있어야 접근이 가능하다!
- 그러면 같은 타입중에 여러개가 존재하게 된다면?? : 질문에 답이 있는데 말 그대로 위젯트리를 타고올라가기때문에 가장 가까운 Provider를 제공


Provider.of<Type>(context).Function() 할때 고려해야할점 1. listen
UI에서 변경되는 부분은 true
데이터만 변경하고 UI를 변경하지 않는곳에서는 listen : false