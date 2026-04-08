---
title: for...of
slug: Web/JavaScript/Reference/Statements/for...of
page-type: javascript-statement
browser-compat: javascript.statements.for_of
sidebar: jssidebar
---

Câu lệnh **`for...of`** thực thi một vòng lặp hoạt động trên một chuỗi giá trị lấy từ một [đối tượng iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol). Các đối tượng iterable bao gồm các instance của các built-in như {{jsxref("Array")}}, {{jsxref("String")}}, {{jsxref("TypedArray")}}, {{jsxref("Map")}}, {{jsxref("Set")}}, {{domxref("NodeList")}} (và các DOM collection khác), cũng như đối tượng {{jsxref("Functions/arguments", "arguments")}}, [generator](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Generator) được tạo ra bởi [generator function](/en-US/docs/Web/JavaScript/Reference/Statements/function*), và các iterable do người dùng tự định nghĩa.

{{InteractiveExample("JavaScript Demo: for...of statement")}}

```js interactive-example
const array = ["a", "b", "c"];

for (const element of array) {
  console.log(element);
}

// Expected output: "a"
// Expected output: "b"
// Expected output: "c"
```

## Cú pháp

```js-nolint
for (variable of iterable)
  statement
```

- `variable`
  - : Nhận một giá trị từ chuỗi trong mỗi lần lặp. Có thể là khai báo với [`const`](/en-US/docs/Web/JavaScript/Reference/Statements/const), [`let`](/en-US/docs/Web/JavaScript/Reference/Statements/let), [`var`](/en-US/docs/Web/JavaScript/Reference/Statements/var), [`using`](/en-US/docs/Web/JavaScript/Reference/Statements/using), [`await using`](/en-US/docs/Web/JavaScript/Reference/Statements/await_using), hoặc đích [gán](/en-US/docs/Web/JavaScript/Reference/Operators/Assignment) (ví dụ: biến đã khai báo trước đó, thuộc tính đối tượng, hoặc [mẫu destructuring](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring)). Các biến được khai báo bằng `var` không cục bộ với vòng lặp, tức là chúng nằm trong cùng phạm vi với vòng lặp `for...of`.
- `iterable`
  - : Một đối tượng iterable. Nguồn của chuỗi giá trị mà vòng lặp hoạt động trên.
- `statement`
  - : Câu lệnh được thực thi trong mỗi lần lặp. Có thể tham chiếu đến `variable`. Bạn có thể sử dụng [câu lệnh block](/en-US/docs/Web/JavaScript/Reference/Statements/block) để thực thi nhiều câu lệnh.

## Mô tả

Vòng lặp `for...of` hoạt động trên các giá trị lấy từ một iterable lần lượt theo thứ tự. Mỗi thao tác của vòng lặp trên một giá trị được gọi là một _lần lặp_, và vòng lặp được gọi là _lặp qua iterable_. Mỗi lần lặp thực thi các câu lệnh có thể tham chiếu đến giá trị chuỗi hiện tại.

