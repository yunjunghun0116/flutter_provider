# provider_02

-----read,watch,select-----
1. context.read<T> == Provider.of<T>(context,listen:false)
 - read는 말그대로 가장 가까이 있는 Object에 접근하고, 변화를 감지하지는 않는다

2. context.watch<T> == Provider.of<T>(context)
 - watch는 Object에 접근하고, 변화를 감지한다

3. context.select<T,R>(R selector(T value)) => R
 - select는 Object에 접근하고, 모든 변화를 감지하는게 아닌 해당부분(select된 부분)만 감지한다
 - ex)Dog의 객체에 접근후 age의 변화만 감지하고싶을경우 select를 사용하면 된다
 - 사용법 : context.select<Dog, String>((Dog dog)=>dog.name) 와 같이 T(타입)의 R(프로퍼티)를 선택할때 사용한다