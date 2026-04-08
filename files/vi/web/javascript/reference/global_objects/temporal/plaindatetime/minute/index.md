---
title: Temporal.PlainDateTime.prototype.minute
short-title: minute
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime/minute
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.PlainDateTime.minute
sidebar: jsref
---

Thuộc tính accessor **`minute`** của các instance {{jsxref("Temporal.PlainDateTime")}} trả về một số nguyên từ 0 đến 59 đại diện cho thành phần phút của thời gian này.

Set accessor của `minute` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Sử dụng phương thức {{jsxref("Temporal/PlainDateTime/with", "with()")}} để tạo một đối tượng `Temporal.PlainDateTime` mới với giá trị mới mong muốn.

Để biết thông tin chung và thêm ví dụ, xem {{jsxref("Temporal/PlainTime/minute", "Temporal.PlainTime.prototype.minute")}}.

## Ví dụ

### Sử dụng minute

```js
const dt = Temporal.PlainDateTime.from("2021-07-01T12:34:56.123456789");
console.log(dt.minute); // 34
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
- {{jsxref("Temporal/PlainTime/minute", "Temporal.PlainDateTime.prototype.minute")}}
