---
title: Rest parameters
slug: Web/JavaScript/Reference/Functions/rest_parameters
page-type: javascript-language-feature
browser-compat: javascript.functions.rest_parameters
sidebar: jssidebar
---

Cú pháp **rest parameter** (tham số rest) cho phép một hàm chấp nhận số lượng đối số không xác định dưới dạng mảng, cung cấp một cách để biểu diễn [hàm variadic](https://en.wikipedia.org/wiki/Variadic_function) trong JavaScript.

{{InteractiveExample("JavaScript Demo: Rest parameters", "taller")}}

```js interactive-example
function sum(...theArgs) {
  let total = 0;
  for (const arg of theArgs) {
    total += arg;
  }
  return total;
}

console.log(sum(1, 2, 3));
// Expected output: 6

console.log(sum(1, 2, 3, 4));
// Expected output: 10
```

## Cú pháp

```js-nolint
function f(a, b, ...theArgs) {
  // …
}
```

Có một số hạn chế cú pháp bổ sung:

- Một định nghĩa hàm chỉ có thể có một rest parameter.
- Rest parameter phải là tham số cuối cùng trong định nghĩa hàm.
- [Trailing commas](/en-US/docs/Web/JavaScript/Reference/Trailing_commas) không được phép sau rest parameter.
- Rest parameter không thể có [giá trị mặc định](/en-US/docs/Web/JavaScript/Reference/Functions/Default_parameters).

## Mô tả

Tham số cuối cùng của định nghĩa hàm có thể được đặt tiền tố `...` (ba ký tự U+002E FULL STOP), sẽ khiến tất cả các tham số còn lại (do người dùng cung cấp) được đặt trong một đối tượng [`Array`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array).

```js
function myFun(a, b, ...manyMoreArgs) {
  console.log("a", a);
  console.log("b", b);
  console.log("manyMoreArgs", manyMoreArgs);
}

myFun("one", "two", "three", "four", "five", "six");

// Console Output:
// a, one
// b, two
// manyMoreArgs, ["three", "four", "five", "six"]
```

Rest parameter có thể được [destructure](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring), cho phép bạn bỏ qua các vị trí tham số nhất định.

```js
function ignoreFirst(...[, b, c]) {
  return b + c;
}
```

Tuy nhiên, tất cả những điều sau đều là lỗi cú pháp:

```js-nolint example-bad
function wrong1(...one, ...wrong) {}
function wrong2(...wrong, arg2, arg3) {}
function wrong3(...wrong,) {}
function wrong4(...wrong = []) {}
```

Rest parameter không được tính vào thuộc tính [`length`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/length) của hàm.

### Sự khác biệt giữa rest parameter và đối tượng arguments

Có bốn sự khác biệt chính giữa rest parameter và đối tượng {{jsxref("Functions/arguments", "arguments")}}:

- Đối tượng `arguments` **không phải là mảng thực**, trong khi rest parameter là các instance {{jsxref("Array")}}, có nghĩa là các phương thức như {{jsxref("Array/sort", "sort()")}}, {{jsxref("Array/map", "map()")}}, {{jsxref("Array/forEach", "forEach()")}} hay {{jsxref("Array/pop", "pop()")}} có thể được áp dụng trực tiếp trên nó.
- Đối tượng `arguments` có thuộc tính [`callee`](/en-US/docs/Web/JavaScript/Reference/Functions/arguments/callee) bổ sung (không còn được khuyến nghị).
- Trong một hàm không nghiêm ngặt với các tham số đơn giản, đối tượng `arguments` [đồng bộ chỉ số với giá trị tham số](/en-US/docs/Web/JavaScript/Reference/Functions/arguments#assigning_to_indices). Mảng rest parameter không bao giờ cập nhật giá trị của nó khi các tham số được đặt tên được gán lại.
- Rest parameter gói tất cả các tham số _bổ sung_ vào một mảng đơn, nhưng không chứa bất kỳ đối số được đặt tên nào được định nghĩa _trước_ `...restParam`. Đối tượng `arguments` chứa tất cả các tham số — bao gồm các tham số trong mảng `...restParam` — được gói vào một đối tượng giống mảng.

## Ví dụ

### Sử dụng rest parameter

Trong ví dụ này, đối số đầu tiên được ánh xạ tới `a` và thứ hai tới `b`, vì vậy các đối số được đặt tên này được sử dụng như bình thường.

Tuy nhiên, đối số thứ ba, `manyMoreArgs`, sẽ là một mảng chứa đối số thứ ba, thứ tư, thứ năm, thứ sáu, …, thứ n — bao nhiêu đối số tùy theo người dùng chỉ định.

```js
function myFun(a, b, ...manyMoreArgs) {
  console.log("a", a);
  console.log("b", b);
  console.log("manyMoreArgs", manyMoreArgs);
}

myFun("one", "two", "three", "four", "five", "six");

// a, "one"
// b, "two"
// manyMoreArgs, ["three", "four", "five", "six"] <-- an array
```

Bên dưới, ngay cả khi chỉ có một giá trị, đối số cuối cùng vẫn được đặt vào một mảng.

```js
// Using the same function definition from example above

myFun("one", "two", "three");

// a, "one"
// b, "two"
// manyMoreArgs, ["three"] <-- an array with just one value
```

Bên dưới, đối số thứ ba không được cung cấp, nhưng `manyMoreArgs` vẫn là một mảng (mặc dù là mảng trống).

```js
// Using the same function definition from example above

myFun("one", "two");

// a, "one"
// b, "two"
// manyMoreArgs, [] <-- still an array
```

Bên dưới, chỉ có một đối số được cung cấp, vì vậy `b` nhận giá trị mặc định `undefined`, nhưng `manyMoreArgs` vẫn là một mảng trống.

```js
// Using the same function definition from example above

myFun("one");

// a, "one"
// b, undefined
// manyMoreArgs, [] <-- still an array
```

### Độ dài đối số

Vì `theArgs` là một mảng, số lượng phần tử của nó được cho bởi thuộc tính {{jsxref("Array/length", "length")}}. Nếu tham số duy nhất của hàm là rest parameter, `restParams.length` sẽ bằng [`arguments.length`](/en-US/docs/Web/JavaScript/Reference/Functions/arguments/length).

```js
function fun1(...theArgs) {
  console.log(theArgs.length);
}

fun1(); // 0
fun1(5); // 1
fun1(5, 6, 7); // 3
```

### Sử dụng rest parameter kết hợp với tham số thông thường

Trong ví dụ tiếp theo, rest parameter được dùng để thu thập tất cả các tham số sau tham số đầu tiên vào một mảng. Mỗi giá trị tham số được thu thập vào mảng sau đó được nhân với tham số đầu tiên, và mảng được trả về:

```js
function multiply(multiplier, ...theArgs) {
  return theArgs.map((element) => multiplier * element);
}

const arr = multiply(2, 15, 25, 42);
console.log(arr); // [30, 50, 84]
```

### Từ arguments sang mảng

Các phương thức {{jsxref("Array")}} có thể được sử dụng trên rest parameter, nhưng không phải trên đối tượng `arguments`:

```js
function sortRestArgs(...theArgs) {
  const sortedArgs = theArgs.sort();
  return sortedArgs;
}

console.log(sortRestArgs(5, 3, 7, 1)); // 1, 3, 5, 7

function sortArguments() {
  const sortedArgs = arguments.sort();
  return sortedArgs; // this will never happen
}

console.log(sortArguments(5, 3, 7, 1));
// throws a TypeError (arguments.sort is not a function)
```

Rest parameter được giới thiệu để giảm code boilerplate thường được dùng để chuyển đổi một tập hợp đối số thành mảng.

Trước rest parameter, `arguments` cần được chuyển đổi sang mảng thông thường trước khi gọi các phương thức mảng trên chúng:

```js
function fn(a, b) {
  const normalArray = Array.prototype.slice.call(arguments);
  // — or —
  const normalArray2 = [].slice.call(arguments);
  // — or —
  const normalArrayFrom = Array.from(arguments);

  const first = normalArray.shift(); // OK, gives the first argument
  const firstBad = arguments.shift(); // ERROR (arguments is not a normal array)
}
```

Bây giờ, bạn có thể dễ dàng truy cập vào mảng thông thường bằng cách sử dụng rest parameter:

```js
function fn(...args) {
  const normalArray = args;
  const first = normalArray.shift(); // OK, gives the first argument
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Functions](/en-US/docs/Web/JavaScript/Guide/Functions)
- [Functions](/en-US/docs/Web/JavaScript/Reference/Functions)
- [Spread syntax (`...`)](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax)
- [Default parameters](/en-US/docs/Web/JavaScript/Reference/Functions/Default_parameters)
- {{jsxref("Functions/arguments", "arguments")}}
- {{jsxref("Array")}}
