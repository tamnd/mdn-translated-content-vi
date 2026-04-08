---
title: Temporal.PlainMonthDay()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainMonthDay/PlainMonthDay
page-type: javascript-constructor
status:
  - experimental
browser-compat: javascript.builtins.Temporal.PlainMonthDay.PlainMonthDay
sidebar: jsref
---

{{SeeCompatTable}}

Constructor **`Temporal.PlainMonthDay()`** tạo các đối tượng {{jsxref("Temporal.PlainMonthDay")}}.

Constructor này cho phép bạn tạo các instance bằng cách cung cấp trực tiếp dữ liệu bên dưới. Giống như tất cả các lớp `Temporal` khác, bạn thường nên tạo các đối tượng `Temporal.PlainMonthDay` bằng phương thức tĩnh {{jsxref("Temporal/PlainMonthDay/from", "Temporal.PlainMonthDay.from()")}}, có thể xử lý nhiều loại đầu vào khác nhau.

## Cú pháp

```js-nolint
new Temporal.PlainMonthDay(month, day)
new Temporal.PlainMonthDay(month, day, calendar)
new Temporal.PlainMonthDay(month, day, calendar, referenceYear)
```

> [!NOTE]
> `Temporal.PlainMonthDay()` chỉ có thể được khởi tạo với [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng gọi nó mà không có `new` sẽ ném ra {{jsxref("TypeError")}}.

> [!WARNING]
> Tránh sử dụng các tham số `calendar` và `referenceYear`, vì {{jsxref("Temporal/PlainMonthDay/equals", "equals()")}} sẽ xem xét năm tham chiếu để so sánh bằng nhau, khiến hai tháng-ngày tương đương bị coi là khác nhau nếu chúng có năm tham chiếu khác nhau. Để tạo đối tượng `Temporal.PlainMonthDay` với lịch không phải ISO, hãy sử dụng phương thức tĩnh {{jsxref("Temporal/PlainMonthDay/from", "Temporal.PlainMonthDay.from()")}}.

### Tham số

- `month`
  - : Một số, được cắt bớt thành số nguyên, đại diện cho tháng trong hệ thống lịch ISO.
- `day`
  - : Một số, được cắt bớt thành số nguyên, đại diện cho ngày trong tháng trong hệ thống lịch ISO.
- `calendar` {{optional_inline}}
  - : Một chuỗi đại diện cho [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars) sẽ sử dụng. Xem [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_calendar_types) để biết danh sách các loại lịch thường được hỗ trợ. Mặc định là `"iso8601"`. Lưu ý rằng bất kể `calendar`, các giá trị `referenceYear`, `month` và `day` phải thuộc hệ thống lịch ISO 8601.
- `referenceYear` {{optional_inline}}
  - : Một số, được cắt bớt thành số nguyên, đại diện cho năm trong hệ thống lịch ISO. Mặc định là `1972`. Cùng tháng-ngày ISO có thể đại diện cho các ngày khác nhau trong các năm khác nhau với các lịch không phải ISO. Ví dụ, ngày 2021-07-01 và 1972-07-01 có thể rơi vào tháng-ngày khác nhau trong lịch không phải Gregorian, và chỉ chỉ định "07-01" là không đủ để xác định rõ ràng một tháng-ngày trong lịch đích. Do đó, bạn hầu như luôn muốn chỉ định `referenceYear` khi sử dụng lịch không phải ISO.

### Giá trị trả về

Một đối tượng `Temporal.PlainMonthDay` mới, đại diện cho tháng-ngày của ngày được chỉ định bởi `referenceYear`, `month`, `day` (trong lịch ISO), được diễn giải trong hệ thống lịch được chỉ định bởi `calendar`.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném nếu `calendar` không phải là chuỗi hay `undefined`.
- {{jsxref("RangeError")}}
  - : Được ném trong một trong các trường hợp sau:
    - `referenceYear`, `month` hoặc `day` không phải là số hữu hạn.
    - Tổ hợp `referenceYear`, `month` và `day` không đại diện cho một ngày hợp lệ trong hệ thống lịch ISO, hoặc không nằm trong [phạm vi có thể biểu diễn](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#representable_dates), là ±(10<sup>8</sup> + 1) ngày, hay khoảng ±273.972,6 năm, từ Unix epoch.
    - `calendar` không phải là định danh lịch hợp lệ.

## Ví dụ

### Sử dụng Temporal.PlainMonthDay()

```js
const md = new Temporal.PlainMonthDay(7, 1);
console.log(md.toString()); // 07-01

const md2 = new Temporal.PlainMonthDay(7, 1, "chinese");
console.log(md2.toString()); // 1972-07-01[u-ca=chinese]

const md3 = new Temporal.PlainMonthDay(7, 1, "chinese", 2021);
console.log(md3.toString()); // 2021-07-01[u-ca=chinese]
```

### Sử dụng không đúng cách

Bạn nên tránh sử dụng các tham số `calendar` và `referenceYear`, trừ khi bạn biết rằng `referenceYear` là năm tham chiếu chuẩn sẽ được chọn bởi `Temporal.PlainMonthDay.from()` cho cùng tháng-ngày.

```js
const md = new Temporal.PlainMonthDay(7, 1, "chinese", 2021);
const md2 = Temporal.PlainMonthDay.from("2021-07-01[u-ca=chinese]");
console.log(md.equals(md2)); // false
console.log(md.toString()); // 2021-07-01[u-ca=chinese]
console.log(md2.toString()); // 1972-07-02[u-ca=chinese]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainMonthDay")}}
- {{jsxref("Temporal/PlainMonthDay/from", "Temporal.PlainMonthDay.from()")}}
