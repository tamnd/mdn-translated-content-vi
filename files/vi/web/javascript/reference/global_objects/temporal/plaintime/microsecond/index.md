---
title: Temporal.PlainTime.prototype.microsecond
short-title: microsecond
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainTime/microsecond
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.PlainTime.microsecond
sidebar: jsref
---

Thuộc tính truy cập **`microsecond`** của các thực thể {{jsxref("Temporal.PlainTime")}} trả về một số nguyên từ 0 đến 999 đại diện cho thành phần micro-giây (10<sup>-6</sup> giây) của thời gian này.

Accessor setter của `microsecond` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Sử dụng phương thức {{jsxref("Temporal/PlainTime/with", "with()")}} để tạo một đối tượng `Temporal.PlainTime` mới với giá trị mong muốn.

## Ví dụ

### Sử dụng microsecond

```js
const time = Temporal.PlainTime.from("12:34:56");
console.log(time.microsecond); // 0

const time2 = Temporal.PlainTime.from("12:34:56.123456789");
console.log(time2.microsecond); // 456
```

### Thay đổi microsecond

```js
const time = Temporal.PlainTime.from("12:34:56");
const newTime = time.with({ microsecond: 100 });
console.log(newTime.toString()); // 12:34:56.0001
```

Bạn cũng có thể sử dụng {{jsxref("Temporal/PlainTime/add", "add()")}} hoặc {{jsxref("Temporal/PlainTime/subtract", "subtract()")}} để di chuyển một số micro-giây nhất định từ thời gian hiện tại.

```js
const time = Temporal.PlainTime.from("12:34:56");
const newTime = time.add({ microseconds: 100 });
console.log(newTime.toString()); // 12:34:56.0001
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainTime")}}
- {{jsxref("Temporal/PlainTime/with", "Temporal.PlainTime.prototype.with()")}}
- {{jsxref("Temporal/PlainTime/add", "Temporal.PlainTime.prototype.add()")}}
- {{jsxref("Temporal/PlainTime/subtract", "Temporal.PlainTime.prototype.subtract()")}}
- {{jsxref("Temporal/PlainTime/second", "Temporal.PlainTime.prototype.second")}}
- {{jsxref("Temporal/PlainTime/millisecond", "Temporal.PlainTime.prototype.millisecond")}}
- {{jsxref("Temporal/PlainTime/nanosecond", "Temporal.PlainTime.prototype.nanosecond")}}
