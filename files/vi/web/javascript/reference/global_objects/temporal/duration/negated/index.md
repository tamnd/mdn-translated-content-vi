---
title: Temporal.Duration.prototype.negated()
short-title: negated()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Duration/negated
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.Duration.negated
sidebar: jsref
---

Phương thức **`negated()`** của các instance {{jsxref("Temporal.Duration")}} trả về một đối tượng `Temporal.Duration` mới với giá trị phủ định của duration này (tất cả các trường giữ nguyên độ lớn, nhưng dấu bị đảo ngược).

## Cú pháp

```js-nolint
negated()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng `Temporal.Duration` mới, trong đó tất cả các trường có cùng độ lớn với duration này, nhưng dấu bị đảo ngược (các trường dương trở thành âm và ngược lại).

## Ví dụ

### Sử dụng negated()

```js
const d1 = Temporal.Duration.from({ hours: 1, minutes: 30 });
const d2 = Temporal.Duration.from({ hours: -1, minutes: -30 });

console.log(d1.negated().toString()); // "-PT1H30M"
console.log(d2.negated().toString()); // "PT1H30M"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/Duration/abs", "Temporal.Duration.prototype.abs()")}}
- {{jsxref("Temporal/Duration/sign", "Temporal.Duration.prototype.sign")}}
