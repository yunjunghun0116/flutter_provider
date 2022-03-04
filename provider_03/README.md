# provider_03

일반적으로 provider의 create은 맨 처음 한번만 실행되기때문에 watch를 사용하기보단 read를 사용해서
일회성 데이터를 가져온 후에 사용하는것이 좋다

1. FutureProvider
 - create될때 한번 실행된다

2. StreamProvider
 - stream에 맞게 호출된다

3. MultiProvider
 - 안에있는 provider를 위에서부터 하나하나엮어준다