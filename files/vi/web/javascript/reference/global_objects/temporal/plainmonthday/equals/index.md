---
title: Temporal.PlainMonthDay.prototype.equals()
short-title: equals()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainMonthDay/equals
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainMonthDay.equals
sidebar: jsref
---

Phương thức **`equals()`** của các instance {{jsxref("Temporal.PlainMonthDay")}} trả về `true` nếu tháng-ngày này tương đương về giá trị với một tháng-ngày khác (ở dạng có thể chuyển đổi bởi {{jsxref("Temporal/PlainMonthDay/from", "Temporal.PlainMonthDay.from()")}}), và `false` nếu không. Chúng được so sánh cả về giá trị ngày ISO bên dưới và lịch của chúng.

> [!NOTE]
> Các đối tượng `PlainMonthDay` lưu trữ một năm ISO tham chiếu, cũng được dùng trong phép so sánh. Năm này được tự động đặt khi sử dụng phương thức {{jsxref("Temporal/PlainMonthDay/from", "Temporal.PlainMonthDay.from()")}}, nhưng có thể được đặt thủ công bằng constructor {{jsxref("Temporal/PlainMonthDay/PlainMonthDay", "Temporal.PlainMonthDay()")}}, khiến hai tháng-ngày tương đương bị coi là khác nhau nếu chúng có năm tham chiếu khác nhau. Vì lý do này, bạn nên tránh sử dụng constructor trực tiếp và ưu tiên phương thức `from()`.

## Cú pháp

```js-nolint
equals(other)
```

### Tham số

- `other`
  - : Một chuỗi, một đối tượng, hoặc một instance {{jsxref("Temporal.PlainMonthDay")}} đại diện cho tháng-ngày khác để so sánh. Nó được chuyển đổi sang đối tượng `Temporal.PlainMonthDay` bằng cùng thuật toán như {{jsxref("Temporal/PlainMonthDay/from", "Temporal.PlainMonthDay.from()")}}.

### Giá trị trả về

`true` nếu tháng-ngày này bằng `other` cả về giá trị ngày và lịch, `false` nếu không.

## Ví dụ

### Sử dụng equals()

```js
const md1 = Temporal.PlainMonthDay.from("2021-08-01");
const md2 = Temporal.PlainMonthDay.from({ year: 2020, month: 8, day: 1 }); // Year doesn't matter
console.log(md1.equals(md2)); // true

const md3 = Temporal.PlainMonthDay.from("2021-08-01[u-ca=japanese]");
console.log(md1.equals(md3)); // false

const md4 = Temporal.PlainMonthDay.from("2021-08-02");
console.log(md1.equals(md4)); // false
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainMonthDay")}}
