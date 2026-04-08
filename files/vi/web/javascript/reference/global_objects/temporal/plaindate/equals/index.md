---
title: Temporal.PlainDate.prototype.equals()
short-title: equals()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate/equals
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainDate.equals
sidebar: jsref
---

Phương thức **`equals()`** của các instance {{jsxref("Temporal.PlainDate")}} trả về `true` nếu ngày này tương đương về giá trị với một ngày khác (ở dạng có thể chuyển đổi bởi {{jsxref("Temporal/PlainDate/from", "Temporal.PlainDate.from()")}}), và `false` nếu không. Chúng được so sánh cả về giá trị ngày và lịch của chúng, vì vậy hai ngày từ các lịch khác nhau có thể được coi là bằng nhau bởi {{jsxref("Temporal/PlainDate/compare", "Temporal.PlainDate.compare()")}} nhưng không phải bởi `equals()`.

## Cú pháp

```js-nolint
equals(other)
```

### Tham số

- `other`
  - : Một chuỗi, đối tượng, hoặc instance {{jsxref("Temporal.PlainDate")}} đại diện cho ngày khác cần so sánh. Nó được chuyển đổi thành đối tượng `Temporal.PlainDate` bằng cùng thuật toán như {{jsxref("Temporal/PlainDate/from", "Temporal.PlainDate.from()")}}.

### Giá trị trả về

`true` nếu ngày này bằng `other` cả về giá trị ngày và lịch, `false` nếu không.

## Ví dụ

### Sử dụng equals()

```js
const date1 = Temporal.PlainDate.from("2021-08-01");
const date2 = Temporal.PlainDate.from({ year: 2021, month: 8, day: 1 });
console.log(date1.equals(date2)); // true

const date3 = Temporal.PlainDate.from("2021-08-01[u-ca=japanese]");
console.log(date1.equals(date3)); // false

const date4 = Temporal.PlainDate.from("2021-08-02");
console.log(date1.equals(date4)); // false
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDate")}}
- {{jsxref("Temporal/PlainDate/compare", "Temporal.PlainDate.compare()")}}
