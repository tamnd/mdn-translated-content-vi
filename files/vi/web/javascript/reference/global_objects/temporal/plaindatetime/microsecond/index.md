---
title: Temporal.PlainDateTime.prototype.microsecond
short-title: microsecond
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime/microsecond
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.PlainDateTime.microsecond
sidebar: jsref
---

Thuộc tính accessor **`microsecond`** của các instance {{jsxref("Temporal.PlainDateTime")}} trả về một số nguyên từ 0 đến 999 đại diện cho thành phần micro giây (10<sup>-6</sup> giây) của thời gian này.

Set accessor của `microsecond` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Sử dụng phương thức {{jsxref("Temporal/PlainDateTime/with", "with()")}} để tạo một đối tượng `Temporal.PlainDateTime` mới với giá trị mới mong muốn.

Để biết thông tin chung và thêm ví dụ, xem {{jsxref("Temporal/PlainTime/microsecond", "Temporal.PlainTime.prototype.microsecond")}}.

## Ví dụ

### Sử dụng microsecond

```js
const dt = Temporal.PlainDateTime.from("2021-07-01T12:34:56.123456789");
console.log(dt.microsecond); // 456
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDateTime")}}
- {{jsxref("Temporal/PlainDateTime/with", "Temporal.PlainDateTime.prototype.with()")}}
- {{jsxref("Temporal/PlainDateTime/add", "Temporal.PlainDateTime.prototype.add()")}}
- {{jsxref("Temporal/PlainDateTime/subtract", "Temporal.PlainDateTime.prototype.subtract()")}}
- {{jsxref("Temporal/PlainDateTime/second", "Temporal.PlainDateTime.prototype.second")}}
- {{jsxref("Temporal/PlainDateTime/millisecond", "Temporal.PlainDateTime.prototype.millisecond")}}
- {{jsxref("Temporal/PlainDateTime/nanosecond", "Temporal.PlainDateTime.prototype.nanosecond")}}
- {{jsxref("Temporal/PlainTime/microsecond", "Temporal.PlainTime.prototype.microsecond")}}
