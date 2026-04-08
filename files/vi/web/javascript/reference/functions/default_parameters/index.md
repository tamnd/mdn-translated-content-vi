---
title: Default parameters
slug: Web/JavaScript/Reference/Functions/Default_parameters
page-type: javascript-language-feature
browser-compat: javascript.functions.default_parameters
sidebar: jssidebar
---

**Default function parameters** (tham số mặc định của hàm) cho phép các tham số được đặt tên được khởi tạo với giá trị mặc định nếu không có giá trị hoặc `undefined` được truyền vào.

{{InteractiveExample("JavaScript Demo: Default parameters")}}

```js interactive-example
function multiply(a, b = 1) {
  return a * b;
}

console.log(multiply(5, 2));
// Expected output: 10

console.log(multiply(5));
// Expected output: 5
```

## Cú pháp

```js-nolint
function fnName(param1 = defaultValue1, /* …, */ paramN = defaultValueN) {
  // …
}
```

## Mô tả

Trong JavaScript, các tham số hàm mặc định là {{jsxref("undefined")}}. Tuy nhiên, thường hữu ích khi đặt một giá trị mặc định khác. Đây là lúc tham số mặc định có thể giúp ích.

Trong ví dụ sau, nếu không có giá trị nào được cung cấp cho `b` khi `multiply` được gọi, giá trị của `b` sẽ là `undefined` khi đánh giá `a * b` và `multiply` sẽ trả về `NaN`.

```js
function multiply(a, b) {
  return a * b;
}

multiply(5, 2); // 10
multiply(5); // NaN !
```

Trước đây, chiến lược chung để đặt giá trị mặc định là kiểm tra giá trị tham số trong thân hàm và gán một giá trị nếu chúng là `undefined`. Trong ví dụ sau, `b` được đặt thành `1` nếu `multiply` được gọi chỉ với một đối số:

```js
function multiply(a, b) {
  b = typeof b !== "undefined" ? b : 1;
  return a * b;
}

multiply(5, 2); // 10
multiply(5); // 5
```

Với tham số mặc định, các kiểm tra trong thân hàm không còn cần thiết. Bây giờ, bạn có thể gán `1` là giá trị mặc định cho `b` trong tiêu đề hàm:

```js
function multiply(a, b = 1) {
  return a * b;
}

multiply(5, 2); // 10
multiply(5); // 5
multiply(5, undefined); // 5
```

Các tham số vẫn được đặt từ trái sang phải, ghi đè các tham số mặc định ngay cả khi có các tham số sau không có giá trị mặc định.

```js
function f(x = 1, y) {
  return [x, y];
}

f(); // [1, undefined]
f(2); // [2, undefined]
```

> [!NOTE]
> Tham số mặc định đầu tiên và tất cả các tham số sau nó sẽ không đóng góp vào [`length`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/length) của hàm.

Các bộ khởi tạo tham số mặc định tồn tại trong phạm vi riêng của chúng, là cha của phạm vi được tạo cho thân hàm.

Điều này có nghĩa là các tham số trước đó có thể được tham chiếu trong các bộ khởi tạo của các tham số sau. Tuy nhiên, các hàm và biến được khai báo trong thân hàm không thể được tham chiếu từ các bộ khởi tạo giá trị tham số mặc định; cố gắng làm vậy sẽ ném ra {{jsxref("ReferenceError")}} runtime. Điều này cũng bao gồm các biến được khai báo với [`var`](/en-US/docs/Web/JavaScript/Reference/Statements/var) trong thân hàm.

Ví dụ, hàm sau sẽ ném ra `ReferenceError` khi được gọi, vì giá trị tham số mặc định không có quyền truy cập vào phạm vi con của thân hàm:

```js example-bad
function f(a = go()) {
  function go() {
    return ":P";
  }
}

f(); // ReferenceError: go is not defined
```

Hàm này sẽ in giá trị của tham số `a`, vì biến `var a` chỉ được hoisted lên đầu phạm vi được tạo cho thân hàm, không phải phạm vi cha được tạo cho danh sách tham số, vì vậy giá trị của nó không hiển thị với `b`.

```js example-bad
function f(a, b = () => console.log(a)) {
  var a = 1;
  b();
}

f(); // undefined
f(5); // 5
```

Tham số mặc định cho phép bất kỳ biểu thức nào, nhưng bạn không thể sử dụng {{jsxref("Operators/await", "await")}} hay {{jsxref("Operators/yield", "yield")}} sẽ tạm dừng việc đánh giá biểu thức mặc định. Tham số phải được khởi tạo _đồng bộ_.

