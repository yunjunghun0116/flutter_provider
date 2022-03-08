# provider_07

initState는 결국 위젯을 빌딩하는중인데 이때 위젯한테 setState()나 markNeedsBuild()를 통해 바꿀 필요가 있다고
말할경우에는 에러가 발생한다
따라서 이럴때를 대비하여 미리 initState에서 값을 변경하는 처리를 해주기보다는 넘어오기 전에 처리하고 넘겨주는게 맞는것같다

*StatefulWidget 렌더링 절차*
1. Create an element(BuildContext)
2. initState
3. didChangeDependencies
4. Build

initState : 페이지가 만들어지는 도중에 호출되며, Build호출 이전에 Build값에 대해 변화를 줄경우에 에러가 발생한다
-> addPostFrameCallback

**addPostFrameCallback**
현재의 프레임이 Build끝나면 등록된 Callback함수를 실행시켜라
로직 순서가 중요하기때문에 꼭 인지해둘 필요가 있다

다른 방법
**Future.delayed() or Future.microtask()**
Future란 해당 로직이 끝난 후로 모두 미루는것이기때문에 결국 Build가 끝난 후에 로직을 실행하기때문에 똑같음