Khi vòng lặp `for...of` lặp qua một iterable, trước tiên nó gọi phương thức [`[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/iterator) của iterable, phương thức này trả về một [iterator](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterator_protocol), sau đó liên tục gọi phương thức [`next()`](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterator_protocol) của iterator kết quả để tạo ra chuỗi giá trị được gán cho `variable`.

Vòng lặp `for...of` kết thúc khi iterator đã hoàn thành (kết quả `next()` là đối tượng với `done: true`). Giống như các câu lệnh vòng lặp khác, bạn có thể sử dụng [câu lệnh điều khiển luồng](/en-US/docs/Web/JavaScript/Reference/Statements#control_flow) trong `statement`:

- {{jsxref("Statements/break", "break")}} dừng thực thi `statement` và đến câu lệnh đầu tiên sau vòng lặp.
- {{jsxref("Statements/continue", "continue")}} dừng thực thi `statement` và đến lần lặp tiếp theo của vòng lặp.

Nếu vòng lặp `for...of` kết thúc sớm (ví dụ: gặp câu lệnh `break` hoặc xảy ra lỗi), phương thức [`return()`](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterator_protocol) của iterator được gọi để thực hiện bất kỳ thao tác dọn dẹp nào.

Phần `variable` của `for...of` chấp nhận bất cứ thứ gì có thể đứng trước toán tử `=`. Bạn có thể dùng {{jsxref("Statements/const", "const")}} để khai báo biến miễn là nó không được tái gán trong thân vòng lặp (nó có thể thay đổi giữa các lần lặp, vì đó là hai biến riêng biệt). Nếu không, bạn có thể dùng {{jsxref("Statements/let", "let")}}.

```js
const iterable = [10, 20, 30];

for (let value of iterable) {
  value += 1;
  console.log(value);
}
// 11
// 21
// 31
```

> [!NOTE]
> Mỗi lần lặp tạo ra một biến mới. Việc tái gán biến trong thân vòng lặp không ảnh hưởng đến giá trị gốc trong iterable (một mảng, trong trường hợp này).

Các biến được khai báo bằng khai báo {{jsxref("Statements/using", "using")}} hoặc {{jsxref("Statements/await_using", "await using")}} được dispose sau mỗi lần lặp (và `await using` gây ra một `await` ngầm định ở cuối lần lặp). Tuy nhiên, nếu vòng lặp kết thúc sớm, bất kỳ giá trị nào còn lại trong iterator chưa được truy cập sẽ không được dispose (mặc dù giá trị hiện tại thì có).

```js
const resources = [dbConnection1, dbConnection2, dbConnection3];

for (using dbConnection of resources) {
  dbConnection.query("...");
  // dbConnection is disposed here
}
```

Bạn có thể dùng [destructuring](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring) để gán nhiều biến cục bộ, hoặc dùng accessor thuộc tính như `for (x.y of iterable)` để gán giá trị cho thuộc tính đối tượng.

Tuy nhiên, một quy tắc đặc biệt cấm sử dụng `async` làm tên biến. Đây là cú pháp không hợp lệ:

```js-nolint example-bad
let async;
for (async of [1, 2, 3]); // SyntaxError: The left-hand side of a for-of loop may not be 'async'.
```

Điều này nhằm tránh sự mơ hồ cú pháp với code hợp lệ `for (async of => {};;)`, đây là vòng lặp [`for`](/en-US/docs/Web/JavaScript/Reference/Statements/for).

Tương tự, nếu bạn dùng khai báo `using`, thì biến không thể được gọi là `of`:

```js-nolint example-bad
for (using of of []); // SyntaxError
```

Điều này nhằm tránh sự mơ hồ cú pháp với code hợp lệ `for (using of [])`, trước khi `using` được giới thiệu.

## Ví dụ

### Lặp qua Array

```js
const iterable = [10, 20, 30];

for (const value of iterable) {
  console.log(value);
}
// 10
// 20
// 30
```

### Lặp qua chuỗi

Các chuỗi [được lặp theo Unicode code point](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Symbol.iterator).

```js
const iterable = "boo";

for (const value of iterable) {
  console.log(value);
}
// "b"
// "o"
// "o"
```

### Lặp qua TypedArray

```js
const iterable = new Uint8Array([0x00, 0xff]);

for (const value of iterable) {
  console.log(value);
}
// 0
// 255
```

### Lặp qua Map

```js
const iterable = new Map([
  ["a", 1],
  ["b", 2],
  ["c", 3],
]);

for (const entry of iterable) {
  console.log(entry);
}
// ['a', 1]
// ['b', 2]
// ['c', 3]

for (const [key, value] of iterable) {
  console.log(value);
}
// 1
// 2
// 3
```

### Lặp qua Set

```js
const iterable = new Set([1, 1, 2, 2, 3, 3]);

for (const value of iterable) {
  console.log(value);
}
// 1
// 2
// 3
```

### Lặp qua đối tượng arguments

Bạn có thể lặp qua đối tượng {{jsxref("Functions/arguments", "arguments")}} để kiểm tra tất cả các tham số được truyền vào một hàm.

```js
function foo() {
  for (const value of arguments) {
    console.log(value);
  }
}

foo(1, 2, 3);
// 1
// 2
// 3
```

### Lặp qua NodeList

Ví dụ sau thêm class `read` vào các đoạn văn là con trực tiếp của phần tử [`<article>`](/en-US/docs/Web/HTML/Reference/Elements/article) bằng cách lặp qua DOM collection [`NodeList`](/en-US/docs/Web/API/NodeList).

```js
const articleParagraphs = document.querySelectorAll("article > p");
for (const paragraph of articleParagraphs) {
  paragraph.classList.add("read");
}
```

### Lặp qua iterable do người dùng định nghĩa

Lặp qua đối tượng có phương thức `[Symbol.iterator]()` trả về một iterator tùy chỉnh:

```js
const iterable = {
  [Symbol.iterator]() {
    let i = 1;
    return {
      next() {
        if (i <= 3) {
          return { value: i++, done: false };
        }
        return { value: undefined, done: true };
      },
    };
  },
};

for (const value of iterable) {
  console.log(value);
}
// 1
// 2
// 3
```

Lặp qua đối tượng có phương thức generator `[Symbol.iterator]()`:

```js
const iterable = {
  *[Symbol.iterator]() {
    yield 1;
    yield 2;
    yield 3;
  },
};

for (const value of iterable) {
  console.log(value);
}
// 1
// 2
// 3
```

_Iterable iterator_ (các iterator có phương thức `[Symbol.iterator]()` trả về `this`) là một kỹ thuật khá phổ biến để làm cho các iterator có thể sử dụng được trong các cú pháp mong đợi iterable, chẳng hạn như `for...of`.

```js
let i = 1;

const iterator = {
  next() {
    if (i <= 3) {
      return { value: i++, done: false };
    }
    return { value: undefined, done: true };
  },
  [Symbol.iterator]() {
    return this;
  },
};

for (const value of iterator) {
  console.log(value);
}
// 1
// 2
// 3
```

### Lặp qua generator

```js
function* source() {
  yield 1;
  yield 2;
  yield 3;
}

const generator = source();

for (const value of generator) {
  console.log(value);
}
// 1
// 2
// 3
```

### Thoát sớm

Việc thực thi câu lệnh `break` trong vòng lặp đầu tiên khiến nó kết thúc sớm. Iterator chưa hoàn thành, vì vậy vòng lặp thứ hai sẽ tiếp tục từ nơi vòng lặp đầu tiên dừng lại.

```js
const source = [1, 2, 3];

const iterator = source[Symbol.iterator]();

for (const value of iterator) {
  console.log(value);
  if (value === 1) {
    break;
  }
  console.log("This string will not be logged.");
}
// 1

// Another loop using the same iterator
// picks up where the last loop left off.
for (const value of iterator) {
  console.log(value);
}
// 2
// 3

// The iterator is used up.
// This loop will execute no iterations.
for (const value of iterator) {
  console.log(value);
}
// [No output]
```

Các generator implement phương thức [`return()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Generator/return), khiến generator function trả về sớm khi vòng lặp kết thúc. Điều này làm cho các generator không thể tái sử dụng giữa các vòng lặp.

