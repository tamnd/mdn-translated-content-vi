---
title: Intl.DateTimeFormat.prototype.formatRange()
short-title: formatRange()
slug: Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/formatRange
page-type: javascript-instance-method
browser-compat: javascript.builtins.Intl.DateTimeFormat.formatRange
sidebar: jsref
---

Phương thức **`formatRange()`** của các instance {{jsxref("Intl.DateTimeFormat")}} định dạng một khoảng thời gian theo cách ngắn gọn nhất dựa trên ngôn ngữ và các tùy chọn được cung cấp khi khởi tạo đối tượng `Intl.DateTimeFormat` này.

{{InteractiveExample("JavaScript Demo: Intl.DateTimeFormat.prototype.formatRange()", "taller")}}

```js interactive-example
const options1 = {
  weekday: "long",
  year: "numeric",
  month: "long",
  day: "numeric",
};
const options2 = { year: "2-digit", month: "numeric", day: "numeric" };

const startDate = new Date(Date.UTC(2007, 0, 10, 10, 0, 0));
const endDate = new Date(Date.UTC(2008, 0, 10, 11, 0, 0));

const dateTimeFormat = new Intl.DateTimeFormat("en", options1);
console.log(dateTimeFormat.formatRange(startDate, endDate));
// Expected output: "Wednesday, January 10, 2007 – Thursday, January 10, 2008"

const dateTimeFormat2 = new Intl.DateTimeFormat("en", options2);
console.log(dateTimeFormat2.formatRange(startDate, endDate));
// Expected output: "1/10/07 – 1/10/08"
```

## Cú pháp

```js-nolint
formatRange(startDate, endDate)
```

### Tham số

- `startDate`
  - : Ngày bắt đầu của khoảng thời gian. Có thể là đối tượng {{jsxref("Date")}} hoặc {{jsxref("Temporal.PlainDateTime")}}. Ngoài ra còn có thể là đối tượng {{jsxref("Temporal.PlainTime")}}, {{jsxref("Temporal.PlainDate")}}, {{jsxref("Temporal.PlainYearMonth")}}, hoặc {{jsxref("Temporal.PlainMonthDay")}} nếu đối tượng `DateTimeFormat` được cấu hình để in ít nhất một phần liên quan của ngày.
    > [!NOTE]
    > Một đối tượng {{jsxref("Temporal.ZonedDateTime")}} sẽ luôn ném ra `TypeError`; hãy sử dụng {{jsxref("Temporal/ZonedDateTime/toLocaleString", "Temporal.ZonedDateTime.prototype.toLocaleString()")}} hoặc chuyển đổi nó thành đối tượng {{jsxref("Temporal.PlainDateTime")}}.
- `endDate`
  - : Ngày kết thúc của khoảng thời gian. Phải có cùng kiểu với `startDate`.

### Giá trị trả về

Một chuỗi biểu diễn khoảng thời gian đã cho được định dạng theo ngôn ngữ và các tùy chọn định dạng của đối tượng {{jsxref("Intl.DateTimeFormat")}} này. Nếu ngày bắt đầu và kết thúc tương đương ở độ chính xác của đầu ra, đầu ra sẽ chỉ chứa một ngày duy nhất.

## Ví dụ

### Sử dụng cơ bản formatRange

Phương thức này nhận hai đối tượng {{jsxref("Date")}} và định dạng khoảng thời gian theo cách ngắn gọn nhất dựa trên `locale` và `options` được cung cấp khi khởi tạo {{jsxref("Intl.DateTimeFormat")}}.

```js
const date1 = new Date(Date.UTC(1906, 0, 10, 10, 0, 0)); // Wed, 10 Jan 1906 10:00:00 GMT
const date2 = new Date(Date.UTC(1906, 0, 10, 11, 0, 0)); // Wed, 10 Jan 1906 11:00:00 GMT
const date3 = new Date(Date.UTC(1906, 0, 20, 10, 0, 0)); // Sat, 20 Jan 1906 10:00:00 GMT

const fmt1 = new Intl.DateTimeFormat("en", {
  year: "2-digit",
  month: "numeric",
  day: "numeric",
  hour: "numeric",
  minute: "numeric",
});
console.log(fmt1.format(date1)); // '1/10/06, 10:00 AM'
console.log(fmt1.formatRange(date1, date2)); // '1/10/06, 10:00 – 11:00 AM'
console.log(fmt1.formatRange(date1, date3)); // '1/10/06, 10:00 AM – 1/20/07, 10:00 AM'

const fmt2 = new Intl.DateTimeFormat("en", {
  year: "numeric",
  month: "short",
  day: "numeric",
});
console.log(fmt2.format(date1)); // 'Jan 10, 1906'
console.log(fmt2.formatRange(date1, date2)); // 'Jan 10, 1906'
console.log(fmt2.formatRange(date1, date3)); // 'Jan 10 – 20, 1906'
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.DateTimeFormat")}}
