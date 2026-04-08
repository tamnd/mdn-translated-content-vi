---
title: Temporal.PlainDateTime.prototype.withCalendar()
short-title: withCalendar()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime/withCalendar
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainDateTime.withCalendar
sidebar: jsref
---

Phương thức **`withCalendar()`** của các instance {{jsxref("Temporal.PlainDateTime")}} trả về một đối tượng `Temporal.PlainDateTime` mới đại diện cho ngày-giờ này được diễn giải trong hệ thống lịch mới. Vì tất cả các đối tượng `Temporal` được thiết kế là bất biến (immutable), phương thức này về cơ bản hoạt động như setter cho thuộc tính {{jsxref("Temporal/PlainDateTime/calendarId", "calendarId")}} của ngày-giờ.

Để thay thế các thuộc tính thành phần ngày-giờ, hãy dùng phương thức {{jsxref("Temporal/PlainDateTime/with", "with()")}} thay thế.

## Cú pháp

```js-nolint
withCalendar(calendar)
```

### Tham số

- `calendar`
  - : Một chuỗi tương ứng với thuộc tính {{jsxref("Temporal/PlainDateTime/calendarId", "calendarId")}}. Xem [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_calendar_types) để biết danh sách các loại lịch thường được hỗ trợ.

### Giá trị trả về

Một đối tượng `Temporal.PlainDateTime` mới, đại diện cho ngày-giờ được chỉ định bởi `PlainDateTime` gốc, được diễn giải trong hệ thống lịch mới.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `calendar` không phải là chuỗi.
- {{jsxref("RangeError")}}
  - : Được ném ra nếu `calendar` không phải là định danh lịch hợp lệ.

## Ví dụ

### Sử dụng withCalendar()

```js
const dt = Temporal.PlainDateTime.from("2021-07-01T12:34:56");
const newDT = dt.withCalendar("islamic-umalqura");
console.log(newDT.toLocaleString("en-US", { calendar: "islamic-umalqura" }));
// 11/21/1442 AH, 12:34:56 PM
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDateTime")}}
- {{jsxref("Temporal/PlainDateTime/with", "Temporal.PlainDateTime.prototype.with()")}}
- {{jsxref("Temporal/PlainDateTime/withPlainTime", "Temporal.PlainDateTime.prototype.withPlainTime()")}}
- {{jsxref("Temporal/PlainDateTime/from", "Temporal.PlainDateTime.from()")}}
- {{jsxref("Temporal/PlainDateTime/calendarId", "Temporal.PlainDateTime.prototype.calendarId")}}
