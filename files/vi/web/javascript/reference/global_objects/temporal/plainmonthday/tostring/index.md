---
title: Temporal.PlainMonthDay.prototype.toString()
short-title: toString()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainMonthDay/toString
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainMonthDay.toString
sidebar: jsref
---

Phương thức **`toString()`** của các instance {{jsxref("Temporal.PlainMonthDay")}} trả về một chuỗi đại diện cho tháng-ngày này theo [định dạng RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainMonthDay#rfc_9557_format).

## Cú pháp

```js-nolint
toString()
toString(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng chứa thuộc tính sau:
    - `calendarName` {{optional_inline}}
      - : Có hiển thị chú thích lịch (`[u-ca=calendar_id]`) trong giá trị trả về hay không. Các giá trị có thể là:
        - `"auto"` (mặc định)
          - : Bao gồm chú thích lịch nếu lịch không phải `"iso8601"`. Năm tham chiếu được bao gồm nếu lịch không phải `"iso8601"`.
        - `"always"`
          - : Luôn bao gồm chú thích lịch. Năm tham chiếu cũng luôn được bao gồm.
        - `"never"`
          - : Không bao giờ bao gồm chú thích lịch. Điều này làm cho chuỗi trả về không thể khôi phục lại cùng instance {{jsxref("Temporal.PlainMonthDay")}}, mặc dù giá trị tháng-ngày vẫn giữ nguyên. Năm tham chiếu được bao gồm nếu lịch không phải `"iso8601"`.
        - `"critical"`
          - : Luôn bao gồm chú thích lịch, và thêm cờ quan trọng: `[!u-ca=calendar_id]`. Hữu ích khi gửi chuỗi tới một số hệ thống nhất định, nhưng không hữu ích cho chính `Temporal`. Năm tham chiếu cũng luôn được bao gồm.

### Giá trị trả về

Một chuỗi theo [định dạng RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainMonthDay#rfc_9557_format) đại diện cho tháng-ngày này. Chú thích lịch được bao gồm như đã chỉ định. Năm tham chiếu được bao gồm nếu chú thích lịch được bao gồm hoặc nếu lịch không phải `"iso8601"`.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném nếu bất kỳ tùy chọn nào không hợp lệ.
- {{jsxref("TypeError")}}
  - : Được ném nếu `options` không phải là đối tượng hay `undefined`.

## Ví dụ

### Sử dụng toString()

```js
const md = Temporal.PlainMonthDay.from({ month: 8, day: 1 });
console.log(md.toString()); // '08-01'

const md2 = Temporal.PlainMonthDay.from({
  monthCode: "M08",
  day: 1,
  calendar: "chinese",
});
console.log(md2.toString()); // '1972-09-08[u-ca=chinese]'
```

### Sử dụng options

```js
const isoMD = Temporal.PlainMonthDay.from({ month: 8, day: 1 });
const md = Temporal.PlainMonthDay.from({
  monthCode: "M08",
  day: 1,
  calendar: "chinese",
});
console.log(isoMD.toString({ calendarName: "auto" })); // '08-01'
console.log(md.toString({ calendarName: "auto" })); // '1972-09-08[u-ca=chinese]'
console.log(isoMD.toString({ calendarName: "always" })); // '1972-08-01[u-ca=iso8601]'
console.log(md.toString({ calendarName: "always" })); // '1972-09-08[u-ca=chinese]'
console.log(isoMD.toString({ calendarName: "never" })); // '08-01'
console.log(md.toString({ calendarName: "never" })); // '1972-09-08'
console.log(isoMD.toString({ calendarName: "critical" })); // '1972-08-01[!u-ca=iso8601]'
console.log(md.toString({ calendarName: "critical" })); // '1972-09-08[!u-ca=chinese]'
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainMonthDay")}}
- {{jsxref("Temporal/PlainMonthDay/from", "Temporal.PlainMonthDay.from()")}}
- {{jsxref("Temporal/PlainMonthDay/toJSON", "Temporal.PlainMonthDay.prototype.toJSON()")}}
- {{jsxref("Temporal/PlainMonthDay/toLocaleString", "Temporal.PlainMonthDay.prototype.toLocaleString()")}}
