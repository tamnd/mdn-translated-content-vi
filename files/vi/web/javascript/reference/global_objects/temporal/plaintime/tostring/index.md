---
title: Temporal.PlainTime.prototype.toString()
short-title: toString()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainTime/toString
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainTime.toString
sidebar: jsref
---

Phương thức **`toString()`** của các thực thể {{jsxref("Temporal.PlainTime")}} trả về một chuỗi đại diện cho thời gian này theo [định dạng RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainTime#rfc_9557_format).

## Cú pháp

```js-nolint
toString()
toString(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng chứa một số hoặc tất cả các thuộc tính sau (theo thứ tự chúng được truy xuất và xác thực):
    - `fractionalSecondDigits` {{optional_inline}}
      - : Một số nguyên từ 0 đến 9, hoặc chuỗi `"auto"`. Mặc định là `"auto"`. Nếu là `"auto"`, các số 0 theo sau trong phần giây thập phân sẽ bị loại bỏ. Nếu không, phần thập phân của thành phần giây chứa số chữ số này, được đệm bằng số 0 hoặc làm tròn nếu cần.
    - `roundingMode` {{optional_inline}}
      - : Một chuỗi chỉ định cách làm tròn các chữ số giây thập phân vượt quá `fractionalSecondDigits`. Xem [`Intl.NumberFormat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/NumberFormat#roundingmode). Mặc định là `"trunc"`.
    - `smallestUnit` {{optional_inline}}
      - : Một chuỗi chỉ định đơn vị nhỏ nhất để đưa vào đầu ra. Các giá trị có thể là `"minute"`, `"second"`, `"millisecond"`, `"microsecond"`, và `"nanosecond"`, hoặc dạng số nhiều của chúng, tương đương (ngoại trừ `"minute"`) với các giá trị `fractionalSecondDigits` lần lượt là `0`, `3`, `6`, `9`. Nếu được chỉ định, `fractionalSecondDigits` sẽ bị bỏ qua.

### Giá trị trả về

Một chuỗi theo [định dạng RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainTime#rfc_9557_format) đại diện cho thời gian này.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Ném ra nếu bất kỳ tùy chọn nào không hợp lệ.
- {{jsxref("TypeError")}}
  - : Ném ra nếu `options` không phải là đối tượng hoặc `undefined`.

## Ví dụ

### Sử dụng toString()

```js
const time = Temporal.PlainTime.from("12:34:56");
console.log(time.toString()); // '12:34:56'
```

### Sử dụng các tùy chọn

```js
const time1 = Temporal.PlainTime.from("12:00:00");
console.log(time1.toString()); // '12:00:00'
console.log(time1.toString({ fractionalSecondDigits: 1 })); // '12:00:00.0'
console.log(time1.toString({ smallestUnit: "minute" })); // '12:00'
console.log(time1.toString({ smallestUnit: "nanosecond" })); // '12:00:00.000000000'

const time2 = Temporal.PlainTime.from("12:34:56.123456789");
console.log(time2.toString({ fractionalSecondDigits: 4 })); // '12:34:56.1234'
console.log(
  time2.toString({ fractionalSecondDigits: 4, roundingMode: "halfExpand" }),
); // '12:34:56.1235'
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainTime")}}
- {{jsxref("Temporal/PlainTime/from", "Temporal.PlainTime.from()")}}
- {{jsxref("Temporal/PlainTime/toJSON", "Temporal.PlainTime.prototype.toJSON()")}}
- {{jsxref("Temporal/PlainTime/toLocaleString", "Temporal.PlainTime.prototype.toLocaleString()")}}
