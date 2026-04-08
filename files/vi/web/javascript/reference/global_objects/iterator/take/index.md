---
title: Iterator.prototype.take()
short-title: take()
slug: Web/JavaScript/Reference/Global_Objects/Iterator/take
page-type: javascript-instance-method
browser-compat: javascript.builtins.Iterator.take
sidebar: jsref
---

Phương thức **`take()`** của các thực thể {{jsxref("Iterator")}} trả về một [đối tượng iterator helper](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator#iterator_helper_objects) mới yield số lượng phần tử đã cho trong iterator này rồi kết thúc.

## Cú pháp

```js-nolint
take(limit)
```

### Tham số

- `limit`
  - : Số lượng phần tử cần lấy từ đầu quá trình lặp.

### Giá trị trả về

Một [đối tượng iterator helper](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator#iterator_helper_objects) mới. Iterator helper được trả về yield các phần tử trong iterator gốc từng cái một, rồi hoàn thành (phương thức `next()` tạo ra `{ value: undefined, done: true }`) sau khi `limit` phần tử đã được yield, hoặc khi iterator gốc cạn kiệt, tùy cái nào đến trước.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu `limit` trở thành {{jsxref("NaN")}} hoặc âm khi [chuyển đổi thành số nguyên](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#integer_conversion).

## Ví dụ

### Sử dụng take()

Ví dụ sau tạo một iterator yield các số hạng trong dãy Fibonacci, rồi ghi nhật ký ba số hạng đầu tiên:

```js
function* fibonacci() {
  let current = 1;
  let next = 1;
  while (true) {
    yield current;
    [current, next] = [next, current + next];
  }
}

const seq = fibonacci().take(3);
console.log(seq.next().value); // 1
console.log(seq.next().value); // 1
console.log(seq.next().value); // 2
console.log(seq.next().value); // undefined
```

### Sử dụng take() với vòng lặp for...of

`take()` thuận tiện nhất khi bạn không tự xử lý iterator theo cách thủ công. Vì các iterator cũng là iterable, bạn có thể lặp qua helper được trả về với vòng lặp {{jsxref("Statements/for...of", "for...of")}}:

```js
for (const n of fibonacci().take(5)) {
  console.log(n);
}

// In ra:
// 1
// 1
// 2
// 3
// 5
```

Vì `fibonacci()` là iterator vô hạn, sử dụng vòng lặp `for` để lặp nó mà không có logic thoát sớm (chẳng hạn như câu lệnh {{jsxref("Statements/break", "break")}}) sẽ dẫn đến vòng lặp vô hạn.

### Kết hợp drop() với take()

Bạn có thể kết hợp `take()` với {{jsxref("Iterator.prototype.drop()")}} để lấy một phần của iterator:

```js
for (const n of fibonacci().drop(2).take(5)) {
  // Bỏ qua hai phần tử đầu tiên, sau đó lấy năm phần tử tiếp theo
  console.log(n);
}
// In ra:
// 2
// 3
// 5
// 8
// 13

for (const n of fibonacci().take(5).drop(2)) {
  // Lấy năm phần tử đầu tiên, sau đó bỏ qua hai phần tử đầu tiên
  console.log(n);
}
// In ra:
// 2
// 3
// 5
```

### Giới hạn dưới và trên của số lượng take

Khi `limit` âm hoặc là {{jsxref("NaN")}}, một {{jsxref("RangeError")}} được ném ra:

```js
fibonacci().take(-1); // RangeError: -1 must be positive
fibonacci().take(undefined); // RangeError: undefined must be positive
```

Khi `limit` lớn hơn tổng số phần tử mà iterator có thể tạo ra (chẳng hạn như {{jsxref("Infinity")}}), iterator helper được trả về về cơ bản có hành vi giống như iterator gốc:

```js
for (const n of new Set([1, 2, 3]).values().take(Infinity)) {
  console.log(n);
}

// In ra:
// 1
// 2
// 3
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Iterator.prototype.take` trong `core-js`](https://github.com/zloirock/core-js#iterator-helpers)
- [es-shims polyfill của `Iterator.prototype.take`](https://www.npmjs.com/package/es-iterator-helpers)
- {{jsxref("Iterator")}}
- {{jsxref("Iterator.prototype.drop()")}}
