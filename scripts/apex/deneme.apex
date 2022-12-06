Dog d1 = new Dog();
d1.name ='dog1 name';
d1.color ='dog1 color';
d1.age=15;
System.debug(d1);

Dog dog2 = new Dog('Bruno','Black',6);
System.debug(dog2);



//Dog.showCount();
//bu sistem debug içindeyken hata veriyor böyle hata vermyor ama dev console da attempt to de-reference a null object yazyor ve göstermiyor