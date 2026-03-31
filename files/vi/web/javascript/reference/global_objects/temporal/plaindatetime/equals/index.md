---
title: Temporal.PlainDateTime.prototype.equals()
short-title: equals()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime/equals
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainDateTime.equals
sidebar: jsref
---

Phương thức **`equals()`** của các instance {{jsxref("Temporal.PlainDateTime")}} trả về `true` nếu ngày-giờ này tương đương về giá trị với một ngày-giờ khác (theo dạng có thể chuyển đổi bởi {{jsxref("Temporal/PlainDate/from", "Temporal.PlainDateTime.from()")}}), và `false` nếu không. Chúng được so sánh cả theo giá trị ngày giờ lẫn lịch, vì vậy hai ngày-giờ từ các lịch khác nhau có thể được coi là bằng nhau bởi {{jsxref("Temporal/PlainDateTime/compare", "Temporal.PlainDateTime.compare()")}} nhưng không phải bởi `equals()`.

## Cú pháp

```js-nolint
equals(other)
```

### Tham số

- `other`
  - : Một chuỗi, một đối tượng, hoặc một instance {{jsxref("Temporal.PlainDateTime")}} đại diện cho ngày-giờ khác cần so sánh. Nó được chuyển đổi thành đối tượng `Temporal.PlainDateTime` sử dụng cùng thuật toán như {{jsxref("Temporal/PlainDateTime/from", "Temporal.PlainDateTime.from()")}}.

### Giá trị trả về

`true` nếu ngày-giờ này bằng `other` cả về giá trị ngày/giờ lẫn lịch, `false` nếu không.

## Ví dụ

### Sử dụng equals()

```js
const dt1 = Temporal.PlainDateTime.from("2021-08-01");
const dt2 = Temporal.PlainDateTime.from({ year: 2021, month: 8, day: 1 });
console.log(dt1.equals(dt2)); // true

const dt3 = Temporal.PlainDateTime.from("2021-08-01[u-ca=japanese]");
console.log(dt1.equals(dt3)); // false

const dt4 = Temporal.PlainDateTime.from("2021-08-01T01:00:00");
console.log(dt1.equals(dt4)); // false
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDateTime")}}
- {{jsxref("Temporal/PlainDateTime/compare", "Temporal.PlainDateTime.compare()")}}
