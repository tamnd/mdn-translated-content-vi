---
title: Temporal.Duration.prototype.toString()
short-title: toString()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Duration/toString
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.Duration.toString
sidebar: jsref
---

Phương thức **`toString()`** của các instance {{jsxref("Temporal.Duration")}} trả về một chuỗi biểu diễn duration này theo [định dạng ISO 8601](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#iso_8601_duration_format).

## Cú pháp

```js-nolint
toString()
toString(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng chứa một số hoặc tất cả các thuộc tính sau (theo thứ tự chúng được truy xuất và xác thực):
    - `fractionalSecondDigits` {{optional_inline}}
      - : Một số nguyên từ 0 đến 9, hoặc chuỗi `"auto"`. Mặc định là `"auto"`. Nếu là `"auto"`, các số 0 ở cuối sẽ bị xóa khỏi phần thập phân của giây. Ngược lại, phần thập phân của thành phần giây chứa số chữ số này, được đệm bằng số 0 hoặc làm tròn khi cần.
    - `roundingMode` {{optional_inline}}
      - : Một chuỗi chỉ định cách làm tròn các chữ số giây thập phân vượt quá `fractionalSecondDigits`. Xem [`Intl.NumberFormat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/NumberFormat#roundingmode). Mặc định là `"trunc"`.
    - `smallestUnit` {{optional_inline}}
      - : Một chuỗi chỉ định đơn vị nhỏ nhất cần đưa vào đầu ra. Các giá trị có thể là `"second"`, `"millisecond"`, `"microsecond"`, và `"nanosecond"`, hoặc dạng số nhiều của chúng, tương đương với các giá trị `fractionalSecondDigits` là `0`, `3`, `6`, `9` tương ứng. Nếu được chỉ định, `fractionalSecondDigits` sẽ bị bỏ qua.

### Giá trị trả về

Một chuỗi biểu diễn duration đã cho theo [định dạng ISO 8601](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#iso_8601_duration_format), với các thành phần dưới giây được định dạng theo các tùy chọn. Duration bằng không được biểu diễn là `"PT0S"`.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu bất kỳ tùy chọn nào không hợp lệ.

## Ví dụ

### Sử dụng toString()

```js
const duration = Temporal.Duration.from({ hours: 1, minutes: 30, seconds: 15 });
console.log(duration.toString()); // 'PT1H30M15S'

// Chuyển thành chuỗi ngầm định gọi toString()
console.log(`${duration}`); // 'PT1H30M15S'
```

### Sử dụng options

```js
const worldRecord = Temporal.Duration.from({ seconds: 9, milliseconds: 580 });
console.log(worldRecord.toString()); // 'PT9.58S'
console.log(worldRecord.toString({ fractionalSecondDigits: 1 })); // 'PT9.5S'
console.log(worldRecord.toString({ fractionalSecondDigits: 0 })); // 'PT9S'
console.log(worldRecord.toString({ smallestUnit: "millisecond" })); // 'PT9.580S'
console.log(
  worldRecord.toString({
    fractionalSecondDigits: 1,
    roundingMode: "halfExpand",
  }),
); // 'PT9.6S'
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/Duration/toJSON", "Temporal.Duration.prototype.toJSON()")}}
- {{jsxref("Temporal/Duration/toLocaleString", "Temporal.Duration.prototype.toLocaleString()")}}
