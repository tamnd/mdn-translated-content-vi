---
title: Iterator.prototype.drop()
short-title: drop()
slug: Web/JavaScript/Reference/Global_Objects/Iterator/drop
page-type: javascript-instance-method
browser-compat: javascript.builtins.Iterator.drop
sidebar: jsref
---

Phương thức **`drop()`** của các thực thể {{jsxref("Iterator")}} trả về một [đối tượng iterator helper](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator#iterator_helper_objects) mới bỏ qua số lượng phần tử đã cho ở đầu iterator này.

## Cú pháp

```js-nolint
drop(limit)
```

### Tham số

- `limit`
  - : Số lượng phần tử cần bỏ qua từ đầu quá trình lặp.

### Giá trị trả về

Một [đối tượng iterator helper](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator#iterator_helper_objects) mới. Lần đầu tiên phương thức `next()` của iterator helper được trả về được gọi, iterator hiện tại ngay lập tức tiến `limit` phần tử, rồi phần tử tiếp theo (phần tử thứ `limit+1`) được yield. Sau đó iterator helper yield các phần tử còn lại từng cái một. Nếu iterator hiện tại có ít hơn `limit` phần tử, iterator helper mới sẽ được hoàn thành ngay lập tức lần đầu tiên `next()` được gọi.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu `limit` trở thành {{jsxref("NaN")}} hoặc âm khi [chuyển đổi thành số nguyên](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#integer_conversion).

## Ví dụ

### Sử dụng drop()

Ví dụ sau tạo một iterator yield các số hạng trong dãy Fibonacci, bắt đầu từ số hạng thứ 3 bằng cách bỏ qua hai số hạng đầu tiên:

```js
function* fibonacci() {
  let current = 1;
  let next = 1;
  while (true) {
    yield current;
    [current, next] = [next, current + next];
  }
}

const seq = fibonacci().drop(2);
console.log(seq.next().value); // 2
console.log(seq.next().value); // 3
```

Điều này tương đương với:

```js
const seq = fibonacci();
seq.next();
seq.next();
```

### Sử dụng drop() với vòng lặp for...of

`drop()` thuận tiện nhất khi bạn không tự xử lý iterator theo cách thủ công. Vì các iterator cũng là iterable, bạn có thể lặp qua helper được trả về với vòng lặp {{jsxref("Statements/for...of", "for...of")}}:

```js
for (const n of fibonacci().drop(2)) {
  console.log(n);
  if (n > 30) {
    break;
  }
}

// In ra:
// 2
// 3
// 5
// 8
// 13
// 21
// 34
```

### Kết hợp drop() với take()

Bạn có thể kết hợp `drop()` với {{jsxref("Iterator.prototype.take()")}} để lấy một phần của iterator:

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

### Giới hạn dưới và trên của số lượng drop

Khi `limit` âm hoặc là {{jsxref("NaN")}}, một {{jsxref("RangeError")}} được ném ra:

```js
fibonacci().drop(-1); // RangeError: -1 must be positive
fibonacci().drop(undefined); // RangeError: undefined must be positive
```

Khi `limit` lớn hơn tổng số phần tử mà iterator có thể tạo ra (chẳng hạn như {{jsxref("Infinity")}}), iterator helper được trả về sẽ ngay lập tức bỏ qua tất cả các phần tử và sau đó được hoàn thành lần đầu tiên `next()` được gọi. Nếu iterator hiện tại là vô hạn, iterator helper được trả về sẽ không bao giờ hoàn thành.

```js
fibonacci().drop(Infinity).next(); // Không bao giờ kết thúc
new Set([1, 2, 3]).values().drop(Infinity).next(); // { value: undefined, done: true }
new Set([1, 2, 3]).values().drop(4).next(); // { value: undefined, done: true }
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Iterator.prototype.drop` trong `core-js`](https://github.com/zloirock/core-js#iterator-helpers)
- [es-shims polyfill của `Iterator.prototype.drop`](https://www.npmjs.com/package/es-iterator-helpers)
- {{jsxref("Iterator")}}
- {{jsxref("Iterator.prototype.take()")}}
