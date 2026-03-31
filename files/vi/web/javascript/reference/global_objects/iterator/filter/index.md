---
title: Iterator.prototype.filter()
short-title: filter()
slug: Web/JavaScript/Reference/Global_Objects/Iterator/filter
page-type: javascript-instance-method
browser-compat: javascript.builtins.Iterator.filter
sidebar: jsref
---

Phương thức **`filter()`** của các thực thể {{jsxref("Iterator")}} trả về một [đối tượng iterator helper](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator#iterator_helper_objects) mới chỉ yield những phần tử của iterator mà hàm callback đã cho trả về `true`.

## Cú pháp

```js-nolint
filter(callbackFn)
```

### Tham số

- `callbackFn`
  - : Hàm thực thi cho mỗi phần tử do iterator tạo ra. Nó nên trả về giá trị [truthy](/en-US/docs/Glossary/Truthy) để phần tử được yield bởi iterator helper, và giá trị [falsy](/en-US/docs/Glossary/Falsy) nếu không. Hàm được gọi với các đối số sau:
    - `element`
      - : Phần tử hiện tại đang được xử lý.
    - `index`
      - : Chỉ số của phần tử hiện tại đang được xử lý.

### Giá trị trả về

Một [đối tượng iterator helper](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator#iterator_helper_objects) mới. Mỗi lần phương thức `next()` của iterator helper được gọi, nó trả về phần tử tiếp theo trong iterator mà hàm callback trả về `true`. Khi iterator nền hoàn thành, đối tượng iterator helper cũng hoàn thành (phương thức `next()` tạo ra `{ value: undefined, done: true }`).

## Mô tả

Ưu điểm chính của các iterator helper so với các phương thức mảng là chúng lười biếng, nghĩa là chúng chỉ tạo ra giá trị tiếp theo khi được yêu cầu. Điều này tránh được tính toán không cần thiết và cũng cho phép chúng được sử dụng với các iterator vô hạn.

## Ví dụ

### Sử dụng filter()

Ví dụ sau tạo một iterator yield các số hạng trong dãy Fibonacci, rồi đọc vài số hạng đầu tiên là số chẵn:

```js
function* fibonacci() {
  let current = 1;
  let next = 1;
  while (true) {
    yield current;
    [current, next] = [next, current + next];
  }
}

const seq = fibonacci().filter((x) => x % 2 === 0);
console.log(seq.next().value); // 2
console.log(seq.next().value); // 8
console.log(seq.next().value); // 34
```

### Sử dụng filter() với vòng lặp for...of

`filter()` thuận tiện nhất khi bạn không tự xử lý iterator theo cách thủ công. Vì các iterator cũng là iterable, bạn có thể lặp qua helper được trả về với vòng lặp {{jsxref("Statements/for...of", "for...of")}}:

```js
for (const n of fibonacci().filter((x) => x % 2 === 0)) {
  console.log(n);
  if (n > 30) {
    break;
  }
}

// In ra:
// 2
// 8
// 34
```

Điều này tương đương với:

```js
for (const n of fibonacci()) {
  if (n % 2 !== 0) {
    continue;
  }
  console.log(n);
  if (n > 30) {
    break;
  }
}
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Iterator.prototype.filter` trong `core-js`](https://github.com/zloirock/core-js#iterator-helpers)
- [es-shims polyfill của `Iterator.prototype.filter`](https://www.npmjs.com/package/es-iterator-helpers)
- {{jsxref("Iterator")}}
- {{jsxref("Iterator.prototype.forEach()")}}
- {{jsxref("Iterator.prototype.every()")}}
- {{jsxref("Iterator.prototype.map()")}}
- {{jsxref("Iterator.prototype.some()")}}
- {{jsxref("Iterator.prototype.reduce()")}}
- {{jsxref("Array.prototype.filter()")}}
