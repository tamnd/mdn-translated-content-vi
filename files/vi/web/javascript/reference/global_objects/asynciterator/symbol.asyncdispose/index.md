---
title: AsyncIterator.prototype[Symbol.asyncDispose]()
short-title: "[Symbol.asyncDispose]()"
slug: Web/JavaScript/Reference/Global_Objects/AsyncIterator/Symbol.asyncDispose
page-type: javascript-instance-method
browser-compat: javascript.builtins.AsyncIterator.@@asyncDispose
sidebar: jsref
---

Phương thức **`[Symbol.asyncDispose]()`** của các thực thể {{jsxref("AsyncIterator")}} triển khai _giao thức async disposable_ và cho phép nó bị xử lý khi sử dụng với {{jsxref("Statements/await_using", "await using")}}. Nó gọi và await phương thức `return()` của `this`, nếu nó tồn tại.

## Cú pháp

```js-nolint
asyncIterator[Symbol.asyncDispose]()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Khai báo async iterator với `await using`

Phương thức `Symbol.asyncDispose` được thiết kế để tự động được gọi trong khai báo `await using`. Điều này hữu ích nếu bạn có một async iterator mà bạn tự lặp bằng cách gọi phương thức `next()` của nó; nếu bạn lặp nó với {{jsxref("Statements/for-await...of", "for await...of")}} hoặc thứ gì đó tương tự, thì xử lý lỗi và dọn dẹp được thực hiện tự động.

```js
async function* generateNumbers() {
  try {
    yield 1;
    yield 2;
    yield 3;
  } finally {
    console.log("Cleaning up");
  }
}

async function doSomething() {
  await using numbers = generateNumbers();
  const res1 = await numbers.next();
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

- [Polyfill của `AsyncIterator.prototype[Symbol.asyncDispose]` trong `core-js`](https://github.com/zloirock/core-js#explicit-resource-management)
- [Quản lý tài nguyên JavaScript](/en-US/docs/Web/JavaScript/Guide/Resource_management)
- {{jsxref("Symbol.asyncDispose")}}
- {{jsxref("Statements/await_using", "await using")}}
