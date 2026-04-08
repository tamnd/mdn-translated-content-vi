---
title: Iterator.prototype[Symbol.dispose]()
short-title: "[Symbol.dispose]()"
slug: Web/JavaScript/Reference/Global_Objects/Iterator/Symbol.dispose
page-type: javascript-instance-method
browser-compat: javascript.builtins.Iterator.@@dispose
sidebar: jsref
---

Phương thức **`[Symbol.dispose]()`** của các thực thể {{jsxref("Iterator")}} triển khai _giao thức disposable_ và cho phép nó bị xử lý khi sử dụng với {{jsxref("Statements/using", "using")}}. Nó gọi phương thức `return()` của `this`, nếu nó tồn tại.

## Cú pháp

```js-nolint
iterator[Symbol.dispose]()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Khai báo iterator với `using`

Phương thức `Symbol.dispose` được thiết kế để tự động được gọi trong khai báo `using`. Điều này hữu ích nếu bạn có một iterator mà bạn tự lặp bằng cách gọi phương thức `next()` của nó; nếu bạn lặp nó với {{jsxref("Statements/for...of", "for...of")}} hoặc thứ gì đó tương tự, thì xử lý lỗi và dọn dẹp được thực hiện tự động.

```js
function* generateNumbers() {
  try {
    yield 1;
    yield 2;
    yield 3;
  } finally {
    console.log("Cleaning up");
  }
}

function doSomething() {
  using numbers = generateNumbers();
  const res1 = numbers.next();
  // Không lặp phần còn lại của các số
  // Trước khi hàm thoát, async iterator được xử lý
  // In ra "Cleaning up"
}

doSomething();
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Iterator.prototype[Symbol.dispose]` trong `core-js`](https://github.com/zloirock/core-js#explicit-resource-management)
- [Quản lý tài nguyên JavaScript](/en-US/docs/Web/JavaScript/Guide/Resource_management)
- {{jsxref("Symbol.dispose")}}
- {{jsxref("Statements/using", "using")}}
