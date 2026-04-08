---
title: Temporal.ZonedDateTime.compare()
short-title: compare()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/compare
page-type: javascript-static-method
browser-compat: javascript.builtins.Temporal.ZonedDateTime.compare
sidebar: jsref
---

Phương thức tĩnh **`Temporal.ZonedDateTime.compare()`** trả về một số (-1, 0 hoặc 1) cho biết ngày-giờ thứ nhất đến trước, bằng hoặc đến sau ngày-giờ thứ hai. Nó tương đương với việc so sánh {{jsxref("Temporal/ZonedDateTime/epochNanoseconds", "epochNanoseconds")}} của hai ngày-giờ.

## Cú pháp

```js-nolint
Temporal.ZonedDateTime.compare(dateTime1, dateTime2)
```

### Tham số

- `dateTime1`
  - : Một chuỗi, một đối tượng, hoặc một instance {{jsxref("Temporal.ZonedDateTime")}} biểu diễn ngày-giờ thứ nhất để so sánh. Nó được chuyển đổi thành đối tượng `Temporal.ZonedDateTime` bằng cùng thuật toán như {{jsxref("Temporal/ZonedDateTime/from", "Temporal.ZonedDateTime.from()")}}.
- `dateTime2`
  - : Ngày-giờ thứ hai để so sánh, được chuyển đổi thành đối tượng `Temporal.ZonedDateTime` bằng cùng thuật toán như `dateTime1`.

### Giá trị trả về

Trả về `-1` nếu `dateTime1` đến trước `dateTime2`, `0` nếu chúng bằng nhau, và `1` nếu `dateTime1` đến sau `dateTime2`. Chúng được so sánh theo các giá trị instant nền tảng, bỏ qua calendar hoặc múi giờ của chúng.

## Ví dụ

### Sử dụng Temporal.ZonedDateTime.compare()

```js
const dt1 = Temporal.ZonedDateTime.from("2021-08-01T01:00:00[Europe/London]");
const dt2 = Temporal.ZonedDateTime.from("2021-08-02T00:00:00[Europe/London]");
console.log(Temporal.ZonedDateTime.compare(dt1, dt2)); // -1

const dt3 = Temporal.ZonedDateTime.from("2021-08-01T00:00:00[Europe/London]");
console.log(Temporal.ZonedDateTime.compare(dt1, dt3)); // 1
```

### Sắp xếp một mảng các ngày-giờ

Mục đích của hàm `compare()` này là hoạt động như một hàm so sánh để truyền vào {{jsxref("Array.prototype.sort()")}} và các hàm liên quan.

```js
const dateTimes = [
  Temporal.ZonedDateTime.from("2021-08-01T00:00:00[America/New_York]"),
  Temporal.ZonedDateTime.from("2021-08-01T00:00:00[Asia/Hong_Kong]"),
  Temporal.ZonedDateTime.from("2021-08-01T00:00:00[Europe/London]"),
];

dateTimes.sort(Temporal.ZonedDateTime.compare);
console.log(dateTimes.map((d) => d.toString()));
// [ "2021-08-01T00:00:00+08:00[Asia/Hong_Kong]", "2021-08-01T00:00:00+01:00[Europe/London]", "2021-08-01T00:00:00-04:00[America/New_York]" ]
```

Lưu ý rằng chúng được so sánh theo các giá trị instant. Trong trường hợp rất hiếm gặp khi bạn muốn so sánh theo giờ đồng hồ treo tường, hãy chuyển đổi chúng thành `PlainDateTime` trước.

```js
const dateTimes = [
  Temporal.ZonedDateTime.from("2021-08-01T00:00:00[America/New_York]"),
  Temporal.ZonedDateTime.from("2021-08-01T00:00:00[Asia/Hong_Kong]"),
  Temporal.ZonedDateTime.from("2021-08-01T00:00:00[Europe/London]"),
];

dateTimes.sort((a, b) =>
  Temporal.PlainDateTime.compare(a.toPlainDateTime(), b.toPlainDateTime()),
);
console.log(dateTimes.map((d) => d.toString()));
// [ "2021-08-01T00:00:00-04:00[America/New_York]", "2021-08-01T00:00:00+08:00[Asia/Hong_Kong]", "2021-08-01T00:00:00+01:00[Europe/London]" ]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.ZonedDateTime")}}
- {{jsxref("Temporal/ZonedDateTime/equals", "Temporal.ZonedDateTime.prototype.equals()")}}
