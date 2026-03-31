---
title: Intl.DateTimeFormat.prototype.formatRangeToParts()
short-title: formatRangeToParts()
slug: Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/formatRangeToParts
page-type: javascript-instance-method
browser-compat: javascript.builtins.Intl.DateTimeFormat.formatRangeToParts
sidebar: jsref
---

Phương thức **`formatRangeToParts()`** của các instance {{jsxref("Intl.DateTimeFormat")}} trả về một mảng các đối tượng biểu diễn từng phần của chuỗi được định dạng mà {{jsxref("Intl/DatetimeFormat/formatRange", "formatRange()")}} sẽ trả về. Nó hữu ích để xây dựng các chuỗi tùy chỉnh từ các token đặc thù theo ngôn ngữ.

{{InteractiveExample("JavaScript Demo: Intl.DateTimeFormat.prototype.formatRangeToParts()", "taller")}}

```js interactive-example
const startDate = new Date(Date.UTC(2007, 0, 10, 10, 0, 0)); // > 'Wed, 10 Jan 2007 10:00:00 GMT'
const endDate = new Date(Date.UTC(2007, 0, 10, 11, 0, 0)); // > 'Wed, 10 Jan 2007 11:00:00 GMT'

const dateTimeFormat = new Intl.DateTimeFormat("en", {
  hour: "numeric",
  minute: "numeric",
});

const parts = dateTimeFormat.formatRangeToParts(startDate, endDate);
for (const part of parts) {
  console.log(part);
}
// Expected output (in GMT timezone):
// Object { type: "hour", value: "2", source: "startRange" }
// Object { type: "literal", value: ":", source: "startRange" }
// Object { type: "minute", value: "00", source: "startRange" }
// Object { type: "literal", value: " – ", source: "shared" }
// Object { type: "hour", value: "3", source: "endRange" }
// Object { type: "literal", value: ":", source: "endRange" }
// Object { type: "minute", value: "00", source: "endRange" }
// Object { type: "literal", value: " ", source: "shared" }
// Object { type: "dayPeriod", value: "AM", source: "shared" }
```

## Cú pháp

```js-nolint
formatRangeToParts(startDate, endDate)
```

### Tham số

- `startDate`
  - : Ngày bắt đầu của khoảng thời gian. Có thể là đối tượng {{jsxref("Date")}} hoặc {{jsxref("Temporal.PlainDateTime")}}. Ngoài ra còn có thể là đối tượng {{jsxref("Temporal.PlainTime")}}, {{jsxref("Temporal.PlainDate")}}, {{jsxref("Temporal.PlainYearMonth")}}, hoặc {{jsxref("Temporal.PlainMonthDay")}} nếu đối tượng `DateTimeFormat` được cấu hình để in ít nhất một phần liên quan của ngày.
    > [!NOTE]
    > Một đối tượng {{jsxref("Temporal.ZonedDateTime")}} sẽ luôn ném ra `TypeError`; hãy sử dụng {{jsxref("Temporal/ZonedDateTime/toLocaleString", "Temporal.ZonedDateTime.prototype.toLocaleString()")}} hoặc chuyển đổi nó thành đối tượng {{jsxref("Temporal.PlainDateTime")}}.
- `endDate`
  - : Ngày kết thúc của khoảng thời gian. Phải có cùng kiểu với `startDate`.

### Giá trị trả về

Một {{jsxref("Array")}} các đối tượng chứa khoảng thời gian được định dạng theo từng phần. Mỗi đối tượng có ba thuộc tính, `type`, `value`, và `source`, mỗi thuộc tính chứa một chuỗi. Việc nối chuỗi của `value`, theo thứ tự được cung cấp, sẽ cho ra cùng một chuỗi như {{jsxref("Intl/DateTimeFormat/formatRange", "formatRange()")}}. `type` có thể có các giá trị giống như {{jsxref("Intl/DateTimeFormat/formatToParts", "formatToParts()")}}. `source` có thể là một trong các giá trị sau:

- `startRange`
  - : Token là một phần của ngày bắt đầu.
- `endRange`
  - : Token là một phần của ngày kết thúc.
- `shared`
  - : Token được chia sẻ giữa ngày bắt đầu và kết thúc; ví dụ, nếu ngày bắt đầu và kết thúc có cùng khoảng thời gian trong ngày, token đó có thể được tái sử dụng. Tất cả các ký tự liên kết là một phần của mẫu khoảng, chẳng hạn ký tự phân cách `" – "`, cũng được đánh dấu là `shared`.

Nếu ngày bắt đầu và kết thúc tương đương ở độ chính xác của đầu ra, thì đầu ra có cùng danh sách token như khi gọi {{jsxref("Intl/DateTimeFormat/formatToParts", "formatToParts()")}} trên ngày bắt đầu, với tất cả các token được đánh dấu là `source: "shared"`.

## Ví dụ

### Sử dụng formatRangeToParts()

Phương thức `formatRange()` xuất ra các chuỗi được bản địa hóa và mờ đục, không thể thao tác trực tiếp:

```js
const date1 = new Date(Date.UTC(1906, 0, 10, 10, 0, 0)); // Wed, 10 Jan 1906 10:00:00 GMT
const date2 = new Date(Date.UTC(1906, 0, 10, 11, 0, 0)); // Wed, 10 Jan 1906 11:00:00 GMT

const fmt = new Intl.DateTimeFormat("en", {
  hour: "numeric",
  minute: "numeric",
});

console.log(fmt.formatRange(date1, date2)); // '10:00 – 11:00 AM'
```

Tuy nhiên, trong nhiều giao diện người dùng bạn có thể muốn tùy chỉnh định dạng của chuỗi này, hoặc xen kẽ nó với các văn bản khác. Phương thức `formatRangeToParts()` tạo ra cùng thông tin theo từng phần:

```js
console.log(fmt.formatRangeToParts(date1, date2));

// return value:
[
  { type: "hour", value: "10", source: "startRange" },
  { type: "literal", value: ":", source: "startRange" },
  { type: "minute", value: "00", source: "startRange" },
  { type: "literal", value: " – ", source: "shared" },
  { type: "hour", value: "11", source: "endRange" },
  { type: "literal", value: ":", source: "endRange" },
  { type: "minute", value: "00", source: "endRange" },
  { type: "literal", value: " ", source: "shared" },
  { type: "dayPeriod", value: "AM", source: "shared" },
];
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.DateTimeFormat")}}
- {{jsxref("Intl/DateTimeFormat/formatRange", "Intl.DateTimeFormat.prototype.formatRange()")}}
