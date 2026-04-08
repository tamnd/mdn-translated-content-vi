---
title: Temporal.PlainTime.prototype.equals()
short-title: equals()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainTime/equals
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainTime.equals
sidebar: jsref
---

Phương thức **`equals()`** của các thực thể {{jsxref("Temporal.PlainTime")}} trả về `true` nếu thời gian này có giá trị tương đương với một thời gian khác (dưới dạng có thể chuyển đổi bởi {{jsxref("Temporal/PlainTime/from", "Temporal.PlainTime.from()")}}), ngược lại là `false`. Chúng được so sánh theo giá trị thời gian. Nó tương đương với `Temporal.PlainTime.compare(this, other) === 0`.

## Cú pháp

```js-nolint
equals(other)
```

### Tham số

- `other`
  - : Một chuỗi, một đối tượng, hoặc một thực thể {{jsxref("Temporal.PlainTime")}} đại diện cho thời gian khác cần so sánh. Nó được chuyển đổi thành đối tượng `Temporal.PlainTime` bằng cùng thuật toán như {{jsxref("Temporal/PlainTime/from", "Temporal.PlainTime.from()")}}.

### Giá trị trả về

`true` nếu thời gian này bằng `other` cả về giá trị thời gian lẫn lịch, `false` nếu không.

## Ví dụ

### Sử dụng equals()

```js
const time1 = Temporal.PlainTime.from("12:34:56");
const time2 = Temporal.PlainTime.from({ hour: 12, minute: 34, second: 56 });
console.log(time1.equals(time2)); // true

const time3 = Temporal.PlainTime.from("00:34:56");
console.log(time1.equals(time3)); // false
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainTime")}}
- {{jsxref("Temporal/PlainTime/compare", "Temporal.PlainTime.compare()")}}
