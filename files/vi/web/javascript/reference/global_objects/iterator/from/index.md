---
title: Iterator.from()
short-title: from()
slug: Web/JavaScript/Reference/Global_Objects/Iterator/from
page-type: javascript-static-method
browser-compat: javascript.builtins.Iterator.from
sidebar: jsref
---

Phương thức tĩnh **`Iterator.from()`** tạo một đối tượng {{jsxref("Iterator")}} mới từ một iterator hoặc đối tượng iterable.

## Cú pháp

```js-nolint
Iterator.from(object)
```

### Tham số

- `object`
  - : Một đối tượng triển khai giao thức [iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol) hoặc giao thức [iterator](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterator_protocol).

### Giá trị trả về

Nếu `object` là một iterable, phương thức `[Symbol.iterator]()` của nó được gọi để lấy iterator. Ngược lại, `object` được giả định là một iterator. Nếu iterator đã là {{jsxref("Operators/instanceof", "instanceof")}} {{jsxref("Iterator")}} (tức là có `Iterator.prototype` trong chuỗi prototype của nó), nó được trả về trực tiếp. Ngược lại, một đối tượng {{jsxref("Iterator")}} mới được tạo ra bọc iterator gốc.

## Mô tả

Phương thức này tồn tại để chuyển đổi các iterator tùy chỉnh, có thể được xuất bởi các thư viện, thành [các iterator chuẩn](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator#proper_iterators). Tất cả các đối tượng iterator do `Iterator.from()` trả về đều kế thừa từ một đối tượng prototype chung, có các phương thức sau:

- `next()`
  - : Gọi phương thức `next()` của iterator nền và trả về kết quả.
- `return()`
  - : Gọi phương thức `return()` của iterator nền và trả về kết quả, hoặc trả về `{ value: undefined, done: true }` nếu iterator nền không có phương thức `return()`.

## Ví dụ

### Chuyển đổi iterable thành iterator chuẩn

Vì `obj` đã là iterable trả về iterator chuẩn khi gọi phương thức `[Symbol.iterator]()`, `Iterator.from(obj)` trả về iterator đó.

```js
const iterator = (function* () {
  yield 1;
  yield 2;
  yield 3;
})();

const obj = {
  [Symbol.iterator]() {
    return iterator;
  },
};

const iterator2 = Iterator.from(obj);
console.log(iterator2 === iterator); // true
```

Vì `obj2` là iterable trả về iterator không chuẩn khi gọi phương thức `[Symbol.iterator]()`, `Iterator.from(obj2)` trả về iterator mới bọc iterator gốc.

```js
const iterator = {
  current: 0,
  next() {
    return { value: this.current++, done: false };
  },
};

const obj2 = {
  [Symbol.iterator]() {
    return iterator;
  },
};

const iterator2 = Iterator.from(obj2);
console.log(iterator2 === iterator); // false
console.log(iterator2.next()); // { value: 0, done: false }
console.log(iterator.next()); // { value: 1, done: false }
```

### Chuyển đổi iterator thành iterator chuẩn

Vì `obj` đã là iterator chuẩn, `Iterator.from(obj)` trả về chính nó.

```js
const obj = (function* () {
  yield 1;
  yield 2;
  yield 3;
})();

const iterator = Iterator.from(obj);
console.log(iterator === obj); // true
```

Vì `obj2` là iterator không chuẩn, `Iterator.from(obj2)` trả về iterator mới bọc iterator gốc.

```js
const obj2 = {
  current: 0,
  next() {
    return { value: this.current++, done: false };
  },
};

const iterator = Iterator.from(obj2);
console.log(iterator === obj2); // false
console.log(iterator.next()); // { value: 0, done: false }
console.log(obj2.next()); // { value: 1, done: false }
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Iterator.from` trong `core-js`](https://github.com/zloirock/core-js#iterator-helpers)
- [es-shims polyfill của `Iterator.from`](https://www.npmjs.com/package/es-iterator-helpers)
- {{jsxref("Iterator")}}
- {{jsxref("Array.from()")}}
