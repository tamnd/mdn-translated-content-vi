---
title: Temporal.PlainDate.prototype.withCalendar()
short-title: withCalendar()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate/withCalendar
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainDate.withCalendar
sidebar: jsref
---

Phương thức **`withCalendar()`** của các instance {{jsxref("Temporal.PlainDate")}} trả về một đối tượng `Temporal.PlainDate` mới đại diện cho ngày này được diễn giải trong hệ thống lịch mới. Vì tất cả các đối tượng `Temporal` được thiết kế để bất biến (immutable), phương thức này về cơ bản hoạt động như setter cho thuộc tính {{jsxref("Temporal/PlainDate/calendarId", "calendarId")}} của ngày.

Để thay thế các thuộc tính thành phần ngày, hãy sử dụng phương thức {{jsxref("Temporal/PlainDate/with", "with()")}} thay thế.

## Cú pháp

```js-nolint
withCalendar(calendar)
```

### Tham số

- `calendar`
  - : Một chuỗi tương ứng với thuộc tính {{jsxref("Temporal/PlainDate/calendarId", "calendarId")}}. Xem [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_calendar_types) để biết danh sách các loại lịch được hỗ trợ phổ biến.

### Giá trị trả về

Một đối tượng `Temporal.PlainDate` mới, đại diện cho ngày được chỉ định bởi `PlainDate` gốc, được diễn giải trong hệ thống lịch mới.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `calendar` không phải là một chuỗi.
- {{jsxref("RangeError")}}
  - : Được ném ra nếu `calendar` không phải là một định danh lịch hợp lệ.

## Ví dụ

### Sử dụng withCalendar()

```js
const date = Temporal.PlainDate.from("2021-07-01");
const newDate = date.withCalendar("islamic-umalqura");
console.log(newDate.toLocaleString("en-US", { calendar: "islamic-umalqura" }));
// 11/21/1442 AH
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDate")}}
- {{jsxref("Temporal/PlainDate/with", "Temporal.PlainDate.prototype.with()")}}
- {{jsxref("Temporal/PlainDate/from", "Temporal.PlainDate.from()")}}
- {{jsxref("Temporal/PlainDate/calendarId", "Temporal.PlainDate.prototype.calendarId")}}
