---
title: Temporal.PlainTime.prototype.minute
short-title: minute
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainTime/minute
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.PlainTime.minute
sidebar: jsref
---

Thuộc tính truy cập **`minute`** của các thực thể {{jsxref("Temporal.PlainTime")}} trả về một số nguyên từ 0 đến 59 đại diện cho thành phần phút của thời gian này.

Accessor setter của `minute` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Sử dụng phương thức {{jsxref("Temporal/PlainTime/with", "with()")}} để tạo một đối tượng `Temporal.PlainTime` mới với giá trị mong muốn.

## Ví dụ

### Sử dụng minute

```js
const time = Temporal.PlainTime.from("12:34:56");
console.log(time.minute); // 34
```

### Thay đổi minute

```js
const time = Temporal.PlainTime.from("12:34:56");
const newTime = time.with({ minute: 58 });
console.log(newTime.toString()); // 12:58:56
```

Bạn cũng có thể sử dụng {{jsxref("Temporal/PlainTime/add", "add()")}} hoặc {{jsxref("Temporal/PlainTime/subtract", "subtract()")}} để di chuyển một số phút nhất định từ thời gian hiện tại.

```js
const time = Temporal.PlainTime.from("12:34:56");
const newTime = time.add({ minutes: 24 });
console.log(newTime.toString()); // 12:58:56
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
