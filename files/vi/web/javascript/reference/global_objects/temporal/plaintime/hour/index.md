---
title: Temporal.PlainTime.prototype.hour
short-title: hour
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainTime/hour
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.PlainTime.hour
sidebar: jsref
---

Thuộc tính truy cập **`hour`** của các thực thể {{jsxref("Temporal.PlainTime")}} trả về một số nguyên từ 0 đến 23 đại diện cho thành phần giờ của thời gian này.

Accessor setter của `hour` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Sử dụng phương thức {{jsxref("Temporal/PlainTime/with", "with()")}} để tạo một đối tượng `Temporal.PlainTime` mới với giá trị mong muốn.

## Ví dụ

### Sử dụng hour

```js
const time = Temporal.PlainTime.from("12:34:56");
console.log(time.hour); // 12
```

### Thay đổi hour

```js
const time = Temporal.PlainTime.from("12:34:56");
const newTime = time.with({ hour: 15 });
console.log(newTime.toString()); // 15:34:56
```

Bạn cũng có thể sử dụng {{jsxref("Temporal/PlainTime/add", "add()")}} hoặc {{jsxref("Temporal/PlainTime/subtract", "subtract()")}} để di chuyển một số giờ nhất định từ thời gian hiện tại.

```js
const time = Temporal.PlainTime.from("12:34:56");
const newTime = time.add({ hours: 3 });
console.log(newTime.toString()); // 15:34:56
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
