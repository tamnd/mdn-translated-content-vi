---
title: Iterator.prototype.forEach()
short-title: forEach()
slug: Web/JavaScript/Reference/Global_Objects/Iterator/forEach
page-type: javascript-instance-method
browser-compat: javascript.builtins.Iterator.forEach
sidebar: jsref
---

Phương thức **`forEach()`** của các thực thể {{jsxref("Iterator")}} tương tự như {{jsxref("Array.prototype.forEach()")}}: nó thực thi hàm đã cho một lần cho mỗi phần tử do iterator tạo ra.

## Cú pháp

```js-nolint
forEach(callbackFn)
```

### Tham số

- `callbackFn`
  - : Hàm thực thi cho mỗi phần tử do iterator tạo ra. Giá trị trả về của nó bị bỏ qua. Hàm được gọi với các đối số sau:
    - `element`
      - : Phần tử hiện tại đang được xử lý.
    - `index`
      - : Chỉ số của phần tử hiện tại đang được xử lý.

### Giá trị trả về

{{jsxref("undefined")}}.

## Mô tả

`forEach()` lặp qua iterator và gọi hàm `callbackFn` một lần cho mỗi phần tử. Không giống hầu hết các phương thức iterator helper khác, nó không hoạt động tốt với các iterator vô hạn vì nó không lười biếng.

## Ví dụ

### Sử dụng forEach()

```js
new Set([1, 2, 3]).values().forEach((v) => console.log(v));

// In ra:
// 1
// 2
// 3
```

Điều này tương đương với:

```js
for (const v of new Set([1, 2, 3]).values()) {
  console.log(v);
}
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Iterator.prototype.forEach` trong `core-js`](https://github.com/zloirock/core-js#iterator-helpers)
- [es-shims polyfill của `Iterator.prototype.forEach`](https://www.npmjs.com/package/es-iterator-helpers)
- {{jsxref("Iterator")}}
- {{jsxref("Iterator.prototype.find()")}}
- {{jsxref("Iterator.prototype.map()")}}
- {{jsxref("Iterator.prototype.filter()")}}
- {{jsxref("Iterator.prototype.every()")}}
- {{jsxref("Iterator.prototype.some()")}}
- {{jsxref("Array.prototype.forEach()")}}
