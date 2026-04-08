---
title: Temporal.PlainYearMonth.prototype.toString()
short-title: toString()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainYearMonth/toString
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainYearMonth.toString
sidebar: jsref
---

Phương thức **`toString()`** của các thực thể {{jsxref("Temporal.PlainYearMonth")}} trả về một chuỗi đại diện cho năm-tháng này theo [định dạng RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainYearMonth#rfc_9557_format).

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
          - : Bao gồm chú thích lịch nếu lịch không phải là `"iso8601"`. Ngày tham chiếu được bao gồm nếu lịch không phải là `"iso8601"`.
        - `"always"`
          - : Luôn bao gồm chú thích lịch. Ngày tham chiếu cũng luôn được bao gồm.
        - `"never"`
          - : Không bao giờ bao gồm chú thích lịch. Điều này làm cho chuỗi được trả về không thể khôi phục về cùng thực thể {{jsxref("Temporal.PlainYearMonth")}}, mặc dù giá trị năm-tháng vẫn giữ nguyên. Ngày tham chiếu được bao gồm nếu lịch không phải là `"iso8601"`.
        - `"critical"`
          - : Luôn bao gồm chú thích lịch và thêm cờ critical: `[!u-ca=calendar_id]`. Hữu ích khi gửi chuỗi đến một số hệ thống nhất định, nhưng không hữu ích cho chính Temporal. Ngày tham chiếu cũng luôn được bao gồm.

### Giá trị trả về

Một chuỗi theo [định dạng RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainYearMonth#rfc_9557_format) đại diện cho năm-tháng này. Chú thích lịch được bao gồm như đã chỉ định. Ngày tham chiếu được bao gồm nếu có chú thích lịch hoặc nếu lịch không phải là `"iso8601"`.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Ném ra nếu bất kỳ tùy chọn nào không hợp lệ.
- {{jsxref("TypeError")}}
  - : Ném ra nếu `options` không phải là đối tượng hoặc `undefined`.

## Ví dụ

### Sử dụng toString()

```js
const ym = Temporal.PlainYearMonth.from({ year: 2021, month: 8 });
console.log(ym.toString()); // '2021-08'

const ym2 = Temporal.PlainYearMonth.from({
  year: 5781,
  monthCode: "M08",
  calendar: "hebrew",
});
console.log(ym2.toString()); // '2021-04-13[u-ca=hebrew]'
```

### Sử dụng các tùy chọn

```js
const isoYM = Temporal.PlainYearMonth.from({ year: 2021, month: 8 });
const ym = Temporal.PlainYearMonth.from({
  year: 5781,
  monthCode: "M08",
  calendar: "hebrew",
});
console.log(isoYM.toString({ calendarName: "auto" })); // '2021-08'
console.log(ym.toString({ calendarName: "auto" })); // '2021-04-13[u-ca=hebrew]'
console.log(isoYM.toString({ calendarName: "always" })); // '2021-08-01[u-ca=iso8601]'
console.log(ym.toString({ calendarName: "always" })); // '2021-04-13[u-ca=hebrew]'
console.log(isoYM.toString({ calendarName: "never" })); // '2021-08'
console.log(ym.toString({ calendarName: "never" })); // '2021-04-13'
console.log(isoYM.toString({ calendarName: "critical" })); // '2021-08-01[!u-ca=iso8601]'
console.log(ym.toString({ calendarName: "critical" })); // '2021-04-13[!u-ca=hebrew]'
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainYearMonth")}}
- {{jsxref("Temporal/PlainYearMonth/from", "Temporal.PlainYearMonth.from()")}}
- {{jsxref("Temporal/PlainYearMonth/toJSON", "Temporal.PlainYearMonth.prototype.toJSON()")}}
- {{jsxref("Temporal/PlainYearMonth/toLocaleString", "Temporal.PlainYearMonth.prototype.toLocaleString()")}}