```js example-bad
function* source() {
  yield 1;
  yield 2;
  yield 3;
}

const generator = source();

for (const value of generator) {
  console.log(value);
  if (value === 1) {
    break;
  }
  console.log("This string will not be logged.");
}
// 1

// The generator is used up.
// This loop will execute no iterations.
for (const value of generator) {
  console.log(value);
}
// [No output]
```

### Sự khác biệt giữa for...of và for...in

Cả hai câu lệnh `for...in` và `for...of` đều lặp qua thứ gì đó. Sự khác biệt chính giữa chúng là ở những gì chúng lặp qua.

Câu lệnh {{jsxref("Statements/for...in", "for...in")}} lặp qua [các thuộc tính chuỗi có thể đếm được](/en-US/docs/Web/JavaScript/Guide/Enumerability_and_ownership_of_properties) của một đối tượng, trong khi câu lệnh `for...of` lặp qua các giá trị mà [đối tượng iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol) định nghĩa để được lặp qua.

Ví dụ sau cho thấy sự khác biệt giữa vòng lặp `for...of` và vòng lặp `for...in` khi được dùng với {{jsxref("Array")}}.

```js
Object.prototype.objCustom = function () {};
Array.prototype.arrCustom = function () {};

const iterable = [3, 5, 7];
iterable.foo = "hello";

for (const i in iterable) {
  console.log(i);
}
// "0", "1", "2", "foo", "arrCustom", "objCustom"

for (const i in iterable) {
  if (Object.hasOwn(iterable, i)) {
    console.log(i);
  }
}
// "0" "1" "2" "foo"

for (const i of iterable) {
  console.log(i);
}
// 3 5 7
```

Đối tượng `iterable` kế thừa các thuộc tính `objCustom` và `arrCustom` vì nó chứa cả `Object.prototype` và `Array.prototype` trong [chuỗi prototype](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain) của nó.

Vòng lặp `for...in` chỉ in các [thuộc tính có thể đếm được](/en-US/docs/Web/JavaScript/Guide/Enumerability_and_ownership_of_properties) của đối tượng `iterable`. Nó không in các _phần tử_ mảng `3`, `5`, `7` hay `"hello"` vì chúng không phải _thuộc tính_ — chúng là _giá trị_. Nó in các _chỉ số_ mảng cũng như `arrCustom` và `objCustom`, đây là các thuộc tính thực sự. Nếu bạn không chắc tại sao những thuộc tính này được lặp qua, có giải thích đầy đủ hơn về cách [lặp mảng và `for...in`](/en-US/docs/Web/JavaScript/Reference/Statements/for...in#array_iteration_and_for...in) hoạt động.

Vòng lặp thứ hai tương tự vòng đầu tiên, nhưng nó dùng {{jsxref("Object.hasOwn()")}} để kiểm tra xem thuộc tính có thể đếm được tìm thấy có phải là thuộc tính riêng của đối tượng, tức là không được kế thừa hay không. Nếu có, thuộc tính được in ra. Các thuộc tính `0`, `1`, `2` và `foo` được in vì chúng là thuộc tính riêng. Các thuộc tính `arrCustom` và `objCustom` không được in vì chúng được kế thừa.

Vòng lặp `for...of` lặp và in các _giá trị_ mà `iterable`, như một mảng (là [iterable](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Symbol.iterator)), định nghĩa để được lặp qua. Các _phần tử_ `3`, `5`, `7` của đối tượng được hiển thị, nhưng không có _thuộc tính_ nào của đối tượng.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Array.prototype.forEach()")}}
- {{jsxref("Map.prototype.forEach()")}}
- {{jsxref("Object.entries()")}}
