---
title: Temporal.ZonedDateTime.prototype.toString()
short-title: toString()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/toString
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.ZonedDateTime.toString
sidebar: jsref
---

Phương thức **`toString()`** của các thực thể {{jsxref("Temporal.ZonedDateTime")}} trả về một chuỗi biểu thị ngày-giờ này theo [định dạng RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#rfc_9557_format).

## Cú pháp

```js-nolint
toString()
toString(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng chứa các thuộc tính sau:
    - `calendarName` {{optional_inline}}
      - : Có hiển thị annotation lịch (`[u-ca=calendar_id]`) trong giá trị trả về hay không. Các giá trị có thể là:
        - `"auto"` (mặc định)
          - : Bao gồm annotation lịch nếu lịch không phải là `"iso8601"`.
        - `"always"`
          - : Luôn bao gồm annotation lịch.
        - `"never"`
          - : Không bao giờ bao gồm annotation lịch. Điều này làm cho chuỗi trả về không thể khôi phục về cùng một thực thể {{jsxref("Temporal.ZonedDateTime")}}, mặc dù giá trị ngày vẫn giữ nguyên.
        - `"critical"`
          - : Luôn bao gồm annotation lịch và thêm flag critical: `[!u-ca=calendar_id]`. Hữu ích khi gửi chuỗi đến một số hệ thống nhất định, nhưng không hữu ích cho chính Temporal.
    - `fractionalSecondDigits` {{optional_inline}}
      - : Một số nguyên từ 0 đến 9, hoặc chuỗi `"auto"`. Mặc định là `"auto"`. Nếu là `"auto"`, các số 0 cuối trong giây thập phân bị xóa. Ngược lại, phần thập phân của thành phần giây chứa số chữ số này, được đệm bằng số 0 hoặc làm tròn khi cần thiết.
    - `roundingMode` {{optional_inline}}
      - : Một chuỗi chỉ định cách làm tròn các chữ số giây thập phân vượt quá `fractionalSecondDigits`. Xem [`Intl.NumberFormat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/NumberFormat#roundingmode). Mặc định là `"trunc"`.
    - `smallestUnit` {{optional_inline}}
      - : Một chuỗi chỉ định đơn vị nhỏ nhất cần đưa vào đầu ra. Các giá trị có thể là `"minute"`, `"second"`, `"millisecond"`, `"microsecond"` và `"nanosecond"`, hoặc dạng số nhiều của chúng, tương đương (ngoại trừ `"minute"`) với các giá trị `fractionalSecondDigits` là `0`, `3`, `6`, `9` tương ứng. Nếu được chỉ định, `fractionalSecondDigits` sẽ bị bỏ qua.
    - `timeZoneName` {{optional_inline}}
      - : Có hiển thị tên múi giờ (`[time_zone_id]`) trong giá trị trả về hay không. Các giá trị có thể là:
        - `"auto"` (mặc định)
          - : Luôn bao gồm tên múi giờ.
        - `"never"`
          - : Không bao giờ bao gồm tên múi giờ. Điều này làm cho chuỗi trả về không thể khôi phục về cùng một thực thể {{jsxref("Temporal.ZonedDateTime")}}.
        - `"critical"`
          - : Luôn bao gồm tên múi giờ và thêm flag critical: `[!time)zone_id]`. Hữu ích khi gửi chuỗi đến một số hệ thống nhất định, nhưng không hữu ích cho chính Temporal.
    - `offset` {{optional_inline}}
      - : Có hiển thị offset (`±HH:mm`) trong giá trị trả về hay không. Các giá trị có thể là:
        - `"auto"` (mặc định)
          - : Luôn bao gồm offset.
        - `"never"`
          - : Không bao giờ bao gồm offset. Điều này làm cho chuỗi trả về không thể khôi phục về cùng một thực thể {{jsxref("Temporal.ZonedDateTime")}}, nếu múi giờ được bao gồm nhưng giờ không rõ ràng, hoặc nếu múi giờ cũng không được bao gồm.

### Giá trị trả về

Một chuỗi theo [định dạng RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#rfc_9557_format) biểu thị ngày-giờ này. Offset và các annotation lịch/múi giờ được bao gồm theo chỉ định.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu bất kỳ tùy chọn nào không hợp lệ.
- {{jsxref("TypeError")}}
  - : Được ném ra nếu `options` không phải là đối tượng hoặc `undefined`.

## Ví dụ

### Sử dụng toString()

```js
const zdt = Temporal.ZonedDateTime.from(
  "2021-08-01T12:34:56[America/New_York]",
);
console.log(zdt.toString()); // '2021-08-01T12:34:56-04:00[America/New_York]'
```

Ngay cả đối với múi giờ `UTC`, offset là `+00:00`, không phải `Z`:

```js
const zdt = Temporal.ZonedDateTime.from("2021-08-01T12:34:56[UTC]");
console.log(zdt.toString()); // '2021-08-01T12:34:56+00:00[UTC]'
```

### Sử dụng các tùy chọn

Để biết các ví dụ với làm tròn thời gian, xem {{jsxref("Temporal/PlainTime/toString", "Temporal.PlainTime.prototype.toString()")}}. Để biết các ví dụ với hiển thị lịch, xem {{jsxref("Temporal/PlainDate/toString", "Temporal.PlainDate.prototype.toString()")}}. Ở đây chúng ta hiển thị cách kiểm soát việc hiển thị múi giờ và offset:

```js
const zdt = Temporal.ZonedDateTime.from(
  "2021-08-01T12:34:56[America/New_York]",
);
console.log(zdt.toString({ timeZoneName: "auto", offset: "never" })); // '2021-08-01T12:34:56[America/New_York]'
console.log(zdt.toString({ timeZoneName: "never", offset: "auto" })); // '2021-08-01T12:34:56-04:00'
console.log(zdt.toString({ timeZoneName: "never", offset: "never" })); // '2021-08-01T12:34:56'
console.log(zdt.toString({ timeZoneName: "critical", offset: "never" })); // '2021-08-01T12:34:56[!America/New_York]'
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.ZonedDateTime")}}
- {{jsxref("Temporal/ZonedDateTime/from", "Temporal.ZonedDateTime.from()")}}
- {{jsxref("Temporal/ZonedDateTime/toJSON", "Temporal.ZonedDateTime.prototype.toJSON()")}}
- {{jsxref("Temporal/ZonedDateTime/toLocaleString", "Temporal.ZonedDateTime.prototype.toLocaleString()")}}
