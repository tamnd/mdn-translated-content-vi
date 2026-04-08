---
title: async function*
slug: Web/JavaScript/Reference/Statements/async_function*
page-type: javascript-statement
browser-compat: javascript.statements.async_generator_function
sidebar: jssidebar
---

Khai báo **`async function*`** tạo ra một {{Glossary("binding")}} của một async generator function mới với tên đã cho.

Bạn cũng có thể định nghĩa async generator function bằng cách sử dụng [`async function*` expression](/en-US/docs/Web/JavaScript/Reference/Operators/async_function*).

{{InteractiveExample("JavaScript Demo: async function* declaration", "taller")}}

```js interactive-example
async function* foo() {
  yield await Promise.resolve("a");
  yield await Promise.resolve("b");
  yield await Promise.resolve("c");
}

let str = "";

async function generate() {
  for await (const val of foo()) {
    str += val;
  }
  console.log(str);
}

generate();
// Expected output: "abc"
```

## Cú pháp

```js-nolint
async function* name(param0) {
  statements
}
async function* name(param0, param1) {
  statements
}
async function* name(param0, param1, /* …, */ paramN) {
  statements
}
```

> [!NOTE]
> Async generator function không có dạng arrow function tương ứng.

> [!NOTE]
> `function` và `*` là các token riêng biệt, vì vậy chúng có thể được phân cách bởi [khoảng trắng hoặc ký tự kết thúc dòng](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#white_space). Tuy nhiên, không được có ký tự kết thúc dòng giữa `async` và `function`, nếu không dấu chấm phẩy sẽ được [tự động chèn vào](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#automatic_semicolon_insertion), khiến `async` trở thành một identifier và phần còn lại trở thành khai báo `function*`.

### Tham số

- `name`
  - : Tên của function.
- `param` {{optional_inline}}
  - : Tên của tham số chính thức cho function. Về cú pháp của tham số, xem [tài liệu tham khảo Functions](/en-US/docs/Web/JavaScript/Guide/Functions#function_parameters).
- `statements` {{optional_inline}}
  - : Các câu lệnh tạo nên phần thân của function.

## Mô tả

Khai báo `async function*` tạo ra một đối tượng {{jsxref("AsyncGeneratorFunction")}}. Mỗi lần async generator function được gọi, nó trả về một đối tượng {{jsxref("AsyncGenerator")}} mới, tuân theo [async iterator protocol](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_async_iterator_and_async_iterable_protocols). Mỗi lần gọi `next()` trả về một {{jsxref("Promise")}} giải quyết thành đối tượng kết quả iterator.

Async generator function kết hợp các tính năng của [async function](/en-US/docs/Web/JavaScript/Reference/Statements/async_function) và [generator function](/en-US/docs/Web/JavaScript/Reference/Statements/function*). Bạn có thể sử dụng cả từ khóa [`await`](/en-US/docs/Web/JavaScript/Reference/Operators/await) và [`yield`](/en-US/docs/Web/JavaScript/Reference/Operators/yield) trong phần thân function. Điều này cho phép bạn xử lý các tác vụ bất đồng bộ một cách thuận tiện với `await`, trong khi tận dụng tính chất lazy của generator function.

Khi một promise được yield từ async generator, trạng thái cuối cùng của iterator result promise sẽ khớp với trạng thái của promise được yield. Ví dụ:

```js
async function* foo() {
  yield Promise.reject(new Error("failed"));
}

foo()
  .next()
  .catch((e) => console.error(e));
```

`Error: failed` sẽ được ghi ra, vì nếu promise được yield bị reject, kết quả iterator cũng sẽ bị reject. Thuộc tính `value` của kết quả đã resolved của async generator sẽ không phải là một promise khác.

Khai báo `async function*` hoạt động tương tự như khai báo {{jsxref("Statements/function", "function")}} — chúng được [hoisted](/en-US/docs/Glossary/Hoisting) lên đầu phạm vi của chúng và có thể được gọi ở bất kỳ đâu trong phạm vi đó, và chúng chỉ có thể được khai báo lại trong một số ngữ cảnh nhất định.

## Ví dụ

### Khai báo một async generator function

Async generator function luôn tạo ra các promise của kết quả — ngay cả khi mỗi bước `yield` là đồng bộ.

```js
async function* myGenerator(step) {
  await new Promise((resolve) => setTimeout(resolve, 10));
  yield 0;
  yield step;
  yield step * 2;
}

const gen = myGenerator(2);
gen
  .next()
  .then((res) => {
    console.log(res); // { value: 0, done: false }
    return gen.next();
  })
  .then((res) => {
    console.log(res); // { value: 2, done: false }
    return gen.next();
  })
  .then((res) => {
    console.log(res); // { value: 4, done: false }
    return gen.next();
  })
  .then((res) => {
    console.log(res); // { value: undefined, done: true }
    return gen.next();
  });
```

### Sử dụng async generator function để đọc một loạt file

Trong ví dụ này, chúng ta đọc một loạt file và chỉ truy cập nội dung của chúng khi được yêu cầu, sử dụng module [`fs/promises`](https://nodejs.org/dist/latest-v18.x/docs/api/fs.html) của Node.

```js
async function* readFiles(directory) {
  const files = await fs.readdir(directory);
  for (const file of files) {
    const stats = await fs.stat(file);
    if (stats.isFile()) {
      yield {
        name: file,
        content: await fs.readFile(file, "utf8"),
      };
    }
  }
}

const files = readFiles(".");
console.log((await files.next()).value);
// Possible output: { name: 'file1.txt', content: '...' }
console.log((await files.next()).value);
// Possible output: { name: 'file2.txt', content: '...' }
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Functions](/en-US/docs/Web/JavaScript/Guide/Functions)
- Hướng dẫn [Iterators and generators](/en-US/docs/Web/JavaScript/Guide/Iterators_and_generators)
- [Functions](/en-US/docs/Web/JavaScript/Reference/Functions)
- {{jsxref("AsyncGeneratorFunction")}}
- [`async function*` expression](/en-US/docs/Web/JavaScript/Reference/Operators/async_function*)
- {{jsxref("Statements/function", "function")}}
- {{jsxref("Statements/function*", "function*")}}
- {{jsxref("Statements/async_function", "async function")}}
- [Iteration protocols](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols)
- {{jsxref("Operators/yield", "yield")}}
- {{jsxref("Operators/yield*", "yield*")}}
- {{jsxref("AsyncGenerator")}}
