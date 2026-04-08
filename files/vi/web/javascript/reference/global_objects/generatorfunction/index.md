---
title: GeneratorFunction
slug: Web/JavaScript/Reference/Global_Objects/GeneratorFunction
page-type: javascript-class
browser-compat: javascript.builtins.GeneratorFunction
sidebar: jsref
---

Đối tượng **`GeneratorFunction`** cung cấp các phương thức cho [hàm generator](/en-US/docs/Web/JavaScript/Reference/Statements/function*). Trong JavaScript, mỗi hàm generator thực ra là một đối tượng `GeneratorFunction`.

Lưu ý rằng `GeneratorFunction` _không_ phải là đối tượng toàn cục. Nó có thể được lấy bằng đoạn code sau:

```js
const GeneratorFunction = function* () {}.constructor;
```

`GeneratorFunction` là lớp con của {{jsxref("Function")}}.

{{InteractiveExample("JavaScript Demo: GeneratorFunction", "taller")}}

```js interactive-example
const GeneratorFunction = function* () {}.constructor;

const foo = new GeneratorFunction(`
  yield 'a';
  yield 'b';
  yield 'c';
`);

let str = "";
for (const val of foo()) {
  str += val;
}

console.log(str);
// Expected output: "abc"
```

## Constructor

- {{jsxref("GeneratorFunction/GeneratorFunction", "GeneratorFunction()")}}
  - : Tạo đối tượng `GeneratorFunction` mới.

## Thuộc tính instance

_Cũng kế thừa các thuộc tính instance từ lớp cha {{jsxref("Function")}}_.

Các thuộc tính này được định nghĩa trên `GeneratorFunction.prototype` và được chia sẻ bởi tất cả các instance `GeneratorFunction`.

- {{jsxref("Object/constructor", "GeneratorFunction.prototype.constructor")}}
  - : Hàm constructor đã tạo đối tượng instance. Đối với các instance `GeneratorFunction`, giá trị khởi tạo là constructor {{jsxref("GeneratorFunction/GeneratorFunction", "GeneratorFunction")}}.
- {{jsxref("GeneratorFunction.prototype.prototype")}}
  - : Tất cả các hàm generator chia sẻ cùng một thuộc tính [`prototype`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/prototype), là [`Generator.prototype`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Generator). Mỗi hàm generator được tạo bằng cú pháp `function*` hoặc constructor `GeneratorFunction()` cũng có thuộc tính `prototype` riêng, có prototype là `GeneratorFunction.prototype.prototype`. Khi hàm generator được gọi, thuộc tính `prototype` của nó trở thành prototype của đối tượng generator được trả về.
- `GeneratorFunction.prototype[Symbol.toStringTag]`
  - : Giá trị khởi tạo của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"GeneratorFunction"`. Thuộc tính này được dùng trong {{jsxref("Object.prototype.toString()")}}.

Đây là các thuộc tính riêng của mỗi instance `GeneratorFunction`.

- {{jsxref("GeneratorFunction/prototype", "prototype")}}
  - : Được sử dụng khi hàm được dùng như constructor với toán tử [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Nó sẽ trở thành prototype của đối tượng mới.

## Phương thức instance

_Kế thừa các phương thức instance từ lớp cha {{jsxref("Function")}}_.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`function*`](/en-US/docs/Web/JavaScript/Reference/Statements/function*)
- [`function*` expression](/en-US/docs/Web/JavaScript/Reference/Operators/function*)
- {{jsxref("Function")}}
- {{jsxref("AsyncFunction")}}
- {{jsxref("AsyncGeneratorFunction")}}
- {{jsxref("Functions", "Functions", "", 1)}}
