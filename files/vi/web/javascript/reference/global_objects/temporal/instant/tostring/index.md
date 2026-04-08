---
title: Temporal.Instant.prototype.toString()
short-title: toString()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Instant/toString
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.Instant.toString
sidebar: jsref
---

Phương thức **`toString()`** của các instance {{jsxref("Temporal.Instant")}} trả về một chuỗi biểu diễn instant này theo [định dạng RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Instant#rfc_9557_format) sử dụng múi giờ được chỉ định.

## Cú pháp

```js-nolint
toString()
toString(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng chứa một số hoặc tất cả các thuộc tính sau (theo thứ tự chúng được truy xuất và xác thực):
    - `fractionalSecondDigits` {{optional_inline}}
      - : Một số nguyên từ 0 đến 9, hoặc chuỗi `"auto"`. Mặc định là `"auto"`. Nếu là `"auto"`, các số không ở cuối phần giây thập phân sẽ bị xóa. Nếu không, phần thập phân của thành phần giây sẽ có số chữ số này, được đệm bằng số không hoặc làm tròn khi cần thiết.
    - `roundingMode` {{optional_inline}}
      - : Một chuỗi chỉ định cách làm tròn các chữ số giây thập phân vượt quá `fractionalSecondDigits`. Xem [`Intl.NumberFormat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/NumberFormat#roundingmode). Mặc định là `"trunc"`.
    - `smallestUnit` {{optional_inline}}
      - : Một chuỗi chỉ định đơn vị nhỏ nhất cần đưa vào đầu ra. Các giá trị có thể là `"minute"`, `"second"`, `"millisecond"`, `"microsecond"`, và `"nanosecond"`, hoặc dạng số nhiều của chúng, tương đương (ngoại trừ `"minute"`) với các giá trị `fractionalSecondDigits` lần lượt là `0`, `3`, `6`, `9`. Nếu được chỉ định, `fractionalSecondDigits` sẽ bị bỏ qua.
    - `timeZone` {{optional_inline}}
      - : Một chuỗi hoặc instance {{jsxref("Temporal.ZonedDateTime")}} biểu diễn múi giờ cần sử dụng. Nếu là instance `Temporal.ZonedDateTime`, múi giờ của nó sẽ được dùng. Nếu là chuỗi, có thể là định danh múi giờ được đặt tên, định danh múi giờ theo offset, hoặc chuỗi date-time chứa định danh múi giờ hoặc offset (xem [múi giờ và offset](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#time_zones_and_offsets) để biết thêm thông tin). Mặc định là `"UTC"`.

### Giá trị trả về

Một chuỗi theo [định dạng RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Instant#rfc_9557_format) biểu diễn instant này sử dụng múi giờ được chỉ định. Không có annotation nào như tên múi giờ được đưa vào.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu bất kỳ tùy chọn nào không hợp lệ.

## Ví dụ

### Sử dụng toString()

```js
const instant = Temporal.Instant.fromEpochMilliseconds(1627814412345);
console.log(instant.toString()); // '2021-08-01T10:40:12.345Z'

// Chuyển đổi chuỗi ngầm định sẽ gọi toString()
console.log(`${instant}`); // '2021-08-01T10:40:12.345Z'
```

### Sử dụng các tùy chọn

```js
const instant = Temporal.Instant.fromEpochMilliseconds(1627814412345);
console.log(instant.toString({ fractionalSecondDigits: 1 })); // '2021-08-01T10:40:12.3Z'
console.log(instant.toString({ smallestUnit: "minute" })); // '2021-08-01T10:40Z'
console.log(instant.toString({ timeZone: "America/New_York" })); // '2021-08-01T06:40:12.345-04:00'

// Tên múi giờ tự động phân giải thành offset đúng
// dựa trên instant; ví dụ, America/New_York là UTC-4 vào mùa hè,
// nhưng là UTC-5 vào mùa đông.
const instant2 = Temporal.Instant.fromEpochMilliseconds(1577836800000);
console.log(instant2.toString({ timeZone: "UTC" })); // '2029-12-31T23:00:00Z'
console.log(instant2.toString({ timeZone: "America/New_York" })); // '2019-12-31T19:00:00-05:00'
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Instant")}}
- {{jsxref("Temporal/Instant/from", "Temporal.Instant.from()")}}
- {{jsxref("Temporal/Instant/toJSON", "Temporal.Instant.prototype.toJSON()")}}
- {{jsxref("Temporal/Instant/toLocaleString", "Temporal.Instant.prototype.toLocaleString()")}}
