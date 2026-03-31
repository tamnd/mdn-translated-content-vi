---
title: AsyncIterator.prototype[Symbol.asyncIterator]()
short-title: "[Symbol.asyncIterator]()"
slug: Web/JavaScript/Reference/Global_Objects/AsyncIterator/Symbol.asyncIterator
page-type: javascript-instance-method
browser-compat: javascript.builtins.AsyncIterator.@@asyncIterator
sidebar: jsref
---

Phương thức **`[Symbol.asyncIterator]()`** của các thực thể {{jsxref("AsyncIterator")}} triển khai [giao thức async iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_async_iterator_and_async_iterable_protocols) và cho phép các async iterator tích hợp được tiêu thụ bởi hầu hết các cú pháp kỳ vọng async iterable, chẳng hạn như các vòng lặp [`for await...of`](/en-US/docs/Web/JavaScript/Reference/Statements/for-await...of). Nó trả về giá trị của [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this), chính là đối tượng async iterator.

## Cú pháp

```js-nolint
asyncIterator[Symbol.asyncIterator]()
```

### Tham số

Không có.

### Giá trị trả về

Giá trị của [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this), chính là đối tượng async iterator.

## Ví dụ

### Lặp sử dụng vòng lặp for await...of

Lưu ý rằng bạn hiếm khi cần gọi phương thức này trực tiếp. Sự tồn tại của phương thức `[Symbol.asyncIterator]()` làm cho tất cả các async iterator tích hợp trở thành [async iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_async_iterator_and_async_iterable_protocols), và các cú pháp lặp như vòng lặp `for await...of` tự động gọi phương thức này để lấy async iterator để lặp.

```js
const asyncIterator = (async function* () {
  yield 1;
  yield 2;
  yield 3;
})();
(async () => {
  for await (const value of asyncIterator) {
    console.log(value);
  }
})();
// In ra: 1, 2, 3
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`for await...of`](/en-US/docs/Web/JavaScript/Reference/Statements/for-await...of)
