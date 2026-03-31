---
title: Temporal.PlainDateTime.prototype.hour
short-title: hour
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime/hour
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.PlainDateTime.hour
sidebar: jsref
---

Thuộc tính accessor **`hour`** của các instance {{jsxref("Temporal.PlainDateTime")}} trả về một số nguyên từ 0 đến 23 đại diện cho thành phần giờ của thời gian này.

Set accessor của `hour` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Sử dụng phương thức {{jsxref("Temporal/PlainDateTime/with", "with()")}} để tạo một đối tượng `Temporal.PlainDateTime` mới với giá trị mới mong muốn.

Để biết thông tin chung và thêm ví dụ, xem {{jsxref("Temporal/PlainTime/hour", "Temporal.PlainTime.prototype.hour")}}.

## Ví dụ

### Sử dụng hour

```js
const dt = Temporal.PlainDateTime.from("2021-07-01T12:34:56.123456789");
console.log(dt.hour); // 12
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
- {{jsxref("Temporal/PlainTime/hour", "Temporal.PlainTime.prototype.hour")}}
