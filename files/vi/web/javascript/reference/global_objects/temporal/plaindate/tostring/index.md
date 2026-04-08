---
title: Temporal.PlainDate.prototype.toString()
short-title: toString()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate/toString
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainDate.toString
sidebar: jsref
---

Phương thức **`toString()`** của các instance {{jsxref("Temporal.PlainDate")}} trả về một chuỗi đại diện cho ngày này theo [định dạng RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate#rfc_9557_format).

## Cú pháp

```js-nolint
toString()
toString(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng chứa thuộc tính sau:
    - `calendarName` {{optional_inline}}
      - : Có nên hiển thị chú thích lịch (`[u-ca=calendar_id]`) trong giá trị trả về hay không. Các giá trị có thể là:
        - `"auto"` (mặc định)
          - : Bao gồm chú thích lịch nếu lịch không phải là `"iso8601"`.
        - `"always"`
          - : Luôn bao gồm chú thích lịch.
        - `"never"`
          - : Không bao giờ bao gồm chú thích lịch. Điều này làm cho chuỗi trả về không thể phục hồi lại thành cùng một instance {{jsxref("Temporal.PlainDate")}}, mặc dù giá trị ngày vẫn giữ nguyên.
        - `"critical"`
          - : Luôn bao gồm chú thích lịch và thêm cờ quan trọng: `[!u-ca=calendar_id]`. Hữu ích khi gửi chuỗi đến một số hệ thống nhất định, nhưng không hữu ích cho bản thân Temporal.

### Giá trị trả về

Một chuỗi theo [định dạng RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate#rfc_9557_format) đại diện cho ngày này. Chú thích lịch được bao gồm như đã chỉ định.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Ném ra nếu bất kỳ tùy chọn nào không hợp lệ.
- {{jsxref("TypeError")}}
  - : Ném ra nếu `options` không phải là đối tượng hoặc `undefined`.

## Ví dụ

### Sử dụng toString()

```js
const date = Temporal.PlainDate.from("2021-08-01");
console.log(date.toString()); // '2021-08-01'
```

### Sử dụng tùy chọn

```js
const isoDate = Temporal.PlainDate.from({ year: 2021, month: 8, day: 1 });
const date = Temporal.PlainDate.from({
  year: 2021,
  month: 8,
  day: 1,
  calendar: "islamic-umalqura",
});
console.log(isoDate.toString({ calendarName: "auto" })); // '2021-08-01'
console.log(date.toString({ calendarName: "auto" })); // '2582-12-17[u-ca=islamic-umalqura]'
console.log(isoDate.toString({ calendarName: "always" })); // '2021-08-01[u-ca=iso8601]'
console.log(date.toString({ calendarName: "always" })); // '2582-12-17[u-ca=islamic-umalqura]'
console.log(date.toString({ calendarName: "never" })); // '2582-12-17'
console.log(isoDate.toString({ calendarName: "critical" })); // '2021-08-01[!u-ca=iso8601]'
console.log(date.toString({ calendarName: "critical" })); // '2582-12-17[!u-ca=islamic-umalqura]'
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDate")}}
- {{jsxref("Temporal/PlainDate/from", "Temporal.PlainDate.from()")}}
- {{jsxref("Temporal/PlainDate/toJSON", "Temporal.PlainDate.prototype.toJSON()")}}
- {{jsxref("Temporal/PlainDate/toLocaleString", "Temporal.PlainDate.prototype.toLocaleString()")}}
