---
title: Temporal.Duration.prototype.abs()
short-title: abs()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Duration/abs
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.Duration.abs
sidebar: jsref
---

Phương thức **`abs()`** của các instance {{jsxref("Temporal.Duration")}} trả về một đối tượng `Temporal.Duration` mới với giá trị tuyệt đối của duration này (tất cả các trường có cùng độ lớn, nhưng dấu trở thành dương).

## Cú pháp

```js-nolint
abs()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng `Temporal.Duration` mới với giá trị tuyệt đối của duration này, có thể giống với duration này nếu nó đã là dương, hoặc là [phủ định](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration/negated) của nó nếu âm.

## Ví dụ

### Sử dụng abs()

```js
const d1 = Temporal.Duration.from({ hours: 1, minutes: 30 });
const d2 = Temporal.Duration.from({ hours: -1, minutes: -30 });

console.log(d1.abs().toString()); // "PT1H30M"
console.log(d2.abs().toString()); // "PT1H30M"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/Duration/negated", "Temporal.Duration.prototype.negated()")}}
- {{jsxref("Temporal/Duration/sign", "Temporal.Duration.prototype.sign")}}