```js example-bad
async function f(a = await Promise.resolve(1)) {
  return a;
}
```

> [!NOTE]
> Vì tham số mặc định được đánh giá khi hàm được gọi, không phải khi hàm được định nghĩa, tính hợp lệ của các toán tử `await` và `yield` phụ thuộc vào chính hàm đó, không phải hàm bao quanh nó. Ví dụ, nếu hàm hiện tại không phải là `async`, `await` sẽ được phân tích cú pháp như một định danh và tuân theo [các quy tắc cú pháp định danh](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#identifiers) thông thường, ngay cả khi hàm này được lồng trong một hàm `async`.

## Ví dụ

### Truyền undefined so với các giá trị falsy khác

Trong lần gọi thứ hai trong ví dụ này, ngay cả khi đối số đầu tiên được đặt rõ ràng là `undefined` (mặc dù không phải `null` hay các giá trị {{Glossary("falsy")}} khác), giá trị của đối số `num` vẫn là giá trị mặc định.

```js
function test(num = 1) {
  console.log(typeof num);
}

test(); // 'number' (num is set to 1)
test(undefined); // 'number' (num is set to 1 too)

// test with other falsy values:
test(""); // 'string' (num is set to '')
test(null); // 'object' (num is set to null)
```

### Được đánh giá tại thời điểm gọi

Đối số mặc định được đánh giá tại _thời điểm gọi_. Không giống như Python (ví dụ), một đối tượng mới được tạo ra mỗi lần hàm được gọi.

```js
function append(value, array = []) {
  array.push(value);
  return array;
}

append(1); // [1]
append(2); // [2], not [1, 2]
```

Điều này thậm chí áp dụng cho cả hàm và biến:

```js
function callSomething(thing = something()) {
  return thing;
}

let numberOfTimesCalled = 0;
function something() {
  numberOfTimesCalled += 1;
  return numberOfTimesCalled;
}

callSomething(); // 1
callSomething(); // 2
```

### Các tham số trước có thể sử dụng cho tham số mặc định sau

Các tham số được định nghĩa trước (bên trái) có thể sử dụng cho các tham số mặc định sau:

```js
function greet(name, greeting, message = `${greeting} ${name}`) {
  return [name, greeting, message];
}

greet("David", "Hi"); // ["David", "Hi", "Hi David"]
greet("David", "Hi", "Happy Birthday!"); // ["David", "Hi", "Happy Birthday!"]
```

Chức năng này có thể được xấp xỉ như thế này, cho thấy có bao nhiêu trường hợp biên được xử lý:

```js
function go() {
  return ":P";
}

function withDefaults(
  a,
  b = 5,
  c = b,
  d = go(),
  e = this,
  f = arguments,
  g = this.value,
) {
  return [a, b, c, d, e, f, g];
}

function withoutDefaults(a, b, c, d, e, f, g) {
  switch (arguments.length) {
    case 0:
    case 1:
      b = 5;
    case 2:
      c = b;
    case 3:
      d = go();
    case 4:
      e = this;
    case 5:
      f = arguments;
    case 6:
      g = this.value;
  }
  return [a, b, c, d, e, f, g];
}

withDefaults.call({ value: "=^_^=" });
// [undefined, 5, 5, ":P", {value:"=^_^="}, arguments, "=^_^="]

withoutDefaults.call({ value: "=^_^=" });
// [undefined, 5, 5, ":P", {value:"=^_^="}, arguments, "=^_^="]
```

### Tham số destructure với gán giá trị mặc định

Bạn có thể sử dụng gán giá trị mặc định với cú pháp [destructuring](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring).

Một cách phổ biến để làm điều đó là đặt một đối tượng/mảng rỗng làm giá trị mặc định cho tham số destructure; ví dụ: `[x = 1, y = 2] = []`. Điều này cho phép truyền không có gì cho hàm mà vẫn có các giá trị đó được điền trước:

```js
function preFilledArray([x = 1, y = 2] = []) {
  return x + y;
}

preFilledArray(); // 3
preFilledArray([]); // 3
preFilledArray([2]); // 4
preFilledArray([2, 3]); // 5

// Works the same for objects:
function preFilledObject({ z = 3 } = {}) {
  return z;
}

preFilledObject(); // 3
preFilledObject({}); // 3
preFilledObject({ z: 2 }); // 2
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Functions](/en-US/docs/Web/JavaScript/Guide/Functions)
- [Functions](/en-US/docs/Web/JavaScript/Reference/Functions)
- [Rest parameters](/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters)
- [Nullish coalescing operator (`??`)](/en-US/docs/Web/JavaScript/Reference/Operators/Nullish_coalescing)
