---
title: Iterator.prototype.reduce()
short-title: reduce()
slug: Web/JavaScript/Reference/Global_Objects/Iterator/reduce
page-type: javascript-instance-method
browser-compat: javascript.builtins.Iterator.reduce
sidebar: jsref
---

Phương thức **`reduce()`** của các thực thể {{jsxref("Iterator")}} tương tự như {{jsxref("Array.prototype.reduce")}}: nó thực thi hàm "reducer" do người dùng cung cấp trên mỗi phần tử do iterator tạo ra, truyền vào giá trị trả về từ phép tính trên phần tử trước. Kết quả cuối cùng của việc chạy reducer qua tất cả các phần tử là một giá trị duy nhất.

## Cú pháp

```js-nolint
reduce(callbackFn)
reduce(callbackFn, initialValue)
```

### Tham số

- `callbackFn`
  - : Hàm thực thi cho mỗi phần tử do iterator tạo ra. Giá trị trả về của nó trở thành giá trị của tham số `accumulator` trong lần gọi tiếp theo của `callbackFn`. Với lần gọi cuối cùng, giá trị trả về trở thành giá trị trả về của `reduce()`. Hàm được gọi với các đối số sau:
    - `accumulator`
      - : Giá trị từ lần gọi trước của `callbackFn`. Trong lần gọi đầu tiên, giá trị của nó là `initialValue` nếu cái sau được chỉ định; ngược lại giá trị của nó là phần tử đầu tiên của iterator.
    - `currentValue`
      - : Giá trị của phần tử hiện tại. Trong lần gọi đầu tiên, giá trị của nó là phần tử đầu tiên của iterator nếu `initialValue` được chỉ định; ngược lại giá trị của nó là phần tử thứ hai.
    - `currentIndex`
      - : Vị trí chỉ số của `currentValue`. Trong lần gọi đầu tiên, giá trị của nó là `0` nếu `initialValue` được chỉ định, ngược lại là `1`.
- `initialValue` {{optional_inline}}
  - : Một giá trị mà `accumulator` được khởi tạo lần đầu tiên callback được gọi. Nếu `initialValue` được chỉ định, `callbackFn` bắt đầu thực thi với phần tử đầu tiên là `currentValue`. Nếu `initialValue` _không_ được chỉ định, `accumulator` được khởi tạo với phần tử đầu tiên và `callbackFn` bắt đầu thực thi với phần tử thứ hai là `currentValue`. Trong trường hợp này, nếu iterator rỗng (không có giá trị đầu tiên để trả về làm `accumulator`), một lỗi sẽ được ném ra.

### Giá trị trả về

Giá trị kết quả từ việc chạy hàm callback "reducer" đến hoàn thành trên toàn bộ iterator.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu iterator không chứa phần tử nào và `initialValue` không được cung cấp.

## Mô tả

Xem {{jsxref("Array.prototype.reduce()")}} để biết chi tiết về cách `reduce()` hoạt động. Không giống hầu hết các phương thức iterator helper khác, nó không hoạt động tốt với các iterator vô hạn vì nó không lười biếng.

## Ví dụ

### Sử dụng reduce()

Ví dụ sau tạo một iterator yield các số hạng trong dãy Fibonacci, rồi tính tổng mười số hạng đầu tiên:

```js
function* fibonacci() {
  let current = 1;
  let next = 1;
  while (true) {
    yield current;
    [current, next] = [next, current + next];
  }
}

console.log(
  fibonacci()
    .take(10)
    .reduce((a, b) => a + b),
); // 143
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Iterator.prototype.reduce` trong `core-js`](https://github.com/zloirock/core-js#iterator-helpers)
- [es-shims polyfill của `Iterator.prototype.reduce`](https://www.npmjs.com/package/es-iterator-helpers)
- {{jsxref("Iterator")}}
- {{jsxref("Iterator.prototype.map()")}}
- {{jsxref("Iterator.prototype.flatMap()")}}
- {{jsxref("Array.prototype.reduce()")}}
