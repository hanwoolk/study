class Person {
  constructor(name, first, second) {
    // 생성자 이름은 무조건 constructor
    this.name = name;
    this.first = first;
    this.second = second;
  }
  // constructor(name){ // 오버로딩 안됨!!!!!!!!!
  //   this.name = name;  // 오버로딩 안됨!!!!!!!!!
  //   this.first = 100;// 오버로딩 안됨!!!!!!!!!
  //   this.second = 100;// 오버로딩 안됨!!!!!!!!!
  // }
  sum() {
    //class 안에서만 fuction 안씀
    return this.first + this.second;
  }
} // class
var kim = new Person("김길동", 100, 60);
console.log("홍길동의 sum : ", kim.sum());

class PersonPlus extends Person {
  constructor(name, first, second, third) {
    // 생성자 함수는 무조건 constructor
    super(name, first, second); //부모클래스 생성자 함수, super는 생성자 함수 내에서만 사용
    this.third = third;
  }
  sum() {
    return this.first + this.second + this.third;
  }
  avg() {
    return this.sum() / 3;
  }
}
var son = new PersonPlus("손흥민", 100, 100, 100);
console.log("손 sum : ", son.sum());
console.log("손 avg : ", son.avg());
