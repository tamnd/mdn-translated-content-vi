---
title: Object.getOwnPropertySymbols()
short-title: getOwnPropertySymbols()
slug: Web/JavaScript/Reference/Global_Objects/Object/getOwnPropertySymbols
page-type: javascript-static-method
browser-compat: javascript.builtins.Object.getOwnPropertySymbols
sidebar: jsref
---

Phương thức tĩnh **`Object.getOwnPropertySymbols()`** trả về một mảng gồm tất cả các thuộc tính symbol được tìm thấy trực tiếp trên một đối tượng đã cho.

{{InteractiveExample("JavaScript Demo: Object.getOwnPropertySymbols()")}}

```js interactive-example
const object = {};
const a = Symbol("a");
const b = Symbol.for("b");

object[a] = "localSymbol";
object[b] = "globalSymbol";

const objectSymbols = Object.getOwnPropertySymbols(object);

console.log(objectSymbols.length);
// Expected output: 2
```

## Cú pháp

```js-nolint
Object.getOwnPropertySymbols(obj)
```

### Tham số

- `obj`
  - : Đối tượng mà các thuộc tính symbol sẽ được trả về.

### Giá trị trả về

Một mảng gồm tất cả các thuộc tính symbol được tìm thấy trực tiếp trên đối tượng đã cho.

## Mô tả

Tương tự như {{jsxref("Object.getOwnPropertyNames()")}}, bạn có thể lấy tất cả các thuộc tính symbol của một đối tượng đã cho dưới dạng mảng các symbol. Lưu ý rằng bản thân {{jsxref("Object.getOwnPropertyNames()")}} không chứa các thuộc tính symbol của một đối tượng mà chỉ chứa các thuộc tính chuỗi.

Vì tất cả các đối tượng ban đầu không có thuộc tính symbol nào, `Object.getOwnPropertySymbols()` trả về một mảng rỗng trừ khi bạn đã đặt thuộc tính symbol trên đối tượng của mình.

## Ví dụ

### Sử dụng Object.getOwnPropertySymbols()

```js
const obj = {};
const a = Symbol("a");
const b = Symbol.for("b");

obj[a] = "localSymbol";
obj[b] = "globalSymbol";

const objectSymbols = Object.getOwnPropertySymbols(obj);

console.log(objectSymbols.length); // 2
console.log(objectSymbols); // [Symbol(a), Symbol(b)]
console.log(objectSymbols[0]); // Symbol(a)
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Object.getOwnPropertySymbols` in `core-js`](https://github.com/zloirock/core-js#ecmascript-symbol)
- {{jsxref("Object.getOwnPropertyNames()")}}
- {{jsxref("Symbol")}}
