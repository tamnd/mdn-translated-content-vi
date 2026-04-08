---
title: Temporal.ZonedDateTime()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/ZonedDateTime
page-type: javascript-constructor
status:
  - experimental
browser-compat: javascript.builtins.Temporal.ZonedDateTime.ZonedDateTime
sidebar: jsref
---

{{SeeCompatTable}}

Constructor **`Temporal.ZonedDateTime()`** tạo các đối tượng {{jsxref("Temporal.ZonedDateTime")}}.

Constructor này cho phép bạn tạo các thực thể bằng cách cung cấp trực tiếp dữ liệu nền. Giống như tất cả các lớp `Temporal` khác, bạn thường nên tạo các đối tượng `Temporal.ZonedDateTime` bằng cách sử dụng phương thức static {{jsxref("Temporal/ZonedDateTime/from", "Temporal.ZonedDateTime.from()")}}, vì nó có thể xử lý nhiều loại đầu vào khác nhau.

## Cú pháp

```js-nolint
new Temporal.ZonedDateTime(epochNanoseconds, timeZone)
new Temporal.ZonedDateTime(epochNanoseconds, timeZone, calendar)
```

> [!NOTE]
> `Temporal.ZonedDateTime()` chỉ có thể được khởi tạo với [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng gọi nó mà không có `new` sẽ ném ra một {{jsxref("TypeError")}}.

### Tham số

- `epochNanoseconds`
  - : Một [BigInt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt) tương ứng với thuộc tính {{jsxref("Temporal/ZonedDateTime/epochNanoseconds", "epochNanoseconds")}}.
- `timeZone`
  - : Một chuỗi tương ứng với thuộc tính {{jsxref("Temporal/ZonedDateTime/timeZoneId", "timeZoneId")}}. Không giống như tất cả các API `Temporal` khác, nó phải là định danh múi giờ hợp lệ (được đặt tên hoặc offset) nguyên trạng, và không thể là thực thể `Temporal.ZonedDateTime` hay chuỗi ngày-giờ.
- `calendar` {{optional_inline}}
  - : Một chuỗi tương ứng với thuộc tính {{jsxref("Temporal/ZonedDateTime/calendarId", "calendarId")}}. Xem [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_calendar_types) để biết danh sách các loại lịch thường được hỗ trợ. Mặc định là `"iso8601"`.

### Giá trị trả về

Một đối tượng `Temporal.ZonedDateTime` mới, biểu thị thời điểm cụ thể được chỉ định bởi các tham số.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `timeZone` hoặc `calendar` không phải là chuỗi.
- {{jsxref("RangeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - `epochNanoseconds` không nằm trong [phạm vi có thể biểu thị](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#representable_dates), là ±10<sup>8</sup> ngày, hoặc khoảng ±273,972.6 năm, từ Unix epoch.
    - `timeZone` không phải là định danh múi giờ hợp lệ.
    - `calendar` không phải là định danh lịch hợp lệ.

## Ví dụ

### Sử dụng Temporal.ZonedDateTime()

```js
const zdt = new Temporal.ZonedDateTime(0n, "America/New_York");
console.log(zdt.toString()); // '1969-12-31T19:00:00-05:00[America/New_York]'
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.ZonedDateTime")}}
- {{jsxref("Temporal/ZonedDateTime/from", "Temporal.ZonedDateTime.from()")}}
