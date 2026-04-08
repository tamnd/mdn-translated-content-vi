---
title: "TypeError: already executing generator"
slug: Web/JavaScript/Reference/Errors/Already_executing_generator
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "TypeError: already executing generator" xảy ra khi một [generator](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Generator) được tiếp tục bằng một trong các phương thức của nó (chẳng hạn như {{jsxref("Generator/next", "next()")}}) trong khi đang thực thi thân hàm generator.

## Thông báo

```plain
TypeError: Generator is already running (V8-based)
TypeError: already executing generator (Firefox)
TypeError: Generator is executing (Safari)
```

## Loại lỗi

{{jsxref("TypeError")}}

## Nguyên nhân?

Các phương thức của generator, {{jsxref("Generator/next", "next()")}}, {{jsxref("Generator/return", "return()")}}, và {{jsxref("Generator/throw", "throw()")}}, được thiết kế để tiếp tục thực thi hàm generator khi nó đang tạm dừng sau biểu thức `yield` hoặc trước câu lệnh đầu tiên. Nếu một trong những phương thức này được gọi trong khi đang thực thi hàm generator, lỗi sẽ được ném ra. Nếu bạn muốn return hoặc throw bên trong hàm generator, hãy sử dụng câu lệnh {{jsxref("Statements/return", "return")}} hoặc câu lệnh {{jsxref("Statements/throw", "throw")}} tương ứng.

## Ví dụ

```js example-bad
let it;
function* getNumbers(times) {
  if (times <= 0) {
    it.throw(new Error("times must be greater than 0"));
  }
  for (let i = 0; i < times; i++) {
    yield i;
  }
}
it = getNumbers(3);
it.next();
```

```js example-good
let it;
function* getNumbers(times) {
  if (times <= 0) {
    throw new Error("times must be greater than 0");
  }
  for (let i = 0; i < times; i++) {
    yield i;
  }
}
it = getNumbers(3);
it.next(); // { value: 0, done: false }
```

## Xem thêm

- [Iterators and generators](/en-US/docs/Web/JavaScript/Guide/Iterators_and_generators)
- [Iteration protocols](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols)
- {{jsxref("Statements/function*", "function*")}}
- {{jsxref("Generator")}}
