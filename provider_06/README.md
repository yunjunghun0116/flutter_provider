# provider_06

ProxyProvider

create : 생성될 때 한번만 호출
update : 변화감지될때마다 매번 호출 or rebuild 될때

proxyprov_update - setstate에 의한 rebuild때문에 update가 발생한것이다 - 화면자체가 업데이트
개인적으로 ChangeNotifierProvider+ProxyProvider를 이용해서 개발을 진행할듯하다