---
title: Iterator.prototype.find()
short-title: find()
slug: Web/JavaScript/Reference/Global_Objects/Iterator/find
page-type: javascript-instance-method
browser-compat: javascript.builtins.Iterator.find
sidebar: jsref
---

Phương thức **`find()`** của các thực thể {{jsxref("Iterator")}} tương tự như {{jsxref("Array.prototype.find()")}}: nó trả về phần tử đầu tiên do iterator tạo ra thỏa mãn hàm kiểm tra đã cho. Nếu không có giá trị nào thỏa mãn hàm kiểm tra, {{jsxref("undefined")}} được trả về.

## Cú pháp

```js-nolint
find(callbackFn)
```

### Tham số

- `callbackFn`
  - : Hàm thực thi cho mỗi phần tử do iterator tạo ra. Nó nên trả về giá trị [truthy](/en-US/docs/Glossary/Truthy) để chỉ ra rằng phần tử phù hợp đã được tìm thấy, và giá trị [falsy](/en-US/docs/Glossary/Falsy) nếu không. Hàm được gọi với các đối số sau:
    - `element`
      - : Phần tử hiện tại đang được xử lý.
    - `index`
      - : Chỉ số của phần tử hiện tại đang được xử lý.

### Giá trị trả về

Phần tử đầu tiên do iterator tạo ra thỏa mãn hàm kiểm tra đã cho. Ngược lại, {{jsxref("undefined")}} được trả về.

## Mô tả

`find()` lặp qua iterator và gọi hàm `callbackFn` một lần cho mỗi phần tử. Nó trả về phần tử ngay lập tức nếu hàm callback trả về giá trị truthy. Ngược lại, nó lặp đến cuối iterator và trả về `undefined`. Nếu `find()` trả về một phần tử, iterator nền được đóng bằng cách gọi phương thức `return()` của nó.

Ưu điểm chính của các iterator helper so với các phương thức mảng là chúng lười biếng, nghĩa là chúng chỉ tạo ra giá trị tiếp theo khi được yêu cầu. Điều này tránh được tính toán không cần thiết và cũng cho phép chúng được sử dụng với các iterator vô hạn. Với các iterator vô hạn, `find()` trả về phần tử đầu tiên thỏa mãn ngay khi nó được tìm thấy. Nếu `callbackFn` luôn trả về giá trị falsy, phương thức không bao giờ trả về.

## Ví dụ

### Sử dụng find()

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
console.log(fibonacci().find(isEven)); // 2

const isNegative = (x) => x < 0;
console.log(fibonacci().take(10).find(isNegative)); // undefined
console.log(fibonacci().find(isNegative)); // Không bao giờ hoàn thành
```

Gọi `find()` luôn đóng iterator nền, ngay cả khi phương thức trả về sớm. Iterator không bao giờ bị để lại ở trạng thái nửa chừng.

```js
const seq = fibonacci();
console.log(seq.find(isEven)); // 2
console.log(seq.next()); // { value: undefined, done: true }
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Iterator.prototype.find` trong `core-js`](https://github.com/zloirock/core-js#iterator-helpers)
- [es-shims polyfill của `Iterator.prototype.find`](https://www.npmjs.com/package/es-iterator-helpers)
- {{jsxref("Iterator")}}
- {{jsxref("Iterator.prototype.every()")}}
- {{jsxref("Iterator.prototype.some()")}}
- {{jsxref("Array.prototype.find()")}}
