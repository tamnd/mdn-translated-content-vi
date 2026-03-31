---
title: yield*
slug: Web/JavaScript/Reference/Operators/yield*
page-type: javascript-operator
browser-compat: javascript.operators.yield_star
sidebar: jssidebar
---

Toán tử **`yield*`** có thể được sử dụng trong các hàm generator (đồng bộ hoặc bất đồng bộ) để ủy quyền cho một đối tượng [iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol) khác, như {{jsxref("Generator")}}. Trong các hàm async generator, nó còn có thể được sử dụng để ủy quyền cho một đối tượng async iterable khác, như {{jsxref("AsyncGenerator")}}.

{{InteractiveExample("JavaScript Demo: yield* operator")}}

```js interactive-example
function* func1() {
  yield 42;
}

function* func2() {
  yield* func1();
}

const iterator = func2();

console.log(iterator.next().value);
// Expected output: 42
```

## Cú pháp

```js-nolint
yield* expression
```

### Tham số

- `expression` {{optional_inline}}
  - : Một đối tượng iterable.

### Giá trị trả về

Trả về giá trị được trả bởi iterator đó khi nó được đóng (khi `done` là `true`).

## Mô tả

Biểu thức `yield*` duyệt qua toán hạng và yield từng giá trị được trả bởi nó. Nó ủy quyền việc duyệt qua của generator hiện tại cho một iterator cơ bản — mà chúng ta sẽ gọi tương ứng là "generator" và "iterator". `yield*` đầu tiên lấy iterator từ toán hạng bằng cách gọi phương thức [`[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/iterator) của nó. Sau đó, mỗi lần phương thức `next()` của generator được gọi, `yield*` gọi phương thức `next()` của iterator, truyền đối số nhận được bởi phương thức `next()` của generator (luôn là `undefined` cho lần gọi đầu tiên), và yield cùng một result object như những gì được trả về từ phương thức `next()` của iterator. Nếu iterator result có `done: true`, thì biểu thức `yield*` dừng thực thi và trả về `value` của result đó.

Toán tử `yield*` cũng chuyển tiếp các phương thức {{jsxref("Generator/throw", "throw()")}} và {{jsxref("Generator/return", "return()")}} của generator hiện tại đến iterator cơ bản. Nếu generator hiện tại bị đóng sớm thông qua một trong các phương thức này, iterator cơ bản sẽ được thông báo. Nếu phương thức `throw()`/`return()` của generator được gọi, phương thức `throw()`/`return()` của iterator cơ bản sẽ được gọi với cùng đối số. Giá trị trả về của `throw()`/`return()` được xử lý như kết quả của phương thức `next()`, và nếu phương thức ném ra lỗi, ngoại lệ được lan truyền từ biểu thức `yield*`.

Nếu iterator cơ bản không có phương thức `return()`, biểu thức `yield*` trở thành câu lệnh {{jsxref("Statements/return", "return")}}, giống như gọi `return()` trên biểu thức {{jsxref("Operators/yield", "yield")}} đang bị treo.

Nếu iterator cơ bản không có phương thức `throw()`, điều này khiến `yield*` ném ra {{jsxref("TypeError")}} — nhưng trước khi ném lỗi, phương thức `return()` của iterator cơ bản sẽ được gọi nếu có.

## Ví dụ

### Ủy quyền cho generator khác

Trong code sau, các giá trị được yield bởi `g1()` được trả về từ các lần gọi `next()` giống như những giá trị được yield bởi `g2()`.

```js
function* g1() {
  yield 2;
  yield 3;
  yield 4;
}

function* g2() {
  yield 1;
  yield* g1();
  yield 5;
}

const gen = g2();

console.log(gen.next()); // {value: 1, done: false}
console.log(gen.next()); // {value: 2, done: false}
console.log(gen.next()); // {value: 3, done: false}
console.log(gen.next()); // {value: 4, done: false}
console.log(gen.next()); // {value: 5, done: false}
console.log(gen.next()); // {value: undefined, done: true}
```

### Các đối tượng iterable khác

Ngoài các đối tượng generator, `yield*` cũng có thể `yield` các loại iterable khác (ví dụ: mảng, chuỗi, hoặc đối tượng {{jsxref("Functions/arguments", "arguments")}}).

```js
function* g3(...args) {
  yield* [1, 2];
  yield* "34";
  yield* args;
}

const gen = g3(5, 6);

console.log(gen.next()); // {value: 1, done: false}
console.log(gen.next()); // {value: 2, done: false}
console.log(gen.next()); // {value: "3", done: false}
console.log(gen.next()); // {value: "4", done: false}
console.log(gen.next()); // {value: 5, done: false}
console.log(gen.next()); // {value: 6, done: false}
console.log(gen.next()); // {value: undefined, done: true}
```

### Giá trị của chính biểu thức yield\*

`yield*` là một biểu thức, không phải câu lệnh, vì vậy nó được đánh giá thành một giá trị.

```js
function* g4() {
  yield* [1, 2, 3];
  return "foo";
}

function* g5() {
  const g4ReturnValue = yield* g4();
  console.log(g4ReturnValue); // 'foo'
  return g4ReturnValue;
}

const gen = g5();

console.log(gen.next()); // {value: 1, done: false}
console.log(gen.next()); // {value: 2, done: false}
console.log(gen.next()); // {value: 3, done: false} done is false because g5 generator isn't finished, only g4
console.log(gen.next()); // {value: 'foo', done: true}
```

### Sử dụng với async generator

```js
async function* g1() {
  await Promise.resolve(0);
  yield "foo";
}

function* g2() {
  yield "bar";
}

async function* g3() {
  // Can use yield* on both async and sync iterators
  yield* g1();
  yield* g2();
}

const gen = g3();

console.log(await gen.next()); // {value: "foo", done: false}
console.log(await gen.next()); // {value: "bar", done: false}
console.log(await gen.next()); // {done: true}
```

### Chuyển tiếp phương thức

Các phương thức `next()`, `throw()`, và `return()` của generator hiện tại đều được chuyển tiếp đến iterator cơ bản.

```js
const iterable = {
  [Symbol.iterator]() {
    let count = 0;
    return {
      next(v) {
        console.log("next called with", v);
        count++;
        return { value: count, done: false };
      },
      return(v) {
        console.log("return called with", v);
        return { value: "iterable return value", done: true };
      },
      throw(v) {
        console.log("throw called with", v);
        return { value: "iterable thrown value", done: true };
      },
    };
  },
};

function* gf() {
  yield* iterable;
  return "gf return value";
}

const gen = gf();
console.log(gen.next(10));
// next called with undefined; the argument of the first next() call is always ignored
// { value: 1, done: false }
console.log(gen.next(20));
// next called with 20
// { value: 2, done: false }
console.log(gen.return(30));
// return called with 30
// { value: 'iterable return value', done: true }
console.log(gen.next(40));
// { value: undefined, done: true }; gen is already closed

const gen2 = gf();
console.log(gen2.next(10));
// next called with undefined
// { value: 1, done: false }
console.log(gen2.throw(50));
// throw called with 50
// { value: 'gf return value', done: true }
console.log(gen.next(60));
// { value: undefined, done: true }; gen is already closed
```

Nếu phương thức `return()`/`throw()` của iterator cơ bản trả về `done: false`, generator hiện tại tiếp tục thực thi và `yield*` tiếp tục ủy quyền cho iterator cơ bản.

```js
const iterable = {
  [Symbol.iterator]() {
    let count = 0;
    return {
      next(v) {
        console.log("next called with", v);
        count++;
        return { value: count, done: false };
      },
      return(v) {
        console.log("return called with", v);
        return { value: "iterable return value", done: false };
      },
    };
  },
};

function* gf() {
  yield* iterable;
  return "gf return value";
}

const gen = gf();
console.log(gen.next(10));
// next called with undefined
// { value: 1, done: false }
console.log(gen.return(20));
// return called with 20
// { value: 'iterable return value', done: false }
console.log(gen.next(30));
// { value: 2, done: false }; gen is not closed
```

Nếu iterator cơ bản không có phương thức `throw()` và `throw()` của generator được gọi, `yield*` sẽ ném ra lỗi.

```js
const iterable = {
  [Symbol.iterator]() {
    let count = 0;
    return {
      next(v) {
        count++;
        return { value: count, done: false };
      },
    };
  },
};

function* gf() {
  yield* iterable;
  return "gf return value";
}

const gen = gf();
gen.next(); // First next() starts the yield* expression
gen.throw(20); // TypeError: The iterator does not provide a 'throw' method.
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Iteration protocols](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols)
- {{jsxref("Statements/function*", "function*")}}
- [`function*` expression](/en-US/docs/Web/JavaScript/Reference/Operators/function*)
- {{jsxref("Operators/yield", "yield")}}
