---
title: Iterator.prototype.toArray()
short-title: toArray()
slug: Web/JavaScript/Reference/Global_Objects/Iterator/toArray
page-type: javascript-instance-method
browser-compat: javascript.builtins.Iterator.toArray
sidebar: jsref
---

Phương thức **`toArray()`** của các thực thể {{jsxref("Iterator")}} tạo một thực thể {{jsxref("Array")}} mới chứa các phần tử được yield từ iterator.

## Cú pháp

```js-nolint
toArray()
```

### Tham số

Không có.

### Giá trị trả về

Một thực thể {{jsxref("Array")}} mới chứa các phần tử từ iterator theo thứ tự chúng được tạo ra.

## Ví dụ

### Sử dụng toArray()

`iterator.toArray()` tương đương với `Array.from(iterator)` và `[...iterator]`, ngoại trừ việc nó dễ xâu chuỗi hơn khi liên quan đến nhiều phương thức iterator helper. Ví dụ sau tạo một iterator yield các số hạng trong dãy Fibonacci, lấy 10 số hạng đầu tiên, lọc ra các số lẻ và chuyển đổi kết quả thành mảng:

```js
function* fibonacci() {
  let current = 1;
  let next = 1;
  while (true) {
    yield current;
    [current, next] = [next, current + next];
  }
}

const array = fibonacci()
  .take(10)
  .filter((x) => x % 2 === 0)
  .toArray();

console.log(array); // [2, 8, 34]
```

Lưu ý rằng nên gọi `toArray()` là bước cuối cùng trong quá trình xử lý. Ví dụ, `fibonacci().take(10).toArray().filter(...)` kém hiệu quả hơn, vì các iterator helper là lười biếng và tránh tạo mảng tạm thời.

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Iterator.prototype.toArray` trong `core-js`](https://github.com/zloirock/core-js#iterator-helpers)
- [es-shims polyfill của `Iterator.prototype.toArray`](https://www.npmjs.com/package/es-iterator-helpers)
- {{jsxref("Iterator")}}
- {{jsxref("Array.from()")}}
