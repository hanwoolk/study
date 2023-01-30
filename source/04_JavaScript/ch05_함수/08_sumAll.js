function sumAll() {
  // arguments 배열에 실행시의 매개변수가 들어옴
  var result = 0;
  if (arguments.length == 0) {
    result = -999;
  } else if (arguments.length >= 1) {
    for (var i in arguments) {
      result += arguments[i];
    }
  }
  return result;
}
// console.log(sumAll());
// console.log(sumAll(1));
// console.log(sumAll(1, 2, 3, 4, 5));
// console.log(sumAll(1, 2, 3, 4, 5, 100, 10000));
