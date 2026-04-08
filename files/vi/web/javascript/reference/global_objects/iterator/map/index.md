---
title: Iterator.prototype.map()
short-title: map()
slug: Web/JavaScript/Reference/Global_Objects/Iterator/map
page-type: javascript-instance-method
browser-compat: javascript.builtins.Iterator.map
sidebar: jsref
---

Phương thức **`map()`** của các thực thể {{jsxref("Iterator")}} trả về một [đối tượng iterator helper](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator#iterator_helper_objects) mới yield các phần tử của iterator, mỗi phần tử được biến đổi bởi hàm ánh xạ.

## Cú pháp

```js-nolint
map(callbackFn)
```

### Tham số

- `callbackFn`
  - : Hàm thực thi cho mỗi phần tử do iterator tạo ra. Giá trị trả về của nó được yield bởi iterator helper. Hàm được gọi với các đối số sau:
    - `element`
      - : Phần tử hiện tại đang được xử lý.
    - `index`
      - : Chỉ số của phần tử hiện tại đang được xử lý.

### Giá trị trả về

Một [đối tượng iterator helper](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator#iterator_helper_objects) mới. Mỗi lần phương thức `next()` của iterator helper được gọi, nó lấy phần tử tiếp theo từ iterator nền, áp dụng `callbackFn` và yield giá trị trả về. Khi iterator nền hoàn thành, iterator helper cũng hoàn thành (phương thức `next()` tạo ra `{ value: undefined, done: true }`).

## Mô tả

Ưu điểm chính của các iterator helper so với các phương thức mảng là chúng lười biếng, nghĩa là chúng chỉ tạo ra giá trị tiếp theo khi được yêu cầu. Điều này tránh được tính toán không cần thiết và cũng cho phép chúng được sử dụng với các iterator vô hạn. Phương thức `map()` cho phép bạn tạo một iterator mới mà khi được lặp sẽ tạo ra các phần tử đã biến đổi.

## Ví dụ

### Sử dụng map()

Ví dụ sau tạo một iterator yield các số hạng trong dãy Fibonacci, biến đổi thành dãy mới với mỗi số hạng được bình phương, rồi đọc vài số hạng đầu tiên:

```js
function* fibonacci() {
  let current = 1;
  let next = 1;
  while (true) {
    yield current;
    [current, next] = [next, current + next];
  }
}

const seq = fibonacci().map((x) => x ** 2);
console.log(seq.next().value); // 1
console.log(seq.next().value); // 1
console.log(seq.next().value); // 4
```

### Sử dụng map() với vòng lặp for...of

`map()` thuận tiện nhất khi bạn không tự xử lý iterator theo cách thủ công. Vì các iterator cũng là iterable, bạn có thể lặp qua helper được trả về với vòng lặp {{jsxref("Statements/for...of", "for...of")}}:

```js
for (const n of fibonacci().map((x) => x ** 2)) {
  console.log(n);
  if (n > 30) {
    break;
  }
}

// In ra:
// 1
// 1
// 4
// 9
// 25
// 64
```

Điều này tương đương với:

```js
for (const n of fibonacci()) {
  const n2 = n ** 2;
  console.log(n2);
  if (n2 > 30) {
    break;
  }
}
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Iterator.prototype.map` trong `core-js`](https://github.com/zloirock/core-js#iterator-helpers)
- [es-shims polyfill của `Iterator.prototype.map`](https://www.npmjs.com/package/es-iterator-helpers)
- {{jsxref("Iterator")}}
- {{jsxref("Iterator.prototype.flatMap()")}}
- {{jsxref("Array.prototype.reduce()")}}
