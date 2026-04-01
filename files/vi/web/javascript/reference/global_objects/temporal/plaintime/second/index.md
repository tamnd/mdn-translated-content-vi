---
title: Temporal.PlainTime.prototype.second
short-title: second
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainTime/second
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.PlainTime.second
sidebar: jsref
---

Thuộc tính truy cập **`second`** của các thực thể {{jsxref("Temporal.PlainTime")}} trả về một số nguyên từ 0 đến 59 đại diện cho thành phần giây của thời gian này.

Accessor setter của `second` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Sử dụng phương thức {{jsxref("Temporal/PlainTime/with", "with()")}} để tạo một đối tượng `Temporal.PlainTime` mới với giá trị mong muốn.

## Ví dụ

### Sử dụng second

```js
const time = Temporal.PlainTime.from("12:34:56");
console.log(time.second); // 56
```

### Thay đổi second

```js
const time = Temporal.PlainTime.from("12:34:56");
const newTime = time.with({ second: 15 });
console.log(newTime.toString()); // 12:34:15
```

Bạn cũng có thể sử dụng {{jsxref("Temporal/PlainTime/add", "add()")}} hoặc {{jsxref("Temporal/PlainTime/subtract", "subtract()")}} để di chuyển một số giây nhất định từ thời gian hiện tại.

```js
const time = Temporal.PlainTime.from("12:34:56");
const newTime = time.subtract({ seconds: 41 });
console.log(newTime.toString()); // 12:34:15
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
- {{jsxref("Temporal/PlainTime/millisecond", "Temporal.PlainTime.prototype.millisecond")}}
- {{jsxref("Temporal/PlainTime/microsecond", "Temporal.PlainTime.prototype.microsecond")}}
- {{jsxref("Temporal/PlainTime/nanosecond", "Temporal.PlainTime.prototype.nanosecond")}}
