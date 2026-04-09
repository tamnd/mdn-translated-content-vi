---
title: AsyncGeneratorFunction
slug: Web/JavaScript/Reference/Global_Objects/AsyncGeneratorFunction
page-type: javascript-class
browser-compat: javascript.builtins.AsyncGeneratorFunction
sidebar: jsref
---

Đối tượng **`AsyncGeneratorFunction`** cung cấp các phương thức cho [hàm async generator](/en-US/docs/Web/JavaScript/Reference/Statements/async_function*). Trong JavaScript, mỗi hàm async generator thực ra là một đối tượng `AsyncGeneratorFunction`.

Lưu ý rằng `AsyncGeneratorFunction` _không_ phải là đối tượng toàn cục. Nó có thể được lấy bằng đoạn code sau:

```js
const AsyncGeneratorFunction = async function* () {}.constructor;
```

`AsyncGeneratorFunction` là lớp con của {{jsxref("Function")}}.

{{InteractiveExample("JavaScript Demo: AsyncGeneratorFunction", "taller")}}

```js interactive-example
const AsyncGeneratorFunction = async function* () {}.constructor;

const foo = new AsyncGeneratorFunction(`
  yield await Promise.resolve('a');
  yield await Promise.resolve('b');
  yield await Promise.resolve('c');
`);

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

## Constructor

- {{jsxref("AsyncGeneratorFunction/AsyncGeneratorFunction", "AsyncGeneratorFunction()")}}
  - : Tạo đối tượng `AsyncGeneratorFunction` mới.

## Thuộc tính instance

_Cũng kế thừa các thuộc tính instance từ lớp cha {{jsxref("Function")}}_.

Các thuộc tính này được định nghĩa trên `AsyncGeneratorFunction.prototype` và được chia sẻ bởi tất cả các instance `AsyncGeneratorFunction`.

- {{jsxref("Object/constructor", "AsyncGeneratorFunction.prototype.constructor")}}
  - : Hàm constructor đã tạo đối tượng instance. Đối với các instance `AsyncGeneratorFunction`, giá trị khởi tạo là constructor {{jsxref("AsyncGeneratorFunction/AsyncGeneratorFunction", "AsyncGeneratorFunction")}}.
- `AsyncGeneratorFunction.prototype.prototype`
  - : Tất cả các hàm async generator dùng chung cùng một thuộc tính [`prototype`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/prototype), đó là [`AsyncGenerator.prototype`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/AsyncGenerator). Mỗi hàm async generator được tạo bằng cú pháp `async function*` hoặc constructor `AsyncGeneratorFunction()` cũng có thuộc tính `prototype` riêng của mình, có prototype là `AsyncGeneratorFunction.prototype.prototype`. Khi hàm async generator được gọi, thuộc tính `prototype` của nó sẽ trở thành prototype của đối tượng async generator được trả về.
- `AsyncGeneratorFunction.prototype[Symbol.toStringTag]`
  - : Giá trị khởi tạo của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"AsyncGeneratorFunction"`. Thuộc tính này được dùng trong {{jsxref("Object.prototype.toString()")}}.

Các thuộc tính này là thuộc tính riêng của mỗi instance `AsyncGeneratorFunction`.

- {{jsxref("AsyncGeneratorFunction/prototype", "prototype")}}
  - : Được dùng khi hàm được sử dụng như constructor với toán tử [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Nó sẽ trở thành prototype của đối tượng mới.

## Phương thức instance

_Kế thừa các phương thức instance từ lớp cha {{jsxref("Function")}}_.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`async function*`](/en-US/docs/Web/JavaScript/Reference/Statements/async_function*)
- [`async function*` expression](/en-US/docs/Web/JavaScript/Reference/Operators/async_function*)
- {{jsxref("Function")}}
- {{jsxref("AsyncFunction")}}
- {{jsxref("GeneratorFunction")}}
- {{jsxref("Functions", "Functions", "", 1)}}
