---
title: Iterator.prototype.some()
short-title: some()
slug: Web/JavaScript/Reference/Global_Objects/Iterator/some
page-type: javascript-instance-method
browser-compat: javascript.builtins.Iterator.some
sidebar: jsref
---

Phương thức **`some()`** của các thực thể {{jsxref("Iterator")}} tương tự như {{jsxref("Array.prototype.some()")}}: nó trả về `true` nếu tìm thấy một phần tử thỏa mãn hàm kiểm tra đã cho. Ngược lại, nếu iterator đã cạn kiệt mà không tìm thấy phần tử như vậy, nó trả về `false`.

## Cú pháp

```js-nolint
some(callbackFn)
```

### Tham số

- `callbackFn`
  - : Hàm thực thi cho mỗi phần tử do iterator tạo ra. Nó nên trả về giá trị [truthy](/en-US/docs/Glossary/Truthy) để chỉ ra rằng phần tử đã vượt qua bài kiểm tra, và giá trị [falsy](/en-US/docs/Glossary/Falsy) nếu không. Hàm được gọi với các đối số sau:
    - `element`
      - : Phần tử hiện tại đang được xử lý.
    - `index`
      - : Chỉ số của phần tử hiện tại đang được xử lý.

### Giá trị trả về

`true` nếu hàm callback trả về giá trị {{Glossary("truthy")}} cho ít nhất một phần tử. Ngược lại, `false`.

## Mô tả

`some()` lặp qua iterator và gọi hàm `callbackFn` một lần cho mỗi phần tử. Nó trả về `true` ngay lập tức nếu hàm callback trả về giá trị truthy. Ngược lại, nó lặp đến cuối iterator và trả về `false`. Nếu `some()` trả về `true`, iterator nền được đóng bằng cách gọi phương thức `return()` của nó.

Ưu điểm chính của các iterator helper so với các phương thức mảng là chúng lười biếng, nghĩa là chúng chỉ tạo ra giá trị tiếp theo khi được yêu cầu. Điều này tránh được tính toán không cần thiết và cũng cho phép chúng được sử dụng với các iterator vô hạn. Với các iterator vô hạn, `some()` trả về `true` ngay khi tìm thấy giá trị truthy đầu tiên. Nếu `callbackFn` luôn trả về giá trị falsy, phương thức không bao giờ trả về.

## Ví dụ

### Sử dụng some()

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
console.log(fibonacci().some(isEven)); // true

const isNegative = (x) => x < 0;
console.log(fibonacci().take(10).some(isNegative)); // false
console.log(fibonacci().some(isNegative)); // Không bao giờ hoàn thành
```

Gọi `some()` luôn đóng iterator nền, ngay cả khi phương thức trả về sớm. Iterator không bao giờ bị để lại ở trạng thái nửa chừng.

```js
const seq = fibonacci();
console.log(seq.some(isEven)); // true
console.log(seq.next()); // { value: undefined, done: true }
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Iterator.prototype.some` trong `core-js`](https://github.com/zloirock/core-js#iterator-helpers)
- [es-shims polyfill của `Iterator.prototype.some`](https://www.npmjs.com/package/es-iterator-helpers)
- {{jsxref("Iterator")}}
- {{jsxref("Iterator.prototype.every()")}}
- {{jsxref("Iterator.prototype.find()")}}
- {{jsxref("Array.prototype.some()")}}
