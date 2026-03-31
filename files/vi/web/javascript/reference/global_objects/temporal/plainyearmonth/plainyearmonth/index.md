---
title: Temporal.PlainYearMonth()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainYearMonth/PlainYearMonth
page-type: javascript-constructor
status:
  - experimental
browser-compat: javascript.builtins.Temporal.PlainYearMonth.PlainYearMonth
sidebar: jsref
---

{{SeeCompatTable}}

Constructor **`Temporal.PlainYearMonth()`** tạo các đối tượng {{jsxref("Temporal.PlainYearMonth")}}.

Constructor này cho phép bạn tạo các thực thể bằng cách cung cấp trực tiếp dữ liệu cơ bản. Giống như tất cả các lớp `Temporal` khác, bạn thường nên xây dựng các đối tượng `Temporal.PlainYearMonth` bằng phương thức tĩnh {{jsxref("Temporal/PlainYearMonth/from", "Temporal.PlainYearMonth.from()")}}, có thể xử lý nhiều loại đầu vào khác nhau.

## Cú pháp

```js-nolint
new Temporal.PlainYearMonth(year, month)
new Temporal.PlainYearMonth(year, month, calendar)
new Temporal.PlainYearMonth(year, month, calendar, referenceDay)
```

> [!NOTE]
> `Temporal.PlainYearMonth()` chỉ có thể được khởi tạo với [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng gọi nó mà không có `new` sẽ ném ra một {{jsxref("TypeError")}}.

> [!WARNING]
> Tránh sử dụng các tham số `calendar` và `referenceDay`, vì {{jsxref("Temporal/PlainYearMonth/equals", "equals()")}} và {{jsxref("Temporal/PlainYearMonth/compare", "compare()")}} sẽ xem xét ngày tham chiếu khi so sánh, khiến hai year-month tương đương bị coi là khác nhau nếu chúng có các ngày tham chiếu khác nhau. Để tạo một đối tượng `Temporal.PlainYearMonth` với lịch không phải ISO, hãy dùng phương thức tĩnh {{jsxref("Temporal/PlainYearMonth/from", "Temporal.PlainYearMonth.from()")}}.

### Tham số

- `year` {{optional_inline}}
  - : Một số, được cắt bớt thành số nguyên, đại diện cho năm trong hệ thống lịch ISO.
- `month`
  - : Một số, được cắt bớt thành số nguyên, đại diện cho tháng trong hệ thống lịch ISO.
- `calendar` {{optional_inline}}
  - : Một chuỗi đại diện cho [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars) muốn sử dụng. Xem [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_calendar_types) để biết danh sách các loại lịch thường được hỗ trợ. Mặc định là `"iso8601"`. Lưu ý rằng bất kể `calendar` là gì, `year`, `month` và `referenceDay` phải ở trong hệ thống lịch ISO 8601.
- `referenceDay`
  - : Một số, được cắt bớt thành số nguyên, đại diện cho ngày trong tháng trong hệ thống lịch ISO. Mặc định là `1`. Cùng một ISO year-month có thể đại diện cho các tháng khác nhau vào các ngày khác nhau với các lịch không phải ISO. Ví dụ, các ngày 2021-07-01 và 2021-07-31 có thể thuộc các tháng khác nhau trong một lịch không phải Gregorian, và chỉ chỉ định "2021-07" là không đủ để xác định rõ ràng một tháng trong lịch đích. Do đó, bạn hầu như luôn muốn chỉ định `referenceDay` khi sử dụng lịch không phải ISO.

### Giá trị trả về

Một đối tượng `Temporal.PlainYearMonth` mới, đại diện cho year-month của ngày được chỉ định bởi `year`, `month` và `referenceDay` (trong lịch ISO), được giải thích trong hệ thống lịch được chỉ định bởi `calendar`.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `calendar` không phải là chuỗi hoặc `undefined`.
- {{jsxref("RangeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - `year`, `month` hoặc `referenceDay` không phải là số hữu hạn.
    - Tổ hợp `year`, `month` và `referenceDay` không đại diện cho một ngày hợp lệ trong hệ thống lịch ISO, hoặc không nằm trong [phạm vi có thể biểu diễn](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#representable_dates), là ±(10<sup>8</sup> + 1) ngày, hoặc khoảng ±273.972,6 năm, từ Unix epoch.
    - `calendar` không phải là mã định danh lịch hợp lệ.

## Ví dụ

### Sử dụng Temporal.PlainYearMonth()

```js
const ym = new Temporal.PlainYearMonth(2021, 7);
console.log(ym.toString()); // 2021-07

const ym2 = new Temporal.PlainYearMonth(2021, 7, "chinese");
console.log(ym2.toString()); // 2021-07-01[u-ca=chinese]

const ym3 = new Temporal.PlainYearMonth(2021, 7, "chinese", 31);
console.log(ym3.toString()); // 2021-07-31[u-ca=chinese]
```

### Sử dụng không đúng cách

Bạn nên tránh sử dụng các tham số `calendar` và `referenceDay`, trừ khi bạn biết rằng `referenceDay` là ngày tham chiếu chuẩn sẽ được chọn bởi `Temporal.PlainYearMonth.from()` cho cùng một year-month.

```js
const ym = new Temporal.PlainYearMonth(2021, 7, "chinese", 1);
const ym2 = Temporal.PlainYearMonth.from("2021-07-01[u-ca=chinese]");
console.log(ym.equals(ym2)); // false
console.log(ym.toString()); // 2021-07-01[u-ca=chinese]
console.log(ym2.toString()); // 2021-06-10[u-ca=chinese]
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainYearMonth")}}
- {{jsxref("Temporal/PlainYearMonth/from", "Temporal.PlainYearMonth.from()")}}
