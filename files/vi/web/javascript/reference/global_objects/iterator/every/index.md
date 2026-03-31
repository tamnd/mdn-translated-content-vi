---
title: Iterator.prototype.every()
short-title: every()
slug: Web/JavaScript/Reference/Global_Objects/Iterator/every
page-type: javascript-instance-method
browser-compat: javascript.builtins.Iterator.every
sidebar: jsref
---

Phương thức **`every()`** của các thực thể {{jsxref("Iterator")}} tương tự như {{jsxref("Array.prototype.every()")}}: nó trả về `false` nếu tìm thấy một phần tử không thỏa mãn hàm kiểm tra đã cho. Ngược lại, nếu iterator đã cạn kiệt mà không tìm thấy phần tử như vậy, nó trả về `true`.

## Cú pháp

```js-nolint
every(callbackFn)
```

### Tham số

- `callbackFn`
  - : Hàm thực thi cho mỗi phần tử do iterator tạo ra. Nó nên trả về giá trị [truthy](/en-US/docs/Glossary/Truthy) để chỉ ra rằng phần tử đã vượt qua bài kiểm tra, và giá trị [falsy](/en-US/docs/Glossary/Falsy) nếu không. Hàm được gọi với các đối số sau:
    - `element`
      - : Phần tử hiện tại đang được xử lý.
    - `index`
      - : Chỉ số của phần tử hiện tại đang được xử lý.

### Giá trị trả về

`true` nếu `callbackFn` trả về giá trị {{Glossary("truthy")}} cho mọi phần tử. Ngược lại, `false`.

## Mô tả

`every()` lặp qua iterator và gọi hàm `callbackFn` một lần cho mỗi phần tử. Nó trả về `false` ngay lập tức nếu hàm callback trả về giá trị falsy. Ngược lại, nó lặp đến cuối iterator và trả về `true`. Nếu `every()` trả về `false`, iterator nền được đóng bằng cách gọi phương thức `return()` của nó.

Ưu điểm chính của các iterator helper so với các phương thức mảng là chúng lười biếng, nghĩa là chúng chỉ tạo ra giá trị tiếp theo khi được yêu cầu. Điều này tránh được tính toán không cần thiết và cũng cho phép chúng được sử dụng với các iterator vô hạn. Với các iterator vô hạn, `every()` trả về `false` ngay khi tìm thấy giá trị falsy đầu tiên. Nếu `callbackFn` luôn trả về giá trị truthy, phương thức không bao giờ trả về.

## Ví dụ

### Sử dụng every()

```js
function* fibonacci() {
  let current = 1;
  let next = 1;
  while (true) {
    yield current;
    [current, next] = [next, current + next];
  }
}

const isEven = (x) => x % 2 === 0;
console.log(fibonacci().every(isEven)); // false

const isPositive = (x) => x > 0;
console.log(fibonacci().take(10).every(isPositive)); // true
console.log(fibonacci().every(isPositive)); // Không bao giờ hoàn thành
```

Gọi `every()` luôn đóng iterator nền, ngay cả khi phương thức trả về sớm. Iterator không bao giờ bị để lại ở trạng thái nửa chừng.

```js
const seq = fibonacci();
console.log(seq.every(isEven)); // false
console.log(seq.next()); // { value: undefined, done: true }
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Iterator.prototype.every` trong `core-js`](https://github.com/zloirock/core-js#iterator-helpers)
- [es-shims polyfill của `Iterator.prototype.every`](https://www.npmjs.com/package/es-iterator-helpers)
- {{jsxref("Iterator")}}
- {{jsxref("Iterator.prototype.find()")}}
- {{jsxref("Iterator.prototype.some()")}}
- {{jsxref("Array.prototype.every()")}}
