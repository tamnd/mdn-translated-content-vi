---
title: Iterator.prototype[Symbol.iterator]()
short-title: "[Symbol.iterator]()"
slug: Web/JavaScript/Reference/Global_Objects/Iterator/Symbol.iterator
page-type: javascript-instance-method
browser-compat: javascript.builtins.Iterator.@@iterator
sidebar: jsref
---

Phương thức **`[Symbol.iterator]()`** của các thực thể {{jsxref("Iterator")}} triển khai [giao thức iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) và cho phép các iterator tích hợp được tiêu thụ bởi hầu hết các cú pháp kỳ vọng iterable, chẳng hạn như [cú pháp spread](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax) và vòng lặp {{jsxref("Statements/for...of", "for...of")}}. Nó trả về giá trị của [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this), chính là đối tượng iterator.

## Cú pháp

```js-nolint
iterator[Symbol.iterator]()
```

### Tham số

Không có.

### Giá trị trả về

Giá trị của [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this), chính là đối tượng iterator.

## Ví dụ

### Lặp sử dụng vòng lặp for...of

Lưu ý rằng bạn hiếm khi cần gọi phương thức này trực tiếp. Sự tồn tại của phương thức `[Symbol.iterator]()` làm cho các iterator tích hợp trở thành [iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol), và các cú pháp lặp như vòng lặp `for...of` tự động gọi phương thức này để lấy iterator để lặp.

```js
const arrIterator = [1, 2, 3].values();
for (const value of arrIterator) {
  console.log(value);
}
// In ra: 1, 2, 3
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Iterator")}}
- {{jsxref("Symbol.iterator")}}
- [Các giao thức lặp](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols)
