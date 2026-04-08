---
title: function*
slug: Web/JavaScript/Reference/Statements/function*
page-type: javascript-statement
browser-compat: javascript.statements.generator_function
sidebar: jssidebar
---

Khai báo **`function*`** tạo ra một {{Glossary("binding")}} của một generator function mới với tên đã cho. Một generator function có thể thoát ra và sau đó được vào lại, với ngữ cảnh của nó ({{Glossary("binding", "bindings")}} biến) được lưu trữ qua các lần vào lại.

Bạn cũng có thể định nghĩa generator function bằng cách sử dụng [`function*` expression](/en-US/docs/Web/JavaScript/Reference/Operators/function*).

{{InteractiveExample("JavaScript Demo: function* declaration")}}

```js interactive-example
function* generator(i) {
  yield i;
  yield i + 10;
}

const gen = generator(10);

console.log(gen.next().value);
// Expected output: 10

console.log(gen.next().value);
// Expected output: 20
```

## Cú pháp

```js-nolint
function* name(param0) {
  statements
}
function* name(param0, param1) {
  statements
}
function* name(param0, param1, /* …, */ paramN) {
  statements
}
```

> [!NOTE]
> Generator function không có dạng arrow function tương ứng.

> [!NOTE]
> `function` và `*` là các token riêng biệt, vì vậy chúng có thể được phân cách bởi [khoảng trắng hoặc ký tự kết thúc dòng](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#white_space).

### Tham số

- `name`
  - : Tên của function.
- `param` {{optional_inline}}
  - : Tên của tham số chính thức cho function. Về cú pháp của tham số, xem [tài liệu tham khảo Functions](/en-US/docs/Web/JavaScript/Guide/Functions#function_parameters).
- `statements` {{optional_inline}}
  - : Các câu lệnh tạo nên phần thân của function.

## Mô tả

Khai báo `function*` tạo ra một đối tượng {{jsxref("GeneratorFunction")}}. Mỗi lần generator function được gọi, nó trả về một đối tượng {{jsxref("Generator")}} mới, tuân theo [iterator protocol](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterator_protocol). Quá trình thực thi của generator function bị _tạm dừng_ tại một vị trí nào đó, ban đầu là ở chính đầu phần thân function. Generator function có thể được gọi nhiều lần để tạo ra nhiều generator đồng thời; mỗi generator duy trì [execution context](/en-US/docs/Web/JavaScript/Reference/Execution_model#stack_and_execution_contexts) riêng của nó cho generator function và có thể được thực thi độc lập.

Generator cho phép luồng điều khiển hai chiều: luồng điều khiển có thể chuyển giữa generator function (callee) và caller bao nhiêu lần tùy thích. Luồng điều khiển có thể đi từ caller đến callee bằng cách gọi các phương thức của generator: [`next()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Generator/next), [`throw()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Generator/throw), và [`return()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Generator/return). Luồng điều khiển có thể đi từ callee đến caller bằng cách thoát function bình thường bằng `return` hoặc `throw` hoặc thực thi hết tất cả câu lệnh, hoặc bằng cách sử dụng biểu thức `yield` và `yield*`.

Khi phương thức [`next()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Generator/next) của generator được gọi, phần thân của generator function được thực thi cho đến khi xảy ra một trong những điều sau:

- Một biểu thức {{jsxref("Operators/yield", "yield")}}. Trong trường hợp này, phương thức `next()` trả về một đối tượng có thuộc tính `value` chứa giá trị được yield và thuộc tính `done` luôn là `false`. Lần tiếp theo `next()` được gọi, biểu thức `yield` sẽ được đánh giá thành giá trị được truyền vào `next()`.
- Một {{jsxref("Operators/yield*", "yield*")}}, ủy quyền cho một iterator khác. Trong trường hợp này, lần gọi này và bất kỳ lần gọi nào trong tương lai đến `next()` trên generator đều giống như gọi `next()` trên iterator được ủy quyền, cho đến khi iterator được ủy quyền kết thúc.
- Một câu lệnh {{jsxref("Statements/return", "return")}} (không bị chặn bởi {{jsxref("Statements/try...catch", "try...catch...finally")}}), hoặc kết thúc luồng điều khiển ngầm định là `return undefined`. Trong trường hợp này, generator kết thúc, và phương thức `next()` trả về một đối tượng có thuộc tính `value` chứa giá trị được trả về và thuộc tính `done` luôn là `true`. Bất kỳ lần gọi `next()` nào tiếp theo đều không có tác dụng và luôn trả về `{ value: undefined, done: true }`.
- Một lỗi được ném ra bên trong function, thông qua câu lệnh {{jsxref("Statements/throw", "throw")}} hoặc một ngoại lệ không được xử lý. Phương thức `next()` ném lỗi đó, và generator kết thúc. Bất kỳ lần gọi `next()` nào tiếp theo đều không có tác dụng và luôn trả về `{ value: undefined, done: true }`.

Khi phương thức [`throw()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Generator/throw) của generator được gọi, nó hoạt động như thể câu lệnh `throw` được chèn vào thân của generator tại vị trí hiện tại đang bị tạm dừng. Tương tự, khi phương thức [`return()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Generator/return) của generator được gọi, nó hoạt động như thể câu lệnh `return` được chèn vào thân của generator tại vị trí hiện tại đang bị tạm dừng. Cả hai phương thức thường kết thúc generator, trừ khi generator function bắt sự kiện hoàn thành qua {{jsxref("Statements/try...catch", "try...catch...finally")}}.

Generator từng là một mô hình lập trình bất đồng bộ, tránh [Callback Hell](https://medium.com/@raihan_tazdid/callback-hell-in-javascript-all-you-need-to-know-296f7f5d3c1) bằng cách đạt được [Inversion of Control](https://en.wikipedia.org/wiki/Inversion_of_control). Ngày nay, trường hợp sử dụng này được giải quyết với mô hình [async function](/en-US/docs/Web/JavaScript/Reference/Statements/async_function) đơn giản hơn và đối tượng {{jsxref("Promise")}}. Tuy nhiên, generator vẫn hữu ích cho nhiều tác vụ khác, chẳng hạn như định nghĩa [iterator](/en-US/docs/Web/JavaScript/Guide/Iterators_and_generators) theo cách đơn giản.

Khai báo `function*` hoạt động tương tự như khai báo {{jsxref("Statements/function", "function")}} — chúng được [hoisted](/en-US/docs/Glossary/Hoisting) lên đầu phạm vi của chúng và có thể được gọi ở bất kỳ đâu trong phạm vi đó, và chúng chỉ có thể được khai báo lại trong một số ngữ cảnh nhất định.

## Ví dụ

### Ví dụ cơ bản

```js
function* idMaker() {
  let index = 0;
  while (true) {
    yield index++;
  }
}

const gen = idMaker();

console.log(gen.next().value); // 0
console.log(gen.next().value); // 1
console.log(gen.next().value); // 2
console.log(gen.next().value); // 3
// …
```

### Ví dụ với yield\*

```js
function* anotherGenerator(i) {
  yield i + 1;
  yield i + 2;
  yield i + 3;
}

function* generator(i) {
  yield i;
  yield* anotherGenerator(i);
  yield i + 10;
}

const gen = generator(10);

console.log(gen.next().value); // 10
console.log(gen.next().value); // 11
console.log(gen.next().value); // 12
console.log(gen.next().value); // 13
console.log(gen.next().value); // 20
```

### Truyền đối số vào Generator

```js
function* logGenerator() {
  console.log(0);
  console.log(1, yield);
  console.log(2, yield);
  console.log(3, yield);
}

const gen = logGenerator();

// lần gọi next đầu tiên thực thi từ đầu function
// đến câu lệnh yield đầu tiên
gen.next(); // 0
gen.next("pretzel"); // 1 pretzel
gen.next("california"); // 2 california
gen.next("mayonnaise"); // 3 mayonnaise
```

### Câu lệnh return trong generator

```js
function* yieldAndReturn() {
  yield "Y";
  return "R";
  yield "unreachable";
}

const gen = yieldAndReturn();
console.log(gen.next()); // { value: "Y", done: false }
console.log(gen.next()); // { value: "R", done: true }
console.log(gen.next()); // { value: undefined, done: true }
```

### Generator là thuộc tính của object

```js
const someObj = {
  *generator() {
    yield "a";
    yield "b";
  },
};

const gen = someObj.generator();

console.log(gen.next()); // { value: 'a', done: false }
console.log(gen.next()); // { value: 'b', done: false }
console.log(gen.next()); // { value: undefined, done: true }
```

### Generator là phương thức của object

```js
class Foo {
  *generator() {
    yield 1;
    yield 2;
    yield 3;
  }
}

const f = new Foo();
const gen = f.generator();

console.log(gen.next()); // { value: 1, done: false }
console.log(gen.next()); // { value: 2, done: false }
console.log(gen.next()); // { value: 3, done: false }
console.log(gen.next()); // { value: undefined, done: true }
```

### Generator là computed property

```js
class Foo {
  *[Symbol.iterator]() {
    yield 1;
    yield 2;
  }
}

const SomeObj = {
  *[Symbol.iterator]() {
    yield "a";
    yield "b";
  },
};

console.log(Array.from(new Foo())); // [ 1, 2 ]
console.log(Array.from(SomeObj)); // [ 'a', 'b' ]
```

### Generator không thể được khởi tạo bằng new

```js
function* f() {}
const obj = new f(); // throws "TypeError: f is not a constructor
```

### Ví dụ về generator

```js
function* powers(n) {
  // Vòng lặp vô hạn để tạo ra
  for (let current = n; ; current *= n) {
    yield current;
  }
}

for (const power of powers(2)) {
  // Kiểm soát generator
  if (power > 32) {
    break;
  }
  console.log(power);
  // 2
  // 4
  // 8
  // 16
  // 32
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Functions](/en-US/docs/Web/JavaScript/Guide/Functions)
- Hướng dẫn [Iterators and generators](/en-US/docs/Web/JavaScript/Guide/Iterators_and_generators)
- [Functions](/en-US/docs/Web/JavaScript/Reference/Functions)
- {{jsxref("GeneratorFunction")}}
- [`function*` expression](/en-US/docs/Web/JavaScript/Reference/Operators/function*)
- {{jsxref("Statements/function", "function")}}
- {{jsxref("Statements/async_function", "async function")}}
- {{jsxref("Statements/async_function*", "async function*")}}
- [Iteration protocols](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols)
- {{jsxref("Operators/yield", "yield")}}
- {{jsxref("Operators/yield*", "yield*")}}
- {{jsxref("Generator")}}
- [Regenerator](https://github.com/facebook/regenerator) trên GitHub
- Bài thuyết trình [Promises and Generators: control flow utopia](https://youtu.be/qbKWsbJ76-s) bởi Forbes Lindesay tại JSConf (2013)
- [Task.js](https://github.com/mozilla/task.js) trên GitHub
- [You Don't Know JS: Async & Performance, Ch.4: Generators](https://github.com/getify/You-Dont-Know-JS/blob/1st-ed/async%20%26%20performance/ch4.md) bởi Kyle Simpson
