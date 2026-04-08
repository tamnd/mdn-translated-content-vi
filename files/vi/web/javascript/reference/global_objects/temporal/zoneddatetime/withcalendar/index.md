---
title: Temporal.ZonedDateTime.prototype.withCalendar()
short-title: withCalendar()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/withCalendar
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.ZonedDateTime.withCalendar
sidebar: jsref
---

Phương thức **`withCalendar()`** của các thực thể {{jsxref("Temporal.ZonedDateTime")}} trả về một đối tượng `Temporal.ZonedDateTime` mới biểu thị ngày-giờ này được diễn giải trong hệ thống lịch mới. Vì tất cả các đối tượng `Temporal` được thiết kế để bất biến, phương thức này về cơ bản hoạt động như setter cho thuộc tính {{jsxref("Temporal/ZonedDateTime/calendarId", "calendarId")}} của ngày-giờ.

Để thay thế các thuộc tính thành phần ngày-giờ, hãy sử dụng phương thức {{jsxref("Temporal/ZonedDateTime/with", "with()")}}. Để thay thế múi giờ của nó, hãy sử dụng phương thức {{jsxref("Temporal/ZonedDateTime/withTimeZone", "withTimeZone()")}}.

## Cú pháp

```js-nolint
withCalendar(calendar)
```

### Tham số

- `calendar`
  - : Một chuỗi tương ứng với thuộc tính {{jsxref("Temporal/ZonedDateTime/calendarId", "calendarId")}}. Xem [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_calendar_types) để biết danh sách các loại lịch thường được hỗ trợ.

### Giá trị trả về

Một đối tượng `Temporal.ZonedDateTime` mới, biểu thị ngày-giờ được chỉ định bởi `ZonedDateTime` ban đầu, được diễn giải trong hệ thống lịch mới.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `calendar` không phải là một chuỗi.
- {{jsxref("RangeError")}}
  - : Được ném ra nếu `calendar` không phải là một định danh lịch hợp lệ.

## Ví dụ

### Sử dụng withCalendar()

```js
const zdt = Temporal.ZonedDateTime.from(
  "2021-07-01T12:34:56[America/New_York]",
);
const newZDT = zdt.withCalendar("islamic-umalqura");
console.log(newZDT.toLocaleString("en-US", { calendar: "islamic-umalqura" }));
// 11/21/1442 AH, 12:34:56 PM EDT
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.ZonedDateTime")}}
- {{jsxref("Temporal/ZonedDateTime/with", "Temporal.ZonedDateTime.prototype.with()")}}
- {{jsxref("Temporal/ZonedDateTime/withTimeZone", "Temporal.ZonedDateTime.prototype.withTimeZone()")}}
- {{jsxref("Temporal/ZonedDateTime/withPlainTime", "Temporal.ZonedDateTime.prototype.withPlainTime()")}}
- {{jsxref("Temporal/ZonedDateTime/from", "Temporal.ZonedDateTime.from()")}}
- {{jsxref("Temporal/ZonedDateTime/calendarId", "Temporal.ZonedDateTime.prototype.calendarId")}}
