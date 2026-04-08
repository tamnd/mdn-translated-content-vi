---
title: Temporal.PlainDateTime.prototype.toString()
short-title: toString()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime/toString
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainDateTime.toString
sidebar: jsref
---

Phương thức **`toString()`** của các instance {{jsxref("Temporal.PlainDateTime")}} trả về một chuỗi đại diện cho ngày-giờ này theo [định dạng RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime#rfc_9557_format).

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
          - : Không bao giờ bao gồm annotation lịch. Điều này làm cho chuỗi trả về không thể khôi phục lại thành cùng instance {{jsxref("Temporal.PlainDateTime")}}, mặc dù giá trị ngày vẫn giữ nguyên.
        - `"critical"`
          - : Luôn bao gồm annotation lịch, và thêm cờ critical: `[!u-ca=calendar_id]`. Hữu ích khi gửi chuỗi đến một số hệ thống nhất định, nhưng không hữu ích cho bản thân Temporal.
    - `fractionalSecondDigits` {{optional_inline}}
      - : Một số nguyên từ 0 đến 9, hoặc chuỗi `"auto"`. Mặc định là `"auto"`. Nếu là `"auto"`, các số không ở cuối trong phần giây thập phân sẽ bị xóa. Ngược lại, phần thập phân của thành phần giây chứa số chữ số này, được đệm bằng số không hoặc làm tròn nếu cần.
    - `roundingMode` {{optional_inline}}
      - : Một chuỗi chỉ định cách làm tròn các chữ số giây thập phân vượt quá `fractionalSecondDigits`. Xem [`Intl.NumberFormat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/NumberFormat#roundingmode). Mặc định là `"trunc"`.
    - `smallestUnit` {{optional_inline}}
      - : Một chuỗi chỉ định đơn vị nhỏ nhất để bao gồm trong đầu ra. Các giá trị có thể là `"minute"`, `"second"`, `"millisecond"`, `"microsecond"`, và `"nanosecond"`, hoặc dạng số nhiều của chúng, tương đương (ngoại trừ `"minute"`) với các giá trị `fractionalSecondDigits` là `0`, `3`, `6`, `9`, tương ứng. Nếu được chỉ định, thì `fractionalSecondDigits` bị bỏ qua.

### Giá trị trả về

Một chuỗi theo [định dạng RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime#rfc_9557_format) đại diện cho ngày-giờ này. Annotation lịch được bao gồm theo chỉ định.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu bất kỳ tùy chọn nào không hợp lệ.
- {{jsxref("TypeError")}}
  - : Được ném ra nếu `options` không phải là một đối tượng hoặc `undefined`.

## Ví dụ

### Sử dụng toString()

```js
const dt = Temporal.PlainDateTime.from("2021-08-01T12:34:56");
console.log(dt.toString()); // '2021-08-01T12:34:56'
```

Để xem các ví dụ về làm tròn thời gian, xem {{jsxref("Temporal/PlainTime/toString", "Temporal.PlainTime.prototype.toString()")}}. Để xem các ví dụ về hiển thị lịch, xem {{jsxref("Temporal/PlainDate/toString", "Temporal.PlainDate.prototype.toString()")}}.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDateTime")}}
- {{jsxref("Temporal/PlainDateTime/from", "Temporal.PlainDateTime.from()")}}
- {{jsxref("Temporal/PlainDateTime/toJSON", "Temporal.PlainDateTime.prototype.toJSON()")}}
- {{jsxref("Temporal/PlainDateTime/toLocaleString", "Temporal.PlainDateTime.prototype.toLocaleString()")}}
