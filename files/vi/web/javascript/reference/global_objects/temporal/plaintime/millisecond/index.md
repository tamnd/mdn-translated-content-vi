---
title: Temporal.PlainTime.prototype.millisecond
short-title: millisecond
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainTime/millisecond
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.PlainTime.millisecond
sidebar: jsref
---

Thuộc tính truy cập **`millisecond`** của các thực thể {{jsxref("Temporal.PlainTime")}} trả về một số nguyên từ 0 đến 999 đại diện cho thành phần mili-giây (10<sup>-3</sup> giây) của thời gian này.

Accessor setter của `millisecond` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Sử dụng phương thức {{jsxref("Temporal/PlainTime/with", "with()")}} để tạo một đối tượng `Temporal.PlainTime` mới với giá trị mong muốn.

## Ví dụ

### Sử dụng millisecond

```js
const time = Temporal.PlainTime.from("12:34:56");
console.log(time.millisecond); // 0

const time2 = Temporal.PlainTime.from("12:34:56.123456789");
console.log(time2.millisecond); // 123
```

### Thay đổi millisecond

```js
const time = Temporal.PlainTime.from("12:34:56");
const newTime = time.with({ millisecond: 100 });
console.log(newTime.toString()); // 12:34:56.1
```

Bạn cũng có thể sử dụng {{jsxref("Temporal/PlainTime/add", "add()")}} hoặc {{jsxref("Temporal/PlainTime/subtract", "subtract()")}} để di chuyển một số mili-giây nhất định từ thời gian hiện tại.

```js
const time = Temporal.PlainTime.from("12:34:56");
const newTime = time.add({ milliseconds: 100 });
console.log(newTime.toString()); // 12:34:56.1
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
- {{jsxref("Temporal/PlainTime/microsecond", "Temporal.PlainTime.prototype.microsecond")}}
- {{jsxref("Temporal/PlainTime/nanosecond", "Temporal.PlainTime.prototype.nanosecond")}}
