---
title: Temporal.PlainDate()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate/PlainDate
page-type: javascript-constructor
status:
  - experimental
browser-compat: javascript.builtins.Temporal.PlainDate.PlainDate
sidebar: jsref
---

{{SeeCompatTable}}

Constructor **`Temporal.PlainDate()`** tạo các đối tượng {{jsxref("Temporal.PlainDate")}}.

Constructor này cho phép bạn tạo các instance bằng cách cung cấp trực tiếp dữ liệu bên dưới. Giống như tất cả các lớp `Temporal` khác, bạn thường nên xây dựng các đối tượng `Temporal.PlainDate` bằng phương thức tĩnh {{jsxref("Temporal/PlainDate/from", "Temporal.PlainDate.from()")}}, có thể xử lý nhiều loại đầu vào.

## Cú pháp

```js-nolint
new Temporal.PlainDate(year, month, day)
new Temporal.PlainDate(year, month, day, calendar)
```

> [!NOTE]
> `Temporal.PlainDate()` chỉ có thể được xây dựng với [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng gọi nó mà không có `new` sẽ ném ra {{jsxref("TypeError")}}.

### Tham số

- `year`
  - : Một số, được cắt bớt thành số nguyên, đại diện cho năm trong hệ thống lịch ISO.
- `month`
  - : Một số, được cắt bớt thành số nguyên, đại diện cho tháng trong hệ thống lịch ISO.
- `day`
  - : Một số, được cắt bớt thành số nguyên, đại diện cho ngày trong tháng trong hệ thống lịch ISO.
- `calendar` {{optional_inline}}
  - : Một chuỗi đại diện cho [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars) cần sử dụng. Xem [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_calendar_types) để biết danh sách các loại lịch thường được hỗ trợ. Mặc định là `"iso8601"`. Lưu ý rằng bất kể `calendar`, `year`, `month` và `day` phải theo hệ thống lịch ISO 8601.

### Giá trị trả về

Một đối tượng `Temporal.PlainDate` mới, đại diện cho ngày được xác định bởi `year`, `month`, `day` (trong lịch ISO), được diễn giải trong hệ thống lịch được chỉ định bởi `calendar`.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Ném ra nếu `calendar` không phải là chuỗi hoặc `undefined`.
- {{jsxref("RangeError")}}
  - : Ném ra trong một trong các trường hợp sau:
    - `year`, `month` hoặc `day` không phải là số hữu hạn.
    - Tổ hợp `year`, `month` và `day` không đại diện cho ngày hợp lệ trong hệ thống lịch ISO, hoặc không nằm trong [phạm vi có thể biểu diễn](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#representable_dates), là ±(10<sup>8</sup> + 1) ngày, tức khoảng ±273.972,6 năm, từ Unix epoch.
    - `calendar` không phải là định danh lịch hợp lệ.

## Ví dụ

### Sử dụng Temporal.PlainDate()

```js
const plainDate = new Temporal.PlainDate(2021, 7, 1);
console.log(plainDate.toString()); // 2021-07-01

// Lưu ý rằng ngày được lưu trữ nội bộ dưới dạng ISO 8601, ngay cả khi nó
// được diễn giải trong hệ thống lịch khác. Ví dụ, mặc dù
// 2021-07-01 ISO là 5781-10-21 trong lịch Hebrew, bạn vẫn truyền
// ngày ISO vào constructor.
const plainDate2 = new Temporal.PlainDate(2021, 7, 1, "hebrew");
console.log(plainDate2.toString()); // 2021-07-01[u-ca=hebrew]
console.log(plainDate2.year); // 5781
console.log(plainDate2.month); // 10
console.log(plainDate2.day); // 21
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDate")}}
- {{jsxref("Temporal/PlainDate/from", "Temporal.PlainDate.from()")}}
