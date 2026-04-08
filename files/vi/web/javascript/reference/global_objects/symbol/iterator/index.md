---
title: Symbol.iterator
short-title: iterator
slug: Web/JavaScript/Reference/Global_Objects/Symbol/iterator
page-type: javascript-static-data-property
browser-compat: javascript.builtins.Symbol.iterator
sidebar: jsref
---

Thuộc tính dữ liệu tĩnh **`Symbol.iterator`** đại diện cho [well-known symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#well-known_symbols) `Symbol.iterator`. [Giao thức iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol) tra cứu symbol này cho phương thức trả về iterator cho một đối tượng. Để một đối tượng có thể lặp lại, nó phải có khóa `[Symbol.iterator]`.

{{InteractiveExample("JavaScript Demo: Symbol.iterator")}}

```js interactive-example
const iterable = {};

iterable[Symbol.iterator] = function* () {
  yield 1;
  yield 2;
  yield 3;
};

console.log([...iterable]);
// Expected output: Array [1, 2, 3]
```

## Giá trị

Well-known symbol `Symbol.iterator`.

{{js_property_attributes(0, 0, 0)}}

## Mô tả

Mỗi khi một đối tượng cần được lặp lại (chẳng hạn như ở đầu vòng lặp `for...of`), phương thức `[Symbol.iterator]()` của nó được gọi mà không có đối số, và **iterator** được trả về sẽ được dùng để thu thập các giá trị cần lặp.

Một số kiểu tích hợp sẵn có hành vi lặp lại mặc định, trong khi các kiểu khác (như {{jsxref("Object")}}) thì không. Một số kiểu tích hợp sẵn có phương thức `[Symbol.iterator]()`:

- [`Array.prototype[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Symbol.iterator)
- [`TypedArray.prototype[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/Symbol.iterator)
- [`String.prototype[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Symbol.iterator)
- [`Map.prototype[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map/Symbol.iterator)
- [`Set.prototype[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set/Symbol.iterator)

Xem thêm [Giao thức lặp lại](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) để biết thêm thông tin.

## Ví dụ

### Iterable do người dùng định nghĩa

Chúng ta có thể tạo iterable của riêng mình như sau:

```js
const myIterable = {};
myIterable[Symbol.iterator] = function* () {
  yield 1;
  yield 2;
  yield 3;
};
[...myIterable]; // [1, 2, 3]
```

Hoặc iterable có thể được định nghĩa trực tiếp bên trong một class hoặc đối tượng bằng [computed property](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer#computed_property_names):

```js
class Foo {
  *[Symbol.iterator]() {
    yield 1;
    yield 2;
    yield 3;
  }
}

const someObj = {
  *[Symbol.iterator]() {
    yield "a";
    yield "b";
  },
};

console.log(...new Foo()); // 1, 2, 3
console.log(...someObj); // 'a', 'b'
```

### Iterable không đúng định dạng

Nếu phương thức `[Symbol.iterator]()` của iterable không trả về một đối tượng iterator, thì đây là iterable không đúng định dạng. Sử dụng nó như vậy có thể dẫn đến ngoại lệ runtime hoặc hành vi lỗi:

```js example-bad
const nonWellFormedIterable = {};
nonWellFormedIterable[Symbol.iterator] = () => 1;
[...nonWellFormedIterable]; // TypeError: [Symbol.iterator]() returned a non-object value
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Symbol.iterator` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-symbol)
- [Giao thức lặp lại](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols)
- [`Array.prototype[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Symbol.iterator)
- [`TypedArray.prototype[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/Symbol.iterator)
- [`String.prototype[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Symbol.iterator)
- [`Map.prototype[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map/Symbol.iterator)
- [`Set.prototype[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set/Symbol.iterator)
- [`arguments[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Functions/arguments/Symbol.iterator)
- [`Segments.prototype[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Segmenter/segment/Segments/Symbol.iterator)
