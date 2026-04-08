---
title: Temporal.PlainDateTime.prototype.toPlainTime()
short-title: toPlainTime()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime/toPlainTime
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainDateTime.toPlainTime
sidebar: jsref
---

Phương thức **`toPlainTime()`** của các instance {{jsxref("Temporal.PlainDateTime")}} trả về một đối tượng {{jsxref("Temporal.PlainTime")}} mới đại diện cho phần thời gian (giờ, phút, giây và các thành phần dưới giây) của ngày-giờ này.

## Cú pháp

```js-nolint
toPlainTime()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng `Temporal.PlainTime` mới đại diện cho phần thời gian (giờ, phút, giây và các thành phần dưới giây) của ngày-giờ này.

## Ví dụ

### Sử dụng toPlainTime()

```js
const dt = Temporal.PlainDateTime.from("2021-07-01T12:34:56");
const time = dt.toPlainTime();
console.log(time.toString()); // '12:34:56'
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDateTime")}}
- {{jsxref("Temporal.PlainTime")}}
- {{jsxref("Temporal/PlainDateTime/toPlainDate", "Temporal.PlainDateTime.prototype.toPlainDate()")}}
- {{jsxref("Temporal/PlainDateTime/toZonedDateTime", "Temporal.PlainDateTime.prototype.toZonedDateTime()")}}
