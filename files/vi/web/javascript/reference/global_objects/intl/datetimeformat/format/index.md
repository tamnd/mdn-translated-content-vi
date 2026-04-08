---
title: Intl.DateTimeFormat.prototype.format()
short-title: format()
slug: Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/format
page-type: javascript-instance-method
browser-compat: javascript.builtins.Intl.DateTimeFormat.format
sidebar: jsref
---

Phương thức **`format()`** của các instance {{jsxref("Intl.DateTimeFormat")}} định dạng một ngày theo ngôn ngữ và các tùy chọn định dạng của đối tượng `Intl.DateTimeFormat` này.

{{InteractiveExample("JavaScript Demo: Intl.DateTimeFormat.prototype.format()", "taller")}}

```js interactive-example
const options = {
  weekday: "long",
  year: "numeric",
  month: "long",
  day: "numeric",
};
const date = new Date(2012, 5);

const dateTimeFormat1 = new Intl.DateTimeFormat("sr-RS", options);
console.log(dateTimeFormat1.format(date));
// Expected output: "петак, 1. јун 2012."

const dateTimeFormat2 = new Intl.DateTimeFormat("en-GB", options);
console.log(dateTimeFormat2.format(date));
// Expected output: "Friday, 1 June 2012"

const dateTimeFormat3 = new Intl.DateTimeFormat("en-US", options);
console.log(dateTimeFormat3.format(date));
// Expected output: "Friday, June 1, 2012"
```

## Cú pháp

```js-nolint
format(date)
```

### Tham số

- `date`
  - : Ngày cần định dạng. Có thể là đối tượng {{jsxref("Date")}} hoặc {{jsxref("Temporal.PlainDateTime")}}. Ngoài ra còn có thể là đối tượng {{jsxref("Temporal.PlainTime")}}, {{jsxref("Temporal.PlainDate")}}, {{jsxref("Temporal.PlainYearMonth")}}, hoặc {{jsxref("Temporal.PlainMonthDay")}} nếu đối tượng `DateTimeFormat` được cấu hình để in ít nhất một phần liên quan của ngày.

    > [!NOTE]
    > Một đối tượng {{jsxref("Temporal.ZonedDateTime")}} sẽ luôn ném ra `TypeError`; hãy sử dụng {{jsxref("Temporal/ZonedDateTime/toLocaleString", "Temporal.ZonedDateTime.prototype.toLocaleString()")}} hoặc chuyển đổi nó thành đối tượng {{jsxref("Temporal.PlainDateTime")}}.

    Bỏ qua tham số này dẫn đến việc định dạng ngày hiện tại (do {{jsxref("Date.now()")}} trả về), điều này có thể gây nhầm lẫn, vì vậy nên luôn luôn truyền một ngày một cách rõ ràng.

### Giá trị trả về

Một chuỗi biểu diễn `date` đã cho được định dạng theo ngôn ngữ và các tùy chọn định dạng của đối tượng {{jsxref("Intl.DateTimeFormat")}} này.

> [!NOTE]
> Trong hầu hết trường hợp, định dạng được trả về bởi `format()` là nhất quán. Tuy nhiên, đầu ra có thể thay đổi giữa các triển khai, ngay cả trong cùng một ngôn ngữ — các biến thể đầu ra là theo thiết kế và được cho phép bởi đặc tả. Nó cũng có thể không phải là những gì bạn mong đợi. Ví dụ, chuỗi có thể sử dụng khoảng trắng không ngắt hoặc được bao quanh bởi các ký tự kiểm soát hai chiều. Bạn không nên so sánh kết quả của `format()` với các hằng số được mã cứng.

## Ví dụ

### Sử dụng format

Sử dụng hàm getter `format` để định dạng một ngày duy nhất, ở đây là Serbia:

```js
const options = {
  weekday: "long",
  year: "numeric",
  month: "long",
  day: "numeric",
};
const dateTimeFormat = new Intl.DateTimeFormat("sr-RS", options);
console.log(dateTimeFormat.format(new Date()));
// "недеља, 7. април 2013."
```

### Sử dụng format với map

Sử dụng hàm getter `format` để định dạng tất cả các ngày trong một mảng. Lưu ý rằng hàm này được ràng buộc với {{jsxref("Intl.DateTimeFormat")}} từ đó nó được lấy ra, vì vậy nó có thể được truyền trực tiếp đến {{jsxref("Array.prototype.map()")}}.

```js
const a = [new Date(2012, 8), new Date(2012, 11), new Date(2012, 3)];
const options = { year: "numeric", month: "long" };
const dateTimeFormat = new Intl.DateTimeFormat("pt-BR", options);
const formatted = a.map(dateTimeFormat.format);
console.log(formatted.join("; "));
// "setembro de 2012; dezembro de 2012; abril de 2012"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.DateTimeFormat")}}
