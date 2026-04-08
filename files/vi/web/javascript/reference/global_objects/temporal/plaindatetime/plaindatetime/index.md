---
title: Temporal.PlainDateTime()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime/PlainDateTime
page-type: javascript-constructor
status:
  - experimental
browser-compat: javascript.builtins.Temporal.PlainDateTime.PlainDateTime
sidebar: jsref
---

{{SeeCompatTable}}

Hàm khởi tạo **`Temporal.PlainDateTime()`** tạo các đối tượng {{jsxref("Temporal.PlainDateTime")}}.

Hàm khởi tạo này cho phép bạn tạo các instance bằng cách cung cấp trực tiếp dữ liệu cơ sở. Giống như tất cả các lớp `Temporal` khác, bạn thường nên xây dựng các đối tượng `Temporal.PlainDateTime` bằng phương thức tĩnh {{jsxref("Temporal/PlainDateTime/from", "Temporal.PlainDateTime.from()")}}, có thể xử lý nhiều loại đầu vào khác nhau.

## Cú pháp

```js-nolint
new Temporal.PlainDateTime(year, month, day)
new Temporal.PlainDateTime(year, month, day, hour)
new Temporal.PlainDateTime(year, month, day, hour, minute)
new Temporal.PlainDateTime(year, month, day, hour, minute, second)
new Temporal.PlainDateTime(year, month, day, hour, minute, second, millisecond)
new Temporal.PlainDateTime(year, month, day, hour, minute, second, millisecond, microsecond)
new Temporal.PlainDateTime(year, month, day, hour, minute, second, millisecond, microsecond, nanosecond)
new Temporal.PlainDateTime(year, month, day, hour, minute, second, millisecond, microsecond, nanosecond, calendar)
```

> [!NOTE]
> `Temporal.PlainDateTime()` chỉ có thể được khởi tạo bằng [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng gọi nó mà không có `new` sẽ ném {{jsxref("TypeError")}}.

### Tham số

- `year`
  - : Một số, được cắt bớt thành số nguyên, đại diện cho năm trong hệ thống lịch ISO.
- `month`
  - : Một số, được cắt bớt thành số nguyên, đại diện cho tháng trong hệ thống lịch ISO.
- `day`
  - : Một số, được cắt bớt thành số nguyên, đại diện cho ngày trong tháng trong hệ thống lịch ISO.
- `hour` {{optional_inline}}
  - : Một số, được cắt bớt thành số nguyên, đại diện cho thành phần giờ.
- `minute` {{optional_inline}}
  - : Một số, được cắt bớt thành số nguyên, đại diện cho thành phần phút.
- `second` {{optional_inline}}
  - : Một số, được cắt bớt thành số nguyên, đại diện cho thành phần giây.
- `millisecond` {{optional_inline}}
  - : Một số, được cắt bớt thành số nguyên, đại diện cho thành phần mili giây.
- `microsecond` {{optional_inline}}
  - : Một số, được cắt bớt thành số nguyên, đại diện cho thành phần micro giây.
- `nanosecond` {{optional_inline}}
  - : Một số, được cắt bớt thành số nguyên, đại diện cho thành phần nano giây.
- `calendar` {{optional_inline}}
  - : Một chuỗi đại diện cho [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars) muốn sử dụng. Xem [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_calendar_types) để biết danh sách các loại lịch thường được hỗ trợ. Mặc định là `"iso8601"`. Lưu ý rằng bất kể `calendar` là gì, `year`, `month`, và `day` phải theo hệ thống lịch ISO 8601.

### Giá trị trả về

Một đối tượng `Temporal.PlainDateTime` mới, đại diện cho ngày-giờ được chỉ định bởi các tham số.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - Bất kỳ thành phần ngày-giờ nào không phải là số hữu hạn.
    - Tổ hợp thành phần ngày-giờ không đại diện cho một ngày hợp lệ trong hệ thống lịch ISO, hoặc không nằm trong [phạm vi có thể biểu diễn](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#representable_dates), là ±(10<sup>8</sup> + 1) ngày, khoảng ±273.972,6 năm, tính từ Unix epoch.
    - `calendar` không phải là định danh lịch hợp lệ.

## Ví dụ

### Sử dụng Temporal.PlainDateTime()

```js
const dt = new Temporal.PlainDateTime(2021, 7, 1);
console.log(dt.toString()); // 2021-07-01T00:00:00

const dt2 = new Temporal.PlainDateTime(2021, 7, 1, 0, 0, 0, 0, 0, 0, "hebrew");
console.log(dt2.toString()); // 2021-07-01T00:00:00[u-ca=hebrew]
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDateTime")}}
- {{jsxref("Temporal/PlainDateTime/from", "Temporal.PlainDateTime.from()")}}
